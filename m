Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3602839FDFE
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Jun 2021 19:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22546E5C0;
	Tue,  8 Jun 2021 17:43:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008846E566;
 Tue,  8 Jun 2021 17:43:28 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id B04F9C800EB;
 Tue,  8 Jun 2021 19:43:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id EYjkDm9Gv9AF; Tue,  8 Jun 2021 19:43:27 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300E37f4F60006a44b0068bFE089d.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f4f:6000:6a44:b006:8bfe:89d])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 4D8A7C800C1;
 Tue,  8 Jun 2021 19:43:27 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/i915/display: Add handling for new "active bpc"
 property
Date: Tue,  8 Jun 2021 19:43:17 +0200
Message-Id: <20210608174320.37429-5-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608174320.37429-1-wse@tuxedocomputers.com>
References: <20210608174320.37429-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Werner Sembach <wse@tuxedocomputers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This commits implements the "active bpc" drm property for the Intel GPU driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c      |  8 ++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c  |  4 +++-
 drivers/gpu/drm/i915/display/intel_hdmi.c    |  4 +++-
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 64e9107d70f7..50c11b8770a7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10388,6 +10388,9 @@ static int intel_atomic_commit(struct drm_device *dev,
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(_state);
 	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
 	int ret = 0;
 
 	state->wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
@@ -10456,6 +10459,17 @@ static int intel_atomic_commit(struct drm_device *dev,
 	intel_shared_dpll_swap_state(state);
 	intel_atomic_track_fbs(state);
 
+	/* Extract information from crtc to communicate it to userspace as connector properties */
+	for_each_new_connector_in_state(&state->base, connector, new_conn_state, i) {
+		struct intel_crtc *crtc = to_intel_crtc(new_conn_state->crtc);
+		if (crtc) {
+			struct intel_crtc_state *new_crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
+			new_conn_state->active_bpc = new_crtc_state->pipe_bpp / 3;
+		}
+		else
+			new_conn_state->active_bpc = 0;
+	}
+
 	drm_atomic_state_get(&state->base);
 	INIT_WORK(&state->base.commit_work, intel_atomic_commit_work);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 642c60f3d9b1..67826ba976ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4671,10 +4671,14 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 		intel_attach_force_audio_property(connector);
 
 	intel_attach_broadcast_rgb_property(connector);
-	if (HAS_GMCH(dev_priv))
+	if (HAS_GMCH(dev_priv)) {
 		drm_connector_attach_max_bpc_property(connector, 6, 10);
-	else if (DISPLAY_VER(dev_priv) >= 5)
+		drm_connector_attach_active_bpc_property(connector, 6, 10);
+	}
+	else if (DISPLAY_VER(dev_priv) >= 5) {
 		drm_connector_attach_max_bpc_property(connector, 6, 12);
+		drm_connector_attach_active_bpc_property(connector, 6, 12);
+	}
 
 	/* Register HDMI colorspace for case of lspcon */
 	if (intel_bios_is_lspcon_present(dev_priv, port)) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 2daa3f67791e..5a1869dc2210 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -844,8 +844,10 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	 */
 	connector->max_bpc_property =
 		intel_dp->attached_connector->base.max_bpc_property;
-	if (connector->max_bpc_property)
+	if (connector->max_bpc_property) {
 		drm_connector_attach_max_bpc_property(connector, 6, 12);
+		drm_connector_attach_active_bpc_property(connector, 6, 12);
+	}
 
 	return connector;
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index d69f0a6dc26d..8af78b27b6ce 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2463,8 +2463,10 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 		drm_object_attach_property(&connector->base,
 			connector->dev->mode_config.hdr_output_metadata_property, 0);
 
-	if (!HAS_GMCH(dev_priv))
+	if (!HAS_GMCH(dev_priv)) {
 		drm_connector_attach_max_bpc_property(connector, 8, 12);
+		drm_connector_attach_active_bpc_property(connector, 8, 12);
+	}
 }
 
 /*
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

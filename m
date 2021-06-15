Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B73A8243
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Jun 2021 16:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F268C6E3F2;
	Tue, 15 Jun 2021 14:14:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3B96E34B;
 Tue, 15 Jun 2021 14:14:38 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id A1640C800B3;
 Tue, 15 Jun 2021 16:14:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id S3V8gBwy4bRj; Tue, 15 Jun 2021 16:14:37 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F3949009F7CF2Abd5Da2787.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:9f7c:f2ab:d5da:2787])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 3F6E4C800A1;
 Tue, 15 Jun 2021 16:14:37 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 07/14] drm/amd/display: Add handling for new "active color
 format" property
Date: Tue, 15 Jun 2021 16:14:18 +0200
Message-Id: <20210615141426.6001-8-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615141426.6001-1-wse@tuxedocomputers.com>
References: <20210615141426.6001-1-wse@tuxedocomputers.com>
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

This commit implements the "active color format" drm property for the AMD GPU
driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++++--
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  4 +++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f31bbcb11f03..b66336a1403e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6715,6 +6715,23 @@ static int convert_dc_color_depth_into_bpc (enum dc_color_depth display_color_de
 	return 0;
 }
 
+static int convert_dc_pixel_encoding_into_drm_color_format(enum dc_pixel_encoding display_pixel_encoding)
+{
+	switch (display_pixel_encoding) {
+		case PIXEL_ENCODING_RGB:
+			return DRM_COLOR_FORMAT_RGB444;
+		case PIXEL_ENCODING_YCBCR422:
+			return DRM_COLOR_FORMAT_YCRCB422;
+		case PIXEL_ENCODING_YCBCR444:
+			return DRM_COLOR_FORMAT_YCRCB444;
+		case PIXEL_ENCODING_YCBCR420:
+			return DRM_COLOR_FORMAT_YCRCB420;
+		default:
+			break;
+		}
+	return 0;
+}
+
 static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 					  struct drm_crtc_state *crtc_state,
 					  struct drm_connector_state *conn_state)
@@ -7716,6 +7733,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	if (!aconnector->mst_port) {
 		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
 		drm_connector_attach_active_bpc_property(&aconnector->base, 8, 16);
+		drm_connector_attach_active_color_format_property(&aconnector->base);
 	}
 
 	/* This defaults to the max in the range, but we want 8bpc for non-edp. */
@@ -9091,13 +9109,19 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		if (crtc) {
 			new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 			dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
-			if (dm_new_crtc_state->stream)
+			if (dm_new_crtc_state->stream) {
 				drm_connector_set_active_bpc_property(connector,
 					convert_dc_color_depth_into_bpc(
 					dm_new_crtc_state->stream->timing.display_color_depth));
+				drm_connector_set_active_color_format_property(connector,
+					convert_dc_pixel_encoding_into_drm_color_format(
+					dm_new_crtc_state->stream->timing.pixel_encoding));
+			}
 		}
-		else
+		else {
 			drm_connector_set_active_bpc_property(connector, 0);
+			drm_connector_set_active_color_format_property(connector, 0);
+		}
 	}
 
 	/* Count number of newly disabled CRTCs for dropping PM refs later. */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 0cf38743ec47..13151d13aa73 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -413,6 +413,10 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	if (connector->active_bpc_property)
 		drm_connector_attach_active_bpc_property(&aconnector->base, 8, 16);
 
+	connector->active_color_format_property = master->base.active_color_format_property;
+	if (connector->active_color_format_property)
+		drm_connector_attach_active_color_format_property(&aconnector->base);
+
 	connector->vrr_capable_property = master->base.vrr_capable_property;
 	if (connector->vrr_capable_property)
 		drm_connector_attach_vrr_capable_property(connector);
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

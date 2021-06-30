Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF743B860B
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Jun 2021 17:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CFD6EA42;
	Wed, 30 Jun 2021 15:10:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE836EA18;
 Wed, 30 Jun 2021 15:10:29 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 00F2DC80099;
 Wed, 30 Jun 2021 17:10:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id EfFYUROWEVhO; Wed, 30 Jun 2021 17:10:27 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F394900095779a208783f8e.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:957:79a2:878:3f8e])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 13A57C8008D;
 Wed, 30 Jun 2021 17:10:26 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com
Subject: [PATCH v5 10/17] drm/amd/display: Add handling for new "active color
 range" property
Date: Wed, 30 Jun 2021 17:10:11 +0200
Message-Id: <20210630151018.330354-11-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630151018.330354-1-wse@tuxedocomputers.com>
References: <20210630151018.330354-1-wse@tuxedocomputers.com>
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

This commit implements the "active color range" drm property for the AMD
GPU driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 33 +++++++++++++++++++
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  4 +++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 098f3d53e681..b4acedac1ac9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6728,6 +6728,33 @@ static int convert_dc_pixel_encoding_into_drm_color_format(
 	return 0;
 }
 
+static int convert_dc_color_space_into_drm_mode_color_range(enum dc_color_space color_space)
+{
+	if (color_space == COLOR_SPACE_SRGB ||
+	    color_space == COLOR_SPACE_XR_RGB ||
+	    color_space == COLOR_SPACE_MSREF_SCRGB ||
+	    color_space == COLOR_SPACE_2020_RGB_FULLRANGE ||
+	    color_space == COLOR_SPACE_ADOBERGB ||
+	    color_space == COLOR_SPACE_DCIP3 ||
+	    color_space == COLOR_SPACE_DOLBYVISION ||
+	    color_space == COLOR_SPACE_YCBCR601 ||
+	    color_space == COLOR_SPACE_XV_YCC_601 ||
+	    color_space == COLOR_SPACE_YCBCR709 ||
+	    color_space == COLOR_SPACE_XV_YCC_709 ||
+	    color_space == COLOR_SPACE_2020_YCBCR ||
+	    color_space == COLOR_SPACE_YCBCR709_BLACK ||
+	    color_space == COLOR_SPACE_DISPLAYNATIVE ||
+	    color_space == COLOR_SPACE_APPCTRL ||
+	    color_space == COLOR_SPACE_CUSTOMPOINTS)
+		return DRM_MODE_COLOR_RANGE_FULL;
+	if (color_space == COLOR_SPACE_SRGB_LIMITED ||
+	    color_space == COLOR_SPACE_2020_RGB_LIMITEDRANGE ||
+	    color_space == COLOR_SPACE_YCBCR601_LIMITED ||
+	    color_space == COLOR_SPACE_YCBCR709_LIMITED)
+		return DRM_MODE_COLOR_RANGE_LIMITED_16_235;
+	return DRM_MODE_COLOR_RANGE_UNSET;
+}
+
 static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 					  struct drm_crtc_state *crtc_state,
 					  struct drm_connector_state *conn_state)
@@ -7730,6 +7757,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
 		drm_connector_attach_active_bpc_property(&aconnector->base, 8, 16);
 		drm_connector_attach_active_color_format_property(&aconnector->base);
+		drm_connector_attach_active_color_range_property(&aconnector->base);
 	}
 
 	/* This defaults to the max in the range, but we want 8bpc for non-edp. */
@@ -9118,10 +9146,15 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 				drm_connector_set_active_color_format_property(connector,
 					convert_dc_pixel_encoding_into_drm_color_format(
 						dm_new_crtc_state->stream->timing.pixel_encoding));
+				drm_connector_set_active_color_range_property(connector,
+					convert_dc_color_space_into_drm_mode_color_range(
+						dm_new_crtc_state->stream->output_color_space));
 			}
 		} else {
 			drm_connector_set_active_bpc_property(connector, 0);
 			drm_connector_set_active_color_format_property(connector, 0);
+			drm_connector_set_active_color_range_property(connector,
+								      DRM_MODE_COLOR_RANGE_UNSET);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 13151d13aa73..b5d57bbbdd20 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -417,6 +417,10 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	if (connector->active_color_format_property)
 		drm_connector_attach_active_color_format_property(&aconnector->base);
 
+	connector->active_color_range_property = master->base.active_color_range_property;
+	if (connector->active_color_range_property)
+		drm_connector_attach_active_color_range_property(&aconnector->base);
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

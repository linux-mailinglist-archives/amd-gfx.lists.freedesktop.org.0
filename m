Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05787EE7D6
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Nov 2023 20:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAFA10E6B1;
	Thu, 16 Nov 2023 19:58:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE7610E699;
 Thu, 16 Nov 2023 19:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wt1sMWxA9s+ryqEUYxz+C5dJ9r0kB0x+U+iddFdABfg=; b=aByurMvzeXecNKTIxenUEhKDS1
 V7qIuKWdGLLxLNvm4VAiMVeBdSkrWKpMy+KyiTj748u0Rg3Qp+fu3ANO3aVGYAgX05iNA7ZFgDTD+
 RmNeN1mQecFbLxMUvXJE8Bg16XWVDoReeIQ1q4kuP6MnOp3cbKwLxQdT0rl7ZUYIyHHolRxgMCv87
 xWiZYfoXX9iC/BOoWs7HCnd2DP1EdLUai/rgl7+mSlmkl8LsuoqXZklF6N7Dk/xDMeAvUXIdN0qXc
 c6ys9RoAjvTfGqpc+PynMFYVudr0KlPsAiz7Jnl9k8q3Mr/hzG1Yk5AN99o06902IJ03png18ynQT
 ZceGfUZw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVY-0048Yy-5y; Thu, 16 Nov 2023 20:58:36 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 09/32] drm/amd/display: add plane 3D LUT driver-specific
 properties
Date: Thu, 16 Nov 2023 18:57:49 -0100
Message-Id: <20231116195812.906115-10-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add 3D LUT property for plane color transformations using a 3D lookup
table. 3D LUT allows for highly accurate and complex color
transformations and is suitable to adjust the balance between color
channels. It's also more complex to manage and require more
computational resources.

Since a 3D LUT has a limited number of entries in each dimension we want
to use them in an optimal fashion. This means using the 3D LUT in a
colorspace that is optimized for human vision, such as sRGB, PQ, or
another non-linear space. Therefore, userpace may need one 1D LUT
(shaper) before it to delinearize content and another 1D LUT after 3D
LUT (blend) to linearize content again for blending. The next patches
add these 1D LUTs to the plane color mgmt pipeline.

v3:
- improve commit message about 3D LUT
- describe the 3D LUT entries and size (Harry)

v4:
- advertise 3D LUT max size as the size of a single-dimension

v5:
- get lut3d blob correctly (Joshua)
- fix doc about 3d-lut dimension size (Sebastian)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 18 ++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 24 +++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index ee67c5adf0f1..57822477408f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -364,6 +364,24 @@ struct amdgpu_mode_info {
 	 * @plane_hdr_mult_property:
 	 */
 	struct drm_property *plane_hdr_mult_property;
+	/**
+	 * @plane_lut3d_property: Plane property for color transformation using
+	 * a 3D LUT (pre-blending), a three-dimensional array where each
+	 * element is an RGB triplet. Each dimension has the size of
+	 * lut3d_size. The array contains samples from the approximated
+	 * function. On AMD, values between samples are estimated by
+	 * tetrahedral interpolation. The array is accessed with three indices,
+	 * one for each input dimension (color channel), blue being the
+	 * outermost dimension, red the innermost.
+	 */
+	struct drm_property *plane_lut3d_property;
+	/**
+	 * @plane_degamma_lut_size_property: Plane property to define the max
+	 * size of 3D LUT as supported by the driver (read-only). The max size
+	 * is the max size of one dimension and, therefore, the max number of
+	 * entries for 3D LUT array is the 3D LUT size cubed;
+	 */
+	struct drm_property *plane_lut3d_size_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 38163b7084fa..03b48b331b7c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -776,6 +776,11 @@ struct dm_plane_state {
 	 * TF is needed for any subsequent linear-to-non-linear transforms.
 	 */
 	__u64 hdr_mult;
+	/**
+	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
+	 * &struct drm_color_lut.
+	 */
+	struct drm_property_blob *lut3d;
 };
 
 struct dm_crtc_state {
@@ -861,6 +866,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 
+/* 3D LUT max size is 17x17x17 (4913 entries) */
+#define MAX_COLOR_3DLUT_SIZE 17
+#define MAX_COLOR_3DLUT_BITDEPTH 12
+/* 1D LUT size */
 #define MAX_COLOR_LUT_ENTRIES 4096
 /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
 #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index b5b34a9209e4..a3b4f6a4c4a8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -231,6 +231,20 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_hdr_mult_property = prop;
 
+	prop = drm_property_create(adev_to_drm(adev),
+				   DRM_MODE_PROP_BLOB,
+				   "AMD_PLANE_LUT3D", 0);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_lut3d_property = prop;
+
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 DRM_MODE_PROP_IMMUTABLE,
+					 "AMD_PLANE_LUT3D_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_lut3d_size_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 45a2c9b36630..e588cff7d6b0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1364,6 +1364,9 @@ static struct drm_plane_state *amdgpu_dm_plane_drm_plane_duplicate_state(struct
 	if (old_dm_plane_state->degamma_lut)
 		dm_plane_state->degamma_lut =
 			drm_property_blob_get(old_dm_plane_state->degamma_lut);
+	if (old_dm_plane_state->lut3d)
+		dm_plane_state->lut3d =
+			drm_property_blob_get(old_dm_plane_state->lut3d);
 
 	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
 	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
@@ -1437,6 +1440,8 @@ static void amdgpu_dm_plane_drm_plane_destroy_state(struct drm_plane *plane,
 
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_put(dm_plane_state->degamma_lut);
+	if (dm_plane_state->lut3d)
+		drm_property_blob_put(dm_plane_state->lut3d);
 
 	if (dm_plane_state->dc_state)
 		dc_plane_state_release(dm_plane_state->dc_state);
@@ -1470,6 +1475,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 	drm_object_attach_property(&plane->base,
 				   dm->adev->mode_info.plane_hdr_mult_property,
 				   AMDGPU_HDR_MULT_DEFAULT);
+
+	if (dpp_color_caps.hw_3d_lut) {
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_lut3d_property, 0);
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_lut3d_size_property,
+					   MAX_COLOR_3DLUT_SIZE);
+	}
 }
 
 static int
@@ -1501,6 +1514,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 			dm_plane_state->hdr_mult = val;
 			dm_plane_state->base.color_mgmt_changed = 1;
 		}
+	} else if (property == adev->mode_info.plane_lut3d_property) {
+		ret = drm_property_replace_blob_from_id(plane->dev,
+							&dm_plane_state->lut3d,
+							val, -1,
+							sizeof(struct drm_color_lut),
+							&replaced);
+		dm_plane_state->base.color_mgmt_changed |= replaced;
+		return ret;
 	} else {
 		drm_dbg_atomic(plane->dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
@@ -1528,6 +1549,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = dm_plane_state->degamma_tf;
 	} else if (property == adev->mode_info.plane_hdr_mult_property) {
 		*val = dm_plane_state->hdr_mult;
+	} else 	if (property == adev->mode_info.plane_lut3d_property) {
+		*val = (dm_plane_state->lut3d) ?
+			dm_plane_state->lut3d->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
-- 
2.40.1


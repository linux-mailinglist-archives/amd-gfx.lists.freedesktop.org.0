Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD096EC000
	for <lists+amd-gfx@lfdr.de>; Sun, 23 Apr 2023 16:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF14410E3DD;
	Sun, 23 Apr 2023 14:12:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6973110E3DD;
 Sun, 23 Apr 2023 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Ff9ArTJlhjOrz4Iyf2wgXUbGoNJsvmn8LGUWU50kvw=; b=kV82mWIjR+T/0TKTIHkNnso9y1
 pj9TQUgP3KcKJTCLphT77F1zJ7XCv+tM2Ln5BULPV5hM/o+XqRkbY290rR5HQeg8QupGrJ5T9SOxp
 aNfGmJjQR/J3Pex79r/KaRVMGsMNh5jW2U+Kd5ui2gQ9VDDGyMqpKS0xmtlCpC6xaMAmdaggoZcLI
 mPZ4gVBBRNXQ7p72uO7m/mSBlsvcHHM4wDATqFzcQZc1Ax3Yi/fDQyNKfbFAQlcKPwvfLjhqNmneb
 yzAimWQG2DZaqeBAl0usp35JnkWNK2b7J1/wCocyiAlqss+4MLIuAvT9tLPKLZfICsRLbiC66PRjh
 GRpPLsLQ==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaSI-00ANVs-Vu; Sun, 23 Apr 2023 16:12:43 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 14/40] drm/amd/display: add plane shaper LUT
 driver-private properties
Date: Sun, 23 Apr 2023 13:10:26 -0100
Message-Id: <20230423141051.702990-15-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Shaper 1D LUT delinearizes content before applying 3D LUT so that, it
comes before 3D LUT. It's an optional property and drivers should attach
it according to HW caps.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 10 ++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  5 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 19 +++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 8d4726978c6e..f41406ee96ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1332,6 +1332,20 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_hdr_mult_property = prop;
 
+	prop = drm_property_create(adev_to_drm(adev),
+				   DRM_MODE_PROP_BLOB,
+				   "AMD_PLANE_SHAPER_LUT", 0);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_shaper_lut_property = prop;
+
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 DRM_MODE_PROP_IMMUTABLE,
+					 "AMD_PLANE_SHAPER_LUT_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_shaper_lut_size_property = prop;
+
 	prop = drm_property_create(adev_to_drm(adev),
 				   DRM_MODE_PROP_BLOB,
 				   "AMD_PLANE_LUT3D", 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 9d9dac26edfc..756d5f70be0a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -391,6 +391,16 @@ struct amdgpu_mode_info {
 	 * @plane_hdr_mult_property:
 	 */
 	struct drm_property *plane_hdr_mult_property;
+	/**
+	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
+	 * that converts color content before 3D LUT.
+	 */
+	struct drm_property *plane_shaper_lut_property;
+	/**
+	 * @shaper_lut_size_property: Plane property for the size of
+	 * pre-blending shaper LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *plane_shaper_lut_size_property;
 	/**
 	 * @plane_lut3d_property: Plane property for gamma correction using a
 	 * 3D LUT (pre-blending).
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b0ba0279dc25..d3ecc73129ff 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -748,6 +748,11 @@ struct dm_plane_state {
 	 * S31.32 sign-magnitude.
 	 */
 	__u64 hdr_mult;
+	/**
+	 * @shaper_lut: shaper lookup table blob. The blob (if not NULL) is an
+	 * array of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *shaper_lut;
 	/**
 	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
 	 * &struct drm_color_lut.
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 0e418e161b0b..69e2f1f86cce 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1347,6 +1347,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 #ifdef CONFIG_STEAM_DECK
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
+	if (dm_plane_state->shaper_lut)
+		drm_property_blob_get(dm_plane_state->shaper_lut);
 	if (dm_plane_state->lut3d)
 		drm_property_blob_get(dm_plane_state->lut3d);
 #endif
@@ -1419,6 +1421,7 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
 #ifdef CONFIG_STEAM_DECK
 	drm_property_blob_put(dm_plane_state->degamma_lut);
+	drm_property_blob_put(dm_plane_state->shaper_lut);
 	drm_property_blob_put(dm_plane_state->lut3d);
 #endif
 
@@ -1495,6 +1498,11 @@ dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 				   AMDGPU_HDR_MULT_DEFAULT);
 
 	if (dm->dc->caps.color.dpp.hw_3d_lut) {
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_shaper_lut_property, 0);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_shaper_lut_size_property,
+					   MAX_COLOR_LUT_ENTRIES);
 		drm_object_attach_property(&plane->base,
 					   dm->adev->mode_info.plane_lut3d_property, 0);
 		drm_object_attach_property(&plane->base,
@@ -1531,6 +1539,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 			dm_plane_state->hdr_mult = val;
 			dm_plane_state->base.color_mgmt_changed = 1;
 		}
+	} else if (property == adev->mode_info.plane_shaper_lut_property) {
+		ret = amdgpu_dm_replace_property_blob_from_id(plane->dev,
+					&dm_plane_state->shaper_lut,
+					val,
+					-1, sizeof(struct drm_color_lut),
+					&replaced);
+		dm_plane_state->base.color_mgmt_changed |= replaced;
+		return ret;
 	} else if (property == adev->mode_info.plane_lut3d_property) {
 		ret = amdgpu_dm_replace_property_blob_from_id(plane->dev,
 					&dm_plane_state->lut3d,
@@ -1567,6 +1583,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = dm_plane_state->degamma_tf;
 	} else if (property == adev->mode_info.plane_hdr_mult_property) {
 		*val = dm_plane_state->hdr_mult;
+	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
+		*val = (dm_plane_state->shaper_lut) ?
+			dm_plane_state->shaper_lut->base.id : 0;
 	} else 	if (property == adev->mode_info.plane_lut3d_property) {
 		*val = (dm_plane_state->lut3d) ?
 			dm_plane_state->lut3d->base.id : 0;
-- 
2.39.2


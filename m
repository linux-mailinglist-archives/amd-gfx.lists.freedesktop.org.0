Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100D7777D7A
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Aug 2023 18:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E245A10E5A9;
	Thu, 10 Aug 2023 16:04:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB42210E5AE;
 Thu, 10 Aug 2023 16:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dmCr4PG3HJ/DMmE0fiGNAXY2w+ep4p/AWmQdFgJ3Rsg=; b=rLA087csJ14X+5Q4URCpyHwZWK
 H4slSgmwL84Uz8wPsB5OWdPV7qSElbRlU7DJ1PBlRerw2aruE6XiU3t/TYPZa3igAArHoaNjasJ3m
 VWFabJVokUTUpMKcSHvwEeL7jMhp7R0a4ZXbcROcGr6iCO+E8VCyBcglK5c5GGBt4t2RXi8p7VkY2
 mknPlIED32iITrN+Er+i7a4tsqLmrjhVCBCrfJyOVLHUeP4bF7Xt3M3VjJOMWAN0Yo+x116GhQbVw
 nbEuCCluPjyGh+RsloR1heynzF7XRoixnzNBcB+8GVbB5q7frYsQWBn//vJEB8NrSglr18W4ipNE3
 hs7afS2w==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU89H-00GjYD-Vp; Thu, 10 Aug 2023 18:04:32 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH v2 34/34] drm/amd/display: Use 3x4 CTM for plane CTM
Date: Thu, 10 Aug 2023 15:03:14 -0100
Message-Id: <20230810160314.48225-35-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810160314.48225-1-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
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
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 32 +++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  2 +-
 include/uapi/drm/drm_mode.h                   |  8 +++++
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 7ff329101fd4..0a51af44efd5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -412,6 +412,32 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
 	}
 }
 
+/**
+ * __drm_ctm2_to_dc_matrix - converts a DRM CTM2 to a DC CSC float matrix
+ * @ctm: DRM color transformation matrix
+ * @matrix: DC CSC float matrix
+ *
+ * The matrix needs to be a 3x4 (12 entry) matrix.
+ */
+static void __drm_ctm2_to_dc_matrix(const struct drm_color_ctm2 *ctm,
+				   struct fixed31_32 *matrix)
+{
+	int i;
+
+	/*
+	 * DRM gives a 3x3 matrix, but DC wants 3x4. Assuming we're operating
+	 * with homogeneous coordinates, augment the matrix with 0's.
+	 *
+	 * The format provided is S31.32, using signed-magnitude representation.
+	 * Our fixed31_32 is also S31.32, but is using 2's complement. We have
+	 * to convert from signed-magnitude to 2's complement.
+	 */
+	for (i = 0; i < 12; i++) {
+		/* gamut_remap_matrix[i] = ctm[i - floor(i/4)] */
+		matrix[i] = dc_fixpt_from_s3132(ctm->matrix[i]);
+	}
+}
+
 /**
  * __set_legacy_tf - Calculates the legacy transfer function
  * @func: transfer function
@@ -1159,7 +1185,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 {
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
-	struct drm_color_ctm *ctm = NULL;
+	struct drm_color_ctm2 *ctm = NULL;
 	struct dc_color_caps *color_caps = NULL;
 	bool has_crtc_cm_degamma;
 	int ret;
@@ -1213,7 +1239,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 
 	/* Setup CRTC CTM. */
 	if (dm_plane_state->ctm) {
-		ctm = (struct drm_color_ctm *)dm_plane_state->ctm->data;
+		ctm = (struct drm_color_ctm2 *)dm_plane_state->ctm->data;
 
 		/*
 		 * So far, if we have both plane and CRTC CTM, plane CTM takes
@@ -1224,7 +1250,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		 * provide support for both DPP and MPC matrix at the same
 		 * time.
 		 */
-		__drm_ctm_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
+		__drm_ctm2_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
 
 		dc_plane_state->gamut_remap_matrix.enable_remap = true;
 		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 0b1081c690cb..27962a3d30f5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1543,7 +1543,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->ctm,
 							val,
-							sizeof(struct drm_color_ctm), -1,
+							sizeof(struct drm_color_ctm2), -1,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 46becedf5b2f..402288133e4c 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -838,6 +838,14 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm2 {
+	/*
+	 * Conversion matrix in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
-- 
2.40.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 107877BA7AB
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Oct 2023 19:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5212C10E461;
	Thu,  5 Oct 2023 17:16:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F1510E463;
 Thu,  5 Oct 2023 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C44jg5HTevSBk1T398D0D7FZ8Q37BJFXUsYbl72dzYs=; b=eWe31UhQmn6GUX86Z400nrmAPG
 /S8ULYqxPNotJbwKn1+bqbR30mMuUAiC45uQ7JRhKlwMpAKKE6dUgSodN9WMce668dkt8V/+F22sz
 ZgEFBdvIXN2acw0PwJFEiwyhUHXTACLCAKzihkeX+aUI1KpV8GXfqgJcFAa5QM+sLjPZ+rzapJrB9
 ++2CCvCphbjqXZVEtIzIIoMvVgOoKD3bKjDlPlIoZwyqoUSD096zJIdbLe3jSQK9a86UGMDxlgx54
 66W+RlS8dGQFq3g1yOsysOdOiJGp7JcEPchWwwWvIC04GdUN26uhhsOvdbwkcVMhAkXb5FjDZVVSA
 uOLwQBNg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRxY-00CFJN-2t; Thu, 05 Oct 2023 19:16:24 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 25/32] drm/amd/display: add plane 3D LUT support
Date: Thu,  5 Oct 2023 16:15:20 -0100
Message-Id: <20231005171527.203657-26-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005171527.203657-1-mwen@igalia.com>
References: <20231005171527.203657-1-mwen@igalia.com>
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

Wire up DC 3D LUT to DM plane color management (pre-blending). On AMD
display HW, 3D LUT comes after a shaper curve and we always have to
program a shaper curve to delinearize or normalize the color space
before applying a 3D LUT (since we have a reduced number of LUT
entries).

In this version, the default values of 3D LUT for size and bit_depth are
17x17x17 and 12-bit, but we already provide here a more generic
mechanisms to program other supported values (9x9x9 size and 10-bit).

v2:
- started with plane 3D LUT instead of CRTC 3D LUT support

v4:
- lut3d_size is the max dimension size instead of # of entries

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 102 +++++++++++++++++-
 2 files changed, 99 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c79cd98d1228..26d19159bd79 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8288,6 +8288,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
 			bundle->surface_updates[planes_count].hdr_mult = dc_plane->hdr_mult;
 			bundle->surface_updates[planes_count].func_shaper = dc_plane->in_shaper_func;
+			bundle->surface_updates[planes_count].lut3d_func = dc_plane->lut3d_func;
 		}
 
 		amdgpu_dm_plane_fill_dc_scaling_info(dm->adev, new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0e65bf0a886e..9c38291c42a2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -622,6 +622,86 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 	}
 }
 
+static void __to_dc_lut3d_color(struct dc_rgb *rgb,
+				const struct drm_color_lut lut,
+				int bit_precision)
+{
+	rgb->red = drm_color_lut_extract(lut.red, bit_precision);
+	rgb->green = drm_color_lut_extract(lut.green, bit_precision);
+	rgb->blue  = drm_color_lut_extract(lut.blue, bit_precision);
+}
+
+static void __drm_3dlut_to_dc_3dlut(const struct drm_color_lut *lut,
+				    uint32_t lut3d_size,
+				    struct tetrahedral_params *params,
+				    bool use_tetrahedral_9,
+				    int bit_depth)
+{
+	struct dc_rgb *lut0;
+	struct dc_rgb *lut1;
+	struct dc_rgb *lut2;
+	struct dc_rgb *lut3;
+	int lut_i, i;
+
+
+	if (use_tetrahedral_9) {
+		lut0 = params->tetrahedral_9.lut0;
+		lut1 = params->tetrahedral_9.lut1;
+		lut2 = params->tetrahedral_9.lut2;
+		lut3 = params->tetrahedral_9.lut3;
+	} else {
+		lut0 = params->tetrahedral_17.lut0;
+		lut1 = params->tetrahedral_17.lut1;
+		lut2 = params->tetrahedral_17.lut2;
+		lut3 = params->tetrahedral_17.lut3;
+	}
+
+	for (lut_i = 0, i = 0; i < lut3d_size - 4; lut_i++, i += 4) {
+		/*
+		 * We should consider the 3D LUT RGB values are distributed
+		 * along four arrays lut0-3 where the first sizes 1229 and the
+		 * other 1228. The bit depth supported for 3dlut channel is
+		 * 12-bit, but DC also supports 10-bit.
+		 *
+		 * TODO: improve color pipeline API to enable the userspace set
+		 * bit depth and 3D LUT size/stride, as specified by VA-API.
+		 */
+		__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
+		__to_dc_lut3d_color(&lut1[lut_i], lut[i + 1], bit_depth);
+		__to_dc_lut3d_color(&lut2[lut_i], lut[i + 2], bit_depth);
+		__to_dc_lut3d_color(&lut3[lut_i], lut[i + 3], bit_depth);
+	}
+	/* lut0 has 1229 points (lut_size/4 + 1) */
+	__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
+}
+
+/* amdgpu_dm_atomic_lut3d - set DRM 3D LUT to DC stream
+ * @drm_lut3d: user 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ * @lut3d: DC 3D LUT
+ *
+ * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
+ * on DCN accordingly.
+ */
+static void amdgpu_dm_atomic_lut3d(const struct drm_color_lut *drm_lut3d,
+				   uint32_t drm_lut3d_size,
+				   struct dc_3dlut *lut)
+{
+	if (!drm_lut3d_size) {
+		lut->state.bits.initialized = 0;
+	} else {
+		/* Stride and bit depth are not programmable by API yet.
+		 * Therefore, only supports 17x17x17 3D LUT (12-bit).
+		 */
+		lut->lut_3d.use_tetrahedral_9 = false;
+		lut->lut_3d.use_12bits = true;
+		lut->state.bits.initialized = 1;
+		__drm_3dlut_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
+					lut->lut_3d.use_tetrahedral_9,
+					MAX_COLOR_3DLUT_BITDEPTH);
+	}
+}
+
 static int amdgpu_dm_atomic_shaper_lut(const struct drm_color_lut *shaper_lut,
 				       bool has_rom,
 				       enum dc_transfer_func_predefined tf,
@@ -664,8 +744,8 @@ int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
 				struct drm_plane_state *plane_state)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
-	const struct drm_color_lut *shaper = NULL;
-	uint32_t exp_size, size;
+	const struct drm_color_lut *shaper = NULL, *lut3d = NULL;
+	uint32_t exp_size, size, dim_size = MAX_COLOR_3DLUT_SIZE;
 	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut;
 
 	/* shaper LUT is only available if 3D LUT color caps */
@@ -679,6 +759,17 @@ int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
 		return -EINVAL;
 	}
 
+	/* The number of 3D LUT entries is the dimension size cubed */
+	exp_size = has_3dlut ? dim_size * dim_size * dim_size : 0;
+	lut3d = __extract_blob_lut(dm_plane_state->lut3d, &size);
+
+	if (lut3d && size != exp_size) {
+		drm_dbg(&adev->ddev,
+			"Invalid 3D LUT size. Should be %u but got %u.\n",
+			exp_size, size);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -975,8 +1066,8 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	enum amdgpu_transfer_function shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
-	const struct drm_color_lut *shaper_lut;
-	uint32_t shaper_size;
+	const struct drm_color_lut *shaper_lut, *lut3d;
+	uint32_t shaper_size, lut3d_size;
 	int ret;
 
 	/* We have nothing to do here, return */
@@ -988,7 +1079,10 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 	shaper_lut = __extract_blob_lut(dm_plane_state->shaper_lut, &shaper_size);
 	shaper_size = shaper_lut != NULL ? shaper_size : 0;
 	shaper_tf = dm_plane_state->shaper_tf;
+	lut3d = __extract_blob_lut(dm_plane_state->lut3d, &lut3d_size);
+	lut3d_size = lut3d != NULL ? lut3d_size : 0;
 
+	amdgpu_dm_atomic_lut3d(lut3d, lut3d_size, dc_plane_state->lut3d_func);
 	ret = amdgpu_dm_atomic_shaper_lut(shaper_lut, false,
 					  amdgpu_tf_to_dc_tf(shaper_tf),
 					  shaper_size,
-- 
2.40.1


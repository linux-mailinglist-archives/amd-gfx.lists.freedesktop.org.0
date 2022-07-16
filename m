Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB9D5771CE
	for <lists+amd-gfx@lfdr.de>; Sun, 17 Jul 2022 00:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A00E10EE28;
	Sat, 16 Jul 2022 22:25:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CAF10EE28;
 Sat, 16 Jul 2022 22:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wderU/pPMICQvQ9swbWcdf6VOw3qpgcTBomJ2p/cn3o=; b=sj1p0UGejqwK+GC0er9n6taavh
 XY71ruN0M2TPtBlmN6lNGJDjG2cmyL6gOS98dHzjsROXYhdI+tpNLWeOYIt8YfF91/bMGOx8c3K1x
 nAUrR+NkSKqB8QTzl1HJIEB5hJ/iFCcIpc2eC3iqr9RcFyOT7SfOVqCqeyurp6DC1+ZpHJwgMKh0P
 TlgQuG1FIegmkXGoFBP384Jhh8Ik/cSzNCTwuTELLifWRarevb91BvAHBEEnGfTbcjLj6sYFxwxJ5
 GOD9kCtpNoJWIKUfYj4fS8EkJrY85WqzDMTdbTcxZ0w6zxsXwZUU9SuEH3rYrth4nHmtPGboQ1F5A
 W6N+EsCg==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oCqEK-00274N-Jm; Sun, 17 Jul 2022 00:25:44 +0200
From: Melissa Wen <mwen@igalia.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
Subject: [PATCH 1/4] Documentation/amdgpu_dm: Add DM color correction
 documentation
Date: Sat, 16 Jul 2022 21:25:26 -0100
Message-Id: <20220716222529.421115-2-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220716222529.421115-1-mwen@igalia.com>
References: <20220716222529.421115-1-mwen@igalia.com>
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, amd-gfx@lists.freedesktop.org,
 sungjoon.kim@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

AMDGPU DM maps DRM color management properties (degamma, ctm and gamma)
to DC color correction entities. Part of this mapping is already
documented as code comments and can be converted as kernel docs.

v2:
- rebase to amd-staging-drm-next

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/amdgpu/display/display-manager.rst    |   9 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 121 +++++++++++++-----
 2 files changed, 98 insertions(+), 32 deletions(-)

diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
index 7ce31f89d9a0..b1b0f11aed83 100644
--- a/Documentation/gpu/amdgpu/display/display-manager.rst
+++ b/Documentation/gpu/amdgpu/display/display-manager.rst
@@ -40,3 +40,12 @@ Atomic Implementation
 
 .. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
    :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
+
+Color Management Properties
+===========================
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+   :doc: overview
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+   :internal:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a71177305bcd..93c813089bff 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -29,7 +29,9 @@
 #include "modules/color/color_gamma.h"
 #include "basics/conversion.h"
 
-/*
+/**
+ * DOC: overview
+ *
  * The DC interface to HW gives us the following color management blocks
  * per pipe (surface):
  *
@@ -71,8 +73,8 @@
 
 #define MAX_DRM_LUT_VALUE 0xFFFF
 
-/*
- * Initialize the color module.
+/**
+ * amdgpu_dm_init_color_mod - Initialize the color module.
  *
  * We're not using the full color module, only certain components.
  * Only call setup functions for components that we need.
@@ -82,7 +84,14 @@ void amdgpu_dm_init_color_mod(void)
 	setup_x_points_distribution();
 }
 
-/* Extracts the DRM lut and lut size from a blob. */
+/**
+ * __extract_blob_lut - Extracts the DRM lut and lut size from a blob.
+ * @blob: DRM color mgmt property blob
+ * @size: lut size
+ *
+ * Returns:
+ * DRM LUT or NULL
+ */
 static const struct drm_color_lut *
 __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
 {
@@ -90,13 +99,18 @@ __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
 	return blob ? (struct drm_color_lut *)blob->data : NULL;
 }
 
-/*
- * Return true if the given lut is a linear mapping of values, i.e. it acts
- * like a bypass LUT.
+/**
+ * __is_lut_linear - check if the given lut is a linear mapping of values
+ * @lut: given lut to check values
+ * @size: lut size
  *
  * It is considered linear if the lut represents:
- * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in
- *                                           [0, MAX_COLOR_LUT_ENTRIES)
+ * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in [0,
+ * MAX_COLOR_LUT_ENTRIES)
+ *
+ * Returns:
+ * True if the given lut is a linear mapping of values, i.e. it acts like a
+ * bypass LUT. Otherwise, false.
  */
 static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
 {
@@ -119,9 +133,13 @@ static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
 	return true;
 }
 
-/*
- * Convert the drm_color_lut to dc_gamma. The conversion depends on the size
- * of the lut - whether or not it's legacy.
+/**
+ * __drm_lut_to_dc_gamma - convert the drm_color_lut to dc_gamma.
+ * @lut: DRM lookup table for color conversion
+ * @gamma: DC gamma to set entries
+ * @is_legacy: legacy or atomic gamma
+ *
+ * The conversion depends on the size of the lut - whether or not it's legacy.
  */
 static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
 				  struct dc_gamma *gamma, bool is_legacy)
@@ -154,8 +172,11 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
 	}
 }
 
-/*
- * Converts a DRM CTM to a DC CSC float matrix.
+/**
+ * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
+ * @ctm: DRM color transformation matrix
+ * @matrix: DC CSC float matrix
+ *
  * The matrix needs to be a 3x4 (12 entry) matrix.
  */
 static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
@@ -189,7 +210,18 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
 	}
 }
 
-/* Calculates the legacy transfer function - only for sRGB input space. */
+/**
+ * __set_legacy_tf - Calculates the legacy transfer function
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut
+ * @has_rom: if ROM can be used for hardcoded curve
+ *
+ * Only for sRGB input space
+ *
+ * Returns:
+ * 0 in case of sucess, -ENOMEM if fails
+ */
 static int __set_legacy_tf(struct dc_transfer_func *func,
 			   const struct drm_color_lut *lut, uint32_t lut_size,
 			   bool has_rom)
@@ -218,7 +250,16 @@ static int __set_legacy_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
-/* Calculates the output transfer function based on expected input space. */
+/**
+ * __set_output_tf - calculates the output transfer function based on expected input space.
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut
+ * @has_rom: if ROM can be used for hardcoded curve
+ *
+ * Returns:
+ * 0 in case of success. -ENOMEM if fails.
+ */
 static int __set_output_tf(struct dc_transfer_func *func,
 			   const struct drm_color_lut *lut, uint32_t lut_size,
 			   bool has_rom)
@@ -239,7 +280,7 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	__drm_lut_to_dc_gamma(lut, gamma, false);
 
 	if (func->tf == TRANSFER_FUNCTION_LINEAR) {
-		/*
+		/**
 		 * Color module doesn't like calculating regamma params
 		 * on top of a linear input. But degamma params can be used
 		 * instead to simulate this.
@@ -262,7 +303,16 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
-/* Caculates the input transfer function based on expected input space. */
+/**
+ * __set_input_tf - calculates the input transfer function based on expected
+ * input space.
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut.
+ *
+ * Returns:
+ * 0 in case of success. -ENOMEM if fails.
+ */
 static int __set_input_tf(struct dc_transfer_func *func,
 			  const struct drm_color_lut *lut, uint32_t lut_size)
 {
@@ -285,13 +335,15 @@ static int __set_input_tf(struct dc_transfer_func *func,
 }
 
 /**
- * amdgpu_dm_verify_lut_sizes
+ * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
  * @crtc_state: the DRM CRTC state
  *
- * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
- * the expected size.
+ * Verifies that the Degamma and Gamma LUTs attached to the &crtc_state
+ * are of the expected size.
  *
- * Returns 0 on success.
+ * Returns:
+ * 0 on success.
+ * -EINVAL if any lut sizes are invalid.
  */
 int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
 {
@@ -327,9 +379,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
  * of the HW blocks as long as the CRTC CTM always comes before the
  * CRTC RGM and after the CRTC DGM.
  *
- * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
- * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
- * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
+ * * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
+ * * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
+ * * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
  *
  * The RGM block is typically more fully featured and accurate across
  * all ASICs - DCE can't support a custom non-linear CRTC DGM.
@@ -338,7 +390,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
  * management at once we have to either restrict the usage of CRTC properties
  * or blend adjustments together.
  *
- * Returns 0 on success.
+ * Returns:
+ * 0 on success.
+ * Error code if setup fails.
  */
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 {
@@ -373,7 +427,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 
 	/* Setup regamma and degamma. */
 	if (is_legacy) {
-		/*
+		/**
 		 * Legacy regamma forces us to use the sRGB RGM as a base.
 		 * This also means we can't use linear DGM since DGM needs
 		 * to use sRGB as a base as well, resulting in incorrect CRTC
@@ -393,7 +447,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		if (r)
 			return r;
 	} else if (has_regamma) {
-		/* CRTC RGM goes into RGM LUT. */
+		/**
+		 * If atomic regamma, CRTC RGM goes into RGM LUT. */
 		stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
 		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
 
@@ -402,7 +457,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		if (r)
 			return r;
 	} else {
-		/*
+		/**
 		 * No CRTC RGM means we can just put the block into bypass
 		 * since we don't have any plane level adjustments using it.
 		 */
@@ -410,7 +465,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
 	}
 
-	/*
+	/**
 	 * CRTC DGM goes into DGM LUT. It would be nice to place it
 	 * into the RGM since it's a more featured block but we'd
 	 * have to place the CTM in the OCSC in that case.
@@ -421,7 +476,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	if (crtc->base.ctm) {
 		ctm = (struct drm_color_ctm *)crtc->base.ctm->data;
 
-		/*
+		/**
 		 * Gamut remapping must be used for gamma correction
 		 * since it comes before the regamma correction.
 		 *
@@ -452,7 +507,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
  * preparation for hardware commit. The transfer function used depends on
  * the prepartion done on the stream for color management.
  *
- * Returns 0 on success.
+ * Returns:
+ * 0 on success.
+ * ENOMEM if mem allocation fails.
  */
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state)
-- 
2.35.1


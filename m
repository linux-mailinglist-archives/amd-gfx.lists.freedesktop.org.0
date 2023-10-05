Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D87D7BA7B1
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Oct 2023 19:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27C110E46E;
	Thu,  5 Oct 2023 17:16:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0A510E461;
 Thu,  5 Oct 2023 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8ih087n0V1Ac7wVNVz99hU34LUBPeJcNWLHETooIr9E=; b=VH3Ro8uDtdn0vrmemJiNnWz/OC
 Jd3Axfn4HjKPC+YZa1GOzxUtFemqBnCEv2gtUgmY8tqpmaRIwKDWbsqpa90CPLDwlzv9T24fchIDe
 JIpR7KS71mNrHLlvWQ9+NK/0vfy4dS3I2M7HL0bSwQEOvM1irvFJwmV/Z0aHDSff6Jz3hXBA2ifFH
 beKWB5CpzS9izJnBCiYLHug6vCgfXQ7Xw3LAyZ5XlF05zoP43D0lGxGE9gxENbc/e8FfJIMvtecrL
 CJR8hisEt2WWFRxnNAvfLMSCBAiCMtVxr8f6Wa4UBNtlUQH72ie7D8jYFIoYNJGHHjsa1WmzFgTe2
 1sbWnZMw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRxc-00CFJN-A6; Thu, 05 Oct 2023 19:16:28 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 27/32] drm/amd/display: add plane blend LUT and TF support
Date: Thu,  5 Oct 2023 16:15:22 -0100
Message-Id: <20231005171527.203657-28-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

Map plane blend properties to DPP blend gamma. Plane blend is a
post-3D LUT curve that linearizes color space for blending. It may be
defined by a user-blob LUT and/or predefined transfer function. As
hardcoded curve (ROM) is not supported on blend gamma, we use AMD color
module to fill parameters when setting non-linear TF with empty LUT.

v2:
- rename DRM TFs to AMDGPU TFs

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 56 +++++++++++++++++--
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 26d19159bd79..4b4181447df9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8289,6 +8289,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			bundle->surface_updates[planes_count].hdr_mult = dc_plane->hdr_mult;
 			bundle->surface_updates[planes_count].func_shaper = dc_plane->in_shaper_func;
 			bundle->surface_updates[planes_count].lut3d_func = dc_plane->lut3d_func;
+			bundle->surface_updates[planes_count].blend_tf = dc_plane->blend_tf;
 		}
 
 		amdgpu_dm_plane_fill_dc_scaling_info(dm->adev, new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 25e9aa147e00..0909ed5639bf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -732,6 +732,35 @@ static int amdgpu_dm_atomic_shaper_lut(const struct drm_color_lut *shaper_lut,
 	return ret;
 }
 
+static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
+				       bool has_rom,
+				       enum dc_transfer_func_predefined tf,
+				       uint32_t blend_size,
+				       struct dc_transfer_func *func_blend)
+{
+	int ret = 0;
+
+	if (blend_size || tf != TRANSFER_FUNCTION_LINEAR) {
+		/*
+		 * DRM plane gamma LUT or TF means we are linearizing color
+		 * space before blending (similar to degamma programming). As
+		 * we don't have hardcoded curve support, or we use AMD color
+		 * module to fill the parameters that will be translated to HW
+		 * points.
+		 */
+		func_blend->type = TF_TYPE_DISTRIBUTED_POINTS;
+		func_blend->tf = tf;
+		func_blend->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+
+		ret = __set_input_tf(func_blend, blend_lut, blend_size);
+	} else {
+		func_blend->type = TF_TYPE_BYPASS;
+		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
+	}
+
+	return ret;
+}
+
 /**
  * amdgpu_dm_verify_lut3d_size - verifies if 3D LUT is supported and if user
  * shaper and 3D LUTs match the hw supported size
@@ -1070,8 +1099,9 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	enum amdgpu_transfer_function shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
-	const struct drm_color_lut *shaper_lut, *lut3d;
-	uint32_t shaper_size, lut3d_size;
+	enum amdgpu_transfer_function blend_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
+	const struct drm_color_lut *shaper_lut, *lut3d, *blend_lut;
+	uint32_t shaper_size, lut3d_size, blend_size;
 	int ret;
 
 	/* We have nothing to do here, return */
@@ -1091,12 +1121,30 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 					  amdgpu_tf_to_dc_tf(shaper_tf),
 					  shaper_size,
 					  dc_plane_state->in_shaper_func);
-	if (ret)
+	if (ret) {
 		drm_dbg_kms(plane_state->plane->dev,
 			    "setting plane %d shaper LUT failed.\n",
 			    plane_state->plane->index);
 
-	return ret;
+		return ret;
+	}
+
+	blend_tf = dm_plane_state->blend_tf;
+	blend_lut = __extract_blob_lut(dm_plane_state->blend_lut, &blend_size);
+	blend_size = blend_lut != NULL ? blend_size : 0;
+
+	ret = amdgpu_dm_atomic_blend_lut(blend_lut, false,
+					 amdgpu_tf_to_dc_tf(blend_tf),
+					 blend_size, dc_plane_state->blend_tf);
+	if (ret) {
+		drm_dbg_kms(plane_state->plane->dev,
+			    "setting plane %d gamma lut failed.\n",
+			    plane_state->plane->index);
+
+		return ret;
+	}
+
+	return 0;
 }
 
 /**
-- 
2.40.1


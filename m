Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763392791A6
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 22:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C996ED65;
	Fri, 25 Sep 2020 20:11:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB3A6ED64
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 20:11:17 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d20so4116813qka.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 13:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jYZyuvMp8uxiAZp9jNfbZQliLUviAYrkVX3bWewDWL0=;
 b=MXim8gCbGQ1wLRJ5/vJniIAoCK+Wu9C4YbU/kTTSFXkuXRBVUe1R63j64T0EfK9UEW
 xJ9zBp5ezMs9uGSQuVXCKU5qVBrjH3TlrTrV5T9rrx4QfgCfELjHDftVQiUldtmaKRV2
 PEUXK29V8lvP13eAnclXNKhQGHUd7+y/5h3ci1eRVhAomYW1R8oBH5YSoi/Lqs++1eBR
 GnCGoR/Kj55MHpuDc2w7YZA3Ypzq5VKcqoJW8wV7HaQCHALP1RGKHjwH5hID/kE3bTYM
 vjXmMKti93OXMNByRYzHJc8EZ0CW+d/ypPiNCZL+PtBpbnbOqjwain2EIxgw0vVuEat1
 1gZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jYZyuvMp8uxiAZp9jNfbZQliLUviAYrkVX3bWewDWL0=;
 b=Vu2/OxrMTTZHN1I63kpmkuS/VOTKjF5MEAXpbjj9OCubQMS6fmJK5CKaExtk2AQAMZ
 H9K38T2j/pJ4jjrZBCZ9URySAmbROQc6YJs1xZZ+vsc3y3VkSywAgHz3H7IxtPezLjO7
 HuF9BGQAsXCdlrM4McUdXJB7gbdiYAFGUi8yZu/YiQV+Ck5iP3ayMADI3TjIkzOUhpl4
 zahdsW7gcS4HeRusoS7ug/h7VMAV4DuobJnqAKZ4yKhkLt4Cp8kYElPwopaLOrIP8gds
 RXi1mjMbowAyT/kDWlN8Cn885f+vIdFyD0v0NQr9qlYk79B67XwIQb7qR3pJ9BpS9KiK
 JPNA==
X-Gm-Message-State: AOAM531+f3v/yem2lOEa9/E7sUemtJdLZAouE3RYknEHniXAtbE0EkhS
 6UzJhuwgw8quNpA4CIJEwZDdDrfMHbo=
X-Google-Smtp-Source: ABdhPJygqOW5PsV6VYPzsVRYqLKCAX+xIlodmV8U3R4dZythUw8DO1WTjZbYu5+Vq5QJIQnqvZZLCg==
X-Received: by 2002:a05:620a:9ce:: with SMTP id
 y14mr1820456qky.437.1601064676054; 
 Fri, 25 Sep 2020 13:11:16 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m67sm2301237qkf.98.2020.09.25.13.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 13:11:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 16/45] drm/amdgpu: add gfx support for van gogh (v2)
Date: Fri, 25 Sep 2020 16:10:00 -0400
Message-Id: <20200925201029.1738724-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200925201029.1738724-1-alexander.deucher@amd.com>
References: <20200925201029.1738724-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Huang Rui <ray.huang@amd.com>

Add van gogh checks to gfx10 code.

v2: squash in fixes

Signed-off-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 29 +++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)
 mode change 100644 => 100755 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
old mode 100644
new mode 100755
index 17fb2efdadd3..19ab5783214c
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -152,6 +152,13 @@ MODULE_FIRMWARE("amdgpu/navy_flounder_mec.bin");
 MODULE_FIRMWARE("amdgpu/navy_flounder_mec2.bin");
 MODULE_FIRMWARE("amdgpu/navy_flounder_rlc.bin");
 
+MODULE_FIRMWARE("amdgpu/vangogh_ce.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_pfp.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_me.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_mec.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_mec2.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_rlc.bin");
+
 static const struct soc15_reg_golden golden_settings_gc_10_1[] =
 {
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCB_HW_CONTROL_4, 0xffffffff, 0x00400014),
@@ -3554,6 +3561,7 @@ static void gfx_v10_0_check_fw_write_wait(struct amdgpu_device *adev)
 		break;
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		adev->gfx.cp_fw_write_wait = true;
 		break;
 	default:
@@ -3652,6 +3660,9 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 	case CHIP_NAVY_FLOUNDER:
 		chip_name = "navy_flounder";
 		break;
+	case CHIP_VANGOGH:
+		chip_name = "vangogh";
+		break;
 	default:
 		BUG();
 	}
@@ -4186,6 +4197,7 @@ static void gfx_v10_0_gpu_early_init(struct amdgpu_device *adev)
 		break;
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		adev->gfx.config.max_hw_contexts = 8;
 		adev->gfx.config.sc_prim_fifo_size_frontend = 0x20;
 		adev->gfx.config.sc_prim_fifo_size_backend = 0x100;
@@ -4309,6 +4321,7 @@ static int gfx_v10_0_sw_init(void *handle)
 		break;
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		adev->gfx.me.num_me = 1;
 		adev->gfx.me.num_pipe_per_me = 1;
 		adev->gfx.me.num_queue_per_pipe = 1;
@@ -4564,7 +4577,8 @@ static u32 gfx_v10_0_init_pa_sc_tile_steering_override(struct amdgpu_device *ade
 	/* for ASICs that integrates GFX v10.3
 	 * pa_sc_tile_steering_override should be set to 0 */
 	if (adev->asic_type == CHIP_SIENNA_CICHLID ||
-	    adev->asic_type == CHIP_NAVY_FLOUNDER)
+	    adev->asic_type == CHIP_NAVY_FLOUNDER ||
+	    adev->asic_type == CHIP_VANGOGH)
 		return 0;
 
 	/* init num_sc */
@@ -5801,6 +5815,7 @@ static void gfx_v10_0_cp_gfx_set_doorbell(struct amdgpu_device *adev,
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		tmp = REG_SET_FIELD(0, CP_RB_DOORBELL_RANGE_LOWER,
 				    DOORBELL_RANGE_LOWER_Sienna_Cichlid, ring->doorbell_index);
 		WREG32_SOC15(GC, 0, mmCP_RB_DOORBELL_RANGE_LOWER, tmp);
@@ -5934,6 +5949,7 @@ static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
 		switch (adev->asic_type) {
 		case CHIP_SIENNA_CICHLID:
 		case CHIP_NAVY_FLOUNDER:
+		case CHIP_VANGOGH:
 			WREG32_SOC15(GC, 0, mmCP_MEC_CNTL_Sienna_Cichlid, 0);
 			break;
 		default:
@@ -5944,6 +5960,7 @@ static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
 		switch (adev->asic_type) {
 		case CHIP_SIENNA_CICHLID:
 		case CHIP_NAVY_FLOUNDER:
+		case CHIP_VANGOGH:
 			WREG32_SOC15(GC, 0, mmCP_MEC_CNTL_Sienna_Cichlid,
 				     (CP_MEC_CNTL__MEC_ME1_HALT_MASK |
 				      CP_MEC_CNTL__MEC_ME2_HALT_MASK));
@@ -6038,6 +6055,7 @@ static void gfx_v10_0_kiq_setting(struct amdgpu_ring *ring)
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid);
 		tmp &= 0xffffff00;
 		tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
@@ -6758,6 +6776,8 @@ static bool gfx_v10_0_check_grbm_cam_remapping(struct amdgpu_device *adev)
 			return false;
 		}
 		break;
+	case CHIP_VANGOGH:
+		return true;
 	default:
 		data = RREG32_SOC15(GC, 0, mmVGT_ESGS_RING_SIZE);
 		WREG32_SOC15(GC, 0, mmVGT_ESGS_RING_SIZE, 0);
@@ -6785,6 +6805,7 @@ static void gfx_v10_0_setup_grbm_cam_remapping(struct amdgpu_device *adev)
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		/* mmVGT_TF_RING_SIZE_UMD -> mmVGT_TF_RING_SIZE */
 		data = (SOC15_REG_OFFSET(GC, 0, mmVGT_TF_RING_SIZE_UMD) <<
 			GRBM_CAM_DATA__CAM_ADDR__SHIFT) |
@@ -7079,6 +7100,7 @@ static int gfx_v10_0_soft_reset(void *handle)
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		if (REG_GET_FIELD(tmp, GRBM_STATUS2, RLC_BUSY_Sienna_Cichlid))
 			grbm_soft_reset = REG_SET_FIELD(grbm_soft_reset,
 							GRBM_SOFT_RESET,
@@ -7178,6 +7200,7 @@ static int gfx_v10_0_early_init(void *handle)
 		break;
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		adev->gfx.num_gfx_rings = GFX10_NUM_GFX_RINGS_Sienna_Cichlid;
 		break;
 	default:
@@ -7231,6 +7254,7 @@ static void gfx_v10_0_set_safe_mode(struct amdgpu_device *adev)
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		WREG32_SOC15(GC, 0, mmRLC_SAFE_MODE_Sienna_Cichlid, data);
 
 		/* wait for RLC_SAFE_MODE */
@@ -7263,6 +7287,7 @@ static void gfx_v10_0_unset_safe_mode(struct amdgpu_device *adev)
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		WREG32_SOC15(GC, 0, mmRLC_SAFE_MODE_Sienna_Cichlid, data);
 		break;
 	default:
@@ -7574,6 +7599,7 @@ static int gfx_v10_0_set_clockgating_state(void *handle,
 	case CHIP_NAVI12:
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		gfx_v10_0_update_gfx_clock_gating(adev,
 						 state == AMD_CG_STATE_GATE);
 		break;
@@ -8676,6 +8702,7 @@ static void gfx_v10_0_set_rlc_funcs(struct amdgpu_device *adev)
 	case CHIP_NAVI14:
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		adev->gfx.rlc.funcs = &gfx_v10_0_rlc_funcs;
 		break;
 	case CHIP_NAVI12:
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

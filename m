Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAEFA640B0
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Mar 2025 07:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320EB10E324;
	Mon, 17 Mar 2025 06:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fQKMHK/G";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C7510E322
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Mar 2025 06:07:34 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-47677b77725so40217611cf.3
 for <amd-gfx@lists.freedesktop.org>; Sun, 16 Mar 2025 23:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742191653; x=1742796453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dVfkzjv7StFwdUZ5quvqQfvV2oE7bQFZa5teN40zSf4=;
 b=fQKMHK/GPk/FARxXLtarEiQzmajnn9Jxi3oPZPq1KhRHgfIUFENm6IF4AtqF8xf6fc
 JZ5AibAshhjAVLFlEdPgUZHrIiVNmDGxIbCRl+iStkROGn4jCaGj+yupuWeRbukN8qRG
 sd4/RfvDzML2dztCESjq4T8cW9rfwXtjqW4u7lFeM+T3cge+TTdvrcszFZMkjcb+AI+C
 JsYEmOPGpTmNs7xkHedGuFl14Z5IsFbjGcBJ1DCXMeB+T6XPQgysAuZcn0EdR5H7mQX4
 I4dyJNOFPt7YigduQQLEBE2qAWuh+g0JGdbPawxIPpEufII2DplfwCMUJqOg80Xvq/NW
 LKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742191653; x=1742796453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVfkzjv7StFwdUZ5quvqQfvV2oE7bQFZa5teN40zSf4=;
 b=WoSigocGAMfymF4j7QcEurgV8ffLDTfLJ9CUGdxOpG31+FZQKmruGavi35WEiKpl6L
 sE1RfBRmQ3rJwjekLTy/uMt1mWKZtJVoTZUdNSDy5z+N1JpF2ktd+Pd2sIxQIr+mPC6A
 XYQVCT23R0RoaIR4d/ZbwTShXCj3AUTL2UwNNbXCZ0szFxiP8POJ1i/xvFr+C5rzpMDN
 HiH8vScwJ5HZp0NYrCCS0IWigmw9KW9EkRZ+OjF2AgpKY/wiIp9IgPVuclZQItHd+Vwb
 kajtvmRtQoZW8jPyUFbwKs/0B0ZgiLey6xTYb7yBuYsbdGI7pvOHAaVJDjACAlMfDB88
 FsDQ==
X-Gm-Message-State: AOJu0YxMD7BfskdXCkqBeMwDT/afeio7mdDxxopzSsBykupQqfZoIUhB
 lDvvqKHzouKlQbKPtfc1X3ILm4xWyGrN8ktGqBcwJM4Fgn9zf/UilTMMwg==
X-Gm-Gg: ASbGncuj4Bvksu56GHrZnTUVIcCu1RWWdWxErOJqczFtA7v6mISfTinVpCt93cUYUZq
 mY5DRPEi3k4uz4cu9YHoU8g38bjSlPIFvdrQua2IVLgFWylt9awNim8WCwAEP4hTxUFSr7mCsTf
 mT1+URX4iwY61ule05OGZfsxR9fZzjT7Rl3Ftm0W+fOmqvS4A3pH+3/GoM3f+Uf2pi94pKiz/u+
 FJCrjTfw7vO3/dGwZ4DkjxFb1ENAjBIEVUoBtbmhpMpcmjpk+EaLKSZNCgh5wGWO2PTUnluyObz
 11TRJPNqKOsNfEA0QZ4d4PfFzRjD0noHzVUSwfTche8hf/dm4JWgygBbNvpUPYph1xo=
X-Google-Smtp-Source: AGHT+IFIBZQ2xp1t84nTSh3NAWPxyR2Ief0Fyd5jr+p2OMEmIa8nuzqyRCt6zqVt7VVgrEYC+nMKTg==
X-Received: by 2002:a05:622a:1a89:b0:476:add4:d2b7 with SMTP id
 d75a77b69052e-476c81ee0d9mr183224131cf.51.1742191653179; 
 Sun, 16 Mar 2025 23:07:33 -0700 (PDT)
Received: from localhost.localdomain ([38.74.25.248])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-476bb7f4f08sm50605931cf.56.2025.03.16.23.07.32
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 23:07:32 -0700 (PDT)
From: Alexandre Demers <alexandre.f.demers@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/18] drm/amdgpu: move si.c away from sid.h
Date: Mon, 17 Mar 2025 02:06:57 -0400
Message-ID: <20250317060702.5297-14-alexandre.f.demers@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250317060702.5297-1-alexandre.f.demers@gmail.com>
References: <20250317060702.5297-1-alexandre.f.demers@gmail.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Signed-off-by: Alexandre Demers <alexandre.f.demers@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/si.c | 369 ++++++++++++++++----------------
 1 file changed, 185 insertions(+), 184 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 75d3b7471c68..3b8c65a966b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -1085,8 +1085,8 @@ static u32 si_smc_rreg(struct amdgpu_device *adev, u32 reg)
 	u32 r;
 
 	spin_lock_irqsave(&adev->smc_idx_lock, flags);
-	WREG32(SMC_IND_INDEX_0, (reg));
-	r = RREG32(SMC_IND_DATA_0);
+	WREG32(mmSMC_IND_INDEX_0, (reg));
+	r = RREG32(mmSMC_IND_DATA_0);
 	spin_unlock_irqrestore(&adev->smc_idx_lock, flags);
 	return r;
 }
@@ -1096,8 +1096,8 @@ static void si_smc_wreg(struct amdgpu_device *adev, u32 reg, u32 v)
 	unsigned long flags;
 
 	spin_lock_irqsave(&adev->smc_idx_lock, flags);
-	WREG32(SMC_IND_INDEX_0, (reg));
-	WREG32(SMC_IND_DATA_0, (v));
+	WREG32(mmSMC_IND_INDEX_0, (reg));
+	WREG32(mmSMC_IND_DATA_0, (v));
 	spin_unlock_irqrestore(&adev->smc_idx_lock, flags);
 }
 
@@ -1124,20 +1124,20 @@ static void si_uvd_ctx_wreg(struct amdgpu_device *adev, u32 reg, u32 v)
 }
 
 static struct amdgpu_allowed_register_entry si_allowed_read_registers[] = {
-	{GRBM_STATUS},
+	{mmGRBM_STATUS},
 	{mmGRBM_STATUS2},
 	{mmGRBM_STATUS_SE0},
 	{mmGRBM_STATUS_SE1},
 	{mmSRBM_STATUS},
 	{mmSRBM_STATUS2},
-	{DMA_STATUS_REG + DMA0_REGISTER_OFFSET},
-	{DMA_STATUS_REG + DMA1_REGISTER_OFFSET},
+	{mmDMA_STATUS_REG + DMA0_REGISTER_OFFSET},
+	{mmDMA_STATUS_REG + DMA1_REGISTER_OFFSET},
 	{mmCP_STAT},
 	{mmCP_STALLED_STAT1},
 	{mmCP_STALLED_STAT2},
 	{mmCP_STALLED_STAT3},
-	{GB_ADDR_CONFIG},
-	{MC_ARB_RAMCFG},
+	{mmGB_ADDR_CONFIG},
+	{mmMC_ARB_RAMCFG},
 	{mmGB_TILE_MODE0},
 	{mmGB_TILE_MODE1},
 	{mmGB_TILE_MODE2},
@@ -1170,7 +1170,7 @@ static struct amdgpu_allowed_register_entry si_allowed_read_registers[] = {
 	{mmGB_TILE_MODE29},
 	{mmGB_TILE_MODE30},
 	{mmGB_TILE_MODE31},
-	{CC_RB_BACKEND_DISABLE, true},
+	{mmCC_RB_BACKEND_DISABLE, true},
 	{mmGC_USER_RB_BACKEND_DISABLE, true},
 	{mmPA_SC_RASTER_CONFIG, true},
 };
@@ -1282,7 +1282,7 @@ static bool si_read_disabled_bios(struct amdgpu_device *adev)
 	if (adev->mode_info.num_crtc) {
 		d1vga_control = RREG32(AVIVO_D1VGA_CONTROL);
 		d2vga_control = RREG32(AVIVO_D2VGA_CONTROL);
-		vga_render_control = RREG32(VGA_RENDER_CONTROL);
+		vga_render_control = RREG32(mmVGA_RENDER_CONTROL);
 	}
 	rom_cntl = RREG32(R600_ROM_CNTL);
 
@@ -1296,8 +1296,8 @@ static bool si_read_disabled_bios(struct amdgpu_device *adev)
 		WREG32(AVIVO_D2VGA_CONTROL,
 		       (d2vga_control & ~(AVIVO_DVGA_CONTROL_MODE_ENABLE |
 					  AVIVO_DVGA_CONTROL_TIMING_SELECT)));
-		WREG32(VGA_RENDER_CONTROL,
-		       (vga_render_control & C_000300_VGA_VSTATUS_CNTL));
+		WREG32(mmVGA_RENDER_CONTROL,
+		       (vga_render_control & ~VGA_RENDER_CONTROL__VGA_VSTATUS_CNTL_MASK));
 	}
 	WREG32(R600_ROM_CNTL, rom_cntl | R600_SCK_OVERWRITE);
 
@@ -1308,7 +1308,7 @@ static bool si_read_disabled_bios(struct amdgpu_device *adev)
 	if (adev->mode_info.num_crtc) {
 		WREG32(AVIVO_D1VGA_CONTROL, d1vga_control);
 		WREG32(AVIVO_D2VGA_CONTROL, d2vga_control);
-		WREG32(VGA_RENDER_CONTROL, vga_render_control);
+		WREG32(mmVGA_RENDER_CONTROL, vga_render_control);
 	}
 	WREG32(R600_ROM_CNTL, rom_cntl);
 	return r;
@@ -1345,23 +1345,24 @@ static void si_set_clk_bypass_mode(struct amdgpu_device *adev)
 {
 	u32 tmp, i;
 
-	tmp = RREG32(CG_SPLL_FUNC_CNTL);
-	tmp |= SPLL_BYPASS_EN;
-	WREG32(CG_SPLL_FUNC_CNTL, tmp);
+	tmp = RREG32(ixCG_SPLL_FUNC_CNTL);
+	tmp |= CG_SPLL_FUNC_CNTL__SPLL_BYPASS_EN_MASK;
+	WREG32(ixCG_SPLL_FUNC_CNTL, tmp);
 
-	tmp = RREG32(CG_SPLL_FUNC_CNTL_2);
-	tmp |= SPLL_CTLREQ_CHG;
-	WREG32(CG_SPLL_FUNC_CNTL_2, tmp);
+	tmp = RREG32(ixCG_SPLL_FUNC_CNTL_2);
+	tmp |= CG_SPLL_FUNC_CNTL_2__SPLL_CTLREQ_CHG_MASK;
+	WREG32(ixCG_SPLL_FUNC_CNTL_2, tmp);
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (RREG32(SPLL_STATUS) & SPLL_CHG_STATUS)
+		if (RREG32(ixCG_SPLL_STATUS) & CG_SPLL_STATUS__SPLL_CHG_STATUS_MASK)
 			break;
 		udelay(1);
 	}
 
-	tmp = RREG32(CG_SPLL_FUNC_CNTL_2);
-	tmp &= ~(SPLL_CTLREQ_CHG | SCLK_MUX_UPDATE);
-	WREG32(CG_SPLL_FUNC_CNTL_2, tmp);
+	tmp = RREG32(ixCG_SPLL_FUNC_CNTL_2);
+	tmp &= ~(CG_SPLL_FUNC_CNTL_2__SPLL_CTLREQ_CHG_MASK |
+		CG_SPLL_FUNC_CNTL_2__SCLK_MUX_UPDATE_MASK);
+	WREG32(ixCG_SPLL_FUNC_CNTL_2, tmp);
 
 	tmp = RREG32(MPLL_CNTL_MODE);
 	tmp &= ~MPLL_MCLK_SEL;
@@ -1372,21 +1373,21 @@ static void si_spll_powerdown(struct amdgpu_device *adev)
 {
 	u32 tmp;
 
-	tmp = RREG32(SPLL_CNTL_MODE);
-	tmp |= SPLL_SW_DIR_CONTROL;
-	WREG32(SPLL_CNTL_MODE, tmp);
+	tmp = RREG32(ixSPLL_CNTL_MODE);
+	tmp |= SPLL_CNTL_MODE__SPLL_SW_DIR_CONTROL_MASK;
+	WREG32(ixSPLL_CNTL_MODE, tmp);
 
-	tmp = RREG32(CG_SPLL_FUNC_CNTL);
-	tmp |= SPLL_RESET;
-	WREG32(CG_SPLL_FUNC_CNTL, tmp);
+	tmp = RREG32(ixCG_SPLL_FUNC_CNTL);
+	tmp |= CG_SPLL_FUNC_CNTL__SPLL_RESET_MASK;
+	WREG32(ixCG_SPLL_FUNC_CNTL, tmp);
 
-	tmp = RREG32(CG_SPLL_FUNC_CNTL);
-	tmp |= SPLL_SLEEP;
-	WREG32(CG_SPLL_FUNC_CNTL, tmp);
+	tmp = RREG32(ixCG_SPLL_FUNC_CNTL);
+	tmp |= CG_SPLL_FUNC_CNTL__SPLL_SLEEP_MASK;
+	WREG32(ixCG_SPLL_FUNC_CNTL, tmp);
 
-	tmp = RREG32(SPLL_CNTL_MODE);
-	tmp &= ~SPLL_SW_DIR_CONTROL;
-	WREG32(SPLL_CNTL_MODE, tmp);
+	tmp = RREG32(ixSPLL_CNTL_MODE);
+	tmp &= ~SPLL_CNTL_MODE__SPLL_SW_DIR_CONTROL_MASK;
+	WREG32(ixSPLL_CNTL_MODE, tmp);
 }
 
 static int si_gpu_pci_config_reset(struct amdgpu_device *adev)
@@ -1468,14 +1469,14 @@ static void si_vga_set_state(struct amdgpu_device *adev, bool state)
 {
 	uint32_t temp;
 
-	temp = RREG32(CONFIG_CNTL);
+	temp = RREG32(mmCONFIG_CNTL);
 	if (!state) {
 		temp &= ~(1<<0);
 		temp |= (1<<1);
 	} else {
 		temp &= ~(1<<1);
 	}
-	WREG32(CONFIG_CNTL, temp);
+	WREG32(mmCONFIG_CNTL, temp);
 }
 
 static u32 si_get_xclk(struct amdgpu_device *adev)
@@ -1483,12 +1484,12 @@ static u32 si_get_xclk(struct amdgpu_device *adev)
 	u32 reference_clock = adev->clock.spll.reference_freq;
 	u32 tmp;
 
-	tmp = RREG32(CG_CLKPIN_CNTL_2);
-	if (tmp & MUX_TCLK_TO_XCLK)
+	tmp = RREG32(ixCG_CLKPIN_CNTL_2);
+	if (tmp & CG_CLKPIN_CNTL_2__MUX_TCLK_TO_XCLK_MASK)
 		return TCLK;
 
-	tmp = RREG32(CG_CLKPIN_CNTL);
-	if (tmp & XTALIN_DIVIDE)
+	tmp = RREG32(ixCG_CLKPIN_CNTL);
+	if (tmp & CG_CLKPIN_CNTL__XTALIN_DIVIDE_MASK)
 		return reference_clock / 4;
 
 	return reference_clock;
@@ -1533,9 +1534,9 @@ static int si_get_pcie_lanes(struct amdgpu_device *adev)
 	if (adev->flags & AMD_IS_APU)
 		return 0;
 
-	link_width_cntl = RREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL);
+	link_width_cntl = RREG32_PCIE_PORT(ixPCIE_LC_LINK_WIDTH_CNTL);
 
-	switch ((link_width_cntl & LC_LINK_WIDTH_RD_MASK) >> LC_LINK_WIDTH_RD_SHIFT) {
+	switch ((link_width_cntl & PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD_MASK) >> PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD__SHIFT) {
 	case LC_LINK_WIDTH_X1:
 		return 1;
 	case LC_LINK_WIDTH_X2:
@@ -1582,13 +1583,13 @@ static void si_set_pcie_lanes(struct amdgpu_device *adev, int lanes)
 		return;
 	}
 
-	link_width_cntl = RREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL);
-	link_width_cntl &= ~LC_LINK_WIDTH_MASK;
-	link_width_cntl |= mask << LC_LINK_WIDTH_SHIFT;
-	link_width_cntl |= (LC_RECONFIG_NOW |
-			    LC_RECONFIG_ARC_MISSING_ESCAPE);
+	link_width_cntl = RREG32_PCIE_PORT(ixPCIE_LC_LINK_WIDTH_CNTL);
+	link_width_cntl &= ~PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_MASK;
+	link_width_cntl |= mask << PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH__SHIFT;
+	link_width_cntl |= (PCIE_LC_LINK_WIDTH_CNTL__LC_RECONFIG_NOW_MASK |
+		PCIE_LC_LINK_WIDTH_CNTL__LC_RECONFIG_ARC_MISSING_ESCAPE_MASK);
 
-	WREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL, link_width_cntl);
+	WREG32_PCIE_PORT(ixPCIE_LC_LINK_WIDTH_CNTL, link_width_cntl);
 }
 
 static void si_get_pcie_usage(struct amdgpu_device *adev, uint64_t *count0,
@@ -2032,7 +2033,7 @@ static const struct amdgpu_asic_funcs si_asic_funcs =
 
 static uint32_t si_get_rev_id(struct amdgpu_device *adev)
 {
-	return (RREG32(CC_DRM_ID_STRAPS) & CC_DRM_ID_STRAPS__ATI_REV_ID_MASK)
+	return (RREG32(mmCC_DRM_ID_STRAPS) & CC_DRM_ID_STRAPS__ATI_REV_ID_MASK)
 		>> CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT;
 }
 
@@ -2253,9 +2254,9 @@ static void si_pcie_gen3_enable(struct amdgpu_device *adev)
 					CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)))
 		return;
 
-	speed_cntl = RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL);
-	current_data_rate = (speed_cntl & LC_CURRENT_DATA_RATE_MASK) >>
-		LC_CURRENT_DATA_RATE_SHIFT;
+	speed_cntl = RREG32_PCIE_PORT(ixPCIE_LC_SPEED_CNTL);
+	current_data_rate = (speed_cntl & PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE_MASK) >>
+		PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE__SHIFT;
 	if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3) {
 		if (current_data_rate == 2) {
 			DRM_INFO("PCIE gen 3 link speeds already enabled\n");
@@ -2282,17 +2283,17 @@ static void si_pcie_gen3_enable(struct amdgpu_device *adev)
 			pcie_capability_set_word(root, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_HAWD);
 			pcie_capability_set_word(adev->pdev, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_HAWD);
 
-			tmp = RREG32_PCIE(PCIE_LC_STATUS1);
-			max_lw = (tmp & LC_DETECTED_LINK_WIDTH_MASK) >> LC_DETECTED_LINK_WIDTH_SHIFT;
-			current_lw = (tmp & LC_OPERATING_LINK_WIDTH_MASK) >> LC_OPERATING_LINK_WIDTH_SHIFT;
+			tmp = RREG32_PCIE(ixPCIE_LC_STATUS1);
+			max_lw = (tmp & PCIE_LC_STATUS1__LC_DETECTED_LINK_WIDTH_MASK) >> PCIE_LC_STATUS1__LC_DETECTED_LINK_WIDTH__SHIFT;
+			current_lw = (tmp & PCIE_LC_STATUS1__LC_OPERATING_LINK_WIDTH_MASK) >> PCIE_LC_STATUS1__LC_OPERATING_LINK_WIDTH__SHIFT;
 
 			if (current_lw < max_lw) {
-				tmp = RREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL);
-				if (tmp & LC_RENEGOTIATION_SUPPORT) {
-					tmp &= ~(LC_LINK_WIDTH_MASK | LC_UPCONFIGURE_DIS);
-					tmp |= (max_lw << LC_LINK_WIDTH_SHIFT);
-					tmp |= LC_UPCONFIGURE_SUPPORT | LC_RENEGOTIATE_EN | LC_RECONFIG_NOW;
-					WREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL, tmp);
+				tmp = RREG32_PCIE_PORT(ixPCIE_LC_LINK_WIDTH_CNTL);
+				if (tmp & PCIE_LC_LINK_WIDTH_CNTL__LC_RENEGOTIATION_SUPPORT_MASK) {
+					tmp &= ~(PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_MASK | PCIE_LC_LINK_WIDTH_CNTL__LC_UPCONFIGURE_DIS_MASK);
+					tmp |= (max_lw << PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH__SHIFT);
+					tmp |= PCIE_LC_LINK_WIDTH_CNTL__LC_UPCONFIGURE_SUPPORT_MASK | PCIE_LC_LINK_WIDTH_CNTL__LC_RENEGOTIATE_EN_MASK | PCIE_LC_LINK_WIDTH_CNTL__LC_RECONFIG_NOW_MASK;
+					WREG32_PCIE_PORT(ixPCIE_LC_LINK_WIDTH_CNTL, tmp);
 				}
 			}
 
@@ -2315,13 +2316,13 @@ static void si_pcie_gen3_enable(struct amdgpu_device *adev)
 							  PCI_EXP_LNKCTL2,
 							  &gpu_cfg2);
 
-				tmp = RREG32_PCIE_PORT(PCIE_LC_CNTL4);
-				tmp |= LC_SET_QUIESCE;
-				WREG32_PCIE_PORT(PCIE_LC_CNTL4, tmp);
+				tmp = RREG32_PCIE_PORT(ixPCIE_LC_CNTL4);
+				tmp |= PCIE_LC_CNTL4__LC_SET_QUIESCE_MASK;
+				WREG32_PCIE_PORT(ixPCIE_LC_CNTL4, tmp);
 
-				tmp = RREG32_PCIE_PORT(PCIE_LC_CNTL4);
-				tmp |= LC_REDO_EQ;
-				WREG32_PCIE_PORT(PCIE_LC_CNTL4, tmp);
+				tmp = RREG32_PCIE_PORT(ixPCIE_LC_CNTL4);
+				tmp |= PCIE_LC_CNTL4__LC_REDO_EQ_MASK;
+				WREG32_PCIE_PORT(ixPCIE_LC_CNTL4, tmp);
 
 				mdelay(100);
 
@@ -2347,16 +2348,16 @@ static void si_pcie_gen3_enable(struct amdgpu_device *adev)
 								   (PCI_EXP_LNKCTL2_ENTER_COMP |
 								    PCI_EXP_LNKCTL2_TX_MARGIN));
 
-				tmp = RREG32_PCIE_PORT(PCIE_LC_CNTL4);
-				tmp &= ~LC_SET_QUIESCE;
-				WREG32_PCIE_PORT(PCIE_LC_CNTL4, tmp);
+				tmp = RREG32_PCIE_PORT(ixPCIE_LC_CNTL4);
+				tmp &= ~PCIE_LC_CNTL4__LC_SET_QUIESCE_MASK;
+				WREG32_PCIE_PORT(ixPCIE_LC_CNTL4, tmp);
 			}
 		}
 	}
 
-	speed_cntl |= LC_FORCE_EN_SW_SPEED_CHANGE | LC_FORCE_DIS_HW_SPEED_CHANGE;
-	speed_cntl &= ~LC_FORCE_DIS_SW_SPEED_CHANGE;
-	WREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL, speed_cntl);
+	speed_cntl |= PCIE_LC_SPEED_CNTL__LC_FORCE_EN_SW_SPEED_CHANGE_MASK | PCIE_LC_SPEED_CNTL__LC_FORCE_DIS_HW_SPEED_CHANGE_MASK;
+	speed_cntl &= ~PCIE_LC_SPEED_CNTL__LC_FORCE_DIS_SW_SPEED_CHANGE_MASK;
+	WREG32_PCIE_PORT(ixPCIE_LC_SPEED_CNTL, speed_cntl);
 
 	tmp16 = 0;
 	if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)
@@ -2368,13 +2369,13 @@ static void si_pcie_gen3_enable(struct amdgpu_device *adev)
 	pcie_capability_clear_and_set_word(adev->pdev, PCI_EXP_LNKCTL2,
 					   PCI_EXP_LNKCTL2_TLS, tmp16);
 
-	speed_cntl = RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL);
-	speed_cntl |= LC_INITIATE_LINK_SPEED_CHANGE;
-	WREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL, speed_cntl);
+	speed_cntl = RREG32_PCIE_PORT(ixPCIE_LC_SPEED_CNTL);
+	speed_cntl |= PCIE_LC_SPEED_CNTL__LC_INITIATE_LINK_SPEED_CHANGE_MASK;
+	WREG32_PCIE_PORT(ixPCIE_LC_SPEED_CNTL, speed_cntl);
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		speed_cntl = RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL);
-		if ((speed_cntl & LC_INITIATE_LINK_SPEED_CHANGE) == 0)
+		speed_cntl = RREG32_PCIE_PORT(ixPCIE_LC_SPEED_CNTL);
+		if ((speed_cntl & PCIE_LC_SPEED_CNTL__LC_INITIATE_LINK_SPEED_CHANGE_MASK) == 0)
 			break;
 		udelay(1);
 	}
@@ -2432,121 +2433,121 @@ static void si_program_aspm(struct amdgpu_device *adev)
 	if (!amdgpu_device_should_use_aspm(adev))
 		return;
 
-	orig = data = RREG32_PCIE_PORT(PCIE_LC_N_FTS_CNTL);
-	data &= ~LC_XMIT_N_FTS_MASK;
-	data |= LC_XMIT_N_FTS(0x24) | LC_XMIT_N_FTS_OVERRIDE_EN;
+	orig = data = RREG32_PCIE_PORT(ixPCIE_LC_N_FTS_CNTL);
+	data &= ~PCIE_LC_N_FTS_CNTL__LC_XMIT_N_FTS_MASK;
+	data |= (0x24 << PCIE_LC_N_FTS_CNTL__LC_XMIT_N_FTS__SHIFT) | PCIE_LC_N_FTS_CNTL__LC_XMIT_N_FTS_OVERRIDE_EN_MASK;
 	if (orig != data)
-		WREG32_PCIE_PORT(PCIE_LC_N_FTS_CNTL, data);
+		WREG32_PCIE_PORT(ixPCIE_LC_N_FTS_CNTL, data);
 
-	orig = data = RREG32_PCIE_PORT(PCIE_LC_CNTL3);
-	data |= LC_GO_TO_RECOVERY;
+	orig = data = RREG32_PCIE_PORT(ixPCIE_LC_CNTL3);
+	data |= PCIE_LC_CNTL3__LC_GO_TO_RECOVERY_MASK;
 	if (orig != data)
-		WREG32_PCIE_PORT(PCIE_LC_CNTL3, data);
+		WREG32_PCIE_PORT(ixPCIE_LC_CNTL3, data);
 
-	orig = data = RREG32_PCIE(PCIE_P_CNTL);
-	data |= P_IGNORE_EDB_ERR;
+	orig = data = RREG32_PCIE(ixPCIE_P_CNTL);
+	data |= PCIE_P_CNTL__P_IGNORE_EDB_ERR_MASK;
 	if (orig != data)
-		WREG32_PCIE(PCIE_P_CNTL, data);
+		WREG32_PCIE(ixPCIE_P_CNTL, data);
 
-	orig = data = RREG32_PCIE_PORT(PCIE_LC_CNTL);
-	data &= ~(LC_L0S_INACTIVITY_MASK | LC_L1_INACTIVITY_MASK);
-	data |= LC_PMI_TO_L1_DIS;
+	orig = data = RREG32_PCIE_PORT(ixPCIE_LC_CNTL);
+	data &= ~(PCIE_LC_CNTL__LC_L0S_INACTIVITY_MASK | PCIE_LC_CNTL__LC_L1_INACTIVITY_MASK);
+	data |= PCIE_LC_CNTL__LC_PMI_TO_L1_DIS_MASK;
 	if (!disable_l0s)
-		data |= LC_L0S_INACTIVITY(7);
+		data |= (7 << PCIE_LC_CNTL__LC_L0S_INACTIVITY__SHIFT);
 
 	if (!disable_l1) {
-		data |= LC_L1_INACTIVITY(7);
-		data &= ~LC_PMI_TO_L1_DIS;
+		data |= (7 << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT);
+		data &= ~PCIE_LC_CNTL__LC_PMI_TO_L1_DIS_MASK;
 		if (orig != data)
-			WREG32_PCIE_PORT(PCIE_LC_CNTL, data);
+			WREG32_PCIE_PORT(ixPCIE_LC_CNTL, data);
 
 		if (!disable_plloff_in_l1) {
 			bool clk_req_support;
 
-			orig = data = si_pif_phy0_rreg(adev,PB0_PIF_PWRDOWN_0);
-			data &= ~(PLL_POWER_STATE_IN_OFF_0_MASK | PLL_POWER_STATE_IN_TXS2_0_MASK);
-			data |= PLL_POWER_STATE_IN_OFF_0(7) | PLL_POWER_STATE_IN_TXS2_0(7);
+			orig = data = si_pif_phy0_rreg(adev,ixPB0_PIF_PWRDOWN_0);
+			data &= ~(PB0_PIF_PWRDOWN_0__PLL_POWER_STATE_IN_OFF_0_MASK | PB0_PIF_PWRDOWN_0__PLL_POWER_STATE_IN_TXS2_0_MASK);
+			data |= (7 << PB0_PIF_PWRDOWN_0__PLL_POWER_STATE_IN_OFF_0__SHIFT) | (7 << PB0_PIF_PWRDOWN_0__PLL_POWER_STATE_IN_TXS2_0__SHIFT);
 			if (orig != data)
-				si_pif_phy0_wreg(adev,PB0_PIF_PWRDOWN_0, data);
+				si_pif_phy0_wreg(adev,ixPB0_PIF_PWRDOWN_0, data);
 
-			orig = data = si_pif_phy0_rreg(adev,PB0_PIF_PWRDOWN_1);
-			data &= ~(PLL_POWER_STATE_IN_OFF_1_MASK | PLL_POWER_STATE_IN_TXS2_1_MASK);
-			data |= PLL_POWER_STATE_IN_OFF_1(7) | PLL_POWER_STATE_IN_TXS2_1(7);
+			orig = data = si_pif_phy0_rreg(adev,ixPB0_PIF_PWRDOWN_1);
+			data &= ~(PB0_PIF_PWRDOWN_1__PLL_POWER_STATE_IN_OFF_1_MASK | PB0_PIF_PWRDOWN_1__PLL_POWER_STATE_IN_TXS2_1_MASK);
+			data |= (7 << PB0_PIF_PWRDOWN_1__PLL_POWER_STATE_IN_OFF_1__SHIFT) | (7 << PB0_PIF_PWRDOWN_1__PLL_POWER_STATE_IN_TXS2_1__SHIFT);
 			if (orig != data)
-				si_pif_phy0_wreg(adev,PB0_PIF_PWRDOWN_1, data);
+				si_pif_phy0_wreg(adev,ixPB0_PIF_PWRDOWN_1, data);
 
-			orig = data = si_pif_phy1_rreg(adev,PB1_PIF_PWRDOWN_0);
-			data &= ~(PLL_POWER_STATE_IN_OFF_0_MASK | PLL_POWER_STATE_IN_TXS2_0_MASK);
-			data |= PLL_POWER_STATE_IN_OFF_0(7) | PLL_POWER_STATE_IN_TXS2_0(7);
+			orig = data = si_pif_phy1_rreg(adev,ixPB1_PIF_PWRDOWN_0);
+			data &= ~(PB1_PIF_PWRDOWN_0__PLL_POWER_STATE_IN_OFF_0_MASK | PB1_PIF_PWRDOWN_0__PLL_POWER_STATE_IN_TXS2_0_MASK);
+			data |= (7 << PB1_PIF_PWRDOWN_0__PLL_POWER_STATE_IN_OFF_0__SHIFT) | (7 << PB1_PIF_PWRDOWN_0__PLL_POWER_STATE_IN_TXS2_0__SHIFT);
 			if (orig != data)
-				si_pif_phy1_wreg(adev,PB1_PIF_PWRDOWN_0, data);
+				si_pif_phy1_wreg(adev,ixPB1_PIF_PWRDOWN_0, data);
 
-			orig = data = si_pif_phy1_rreg(adev,PB1_PIF_PWRDOWN_1);
-			data &= ~(PLL_POWER_STATE_IN_OFF_1_MASK | PLL_POWER_STATE_IN_TXS2_1_MASK);
-			data |= PLL_POWER_STATE_IN_OFF_1(7) | PLL_POWER_STATE_IN_TXS2_1(7);
+			orig = data = si_pif_phy1_rreg(adev,ixPB1_PIF_PWRDOWN_1);
+			data &= ~(PB1_PIF_PWRDOWN_1__PLL_POWER_STATE_IN_OFF_1_MASK | PB1_PIF_PWRDOWN_1__PLL_POWER_STATE_IN_TXS2_1_MASK);
+			data |= (7 << PB1_PIF_PWRDOWN_1__PLL_POWER_STATE_IN_OFF_1__SHIFT) | (7 << PB1_PIF_PWRDOWN_1__PLL_POWER_STATE_IN_TXS2_1__SHIFT);
 			if (orig != data)
-				si_pif_phy1_wreg(adev,PB1_PIF_PWRDOWN_1, data);
+				si_pif_phy1_wreg(adev,ixPB1_PIF_PWRDOWN_1, data);
 
 			if ((adev->asic_type != CHIP_OLAND) && (adev->asic_type != CHIP_HAINAN)) {
-				orig = data = si_pif_phy0_rreg(adev,PB0_PIF_PWRDOWN_0);
-				data &= ~PLL_RAMP_UP_TIME_0_MASK;
+				orig = data = si_pif_phy0_rreg(adev,ixPB0_PIF_PWRDOWN_0);
+				data &= ~PB0_PIF_PWRDOWN_0__PLL_RAMP_UP_TIME_0_MASK;
 				if (orig != data)
-					si_pif_phy0_wreg(adev,PB0_PIF_PWRDOWN_0, data);
+					si_pif_phy0_wreg(adev,ixPB0_PIF_PWRDOWN_0, data);
 
-				orig = data = si_pif_phy0_rreg(adev,PB0_PIF_PWRDOWN_1);
-				data &= ~PLL_RAMP_UP_TIME_1_MASK;
+				orig = data = si_pif_phy0_rreg(adev,ixPB0_PIF_PWRDOWN_1);
+				data &= ~PB0_PIF_PWRDOWN_1__PLL_RAMP_UP_TIME_1_MASK;
 				if (orig != data)
-					si_pif_phy0_wreg(adev,PB0_PIF_PWRDOWN_1, data);
+					si_pif_phy0_wreg(adev,ixPB0_PIF_PWRDOWN_1, data);
 
-				orig = data = si_pif_phy0_rreg(adev,PB0_PIF_PWRDOWN_2);
-				data &= ~PLL_RAMP_UP_TIME_2_MASK;
+				orig = data = si_pif_phy0_rreg(adev,ixPB0_PIF_PWRDOWN_2);
+				data &= ~PB0_PIF_PWRDOWN_2__PLL_RAMP_UP_TIME_2_MASK;
 				if (orig != data)
-					si_pif_phy0_wreg(adev,PB0_PIF_PWRDOWN_2, data);
+					si_pif_phy0_wreg(adev,ixPB0_PIF_PWRDOWN_2, data);
 
-				orig = data = si_pif_phy0_rreg(adev,PB0_PIF_PWRDOWN_3);
-				data &= ~PLL_RAMP_UP_TIME_3_MASK;
+				orig = data = si_pif_phy0_rreg(adev,ixPB0_PIF_PWRDOWN_3);
+				data &= ~PB0_PIF_PWRDOWN_3__PLL_RAMP_UP_TIME_3_MASK;
 				if (orig != data)
-					si_pif_phy0_wreg(adev,PB0_PIF_PWRDOWN_3, data);
+					si_pif_phy0_wreg(adev,ixPB0_PIF_PWRDOWN_3, data);
 
-				orig = data = si_pif_phy1_rreg(adev,PB1_PIF_PWRDOWN_0);
-				data &= ~PLL_RAMP_UP_TIME_0_MASK;
+				orig = data = si_pif_phy1_rreg(adev,ixPB1_PIF_PWRDOWN_0);
+				data &= ~PB1_PIF_PWRDOWN_0__PLL_RAMP_UP_TIME_0_MASK;
 				if (orig != data)
-					si_pif_phy1_wreg(adev,PB1_PIF_PWRDOWN_0, data);
+					si_pif_phy1_wreg(adev,ixPB1_PIF_PWRDOWN_0, data);
 
-				orig = data = si_pif_phy1_rreg(adev,PB1_PIF_PWRDOWN_1);
-				data &= ~PLL_RAMP_UP_TIME_1_MASK;
+				orig = data = si_pif_phy1_rreg(adev,ixPB1_PIF_PWRDOWN_1);
+				data &= ~PB1_PIF_PWRDOWN_1__PLL_RAMP_UP_TIME_1_MASK;
 				if (orig != data)
-					si_pif_phy1_wreg(adev,PB1_PIF_PWRDOWN_1, data);
+					si_pif_phy1_wreg(adev,ixPB1_PIF_PWRDOWN_1, data);
 
-				orig = data = si_pif_phy1_rreg(adev,PB1_PIF_PWRDOWN_2);
-				data &= ~PLL_RAMP_UP_TIME_2_MASK;
+				orig = data = si_pif_phy1_rreg(adev,ixPB1_PIF_PWRDOWN_2);
+				data &= ~PB1_PIF_PWRDOWN_2__PLL_RAMP_UP_TIME_2_MASK;
 				if (orig != data)
-					si_pif_phy1_wreg(adev,PB1_PIF_PWRDOWN_2, data);
+					si_pif_phy1_wreg(adev,ixPB1_PIF_PWRDOWN_2, data);
 
-				orig = data = si_pif_phy1_rreg(adev,PB1_PIF_PWRDOWN_3);
-				data &= ~PLL_RAMP_UP_TIME_3_MASK;
+				orig = data = si_pif_phy1_rreg(adev,ixPB1_PIF_PWRDOWN_3);
+				data &= ~PB1_PIF_PWRDOWN_3__PLL_RAMP_UP_TIME_3_MASK;
 				if (orig != data)
-					si_pif_phy1_wreg(adev,PB1_PIF_PWRDOWN_3, data);
+					si_pif_phy1_wreg(adev,ixPB1_PIF_PWRDOWN_3, data);
 			}
-			orig = data = RREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL);
-			data &= ~LC_DYN_LANES_PWR_STATE_MASK;
-			data |= LC_DYN_LANES_PWR_STATE(3);
+			orig = data = RREG32_PCIE_PORT(ixPCIE_LC_LINK_WIDTH_CNTL);
+			data &= ~PCIE_LC_LINK_WIDTH_CNTL__LC_DYN_LANES_PWR_STATE_MASK;
+			data |= (3 << PCIE_LC_LINK_WIDTH_CNTL__LC_DYN_LANES_PWR_STATE__SHIFT);
 			if (orig != data)
-				WREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL, data);
+				WREG32_PCIE_PORT(ixPCIE_LC_LINK_WIDTH_CNTL, data);
 
-			orig = data = si_pif_phy0_rreg(adev,PB0_PIF_CNTL);
-			data &= ~LS2_EXIT_TIME_MASK;
+			orig = data = si_pif_phy0_rreg(adev,ixPB0_PIF_CNTL);
+			data &= ~PB0_PIF_CNTL__LS2_EXIT_TIME_MASK;
 			if ((adev->asic_type == CHIP_OLAND) || (adev->asic_type == CHIP_HAINAN))
-				data |= LS2_EXIT_TIME(5);
+				data |= (5 << PB0_PIF_CNTL__LS2_EXIT_TIME__SHIFT);
 			if (orig != data)
-				si_pif_phy0_wreg(adev,PB0_PIF_CNTL, data);
+				si_pif_phy0_wreg(adev,ixPB0_PIF_CNTL, data);
 
-			orig = data = si_pif_phy1_rreg(adev,PB1_PIF_CNTL);
-			data &= ~LS2_EXIT_TIME_MASK;
+			orig = data = si_pif_phy1_rreg(adev,ixPB1_PIF_CNTL);
+			data &= ~PB1_PIF_CNTL__LS2_EXIT_TIME_MASK;
 			if ((adev->asic_type == CHIP_OLAND) || (adev->asic_type == CHIP_HAINAN))
-				data |= LS2_EXIT_TIME(5);
+				data |= (5 << PB1_PIF_CNTL__LS2_EXIT_TIME__SHIFT);
 			if (orig != data)
-				si_pif_phy1_wreg(adev,PB1_PIF_CNTL, data);
+				si_pif_phy1_wreg(adev,ixPB1_PIF_CNTL, data);
 
 			if (!disable_clkreq &&
 			    !pci_is_root_bus(adev->pdev->bus)) {
@@ -2562,64 +2563,64 @@ static void si_program_aspm(struct amdgpu_device *adev)
 			}
 
 			if (clk_req_support) {
-				orig = data = RREG32_PCIE_PORT(PCIE_LC_CNTL2);
-				data |= LC_ALLOW_PDWN_IN_L1 | LC_ALLOW_PDWN_IN_L23;
+				orig = data = RREG32_PCIE_PORT(ixPCIE_LC_CNTL2);
+				data |= PCIE_LC_CNTL2__LC_ALLOW_PDWN_IN_L1_MASK | PCIE_LC_CNTL2__LC_ALLOW_PDWN_IN_L23_MASK;
 				if (orig != data)
-					WREG32_PCIE_PORT(PCIE_LC_CNTL2, data);
+					WREG32_PCIE_PORT(ixPCIE_LC_CNTL2, data);
 
-				orig = data = RREG32(THM_CLK_CNTL);
-				data &= ~(CMON_CLK_SEL_MASK | TMON_CLK_SEL_MASK);
-				data |= CMON_CLK_SEL(1) | TMON_CLK_SEL(1);
+				orig = data = RREG32(ixTHM_CLK_CNTL);
+				data &= ~(THM_CLK_CNTL__CMON_CLK_SEL_MASK | THM_CLK_CNTL__TMON_CLK_SEL_MASK);
+				data |= (1 << THM_CLK_CNTL__CMON_CLK_SEL__SHIFT) | (1 << THM_CLK_CNTL__TMON_CLK_SEL__SHIFT);
 				if (orig != data)
-					WREG32(THM_CLK_CNTL, data);
+					WREG32(ixTHM_CLK_CNTL, data);
 
-				orig = data = RREG32(MISC_CLK_CNTL);
-				data &= ~(DEEP_SLEEP_CLK_SEL_MASK | ZCLK_SEL_MASK);
-				data |= DEEP_SLEEP_CLK_SEL(1) | ZCLK_SEL(1);
+				orig = data = RREG32(ixMISC_CLK_CNTL);
+				data &= ~(MISC_CLK_CNTL__DEEP_SLEEP_CLK_SEL_MASK | MISC_CLK_CNTL__ZCLK_SEL_MASK);
+				data |= (1 << MISC_CLK_CNTL__DEEP_SLEEP_CLK_SEL__SHIFT) | (1 << MISC_CLK_CNTL__ZCLK_SEL__SHIFT);
 				if (orig != data)
-					WREG32(MISC_CLK_CNTL, data);
+					WREG32(ixMISC_CLK_CNTL, data);
 
-				orig = data = RREG32(CG_CLKPIN_CNTL);
-				data &= ~BCLK_AS_XCLK;
+				orig = data = RREG32(ixCG_CLKPIN_CNTL);
+				data &= ~CG_CLKPIN_CNTL__BCLK_AS_XCLK_MASK;
 				if (orig != data)
-					WREG32(CG_CLKPIN_CNTL, data);
+					WREG32(ixCG_CLKPIN_CNTL, data);
 
-				orig = data = RREG32(CG_CLKPIN_CNTL_2);
-				data &= ~FORCE_BIF_REFCLK_EN;
+				orig = data = RREG32(ixCG_CLKPIN_CNTL_2);
+				data &= ~CG_CLKPIN_CNTL_2__FORCE_BIF_REFCLK_EN_MASK;
 				if (orig != data)
-					WREG32(CG_CLKPIN_CNTL_2, data);
+					WREG32(ixCG_CLKPIN_CNTL_2, data);
 
-				orig = data = RREG32(MPLL_BYPASSCLK_SEL);
-				data &= ~MPLL_CLKOUT_SEL_MASK;
-				data |= MPLL_CLKOUT_SEL(4);
+				orig = data = RREG32(ixMPLL_BYPASSCLK_SEL);
+				data &= ~MPLL_BYPASSCLK_SEL__MPLL_CLKOUT_SEL_MASK;
+				data |= 4 << MPLL_BYPASSCLK_SEL__MPLL_CLKOUT_SEL__SHIFT;
 				if (orig != data)
-					WREG32(MPLL_BYPASSCLK_SEL, data);
+					WREG32(ixMPLL_BYPASSCLK_SEL, data);
 
-				orig = data = RREG32(SPLL_CNTL_MODE);
-				data &= ~SPLL_REFCLK_SEL_MASK;
+				orig = data = RREG32(ixSPLL_CNTL_MODE);
+				data &= ~SPLL_CNTL_MODE__SPLL_REFCLK_SEL_MASK;
 				if (orig != data)
-					WREG32(SPLL_CNTL_MODE, data);
+					WREG32(ixSPLL_CNTL_MODE, data);
 			}
 		}
 	} else {
 		if (orig != data)
-			WREG32_PCIE_PORT(PCIE_LC_CNTL, data);
+			WREG32_PCIE_PORT(ixPCIE_LC_CNTL, data);
 	}
 
-	orig = data = RREG32_PCIE(PCIE_CNTL2);
-	data |= SLV_MEM_LS_EN | MST_MEM_LS_EN | REPLAY_MEM_LS_EN;
+	orig = data = RREG32_PCIE(ixPCIE_CNTL2);
+	data |= PCIE_CNTL2__SLV_MEM_LS_EN_MASK | PCIE_CNTL2__MST_MEM_LS_EN_MASK | PCIE_CNTL2__REPLAY_MEM_LS_EN_MASK;
 	if (orig != data)
-		WREG32_PCIE(PCIE_CNTL2, data);
+		WREG32_PCIE(ixPCIE_CNTL2, data);
 
 	if (!disable_l0s) {
-		data = RREG32_PCIE_PORT(PCIE_LC_N_FTS_CNTL);
-		if((data & LC_N_FTS_MASK) == LC_N_FTS_MASK) {
-			data = RREG32_PCIE(PCIE_LC_STATUS1);
-			if ((data & LC_REVERSE_XMIT) && (data & LC_REVERSE_RCVR)) {
-				orig = data = RREG32_PCIE_PORT(PCIE_LC_CNTL);
-				data &= ~LC_L0S_INACTIVITY_MASK;
+		data = RREG32_PCIE_PORT(ixPCIE_LC_N_FTS_CNTL);
+		if((data & PCIE_LC_N_FTS_CNTL__LC_N_FTS_MASK) == PCIE_LC_N_FTS_CNTL__LC_N_FTS_MASK) {
+			data = RREG32_PCIE(ixPCIE_LC_STATUS1);
+			if ((data & PCIE_LC_STATUS1__LC_REVERSE_XMIT_MASK) && (data & PCIE_LC_STATUS1__LC_REVERSE_RCVR_MASK)) {
+				orig = data = RREG32_PCIE_PORT(ixPCIE_LC_CNTL);
+				data &= ~PCIE_LC_CNTL__LC_L0S_INACTIVITY_MASK;
 				if (orig != data)
-					WREG32_PCIE_PORT(PCIE_LC_CNTL, data);
+					WREG32_PCIE_PORT(ixPCIE_LC_CNTL, data);
 			}
 		}
 	}
-- 
2.48.1


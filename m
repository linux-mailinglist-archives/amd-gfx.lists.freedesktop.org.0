Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A4A640AF
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Mar 2025 07:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0819810E328;
	Mon, 17 Mar 2025 06:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VefyDFyu";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6D210E31E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Mar 2025 06:07:33 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4768f90bf36so34052481cf.0
 for <amd-gfx@lists.freedesktop.org>; Sun, 16 Mar 2025 23:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742191652; x=1742796452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q657v9GSZYXlK74xnXDvwPysQHfDSX2B+IadisL9298=;
 b=VefyDFyusn1W+ys66H5Z7u+e39uAVz/31Ix6AFCRn2LoIjyAQPuOTxMF2ESMD1MV4G
 hitDifnP/LS9+p2yOkIjtvip78NCfHG0RT9+bclHhorIOlcEwKtYQ3n4vrpYx62+Jzy3
 xDWOw7LhNL69eaz730b3jjmx34moUGb8uwCEh7awZYX5Qz2vT1BB8ZkAwMraUTwq+Sqi
 8NJwtlcpso+qRx/EA4Jxip5koxsw0jQkIokm9DTPUpNCoO2LccxLAzGoADkUycO4BGIX
 dukktSkeRLshnImY6r+kGagKk6w5frdx7BNqJOy6GtxYgADucDZCmoDiQfbPaKvlTi4t
 mlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742191652; x=1742796452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q657v9GSZYXlK74xnXDvwPysQHfDSX2B+IadisL9298=;
 b=V5fdN2Zthwyul5AraDPLEzN3E0b4bsK8yn78KaKXQpP43cn0XWkKk5jtYgNpQo8qSY
 3c9HQNjzpWyiePdrAfIqKuLYpkpYbuf3uoEPMJUSAccLCuNFIHoCTvI4xgcyKqz6GS4y
 gA6oZNAVzPFLElpyHAjatO0hT6MMvZZ2WZREPPnKm0jFVZxdDxfemxudcZVfQQrpoppK
 r9h5rkS/GtWwMPj4GegiQrkXVHEq7lo0dA2CD8d2hN1gsNu1V0UXKH2v0h4FoP1sCIiF
 CCDeSHRKxXWGvtXeHTcKWh5a36GZCYKaQC7gQL+MfNMMSrSKjmdlyulPHQ0aXKr4ktVs
 qWkQ==
X-Gm-Message-State: AOJu0YxKHOEh91DUwoHpxbi01tprkZVKxiqEjxJWKLu5uzec0+vyvMXf
 SyN1OUq94a8y63TQESEV9VEIbadVAuzi55X5OWK+HEPepolWrQyFKUY39w==
X-Gm-Gg: ASbGncs4RDO2aUQKsXYgoAW6m3Rmx3883p4buvZOGCDEaic90vJoeRbI4/qK9XRrDfL
 AJDUy1H3DkUWNc8wQwlsvnk/HYxZLvZTCDP++qS1b6YTlByzM3DTzevG6Hzesg/U6FOYLoPkCF3
 FmDfKVYIRNomtBtzOdvkauO6CMCGZB8wRKk3rRERQvw1T6UXKZB473mEfFbV/YtHj8+8CC5rjCV
 BxIXbZqVMCL0eEqonjV4fms1Ww2In0CEX60heniDfLwUNN1sboxK344nVOqsW/E/VWMJUs9yjSq
 hxA2rAQ77B1iWWYrNK0tWlWpQNM8sgW4jUfwx6uW2XYspjVpmb2yLGnOytfBatxFh+U=
X-Google-Smtp-Source: AGHT+IEDCX65IiQSaT5SqXNPbsIT4cwAZ1vyubNP1BWPgJdibwHikEJoP8rfGe8AJ700iM096VSnEQ==
X-Received: by 2002:ac8:7f04:0:b0:476:b461:24a3 with SMTP id
 d75a77b69052e-476c8133f02mr200961241cf.3.1742191651713; 
 Sun, 16 Mar 2025 23:07:31 -0700 (PDT)
Received: from localhost.localdomain ([38.74.25.248])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-476bb7f4f08sm50605931cf.56.2025.03.16.23.07.30
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 23:07:31 -0700 (PDT)
From: Alexandre Demers <alexandre.f.demers@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/18] drm/pm/legacy-dpm: move SI away from sid.h and
 si_enums.h
Date: Mon, 17 Mar 2025 02:06:55 -0400
Message-ID: <20250317060702.5297-12-alexandre.f.demers@gmail.com>
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
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 338 +++++++++++----------
 drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c |  36 +--
 2 files changed, 190 insertions(+), 184 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 975912f285d7..0f34aaf773b7 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -2209,7 +2209,7 @@ static u32 si_calculate_cac_wintime(struct amdgpu_device *adev)
 	if (xclk == 0)
 		return 0;
 
-	cac_window = RREG32(CG_CAC_CTRL) & CAC_WINDOW_MASK;
+	cac_window = RREG32(ixCG_CAC_CTRL) & CG_CAC_CTRL__CAC_WINDOW_MASK;
 	cac_window_size = ((cac_window & 0xFFFF0000) >> 16) * (cac_window & 0x0000FFFF);
 
 	wintime = (cac_window_size * 100) / xclk;
@@ -2505,19 +2505,19 @@ static int si_populate_sq_ramping_values(struct amdgpu_device *adev,
 	if (adev->pm.dpm.sq_ramping_threshold == 0)
 		return -EINVAL;
 
-	if (SISLANDS_DPM2_SQ_RAMP_MAX_POWER > (MAX_POWER_MASK >> MAX_POWER_SHIFT))
+	if (SISLANDS_DPM2_SQ_RAMP_MAX_POWER > (SQ_POWER_THROTTLE__MAX_POWER_MASK >> SQ_POWER_THROTTLE__MAX_POWER__SHIFT))
 		enable_sq_ramping = false;
 
-	if (SISLANDS_DPM2_SQ_RAMP_MIN_POWER > (MIN_POWER_MASK >> MIN_POWER_SHIFT))
+	if (SISLANDS_DPM2_SQ_RAMP_MIN_POWER > (SQ_POWER_THROTTLE__MIN_POWER_MASK >> SQ_POWER_THROTTLE__MIN_POWER__SHIFT))
 		enable_sq_ramping = false;
 
-	if (SISLANDS_DPM2_SQ_RAMP_MAX_POWER_DELTA > (MAX_POWER_DELTA_MASK >> MAX_POWER_DELTA_SHIFT))
+	if (SISLANDS_DPM2_SQ_RAMP_MAX_POWER_DELTA > (SQ_POWER_THROTTLE2__MAX_POWER_DELTA_MASK >> SQ_POWER_THROTTLE2__MAX_POWER_DELTA__SHIFT))
 		enable_sq_ramping = false;
 
-	if (SISLANDS_DPM2_SQ_RAMP_STI_SIZE > (STI_SIZE_MASK >> STI_SIZE_SHIFT))
+	if (SISLANDS_DPM2_SQ_RAMP_STI_SIZE > (SQ_POWER_THROTTLE2__SHORT_TERM_INTERVAL_SIZE_MASK >> SQ_POWER_THROTTLE2__SHORT_TERM_INTERVAL_SIZE__SHIFT))
 		enable_sq_ramping = false;
 
-	if (SISLANDS_DPM2_SQ_RAMP_LTI_RATIO > (LTI_RATIO_MASK >> LTI_RATIO_SHIFT))
+	if (SISLANDS_DPM2_SQ_RAMP_LTI_RATIO > (SQ_POWER_THROTTLE2__LONG_TERM_INTERVAL_RATIO_MASK >> SQ_POWER_THROTTLE2__LONG_TERM_INTERVAL_RATIO__SHIFT))
 		enable_sq_ramping = false;
 
 	for (i = 0; i < state->performance_level_count; i++) {
@@ -2526,14 +2526,17 @@ static int si_populate_sq_ramping_values(struct amdgpu_device *adev,
 
 		if ((state->performance_levels[i].sclk >= adev->pm.dpm.sq_ramping_threshold) &&
 		    enable_sq_ramping) {
-			sq_power_throttle |= MAX_POWER(SISLANDS_DPM2_SQ_RAMP_MAX_POWER);
-			sq_power_throttle |= MIN_POWER(SISLANDS_DPM2_SQ_RAMP_MIN_POWER);
-			sq_power_throttle2 |= MAX_POWER_DELTA(SISLANDS_DPM2_SQ_RAMP_MAX_POWER_DELTA);
-			sq_power_throttle2 |= STI_SIZE(SISLANDS_DPM2_SQ_RAMP_STI_SIZE);
-			sq_power_throttle2 |= LTI_RATIO(SISLANDS_DPM2_SQ_RAMP_LTI_RATIO);
+			sq_power_throttle |= SISLANDS_DPM2_SQ_RAMP_MAX_POWER << SQ_POWER_THROTTLE__MAX_POWER__SHIFT;
+			sq_power_throttle |= SISLANDS_DPM2_SQ_RAMP_MIN_POWER << SQ_POWER_THROTTLE__MIN_POWER__SHIFT;
+			sq_power_throttle2 |= SISLANDS_DPM2_SQ_RAMP_MAX_POWER_DELTA << SQ_POWER_THROTTLE2__MAX_POWER_DELTA__SHIFT;
+			sq_power_throttle2 |= SISLANDS_DPM2_SQ_RAMP_STI_SIZE << SQ_POWER_THROTTLE2__SHORT_TERM_INTERVAL_SIZE__SHIFT;
+			sq_power_throttle2 |= SISLANDS_DPM2_SQ_RAMP_LTI_RATIO << SQ_POWER_THROTTLE2__LONG_TERM_INTERVAL_RATIO__SHIFT;
 		} else {
-			sq_power_throttle |= MAX_POWER_MASK | MIN_POWER_MASK;
-			sq_power_throttle2 |= MAX_POWER_DELTA_MASK | STI_SIZE_MASK | LTI_RATIO_MASK;
+			sq_power_throttle |= SQ_POWER_THROTTLE__MAX_POWER_MASK |
+								SQ_POWER_THROTTLE__MIN_POWER_MASK;
+			sq_power_throttle2 |= SQ_POWER_THROTTLE2__MAX_POWER_DELTA_MASK |
+								SQ_POWER_THROTTLE2__SHORT_TERM_INTERVAL_SIZE_MASK |
+								SQ_POWER_THROTTLE2__LONG_TERM_INTERVAL_RATIO_MASK;
 		}
 
 		smc_state->levels[i].SQPowerThrottle = cpu_to_be32(sq_power_throttle);
@@ -2777,9 +2780,9 @@ static int si_initialize_smc_cac_tables(struct amdgpu_device *adev)
 	if (!cac_tables)
 		return -ENOMEM;
 
-	reg = RREG32(CG_CAC_CTRL) & ~CAC_WINDOW_MASK;
-	reg |= CAC_WINDOW(si_pi->powertune_data->cac_window);
-	WREG32(CG_CAC_CTRL, reg);
+	reg = RREG32(ixCG_CAC_CTRL) & ~CG_CAC_CTRL__CAC_WINDOW_MASK;
+	reg |= (si_pi->powertune_data->cac_window << CG_CAC_CTRL__CAC_WINDOW__SHIFT);
+	WREG32(ixCG_CAC_CTRL, reg);
 
 	si_pi->dyn_powertune_data.cac_leakage = adev->pm.dpm.cac_leakage;
 	si_pi->dyn_powertune_data.dc_pwr_value =
@@ -2978,10 +2981,10 @@ static int si_init_smc_spll_table(struct amdgpu_device *adev)
 		ret = si_calculate_sclk_params(adev, sclk, &sclk_params);
 		if (ret)
 			break;
-		p_div = (sclk_params.vCG_SPLL_FUNC_CNTL & SPLL_PDIV_A_MASK) >> SPLL_PDIV_A_SHIFT;
-		fb_div = (sclk_params.vCG_SPLL_FUNC_CNTL_3 & SPLL_FB_DIV_MASK) >> SPLL_FB_DIV_SHIFT;
-		clk_s = (sclk_params.vCG_SPLL_SPREAD_SPECTRUM & CLK_S_MASK) >> CLK_S_SHIFT;
-		clk_v = (sclk_params.vCG_SPLL_SPREAD_SPECTRUM_2 & CLK_V_MASK) >> CLK_V_SHIFT;
+		p_div = (sclk_params.vCG_SPLL_FUNC_CNTL & CG_SPLL_FUNC_CNTL__SPLL_PDIV_A_MASK) >> CG_SPLL_FUNC_CNTL__SPLL_PDIV_A__SHIFT;
+		fb_div = (sclk_params.vCG_SPLL_FUNC_CNTL_3 & CG_SPLL_FUNC_CNTL_3__SPLL_FB_DIV_MASK) >> CG_SPLL_FUNC_CNTL_3__SPLL_FB_DIV__SHIFT;
+		clk_s = (sclk_params.vCG_SPLL_SPREAD_SPECTRUM & CG_SPLL_SPREAD_SPECTRUM__CLK_S_MASK) >> CG_SPLL_SPREAD_SPECTRUM__CLK_S__SHIFT;
+		clk_v = (sclk_params.vCG_SPLL_SPREAD_SPECTRUM_2 & CG_SPLL_SPREAD_SPECTRUM_2__CLK_V_MASK) >> CG_SPLL_SPREAD_SPECTRUM_2__CLK_V__SHIFT;
 
 		fb_div &= ~0x00001FFF;
 		fb_div >>= 1;
@@ -3685,10 +3688,10 @@ static bool si_is_special_1gb_platform(struct amdgpu_device *adev)
 	WREG32(MC_SEQ_IO_DEBUG_INDEX, 0xb);
 	width = ((RREG32(MC_SEQ_IO_DEBUG_DATA) >> 1) & 1) ? 16 : 32;
 
-	tmp = RREG32(MC_ARB_RAMCFG);
-	row = ((tmp & NOOFROWS_MASK) >> NOOFROWS_SHIFT) + 10;
-	column = ((tmp & NOOFCOLS_MASK) >> NOOFCOLS_SHIFT) + 8;
-	bank = ((tmp & NOOFBANK_MASK) >> NOOFBANK_SHIFT) + 2;
+	tmp = RREG32(mmMC_ARB_RAMCFG);
+	row = ((tmp & MC_ARB_RAMCFG__NOOFROWS_MASK) >> MC_ARB_RAMCFG__NOOFROWS__SHIFT) + 10;
+	column = ((tmp & MC_ARB_RAMCFG__NOOFCOLS_MASK) >> MC_ARB_RAMCFG__NOOFCOLS__SHIFT) + 8;
+	bank = ((tmp & MC_ARB_RAMCFG__NOOFBANK_MASK) >> MC_ARB_RAMCFG__NOOFBANK__SHIFT) + 2;
 
 	density = (1 << (row + column - 20 + bank)) * width;
 
@@ -3772,11 +3775,11 @@ static void si_set_dpm_event_sources(struct amdgpu_device *adev, u32 sources)
 	}
 
 	if (want_thermal_protection) {
-		WREG32_P(CG_THERMAL_CTRL, DPM_EVENT_SRC(dpm_event_src), ~DPM_EVENT_SRC_MASK);
+		WREG32_P(ixCG_THERMAL_CTRL, dpm_event_src << CG_THERMAL_CTRL__DPM_EVENT_SRC__SHIFT, ~CG_THERMAL_CTRL__DPM_EVENT_SRC_MASK);
 		if (pi->thermal_protection)
-			WREG32_P(GENERAL_PWRMGT, 0, ~THERMAL_PROTECTION_DIS);
+			WREG32_P(ixGENERAL_PWRMGT, 0, ~GENERAL_PWRMGT__THERMAL_PROTECTION_DIS_MASK);
 	} else {
-		WREG32_P(GENERAL_PWRMGT, THERMAL_PROTECTION_DIS, ~THERMAL_PROTECTION_DIS);
+		WREG32_P(ixGENERAL_PWRMGT, GENERAL_PWRMGT__THERMAL_PROTECTION_DIS_MASK, ~GENERAL_PWRMGT__THERMAL_PROTECTION_DIS_MASK);
 	}
 }
 
@@ -3801,20 +3804,20 @@ static void si_enable_auto_throttle_source(struct amdgpu_device *adev,
 
 static void si_start_dpm(struct amdgpu_device *adev)
 {
-	WREG32_P(GENERAL_PWRMGT, GLOBAL_PWRMGT_EN, ~GLOBAL_PWRMGT_EN);
+	WREG32_P(ixGENERAL_PWRMGT, GENERAL_PWRMGT__GLOBAL_PWRMGT_EN_MASK, ~GENERAL_PWRMGT__GLOBAL_PWRMGT_EN_MASK);
 }
 
 static void si_stop_dpm(struct amdgpu_device *adev)
 {
-	WREG32_P(GENERAL_PWRMGT, 0, ~GLOBAL_PWRMGT_EN);
+	WREG32_P(ixGENERAL_PWRMGT, 0, ~GENERAL_PWRMGT__GLOBAL_PWRMGT_EN_MASK);
 }
 
 static void si_enable_sclk_control(struct amdgpu_device *adev, bool enable)
 {
 	if (enable)
-		WREG32_P(SCLK_PWRMGT_CNTL, 0, ~SCLK_PWRMGT_OFF);
+		WREG32_P(ixSCLK_PWRMGT_CNTL, 0, ~SCLK_PWRMGT_CNTL__SCLK_PWRMGT_OFF_MASK);
 	else
-		WREG32_P(SCLK_PWRMGT_CNTL, SCLK_PWRMGT_OFF, ~SCLK_PWRMGT_OFF);
+		WREG32_P(ixSCLK_PWRMGT_CNTL, SCLK_PWRMGT_CNTL__SCLK_PWRMGT_OFF_MASK, ~SCLK_PWRMGT_CNTL__SCLK_PWRMGT_OFF_MASK);
 
 }
 
@@ -3854,7 +3857,7 @@ static int si_notify_hw_of_powersource(struct amdgpu_device *adev, bool ac_power
 static PPSMC_Result si_send_msg_to_smc_with_parameter(struct amdgpu_device *adev,
 						      PPSMC_Msg msg, u32 parameter)
 {
-	WREG32(SMC_SCRATCH0, parameter);
+	WREG32(ixSMC_SCRATCH0, parameter);
 	return amdgpu_si_send_msg_to_smc(adev, msg);
 }
 
@@ -4039,12 +4042,12 @@ static void si_read_clock_registers(struct amdgpu_device *adev)
 {
 	struct si_power_info *si_pi = si_get_pi(adev);
 
-	si_pi->clock_registers.cg_spll_func_cntl = RREG32(CG_SPLL_FUNC_CNTL);
-	si_pi->clock_registers.cg_spll_func_cntl_2 = RREG32(CG_SPLL_FUNC_CNTL_2);
-	si_pi->clock_registers.cg_spll_func_cntl_3 = RREG32(CG_SPLL_FUNC_CNTL_3);
-	si_pi->clock_registers.cg_spll_func_cntl_4 = RREG32(CG_SPLL_FUNC_CNTL_4);
-	si_pi->clock_registers.cg_spll_spread_spectrum = RREG32(CG_SPLL_SPREAD_SPECTRUM);
-	si_pi->clock_registers.cg_spll_spread_spectrum_2 = RREG32(CG_SPLL_SPREAD_SPECTRUM_2);
+	si_pi->clock_registers.cg_spll_func_cntl = RREG32(ixCG_SPLL_FUNC_CNTL);
+	si_pi->clock_registers.cg_spll_func_cntl_2 = RREG32(ixCG_SPLL_FUNC_CNTL_2);
+	si_pi->clock_registers.cg_spll_func_cntl_3 = RREG32(ixCG_SPLL_FUNC_CNTL_3);
+	si_pi->clock_registers.cg_spll_func_cntl_4 = RREG32(ixCG_SPLL_FUNC_CNTL_4);
+	si_pi->clock_registers.cg_spll_spread_spectrum = RREG32(ixCG_SPLL_SPREAD_SPECTRUM);
+	si_pi->clock_registers.cg_spll_spread_spectrum_2 = RREG32(ixCG_SPLL_SPREAD_SPECTRUM_2);
 	si_pi->clock_registers.dll_cntl = RREG32(DLL_CNTL);
 	si_pi->clock_registers.mclk_pwrmgt_cntl = RREG32(MCLK_PWRMGT_CNTL);
 	si_pi->clock_registers.mpll_ad_func_cntl = RREG32(MPLL_AD_FUNC_CNTL);
@@ -4060,14 +4063,14 @@ static void si_enable_thermal_protection(struct amdgpu_device *adev,
 					  bool enable)
 {
 	if (enable)
-		WREG32_P(GENERAL_PWRMGT, 0, ~THERMAL_PROTECTION_DIS);
+		WREG32_P(ixGENERAL_PWRMGT, 0, ~GENERAL_PWRMGT__THERMAL_PROTECTION_DIS_MASK);
 	else
-		WREG32_P(GENERAL_PWRMGT, THERMAL_PROTECTION_DIS, ~THERMAL_PROTECTION_DIS);
+		WREG32_P(ixGENERAL_PWRMGT, GENERAL_PWRMGT__THERMAL_PROTECTION_DIS_MASK, ~GENERAL_PWRMGT__THERMAL_PROTECTION_DIS_MASK);
 }
 
 static void si_enable_acpi_power_management(struct amdgpu_device *adev)
 {
-	WREG32_P(GENERAL_PWRMGT, STATIC_PM_EN, ~STATIC_PM_EN);
+	WREG32_P(ixGENERAL_PWRMGT, GENERAL_PWRMGT__STATIC_PM_EN_MASK, ~GENERAL_PWRMGT__STATIC_PM_EN_MASK);
 }
 
 #if 0
@@ -4148,9 +4151,9 @@ static void si_program_ds_registers(struct amdgpu_device *adev)
 		tmp = 0x1;
 
 	if (eg_pi->sclk_deep_sleep) {
-		WREG32_P(MISC_CLK_CNTL, DEEP_SLEEP_CLK_SEL(tmp), ~DEEP_SLEEP_CLK_SEL_MASK);
-		WREG32_P(CG_SPLL_AUTOSCALE_CNTL, AUTOSCALE_ON_SS_CLEAR,
-			 ~AUTOSCALE_ON_SS_CLEAR);
+		WREG32_P(ixMISC_CLK_CNTL, (tmp << MISC_CLK_CNTL__DEEP_SLEEP_CLK_SEL__SHIFT), ~MISC_CLK_CNTL__DEEP_SLEEP_CLK_SEL_MASK);
+		WREG32_P(ixCG_SPLL_AUTOSCALE_CNTL, CG_SPLL_AUTOSCALE_CNTL__AUTOSCALE_ON_SS_CLEAR_MASK,
+			 ~CG_SPLL_AUTOSCALE_CNTL__AUTOSCALE_ON_SS_CLEAR_MASK);
 	}
 }
 
@@ -4159,18 +4162,18 @@ static void si_program_display_gap(struct amdgpu_device *adev)
 	u32 tmp, pipe;
 	int i;
 
-	tmp = RREG32(CG_DISPLAY_GAP_CNTL) & ~(DISP1_GAP_MASK | DISP2_GAP_MASK);
+	tmp = RREG32(ixCG_DISPLAY_GAP_CNTL) & ~(CG_DISPLAY_GAP_CNTL__DISP1_GAP_MASK | CG_DISPLAY_GAP_CNTL__DISP2_GAP_MASK);
 	if (adev->pm.dpm.new_active_crtc_count > 0)
-		tmp |= DISP1_GAP(R600_PM_DISPLAY_GAP_VBLANK_OR_WM);
+		tmp |= R600_PM_DISPLAY_GAP_VBLANK_OR_WM << CG_DISPLAY_GAP_CNTL__DISP1_GAP__SHIFT;
 	else
-		tmp |= DISP1_GAP(R600_PM_DISPLAY_GAP_IGNORE);
+		tmp |= R600_PM_DISPLAY_GAP_IGNORE << CG_DISPLAY_GAP_CNTL__DISP1_GAP__SHIFT;
 
 	if (adev->pm.dpm.new_active_crtc_count > 1)
-		tmp |= DISP2_GAP(R600_PM_DISPLAY_GAP_VBLANK_OR_WM);
+		tmp |= R600_PM_DISPLAY_GAP_VBLANK_OR_WM << CG_DISPLAY_GAP_CNTL__DISP2_GAP__SHIFT;
 	else
-		tmp |= DISP2_GAP(R600_PM_DISPLAY_GAP_IGNORE);
+		tmp |= R600_PM_DISPLAY_GAP_IGNORE << CG_DISPLAY_GAP_CNTL__DISP2_GAP__SHIFT;
 
-	WREG32(CG_DISPLAY_GAP_CNTL, tmp);
+	WREG32(ixCG_DISPLAY_GAP_CNTL, tmp);
 
 	tmp = RREG32(DCCG_DISP_SLOW_SELECT_REG);
 	pipe = (tmp & DCCG_DISP1_SLOW_SELECT_MASK) >> DCCG_DISP1_SLOW_SELECT_SHIFT;
@@ -4205,10 +4208,10 @@ static void si_enable_spread_spectrum(struct amdgpu_device *adev, bool enable)
 
 	if (enable) {
 		if (pi->sclk_ss)
-			WREG32_P(GENERAL_PWRMGT, DYN_SPREAD_SPECTRUM_EN, ~DYN_SPREAD_SPECTRUM_EN);
+			WREG32_P(ixGENERAL_PWRMGT, GENERAL_PWRMGT__DYN_SPREAD_SPECTRUM_EN_MASK, ~GENERAL_PWRMGT__DYN_SPREAD_SPECTRUM_EN_MASK);
 	} else {
-		WREG32_P(CG_SPLL_SPREAD_SPECTRUM, 0, ~SSEN);
-		WREG32_P(GENERAL_PWRMGT, 0, ~DYN_SPREAD_SPECTRUM_EN);
+		WREG32_P(ixCG_SPLL_SPREAD_SPECTRUM, 0, ~CG_SPLL_SPREAD_SPECTRUM__SSEN_MASK);
+		WREG32_P(ixGENERAL_PWRMGT, 0, ~GENERAL_PWRMGT__DYN_SPREAD_SPECTRUM_EN_MASK);
 	}
 }
 
@@ -4230,15 +4233,15 @@ static void si_setup_bsp(struct amdgpu_device *adev)
 			       &pi->pbsu);
 
 
-        pi->dsp = BSP(pi->bsp) | BSU(pi->bsu);
-	pi->psp = BSP(pi->pbsp) | BSU(pi->pbsu);
+        pi->dsp = (pi->bsp << CG_BSP__BSP__SHIFT) | (pi->bsu << CG_BSP__BSU__SHIFT);
+	pi->psp = (pi->pbsp << CG_BSP__BSP__SHIFT) | (pi->pbsu << CG_BSP__BSU__SHIFT);
 
-	WREG32(CG_BSP, pi->dsp);
+	WREG32(ixCG_BSP, pi->dsp);
 }
 
 static void si_program_git(struct amdgpu_device *adev)
 {
-	WREG32_P(CG_GIT, CG_GICST(R600_GICST_DFLT), ~CG_GICST_MASK);
+	WREG32_P(ixCG_GIT, R600_GICST_DFLT << CG_GIT__CG_GICST__SHIFT, ~CG_GIT__CG_GICST_MASK);
 }
 
 static void si_program_tp(struct amdgpu_device *adev)
@@ -4247,54 +4250,54 @@ static void si_program_tp(struct amdgpu_device *adev)
 	enum r600_td td = R600_TD_DFLT;
 
 	for (i = 0; i < R600_PM_NUMBER_OF_TC; i++)
-		WREG32(CG_FFCT_0 + i, (UTC_0(r600_utc[i]) | DTC_0(r600_dtc[i])));
+		WREG32(ixCG_FFCT_0 + i, (r600_utc[i] << CG_FFCT_0__UTC_0__SHIFT | r600_dtc[i] << CG_FFCT_0__DTC_0__SHIFT));
 
 	if (td == R600_TD_AUTO)
-		WREG32_P(SCLK_PWRMGT_CNTL, 0, ~FIR_FORCE_TREND_SEL);
+		WREG32_P(ixSCLK_PWRMGT_CNTL, 0, ~SCLK_PWRMGT_CNTL__FIR_FORCE_TREND_SEL_MASK);
 	else
-		WREG32_P(SCLK_PWRMGT_CNTL, FIR_FORCE_TREND_SEL, ~FIR_FORCE_TREND_SEL);
+		WREG32_P(ixSCLK_PWRMGT_CNTL, SCLK_PWRMGT_CNTL__FIR_FORCE_TREND_SEL_MASK, ~SCLK_PWRMGT_CNTL__FIR_FORCE_TREND_SEL_MASK);
 
 	if (td == R600_TD_UP)
-		WREG32_P(SCLK_PWRMGT_CNTL, 0, ~FIR_TREND_MODE);
+		WREG32_P(ixSCLK_PWRMGT_CNTL, 0, ~SCLK_PWRMGT_CNTL__FIR_TREND_MODE_MASK);
 
 	if (td == R600_TD_DOWN)
-		WREG32_P(SCLK_PWRMGT_CNTL, FIR_TREND_MODE, ~FIR_TREND_MODE);
+		WREG32_P(ixSCLK_PWRMGT_CNTL, SCLK_PWRMGT_CNTL__FIR_TREND_MODE_MASK, ~SCLK_PWRMGT_CNTL__FIR_TREND_MODE_MASK);
 }
 
 static void si_program_tpp(struct amdgpu_device *adev)
 {
-	WREG32(CG_TPC, R600_TPC_DFLT);
+	WREG32(ixCG_TPC, R600_TPC_DFLT);
 }
 
 static void si_program_sstp(struct amdgpu_device *adev)
 {
-	WREG32(CG_SSP, (SSTU(R600_SSTU_DFLT) | SST(R600_SST_DFLT)));
+	WREG32(ixCG_SSP, (R600_SSTU_DFLT << CG_SSP__SSTU__SHIFT| R600_SST_DFLT << CG_SSP__SST__SHIFT));
 }
 
 static void si_enable_display_gap(struct amdgpu_device *adev)
 {
-	u32 tmp = RREG32(CG_DISPLAY_GAP_CNTL);
+	u32 tmp = RREG32(ixCG_DISPLAY_GAP_CNTL);
 
-	tmp &= ~(DISP1_GAP_MASK | DISP2_GAP_MASK);
-	tmp |= (DISP1_GAP(R600_PM_DISPLAY_GAP_IGNORE) |
-		DISP2_GAP(R600_PM_DISPLAY_GAP_IGNORE));
+	tmp &= ~(CG_DISPLAY_GAP_CNTL__DISP1_GAP_MASK | CG_DISPLAY_GAP_CNTL__DISP2_GAP_MASK);
+	tmp |= (R600_PM_DISPLAY_GAP_IGNORE << CG_DISPLAY_GAP_CNTL__DISP1_GAP__SHIFT |
+		R600_PM_DISPLAY_GAP_IGNORE << CG_DISPLAY_GAP_CNTL__DISP2_GAP__SHIFT);
 
-	tmp &= ~(DISP1_GAP_MCHG_MASK | DISP2_GAP_MCHG_MASK);
-	tmp |= (DISP1_GAP_MCHG(R600_PM_DISPLAY_GAP_VBLANK) |
-		DISP2_GAP_MCHG(R600_PM_DISPLAY_GAP_IGNORE));
-	WREG32(CG_DISPLAY_GAP_CNTL, tmp);
+	tmp &= ~(CG_DISPLAY_GAP_CNTL__DISP1_GAP_MCHG_MASK | CG_DISPLAY_GAP_CNTL__DISP2_GAP_MCHG_MASK);
+	tmp |= (R600_PM_DISPLAY_GAP_VBLANK << CG_DISPLAY_GAP_CNTL__DISP1_GAP_MCHG__SHIFT |
+		R600_PM_DISPLAY_GAP_IGNORE << CG_DISPLAY_GAP_CNTL__DISP2_GAP_MCHG__SHIFT);
+	WREG32(ixCG_DISPLAY_GAP_CNTL, tmp);
 }
 
 static void si_program_vc(struct amdgpu_device *adev)
 {
 	struct rv7xx_power_info *pi = rv770_get_pi(adev);
 
-	WREG32(CG_FTV, pi->vrc);
+	WREG32(ixCG_FTV, pi->vrc);
 }
 
 static void si_clear_vc(struct amdgpu_device *adev)
 {
-	WREG32(CG_FTV, 0);
+	WREG32(ixCG_FTV, 0);
 }
 
 static u8 si_get_ddr3_mclk_frequency_ratio(u32 memory_clock)
@@ -4751,7 +4754,7 @@ static u32 si_calculate_memory_refresh_rate(struct amdgpu_device *adev,
 	u32 dram_rows;
 	u32 dram_refresh_rate;
 	u32 mc_arb_rfsh_rate;
-	u32 tmp = (RREG32(MC_ARB_RAMCFG) & NOOFROWS_MASK) >> NOOFROWS_SHIFT;
+	u32 tmp = (RREG32(mmMC_ARB_RAMCFG) & MC_ARB_RAMCFG__NOOFROWS_MASK) >> MC_ARB_RAMCFG__NOOFROWS__SHIFT;
 
 	if (tmp >= 4)
 		dram_rows = 16384;
@@ -4925,7 +4928,7 @@ static int si_populate_smc_initial_state(struct amdgpu_device *adev,
 
 	si_populate_initial_mvdd_value(adev, &table->initialState.level.mvdd);
 
-	reg = CG_R(0xffff) | CG_L(0);
+	reg = 0xffff << CG_AT__CG_R__SHIFT | 0 << CG_AT__CG_L__SHIFT;
 	table->initialState.level.aT = cpu_to_be32(reg);
 	table->initialState.level.bSP = cpu_to_be32(pi->dsp);
 	table->initialState.level.gen2PCIE = (u8)si_pi->boot_pcie_gen;
@@ -4951,10 +4954,13 @@ static int si_populate_smc_initial_state(struct amdgpu_device *adev,
 	table->initialState.level.dpm2.BelowSafeInc = 0;
 	table->initialState.level.dpm2.PwrEfficiencyRatio = 0;
 
-	reg = MIN_POWER_MASK | MAX_POWER_MASK;
+	reg = SQ_POWER_THROTTLE__MIN_POWER_MASK |
+		SQ_POWER_THROTTLE__MAX_POWER_MASK;
 	table->initialState.level.SQPowerThrottle = cpu_to_be32(reg);
 
-	reg = MAX_POWER_DELTA_MASK | STI_SIZE_MASK | LTI_RATIO_MASK;
+	reg = SQ_POWER_THROTTLE2__MAX_POWER_DELTA_MASK |
+		SQ_POWER_THROTTLE2__SHORT_TERM_INTERVAL_SIZE_MASK |
+		SQ_POWER_THROTTLE2__LONG_TERM_INTERVAL_RATIO_MASK;
 	table->initialState.level.SQPowerThrottle_2 = cpu_to_be32(reg);
 
 	return 0;
@@ -5073,8 +5079,8 @@ static int si_populate_smc_acpi_state(struct amdgpu_device *adev,
 
 	dll_cntl &= ~(MRDCK0_BYPASS | MRDCK1_BYPASS);
 
-	spll_func_cntl_2 &= ~SCLK_MUX_SEL_MASK;
-	spll_func_cntl_2 |= SCLK_MUX_SEL(4);
+	spll_func_cntl_2 &= ~CG_SPLL_FUNC_CNTL_2__SCLK_MUX_SEL_MASK;
+	spll_func_cntl_2 |= 4 << CG_SPLL_FUNC_CNTL_2__SCLK_MUX_SEL__SHIFT;
 
 	table->ACPIState.level.mclk.vDLL_CNTL =
 		cpu_to_be32(dll_cntl);
@@ -5118,10 +5124,10 @@ static int si_populate_smc_acpi_state(struct amdgpu_device *adev,
 	table->ACPIState.level.dpm2.BelowSafeInc = 0;
 	table->ACPIState.level.dpm2.PwrEfficiencyRatio = 0;
 
-	reg = MIN_POWER_MASK | MAX_POWER_MASK;
+	reg = SQ_POWER_THROTTLE__MIN_POWER_MASK | SQ_POWER_THROTTLE__MAX_POWER_MASK;
 	table->ACPIState.level.SQPowerThrottle = cpu_to_be32(reg);
 
-	reg = MAX_POWER_DELTA_MASK | STI_SIZE_MASK | LTI_RATIO_MASK;
+	reg = SQ_POWER_THROTTLE2__MAX_POWER_DELTA_MASK | SQ_POWER_THROTTLE2__SHORT_TERM_INTERVAL_SIZE_MASK | SQ_POWER_THROTTLE2__LONG_TERM_INTERVAL_RATIO_MASK;
 	table->ACPIState.level.SQPowerThrottle_2 = cpu_to_be32(reg);
 
 	return 0;
@@ -5266,8 +5272,8 @@ static int si_init_smc_table(struct amdgpu_device *adev)
 		if (ret)
 			return ret;
 
-		WREG32(CG_ULV_CONTROL, ulv->cg_ulv_control);
-		WREG32(CG_ULV_PARAMETER, ulv->cg_ulv_parameter);
+		WREG32(ixCG_ULV_CONTROL, ulv->cg_ulv_control);
+		WREG32(ixCG_ULV_PARAMETER, ulv->cg_ulv_parameter);
 
 		lane_width = amdgpu_get_pcie_lanes(adev);
 		si_write_smc_soft_register(adev, SI_SMC_SOFT_REGISTER_non_ulv_pcie_link_width, lane_width);
@@ -5310,16 +5316,16 @@ static int si_calculate_sclk_params(struct amdgpu_device *adev,
 	do_div(tmp, reference_clock);
 	fbdiv = (u32) tmp;
 
-	spll_func_cntl &= ~(SPLL_PDIV_A_MASK | SPLL_REF_DIV_MASK);
-	spll_func_cntl |= SPLL_REF_DIV(dividers.ref_div);
-	spll_func_cntl |= SPLL_PDIV_A(dividers.post_div);
+	spll_func_cntl &= ~(CG_SPLL_FUNC_CNTL__SPLL_PDIV_A_MASK | CG_SPLL_FUNC_CNTL__SPLL_REF_DIV_MASK);
+	spll_func_cntl |= dividers.ref_div << CG_SPLL_FUNC_CNTL__SPLL_REF_DIV__SHIFT;
+	spll_func_cntl |= dividers.post_div << CG_SPLL_FUNC_CNTL__SPLL_PDIV_A__SHIFT;
 
-	spll_func_cntl_2 &= ~SCLK_MUX_SEL_MASK;
-	spll_func_cntl_2 |= SCLK_MUX_SEL(2);
+	spll_func_cntl_2 &= ~CG_SPLL_FUNC_CNTL_2__SCLK_MUX_SEL_MASK;
+	spll_func_cntl_2 |= 2 << CG_SPLL_FUNC_CNTL_2__SCLK_MUX_SEL__SHIFT;
 
-	spll_func_cntl_3 &= ~SPLL_FB_DIV_MASK;
-	spll_func_cntl_3 |= SPLL_FB_DIV(fbdiv);
-	spll_func_cntl_3 |= SPLL_DITHEN;
+	spll_func_cntl_3 &= ~CG_SPLL_FUNC_CNTL_3__SPLL_FB_DIV_MASK;
+	spll_func_cntl_3 |= fbdiv << CG_SPLL_FUNC_CNTL_3__SPLL_FB_DIV__SHIFT;
+	spll_func_cntl_3 |= CG_SPLL_FUNC_CNTL_3__SPLL_DITHEN_MASK;
 
 	if (pi->sclk_ss) {
 		struct amdgpu_atom_ss ss;
@@ -5330,12 +5336,12 @@ static int si_calculate_sclk_params(struct amdgpu_device *adev,
 			u32 clk_s = reference_clock * 5 / (reference_divider * ss.rate);
 			u32 clk_v = 4 * ss.percentage * fbdiv / (clk_s * 10000);
 
-			cg_spll_spread_spectrum &= ~CLK_S_MASK;
-			cg_spll_spread_spectrum |= CLK_S(clk_s);
-			cg_spll_spread_spectrum |= SSEN;
+			cg_spll_spread_spectrum &= ~CG_SPLL_SPREAD_SPECTRUM__CLK_S_MASK;
+			cg_spll_spread_spectrum |= clk_s << CG_SPLL_SPREAD_SPECTRUM__CLK_S__SHIFT;
+			cg_spll_spread_spectrum |= CG_SPLL_SPREAD_SPECTRUM__SSEN_MASK;
 
-			cg_spll_spread_spectrum_2 &= ~CLK_V_MASK;
-			cg_spll_spread_spectrum_2 |= CLK_V(clk_v);
+			cg_spll_spread_spectrum_2 &= ~CG_SPLL_SPREAD_SPECTRUM_2__CLK_V_MASK;
+			cg_spll_spread_spectrum_2 |= clk_v << CG_SPLL_SPREAD_SPECTRUM_2__CLK_V__SHIFT;
 		}
 	}
 
@@ -5501,7 +5507,7 @@ static int si_convert_power_level_to_smc(struct amdgpu_device *adev,
 	if (pi->mclk_stutter_mode_threshold &&
 	    (pl->mclk <= pi->mclk_stutter_mode_threshold) &&
 	    !eg_pi->uvd_enabled &&
-	    (RREG32(DPG_PIPE_STUTTER_CONTROL) & STUTTER_ENABLE) &&
+	    (RREG32(mmDPG_PIPE_STUTTER_CONTROL) & DPG_PIPE_STUTTER_CONTROL__STUTTER_ENABLE_MASK) &&
 	    (adev->pm.dpm.new_active_crtc_count <= 2)) {
 		level->mcFlags |= SISLANDS_SMC_MC_STUTTER_EN;
 	}
@@ -5595,7 +5601,7 @@ static int si_populate_smc_t(struct amdgpu_device *adev,
 		return -EINVAL;
 
 	if (state->performance_level_count < 2) {
-		a_t = CG_R(0xffff) | CG_L(0);
+		a_t = 0xffff << CG_AT__CG_R__SHIFT | 0 << CG_AT__CG_L__SHIFT;
 		smc_state->levels[0].aT = cpu_to_be32(a_t);
 		return 0;
 	}
@@ -5616,13 +5622,13 @@ static int si_populate_smc_t(struct amdgpu_device *adev,
 			t_l = (i + 1) * 1000 + 50 * R600_AH_DFLT;
 		}
 
-		a_t = be32_to_cpu(smc_state->levels[i].aT) & ~CG_R_MASK;
-		a_t |= CG_R(t_l * pi->bsp / 20000);
+		a_t = be32_to_cpu(smc_state->levels[i].aT) & ~CG_AT__CG_R_MASK;
+		a_t |= (t_l * pi->bsp / 20000) << CG_AT__CG_R__SHIFT;
 		smc_state->levels[i].aT = cpu_to_be32(a_t);
 
 		high_bsp = (i == state->performance_level_count - 2) ?
 			pi->pbsp : pi->bsp;
-		a_t = CG_R(0xffff) | CG_L(t_h * high_bsp / 20000);
+		a_t = (0xffff) << CG_AT__CG_R__SHIFT | (t_h * high_bsp / 20000) << CG_AT__CG_L__SHIFT;
 		smc_state->levels[i + 1].aT = cpu_to_be32(a_t);
 	}
 
@@ -6196,9 +6202,9 @@ static int si_upload_mc_reg_table(struct amdgpu_device *adev,
 static void si_enable_voltage_control(struct amdgpu_device *adev, bool enable)
 {
 	if (enable)
-		WREG32_P(GENERAL_PWRMGT, VOLT_PWRMGT_EN, ~VOLT_PWRMGT_EN);
+		WREG32_P(ixGENERAL_PWRMGT, GENERAL_PWRMGT__VOLT_PWRMGT_EN_MASK, ~GENERAL_PWRMGT__VOLT_PWRMGT_EN_MASK);
 	else
-		WREG32_P(GENERAL_PWRMGT, 0, ~VOLT_PWRMGT_EN);
+		WREG32_P(ixGENERAL_PWRMGT, 0, ~GENERAL_PWRMGT__VOLT_PWRMGT_EN_MASK);
 }
 
 static enum si_pcie_gen si_get_maximum_link_speed(struct amdgpu_device *adev,
@@ -6220,8 +6226,8 @@ static u16 si_get_current_pcie_speed(struct amdgpu_device *adev)
 {
 	u32 speed_cntl;
 
-	speed_cntl = RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL) & LC_CURRENT_DATA_RATE_MASK;
-	speed_cntl >>= LC_CURRENT_DATA_RATE_SHIFT;
+	speed_cntl = RREG32_PCIE_PORT(ixPCIE_LC_SPEED_CNTL) & PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE_MASK;
+	speed_cntl >>= PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE__SHIFT;
 
 	return (u16)speed_cntl;
 }
@@ -6428,21 +6434,21 @@ static void si_dpm_setup_asic(struct amdgpu_device *adev)
 static int si_thermal_enable_alert(struct amdgpu_device *adev,
 				   bool enable)
 {
-	u32 thermal_int = RREG32(CG_THERMAL_INT);
+	u32 thermal_int = RREG32(ixCG_THERMAL_INT);
 
 	if (enable) {
 		PPSMC_Result result;
 
-		thermal_int &= ~(THERM_INT_MASK_HIGH | THERM_INT_MASK_LOW);
-		WREG32(CG_THERMAL_INT, thermal_int);
+		thermal_int &= ~(CG_THERMAL_INT__THERM_INT_MASK_HIGH_MASK | CG_THERMAL_INT__THERM_INT_MASK_LOW_MASK);
+		WREG32(ixCG_THERMAL_INT, thermal_int);
 		result = amdgpu_si_send_msg_to_smc(adev, PPSMC_MSG_EnableThermalInterrupt);
 		if (result != PPSMC_Result_OK) {
 			DRM_DEBUG_KMS("Could not enable thermal interrupts.\n");
 			return -EINVAL;
 		}
 	} else {
-		thermal_int |= THERM_INT_MASK_HIGH | THERM_INT_MASK_LOW;
-		WREG32(CG_THERMAL_INT, thermal_int);
+		thermal_int |= CG_THERMAL_INT__THERM_INT_MASK_HIGH_MASK | CG_THERMAL_INT__THERM_INT_MASK_LOW_MASK;
+		WREG32(ixCG_THERMAL_INT, thermal_int);
 	}
 
 	return 0;
@@ -6463,9 +6469,9 @@ static int si_thermal_set_temperature_range(struct amdgpu_device *adev,
 		return -EINVAL;
 	}
 
-	WREG32_P(CG_THERMAL_INT, DIG_THERM_INTH(high_temp / 1000), ~DIG_THERM_INTH_MASK);
-	WREG32_P(CG_THERMAL_INT, DIG_THERM_INTL(low_temp / 1000), ~DIG_THERM_INTL_MASK);
-	WREG32_P(CG_THERMAL_CTRL, DIG_THERM_DPM(high_temp / 1000), ~DIG_THERM_DPM_MASK);
+	WREG32_P(ixCG_THERMAL_INT, (high_temp / 1000) << CG_THERMAL_INT__DIG_THERM_INTH__SHIFT, ~CG_THERMAL_INT__DIG_THERM_INTH_MASK);
+	WREG32_P(ixCG_THERMAL_INT, (low_temp / 1000) << CG_THERMAL_INT__DIG_THERM_INTL__SHIFT, ~CG_THERMAL_INT__DIG_THERM_INTL_MASK);
+	WREG32_P(ixCG_THERMAL_CTRL, (high_temp / 1000) << CG_THERMAL_CTRL__DIG_THERM_DPM__SHIFT, ~CG_THERMAL_CTRL__DIG_THERM_DPM_MASK);
 
 	adev->pm.dpm.thermal.min_temp = low_temp;
 	adev->pm.dpm.thermal.max_temp = high_temp;
@@ -6479,20 +6485,20 @@ static void si_fan_ctrl_set_static_mode(struct amdgpu_device *adev, u32 mode)
 	u32 tmp;
 
 	if (si_pi->fan_ctrl_is_in_default_mode) {
-		tmp = (RREG32(CG_FDO_CTRL2) & FDO_PWM_MODE_MASK) >> FDO_PWM_MODE_SHIFT;
+		tmp = (RREG32(ixCG_FDO_CTRL2) & CG_FDO_CTRL2__FDO_PWM_MODE_MASK) >> CG_FDO_CTRL2__FDO_PWM_MODE__SHIFT;
 		si_pi->fan_ctrl_default_mode = tmp;
-		tmp = (RREG32(CG_FDO_CTRL2) & TMIN_MASK) >> TMIN_SHIFT;
+		tmp = (RREG32(ixCG_FDO_CTRL2) & CG_FDO_CTRL2__TMIN_MASK) >> CG_FDO_CTRL2__TMIN__SHIFT;
 		si_pi->t_min = tmp;
 		si_pi->fan_ctrl_is_in_default_mode = false;
 	}
 
-	tmp = RREG32(CG_FDO_CTRL2) & ~TMIN_MASK;
-	tmp |= TMIN(0);
-	WREG32(CG_FDO_CTRL2, tmp);
+	tmp = RREG32(ixCG_FDO_CTRL2) & ~CG_FDO_CTRL2__TMIN_MASK;
+	tmp |= 0 << CG_FDO_CTRL2__TMIN__SHIFT;
+	WREG32(ixCG_FDO_CTRL2, tmp);
 
-	tmp = RREG32(CG_FDO_CTRL2) & ~FDO_PWM_MODE_MASK;
-	tmp |= FDO_PWM_MODE(mode);
-	WREG32(CG_FDO_CTRL2, tmp);
+	tmp = RREG32(ixCG_FDO_CTRL2) & ~CG_FDO_CTRL2__FDO_PWM_MODE_MASK;
+	tmp |= mode << CG_FDO_CTRL2__FDO_PWM_MODE__SHIFT;
+	WREG32(ixCG_FDO_CTRL2, tmp);
 }
 
 static int si_thermal_setup_fan_table(struct amdgpu_device *adev)
@@ -6511,7 +6517,7 @@ static int si_thermal_setup_fan_table(struct amdgpu_device *adev)
 		return 0;
 	}
 
-	duty100 = (RREG32(CG_FDO_CTRL1) & FMAX_DUTY100_MASK) >> FMAX_DUTY100_SHIFT;
+	duty100 = (RREG32(ixCG_FDO_CTRL1) & CG_FDO_CTRL1__FMAX_DUTY100_MASK) >> CG_FDO_CTRL1__FMAX_DUTY100__SHIFT;
 
 	if (duty100 == 0) {
 		adev->pm.dpm.fan.ucode_fan_control = false;
@@ -6547,7 +6553,7 @@ static int si_thermal_setup_fan_table(struct amdgpu_device *adev)
 						reference_clock) / 1600);
 	fan_table.fdo_max = cpu_to_be16((u16)duty100);
 
-	tmp = (RREG32(CG_MULT_THERMAL_CTRL) & TEMP_SEL_MASK) >> TEMP_SEL_SHIFT;
+	tmp = (RREG32(ixCG_MULT_THERMAL_CTRL) & CG_MULT_THERMAL_CTRL__TEMP_SEL_MASK) >> CG_MULT_THERMAL_CTRL__TEMP_SEL__SHIFT;
 	fan_table.temp_src = (uint8_t)tmp;
 
 	ret = amdgpu_si_copy_bytes_to_smc(adev,
@@ -6606,8 +6612,8 @@ static int si_dpm_get_fan_speed_pwm(void *handle,
 	if (adev->pm.no_fan)
 		return -ENOENT;
 
-	duty100 = (RREG32(CG_FDO_CTRL1) & FMAX_DUTY100_MASK) >> FMAX_DUTY100_SHIFT;
-	duty = (RREG32(CG_THERMAL_STATUS) & FDO_PWM_DUTY_MASK) >> FDO_PWM_DUTY_SHIFT;
+	duty100 = (RREG32(ixCG_FDO_CTRL1) & CG_FDO_CTRL1__FMAX_DUTY100_MASK) >> CG_FDO_CTRL1__FMAX_DUTY100__SHIFT;
+	duty = (RREG32(ixCG_THERMAL_STATUS) & CG_THERMAL_STATUS__FDO_PWM_DUTY_MASK) >> CG_THERMAL_STATUS__FDO_PWM_DUTY__SHIFT;
 
 	if (duty100 == 0)
 		return -EINVAL;
@@ -6637,7 +6643,7 @@ static int si_dpm_set_fan_speed_pwm(void *handle,
 	if (speed > 255)
 		return -EINVAL;
 
-	duty100 = (RREG32(CG_FDO_CTRL1) & FMAX_DUTY100_MASK) >> FMAX_DUTY100_SHIFT;
+	duty100 = (RREG32(ixCG_FDO_CTRL1) & CG_FDO_CTRL1__FMAX_DUTY100_MASK) >> CG_FDO_CTRL1__FMAX_DUTY100__SHIFT;
 
 	if (duty100 == 0)
 		return -EINVAL;
@@ -6646,9 +6652,9 @@ static int si_dpm_set_fan_speed_pwm(void *handle,
 	do_div(tmp64, 255);
 	duty = (u32)tmp64;
 
-	tmp = RREG32(CG_FDO_CTRL0) & ~FDO_STATIC_DUTY_MASK;
-	tmp |= FDO_STATIC_DUTY(duty);
-	WREG32(CG_FDO_CTRL0, tmp);
+	tmp = RREG32(ixCG_FDO_CTRL0) & ~CG_FDO_CTRL0__FDO_STATIC_DUTY_MASK;
+	tmp |= duty << CG_FDO_CTRL0__FDO_STATIC_DUTY__SHIFT;
+	WREG32(ixCG_FDO_CTRL0, tmp);
 
 	return 0;
 }
@@ -6688,8 +6694,8 @@ static int si_dpm_get_fan_control_mode(void *handle, u32 *fan_mode)
 	if (si_pi->fan_is_controlled_by_smc)
 		return 0;
 
-	tmp = RREG32(CG_FDO_CTRL2) & FDO_PWM_MODE_MASK;
-	*fan_mode = (tmp >> FDO_PWM_MODE_SHIFT);
+	tmp = RREG32(ixCG_FDO_CTRL2) & CG_FDO_CTRL2__FDO_PWM_MODE_MASK;
+	*fan_mode = (tmp >> CG_FDO_CTRL2__FDO_PWM_MODE__SHIFT);
 
 	return 0;
 }
@@ -6707,7 +6713,7 @@ static int si_fan_ctrl_get_fan_speed_rpm(struct amdgpu_device *adev,
 	if (adev->pm.fan_pulses_per_revolution == 0)
 		return -ENOENT;
 
-	tach_period = (RREG32(CG_TACH_STATUS) & TACH_PERIOD_MASK) >> TACH_PERIOD_SHIFT;
+	tach_period = (RREG32(ixCG_TACH_STATUS) & CG_TACH_STATUS__TACH_PERIOD_MASK) >> CG_TACH_STATUS__TACH_PERIOD__SHIFT;
 	if (tach_period == 0)
 		return -ENOENT;
 
@@ -6736,9 +6742,9 @@ static int si_fan_ctrl_set_fan_speed_rpm(struct amdgpu_device *adev,
 		si_fan_ctrl_stop_smc_fan_control(adev);
 
 	tach_period = 60 * xclk * 10000 / (8 * speed);
-	tmp = RREG32(CG_TACH_CTRL) & ~TARGET_PERIOD_MASK;
-	tmp |= TARGET_PERIOD(tach_period);
-	WREG32(CG_TACH_CTRL, tmp);
+	tmp = RREG32(ixCG_TACH_CTRL) & ~CG_TACH_CTRL__TARGET_PERIOD_MASK;
+	tmp |= tach_period << CG_TACH_CTRL__TARGET_PERIOD__SHIFT;
+	WREG32(ixCG_TACH_CTRL, tmp);
 
 	si_fan_ctrl_set_static_mode(adev, FDO_PWM_MODE_STATIC_RPM);
 
@@ -6752,13 +6758,13 @@ static void si_fan_ctrl_set_default_mode(struct amdgpu_device *adev)
 	u32 tmp;
 
 	if (!si_pi->fan_ctrl_is_in_default_mode) {
-		tmp = RREG32(CG_FDO_CTRL2) & ~FDO_PWM_MODE_MASK;
-		tmp |= FDO_PWM_MODE(si_pi->fan_ctrl_default_mode);
-		WREG32(CG_FDO_CTRL2, tmp);
+		tmp = RREG32(ixCG_FDO_CTRL2) & ~CG_FDO_CTRL2__FDO_PWM_MODE_MASK;
+		tmp |= si_pi->fan_ctrl_default_mode << CG_FDO_CTRL2__FDO_PWM_MODE__SHIFT;
+		WREG32(ixCG_FDO_CTRL2, tmp);
 
-		tmp = RREG32(CG_FDO_CTRL2) & ~TMIN_MASK;
-		tmp |= TMIN(si_pi->t_min);
-		WREG32(CG_FDO_CTRL2, tmp);
+		tmp = RREG32(ixCG_FDO_CTRL2) & ~CG_FDO_CTRL2__TMIN_MASK;
+		tmp |= si_pi->t_min << CG_FDO_CTRL2__TMIN__SHIFT;
+		WREG32(ixCG_FDO_CTRL2, tmp);
 		si_pi->fan_ctrl_is_in_default_mode = true;
 	}
 }
@@ -6776,14 +6782,14 @@ static void si_thermal_initialize(struct amdgpu_device *adev)
 	u32 tmp;
 
 	if (adev->pm.fan_pulses_per_revolution) {
-		tmp = RREG32(CG_TACH_CTRL) & ~EDGE_PER_REV_MASK;
-		tmp |= EDGE_PER_REV(adev->pm.fan_pulses_per_revolution -1);
-		WREG32(CG_TACH_CTRL, tmp);
+		tmp = RREG32(ixCG_TACH_CTRL) & ~CG_TACH_CTRL__EDGE_PER_REV_MASK;
+		tmp |= (adev->pm.fan_pulses_per_revolution -1) << CG_TACH_CTRL__EDGE_PER_REV__SHIFT;
+		WREG32(ixCG_TACH_CTRL, tmp);
 	}
 
-	tmp = RREG32(CG_FDO_CTRL2) & ~TACH_PWM_RESP_RATE_MASK;
-	tmp |= TACH_PWM_RESP_RATE(0x28);
-	WREG32(CG_FDO_CTRL2, tmp);
+	tmp = RREG32(ixCG_FDO_CTRL2) & ~CG_FDO_CTRL2__TACH_PWM_RESP_RATE_MASK;
+	tmp |= 0x28 << CG_FDO_CTRL2__TACH_PWM_RESP_RATE__SHIFT;
+	WREG32(ixCG_FDO_CTRL2, tmp);
 }
 
 static int si_thermal_start_thermal_controller(struct amdgpu_device *adev)
@@ -7546,8 +7552,8 @@ static void si_dpm_debugfs_print_current_performance_level(void *handle,
 	struct  si_ps *ps = si_get_ps(rps);
 	struct rv7xx_pl *pl;
 	u32 current_index =
-		(RREG32(TARGET_AND_CURRENT_PROFILE_INDEX) & CURRENT_STATE_INDEX_MASK) >>
-		CURRENT_STATE_INDEX_SHIFT;
+		(RREG32(ixTARGET_AND_CURRENT_PROFILE_INDEX) & TARGET_AND_CURRENT_PROFILE_INDEX__CURRENT_STATE_INDEX_MASK) >>
+			TARGET_AND_CURRENT_PROFILE_INDEX__CURRENT_STATE_INDEX__SHIFT;
 
 	if (current_index >= ps->performance_level_count) {
 		seq_printf(m, "invalid dpm profile %d\n", current_index);
@@ -7570,14 +7576,14 @@ static int si_dpm_set_interrupt_state(struct amdgpu_device *adev,
 	case AMDGPU_THERMAL_IRQ_LOW_TO_HIGH:
 		switch (state) {
 		case AMDGPU_IRQ_STATE_DISABLE:
-			cg_thermal_int = RREG32_SMC(CG_THERMAL_INT);
-			cg_thermal_int |= THERM_INT_MASK_HIGH;
-			WREG32_SMC(CG_THERMAL_INT, cg_thermal_int);
+			cg_thermal_int = RREG32_SMC(ixCG_THERMAL_INT);
+			cg_thermal_int |= CG_THERMAL_INT__THERM_INT_MASK_HIGH_MASK;
+			WREG32_SMC(ixCG_THERMAL_INT, cg_thermal_int);
 			break;
 		case AMDGPU_IRQ_STATE_ENABLE:
-			cg_thermal_int = RREG32_SMC(CG_THERMAL_INT);
-			cg_thermal_int &= ~THERM_INT_MASK_HIGH;
-			WREG32_SMC(CG_THERMAL_INT, cg_thermal_int);
+			cg_thermal_int = RREG32_SMC(ixCG_THERMAL_INT);
+			cg_thermal_int &= ~CG_THERMAL_INT__THERM_INT_MASK_HIGH_MASK;
+			WREG32_SMC(ixCG_THERMAL_INT, cg_thermal_int);
 			break;
 		default:
 			break;
@@ -7587,14 +7593,14 @@ static int si_dpm_set_interrupt_state(struct amdgpu_device *adev,
 	case AMDGPU_THERMAL_IRQ_HIGH_TO_LOW:
 		switch (state) {
 		case AMDGPU_IRQ_STATE_DISABLE:
-			cg_thermal_int = RREG32_SMC(CG_THERMAL_INT);
-			cg_thermal_int |= THERM_INT_MASK_LOW;
-			WREG32_SMC(CG_THERMAL_INT, cg_thermal_int);
+			cg_thermal_int = RREG32_SMC(ixCG_THERMAL_INT);
+			cg_thermal_int |= CG_THERMAL_INT__THERM_INT_MASK_LOW_MASK;
+			WREG32_SMC(ixCG_THERMAL_INT, cg_thermal_int);
 			break;
 		case AMDGPU_IRQ_STATE_ENABLE:
-			cg_thermal_int = RREG32_SMC(CG_THERMAL_INT);
-			cg_thermal_int &= ~THERM_INT_MASK_LOW;
-			WREG32_SMC(CG_THERMAL_INT, cg_thermal_int);
+			cg_thermal_int = RREG32_SMC(ixCG_THERMAL_INT);
+			cg_thermal_int &= ~CG_THERMAL_INT__THERM_INT_MASK_LOW_MASK;
+			WREG32_SMC(ixCG_THERMAL_INT, cg_thermal_int);
 			break;
 		default:
 			break;
@@ -7884,8 +7890,8 @@ static int si_dpm_get_temp(void *handle)
 	int actual_temp = 0;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	temp = (RREG32(CG_MULT_THERMAL_STATUS) & CTF_TEMP_MASK) >>
-		CTF_TEMP_SHIFT;
+	temp = (RREG32(ixCG_MULT_THERMAL_STATUS) & CG_MULT_THERMAL_STATUS__CTF_TEMP_MASK) >>
+		CG_MULT_THERMAL_STATUS__CTF_TEMP__SHIFT;
 
 	if (temp & 0x200)
 		actual_temp = 255;
@@ -8015,8 +8021,8 @@ static int si_dpm_read_sensor(void *handle, int idx,
 	struct  si_ps *ps = si_get_ps(rps);
 	uint32_t sclk, mclk;
 	u32 pl_index =
-		(RREG32(TARGET_AND_CURRENT_PROFILE_INDEX) & CURRENT_STATE_INDEX_MASK) >>
-		CURRENT_STATE_INDEX_SHIFT;
+		(RREG32(ixTARGET_AND_CURRENT_PROFILE_INDEX) & TARGET_AND_CURRENT_PROFILE_INDEX__CURRENT_STATE_INDEX_MASK) >>
+		TARGET_AND_CURRENT_PROFILE_INDEX__CURRENT_STATE_INDEX__SHIFT;
 
 	/* size must be at least 4 bytes for all sensors */
 	if (*size < 4)
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
index c712899c44ca..4e65ab9e931c 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
@@ -44,8 +44,8 @@ static int si_set_smc_sram_address(struct amdgpu_device *adev,
 	if ((smc_address + 3) > limit)
 		return -EINVAL;
 
-	WREG32(SMC_IND_INDEX_0, smc_address);
-	WREG32_P(SMC_IND_ACCESS_CNTL, 0, ~AUTO_INCREMENT_IND_0);
+	WREG32(mmSMC_IND_INDEX_0, smc_address);
+	WREG32_P(mmSMC_IND_ACCESS_CNTL, 0, ~SMC_IND_ACCESS_CNTL__AUTO_INCREMENT_IND_0_MASK);
 
 	return 0;
 }
@@ -74,7 +74,7 @@ int amdgpu_si_copy_bytes_to_smc(struct amdgpu_device *adev,
 		if (ret)
 			goto done;
 
-		WREG32(SMC_IND_DATA_0, data);
+		WREG32(mmSMC_IND_DATA_0, data);
 
 		src += 4;
 		byte_count -= 4;
@@ -89,7 +89,7 @@ int amdgpu_si_copy_bytes_to_smc(struct amdgpu_device *adev,
 		if (ret)
 			goto done;
 
-		original_data = RREG32(SMC_IND_DATA_0);
+		original_data = RREG32(mmSMC_IND_DATA_0);
 		extra_shift = 8 * (4 - byte_count);
 
 		while (byte_count > 0) {
@@ -105,7 +105,7 @@ int amdgpu_si_copy_bytes_to_smc(struct amdgpu_device *adev,
 		if (ret)
 			goto done;
 
-		WREG32(SMC_IND_DATA_0, data);
+		WREG32(mmSMC_IND_DATA_0, data);
 	}
 
 done:
@@ -127,10 +127,10 @@ void amdgpu_si_reset_smc(struct amdgpu_device *adev)
 {
 	u32 tmp;
 
-	RREG32(CB_CGTT_SCLK_CTRL);
-	RREG32(CB_CGTT_SCLK_CTRL);
-	RREG32(CB_CGTT_SCLK_CTRL);
-	RREG32(CB_CGTT_SCLK_CTRL);
+	RREG32(mmCB_CGTT_SCLK_CTRL);
+	RREG32(mmCB_CGTT_SCLK_CTRL);
+	RREG32(mmCB_CGTT_SCLK_CTRL);
+	RREG32(mmCB_CGTT_SCLK_CTRL);
 
 	tmp = RREG32_SMC(SMC_SYSCON_RESET_CNTL) |
 	      RST_REG;
@@ -176,16 +176,16 @@ PPSMC_Result amdgpu_si_send_msg_to_smc(struct amdgpu_device *adev,
 	if (!amdgpu_si_is_smc_running(adev))
 		return PPSMC_Result_Failed;
 
-	WREG32(SMC_MESSAGE_0, msg);
+	WREG32(mmSMC_MESSAGE_0, msg);
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		tmp = RREG32(SMC_RESP_0);
+		tmp = RREG32(mmSMC_RESP_0);
 		if (tmp != 0)
 			break;
 		udelay(1);
 	}
 
-	return (PPSMC_Result)RREG32(SMC_RESP_0);
+	return (PPSMC_Result)RREG32(mmSMC_RESP_0);
 }
 
 PPSMC_Result amdgpu_si_wait_for_smc_inactive(struct amdgpu_device *adev)
@@ -231,18 +231,18 @@ int amdgpu_si_load_smc_ucode(struct amdgpu_device *adev, u32 limit)
 		return -EINVAL;
 
 	spin_lock_irqsave(&adev->smc_idx_lock, flags);
-	WREG32(SMC_IND_INDEX_0, ucode_start_address);
-	WREG32_P(SMC_IND_ACCESS_CNTL, AUTO_INCREMENT_IND_0, ~AUTO_INCREMENT_IND_0);
+	WREG32(mmSMC_IND_INDEX_0, ucode_start_address);
+	WREG32_P(mmSMC_IND_ACCESS_CNTL, SMC_IND_ACCESS_CNTL__AUTO_INCREMENT_IND_0_MASK, ~SMC_IND_ACCESS_CNTL__AUTO_INCREMENT_IND_0_MASK);
 	while (ucode_size >= 4) {
 		/* SMC address space is BE */
 		data = (src[0] << 24) | (src[1] << 16) | (src[2] << 8) | src[3];
 
-		WREG32(SMC_IND_DATA_0, data);
+		WREG32(mmSMC_IND_DATA_0, data);
 
 		src += 4;
 		ucode_size -= 4;
 	}
-	WREG32_P(SMC_IND_ACCESS_CNTL, 0, ~AUTO_INCREMENT_IND_0);
+	WREG32_P(mmSMC_IND_ACCESS_CNTL, 0, ~SMC_IND_ACCESS_CNTL__AUTO_INCREMENT_IND_0_MASK);
 	spin_unlock_irqrestore(&adev->smc_idx_lock, flags);
 
 	return 0;
@@ -257,7 +257,7 @@ int amdgpu_si_read_smc_sram_dword(struct amdgpu_device *adev, u32 smc_address,
 	spin_lock_irqsave(&adev->smc_idx_lock, flags);
 	ret = si_set_smc_sram_address(adev, smc_address, limit);
 	if (ret == 0)
-		*value = RREG32(SMC_IND_DATA_0);
+		*value = RREG32(mmSMC_IND_DATA_0);
 	spin_unlock_irqrestore(&adev->smc_idx_lock, flags);
 
 	return ret;
@@ -272,7 +272,7 @@ int amdgpu_si_write_smc_sram_dword(struct amdgpu_device *adev, u32 smc_address,
 	spin_lock_irqsave(&adev->smc_idx_lock, flags);
 	ret = si_set_smc_sram_address(adev, smc_address, limit);
 	if (ret == 0)
-		WREG32(SMC_IND_DATA_0, value);
+		WREG32(mmSMC_IND_DATA_0, value);
 	spin_unlock_irqrestore(&adev->smc_idx_lock, flags);
 
 	return ret;
-- 
2.48.1


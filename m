Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF567170C3A
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Feb 2020 00:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BC56E288;
	Wed, 26 Feb 2020 23:05:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685DC6E288
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Feb 2020 23:05:48 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id b15so690299iln.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Feb 2020 15:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sjV9vWtuRowhHc9RLdTmOQsU/J5FubYtPxcSbTOK4fM=;
 b=DsCHdAYkFoYgSCXystPAuIEW4fGVu8jt4Dlx0A5lvVfOil9KiosA4GRiOHvPMsN2KE
 zMheKCHEuZN3WjDrb66ENe1CdEaze3s0HBi/2yQ1mwwPDm4ryAUUc3sYeM2WHpNEuW4t
 8kDixnQkW7HO6tsNBtNU8Zp0bOp0dbKFyCau7zgEzFyWq6p/m/frh9mm7n6N/GZg4I9l
 xJXCxdQIL/lRLQ5xS/Gv6EYOh0noGLQVhm1ZH7v1W3hHFD/N9gxyP09YNbRSb9w/3oN8
 JwFmHc9iDoJM2irCs8gk/MOZjKWkWk7KCNGvkNl+ZxYDcQsJle9SFgMnAFz4F4q9zrS1
 +SHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sjV9vWtuRowhHc9RLdTmOQsU/J5FubYtPxcSbTOK4fM=;
 b=o8VOVgFT+XKFV4AdYenUumDN5o0sM+RuXl6kw7FJiyDezw5dwQV9sDkX+k2Y50HfRE
 ISNGX1MTneoa8y9+1HVIWIt2qHuVoPc7q+/uNxHwETsmpyHLXsymKobcg9XegUPaRH+Z
 gwOSh4vMjdGhBXnWNREPzRlzvv90082HKvGE6HTaSC8La3oAZHVTUdeG7NagrfOFovYp
 WtSzVJmczMUzw25fgiTHIl7vxMynv2dRZfsNkzmh2yzE5uzfxshnjIFEJQOnjKF3xzQL
 qDdqAbuU+M9S+DDRVjvbITqRv66c17ToBLqf7jLE0yIxfNxVOoTh5reFA82IN4RzKVmS
 2xSg==
X-Gm-Message-State: APjAAAW6DuXNOaBUWQ0MSIWc7qBOGUD6GpRBnTn/d/tjFYOtL5Of4wYO
 oHiGTR+AQ8bBXDSHGVwv2fs=
X-Google-Smtp-Source: APXvYqwoFuo1ICWEhH/BJ1PbMjiN6nJqOmcNLr0HLsIO3LMeYpPCzGkUbsRi7JH+0E17hrYxeuOl6w==
X-Received: by 2002:a92:9c52:: with SMTP id h79mr1192446ili.213.1582758346972; 
 Wed, 26 Feb 2020 15:05:46 -0800 (PST)
Received: from mcoffin-dev-tower.ec2.internal
 ([2602:ae:10d1:b00:6d4:c4ff:fe4a:ea6b])
 by smtp.gmail.com with ESMTPSA id r14sm1191177ilg.59.2020.02.26.15.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 15:05:46 -0800 (PST)
From: Matt Coffin <mcoffin13@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/amdgpu/powerplay: Refactor SMU message handling
 for safety
Date: Wed, 26 Feb 2020 16:05:23 -0700
Message-Id: <2c1601f343da48de2946b44c79022f87f351e4a9.1582756642.git.mcoffin13@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1582756642.git.mcoffin13@gmail.com>
References: <CADnq5_NTd_dZAtN4yVyeM+Fp2w0Toy=tkvz00OwiYyC908W1Xg@mail.gmail.com>
 <cover.1582756642.git.mcoffin13@gmail.com>
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
Cc: Matt Coffin <mcoffin13@gmail.com>, Nirmoy Das <nirmoy.das@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Move the responsibility for reading argument registers into the
smu_send_smc_msg* implementations, so that adding a message-sending lock
to protect the SMU registers will result in the lock still being held
when the argument is read.

v2: transition smu_v12_0, it's asics, and vega20

Signed-off-by: Matt Coffin <mcoffin13@gmail.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    |  46 ++-----
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c  |  29 +++--
 .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |   2 +-
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |   7 +-
 drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h |   3 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c    |  34 +++---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c    |  25 ++--
 drivers/gpu/drm/amd/powerplay/smu_internal.h  |   9 +-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     | 114 +++++++++---------
 drivers/gpu/drm/amd/powerplay/smu_v12_0.c     |  79 ++++++------
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c    |  68 ++++++-----
 11 files changed, 211 insertions(+), 205 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 9f2428fd98f6..ef2b173eae28 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -121,20 +121,20 @@ static int smu_feature_update_enable_state(struct smu_context *smu,
 
 	if (enabled) {
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuFeaturesLow,
-						  feature_low);
+						  feature_low, NULL);
 		if (ret)
 			return ret;
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuFeaturesHigh,
-						  feature_high);
+						  feature_high, NULL);
 		if (ret)
 			return ret;
 	} else {
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmuFeaturesLow,
-						  feature_low);
+						  feature_low, NULL);
 		if (ret)
 			return ret;
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmuFeaturesHigh,
-						  feature_high);
+						  feature_high, NULL);
 		if (ret)
 			return ret;
 	}
@@ -195,21 +195,13 @@ int smu_get_smc_version(struct smu_context *smu, uint32_t *if_version, uint32_t
 		return -EINVAL;
 
 	if (if_version) {
-		ret = smu_send_smc_msg(smu, SMU_MSG_GetDriverIfVersion);
-		if (ret)
-			return ret;
-
-		ret = smu_read_smc_arg(smu, if_version);
+		ret = smu_send_smc_msg(smu, SMU_MSG_GetDriverIfVersion, if_version);
 		if (ret)
 			return ret;
 	}
 
 	if (smu_version) {
-		ret = smu_send_smc_msg(smu, SMU_MSG_GetSmuVersion);
-		if (ret)
-			return ret;
-
-		ret = smu_read_smc_arg(smu, smu_version);
+		ret = smu_send_smc_msg(smu, SMU_MSG_GetSmuVersion, smu_version);
 		if (ret)
 			return ret;
 	}
@@ -251,7 +243,7 @@ int smu_set_hard_freq_range(struct smu_context *smu, enum smu_clk_type clk_type,
 	if (max > 0) {
 		param = (uint32_t)((clk_id << 16) | (max & 0xffff));
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMaxByFreq,
-						  param);
+						  param, NULL);
 		if (ret)
 			return ret;
 	}
@@ -259,7 +251,7 @@ int smu_set_hard_freq_range(struct smu_context *smu, enum smu_clk_type clk_type,
 	if (min > 0) {
 		param = (uint32_t)((clk_id << 16) | (min & 0xffff));
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinByFreq,
-						  param);
+						  param, NULL);
 		if (ret)
 			return ret;
 	}
@@ -335,12 +327,8 @@ int smu_get_dpm_freq_by_index(struct smu_context *smu, enum smu_clk_type clk_typ
 
 	param = (uint32_t)(((clk_id & 0xffff) << 16) | (level & 0xffff));
 
-	ret = smu_send_smc_msg_with_param(smu,SMU_MSG_GetDpmFreqByIndex,
-					  param);
-	if (ret)
-		return ret;
-
-	ret = smu_read_smc_arg(smu, &param);
+	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetDpmFreqByIndex,
+					  param, &param);
 	if (ret)
 		return ret;
 
@@ -542,7 +530,8 @@ int smu_update_table(struct smu_context *smu, enum smu_table_id table_index, int
 	ret = smu_send_smc_msg_with_param(smu, drv2smu ?
 					  SMU_MSG_TransferTableDram2Smu :
 					  SMU_MSG_TransferTableSmu2Dram,
-					  table_id | ((argument & 0xFFFF) << 16));
+					  table_id | ((argument & 0xFFFF) << 16),
+					  NULL);
 	if (ret)
 		return ret;
 
@@ -1992,7 +1981,7 @@ int smu_set_mp1_state(struct smu_context *smu,
 		return 0;
 	}
 
-	ret = smu_send_smc_msg(smu, msg);
+	ret = smu_send_smc_msg(smu, msg, NULL);
 	if (ret)
 		pr_err("[PrepareMp1] Failed!\n");
 
@@ -2667,12 +2656,3 @@ uint32_t smu_get_pptable_power_limit(struct smu_context *smu)
 
 	return ret;
 }
-
-int smu_send_smc_msg(struct smu_context *smu,
-		     enum smu_message_type msg)
-{
-	int ret;
-
-	ret = smu_send_smc_msg_with_param(smu, msg, 0);
-	return ret;
-}
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index d3c4e7a8c1b1..be61451535c2 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -374,13 +374,13 @@ arcturus_set_single_dpm_table(struct smu_context *smu,
 
 	ret = smu_send_smc_msg_with_param(smu,
 			SMU_MSG_GetDpmFreqByIndex,
-			(clk_id << 16 | 0xFF));
+			(clk_id << 16 | 0xFF),
+			&num_of_levels);
 	if (ret) {
 		pr_err("[%s] failed to get dpm levels!\n", __func__);
 		return ret;
 	}
 
-	smu_read_smc_arg(smu, &num_of_levels);
 	if (!num_of_levels) {
 		pr_err("[%s] number of clk levels is invalid!\n", __func__);
 		return -EINVAL;
@@ -390,12 +390,12 @@ arcturus_set_single_dpm_table(struct smu_context *smu,
 	for (i = 0; i < num_of_levels; i++) {
 		ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_GetDpmFreqByIndex,
-				(clk_id << 16 | i));
+				(clk_id << 16 | i),
+				&clk);
 		if (ret) {
 			pr_err("[%s] failed to get dpm freq by index!\n", __func__);
 			return ret;
 		}
-		smu_read_smc_arg(smu, &clk);
 		if (!clk) {
 			pr_err("[%s] clk value is invalid!\n", __func__);
 			return -EINVAL;
@@ -553,13 +553,13 @@ static int arcturus_run_btc(struct smu_context *smu)
 {
 	int ret = 0;
 
-	ret = smu_send_smc_msg(smu, SMU_MSG_RunAfllBtc);
+	ret = smu_send_smc_msg(smu, SMU_MSG_RunAfllBtc, NULL);
 	if (ret) {
 		pr_err("RunAfllBtc failed!\n");
 		return ret;
 	}
 
-	return smu_send_smc_msg(smu, SMU_MSG_RunDcBtc);
+	return smu_send_smc_msg(smu, SMU_MSG_RunDcBtc, NULL);
 }
 
 static int arcturus_populate_umd_state_clk(struct smu_context *smu)
@@ -744,7 +744,8 @@ static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
 			single_dpm_table->dpm_state.soft_min_level;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
-			(PPCLK_GFXCLK << 16) | (freq & 0xffff));
+			(PPCLK_GFXCLK << 16) | (freq & 0xffff),
+			NULL);
 		if (ret) {
 			pr_err("Failed to set soft %s gfxclk !\n",
 						max ? "max" : "min");
@@ -759,7 +760,8 @@ static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
 			single_dpm_table->dpm_state.soft_min_level;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
-			(PPCLK_UCLK << 16) | (freq & 0xffff));
+			(PPCLK_UCLK << 16) | (freq & 0xffff),
+			NULL);
 		if (ret) {
 			pr_err("Failed to set soft %s memclk !\n",
 						max ? "max" : "min");
@@ -774,7 +776,8 @@ static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
 			single_dpm_table->dpm_state.soft_min_level;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
-			(PPCLK_SOCCLK << 16) | (freq & 0xffff));
+			(PPCLK_SOCCLK << 16) | (freq & 0xffff),
+			NULL);
 		if (ret) {
 			pr_err("Failed to set soft %s socclk !\n",
 						max ? "max" : "min");
@@ -1289,12 +1292,11 @@ static int arcturus_get_power_limit(struct smu_context *smu,
 				return -EINVAL;
 
 			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetPptLimit,
-				power_src << 16);
+				power_src << 16, &asic_default_power_limit);
 			if (ret) {
 				pr_err("[%s] get PPT limit failed!", __func__);
 				return ret;
 			}
-			smu_read_smc_arg(smu, &asic_default_power_limit);
 		} else {
 			/* the last hope to figure out the ppt limit */
 			if (!pptable) {
@@ -1498,7 +1500,8 @@ static int arcturus_set_power_profile_mode(struct smu_context *smu,
 
 	ret = smu_send_smc_msg_with_param(smu,
 					  SMU_MSG_SetWorkloadMask,
-					  1 << workload_type);
+					  1 << workload_type,
+					  NULL);
 	if (ret) {
 		pr_err("Fail to set workload type %d\n", workload_type);
 		return ret;
@@ -2233,7 +2236,7 @@ static int arcturus_set_df_cstate(struct smu_context *smu,
 		return -EINVAL;
 	}
 
-	return smu_send_smc_msg_with_param(smu, SMU_MSG_DFCstateControl, state);
+	return smu_send_smc_msg_with_param(smu, SMU_MSG_DFCstateControl, state, NULL);
 }
 
 static const struct pptable_funcs arcturus_ppt_funcs = {
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
index 97b6714e83e6..52b892ae90ad 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -514,7 +514,7 @@ struct pptable_funcs {
 	int (*set_last_dcef_min_deep_sleep_clk)(struct smu_context *smu);
 	int (*system_features_control)(struct smu_context *smu, bool en);
 	int (*send_smc_msg_with_param)(struct smu_context *smu,
-				       enum smu_message_type msg, uint32_t param);
+				       enum smu_message_type msg, uint32_t param, uint32_t *read_arg);
 	int (*read_smc_arg)(struct smu_context *smu, uint32_t *arg);
 	int (*init_display_count)(struct smu_context *smu, uint32_t count);
 	int (*set_allowed_mask)(struct smu_context *smu);
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
index acccdf621b4e..0b789386b5a6 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -138,6 +138,8 @@ enum smu_v11_0_baco_seq {
 	BACO_SEQ_COUNT,
 };
 
+int smu_v11_0_read_arg(struct smu_context *smu, uint32_t *arg);
+
 int smu_v11_0_init_microcode(struct smu_context *smu);
 
 int smu_v11_0_load_microcode(struct smu_context *smu);
@@ -182,9 +184,8 @@ int smu_v11_0_system_features_control(struct smu_context *smu,
 int
 smu_v11_0_send_msg_with_param(struct smu_context *smu,
 			      enum smu_message_type msg,
-			      uint32_t param);
-
-int smu_v11_0_read_arg(struct smu_context *smu, uint32_t *arg);
+			      uint32_t param,
+			      uint32_t *read_arg);
 
 int smu_v11_0_init_display_count(struct smu_context *smu, uint32_t count);
 
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h
index d79e54b5ebf6..bb17730d1707 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h
@@ -47,7 +47,8 @@ int smu_v12_0_wait_for_response(struct smu_context *smu);
 int
 smu_v12_0_send_msg_with_param(struct smu_context *smu,
 			      enum smu_message_type msg,
-			      uint32_t param);
+			      uint32_t param,
+			      uint32_t *read_arg);
 
 int smu_v12_0_check_fw_status(struct smu_context *smu);
 
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 0d73a49166af..9f7c7427f7e0 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -661,14 +661,14 @@ static int navi10_dpm_set_uvd_enable(struct smu_context *smu, bool enable)
 	if (enable) {
 		/* vcn dpm on is a prerequisite for vcn power gate messages */
 		if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
-			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn, 1);
+			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn, 1, NULL);
 			if (ret)
 				return ret;
 		}
 		power_gate->vcn_gated = false;
 	} else {
 		if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
-			ret = smu_send_smc_msg(smu, SMU_MSG_PowerDownVcn);
+			ret = smu_send_smc_msg(smu, SMU_MSG_PowerDownVcn, NULL);
 			if (ret)
 				return ret;
 		}
@@ -686,14 +686,14 @@ static int navi10_dpm_set_jpeg_enable(struct smu_context *smu, bool enable)
 
 	if (enable) {
 		if (smu_feature_is_enabled(smu, SMU_FEATURE_JPEG_PG_BIT)) {
-			ret = smu_send_smc_msg(smu, SMU_MSG_PowerUpJpeg);
+			ret = smu_send_smc_msg(smu, SMU_MSG_PowerUpJpeg, NULL);
 			if (ret)
 				return ret;
 		}
 		power_gate->jpeg_gated = false;
 	} else {
 		if (smu_feature_is_enabled(smu, SMU_FEATURE_JPEG_PG_BIT)) {
-			ret = smu_send_smc_msg(smu, SMU_MSG_PowerDownJpeg);
+			ret = smu_send_smc_msg(smu, SMU_MSG_PowerDownJpeg, NULL);
 			if (ret)
 				return ret;
 		}
@@ -1042,7 +1042,7 @@ static int navi10_pre_display_config_changed(struct smu_context *smu)
 	int ret = 0;
 	uint32_t max_freq = 0;
 
-	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, 0);
+	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, 0, NULL);
 	if (ret)
 		return ret;
 
@@ -1075,7 +1075,8 @@ static int navi10_display_config_changed(struct smu_context *smu)
 	    smu_feature_is_supported(smu, SMU_FEATURE_DPM_DCEFCLK_BIT) &&
 	    smu_feature_is_supported(smu, SMU_FEATURE_DPM_SOCCLK_BIT)) {
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays,
-						  smu->display_config->num_display);
+						  smu->display_config->num_display,
+						  NULL);
 		if (ret)
 			return ret;
 	}
@@ -1400,7 +1401,7 @@ static int navi10_set_power_profile_mode(struct smu_context *smu, long *input, u
 	if (workload_type < 0)
 		return -EINVAL;
 	smu_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
-				    1 << workload_type);
+				    1 << workload_type, NULL);
 
 	return ret;
 }
@@ -1465,7 +1466,8 @@ static int navi10_notify_smc_display_config(struct smu_context *smu)
 			if (smu_feature_is_supported(smu, SMU_FEATURE_DS_DCEFCLK_BIT)) {
 				ret = smu_send_smc_msg_with_param(smu,
 								  SMU_MSG_SetMinDeepSleepDcefclk,
-								  min_clocks.dcef_clock_in_sr/100);
+								  min_clocks.dcef_clock_in_sr/100,
+								  NULL);
 				if (ret) {
 					pr_err("Attempt to set divider for DCEFCLK Failed!");
 					return ret;
@@ -1855,12 +1857,11 @@ static int navi10_get_power_limit(struct smu_context *smu,
 				return -EINVAL;
 
 			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetPptLimit,
-				power_src << 16);
+				power_src << 16, &asic_default_power_limit);
 			if (ret) {
 				pr_err("[%s] get PPT limit failed!", __func__);
 				return ret;
 			}
-			smu_read_smc_arg(smu, &asic_default_power_limit);
 		} else {
 			/* the last hope to figure out the ppt limit */
 			if (!pptable) {
@@ -1900,7 +1901,8 @@ static int navi10_update_pcie_parameters(struct smu_context *smu,
 					pptable->PcieLaneCount[i] : pcie_width_cap);
 		ret = smu_send_smc_msg_with_param(smu,
 					  SMU_MSG_OverridePcieParameters,
-					  smu_pcie_arg);
+					  smu_pcie_arg,
+					  NULL);
 
 		if (ret)
 			return ret;
@@ -1946,13 +1948,13 @@ static int navi10_overdrive_get_gfx_clk_base_voltage(struct smu_context *smu,
 
 	ret = smu_send_smc_msg_with_param(smu,
 					  SMU_MSG_GetVoltageByDpm,
-					  param);
+					  param,
+					  &value);
 	if (ret) {
 		pr_err("[GetBaseVoltage] failed to get GFXCLK AVFS voltage from SMU!");
 		return ret;
 	}
 
-	smu_read_smc_arg(smu, &value);
 	*voltage = (uint16_t)value;
 
 	return 0;
@@ -2209,7 +2211,7 @@ static int navi10_run_btc(struct smu_context *smu)
 {
 	int ret = 0;
 
-	ret = smu_send_smc_msg(smu, SMU_MSG_RunBtc);
+	ret = smu_send_smc_msg(smu, SMU_MSG_RunBtc, NULL);
 	if (ret)
 		pr_err("RunBtc failed!\n");
 
@@ -2221,9 +2223,9 @@ static int navi10_dummy_pstate_control(struct smu_context *smu, bool enable)
 	int result = 0;
 
 	if (!enable)
-		result = smu_send_smc_msg(smu, SMU_MSG_DAL_DISABLE_DUMMY_PSTATE_CHANGE);
+		result = smu_send_smc_msg(smu, SMU_MSG_DAL_DISABLE_DUMMY_PSTATE_CHANGE, NULL);
 	else
-		result = smu_send_smc_msg(smu, SMU_MSG_DAL_ENABLE_DUMMY_PSTATE_CHANGE);
+		result = smu_send_smc_msg(smu, SMU_MSG_DAL_ENABLE_DUMMY_PSTATE_CHANGE, NULL);
 
 	return result;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
index 810994017f49..974d2bd60928 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -342,14 +342,14 @@ static int renoir_dpm_set_uvd_enable(struct smu_context *smu, bool enable)
 	if (enable) {
 		/* vcn dpm on is a prerequisite for vcn power gate messages */
 		if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
-			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn, 0);
+			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn, 0, NULL);
 			if (ret)
 				return ret;
 		}
 		power_gate->vcn_gated = false;
 	} else {
 		if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
-			ret = smu_send_smc_msg(smu, SMU_MSG_PowerDownVcn);
+			ret = smu_send_smc_msg(smu, SMU_MSG_PowerDownVcn, NULL);
 			if (ret)
 				return ret;
 		}
@@ -367,14 +367,14 @@ static int renoir_dpm_set_jpeg_enable(struct smu_context *smu, bool enable)
 
 	if (enable) {
 		if (smu_feature_is_enabled(smu, SMU_FEATURE_JPEG_PG_BIT)) {
-			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpJpeg, 0);
+			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpJpeg, 0, NULL);
 			if (ret)
 				return ret;
 		}
 		power_gate->jpeg_gated = false;
 	} else {
 		if (smu_feature_is_enabled(smu, SMU_FEATURE_JPEG_PG_BIT)) {
-			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerDownJpeg, 0);
+			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerDownJpeg, 0, NULL);
 			if (ret)
 				return ret;
 		}
@@ -622,22 +622,24 @@ static int renoir_force_clk_levels(struct smu_context *smu,
 			return ret;
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxGfxClk,
 					soft_max_level == 0 ? min_freq :
-					soft_max_level == 1 ? RENOIR_UMD_PSTATE_GFXCLK : max_freq);
+					soft_max_level == 1 ? RENOIR_UMD_PSTATE_GFXCLK : max_freq,
+					NULL);
 		if (ret)
 			return ret;
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinGfxClk,
 					soft_min_level == 2 ? max_freq :
-					soft_min_level == 1 ? RENOIR_UMD_PSTATE_GFXCLK : min_freq);
+					soft_min_level == 1 ? RENOIR_UMD_PSTATE_GFXCLK : min_freq,
+					NULL);
 		if (ret)
 			return ret;
 		break;
 	case SMU_SOCCLK:
 		GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_freq);
 		GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_freq);
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxSocclkByFreq, max_freq);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxSocclkByFreq, max_freq, NULL);
 		if (ret)
 			return ret;
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinSocclkByFreq, min_freq);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinSocclkByFreq, min_freq, NULL);
 		if (ret)
 			return ret;
 		break;
@@ -645,10 +647,10 @@ static int renoir_force_clk_levels(struct smu_context *smu,
 	case SMU_FCLK:
 		GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_freq);
 		GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_freq);
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxFclkByFreq, max_freq);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxFclkByFreq, max_freq, NULL);
 		if (ret)
 			return ret;
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinFclkByFreq, min_freq);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinFclkByFreq, min_freq, NULL);
 		if (ret)
 			return ret;
 		break;
@@ -681,7 +683,8 @@ static int renoir_set_power_profile_mode(struct smu_context *smu, long *input, u
 	}
 
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
-				    1 << workload_type);
+				    1 << workload_type,
+				    NULL);
 	if (ret) {
 		pr_err_once("Fail to set workload type %d\n", workload_type);
 		return ret;
diff --git a/drivers/gpu/drm/amd/powerplay/smu_internal.h b/drivers/gpu/drm/amd/powerplay/smu_internal.h
index 7bd200ffcda8..6b2ba0170d8a 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_internal.h
+++ b/drivers/gpu/drm/amd/powerplay/smu_internal.h
@@ -79,10 +79,13 @@
 #define smu_set_default_od_settings(smu, initialize) \
 	((smu)->ppt_funcs->set_default_od_settings ? (smu)->ppt_funcs->set_default_od_settings((smu), (initialize)) : 0)
 
-int smu_send_smc_msg(struct smu_context *smu, enum smu_message_type msg);
+#define smu_send_smc_msg_with_param(smu, msg, param, read_arg) \
+	((smu)->ppt_funcs->send_smc_msg_with_param? (smu)->ppt_funcs->send_smc_msg_with_param((smu), (msg), (param), (read_arg)) : 0)
+
+static inline int smu_send_smc_msg(struct smu_context *smu, enum smu_message_type msg, uint32_t *read_arg) {
+	return smu_send_smc_msg_with_param(smu, msg, 0, read_arg);
+}
 
-#define smu_send_smc_msg_with_param(smu, msg, param) \
-	((smu)->ppt_funcs->send_smc_msg_with_param? (smu)->ppt_funcs->send_smc_msg_with_param((smu), (msg), (param)) : 0)
 #define smu_read_smc_arg(smu, arg) \
 	((smu)->ppt_funcs->read_smc_arg? (smu)->ppt_funcs->read_smc_arg((smu), (arg)) : 0)
 #define smu_alloc_dpm_context(smu) \
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
index 1507bb745cbd..9865a71abf29 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -92,7 +92,8 @@ static int smu_v11_0_wait_for_response(struct smu_context *smu)
 int
 smu_v11_0_send_msg_with_param(struct smu_context *smu,
 			      enum smu_message_type msg,
-			      uint32_t param)
+			      uint32_t param,
+			      uint32_t *read_arg)
 {
 	struct amdgpu_device *adev = smu->adev;
 	int ret = 0, index = 0;
@@ -115,11 +116,21 @@ smu_v11_0_send_msg_with_param(struct smu_context *smu,
 	smu_v11_0_send_msg_without_waiting(smu, (uint16_t)index);
 
 	ret = smu_v11_0_wait_for_response(smu);
-	if (ret)
+	if (ret) {
 		pr_err("failed send message: %10s (%d) \tparam: 0x%08x response %#x\n",
 		       smu_get_message_name(smu, msg), index, param, ret);
+		return ret;
+	}
+	if (read_arg) {
+		ret = smu_v11_0_read_arg(smu, read_arg);
+		if (ret) {
+			pr_err("failed to read message arg: %10s (%d) \tparam: 0x%08x response %#x\n",
+			       smu_get_message_name(smu, msg), index, param, ret);
+			return ret;
+		}
+	}
 
-	return ret;
+	return 0;
 }
 
 int smu_v11_0_init_microcode(struct smu_context *smu)
@@ -671,12 +682,14 @@ int smu_v11_0_notify_memory_pool_location(struct smu_context *smu)
 
 	ret = smu_send_smc_msg_with_param(smu,
 					  SMU_MSG_SetSystemVirtualDramAddrHigh,
-					  address_high);
+					  address_high,
+					  NULL);
 	if (ret)
 		return ret;
 	ret = smu_send_smc_msg_with_param(smu,
 					  SMU_MSG_SetSystemVirtualDramAddrLow,
-					  address_low);
+					  address_low,
+					  NULL);
 	if (ret)
 		return ret;
 
@@ -685,15 +698,15 @@ int smu_v11_0_notify_memory_pool_location(struct smu_context *smu)
 	address_low  = (uint32_t)lower_32_bits(address);
 
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_DramLogSetDramAddrHigh,
-					  address_high);
+					  address_high, NULL);
 	if (ret)
 		return ret;
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_DramLogSetDramAddrLow,
-					  address_low);
+					  address_low, NULL);
 	if (ret)
 		return ret;
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_DramLogSetDramSize,
-					  (uint32_t)memory_pool->size);
+					  (uint32_t)memory_pool->size, NULL);
 	if (ret)
 		return ret;
 
@@ -757,7 +770,7 @@ int smu_v11_0_set_deep_sleep_dcefclk(struct smu_context *smu, uint32_t clk)
 	int ret;
 
 	ret = smu_send_smc_msg_with_param(smu,
-					  SMU_MSG_SetMinDeepSleepDcefclk, clk);
+					  SMU_MSG_SetMinDeepSleepDcefclk, clk, NULL);
 	if (ret)
 		pr_err("SMU11 attempt to set divider for DCEFCLK Failed!");
 
@@ -784,11 +797,13 @@ int smu_v11_0_set_driver_table_location(struct smu_context *smu)
 	if (driver_table->mc_address) {
 		ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_SetDriverDramAddrHigh,
-				upper_32_bits(driver_table->mc_address));
+				upper_32_bits(driver_table->mc_address),
+				NULL);
 		if (!ret)
 			ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_SetDriverDramAddrLow,
-				lower_32_bits(driver_table->mc_address));
+				lower_32_bits(driver_table->mc_address),
+				NULL);
 	}
 
 	return ret;
@@ -802,11 +817,13 @@ int smu_v11_0_set_tool_table_location(struct smu_context *smu)
 	if (tool_table->mc_address) {
 		ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_SetToolsDramAddrHigh,
-				upper_32_bits(tool_table->mc_address));
+				upper_32_bits(tool_table->mc_address),
+				NULL);
 		if (!ret)
 			ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_SetToolsDramAddrLow,
-				lower_32_bits(tool_table->mc_address));
+				lower_32_bits(tool_table->mc_address),
+				NULL);
 	}
 
 	return ret;
@@ -819,7 +836,7 @@ int smu_v11_0_init_display_count(struct smu_context *smu, uint32_t count)
 	if (!smu->pm_enabled)
 		return ret;
 
-	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, count);
+	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, count, NULL);
 	return ret;
 }
 
@@ -837,12 +854,12 @@ int smu_v11_0_set_allowed_mask(struct smu_context *smu)
 	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
 
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
-					  feature_mask[1]);
+					  feature_mask[1], NULL);
 	if (ret)
 		goto failed;
 
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskLow,
-					  feature_mask[0]);
+					  feature_mask[0], NULL);
 	if (ret)
 		goto failed;
 
@@ -862,17 +879,11 @@ int smu_v11_0_get_enabled_mask(struct smu_context *smu,
 		return -EINVAL;
 
 	if (bitmap_empty(feature->enabled, feature->feature_num)) {
-		ret = smu_send_smc_msg(smu, SMU_MSG_GetEnabledSmuFeaturesHigh);
-		if (ret)
-			return ret;
-		ret = smu_read_smc_arg(smu, &feature_mask_high);
+		ret = smu_send_smc_msg(smu, SMU_MSG_GetEnabledSmuFeaturesHigh, &feature_mask_high);
 		if (ret)
 			return ret;
 
-		ret = smu_send_smc_msg(smu, SMU_MSG_GetEnabledSmuFeaturesLow);
-		if (ret)
-			return ret;
-		ret = smu_read_smc_arg(smu, &feature_mask_low);
+		ret = smu_send_smc_msg(smu, SMU_MSG_GetEnabledSmuFeaturesLow, &feature_mask_low);
 		if (ret)
 			return ret;
 
@@ -894,7 +905,7 @@ int smu_v11_0_system_features_control(struct smu_context *smu,
 	int ret = 0;
 
 	ret = smu_send_smc_msg(smu, (en ? SMU_MSG_EnableAllSmuFeatures :
-				     SMU_MSG_DisableAllSmuFeatures));
+				     SMU_MSG_DisableAllSmuFeatures), NULL);
 	if (ret)
 		return ret;
 
@@ -923,7 +934,7 @@ int smu_v11_0_notify_display_change(struct smu_context *smu)
 		return ret;
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT) &&
 	    smu->adev->gmc.vram_type == AMDGPU_VRAM_TYPE_HBM)
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetUclkFastSwitch, 1);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetUclkFastSwitch, 1, NULL);
 
 	return ret;
 }
@@ -947,30 +958,24 @@ smu_v11_0_get_max_sustainable_clock(struct smu_context *smu, uint32_t *clock,
 		return -EINVAL;
 
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetDcModeMaxDpmFreq,
-					  clk_id << 16);
+					  clk_id << 16, clock);
 	if (ret) {
 		pr_err("[GetMaxSustainableClock] Failed to get max DC clock from SMC!");
 		return ret;
 	}
 
-	ret = smu_read_smc_arg(smu, clock);
-	if (ret)
-		return ret;
-
 	if (*clock != 0)
 		return 0;
 
 	/* if DC limit is zero, return AC limit */
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetMaxDpmFreq,
-					  clk_id << 16);
+					  clk_id << 16, clock);
 	if (ret) {
 		pr_err("[GetMaxSustainableClock] failed to get max AC clock from SMC!");
 		return ret;
 	}
 
-	ret = smu_read_smc_arg(smu, clock);
-
-	return ret;
+	return 0;
 }
 
 int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
@@ -1106,7 +1111,7 @@ int smu_v11_0_set_power_limit(struct smu_context *smu, uint32_t n)
 		return -EOPNOTSUPP;
 	}
 
-	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetPptLimit, n);
+	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetPptLimit, n, NULL);
 	if (ret) {
 		pr_err("[%s] Set power limit Failed!\n", __func__);
 		return ret;
@@ -1136,11 +1141,7 @@ int smu_v11_0_get_current_clk_freq(struct smu_context *smu,
 		ret =  smu_get_current_clk_freq_by_table(smu, clk_id, &freq);
 	else {
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetDpmClockFreq,
-						  (asic_clk_id << 16));
-		if (ret)
-			return ret;
-
-		ret = smu_read_smc_arg(smu, &freq);
+						  (asic_clk_id << 16), &freq);
 		if (ret)
 			return ret;
 	}
@@ -1375,9 +1376,9 @@ int smu_v11_0_gfx_off_control(struct smu_context *smu, bool enable)
 		if (!(adev->pm.pp_feature & PP_GFXOFF_MASK))
 			return 0;
 		if (enable)
-			ret = smu_send_smc_msg(smu, SMU_MSG_AllowGfxOff);
+			ret = smu_send_smc_msg(smu, SMU_MSG_AllowGfxOff, NULL);
 		else
-			ret = smu_send_smc_msg(smu, SMU_MSG_DisallowGfxOff);
+			ret = smu_send_smc_msg(smu, SMU_MSG_DisallowGfxOff, NULL);
 		break;
 	default:
 		break;
@@ -1515,7 +1516,8 @@ int smu_v11_0_set_xgmi_pstate(struct smu_context *smu,
 	int ret = 0;
 	ret = smu_send_smc_msg_with_param(smu,
 					  SMU_MSG_SetXgmiMode,
-					  pstate ? XGMI_MODE_PSTATE_D0 : XGMI_MODE_PSTATE_D3);
+					  pstate ? XGMI_MODE_PSTATE_D0 : XGMI_MODE_PSTATE_D3,
+					  NULL);
 	return ret;
 }
 
@@ -1628,14 +1630,14 @@ int smu_v11_0_set_azalia_d3_pme(struct smu_context *smu)
 {
 	int ret = 0;
 
-	ret = smu_send_smc_msg(smu, SMU_MSG_BacoAudioD3PME);
+	ret = smu_send_smc_msg(smu, SMU_MSG_BacoAudioD3PME, NULL);
 
 	return ret;
 }
 
 static int smu_v11_0_baco_set_armd3_sequence(struct smu_context *smu, enum smu_v11_0_baco_seq baco_seq)
 {
-	return smu_send_smc_msg_with_param(smu, SMU_MSG_ArmD3, baco_seq);
+	return smu_send_smc_msg_with_param(smu, SMU_MSG_ArmD3, baco_seq, NULL);
 }
 
 bool smu_v11_0_baco_is_support(struct smu_context *smu)
@@ -1704,12 +1706,12 @@ int smu_v11_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state)
 			data |= 0x80000000;
 			WREG32_SOC15(THM, 0, mmTHM_BACO_CNTL, data);
 
-			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_EnterBaco, 0);
+			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_EnterBaco, 0, NULL);
 		} else {
-			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_EnterBaco, 1);
+			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_EnterBaco, 1, NULL);
 		}
 	} else {
-		ret = smu_send_smc_msg(smu, SMU_MSG_ExitBaco);
+		ret = smu_send_smc_msg(smu, SMU_MSG_ExitBaco, NULL);
 		if (ret)
 			goto out;
 
@@ -1777,19 +1779,13 @@ int smu_v11_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type c
 	param = (clk_id & 0xffff) << 16;
 
 	if (max) {
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetMaxDpmFreq, param);
-		if (ret)
-			goto failed;
-		ret = smu_read_smc_arg(smu, max);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetMaxDpmFreq, param, max);
 		if (ret)
 			goto failed;
 	}
 
 	if (min) {
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetMinDpmFreq, param);
-		if (ret)
-			goto failed;
-		ret = smu_read_smc_arg(smu, min);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetMinDpmFreq, param, min);
 		if (ret)
 			goto failed;
 	}
@@ -1816,7 +1812,7 @@ int smu_v11_0_set_soft_freq_limited_range(struct smu_context *smu, enum smu_clk_
 	if (max > 0 && max <=  max_freq) {
 		param = (uint32_t)((clk_id << 16) | (max & 0xffff));
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxByFreq,
-						  param);
+						  param, NULL);
 		if (ret)
 			return ret;
 	}
@@ -1824,7 +1820,7 @@ int smu_v11_0_set_soft_freq_limited_range(struct smu_context *smu, enum smu_clk_
 	if (min > 0 && min >= min_freq) {
 		param = (uint32_t)((clk_id << 16) | (min & 0xffff));
 		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMinByFreq,
-						  param);
+						  param, NULL);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
index 870e6db2907e..2e4bb77a67be 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
@@ -78,7 +78,8 @@ int smu_v12_0_wait_for_response(struct smu_context *smu)
 int
 smu_v12_0_send_msg_with_param(struct smu_context *smu,
 			      enum smu_message_type msg,
-			      uint32_t param)
+			      uint32_t param,
+			      uint32_t *read_arg)
 {
 	struct amdgpu_device *adev = smu->adev;
 	int ret = 0, index = 0;
@@ -101,9 +102,19 @@ smu_v12_0_send_msg_with_param(struct smu_context *smu,
 	smu_v12_0_send_msg_without_waiting(smu, (uint16_t)index);
 
 	ret = smu_v12_0_wait_for_response(smu);
-	if (ret)
+	if (ret) {
 		pr_err("Failed to send message 0x%x, response 0x%x param 0x%x\n",
 		       index, ret, param);
+		return ret;
+	}
+	if (read_arg) {
+		ret = smu_v12_0_read_arg(smu, read_arg);
+		if (ret) {
+			pr_err("Failed to read message arg 0x%x, response 0x%x param 0x%x\n",
+			       index, ret, param);
+			return ret;
+		}
+	}
 
 	return ret;
 }
@@ -163,9 +174,9 @@ int smu_v12_0_powergate_sdma(struct smu_context *smu, bool gate)
 		return 0;
 
 	if (gate)
-		return smu_send_smc_msg(smu, SMU_MSG_PowerDownSdma);
+		return smu_send_smc_msg(smu, SMU_MSG_PowerDownSdma, NULL);
 	else
-		return smu_send_smc_msg(smu, SMU_MSG_PowerUpSdma);
+		return smu_send_smc_msg(smu, SMU_MSG_PowerUpSdma, NULL);
 }
 
 int smu_v12_0_powergate_vcn(struct smu_context *smu, bool gate)
@@ -174,9 +185,9 @@ int smu_v12_0_powergate_vcn(struct smu_context *smu, bool gate)
 		return 0;
 
 	if (gate)
-		return smu_send_smc_msg(smu, SMU_MSG_PowerDownVcn);
+		return smu_send_smc_msg(smu, SMU_MSG_PowerDownVcn, NULL);
 	else
-		return smu_send_smc_msg(smu, SMU_MSG_PowerUpVcn);
+		return smu_send_smc_msg(smu, SMU_MSG_PowerUpVcn, NULL);
 }
 
 int smu_v12_0_powergate_jpeg(struct smu_context *smu, bool gate)
@@ -185,9 +196,9 @@ int smu_v12_0_powergate_jpeg(struct smu_context *smu, bool gate)
 		return 0;
 
 	if (gate)
-		return smu_send_smc_msg_with_param(smu, SMU_MSG_PowerDownJpeg, 0);
+		return smu_send_smc_msg_with_param(smu, SMU_MSG_PowerDownJpeg, 0, NULL);
 	else
-		return smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpJpeg, 0);
+		return smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpJpeg, 0, NULL);
 }
 
 int smu_v12_0_set_gfx_cgpg(struct smu_context *smu, bool enable)
@@ -196,7 +207,9 @@ int smu_v12_0_set_gfx_cgpg(struct smu_context *smu, bool enable)
 		return 0;
 
 	return smu_v12_0_send_msg_with_param(smu,
-		SMU_MSG_SetGfxCGPG, enable ? 1 : 0);
+		SMU_MSG_SetGfxCGPG,
+		enable ? 1 : 0,
+		NULL);
 }
 
 int smu_v12_0_read_sensor(struct smu_context *smu,
@@ -262,10 +275,10 @@ int smu_v12_0_gfx_off_control(struct smu_context *smu, bool enable)
 	int ret = 0, timeout = 500;
 
 	if (enable) {
-		ret = smu_send_smc_msg(smu, SMU_MSG_AllowGfxOff);
+		ret = smu_send_smc_msg(smu, SMU_MSG_AllowGfxOff, NULL);
 
 	} else {
-		ret = smu_send_smc_msg(smu, SMU_MSG_DisallowGfxOff);
+		ret = smu_send_smc_msg(smu, SMU_MSG_DisallowGfxOff, NULL);
 
 		/* confirm gfx is back to "on" state, timeout is 0.5 second */
 		while (!(smu_v12_0_get_gfxoff_status(smu) == 2)) {
@@ -331,17 +344,11 @@ int smu_v12_0_get_enabled_mask(struct smu_context *smu,
 	if (!feature_mask || num < 2)
 		return -EINVAL;
 
-	ret = smu_send_smc_msg(smu, SMU_MSG_GetEnabledSmuFeaturesHigh);
-	if (ret)
-		return ret;
-	ret = smu_read_smc_arg(smu, &feature_mask_high);
+	ret = smu_send_smc_msg(smu, SMU_MSG_GetEnabledSmuFeaturesHigh, &feature_mask_high);
 	if (ret)
 		return ret;
 
-	ret = smu_send_smc_msg(smu, SMU_MSG_GetEnabledSmuFeaturesLow);
-	if (ret)
-		return ret;
-	ret = smu_read_smc_arg(smu, &feature_mask_low);
+	ret = smu_send_smc_msg(smu, SMU_MSG_GetEnabledSmuFeaturesLow, &feature_mask_low);
 	if (ret)
 		return ret;
 
@@ -388,14 +395,11 @@ int smu_v12_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type c
 		switch (clk_type) {
 		case SMU_GFXCLK:
 		case SMU_SCLK:
-			ret = smu_send_smc_msg(smu, SMU_MSG_GetMaxGfxclkFrequency);
+			ret = smu_send_smc_msg(smu, SMU_MSG_GetMaxGfxclkFrequency, max);
 			if (ret) {
 				pr_err("Attempt to get max GX frequency from SMC Failed !\n");
 				goto failed;
 			}
-			ret = smu_read_smc_arg(smu, max);
-			if (ret)
-				goto failed;
 			break;
 		case SMU_UCLK:
 		case SMU_FCLK:
@@ -419,14 +423,11 @@ int smu_v12_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type c
 		switch (clk_type) {
 		case SMU_GFXCLK:
 		case SMU_SCLK:
-			ret = smu_send_smc_msg(smu, SMU_MSG_GetMinGfxclkFrequency);
+			ret = smu_send_smc_msg(smu, SMU_MSG_GetMinGfxclkFrequency, min);
 			if (ret) {
 				pr_err("Attempt to get min GX frequency from SMC Failed !\n");
 				goto failed;
 			}
-			ret = smu_read_smc_arg(smu, min);
-			if (ret)
-				goto failed;
 			break;
 		case SMU_UCLK:
 		case SMU_FCLK:
@@ -450,7 +451,7 @@ int smu_v12_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type c
 }
 
 int smu_v12_0_mode2_reset(struct smu_context *smu){
-	return smu_v12_0_send_msg_with_param(smu, SMU_MSG_GfxDeviceDriverReset, SMU_RESET_MODE_2);
+	return smu_v12_0_send_msg_with_param(smu, SMU_MSG_GfxDeviceDriverReset, SMU_RESET_MODE_2, NULL);
 }
 
 int smu_v12_0_set_soft_freq_limited_range(struct smu_context *smu, enum smu_clk_type clk_type,
@@ -464,39 +465,39 @@ int smu_v12_0_set_soft_freq_limited_range(struct smu_context *smu, enum smu_clk_
 	switch (clk_type) {
 	case SMU_GFXCLK:
 	case SMU_SCLK:
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinGfxClk, min);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinGfxClk, min, NULL);
 		if (ret)
 			return ret;
 
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxGfxClk, max);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxGfxClk, max, NULL);
 		if (ret)
 			return ret;
 	break;
 	case SMU_FCLK:
 	case SMU_MCLK:
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinFclkByFreq, min);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinFclkByFreq, min, NULL);
 		if (ret)
 			return ret;
 
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxFclkByFreq, max);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxFclkByFreq, max, NULL);
 		if (ret)
 			return ret;
 	break;
 	case SMU_SOCCLK:
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinSocclkByFreq, min);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinSocclkByFreq, min, NULL);
 		if (ret)
 			return ret;
 
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxSocclkByFreq, max);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxSocclkByFreq, max, NULL);
 		if (ret)
 			return ret;
 	break;
 	case SMU_VCLK:
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinVcn, min);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinVcn, min, NULL);
 		if (ret)
 			return ret;
 
-		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxVcn, max);
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxVcn, max, NULL);
 		if (ret)
 			return ret;
 	break;
@@ -515,11 +516,13 @@ int smu_v12_0_set_driver_table_location(struct smu_context *smu)
 	if (driver_table->mc_address) {
 		ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_SetDriverDramAddrHigh,
-				upper_32_bits(driver_table->mc_address));
+				upper_32_bits(driver_table->mc_address),
+				NULL);
 		if (!ret)
 			ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_SetDriverDramAddrLow,
-				lower_32_bits(driver_table->mc_address));
+				lower_32_bits(driver_table->mc_address),
+				NULL);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
index 4ad8d6c14ee5..fb3f3ce6a113 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -587,7 +587,7 @@ static int vega20_check_powerplay_table(struct smu_context *smu)
 
 static int vega20_run_btc_afll(struct smu_context *smu)
 {
-	return smu_send_smc_msg(smu, SMU_MSG_RunAfllBtc);
+	return smu_send_smc_msg(smu, SMU_MSG_RunAfllBtc, NULL);
 }
 
 #define FEATURE_MASK(feature) (1ULL << feature)
@@ -670,13 +670,13 @@ vega20_set_single_dpm_table(struct smu_context *smu,
 
 	ret = smu_send_smc_msg_with_param(smu,
 			SMU_MSG_GetDpmFreqByIndex,
-			(clk_id << 16 | 0xFF));
+			(clk_id << 16 | 0xFF),
+			&num_of_levels);
 	if (ret) {
 		pr_err("[GetNumOfDpmLevel] failed to get dpm levels!");
 		return ret;
 	}
 
-	smu_read_smc_arg(smu, &num_of_levels);
 	if (!num_of_levels) {
 		pr_err("[GetNumOfDpmLevel] number of clk levels is invalid!");
 		return -EINVAL;
@@ -687,12 +687,12 @@ vega20_set_single_dpm_table(struct smu_context *smu,
 	for (i = 0; i < num_of_levels; i++) {
 		ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_GetDpmFreqByIndex,
-				(clk_id << 16 | i));
+				(clk_id << 16 | i),
+				&clk);
 		if (ret) {
 			pr_err("[GetDpmFreqByIndex] failed to get dpm freq by index!");
 			return ret;
 		}
-		smu_read_smc_arg(smu, &clk);
 		if (!clk) {
 			pr_err("[GetDpmFreqByIndex] clk value is invalid!");
 			return -EINVAL;
@@ -1200,7 +1200,8 @@ static int vega20_upload_dpm_level(struct smu_context *smu, bool max,
 			single_dpm_table->dpm_state.soft_min_level;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
-			(PPCLK_GFXCLK << 16) | (freq & 0xffff));
+			(PPCLK_GFXCLK << 16) | (freq & 0xffff),
+			NULL);
 		if (ret) {
 			pr_err("Failed to set soft %s gfxclk !\n",
 						max ? "max" : "min");
@@ -1215,7 +1216,8 @@ static int vega20_upload_dpm_level(struct smu_context *smu, bool max,
 			single_dpm_table->dpm_state.soft_min_level;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
-			(PPCLK_UCLK << 16) | (freq & 0xffff));
+			(PPCLK_UCLK << 16) | (freq & 0xffff),
+			NULL);
 		if (ret) {
 			pr_err("Failed to set soft %s memclk !\n",
 						max ? "max" : "min");
@@ -1230,7 +1232,8 @@ static int vega20_upload_dpm_level(struct smu_context *smu, bool max,
 			single_dpm_table->dpm_state.soft_min_level;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
-			(PPCLK_SOCCLK << 16) | (freq & 0xffff));
+			(PPCLK_SOCCLK << 16) | (freq & 0xffff),
+			NULL);
 		if (ret) {
 			pr_err("Failed to set soft %s socclk !\n",
 						max ? "max" : "min");
@@ -1245,7 +1248,8 @@ static int vega20_upload_dpm_level(struct smu_context *smu, bool max,
 			single_dpm_table->dpm_state.soft_min_level;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
-			(PPCLK_FCLK << 16) | (freq & 0xffff));
+			(PPCLK_FCLK << 16) | (freq & 0xffff),
+			NULL);
 		if (ret) {
 			pr_err("Failed to set soft %s fclk !\n",
 						max ? "max" : "min");
@@ -1260,7 +1264,8 @@ static int vega20_upload_dpm_level(struct smu_context *smu, bool max,
 		if (!max) {
 			ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_SetHardMinByFreq,
-				(PPCLK_DCEFCLK << 16) | (freq & 0xffff));
+				(PPCLK_DCEFCLK << 16) | (freq & 0xffff),
+				NULL);
 			if (ret) {
 				pr_err("Failed to set hard min dcefclk !\n");
 				return ret;
@@ -1421,7 +1426,9 @@ static int vega20_force_clk_levels(struct smu_context *smu,
 		}
 
 		ret = smu_send_smc_msg_with_param(smu,
-				SMU_MSG_SetMinLinkDpmByIndex, soft_min_level);
+				SMU_MSG_SetMinLinkDpmByIndex,
+				soft_min_level,
+				NULL);
 		if (ret)
 			pr_err("Failed to set min link dpm level!\n");
 
@@ -1477,13 +1484,13 @@ static int vega20_overdrive_get_gfx_clk_base_voltage(struct smu_context *smu,
 
 	ret = smu_send_smc_msg_with_param(smu,
 			SMU_MSG_GetAVFSVoltageByDpm,
-			((AVFS_CURVE << 24) | (OD8_HOTCURVE_TEMPERATURE << 16) | freq));
+			((AVFS_CURVE << 24) | (OD8_HOTCURVE_TEMPERATURE << 16) | freq),
+			voltage);
 	if (ret) {
 		pr_err("[GetBaseVoltage] failed to get GFXCLK AVFS voltage from SMU!");
 		return ret;
 	}
 
-	smu_read_smc_arg(smu, voltage);
 	*voltage = *voltage / VOLTAGE_SCALE;
 
 	return 0;
@@ -1956,8 +1963,10 @@ static int vega20_set_power_profile_mode(struct smu_context *smu, long *input, u
 	workload_type = smu_workload_get_type(smu, smu->power_profile_mode);
 	if (workload_type < 0)
 		return -EINVAL;
-	smu_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
-				    1 << workload_type);
+	smu_send_smc_msg_with_param(smu,
+			SMU_MSG_SetWorkloadMask,
+			1 << workload_type,
+			NULL);
 
 	return ret;
 }
@@ -2029,7 +2038,8 @@ vega20_set_uclk_to_highest_dpm_level(struct smu_context *smu,
 		dpm_table->dpm_state.hard_min_level = dpm_table->dpm_levels[dpm_table->count - 1].value;
 		ret = smu_send_smc_msg_with_param(smu,
 				SMU_MSG_SetHardMinByFreq,
-				(PPCLK_UCLK << 16) | dpm_table->dpm_state.hard_min_level);
+				(PPCLK_UCLK << 16) | dpm_table->dpm_state.hard_min_level,
+				NULL);
 		if (ret) {
 			pr_err("[%s] Set hard min uclk failed!", __func__);
 				return ret;
@@ -2047,7 +2057,7 @@ static int vega20_pre_display_config_changed(struct smu_context *smu)
 	if (!smu->smu_dpm.dpm_context)
 		return -EINVAL;
 
-	smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, 0);
+	smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, 0, NULL);
 	ret = vega20_set_uclk_to_highest_dpm_level(smu,
 						   &dpm_table->mem_table);
 	if (ret)
@@ -2074,7 +2084,8 @@ static int vega20_display_config_changed(struct smu_context *smu)
 	    smu_feature_is_supported(smu, SMU_FEATURE_DPM_SOCCLK_BIT)) {
 		smu_send_smc_msg_with_param(smu,
 					    SMU_MSG_NumOfDisplays,
-					    smu->display_config->num_display);
+					    smu->display_config->num_display,
+					    NULL);
 	}
 
 	return ret;
@@ -2247,7 +2258,8 @@ vega20_notify_smc_display_config(struct smu_context *smu)
 			if (smu_feature_is_supported(smu, SMU_FEATURE_DS_DCEFCLK_BIT)) {
 				ret = smu_send_smc_msg_with_param(smu,
 								  SMU_MSG_SetMinDeepSleepDcefclk,
-								  min_clocks.dcef_clock_in_sr/100);
+								  min_clocks.dcef_clock_in_sr/100,
+								  NULL);
 				if (ret) {
 					pr_err("Attempt to set divider for DCEFCLK Failed!");
 					return ret;
@@ -2262,7 +2274,8 @@ vega20_notify_smc_display_config(struct smu_context *smu)
 		memtable->dpm_state.hard_min_level = min_clocks.memory_clock/100;
 		ret = smu_send_smc_msg_with_param(smu,
 						  SMU_MSG_SetHardMinByFreq,
-						  (PPCLK_UCLK << 16) | memtable->dpm_state.hard_min_level);
+						  (PPCLK_UCLK << 16) | memtable->dpm_state.hard_min_level,
+						  NULL);
 		if (ret) {
 			pr_err("[%s] Set hard min uclk failed!", __func__);
 			return ret;
@@ -2853,8 +2866,10 @@ static int vega20_set_thermal_fan_table(struct smu_context *smu)
 	struct smu_table_context *table_context = &smu->smu_table;
 	PPTable_t *pptable = table_context->driver_pptable;
 
-	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetFanTemperatureTarget,
-			(uint32_t)pptable->FanTargetTemperature);
+	ret = smu_send_smc_msg_with_param(smu,
+			SMU_MSG_SetFanTemperatureTarget,
+			(uint32_t)pptable->FanTargetTemperature,
+			NULL);
 
 	return ret;
 }
@@ -2864,15 +2879,13 @@ static int vega20_get_fan_speed_rpm(struct smu_context *smu,
 {
 	int ret;
 
-	ret = smu_send_smc_msg(smu, SMU_MSG_GetCurrentRpm);
+	ret = smu_send_smc_msg(smu, SMU_MSG_GetCurrentRpm, speed);
 
 	if (ret) {
 		pr_err("Attempt to get current RPM from SMC Failed!\n");
 		return ret;
 	}
 
-	smu_read_smc_arg(smu, speed);
-
 	return 0;
 }
 
@@ -3137,7 +3150,7 @@ static int vega20_set_df_cstate(struct smu_context *smu,
 		return -EINVAL;
 	}
 
-	return smu_send_smc_msg_with_param(smu, SMU_MSG_DFCstateControl, state);
+	return smu_send_smc_msg_with_param(smu, SMU_MSG_DFCstateControl, state, NULL);
 }
 
 static int vega20_update_pcie_parameters(struct smu_context *smu,
@@ -3155,7 +3168,8 @@ static int vega20_update_pcie_parameters(struct smu_context *smu,
 					pptable->PcieLaneCount[i] : pcie_width_cap);
 		ret = smu_send_smc_msg_with_param(smu,
 					  SMU_MSG_OverridePcieParameters,
-					  smu_pcie_arg);
+					  smu_pcie_arg,
+					  NULL);
 	}
 
 	return ret;
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

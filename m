Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE5307B5E
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Jan 2021 17:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CC26E9BC;
	Thu, 28 Jan 2021 16:53:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DDF6E9BC
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Jan 2021 16:53:40 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id a7so5841483qkb.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Jan 2021 08:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ABHFM6llOmmL4x85wbKyNYU8Pk+vvRGtbDShCM3gVak=;
 b=OZukuTfzqGNMDXqwFmp/58HjApIGom0M0LkM9Lu6vPsIetLL59asqtZu/3VFQkAdtx
 0yziY9Gg1muRytlLSeVuT5wpRvQkJdTS4dxxX5Dvm7mVdjGPdsKQmb9Boj9PqUNKSJEL
 4iQOBYNbFBN4oL1cY5T8Fz0R9+M9Y1OpbM6cDvjiSz9pr+SK+FO3VgrX1Qe1MgaaSUvM
 6BZpCZM0BZkGMTRDEKGqajS+S7G/5vOYQk+n51zqIY3kLfh7SEKNIU7hY6ezsuIK5J3C
 lY1gFarcgsXAyxBqtFWQsMf7Hu8wYzzIdTuGzxtzRvrvl4UkH6qs26BEThq0wSxHZpSz
 l9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ABHFM6llOmmL4x85wbKyNYU8Pk+vvRGtbDShCM3gVak=;
 b=avv5k6l4BI3Tusk8Z5xz3SU2OBAN1hzVpDWGXK0vYlBMZoT0khJMUP6T7IB52Skeb8
 /86Jbzwxdo4ZurzjP8TUQpWsCFYBz5G7y5XIIvazoL1NJgTeJbrRl0qCQUs1RviaI5Bz
 ol2IOXCiETSgz3XsZAjzsgpr7Oumh8tmRyebNx4zHZs9s9rAf2Mycuvsa+mGTgdsWKa2
 ekbhWfO1vZLYJCvwciYAIbsRdCKkdVENx5D/Q+tZ3irARNF/WaxCdjurz03bPpyj93Zq
 jUYyInt9xUnNKp6ewtE2cxDZdBbVR83kENgoAIpHpd6xHbaRg2xDaWDce49GtZmUgipq
 EWpQ==
X-Gm-Message-State: AOAM531gspqYmCqQR1oCNT12/Kpv5EZYkX4EmPBxEsxmCR0k9ccSQzP9
 MV0P4nmvpAVcywL3T1jemFAxZgJBH8A=
X-Google-Smtp-Source: ABdhPJzd8nvxTIqmWluJogKKw9hn9hJr6MOfvPBiYUn5+YsRsRGWbA/Ize/VJUwGcPxAL/CLKtAtzA==
X-Received: by 2002:ae9:dc87:: with SMTP id q129mr40395qkf.297.1611852819798; 
 Thu, 28 Jan 2021 08:53:39 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.237])
 by smtp.gmail.com with ESMTPSA id e19sm2708038qtq.75.2021.01.28.08.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:53:39 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/swsmu: use percent rather than rpm for manual
 fan control (v2)
Date: Thu, 28 Jan 2021 11:53:29 -0500
Message-Id: <20210128165329.558839-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128165329.558839-1-alexander.deucher@amd.com>
References: <20210128165329.558839-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On some boards the rpm interface apparently does not work at all
leading to the fan not spinning or spinning at strange speeds.
Both interfaces work properly on the boards I have.
Let's try and use the percent interface instead.

v2: rebase on revert

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1408
Reviewed-by: Evan Quan <evan.quan@amd.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h       | 12 ++--
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h        | 10 +---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 34 ++++++-----
 .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c | 25 +++++---
 .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 25 +++++---
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 25 +++++---
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 58 +------------------
 7 files changed, 86 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
index 7c5c7d605e65..44279c2afccb 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
@@ -173,7 +173,7 @@ enum smu_memory_pool_size
 struct smu_user_dpm_profile {
 	uint32_t fan_mode;
 	uint32_t power_limit;
-	uint32_t fan_speed_rpm;
+	uint32_t fan_speed_percent;
 	uint32_t flags;
 
 	/* user clock state information */
@@ -472,7 +472,7 @@ struct smu_context
 	struct work_struct interrupt_work;
 
 	unsigned fan_max_rpm;
-	unsigned manual_fan_speed_rpm;
+	unsigned manual_fan_speed_percent;
 
 	uint32_t gfx_default_hard_min_freq;
 	uint32_t gfx_default_soft_max_freq;
@@ -648,9 +648,9 @@ struct pptable_funcs {
 	bool (*is_dpm_running)(struct smu_context *smu);
 
 	/**
-	 * @get_fan_speed_rpm: Get the current fan speed in RPM.
+	 * @get_fan_speed_percent: Get the current fan speed in percent.
 	 */
-	int (*get_fan_speed_rpm)(struct smu_context *smu, uint32_t *speed);
+	int (*get_fan_speed_percent)(struct smu_context *smu, uint32_t *speed);
 
 	/**
 	 * @set_watermarks_table: Configure and upload the watermarks tables to
@@ -951,10 +951,10 @@ struct pptable_funcs {
 	int (*set_fan_control_mode)(struct smu_context *smu, uint32_t mode);
 
 	/**
-	 * @set_fan_speed_rpm: Set a static fan speed in RPM.
+	 * @set_fan_speed_percent: Set a static fan speed in percent.
 	 */
-	int (*set_fan_speed_rpm)(struct smu_context *smu, uint32_t speed);
 	int (*set_fan_speed_percent)(struct smu_context *smu, uint32_t speed);
+
 	/**
 	 * @set_xgmi_pstate: Set inter-chip global memory interconnect pstate.
 	 * &pstate: Pstate to set. D0 if Nonzero, D3 otherwise.
diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v11_0.h b/drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
index 1dfccdfc6491..c7d57e9555cc 100644
--- a/drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
@@ -203,14 +203,8 @@ int
 smu_v11_0_set_fan_control_mode(struct smu_context *smu,
 			       uint32_t mode);
 
-int
-smu_v11_0_set_fan_speed_percent(struct smu_context *smu, uint32_t speed);
-
-int smu_v11_0_set_fan_speed_rpm(struct smu_context *smu,
-				       uint32_t speed);
-
-int smu_v11_0_get_fan_speed_rpm(struct smu_context *smu,
-				uint32_t *speed);
+int smu_v11_0_set_fan_speed_percent(struct smu_context *smu,
+				    uint32_t speed);
 
 int smu_v11_0_set_xgmi_pstate(struct smu_context *smu,
 				     uint32_t pstate);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index dffa6ff7ba1f..1c7ac81fe417 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -368,8 +368,8 @@ static void smu_restore_dpm_user_profile(struct smu_context *smu)
 			return;
 		}
 
-		if (!ret && smu->user_dpm_profile.fan_speed_rpm) {
-			ret = smu_set_fan_speed_rpm(smu, smu->user_dpm_profile.fan_speed_rpm);
+		if (!ret && smu->user_dpm_profile.fan_speed_percent) {
+			ret = smu_set_fan_speed_percent(smu, smu->user_dpm_profile.fan_speed_percent);
 			if (ret)
 				dev_err(smu->adev->dev, "Failed to set manual fan speed\n");
 		}
@@ -2025,6 +2025,7 @@ int smu_set_gfx_cgpg(struct smu_context *smu, bool enabled)
 
 int smu_set_fan_speed_rpm(struct smu_context *smu, uint32_t speed)
 {
+	u32 percent;
 	int ret = 0;
 
 	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
@@ -2032,10 +2033,11 @@ int smu_set_fan_speed_rpm(struct smu_context *smu, uint32_t speed)
 
 	mutex_lock(&smu->mutex);
 
-	if (smu->ppt_funcs->set_fan_speed_rpm) {
-		ret = smu->ppt_funcs->set_fan_speed_rpm(smu, speed);
+	if (smu->ppt_funcs->set_fan_speed_percent) {
+		percent = speed * 100 / smu->fan_max_rpm;
+		ret = smu->ppt_funcs->set_fan_speed_percent(smu, percent);
 		if (!ret && smu->user_dpm_profile.flags != SMU_DPM_USER_PROFILE_RESTORE)
-			smu->user_dpm_profile.fan_speed_rpm = speed;
+			smu->user_dpm_profile.fan_speed_percent = percent;
 	}
 
 	mutex_unlock(&smu->mutex);
@@ -2270,7 +2272,7 @@ int smu_set_fan_control_mode(struct smu_context *smu, int value)
 	/* reset user dpm fan speed */
 	if (!ret && value != AMD_FAN_CTRL_MANUAL &&
 			smu->user_dpm_profile.flags != SMU_DPM_USER_PROFILE_RESTORE)
-		smu->user_dpm_profile.fan_speed_rpm = 0;
+		smu->user_dpm_profile.fan_speed_percent = 0;
 
 	return ret;
 }
@@ -2279,17 +2281,15 @@ int smu_get_fan_speed_percent(struct smu_context *smu, uint32_t *speed)
 {
 	int ret = 0;
 	uint32_t percent;
-	uint32_t current_rpm;
 
 	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
 		return -EOPNOTSUPP;
 
 	mutex_lock(&smu->mutex);
 
-	if (smu->ppt_funcs->get_fan_speed_rpm) {
-		ret = smu->ppt_funcs->get_fan_speed_rpm(smu, &current_rpm);
+	if (smu->ppt_funcs->get_fan_speed_percent) {
+		ret = smu->ppt_funcs->get_fan_speed_percent(smu, &percent);
 		if (!ret) {
-			percent = current_rpm * 100 / smu->fan_max_rpm;
 			*speed = percent > 100 ? 100 : percent;
 		}
 	}
@@ -2309,8 +2309,13 @@ int smu_set_fan_speed_percent(struct smu_context *smu, uint32_t speed)
 
 	mutex_lock(&smu->mutex);
 
-	if (smu->ppt_funcs->set_fan_speed_percent)
+	if (smu->ppt_funcs->set_fan_speed_percent) {
+		if (speed > 100)
+			speed = 100;
 		ret = smu->ppt_funcs->set_fan_speed_percent(smu, speed);
+		if (!ret && smu->user_dpm_profile.flags != SMU_DPM_USER_PROFILE_RESTORE)
+			smu->user_dpm_profile.fan_speed_percent = speed;
+	}
 
 	mutex_unlock(&smu->mutex);
 
@@ -2320,14 +2325,17 @@ int smu_set_fan_speed_percent(struct smu_context *smu, uint32_t speed)
 int smu_get_fan_speed_rpm(struct smu_context *smu, uint32_t *speed)
 {
 	int ret = 0;
+	u32 percent;
 
 	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
 		return -EOPNOTSUPP;
 
 	mutex_lock(&smu->mutex);
 
-	if (smu->ppt_funcs->get_fan_speed_rpm)
-		ret = smu->ppt_funcs->get_fan_speed_rpm(smu, speed);
+	if (smu->ppt_funcs->get_fan_speed_percent) {
+		ret = smu->ppt_funcs->get_fan_speed_percent(smu, &percent);
+		*speed = percent * smu->fan_max_rpm / 100;
+	}
 
 	mutex_unlock(&smu->mutex);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index 16db0b506b0d..f0cc4de9ced5 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -1080,15 +1080,27 @@ static int arcturus_read_sensor(struct smu_context *smu,
 	return ret;
 }
 
-static int arcturus_get_fan_speed_rpm(struct smu_context *smu,
-				      uint32_t *speed)
+static int arcturus_get_fan_speed_percent(struct smu_context *smu,
+					  uint32_t *speed)
 {
+	int ret;
+	u32 rpm;
+
 	if (!speed)
 		return -EINVAL;
 
-	return arcturus_get_smu_metrics_data(smu,
-					     METRICS_CURR_FANSPEED,
-					     speed);
+	switch (smu_v11_0_get_fan_control_mode(smu)) {
+	case AMD_FAN_CTRL_AUTO:
+		ret = arcturus_get_smu_metrics_data(smu,
+						    METRICS_CURR_FANSPEED,
+						    &rpm);
+		if (!ret && smu->fan_max_rpm)
+			*speed = rpm * 100 / smu->fan_max_rpm;
+		return ret;
+	default:
+		*speed = smu->user_dpm_profile.fan_speed_percent;
+		return 0;
+	}
 }
 
 static int arcturus_get_fan_parameters(struct smu_context *smu)
@@ -2281,7 +2293,7 @@ static const struct pptable_funcs arcturus_ppt_funcs = {
 	.print_clk_levels = arcturus_print_clk_levels,
 	.force_clk_levels = arcturus_force_clk_levels,
 	.read_sensor = arcturus_read_sensor,
-	.get_fan_speed_rpm = arcturus_get_fan_speed_rpm,
+	.get_fan_speed_percent = arcturus_get_fan_speed_percent,
 	.get_power_profile_mode = arcturus_get_power_profile_mode,
 	.set_power_profile_mode = arcturus_set_power_profile_mode,
 	.set_performance_level = arcturus_set_performance_level,
@@ -2327,7 +2339,6 @@ static const struct pptable_funcs arcturus_ppt_funcs = {
 	.get_fan_control_mode = smu_v11_0_get_fan_control_mode,
 	.set_fan_control_mode = smu_v11_0_set_fan_control_mode,
 	.set_fan_speed_percent = smu_v11_0_set_fan_speed_percent,
-	.set_fan_speed_rpm = smu_v11_0_set_fan_speed_rpm,
 	.set_xgmi_pstate = smu_v11_0_set_xgmi_pstate,
 	.gfx_off_control = smu_v11_0_gfx_off_control,
 	.register_irq_handler = smu_v11_0_register_irq_handler,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 43869149dcf3..f7f78daffd27 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -1317,15 +1317,27 @@ static bool navi10_is_dpm_running(struct smu_context *smu)
 	return !!(feature_enabled & SMC_DPM_FEATURE);
 }
 
-static int navi10_get_fan_speed_rpm(struct smu_context *smu,
-				    uint32_t *speed)
+static int navi10_get_fan_speed_percent(struct smu_context *smu,
+					uint32_t *speed)
 {
+	int ret;
+	u32 rpm;
+
 	if (!speed)
 		return -EINVAL;
 
-	return navi10_get_smu_metrics_data(smu,
-					   METRICS_CURR_FANSPEED,
-					   speed);
+	switch (smu_v11_0_get_fan_control_mode(smu)) {
+	case AMD_FAN_CTRL_AUTO:
+		ret = navi10_get_smu_metrics_data(smu,
+						  METRICS_CURR_FANSPEED,
+						  &rpm);
+		if (!ret && smu->fan_max_rpm)
+			*speed = rpm * 100 / smu->fan_max_rpm;
+		return ret;
+	default:
+		*speed = smu->user_dpm_profile.fan_speed_percent;
+		return 0;
+	}
 }
 
 static int navi10_get_fan_parameters(struct smu_context *smu)
@@ -2413,7 +2425,7 @@ static const struct pptable_funcs navi10_ppt_funcs = {
 	.display_config_changed = navi10_display_config_changed,
 	.notify_smc_display_config = navi10_notify_smc_display_config,
 	.is_dpm_running = navi10_is_dpm_running,
-	.get_fan_speed_rpm = navi10_get_fan_speed_rpm,
+	.get_fan_speed_percent = navi10_get_fan_speed_percent,
 	.get_power_profile_mode = navi10_get_power_profile_mode,
 	.set_power_profile_mode = navi10_set_power_profile_mode,
 	.set_watermarks_table = navi10_set_watermarks_table,
@@ -2457,7 +2469,6 @@ static const struct pptable_funcs navi10_ppt_funcs = {
 	.get_fan_control_mode = smu_v11_0_get_fan_control_mode,
 	.set_fan_control_mode = smu_v11_0_set_fan_control_mode,
 	.set_fan_speed_percent = smu_v11_0_set_fan_speed_percent,
-	.set_fan_speed_rpm = smu_v11_0_set_fan_speed_rpm,
 	.set_xgmi_pstate = smu_v11_0_set_xgmi_pstate,
 	.gfx_off_control = smu_v11_0_gfx_off_control,
 	.register_irq_handler = smu_v11_0_register_irq_handler,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 52ace804f5b3..e3ba40d9f83f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -1237,15 +1237,27 @@ static bool sienna_cichlid_is_dpm_running(struct smu_context *smu)
 	return !!(feature_enabled & SMC_DPM_FEATURE);
 }
 
-static int sienna_cichlid_get_fan_speed_rpm(struct smu_context *smu,
-				    uint32_t *speed)
+static int sienna_cichlid_get_fan_speed_percent(struct smu_context *smu,
+						uint32_t *speed)
 {
+	int ret;
+	u32 rpm;
+
 	if (!speed)
 		return -EINVAL;
 
-	return sienna_cichlid_get_smu_metrics_data(smu,
-						METRICS_CURR_FANSPEED,
-						speed);
+	switch (smu_v11_0_get_fan_control_mode(smu)) {
+	case AMD_FAN_CTRL_AUTO:
+		ret = sienna_cichlid_get_smu_metrics_data(smu,
+							  METRICS_CURR_FANSPEED,
+							  &rpm);
+		if (!ret && smu->fan_max_rpm)
+			*speed = rpm * 100 / smu->fan_max_rpm;
+		return ret;
+	default:
+		*speed = smu->user_dpm_profile.fan_speed_percent;
+		return 0;
+	}
 }
 
 static int sienna_cichlid_get_fan_parameters(struct smu_context *smu)
@@ -3087,7 +3099,7 @@ static const struct pptable_funcs sienna_cichlid_ppt_funcs = {
 	.display_config_changed = sienna_cichlid_display_config_changed,
 	.notify_smc_display_config = sienna_cichlid_notify_smc_display_config,
 	.is_dpm_running = sienna_cichlid_is_dpm_running,
-	.get_fan_speed_rpm = sienna_cichlid_get_fan_speed_rpm,
+	.get_fan_speed_percent = sienna_cichlid_get_fan_speed_percent,
 	.get_power_profile_mode = sienna_cichlid_get_power_profile_mode,
 	.set_power_profile_mode = sienna_cichlid_set_power_profile_mode,
 	.set_watermarks_table = sienna_cichlid_set_watermarks_table,
@@ -3131,7 +3143,6 @@ static const struct pptable_funcs sienna_cichlid_ppt_funcs = {
 	.get_fan_control_mode = smu_v11_0_get_fan_control_mode,
 	.set_fan_control_mode = smu_v11_0_set_fan_control_mode,
 	.set_fan_speed_percent = smu_v11_0_set_fan_speed_percent,
-	.set_fan_speed_rpm = smu_v11_0_set_fan_speed_rpm,
 	.set_xgmi_pstate = smu_v11_0_set_xgmi_pstate,
 	.gfx_off_control = smu_v11_0_gfx_off_control,
 	.register_irq_handler = smu_v11_0_register_irq_handler,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index 6d84aea0cc38..cf6176afd4d5 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -1137,10 +1137,10 @@ int smu_v11_0_gfx_off_control(struct smu_context *smu, bool enable)
 uint32_t
 smu_v11_0_get_fan_control_mode(struct smu_context *smu)
 {
-	if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT))
-		return AMD_FAN_CTRL_MANUAL;
-	else
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT))
 		return AMD_FAN_CTRL_AUTO;
+	else
+		return smu->user_dpm_profile.fan_mode;
 }
 
 static int
@@ -1231,58 +1231,6 @@ smu_v11_0_set_fan_control_mode(struct smu_context *smu,
 	return ret;
 }
 
-int smu_v11_0_set_fan_speed_rpm(struct smu_context *smu,
-				       uint32_t speed)
-{
-	struct amdgpu_device *adev = smu->adev;
-	int ret;
-	uint32_t tach_period, crystal_clock_freq;
-
-	if (!speed)
-		return -EINVAL;
-
-	ret = smu_v11_0_auto_fan_control(smu, 0);
-	if (ret)
-		return ret;
-
-	/*
-	 * crystal_clock_freq div by 4 is required since the fan control
-	 * module refers to 25MHz
-	 */
-
-	crystal_clock_freq = amdgpu_asic_get_xclk(adev) / 4;
-	tach_period = 60 * crystal_clock_freq * 10000 / (8 * speed);
-	WREG32_SOC15(THM, 0, mmCG_TACH_CTRL,
-		     REG_SET_FIELD(RREG32_SOC15(THM, 0, mmCG_TACH_CTRL),
-				   CG_TACH_CTRL, TARGET_PERIOD,
-				   tach_period));
-
-	ret = smu_v11_0_set_fan_static_mode(smu, FDO_PWM_MODE_STATIC_RPM);
-
-	return ret;
-}
-
-int smu_v11_0_get_fan_speed_rpm(struct smu_context *smu,
-				uint32_t *speed)
-{
-	struct amdgpu_device *adev = smu->adev;
-	uint32_t tach_period, crystal_clock_freq;
-	uint64_t tmp64;
-
-	tach_period = REG_GET_FIELD(RREG32_SOC15(THM, 0, mmCG_TACH_CTRL),
-				    CG_TACH_CTRL, TARGET_PERIOD);
-	if (!tach_period)
-		return -EINVAL;
-
-	crystal_clock_freq = amdgpu_asic_get_xclk(adev);
-
-	tmp64 = (uint64_t)crystal_clock_freq * 60 * 10000;
-	do_div(tmp64, (tach_period * 8));
-	*speed = (uint32_t)tmp64;
-
-	return 0;
-}
-
 int smu_v11_0_set_xgmi_pstate(struct smu_context *smu,
 				     uint32_t pstate)
 {
-- 
2.29.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

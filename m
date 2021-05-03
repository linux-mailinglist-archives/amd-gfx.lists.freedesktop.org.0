Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D086371986
	for <lists+amd-gfx@lfdr.de>; Mon,  3 May 2021 18:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD316E8DA;
	Mon,  3 May 2021 16:35:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9396E8F8;
 Mon,  3 May 2021 16:35:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEE4561278;
 Mon,  3 May 2021 16:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059743;
 bh=/i7twi6+kmLwdQCEga9hbGTxL+7/51Mn2FVRvzRAG8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DX11H9EoWxEpLs8w0elPh4LhQewljOVffAB0EvFMbIahdJuUzQCpb38pS40OkwIYl
 52p1sW+II6D/EERTj2mvxlcMSY08GFQ6UzOgrb4pKpA78d1BIXAr5ZePldgUMpKuDP
 EmkFZ8ydqLr7ruwBMRhCgX1NrTlxi7n/y6OVlE+2IVZI79J/pPExdwIn2ax+1KHS21
 I0aSJXtOSf5a9ECei2ZUc9/jNF1jZfBwApkV4pbdA3ol+Sx8t5ODmk2EdY2U566l4a
 XSAamtWeDxBCSGNvE0FjBdbhkUXdqzPfcU0w/sHQ5E2Bi6DtmtoVejYKwKLJZ6Il/3
 0n8Dvifl3ajKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 019/134] drm/amd/pm/swsmu: clean up user profile
 function
Date: Mon,  3 May 2021 12:33:18 -0400
Message-Id: <20210503163513.2851510-19-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163513.2851510-1-sashal@kernel.org>
References: <20210503163513.2851510-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

[ Upstream commit d8cce9306801cfbf709055677f7896905094ff95 ]

Remove unnecessary comments, enable restore mode using
'|=' operator, fixes the alignment to improve the code
readability.

v2: Move all restoration flag check to bitwise '&' operator

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 34 ++++++++---------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index cd905e41080e..42c4dbe3e362 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -279,35 +279,25 @@ static void smu_set_user_clk_dependencies(struct smu_context *smu, enum smu_clk_
 	if (smu->adev->in_suspend)
 		return;
 
-	/*
-	 * mclk, fclk and socclk are interdependent
-	 * on each other
-	 */
 	if (clk == SMU_MCLK) {
-		/* reset clock dependency */
 		smu->user_dpm_profile.clk_dependency = 0;
-		/* set mclk dependent clocks(fclk and socclk) */
 		smu->user_dpm_profile.clk_dependency = BIT(SMU_FCLK) | BIT(SMU_SOCCLK);
 	} else if (clk == SMU_FCLK) {
-		/* give priority to mclk, if mclk dependent clocks are set */
+		/* MCLK takes precedence over FCLK */
 		if (smu->user_dpm_profile.clk_dependency == (BIT(SMU_FCLK) | BIT(SMU_SOCCLK)))
 			return;
 
-		/* reset clock dependency */
 		smu->user_dpm_profile.clk_dependency = 0;
-		/* set fclk dependent clocks(mclk and socclk) */
 		smu->user_dpm_profile.clk_dependency = BIT(SMU_MCLK) | BIT(SMU_SOCCLK);
 	} else if (clk == SMU_SOCCLK) {
-		/* give priority to mclk, if mclk dependent clocks are set */
+		/* MCLK takes precedence over SOCCLK */
 		if (smu->user_dpm_profile.clk_dependency == (BIT(SMU_FCLK) | BIT(SMU_SOCCLK)))
 			return;
 
-		/* reset clock dependency */
 		smu->user_dpm_profile.clk_dependency = 0;
-		/* set socclk dependent clocks(mclk and fclk) */
 		smu->user_dpm_profile.clk_dependency = BIT(SMU_MCLK) | BIT(SMU_FCLK);
 	} else
-		/* add clk dependencies here, if any */
+		/* Add clk dependencies here, if any */
 		return;
 }
 
@@ -331,7 +321,7 @@ static void smu_restore_dpm_user_profile(struct smu_context *smu)
 		return;
 
 	/* Enable restore flag */
-	smu->user_dpm_profile.flags = SMU_DPM_USER_PROFILE_RESTORE;
+	smu->user_dpm_profile.flags |= SMU_DPM_USER_PROFILE_RESTORE;
 
 	/* set the user dpm power limit */
 	if (smu->user_dpm_profile.power_limit) {
@@ -354,8 +344,8 @@ static void smu_restore_dpm_user_profile(struct smu_context *smu)
 				ret = smu_force_clk_levels(smu, clk_type,
 						smu->user_dpm_profile.clk_mask[clk_type]);
 				if (ret)
-					dev_err(smu->adev->dev, "Failed to set clock type = %d\n",
-							clk_type);
+					dev_err(smu->adev->dev,
+						"Failed to set clock type = %d\n", clk_type);
 			}
 		}
 	}
@@ -1777,7 +1767,7 @@ int smu_force_clk_levels(struct smu_context *smu,
 
 	if (smu->ppt_funcs && smu->ppt_funcs->force_clk_levels) {
 		ret = smu->ppt_funcs->force_clk_levels(smu, clk_type, mask);
-		if (!ret && smu->user_dpm_profile.flags != SMU_DPM_USER_PROFILE_RESTORE) {
+		if (!ret && !(smu->user_dpm_profile.flags & SMU_DPM_USER_PROFILE_RESTORE)) {
 			smu->user_dpm_profile.clk_mask[clk_type] = mask;
 			smu_set_user_clk_dependencies(smu, clk_type);
 		}
@@ -2034,7 +2024,7 @@ int smu_set_fan_speed_rpm(struct smu_context *smu, uint32_t speed)
 	if (smu->ppt_funcs->set_fan_speed_percent) {
 		percent = speed * 100 / smu->fan_max_rpm;
 		ret = smu->ppt_funcs->set_fan_speed_percent(smu, percent);
-		if (!ret && smu->user_dpm_profile.flags != SMU_DPM_USER_PROFILE_RESTORE)
+		if (!ret && !(smu->user_dpm_profile.flags & SMU_DPM_USER_PROFILE_RESTORE))
 			smu->user_dpm_profile.fan_speed_percent = percent;
 	}
 
@@ -2104,7 +2094,7 @@ int smu_set_power_limit(struct smu_context *smu, uint32_t limit)
 
 	if (smu->ppt_funcs->set_power_limit) {
 		ret = smu->ppt_funcs->set_power_limit(smu, limit);
-		if (!ret && smu->user_dpm_profile.flags != SMU_DPM_USER_PROFILE_RESTORE)
+		if (!ret && !(smu->user_dpm_profile.flags & SMU_DPM_USER_PROFILE_RESTORE))
 			smu->user_dpm_profile.power_limit = limit;
 	}
 
@@ -2285,7 +2275,7 @@ int smu_set_fan_control_mode(struct smu_context *smu, int value)
 
 	if (smu->ppt_funcs->set_fan_control_mode) {
 		ret = smu->ppt_funcs->set_fan_control_mode(smu, value);
-		if (!ret && smu->user_dpm_profile.flags != SMU_DPM_USER_PROFILE_RESTORE)
+		if (!ret && !(smu->user_dpm_profile.flags & SMU_DPM_USER_PROFILE_RESTORE))
 			smu->user_dpm_profile.fan_mode = value;
 	}
 
@@ -2293,7 +2283,7 @@ int smu_set_fan_control_mode(struct smu_context *smu, int value)
 
 	/* reset user dpm fan speed */
 	if (!ret && value != AMD_FAN_CTRL_MANUAL &&
-			smu->user_dpm_profile.flags != SMU_DPM_USER_PROFILE_RESTORE)
+			!(smu->user_dpm_profile.flags & SMU_DPM_USER_PROFILE_RESTORE))
 		smu->user_dpm_profile.fan_speed_percent = 0;
 
 	return ret;
@@ -2335,7 +2325,7 @@ int smu_set_fan_speed_percent(struct smu_context *smu, uint32_t speed)
 		if (speed > 100)
 			speed = 100;
 		ret = smu->ppt_funcs->set_fan_speed_percent(smu, speed);
-		if (!ret && smu->user_dpm_profile.flags != SMU_DPM_USER_PROFILE_RESTORE)
+		if (!ret && !(smu->user_dpm_profile.flags & SMU_DPM_USER_PROFILE_RESTORE))
 			smu->user_dpm_profile.fan_speed_percent = speed;
 	}
 
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

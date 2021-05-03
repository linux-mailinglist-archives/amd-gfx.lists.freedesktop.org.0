Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A16371963
	for <lists+amd-gfx@lfdr.de>; Mon,  3 May 2021 18:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AB46E8F2;
	Mon,  3 May 2021 16:35:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A88C6E8F2;
 Mon,  3 May 2021 16:35:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D92A613B3;
 Mon,  3 May 2021 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059725;
 bh=Foo0oml7Ot69CzxMUT/sNgkbu3oPVJHm19/WvKVEHpo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d72XY55qKUm3unWsvAeA2ziI30x50Nm0V1R8KF2YluxqRViRsP1g7R8WypeuOJXUf
 4ZgcsWrOclIHp5E1p8Wig3bY6CU5F3ww/8z3csxR7b7ZoGBERziC9NOwmk91WH6/mU
 3v7CR+A9FKwrNzVjj85C6rCZBKRUH/5nd+9Qi95BQXrvY29SHwNffW2WqHtJP9FvaE
 BOwffCPOU2+vu+vJEneNzdHuOLmN13fUJJDlTFBPEatS8N740Dj2LZvspqxOsYS3zf
 7wFjX6Uzs2tZ2ncgQPcpSfuSIWxEn/wSqEPBYAT1qbJLqUuNjE1Cg0K8ajJHDJCScx
 eA1OxiBC5GvVQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 007/134] drm/amd/pm: do not issue message while
 write "r" into pp_od_clk_voltage
Date: Mon,  3 May 2021 12:33:06 -0400
Message-Id: <20210503163513.2851510-7-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Huang Rui <ray.huang@amd.com>

[ Upstream commit ca1203d7d7295c49e5707d7def457bdc524a8edb ]

We should commit the value after restore them back to default as well.

$ echo "r" > pp_od_clk_voltage
$ echo "c" > pp_od_clk_voltage

Signed-off-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c  | 14 -------
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 38 -------------------
 .../gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c   | 18 ---------
 3 files changed, 70 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
index ed05a30d1139..e2a56a7f3d7a 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
@@ -1526,20 +1526,6 @@ static int smu10_set_fine_grain_clk_vol(struct pp_hwmgr *hwmgr,
 
 		smu10_data->gfx_actual_soft_min_freq = min_freq;
 		smu10_data->gfx_actual_soft_max_freq = max_freq;
-
-		ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_SetHardMinGfxClk,
-					min_freq,
-					NULL);
-		if (ret)
-			return ret;
-
-		ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_SetSoftMaxGfxClk,
-					max_freq,
-					NULL);
-		if (ret)
-			return ret;
 	} else if (type == PP_OD_COMMIT_DPM_TABLE) {
 		if (size != 0) {
 			pr_err("Input parameter number not correct\n");
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 101eaa20db9b..a80f551771b9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -1462,7 +1462,6 @@ static int vangogh_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TAB
 					long input[], uint32_t size)
 {
 	int ret = 0;
-	int i;
 	struct smu_dpm_context *smu_dpm_ctx = &(smu->smu_dpm);
 
 	if (!(smu_dpm_ctx->dpm_level == AMD_DPM_FORCED_LEVEL_MANUAL)) {
@@ -1535,43 +1534,6 @@ static int vangogh_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TAB
 			smu->gfx_actual_soft_max_freq = smu->gfx_default_soft_max_freq;
 			smu->cpu_actual_soft_min_freq = smu->cpu_default_soft_min_freq;
 			smu->cpu_actual_soft_max_freq = smu->cpu_default_soft_max_freq;
-
-			ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinGfxClk,
-									smu->gfx_actual_hard_min_freq, NULL);
-			if (ret) {
-				dev_err(smu->adev->dev, "Restore the default hard min sclk failed!");
-				return ret;
-			}
-
-			ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxGfxClk,
-									smu->gfx_actual_soft_max_freq, NULL);
-			if (ret) {
-				dev_err(smu->adev->dev, "Restore the default soft max sclk failed!");
-				return ret;
-			}
-
-			if (smu->adev->pm.fw_version < 0x43f1b00) {
-				dev_warn(smu->adev->dev, "CPUSoftMax/CPUSoftMin are not supported, please update SBIOS!\n");
-				break;
-			}
-
-			for (i = 0; i < smu->cpu_core_num; i++) {
-				ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMinCclk,
-								      (i << 20) | smu->cpu_actual_soft_min_freq,
-								      NULL);
-				if (ret) {
-					dev_err(smu->adev->dev, "Set hard min cclk failed!");
-					return ret;
-				}
-
-				ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxCclk,
-								      (i << 20) | smu->cpu_actual_soft_max_freq,
-								      NULL);
-				if (ret) {
-					dev_err(smu->adev->dev, "Set soft max cclk failed!");
-					return ret;
-				}
-			}
 		}
 		break;
 	case PP_OD_COMMIT_DPM_TABLE:
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
index 5493388fcb10..dbe6d0caddb7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
@@ -389,24 +389,6 @@ static int renoir_od_edit_dpm_table(struct smu_context *smu,
 		}
 		smu->gfx_actual_hard_min_freq = smu->gfx_default_hard_min_freq;
 		smu->gfx_actual_soft_max_freq = smu->gfx_default_soft_max_freq;
-
-		ret = smu_cmn_send_smc_msg_with_param(smu,
-								SMU_MSG_SetHardMinGfxClk,
-								smu->gfx_actual_hard_min_freq,
-								NULL);
-		if (ret) {
-			dev_err(smu->adev->dev, "Restore the default hard min sclk failed!");
-			return ret;
-		}
-
-		ret = smu_cmn_send_smc_msg_with_param(smu,
-								SMU_MSG_SetSoftMaxGfxClk,
-								smu->gfx_actual_soft_max_freq,
-								NULL);
-		if (ret) {
-			dev_err(smu->adev->dev, "Restore the default soft max sclk failed!");
-			return ret;
-		}
 		break;
 	case PP_OD_COMMIT_DPM_TABLE:
 		if (size != 0) {
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

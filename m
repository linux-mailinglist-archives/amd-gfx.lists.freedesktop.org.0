Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5A194FC3
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2020 04:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04686E235;
	Fri, 27 Mar 2020 03:43:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F256E235
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Mar 2020 03:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX4l4hA2WpCDkyYsaiuI6x0+eAnb+51u7i1KTgEqdZyEvlH4ge8OyzErVYW3mmW0vb8fHXr0Ob/rMjN7mQb8gae3MsYSZs77eW8HNI3vZ6hERyfSWZH+Eog0cDtuLG1LDdq1BtHAA7DC3o+4pQEPeDJwIyhKo00G8F2lTgjDPxM124XlVj0nA2NhAHGdOTjx9VN/n1irH8nvt43M8hJazyEowVcqA33IVCHbyjTyRTt7sEyBHSTm+GuMidYI2m5kbJkJN4b5BTRaKuFZ5uHXkHFoHCLvYAByq8hxi9eoSgHBKQpgoYG7sosUGVXxsGw8N22q4yEtP6hzt757XBfToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9VW7Nks+o6S78rmEHnV4Qvpy2mKW8pqyCExLa/8FRU=;
 b=Bh9v/kZAZ/BRk5uwbgj33305a+Pvs/5aMjkQe2g5hSe4/Do9hPcoRjRhSouWcRv56nyFPNUlrX4AvkatYrF8tx9um4vct3Y8vkzXNnIjVeGNOixXoo+TY20/9CcA0PF7kakMdinFsKovvac7FjQzoQFQtnJdBtvKvcrQE9m5VUgl7/1L7ec7297+m1ljvnYe5pm6DOIwxTRe2ZtYID3LLe/j4BwEn3hWmtzzBREvvEJhUbkypbPUmMvFck8OLCxxcmCY1yshEQoCQAXndZS3Urc9fdAyP0TNzqr/aO9E6PYv8GWDOZrQOJ41HjL+NlAL/XShcjBsf2ULVrKpyggztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9VW7Nks+o6S78rmEHnV4Qvpy2mKW8pqyCExLa/8FRU=;
 b=I4LZRaPORPjAVNp6+MAI+mm8oNDamLNeVT31eTmgMKf1gUuHniU4cyZmQVZTBEP8kBsJLiZmHD92VzTN1/C/pHCpVYqdjm6IObuWmyY2AEgIFXHY6a07tSPonEwbYBtataiwmy3RaCG6PAe2i+iZk+jwRByfQmq/bG6GkV5jHSI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (2603:10b6:208:c5::10)
 by MN2PR12MB4373.namprd12.prod.outlook.com (2603:10b6:208:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 03:43:04 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::69c7:b493:690:2173]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::69c7:b493:690:2173%3]) with mapi id 15.20.2835.021; Fri, 27 Mar 2020
 03:43:04 +0000
From: Evan Quan <evan.quan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 8/9] drm/amd/powerplay: unified interfaces for message issuing
 and response checking
Date: Fri, 27 Mar 2020 11:41:37 +0800
Message-Id: <20200327034138.7653-8-evan.quan@amd.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200327034138.7653-1-evan.quan@amd.com>
References: <20200327034138.7653-1-evan.quan@amd.com>
X-ClientProxiedBy: HK0PR01CA0063.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::27) To MN2PR12MB3344.namprd12.prod.outlook.com
 (2603:10b6:208:c5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from equan-buildpc.amd.com (180.167.199.189) by
 HK0PR01CA0063.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 03:43:02 +0000
X-Mailer: git-send-email 2.26.0
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eb07cb7c-1926-42fe-8378-08d7d200f47d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4373:|MN2PR12MB4373:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4373201EC19AF609B301E9A5E4CC0@MN2PR12MB4373.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(6666004)(6486002)(26005)(81156014)(8676002)(6916009)(81166006)(16526019)(956004)(4326008)(15650500001)(186003)(36756003)(44832011)(2616005)(8936002)(52116002)(478600001)(86362001)(66946007)(66556008)(316002)(7696005)(2906002)(30864003)(5660300002)(1076003)(66476007)(66574012)(559001)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4373;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F67LX8divRy/ZSHhJNEyKY02hr4Agf6Q1kL8M1Ca82WtNf7iJ/KkmZgOzQfF1gtcKCiv0OcIlDegHcOqxEXnGP6iqAFlG8dN8kkQFgNxQP+IyksOtewYci712BMOejEptYNJ6HnTa8CzcxqtEjia1WTERMBx7E8muZv18sWTALC5+TpBwRGgRKFQTe6XjtuARmFYUycA2hcoaDAwo0vtr7opXE73HcZNhG+fhJg2nkSKwGxfX83PkryYmwvX40+m+LIiLkC+j+PClAAap+jI/Jq8wdLFbyIPs2qNrlKlX5apQN5e1LQ36V8LA+cegzG9moUL4zus36FBmZQrolLHgrC6/8kEo9CXPij9sHi1UQkLE9eJHvtxahQbVjZgnm3b1DiwxUBqul36g8CFzWPr+uH+Hi95/12YgjXcFY5Ug8syrCozzRw+RfN3ZTmnQulO
X-MS-Exchange-AntiSpam-MessageData: TbD4z3b8MkeA4j4CfV9jr8YTRk00TVWjaLURd3vFuqobiGrAoZ6Hk0yVSEoOoGGlqyS7E3LuB0yTGcIEVCsq445H6cqxZzqSScZDtE4KylVc2wDwnk2iF5tp4Z83pU7fB9ijelSnQYWDc8e8VpewmQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb07cb7c-1926-42fe-8378-08d7d200f47d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 03:43:04.6769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAUrPk5jFtiweD+AHQa/H5D3REvxCcr45nG7xlfBEOVzy/tq1R2vN5qb8iGx2tqf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4373
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This can avoid potential race condition between them.

Change-Id: I908f89749223f73121c8395298e68c4cf6c0ba75
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 .../gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c | 165 +++++++++-------
 .../powerplay/hwmgr/smu7_clockpowergating.c   |  61 +++---
 .../gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c  | 135 +++++++------
 .../drm/amd/powerplay/hwmgr/smu7_powertune.c  |  40 ++--
 .../drm/amd/powerplay/hwmgr/smu7_thermal.c    |  13 +-
 .../gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c  | 157 +++++++++------
 .../gpu/drm/amd/powerplay/hwmgr/smu_helper.c  |   4 +-
 .../gpu/drm/amd/powerplay/hwmgr/vega10_baco.c |   2 +-
 .../drm/amd/powerplay/hwmgr/vega10_hwmgr.c    | 141 ++++++++------
 .../amd/powerplay/hwmgr/vega10_powertune.c    |   9 +-
 .../drm/amd/powerplay/hwmgr/vega10_thermal.c  |   6 +-
 .../gpu/drm/amd/powerplay/hwmgr/vega12_baco.c |   2 +-
 .../drm/amd/powerplay/hwmgr/vega12_hwmgr.c    | 149 +++++++-------
 .../drm/amd/powerplay/hwmgr/vega12_thermal.c  |   7 +-
 .../gpu/drm/amd/powerplay/hwmgr/vega20_baco.c |  10 +-
 .../drm/amd/powerplay/hwmgr/vega20_hwmgr.c    | 181 ++++++++++--------
 .../amd/powerplay/hwmgr/vega20_powertune.c    |   6 +-
 .../drm/amd/powerplay/hwmgr/vega20_thermal.c  |   7 +-
 drivers/gpu/drm/amd/powerplay/inc/smumgr.h    |   7 +-
 .../gpu/drm/amd/powerplay/smumgr/ci_smumgr.c  |  14 +-
 .../drm/amd/powerplay/smumgr/fiji_smumgr.c    |  30 +--
 .../amd/powerplay/smumgr/polaris10_smumgr.c   |  30 +--
 .../drm/amd/powerplay/smumgr/smu10_smumgr.c   |  25 ++-
 .../drm/amd/powerplay/smumgr/smu7_smumgr.c    |  22 ++-
 .../drm/amd/powerplay/smumgr/smu8_smumgr.c    |  47 +++--
 drivers/gpu/drm/amd/powerplay/smumgr/smumgr.c |  44 +++--
 .../drm/amd/powerplay/smumgr/tonga_smumgr.c   |  14 +-
 .../drm/amd/powerplay/smumgr/vega10_smumgr.c  |  38 ++--
 .../drm/amd/powerplay/smumgr/vega12_smumgr.c  |  40 ++--
 .../drm/amd/powerplay/smumgr/vega20_smumgr.c  |  62 +++---
 .../drm/amd/powerplay/smumgr/vegam_smumgr.c   |  17 +-
 31 files changed, 892 insertions(+), 593 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
index 689072a312a7..3ba0ce890543 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
@@ -81,7 +81,7 @@ static int smu10_display_clock_voltage_request(struct pp_hwmgr *hwmgr,
 		pr_info("[DisplayClockVoltageRequest]Invalid Clock Type!");
 		return -EINVAL;
 	}
-	smum_send_msg_to_smc_with_parameter(hwmgr, msg, clk_freq);
+	smum_send_msg_to_smc_with_parameter(hwmgr, msg, clk_freq, NULL);
 
 	return 0;
 }
@@ -214,7 +214,8 @@ static int smu10_set_min_deep_sleep_dcefclk(struct pp_hwmgr *hwmgr, uint32_t clo
 		smu10_data->deep_sleep_dcefclk = clock;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetMinDeepSleepDcefclk,
-					smu10_data->deep_sleep_dcefclk);
+					smu10_data->deep_sleep_dcefclk,
+					NULL);
 	}
 	return 0;
 }
@@ -228,7 +229,8 @@ static int smu10_set_hard_min_dcefclk_by_freq(struct pp_hwmgr *hwmgr, uint32_t c
 		smu10_data->dcf_actual_hard_min_freq = clock;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetHardMinDcefclkByFreq,
-					smu10_data->dcf_actual_hard_min_freq);
+					smu10_data->dcf_actual_hard_min_freq,
+					NULL);
 	}
 	return 0;
 }
@@ -242,7 +244,8 @@ static int smu10_set_hard_min_fclk_by_freq(struct pp_hwmgr *hwmgr, uint32_t cloc
 		smu10_data->f_actual_hard_min_freq = clock;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetHardMinFclkByFreq,
-					smu10_data->f_actual_hard_min_freq);
+					smu10_data->f_actual_hard_min_freq,
+					NULL);
 	}
 	return 0;
 }
@@ -255,7 +258,8 @@ static int smu10_set_active_display_count(struct pp_hwmgr *hwmgr, uint32_t count
 		smu10_data->num_active_display = count;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetDisplayCount,
-				smu10_data->num_active_display);
+				smu10_data->num_active_display,
+				NULL);
 	}
 
 	return 0;
@@ -278,7 +282,8 @@ static int smu10_init_power_gate_state(struct pp_hwmgr *hwmgr)
 	if (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)
 		return smum_send_msg_to_smc_with_parameter(hwmgr,
 							   PPSMC_MSG_SetGfxCGPG,
-							   true);
+							   true,
+							   NULL);
 	else
 		return 0;
 }
@@ -324,7 +329,7 @@ static int smu10_disable_gfx_off(struct pp_hwmgr *hwmgr)
 	struct amdgpu_device *adev = hwmgr->adev;
 
 	if (adev->pm.pp_feature & PP_GFXOFF_MASK) {
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisableGfxOff);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisableGfxOff, NULL);
 
 		/* confirm gfx is back to "on" state */
 		while (!smu10_is_gfx_on(hwmgr))
@@ -344,7 +349,7 @@ static int smu10_enable_gfx_off(struct pp_hwmgr *hwmgr)
 	struct amdgpu_device *adev = hwmgr->adev;
 
 	if (adev->pm.pp_feature & PP_GFXOFF_MASK)
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableGfxOff);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableGfxOff, NULL);
 
 	return 0;
 }
@@ -479,12 +484,10 @@ static int smu10_populate_clock_table(struct pp_hwmgr *hwmgr)
 	smu10_get_clock_voltage_dependency_table(hwmgr, &pinfo->vdd_dep_on_phyclk,
 					ARRAY_SIZE(VddPhyClk), &VddPhyClk[0]);
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMinGfxclkFrequency);
-	result = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMinGfxclkFrequency, &result);
 	smu10_data->gfx_min_freq_limit = result / 10 * 1000;
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMaxGfxclkFrequency);
-	result = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMaxGfxclkFrequency, &result);
 	smu10_data->gfx_max_freq_limit = result / 10 * 1000;
 
 	return 0;
@@ -588,116 +591,148 @@ static int smu10_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
 	case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinGfxClk,
-						data->gfx_max_freq_limit/100);
+						data->gfx_max_freq_limit/100,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinFclkByFreq,
-						SMU10_UMD_PSTATE_PEAK_FCLK);
+						SMU10_UMD_PSTATE_PEAK_FCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinSocclkByFreq,
-						SMU10_UMD_PSTATE_PEAK_SOCCLK);
+						SMU10_UMD_PSTATE_PEAK_SOCCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinVcn,
-						SMU10_UMD_PSTATE_VCE);
+						SMU10_UMD_PSTATE_VCE,
+						NULL);
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxGfxClk,
-						data->gfx_max_freq_limit/100);
+						data->gfx_max_freq_limit/100,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxFclkByFreq,
-						SMU10_UMD_PSTATE_PEAK_FCLK);
+						SMU10_UMD_PSTATE_PEAK_FCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxSocclkByFreq,
-						SMU10_UMD_PSTATE_PEAK_SOCCLK);
+						SMU10_UMD_PSTATE_PEAK_SOCCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxVcn,
-						SMU10_UMD_PSTATE_VCE);
+						SMU10_UMD_PSTATE_VCE,
+						NULL);
 		break;
 	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinGfxClk,
-						min_sclk);
+						min_sclk,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxGfxClk,
-						min_sclk);
+						min_sclk,
+						NULL);
 		break;
 	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinFclkByFreq,
-						min_mclk);
+						min_mclk,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxFclkByFreq,
-						min_mclk);
+						min_mclk,
+						NULL);
 		break;
 	case AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinGfxClk,
-						SMU10_UMD_PSTATE_GFXCLK);
+						SMU10_UMD_PSTATE_GFXCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinFclkByFreq,
-						SMU10_UMD_PSTATE_FCLK);
+						SMU10_UMD_PSTATE_FCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinSocclkByFreq,
-						SMU10_UMD_PSTATE_SOCCLK);
+						SMU10_UMD_PSTATE_SOCCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinVcn,
-						SMU10_UMD_PSTATE_VCE);
+						SMU10_UMD_PSTATE_VCE,
+						NULL);
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxGfxClk,
-						SMU10_UMD_PSTATE_GFXCLK);
+						SMU10_UMD_PSTATE_GFXCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxFclkByFreq,
-						SMU10_UMD_PSTATE_FCLK);
+						SMU10_UMD_PSTATE_FCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxSocclkByFreq,
-						SMU10_UMD_PSTATE_SOCCLK);
+						SMU10_UMD_PSTATE_SOCCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxVcn,
-						SMU10_UMD_PSTATE_VCE);
+						SMU10_UMD_PSTATE_VCE,
+						NULL);
 		break;
 	case AMD_DPM_FORCED_LEVEL_AUTO:
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinGfxClk,
-						min_sclk);
+						min_sclk,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinFclkByFreq,
 						hwmgr->display_config->num_display > 3 ?
 						SMU10_UMD_PSTATE_PEAK_FCLK :
-						min_mclk);
+						min_mclk,
+						NULL);
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinSocclkByFreq,
-						SMU10_UMD_PSTATE_MIN_SOCCLK);
+						SMU10_UMD_PSTATE_MIN_SOCCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinVcn,
-						SMU10_UMD_PSTATE_MIN_VCE);
+						SMU10_UMD_PSTATE_MIN_VCE,
+						NULL);
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxGfxClk,
-						data->gfx_max_freq_limit/100);
+						data->gfx_max_freq_limit/100,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxFclkByFreq,
-						SMU10_UMD_PSTATE_PEAK_FCLK);
+						SMU10_UMD_PSTATE_PEAK_FCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxSocclkByFreq,
-						SMU10_UMD_PSTATE_PEAK_SOCCLK);
+						SMU10_UMD_PSTATE_PEAK_SOCCLK,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxVcn,
-						SMU10_UMD_PSTATE_VCE);
+						SMU10_UMD_PSTATE_VCE,
+						NULL);
 		break;
 	case AMD_DPM_FORCED_LEVEL_LOW:
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinGfxClk,
-						data->gfx_min_freq_limit/100);
+						data->gfx_min_freq_limit/100,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxGfxClk,
-						data->gfx_min_freq_limit/100);
+						data->gfx_min_freq_limit/100,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinFclkByFreq,
-						min_mclk);
+						min_mclk,
+						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxFclkByFreq,
-						min_mclk);
+						min_mclk,
+						NULL);
 		break;
 	case AMD_DPM_FORCED_LEVEL_MANUAL:
 	case AMD_DPM_FORCED_LEVEL_PROFILE_EXIT:
@@ -849,13 +884,15 @@ static int smu10_force_clock_level(struct pp_hwmgr *hwmgr,
 						PPSMC_MSG_SetHardMinGfxClk,
 						low == 2 ? data->gfx_max_freq_limit/100 :
 						low == 1 ? SMU10_UMD_PSTATE_GFXCLK :
-						data->gfx_min_freq_limit/100);
+						data->gfx_min_freq_limit/100,
+						NULL);
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxGfxClk,
 						high == 0 ? data->gfx_min_freq_limit/100 :
 						high == 1 ? SMU10_UMD_PSTATE_GFXCLK :
-						data->gfx_max_freq_limit/100);
+						data->gfx_max_freq_limit/100,
+						NULL);
 		break;
 
 	case PP_MCLK:
@@ -864,11 +901,13 @@ static int smu10_force_clock_level(struct pp_hwmgr *hwmgr,
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinFclkByFreq,
-						mclk_table->entries[low].clk/100);
+						mclk_table->entries[low].clk/100,
+						NULL);
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxFclkByFreq,
-						mclk_table->entries[high].clk/100);
+						mclk_table->entries[high].clk/100,
+						NULL);
 		break;
 
 	case PP_PCIE:
@@ -888,8 +927,7 @@ static int smu10_print_clock_levels(struct pp_hwmgr *hwmgr,
 
 	switch (type) {
 	case PP_SCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetGfxclkFrequency);
-		now = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetGfxclkFrequency, &now);
 
 	/* driver only know min/max gfx_clk, Add level 1 for all other gfx clks */
 		if (now == data->gfx_max_freq_limit/100)
@@ -910,8 +948,7 @@ static int smu10_print_clock_levels(struct pp_hwmgr *hwmgr,
 					i == 2 ? "*" : "");
 		break;
 	case PP_MCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetFclkFrequency);
-		now = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetFclkFrequency, &now);
 
 		for (i = 0; i < mclk_table->count; i++)
 			size += sprintf(buf + size, "%d: %uMhz %s\n",
@@ -1122,15 +1159,13 @@ static int smu10_read_sensor(struct pp_hwmgr *hwmgr, int idx,
 
 	switch (idx) {
 	case AMDGPU_PP_SENSOR_GFX_SCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetGfxclkFrequency);
-		sclk = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetGfxclkFrequency, &sclk);
 			/* in units of 10KHZ */
 		*((uint32_t *)value) = sclk * 100;
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_GFX_MCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetFclkFrequency);
-		mclk = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetFclkFrequency, &mclk);
 			/* in units of 10KHZ */
 		*((uint32_t *)value) = mclk * 100;
 		*size = 4;
@@ -1166,20 +1201,20 @@ static int smu10_set_watermarks_for_clocks_ranges(struct pp_hwmgr *hwmgr,
 static int smu10_smus_notify_pwe(struct pp_hwmgr *hwmgr)
 {
 
-	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SetRccPfcPmeRestoreRegister);
+	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SetRccPfcPmeRestoreRegister, NULL);
 }
 
 static int smu10_powergate_mmhub(struct pp_hwmgr *hwmgr)
 {
-	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PowerGateMmHub);
+	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PowerGateMmHub, NULL);
 }
 
 static int smu10_powergate_sdma(struct pp_hwmgr *hwmgr, bool gate)
 {
 	if (gate)
-		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PowerDownSdma);
+		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PowerDownSdma, NULL);
 	else
-		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PowerUpSdma);
+		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PowerUpSdma, NULL);
 }
 
 static void smu10_powergate_vcn(struct pp_hwmgr *hwmgr, bool bgate)
@@ -1191,11 +1226,11 @@ static void smu10_powergate_vcn(struct pp_hwmgr *hwmgr, bool bgate)
 						AMD_IP_BLOCK_TYPE_VCN,
 						AMD_PG_STATE_GATE);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_PowerDownVcn, 0);
+					PPSMC_MSG_PowerDownVcn, 0, NULL);
 		smu10_data->vcn_power_gated = true;
 	} else {
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-						PPSMC_MSG_PowerUpVcn, 0);
+						PPSMC_MSG_PowerUpVcn, 0, NULL);
 		amdgpu_device_ip_set_powergating_state(hwmgr->adev,
 						AMD_IP_BLOCK_TYPE_VCN,
 						AMD_PG_STATE_UNGATE);
@@ -1304,7 +1339,8 @@ static int smu10_set_power_profile_mode(struct pp_hwmgr *hwmgr, long *input, uin
 		hwmgr->gfxoff_state_changed_by_workload = true;
 	}
 	result = smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_ActiveProcessNotify,
-						1 << workload_type);
+						1 << workload_type,
+						NULL);
 	if (!result)
 		hwmgr->power_profile_mode = input[size];
 	if (workload_type && hwmgr->gfxoff_state_changed_by_workload) {
@@ -1319,7 +1355,8 @@ static int smu10_asic_reset(struct pp_hwmgr *hwmgr, enum SMU_ASIC_RESET_MODE mod
 {
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
 						   PPSMC_MSG_DeviceDriverReset,
-						   mode);
+						   mode,
+						   NULL);
 }
 
 static const struct pp_hwmgr_func smu10_hwmgr_funcs = {
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.c
index 683b29a99366..f2bda3bcbbde 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.c
@@ -29,14 +29,16 @@ static int smu7_enable_disable_uvd_dpm(struct pp_hwmgr *hwmgr, bool enable)
 {
 	return smum_send_msg_to_smc(hwmgr, enable ?
 			PPSMC_MSG_UVDDPM_Enable :
-			PPSMC_MSG_UVDDPM_Disable);
+			PPSMC_MSG_UVDDPM_Disable,
+			NULL);
 }
 
 static int smu7_enable_disable_vce_dpm(struct pp_hwmgr *hwmgr, bool enable)
 {
 	return smum_send_msg_to_smc(hwmgr, enable ?
 			PPSMC_MSG_VCEDPM_Enable :
-			PPSMC_MSG_VCEDPM_Disable);
+			PPSMC_MSG_VCEDPM_Disable,
+			NULL);
 }
 
 static int smu7_update_uvd_dpm(struct pp_hwmgr *hwmgr, bool bgate)
@@ -57,7 +59,8 @@ int smu7_powerdown_uvd(struct pp_hwmgr *hwmgr)
 {
 	if (phm_cf_want_uvd_power_gating(hwmgr))
 		return smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_UVDPowerOFF);
+				PPSMC_MSG_UVDPowerOFF,
+				NULL);
 	return 0;
 }
 
@@ -67,10 +70,10 @@ static int smu7_powerup_uvd(struct pp_hwmgr *hwmgr)
 		if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
 				  PHM_PlatformCaps_UVDDynamicPowerGating)) {
 			return smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_UVDPowerON, 1);
+					PPSMC_MSG_UVDPowerON, 1, NULL);
 		} else {
 			return smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_UVDPowerON, 0);
+					PPSMC_MSG_UVDPowerON, 0, NULL);
 		}
 	}
 
@@ -81,7 +84,8 @@ static int smu7_powerdown_vce(struct pp_hwmgr *hwmgr)
 {
 	if (phm_cf_want_vce_power_gating(hwmgr))
 		return smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_VCEPowerOFF);
+				PPSMC_MSG_VCEPowerOFF,
+				NULL);
 	return 0;
 }
 
@@ -89,7 +93,8 @@ static int smu7_powerup_vce(struct pp_hwmgr *hwmgr)
 {
 	if (phm_cf_want_vce_power_gating(hwmgr))
 		return smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_VCEPowerON);
+				PPSMC_MSG_VCEPowerON,
+				NULL);
 	return 0;
 }
 
@@ -181,7 +186,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_GFX_CGCG_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			if (PP_STATE_SUPPORT_LS & *msg_id) {
@@ -191,7 +196,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_GFX_CGLS_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -204,7 +209,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_GFX_3DCG_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 
@@ -215,7 +220,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_GFX_3DLS_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -228,7 +233,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_GFX_RLC_LS_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -241,7 +246,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_GFX_CP_LS_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -255,7 +260,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 						CG_GFX_OTHERS_MGCG_MASK);
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -275,7 +280,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_BIF_MGCG_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			if  (PP_STATE_SUPPORT_LS & *msg_id) {
@@ -285,7 +290,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_BIF_MGLS_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -298,7 +303,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_MC_MGCG_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 
@@ -309,7 +314,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_MC_MGLS_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -322,7 +327,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_DRM_MGCG_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			if (PP_STATE_SUPPORT_LS & *msg_id) {
@@ -332,7 +337,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_DRM_MGLS_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -345,7 +350,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_HDP_MGCG_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 
@@ -356,7 +361,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_HDP_MGLS_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -369,7 +374,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_SDMA_MGCG_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 
@@ -380,7 +385,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_SDMA_MGLS_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -393,7 +398,7 @@ int smu7_update_clock_gatings(struct pp_hwmgr *hwmgr,
 				value = CG_SYS_ROM_MASK;
 
 				if (smum_send_msg_to_smc_with_parameter(
-						hwmgr, msg, value))
+						hwmgr, msg, value, NULL))
 					return -EINVAL;
 			}
 			break;
@@ -423,8 +428,10 @@ int smu7_powergate_gfx(struct pp_hwmgr *hwmgr, bool enable)
 	if (enable)
 		return smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_GFX_CU_PG_ENABLE,
-					adev->gfx.cu_info.number);
+					adev->gfx.cu_info.number,
+					NULL);
 	else
 		return smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_GFX_CU_PG_DISABLE);
+				PPSMC_MSG_GFX_CU_PG_DISABLE,
+				NULL);
 }
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
index fc4e6dd2aa82..f1d3254e61c3 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
@@ -186,7 +186,7 @@ static int smu7_enable_smc_voltage_controller(struct pp_hwmgr *hwmgr)
 	}
 
 	if (hwmgr->feature_mask & PP_SMC_VOLTAGE_CONTROL_MASK)
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Voltage_Cntl_Enable);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Voltage_Cntl_Enable, NULL);
 
 	return 0;
 }
@@ -493,7 +493,7 @@ static int smu7_copy_and_switch_arb_sets(struct pp_hwmgr *hwmgr,
 
 static int smu7_reset_to_default(struct pp_hwmgr *hwmgr)
 {
-	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ResetToDefaults);
+	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ResetToDefaults, NULL);
 }
 
 /**
@@ -979,7 +979,8 @@ static int smu7_enable_vrhot_gpio_interrupt(struct pp_hwmgr *hwmgr)
 	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
 			PHM_PlatformCaps_RegulatorHot))
 		return smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_EnableVRHotGPIOInterrupt);
+				PPSMC_MSG_EnableVRHotGPIOInterrupt,
+				NULL);
 
 	return 0;
 }
@@ -996,7 +997,7 @@ static int smu7_enable_ulv(struct pp_hwmgr *hwmgr)
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 
 	if (data->ulv_supported)
-		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableULV);
+		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableULV, NULL);
 
 	return 0;
 }
@@ -1006,7 +1007,7 @@ static int smu7_disable_ulv(struct pp_hwmgr *hwmgr)
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 
 	if (data->ulv_supported)
-		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisableULV);
+		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisableULV, NULL);
 
 	return 0;
 }
@@ -1015,13 +1016,14 @@ static int smu7_enable_deep_sleep_master_switch(struct pp_hwmgr *hwmgr)
 {
 	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
 			PHM_PlatformCaps_SclkDeepSleep)) {
-		if (smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MASTER_DeepSleep_ON))
+		if (smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MASTER_DeepSleep_ON, NULL))
 			PP_ASSERT_WITH_CODE(false,
 					"Attempt to enable Master Deep Sleep switch failed!",
 					return -EINVAL);
 	} else {
 		if (smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_MASTER_DeepSleep_OFF)) {
+				PPSMC_MSG_MASTER_DeepSleep_OFF,
+				NULL)) {
 			PP_ASSERT_WITH_CODE(false,
 					"Attempt to disable Master Deep Sleep switch failed!",
 					return -EINVAL);
@@ -1036,7 +1038,8 @@ static int smu7_disable_deep_sleep_master_switch(struct pp_hwmgr *hwmgr)
 	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
 			PHM_PlatformCaps_SclkDeepSleep)) {
 		if (smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_MASTER_DeepSleep_OFF)) {
+				PPSMC_MSG_MASTER_DeepSleep_OFF,
+				NULL)) {
 			PP_ASSERT_WITH_CODE(false,
 					"Attempt to disable Master Deep Sleep switch failed!",
 					return -EINVAL);
@@ -1089,7 +1092,7 @@ static int smu7_enable_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 			smu7_disable_sclk_vce_handshake(hwmgr);
 
 		PP_ASSERT_WITH_CODE(
-		(0 == smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DPM_Enable)),
+		(0 == smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DPM_Enable, NULL)),
 		"Failed to enable SCLK DPM during DPM Start Function!",
 		return -EINVAL);
 	}
@@ -1101,7 +1104,8 @@ static int smu7_enable_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(
 				(0 == smum_send_msg_to_smc(hwmgr,
-						PPSMC_MSG_MCLKDPM_Enable)),
+						PPSMC_MSG_MCLKDPM_Enable,
+						NULL)),
 				"Failed to enable MCLK DPM during DPM Start Function!",
 				return -EINVAL);
 
@@ -1172,7 +1176,8 @@ static int smu7_start_dpm(struct pp_hwmgr *hwmgr)
 	if (0 == data->pcie_dpm_key_disabled) {
 		PP_ASSERT_WITH_CODE(
 				(0 == smum_send_msg_to_smc(hwmgr,
-						PPSMC_MSG_PCIeDPM_Enable)),
+						PPSMC_MSG_PCIeDPM_Enable,
+						NULL)),
 				"Failed to enable pcie DPM during DPM Start Function!",
 				return -EINVAL);
 	}
@@ -1180,7 +1185,8 @@ static int smu7_start_dpm(struct pp_hwmgr *hwmgr)
 	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
 				PHM_PlatformCaps_Falcon_QuickTransition)) {
 		PP_ASSERT_WITH_CODE((0 == smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_EnableACDCGPIOInterrupt)),
+				PPSMC_MSG_EnableACDCGPIOInterrupt,
+				NULL)),
 				"Failed to enable AC DC GPIO Interrupt!",
 				);
 	}
@@ -1197,7 +1203,7 @@ static int smu7_disable_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 		PP_ASSERT_WITH_CODE(true == smum_is_dpm_running(hwmgr),
 				"Trying to disable SCLK DPM when DPM is disabled",
 				return 0);
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DPM_Disable);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DPM_Disable, NULL);
 	}
 
 	/* disable MCLK dpm */
@@ -1205,7 +1211,7 @@ static int smu7_disable_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 		PP_ASSERT_WITH_CODE(true == smum_is_dpm_running(hwmgr),
 				"Trying to disable MCLK DPM when DPM is disabled",
 				return 0);
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_Disable);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_Disable, NULL);
 	}
 
 	return 0;
@@ -1226,7 +1232,8 @@ static int smu7_stop_dpm(struct pp_hwmgr *hwmgr)
 	if (!data->pcie_dpm_key_disabled) {
 		PP_ASSERT_WITH_CODE(
 				(smum_send_msg_to_smc(hwmgr,
-						PPSMC_MSG_PCIeDPM_Disable) == 0),
+						PPSMC_MSG_PCIeDPM_Disable,
+						NULL) == 0),
 				"Failed to disable pcie DPM during DPM Stop Function!",
 				return -EINVAL);
 	}
@@ -1237,7 +1244,7 @@ static int smu7_stop_dpm(struct pp_hwmgr *hwmgr)
 			"Trying to disable voltage DPM when DPM is disabled",
 			return 0);
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Voltage_Cntl_Disable);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Voltage_Cntl_Disable, NULL);
 
 	return 0;
 }
@@ -1388,7 +1395,7 @@ static int smu7_enable_dpm_tasks(struct pp_hwmgr *hwmgr)
 	PP_ASSERT_WITH_CODE((0 == tmp_result),
 			"Failed to enable VR hot GPIO interrupt!", result = tmp_result);
 
-	smum_send_msg_to_smc(hwmgr, (PPSMC_Msg)PPSMC_NoDisplay);
+	smum_send_msg_to_smc(hwmgr, (PPSMC_Msg)PPSMC_NoDisplay, NULL);
 
 	tmp_result = smu7_enable_sclk_control(hwmgr);
 	PP_ASSERT_WITH_CODE((0 == tmp_result),
@@ -1446,14 +1453,14 @@ static int smu7_avfs_control(struct pp_hwmgr *hwmgr, bool enable)
 		if (!PHM_READ_VFPF_INDIRECT_FIELD(hwmgr->device,
 				CGS_IND_REG__SMC, FEATURE_STATUS, AVS_ON)) {
 			PP_ASSERT_WITH_CODE(!smum_send_msg_to_smc(
-					hwmgr, PPSMC_MSG_EnableAvfs),
+					hwmgr, PPSMC_MSG_EnableAvfs, NULL),
 					"Failed to enable AVFS!",
 					return -EINVAL);
 		}
 	} else if (PHM_READ_VFPF_INDIRECT_FIELD(hwmgr->device,
 			CGS_IND_REG__SMC, FEATURE_STATUS, AVS_ON)) {
 		PP_ASSERT_WITH_CODE(!smum_send_msg_to_smc(
-				hwmgr, PPSMC_MSG_DisableAvfs),
+				hwmgr, PPSMC_MSG_DisableAvfs, NULL),
 				"Failed to disable AVFS!",
 				return -EINVAL);
 	}
@@ -2609,7 +2616,8 @@ static int smu7_force_dpm_highest(struct pp_hwmgr *hwmgr)
 
 			if (level)
 				smum_send_msg_to_smc_with_parameter(hwmgr,
-						PPSMC_MSG_PCIeDPM_ForceLevel, level);
+						PPSMC_MSG_PCIeDPM_ForceLevel, level,
+						NULL);
 		}
 	}
 
@@ -2623,7 +2631,8 @@ static int smu7_force_dpm_highest(struct pp_hwmgr *hwmgr)
 			if (level)
 				smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SCLKDPM_SetEnabledMask,
-						(1 << level));
+						(1 << level),
+						NULL);
 		}
 	}
 
@@ -2637,7 +2646,8 @@ static int smu7_force_dpm_highest(struct pp_hwmgr *hwmgr)
 			if (level)
 				smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_MCLKDPM_SetEnabledMask,
-						(1 << level));
+						(1 << level),
+						NULL);
 		}
 	}
 
@@ -2656,14 +2666,16 @@ static int smu7_upload_dpm_level_enable_mask(struct pp_hwmgr *hwmgr)
 		if (data->dpm_level_enable_mask.sclk_dpm_enable_mask)
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SCLKDPM_SetEnabledMask,
-					data->dpm_level_enable_mask.sclk_dpm_enable_mask);
+					data->dpm_level_enable_mask.sclk_dpm_enable_mask,
+					NULL);
 	}
 
 	if (!data->mclk_dpm_key_disabled) {
 		if (data->dpm_level_enable_mask.mclk_dpm_enable_mask)
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_MCLKDPM_SetEnabledMask,
-					data->dpm_level_enable_mask.mclk_dpm_enable_mask);
+					data->dpm_level_enable_mask.mclk_dpm_enable_mask,
+					NULL);
 	}
 
 	return 0;
@@ -2678,7 +2690,8 @@ static int smu7_unforce_dpm_levels(struct pp_hwmgr *hwmgr)
 
 	if (!data->pcie_dpm_key_disabled) {
 		smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_PCIeDPM_UnForceLevel);
+				PPSMC_MSG_PCIeDPM_UnForceLevel,
+				NULL);
 	}
 
 	return smu7_upload_dpm_level_enable_mask(hwmgr);
@@ -2696,7 +2709,8 @@ static int smu7_force_dpm_lowest(struct pp_hwmgr *hwmgr)
 							      data->dpm_level_enable_mask.sclk_dpm_enable_mask);
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 							    PPSMC_MSG_SCLKDPM_SetEnabledMask,
-							    (1 << level));
+							    (1 << level),
+							    NULL);
 
 	}
 
@@ -2706,7 +2720,8 @@ static int smu7_force_dpm_lowest(struct pp_hwmgr *hwmgr)
 							      data->dpm_level_enable_mask.mclk_dpm_enable_mask);
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 							    PPSMC_MSG_MCLKDPM_SetEnabledMask,
-							    (1 << level));
+							    (1 << level),
+							    NULL);
 		}
 	}
 
@@ -2716,7 +2731,8 @@ static int smu7_force_dpm_lowest(struct pp_hwmgr *hwmgr)
 							      data->dpm_level_enable_mask.pcie_dpm_enable_mask);
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 							    PPSMC_MSG_PCIeDPM_ForceLevel,
-							    (level));
+							    (level),
+							    NULL);
 		}
 	}
 
@@ -3495,21 +3511,20 @@ static int smu7_get_gpu_power(struct pp_hwmgr *hwmgr, u32 *query)
 	    (adev->asic_type != CHIP_BONAIRE) &&
 	    (adev->asic_type != CHIP_FIJI) &&
 	    (adev->asic_type != CHIP_TONGA)) {
-		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetCurrPkgPwr, 0);
-		tmp = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetCurrPkgPwr, 0, &tmp);
 		*query = tmp;
 
 		if (tmp != 0)
 			return 0;
 	}
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PmStatusLogStart);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PmStatusLogStart, NULL);
 	cgs_write_ind_register(hwmgr->device, CGS_IND_REG__SMC,
 							ixSMU_PM_STATUS_95, 0);
 
 	for (i = 0; i < 10; i++) {
 		msleep(500);
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PmStatusLogSample);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PmStatusLogSample, NULL);
 		tmp = cgs_read_ind_register(hwmgr->device,
 						CGS_IND_REG__SMC,
 						ixSMU_PM_STATUS_95);
@@ -3534,14 +3549,12 @@ static int smu7_read_sensor(struct pp_hwmgr *hwmgr, int idx,
 
 	switch (idx) {
 	case AMDGPU_PP_SENSOR_GFX_SCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_API_GetSclkFrequency);
-		sclk = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_API_GetSclkFrequency, &sclk);
 		*((uint32_t *)value) = sclk;
 		*size = 4;
 		return 0;
 	case AMDGPU_PP_SENSOR_GFX_MCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_API_GetMclkFrequency);
-		mclk = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_API_GetMclkFrequency, &mclk);
 		*((uint32_t *)value) = mclk;
 		*size = 4;
 		return 0;
@@ -3730,7 +3743,8 @@ static int smu7_freeze_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 				"Trying to freeze SCLK DPM when DPM is disabled",
 				);
 		PP_ASSERT_WITH_CODE(0 == smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_SCLKDPM_FreezeLevel),
+				PPSMC_MSG_SCLKDPM_FreezeLevel,
+				NULL),
 				"Failed to freeze SCLK DPM during FreezeSclkMclkDPM Function!",
 				return -EINVAL);
 	}
@@ -3742,7 +3756,8 @@ static int smu7_freeze_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 				"Trying to freeze MCLK DPM when DPM is disabled",
 				);
 		PP_ASSERT_WITH_CODE(0 == smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_MCLKDPM_FreezeLevel),
+				PPSMC_MSG_MCLKDPM_FreezeLevel,
+				NULL),
 				"Failed to freeze MCLK DPM during FreezeSclkMclkDPM Function!",
 				return -EINVAL);
 	}
@@ -3881,7 +3896,8 @@ static int smu7_unfreeze_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 				"Trying to Unfreeze SCLK DPM when DPM is disabled",
 				);
 		PP_ASSERT_WITH_CODE(0 == smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_SCLKDPM_UnfreezeLevel),
+				PPSMC_MSG_SCLKDPM_UnfreezeLevel,
+				NULL),
 			"Failed to unfreeze SCLK DPM during UnFreezeSclkMclkDPM Function!",
 			return -EINVAL);
 	}
@@ -3893,7 +3909,8 @@ static int smu7_unfreeze_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 				"Trying to Unfreeze MCLK DPM when DPM is disabled",
 				);
 		PP_ASSERT_WITH_CODE(0 == smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_MCLKDPM_UnfreezeLevel),
+				PPSMC_MSG_MCLKDPM_UnfreezeLevel,
+				NULL),
 		    "Failed to unfreeze MCLK DPM during UnFreezeSclkMclkDPM Function!",
 		    return -EINVAL);
 	}
@@ -3946,12 +3963,14 @@ static int smu7_notify_smc_display(struct pp_hwmgr *hwmgr)
 	if (hwmgr->feature_mask & PP_VBI_TIME_SUPPORT_MASK) {
 		if (hwmgr->chip_id == CHIP_VEGAM)
 			smum_send_msg_to_smc_with_parameter(hwmgr,
-					(PPSMC_Msg)PPSMC_MSG_SetVBITimeout_VEGAM, data->frame_time_x2);
+					(PPSMC_Msg)PPSMC_MSG_SetVBITimeout_VEGAM, data->frame_time_x2,
+					NULL);
 		else
 			smum_send_msg_to_smc_with_parameter(hwmgr,
-					(PPSMC_Msg)PPSMC_MSG_SetVBITimeout, data->frame_time_x2);
+					(PPSMC_Msg)PPSMC_MSG_SetVBITimeout, data->frame_time_x2,
+					NULL);
 	}
-	return (smum_send_msg_to_smc(hwmgr, (PPSMC_Msg)PPSMC_HasDisplay) == 0) ?  0 : -EINVAL;
+	return (smum_send_msg_to_smc(hwmgr, (PPSMC_Msg)PPSMC_HasDisplay, NULL) == 0) ?  0 : -EINVAL;
 }
 
 static int smu7_set_power_state_tasks(struct pp_hwmgr *hwmgr, const void *input)
@@ -4037,7 +4056,8 @@ static int smu7_set_max_fan_pwm_output(struct pp_hwmgr *hwmgr, uint16_t us_max_f
 	advanceFanControlParameters.usMaxFanPWM = us_max_fan_pwm;
 
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_SetFanPwmMax, us_max_fan_pwm);
+			PPSMC_MSG_SetFanPwmMax, us_max_fan_pwm,
+			NULL);
 }
 
 static int
@@ -4045,7 +4065,7 @@ smu7_notify_smc_display_change(struct pp_hwmgr *hwmgr, bool has_display)
 {
 	PPSMC_Msg msg = has_display ? (PPSMC_Msg)PPSMC_HasDisplay : (PPSMC_Msg)PPSMC_NoDisplay;
 
-	return (smum_send_msg_to_smc(hwmgr, msg) == 0) ?  0 : -1;
+	return (smum_send_msg_to_smc(hwmgr, msg, NULL) == 0) ?  0 : -1;
 }
 
 static int
@@ -4129,7 +4149,8 @@ static int smu7_set_max_fan_rpm_output(struct pp_hwmgr *hwmgr, uint16_t us_max_f
 	advanceFanControlParameters.usMaxFanRPM = us_max_fan_rpm;
 
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_SetFanRpmMax, us_max_fan_rpm);
+			PPSMC_MSG_SetFanRpmMax, us_max_fan_rpm,
+			NULL);
 }
 
 static const struct amdgpu_irq_src_funcs smu7_irq_funcs = {
@@ -4259,14 +4280,14 @@ static int smu7_check_mc_firmware(struct pp_hwmgr *hwmgr)
 		if ((hwmgr->chip_id == CHIP_POLARIS10) ||
 		    (hwmgr->chip_id == CHIP_POLARIS11) ||
 		    (hwmgr->chip_id == CHIP_POLARIS12))
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableFFC);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableFFC, NULL);
 	} else {
 		data->mem_latency_high = 330;
 		data->mem_latency_low = 330;
 		if ((hwmgr->chip_id == CHIP_POLARIS10) ||
 		    (hwmgr->chip_id == CHIP_POLARIS11) ||
 		    (hwmgr->chip_id == CHIP_POLARIS12))
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisableFFC);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisableFFC, NULL);
 	}
 
 	return 0;
@@ -4410,13 +4431,15 @@ static int smu7_force_clock_level(struct pp_hwmgr *hwmgr,
 		if (!data->sclk_dpm_key_disabled)
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SCLKDPM_SetEnabledMask,
-					data->dpm_level_enable_mask.sclk_dpm_enable_mask & mask);
+					data->dpm_level_enable_mask.sclk_dpm_enable_mask & mask,
+					NULL);
 		break;
 	case PP_MCLK:
 		if (!data->mclk_dpm_key_disabled)
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_MCLKDPM_SetEnabledMask,
-					data->dpm_level_enable_mask.mclk_dpm_enable_mask & mask);
+					data->dpm_level_enable_mask.mclk_dpm_enable_mask & mask,
+					NULL);
 		break;
 	case PP_PCIE:
 	{
@@ -4424,11 +4447,13 @@ static int smu7_force_clock_level(struct pp_hwmgr *hwmgr,
 
 		if (!data->pcie_dpm_key_disabled) {
 			if (fls(tmp) != ffs(tmp))
-				smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PCIeDPM_UnForceLevel);
+				smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PCIeDPM_UnForceLevel,
+						NULL);
 			else
 				smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_PCIeDPM_ForceLevel,
-					fls(tmp) - 1);
+					fls(tmp) - 1,
+					NULL);
 		}
 		break;
 	}
@@ -4454,8 +4479,7 @@ static int smu7_print_clock_levels(struct pp_hwmgr *hwmgr,
 
 	switch (type) {
 	case PP_SCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_API_GetSclkFrequency);
-		clock = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_API_GetSclkFrequency, &clock);
 
 		for (i = 0; i < sclk_table->count; i++) {
 			if (clock > sclk_table->dpm_levels[i].value)
@@ -4470,8 +4494,7 @@ static int smu7_print_clock_levels(struct pp_hwmgr *hwmgr,
 					(i == now) ? "*" : "");
 		break;
 	case PP_MCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_API_GetMclkFrequency);
-		clock = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_API_GetMclkFrequency, &clock);
 
 		for (i = 0; i < mclk_table->count; i++) {
 			if (clock > mclk_table->dpm_levels[i].value)
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_powertune.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_powertune.c
index 58f5589aaf12..5d4971576111 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_powertune.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_powertune.c
@@ -887,7 +887,10 @@ static int smu7_enable_didt(struct pp_hwmgr *hwmgr, const bool enable)
 	didt_block |= block_en << TCP_Enable_SHIFT;
 
 	if (enable)
-		result = smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_Didt_Block_Function, didt_block);
+		result = smum_send_msg_to_smc_with_parameter(hwmgr,
+						PPSMC_MSG_Didt_Block_Function,
+						didt_block,
+						NULL);
 
 	return result;
 }
@@ -1009,7 +1012,8 @@ int smu7_enable_didt_config(struct pp_hwmgr *hwmgr)
 
 		if (hwmgr->chip_id == CHIP_POLARIS11) {
 			result = smum_send_msg_to_smc(hwmgr,
-						(uint16_t)(PPSMC_MSG_EnableDpmDidt));
+						(uint16_t)(PPSMC_MSG_EnableDpmDidt),
+						NULL);
 			PP_ASSERT_WITH_CODE((0 == result),
 					"Failed to enable DPM DIDT.", goto error);
 		}
@@ -1042,7 +1046,8 @@ int smu7_disable_didt_config(struct pp_hwmgr *hwmgr)
 				goto error);
 		if (hwmgr->chip_id == CHIP_POLARIS11) {
 			result = smum_send_msg_to_smc(hwmgr,
-						(uint16_t)(PPSMC_MSG_DisableDpmDidt));
+						(uint16_t)(PPSMC_MSG_DisableDpmDidt),
+						NULL);
 			PP_ASSERT_WITH_CODE((0 == result),
 					"Failed to disable DPM DIDT.", goto error);
 		}
@@ -1063,7 +1068,8 @@ int smu7_enable_smc_cac(struct pp_hwmgr *hwmgr)
 	if (PP_CAP(PHM_PlatformCaps_CAC)) {
 		int smc_result;
 		smc_result = smum_send_msg_to_smc(hwmgr,
-				(uint16_t)(PPSMC_MSG_EnableCac));
+				(uint16_t)(PPSMC_MSG_EnableCac),
+				NULL);
 		PP_ASSERT_WITH_CODE((0 == smc_result),
 				"Failed to enable CAC in SMC.", result = -1);
 
@@ -1079,7 +1085,8 @@ int smu7_disable_smc_cac(struct pp_hwmgr *hwmgr)
 
 	if (PP_CAP(PHM_PlatformCaps_CAC) && data->cac_enabled) {
 		int smc_result = smum_send_msg_to_smc(hwmgr,
-				(uint16_t)(PPSMC_MSG_DisableCac));
+				(uint16_t)(PPSMC_MSG_DisableCac),
+				NULL);
 		PP_ASSERT_WITH_CODE((smc_result == 0),
 				"Failed to disable CAC in SMC.", result = -1);
 
@@ -1095,7 +1102,9 @@ int smu7_set_power_limit(struct pp_hwmgr *hwmgr, uint32_t n)
 	if (data->power_containment_features &
 			POWERCONTAINMENT_FEATURE_PkgPwrLimit)
 		return smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_PkgPwrSetLimit, n<<8);
+				PPSMC_MSG_PkgPwrSetLimit,
+				n<<8,
+				NULL);
 	return 0;
 }
 
@@ -1103,7 +1112,9 @@ static int smu7_set_overdriver_target_tdp(struct pp_hwmgr *hwmgr,
 						uint32_t target_tdp)
 {
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_OverDriveSetTargetTdp, target_tdp);
+			PPSMC_MSG_OverDriveSetTargetTdp,
+			target_tdp,
+			NULL);
 }
 
 int smu7_enable_power_containment(struct pp_hwmgr *hwmgr)
@@ -1124,7 +1135,8 @@ int smu7_enable_power_containment(struct pp_hwmgr *hwmgr)
 	if (PP_CAP(PHM_PlatformCaps_PowerContainment)) {
 		if (data->enable_tdc_limit_feature) {
 			smc_result = smum_send_msg_to_smc(hwmgr,
-					(uint16_t)(PPSMC_MSG_TDCLimitEnable));
+					(uint16_t)(PPSMC_MSG_TDCLimitEnable),
+					NULL);
 			PP_ASSERT_WITH_CODE((0 == smc_result),
 					"Failed to enable TDCLimit in SMC.", result = -1;);
 			if (0 == smc_result)
@@ -1134,7 +1146,8 @@ int smu7_enable_power_containment(struct pp_hwmgr *hwmgr)
 
 		if (data->enable_pkg_pwr_tracking_feature) {
 			smc_result = smum_send_msg_to_smc(hwmgr,
-					(uint16_t)(PPSMC_MSG_PkgPwrLimitEnable));
+					(uint16_t)(PPSMC_MSG_PkgPwrLimitEnable),
+					NULL);
 			PP_ASSERT_WITH_CODE((0 == smc_result),
 					"Failed to enable PkgPwrTracking in SMC.", result = -1;);
 			if (0 == smc_result) {
@@ -1163,7 +1176,8 @@ int smu7_disable_power_containment(struct pp_hwmgr *hwmgr)
 		if (data->power_containment_features &
 				POWERCONTAINMENT_FEATURE_TDCLimit) {
 			smc_result = smum_send_msg_to_smc(hwmgr,
-					(uint16_t)(PPSMC_MSG_TDCLimitDisable));
+					(uint16_t)(PPSMC_MSG_TDCLimitDisable),
+					NULL);
 			PP_ASSERT_WITH_CODE((smc_result == 0),
 					"Failed to disable TDCLimit in SMC.",
 					result = smc_result);
@@ -1172,7 +1186,8 @@ int smu7_disable_power_containment(struct pp_hwmgr *hwmgr)
 		if (data->power_containment_features &
 				POWERCONTAINMENT_FEATURE_DTE) {
 			smc_result = smum_send_msg_to_smc(hwmgr,
-					(uint16_t)(PPSMC_MSG_DisableDTE));
+					(uint16_t)(PPSMC_MSG_DisableDTE),
+					NULL);
 			PP_ASSERT_WITH_CODE((smc_result == 0),
 					"Failed to disable DTE in SMC.",
 					result = smc_result);
@@ -1181,7 +1196,8 @@ int smu7_disable_power_containment(struct pp_hwmgr *hwmgr)
 		if (data->power_containment_features &
 				POWERCONTAINMENT_FEATURE_PkgPwrLimit) {
 			smc_result = smum_send_msg_to_smc(hwmgr,
-					(uint16_t)(PPSMC_MSG_PkgPwrLimitDisable));
+					(uint16_t)(PPSMC_MSG_PkgPwrLimitDisable),
+					NULL);
 			PP_ASSERT_WITH_CODE((smc_result == 0),
 					"Failed to disable PkgPwrTracking in SMC.",
 					result = smc_result);
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_thermal.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_thermal.c
index dd4f450d1199..0b30f73649a8 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_thermal.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_thermal.c
@@ -152,7 +152,7 @@ int smu7_fan_ctrl_start_smc_fan_control(struct pp_hwmgr *hwmgr)
 
 	if (PP_CAP(PHM_PlatformCaps_ODFuzzyFanControlSupport)) {
 		result = smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_StartFanControl,
-					FAN_CONTROL_FUZZY);
+					FAN_CONTROL_FUZZY, NULL);
 
 		if (PP_CAP(PHM_PlatformCaps_FanSpeedInTableIsRPM))
 			hwmgr->hwmgr_func->set_max_fan_rpm_output(hwmgr,
@@ -165,7 +165,7 @@ int smu7_fan_ctrl_start_smc_fan_control(struct pp_hwmgr *hwmgr)
 
 	} else {
 		result = smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_StartFanControl,
-					FAN_CONTROL_TABLE);
+					FAN_CONTROL_TABLE, NULL);
 	}
 
 	if (!result && hwmgr->thermal_controller.
@@ -173,7 +173,8 @@ int smu7_fan_ctrl_start_smc_fan_control(struct pp_hwmgr *hwmgr)
 		result = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetFanTemperatureTarget,
 				hwmgr->thermal_controller.
-				advanceFanControlParameters.ucTargetTemperature);
+				advanceFanControlParameters.ucTargetTemperature,
+				NULL);
 	hwmgr->fan_ctrl_enabled = true;
 
 	return result;
@@ -183,7 +184,7 @@ int smu7_fan_ctrl_start_smc_fan_control(struct pp_hwmgr *hwmgr)
 int smu7_fan_ctrl_stop_smc_fan_control(struct pp_hwmgr *hwmgr)
 {
 	hwmgr->fan_ctrl_enabled = false;
-	return smum_send_msg_to_smc(hwmgr, PPSMC_StopFanControl);
+	return smum_send_msg_to_smc(hwmgr, PPSMC_StopFanControl, NULL);
 }
 
 /**
@@ -372,7 +373,7 @@ static void smu7_thermal_enable_alert(struct pp_hwmgr *hwmgr)
 			CG_THERMAL_INT, THERM_INT_MASK, alert);
 
 	/* send message to SMU to enable internal thermal interrupts */
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Thermal_Cntl_Enable);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Thermal_Cntl_Enable, NULL);
 }
 
 /**
@@ -390,7 +391,7 @@ int smu7_thermal_disable_alert(struct pp_hwmgr *hwmgr)
 			CG_THERMAL_INT, THERM_INT_MASK, alert);
 
 	/* send message to SMU to disable internal thermal interrupts */
-	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Thermal_Cntl_Disable);
+	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Thermal_Cntl_Disable, NULL);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
index 2e8061eccc43..a6c6a793e98e 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
@@ -162,8 +162,10 @@ static uint32_t smu8_get_max_sclk_level(struct pp_hwmgr *hwmgr)
 	struct smu8_hwmgr *data = hwmgr->backend;
 
 	if (data->max_sclk_level == 0) {
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMaxSclkLevel);
-		data->max_sclk_level = smum_get_argument(hwmgr) + 1;
+		smum_send_msg_to_smc(hwmgr,
+				PPSMC_MSG_GetMaxSclkLevel,
+				&data->max_sclk_level);
+		data->max_sclk_level += 1;
 	}
 
 	return data->max_sclk_level;
@@ -580,7 +582,8 @@ static int smu8_init_uvd_limit(struct pp_hwmgr *hwmgr)
 	struct smu8_hwmgr *data = hwmgr->backend;
 	struct phm_uvd_clock_voltage_dependency_table *table =
 				hwmgr->dyn_state.uvd_clock_voltage_dependency_table;
-	unsigned long clock = 0, level;
+	unsigned long clock = 0;
+	uint32_t level;
 
 	if (NULL == table || table->count <= 0)
 		return -EINVAL;
@@ -588,8 +591,7 @@ static int smu8_init_uvd_limit(struct pp_hwmgr *hwmgr)
 	data->uvd_dpm.soft_min_clk = 0;
 	data->uvd_dpm.hard_min_clk = 0;
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMaxUvdLevel);
-	level = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMaxUvdLevel, &level);
 
 	if (level < table->count)
 		clock = table->entries[level].vclk;
@@ -607,7 +609,8 @@ static int smu8_init_vce_limit(struct pp_hwmgr *hwmgr)
 	struct smu8_hwmgr *data = hwmgr->backend;
 	struct phm_vce_clock_voltage_dependency_table *table =
 				hwmgr->dyn_state.vce_clock_voltage_dependency_table;
-	unsigned long clock = 0, level;
+	unsigned long clock = 0;
+	uint32_t level;
 
 	if (NULL == table || table->count <= 0)
 		return -EINVAL;
@@ -615,8 +618,7 @@ static int smu8_init_vce_limit(struct pp_hwmgr *hwmgr)
 	data->vce_dpm.soft_min_clk = 0;
 	data->vce_dpm.hard_min_clk = 0;
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMaxEclkLevel);
-	level = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMaxEclkLevel, &level);
 
 	if (level < table->count)
 		clock = table->entries[level].ecclk;
@@ -634,7 +636,8 @@ static int smu8_init_acp_limit(struct pp_hwmgr *hwmgr)
 	struct smu8_hwmgr *data = hwmgr->backend;
 	struct phm_acp_clock_voltage_dependency_table *table =
 				hwmgr->dyn_state.acp_clock_voltage_dependency_table;
-	unsigned long clock = 0, level;
+	unsigned long clock = 0;
+	uint32_t level;
 
 	if (NULL == table || table->count <= 0)
 		return -EINVAL;
@@ -642,8 +645,7 @@ static int smu8_init_acp_limit(struct pp_hwmgr *hwmgr)
 	data->acp_dpm.soft_min_clk = 0;
 	data->acp_dpm.hard_min_clk = 0;
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMaxAclkLevel);
-	level = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetMaxAclkLevel, &level);
 
 	if (level < table->count)
 		clock = table->entries[level].acpclk;
@@ -665,7 +667,7 @@ static void smu8_init_power_gate_state(struct pp_hwmgr *hwmgr)
 #ifdef CONFIG_DRM_AMD_ACP
 	data->acp_power_gated = false;
 #else
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ACPPowerOFF);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ACPPowerOFF, NULL);
 	data->acp_power_gated = true;
 #endif
 
@@ -708,7 +710,8 @@ static int smu8_update_sclk_limit(struct pp_hwmgr *hwmgr)
 						PPSMC_MSG_SetSclkHardMin,
 						 smu8_get_sclk_level(hwmgr,
 					data->sclk_dpm.hard_min_clk,
-					     PPSMC_MSG_SetSclkHardMin));
+					     PPSMC_MSG_SetSclkHardMin),
+						 NULL);
 	}
 
 	clock = data->sclk_dpm.soft_min_clk;
@@ -731,7 +734,8 @@ static int smu8_update_sclk_limit(struct pp_hwmgr *hwmgr)
 						PPSMC_MSG_SetSclkSoftMin,
 						smu8_get_sclk_level(hwmgr,
 					data->sclk_dpm.soft_min_clk,
-					     PPSMC_MSG_SetSclkSoftMin));
+					     PPSMC_MSG_SetSclkSoftMin),
+						NULL);
 	}
 
 	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
@@ -742,7 +746,8 @@ static int smu8_update_sclk_limit(struct pp_hwmgr *hwmgr)
 						PPSMC_MSG_SetSclkSoftMax,
 						smu8_get_sclk_level(hwmgr,
 					data->sclk_dpm.soft_max_clk,
-					PPSMC_MSG_SetSclkSoftMax));
+					PPSMC_MSG_SetSclkSoftMax),
+						NULL);
 	}
 
 	return 0;
@@ -760,7 +765,8 @@ static int smu8_set_deep_sleep_sclk_threshold(struct pp_hwmgr *hwmgr)
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetMinDeepSleepSclk,
-				clks);
+				clks,
+				NULL);
 	}
 
 	return 0;
@@ -773,7 +779,8 @@ static int smu8_set_watermark_threshold(struct pp_hwmgr *hwmgr)
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetWatermarkFrequency,
-					data->sclk_dpm.soft_max_clk);
+					data->sclk_dpm.soft_max_clk,
+					NULL);
 
 	return 0;
 }
@@ -788,13 +795,15 @@ static int smu8_nbdpm_pstate_enable_disable(struct pp_hwmgr *hwmgr, bool enable,
 
 			return smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_EnableLowMemoryPstate,
-						(lock ? 1 : 0));
+						(lock ? 1 : 0),
+						NULL);
 		} else {
 			PP_DBG_LOG("disable Low Memory PState.\n");
 
 			return smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_DisableLowMemoryPstate,
-						(lock ? 1 : 0));
+						(lock ? 1 : 0),
+						NULL);
 		}
 	}
 
@@ -814,7 +823,8 @@ static int smu8_disable_nb_dpm(struct pp_hwmgr *hwmgr)
 		ret = smum_send_msg_to_smc_with_parameter(
 							  hwmgr,
 							  PPSMC_MSG_DisableAllSmuFeatures,
-							  dpm_features);
+							  dpm_features,
+							  NULL);
 		if (ret == 0)
 			data->is_nb_dpm_enabled = false;
 	}
@@ -835,7 +845,8 @@ static int smu8_enable_nb_dpm(struct pp_hwmgr *hwmgr)
 		ret = smum_send_msg_to_smc_with_parameter(
 							  hwmgr,
 							  PPSMC_MSG_EnableAllSmuFeatures,
-							  dpm_features);
+							  dpm_features,
+							  NULL);
 		if (ret == 0)
 			data->is_nb_dpm_enabled = true;
 	}
@@ -953,7 +964,8 @@ static int smu8_start_dpm(struct pp_hwmgr *hwmgr)
 
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_EnableAllSmuFeatures,
-				SCLK_DPM_MASK);
+				SCLK_DPM_MASK,
+				NULL);
 }
 
 static int smu8_stop_dpm(struct pp_hwmgr *hwmgr)
@@ -967,7 +979,8 @@ static int smu8_stop_dpm(struct pp_hwmgr *hwmgr)
 		data->dpm_flags &= ~DPMFlags_SCLK_Enabled;
 		ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DisableAllSmuFeatures,
-					dpm_features);
+					dpm_features,
+					NULL);
 	}
 	return ret;
 }
@@ -983,13 +996,15 @@ static int smu8_program_bootup_state(struct pp_hwmgr *hwmgr)
 				PPSMC_MSG_SetSclkSoftMin,
 				smu8_get_sclk_level(hwmgr,
 				data->sclk_dpm.soft_min_clk,
-				PPSMC_MSG_SetSclkSoftMin));
+				PPSMC_MSG_SetSclkSoftMin),
+				NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSclkSoftMax,
 				smu8_get_sclk_level(hwmgr,
 				data->sclk_dpm.soft_max_clk,
-				PPSMC_MSG_SetSclkSoftMax));
+				PPSMC_MSG_SetSclkSoftMax),
+				NULL);
 
 	return 0;
 }
@@ -1127,13 +1142,15 @@ static int smu8_phm_force_dpm_highest(struct pp_hwmgr *hwmgr)
 					PPSMC_MSG_SetSclkSoftMin,
 					smu8_get_sclk_level(hwmgr,
 					data->sclk_dpm.soft_max_clk,
-					PPSMC_MSG_SetSclkSoftMin));
+					PPSMC_MSG_SetSclkSoftMin),
+					NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSclkSoftMax,
 				smu8_get_sclk_level(hwmgr,
 				data->sclk_dpm.soft_max_clk,
-				PPSMC_MSG_SetSclkSoftMax));
+				PPSMC_MSG_SetSclkSoftMax),
+				NULL);
 
 	return 0;
 }
@@ -1167,13 +1184,15 @@ static int smu8_phm_unforce_dpm_levels(struct pp_hwmgr *hwmgr)
 				PPSMC_MSG_SetSclkSoftMin,
 				smu8_get_sclk_level(hwmgr,
 				data->sclk_dpm.soft_min_clk,
-				PPSMC_MSG_SetSclkSoftMin));
+				PPSMC_MSG_SetSclkSoftMin),
+				NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSclkSoftMax,
 				smu8_get_sclk_level(hwmgr,
 				data->sclk_dpm.soft_max_clk,
-				PPSMC_MSG_SetSclkSoftMax));
+				PPSMC_MSG_SetSclkSoftMax),
+				NULL);
 
 	return 0;
 }
@@ -1186,13 +1205,15 @@ static int smu8_phm_force_dpm_lowest(struct pp_hwmgr *hwmgr)
 			PPSMC_MSG_SetSclkSoftMax,
 			smu8_get_sclk_level(hwmgr,
 			data->sclk_dpm.soft_min_clk,
-			PPSMC_MSG_SetSclkSoftMax));
+			PPSMC_MSG_SetSclkSoftMax),
+			NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSclkSoftMin,
 				smu8_get_sclk_level(hwmgr,
 				data->sclk_dpm.soft_min_clk,
-				PPSMC_MSG_SetSclkSoftMin));
+				PPSMC_MSG_SetSclkSoftMin),
+				NULL);
 
 	return 0;
 }
@@ -1227,7 +1248,7 @@ static int smu8_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
 static int smu8_dpm_powerdown_uvd(struct pp_hwmgr *hwmgr)
 {
 	if (PP_CAP(PHM_PlatformCaps_UVDPowerGating))
-		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_UVDPowerOFF);
+		return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_UVDPowerOFF, NULL);
 	return 0;
 }
 
@@ -1237,7 +1258,8 @@ static int smu8_dpm_powerup_uvd(struct pp_hwmgr *hwmgr)
 		return smum_send_msg_to_smc_with_parameter(
 			hwmgr,
 			PPSMC_MSG_UVDPowerON,
-			PP_CAP(PHM_PlatformCaps_UVDDynamicPowerGating) ? 1 : 0);
+			PP_CAP(PHM_PlatformCaps_UVDDynamicPowerGating) ? 1 : 0,
+			NULL);
 	}
 
 	return 0;
@@ -1259,15 +1281,20 @@ static int  smu8_dpm_update_vce_dpm(struct pp_hwmgr *hwmgr)
 			PPSMC_MSG_SetEclkHardMin,
 			smu8_get_eclk_level(hwmgr,
 				data->vce_dpm.hard_min_clk,
-				PPSMC_MSG_SetEclkHardMin));
+				PPSMC_MSG_SetEclkHardMin),
+			NULL);
 	} else {
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_SetEclkHardMin, 0);
+					PPSMC_MSG_SetEclkHardMin,
+					0,
+					NULL);
 		/* disable ECLK DPM 0. Otherwise VCE could hang if
 		 * switching SCLK from DPM 0 to 6/7 */
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_SetEclkSoftMin, 1);
+					PPSMC_MSG_SetEclkSoftMin,
+					1,
+					NULL);
 	}
 	return 0;
 }
@@ -1276,7 +1303,8 @@ static int smu8_dpm_powerdown_vce(struct pp_hwmgr *hwmgr)
 {
 	if (PP_CAP(PHM_PlatformCaps_VCEPowerGating))
 		return smum_send_msg_to_smc(hwmgr,
-						     PPSMC_MSG_VCEPowerOFF);
+					    PPSMC_MSG_VCEPowerOFF,
+					    NULL);
 	return 0;
 }
 
@@ -1284,7 +1312,8 @@ static int smu8_dpm_powerup_vce(struct pp_hwmgr *hwmgr)
 {
 	if (PP_CAP(PHM_PlatformCaps_VCEPowerGating))
 		return smum_send_msg_to_smc(hwmgr,
-						     PPSMC_MSG_VCEPowerON);
+					    PPSMC_MSG_VCEPowerON,
+					    NULL);
 	return 0;
 }
 
@@ -1435,7 +1464,8 @@ static void smu8_hw_print_display_cfg(
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetDisplaySizePowerParams,
-						data);
+						data,
+						NULL);
 	}
 
 	return 0;
@@ -1497,10 +1527,12 @@ static int smu8_force_clock_level(struct pp_hwmgr *hwmgr,
 	case PP_SCLK:
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSclkSoftMin,
-				mask);
+				mask,
+				NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSclkSoftMax,
-				mask);
+				mask,
+				NULL);
 		break;
 	default:
 		break;
@@ -1753,9 +1785,10 @@ static int smu8_read_sensor(struct pp_hwmgr *hwmgr, int idx,
 		*((uint32_t *)value) = 0;
 		return 0;
 	case AMDGPU_PP_SENSOR_GPU_LOAD:
-		result = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetAverageGraphicsActivity);
+		result = smum_send_msg_to_smc(hwmgr,
+				PPSMC_MSG_GetAverageGraphicsActivity,
+				&activity_percent);
 		if (0 == result) {
-			activity_percent = smum_get_argument(hwmgr);
 			activity_percent = activity_percent > 100 ? 100 : activity_percent;
 		} else {
 			activity_percent = 50;
@@ -1785,20 +1818,25 @@ static int smu8_notify_cac_buffer_info(struct pp_hwmgr *hwmgr,
 {
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramAddrHiVirtual,
-					mc_addr_hi);
+					mc_addr_hi,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramAddrLoVirtual,
-					mc_addr_low);
+					mc_addr_low,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramAddrHiPhysical,
-					virtual_addr_hi);
+					virtual_addr_hi,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramAddrLoPhysical,
-					virtual_addr_low);
+					virtual_addr_low,
+					NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramBufferSize,
-					size);
+					size,
+					NULL);
 	return 0;
 }
 
@@ -1827,12 +1865,16 @@ static int smu8_enable_disable_uvd_dpm(struct pp_hwmgr *hwmgr, bool enable)
 		data->dpm_flags |= DPMFlags_UVD_Enabled;
 		dpm_features |= UVD_DPM_MASK;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-			    PPSMC_MSG_EnableAllSmuFeatures, dpm_features);
+			    PPSMC_MSG_EnableAllSmuFeatures,
+			    dpm_features,
+			    NULL);
 	} else {
 		dpm_features |= UVD_DPM_MASK;
 		data->dpm_flags &= ~DPMFlags_UVD_Enabled;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-			   PPSMC_MSG_DisableAllSmuFeatures, dpm_features);
+			   PPSMC_MSG_DisableAllSmuFeatures,
+			   dpm_features,
+			   NULL);
 	}
 	return 0;
 }
@@ -1854,7 +1896,8 @@ int smu8_dpm_update_uvd_dpm(struct pp_hwmgr *hwmgr, bool bgate)
 				PPSMC_MSG_SetUvdHardMin,
 				smu8_get_uvd_level(hwmgr,
 					data->uvd_dpm.hard_min_clk,
-					PPSMC_MSG_SetUvdHardMin));
+					PPSMC_MSG_SetUvdHardMin),
+				NULL);
 
 			smu8_enable_disable_uvd_dpm(hwmgr, true);
 		} else {
@@ -1878,12 +1921,16 @@ static int smu8_enable_disable_vce_dpm(struct pp_hwmgr *hwmgr, bool enable)
 		data->dpm_flags |= DPMFlags_VCE_Enabled;
 		dpm_features |= VCE_DPM_MASK;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-			    PPSMC_MSG_EnableAllSmuFeatures, dpm_features);
+			    PPSMC_MSG_EnableAllSmuFeatures,
+			    dpm_features,
+			    NULL);
 	} else {
 		dpm_features |= VCE_DPM_MASK;
 		data->dpm_flags &= ~DPMFlags_VCE_Enabled;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-			   PPSMC_MSG_DisableAllSmuFeatures, dpm_features);
+			   PPSMC_MSG_DisableAllSmuFeatures,
+			   dpm_features,
+			   NULL);
 	}
 
 	return 0;
@@ -1898,9 +1945,9 @@ static void smu8_dpm_powergate_acp(struct pp_hwmgr *hwmgr, bool bgate)
 		return;
 
 	if (bgate)
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ACPPowerOFF);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ACPPowerOFF, NULL);
 	else
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ACPPowerON);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ACPPowerON, NULL);
 }
 
 static void smu8_dpm_powergate_uvd(struct pp_hwmgr *hwmgr, bool bgate)
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu_helper.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu_helper.c
index d09690fca452..91b5d96db674 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu_helper.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu_helper.c
@@ -557,7 +557,9 @@ void phm_apply_dal_min_voltage_request(struct pp_hwmgr *hwmgr)
 		if (req_vddc <= vddc_table->entries[i].vddc) {
 			req_volt = (((uint32_t)vddc_table->entries[i].vddc) * VOLTAGE_SCALE);
 			smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_VddC_Request, req_volt);
+					PPSMC_MSG_VddC_Request,
+					req_volt,
+					NULL);
 			return;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_baco.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_baco.c
index b9ae62d9af5c..94a69d1b8010 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_baco.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_baco.c
@@ -107,7 +107,7 @@ int vega10_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state)
 	if (state == BACO_STATE_IN) {
 		if (soc15_baco_program_registers(hwmgr, pre_baco_tbl,
 					     ARRAY_SIZE(pre_baco_tbl))) {
-			if (smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnterBaco))
+			if (smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnterBaco, NULL))
 				return -EINVAL;
 
 			if (soc15_baco_program_registers(hwmgr, enter_baco_tbl,
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index f29f95be1e56..675c7cab7cfc 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -484,8 +484,9 @@ static void vega10_init_dpm_defaults(struct pp_hwmgr *hwmgr)
 	if (data->registry_data.vr0hot_enabled)
 		data->smu_features[GNLD_VR0HOT].supported = true;
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetSmuVersion);
-	hwmgr->smu_version = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr,
+			PPSMC_MSG_GetSmuVersion,
+			&hwmgr->smu_version);
 		/* ACG firmware has major version 5 */
 	if ((hwmgr->smu_version & 0xff000000) == 0x5000000)
 		data->smu_features[GNLD_ACG].supported = true;
@@ -503,10 +504,8 @@ static void vega10_init_dpm_defaults(struct pp_hwmgr *hwmgr)
 		data->smu_features[GNLD_PCC_LIMIT].supported = true;
 
 	/* Get the SN to turn into a Unique ID */
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumTop32);
-	top32 = smum_get_argument(hwmgr);
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumBottom32);
-	bottom32 = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumTop32, &top32);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumBottom32, &bottom32);
 
 	adev->unique_id = ((uint64_t)bottom32 << 32) | top32;
 }
@@ -993,7 +992,10 @@ static int vega10_setup_asic_task(struct pp_hwmgr *hwmgr)
 			"Failed to set up led dpm config!",
 			return -EINVAL);
 
-	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_NumOfDisplays, 0);
+	smum_send_msg_to_smc_with_parameter(hwmgr,
+				PPSMC_MSG_NumOfDisplays,
+				0,
+				NULL);
 
 	return 0;
 }
@@ -2303,16 +2305,15 @@ static int vega10_acg_enable(struct pp_hwmgr *hwmgr)
 					data->smu_features[GNLD_DPM_PREFETCHER].smu_feature_bitmap))
 			data->smu_features[GNLD_DPM_PREFETCHER].enabled = true;
 
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_InitializeAcg);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_InitializeAcg, NULL);
 
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAcgBtc);
-		agc_btc_response = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAcgBtc, &agc_btc_response);
 
 		if (1 == agc_btc_response) {
 			if (1 == data->acg_loop_state)
-				smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAcgInClosedLoop);
+				smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAcgInClosedLoop, NULL);
 			else if (2 == data->acg_loop_state)
-				smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAcgInOpenLoop);
+				smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAcgInOpenLoop, NULL);
 			if (0 == vega10_enable_smc_features(hwmgr, true,
 				data->smu_features[GNLD_ACG].smu_feature_bitmap))
 					data->smu_features[GNLD_ACG].enabled = true;
@@ -2429,11 +2430,9 @@ static int vega10_populate_and_upload_avfs_fuse_override(struct pp_hwmgr *hwmgr)
 	struct vega10_hwmgr *data = hwmgr->backend;
 	AvfsFuseOverride_t *avfs_fuse_table = &(data->smc_state_table.avfs_fuse_override_table);
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumTop32);
-	top32 = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumTop32, &top32);
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumBottom32);
-	bottom32 = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumBottom32, &bottom32);
 
 	serial_number = ((uint64_t)bottom32 << 32) | top32;
 
@@ -2610,14 +2609,16 @@ static int vega10_init_smc_table(struct pp_hwmgr *hwmgr)
 		if (0 != boot_up_values.usVddc) {
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetFloorSocVoltage,
-						(boot_up_values.usVddc * 4));
+						(boot_up_values.usVddc * 4),
+						NULL);
 			data->vbios_boot_state.bsoc_vddc_lock = true;
 		} else {
 			data->vbios_boot_state.bsoc_vddc_lock = false;
 		}
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetMinDeepSleepDcefclk,
-			(uint32_t)(data->vbios_boot_state.dcef_clock / 100));
+			(uint32_t)(data->vbios_boot_state.dcef_clock / 100),
+				NULL);
 	}
 
 	result = vega10_populate_avfs_parameters(hwmgr);
@@ -2904,7 +2905,8 @@ static int vega10_start_dpm(struct pp_hwmgr *hwmgr, uint32_t bitmap)
 
 	if (data->vbios_boot_state.bsoc_vddc_lock) {
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-						PPSMC_MSG_SetFloorSocVoltage, 0);
+						PPSMC_MSG_SetFloorSocVoltage, 0,
+						NULL);
 		data->vbios_boot_state.bsoc_vddc_lock = false;
 	}
 
@@ -2947,7 +2949,8 @@ static int vega10_enable_dpm_tasks(struct pp_hwmgr *hwmgr)
 		vega10_enable_disable_PCC_limit_feature(hwmgr, true);
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_ConfigureTelemetry, data->config_telemetry);
+			PPSMC_MSG_ConfigureTelemetry, data->config_telemetry,
+			NULL);
 
 		tmp_result = vega10_construct_voltage_tables(hwmgr);
 		PP_ASSERT_WITH_CODE(!tmp_result,
@@ -3528,7 +3531,8 @@ static int vega10_upload_dpm_bootup_level(struct pp_hwmgr *hwmgr)
 				data->dpm_table.gfx_table.dpm_state.soft_min_level) {
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSoftMinGfxclkByIndex,
-				data->smc_state_table.gfx_boot_level);
+				data->smc_state_table.gfx_boot_level,
+				NULL);
 
 			data->dpm_table.gfx_table.dpm_state.soft_min_level =
 					data->smc_state_table.gfx_boot_level;
@@ -3543,11 +3547,13 @@ static int vega10_upload_dpm_bootup_level(struct pp_hwmgr *hwmgr)
 				socclk_idx = vega10_get_soc_index_for_max_uclk(hwmgr);
 				smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMinSocclkByIndex,
-						socclk_idx);
+						socclk_idx,
+						NULL);
 			} else {
 				smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMinUclkByIndex,
-						data->smc_state_table.mem_boot_level);
+						data->smc_state_table.mem_boot_level,
+						NULL);
 			}
 			data->dpm_table.mem_table.dpm_state.soft_min_level =
 					data->smc_state_table.mem_boot_level;
@@ -3562,7 +3568,8 @@ static int vega10_upload_dpm_bootup_level(struct pp_hwmgr *hwmgr)
 				data->dpm_table.soc_table.dpm_state.soft_min_level) {
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSoftMinSocclkByIndex,
-				data->smc_state_table.soc_boot_level);
+				data->smc_state_table.soc_boot_level,
+				NULL);
 			data->dpm_table.soc_table.dpm_state.soft_min_level =
 					data->smc_state_table.soc_boot_level;
 		}
@@ -3582,7 +3589,8 @@ static int vega10_upload_dpm_max_level(struct pp_hwmgr *hwmgr)
 			data->dpm_table.gfx_table.dpm_state.soft_max_level) {
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSoftMaxGfxclkByIndex,
-				data->smc_state_table.gfx_max_level);
+				data->smc_state_table.gfx_max_level,
+				NULL);
 			data->dpm_table.gfx_table.dpm_state.soft_max_level =
 					data->smc_state_table.gfx_max_level;
 		}
@@ -3593,7 +3601,8 @@ static int vega10_upload_dpm_max_level(struct pp_hwmgr *hwmgr)
 			data->dpm_table.mem_table.dpm_state.soft_max_level) {
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetSoftMaxUclkByIndex,
-					data->smc_state_table.mem_max_level);
+					data->smc_state_table.mem_max_level,
+					NULL);
 			data->dpm_table.mem_table.dpm_state.soft_max_level =
 					data->smc_state_table.mem_max_level;
 		}
@@ -3607,7 +3616,8 @@ static int vega10_upload_dpm_max_level(struct pp_hwmgr *hwmgr)
 			data->dpm_table.soc_table.dpm_state.soft_max_level) {
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSoftMaxSocclkByIndex,
-				data->smc_state_table.soc_max_level);
+				data->smc_state_table.soc_max_level,
+				NULL);
 			data->dpm_table.soc_table.dpm_state.soft_max_level =
 					data->smc_state_table.soc_max_level;
 		}
@@ -3694,7 +3704,8 @@ static int vega10_update_sclk_threshold(struct pp_hwmgr *hwmgr)
 		/* This message will also enable SmcToHost Interrupt */
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetLowGfxclkInterruptThreshold,
-				(uint32_t)low_sclk_interrupt_threshold);
+				(uint32_t)low_sclk_interrupt_threshold,
+				NULL);
 	}
 
 	return 0;
@@ -3801,8 +3812,7 @@ static int vega10_get_gpu_power(struct pp_hwmgr *hwmgr,
 	if (!query)
 		return -EINVAL;
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrPkgPwr);
-	value = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrPkgPwr, &value);
 
 	/* SMC returning actual watts, keep consistent with legacy asics, low 8 bit as 8 fractional bits */
 	*query = value << 8;
@@ -3822,13 +3832,11 @@ static int vega10_read_sensor(struct pp_hwmgr *hwmgr, int idx,
 
 	switch (idx) {
 	case AMDGPU_PP_SENSOR_GFX_SCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetAverageGfxclkActualFrequency);
-		sclk_mhz = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetAverageGfxclkActualFrequency, &sclk_mhz);
 		*((uint32_t *)value) = sclk_mhz * 100;
 		break;
 	case AMDGPU_PP_SENSOR_GFX_MCLK:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentUclkIndex);
-		mclk_idx = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentUclkIndex, &mclk_idx);
 		if (mclk_idx < dpm_table->mem_table.count) {
 			*((uint32_t *)value) = dpm_table->mem_table.dpm_levels[mclk_idx].value;
 			*size = 4;
@@ -3837,8 +3845,8 @@ static int vega10_read_sensor(struct pp_hwmgr *hwmgr, int idx,
 		}
 		break;
 	case AMDGPU_PP_SENSOR_GPU_LOAD:
-		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetAverageGfxActivity, 0);
-		activity_percent = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetAverageGfxActivity, 0,
+						&activity_percent);
 		*((uint32_t *)value) = activity_percent > 100 ? 100 : activity_percent;
 		*size = 4;
 		break;
@@ -3847,14 +3855,14 @@ static int vega10_read_sensor(struct pp_hwmgr *hwmgr, int idx,
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetTemperatureHotspot);
-		*((uint32_t *)value) = smum_get_argument(hwmgr) *
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetTemperatureHotspot, (uint32_t *)value);
+		*((uint32_t *)value) = *((uint32_t *)value) *
 			PP_TEMPERATURE_UNITS_PER_CENTIGRADES;
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_MEM_TEMP:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetTemperatureHBM);
-		*((uint32_t *)value) = smum_get_argument(hwmgr) *
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetTemperatureHBM, (uint32_t *)value);
+		*((uint32_t *)value) = *((uint32_t *)value) *
 			PP_TEMPERATURE_UNITS_PER_CENTIGRADES;
 		*size = 4;
 		break;
@@ -3893,7 +3901,8 @@ static void vega10_notify_smc_display_change(struct pp_hwmgr *hwmgr,
 {
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetUclkFastSwitch,
-			has_disp ? 1 : 0);
+			has_disp ? 1 : 0,
+			NULL);
 }
 
 int vega10_display_clock_voltage_request(struct pp_hwmgr *hwmgr,
@@ -3928,7 +3937,8 @@ int vega10_display_clock_voltage_request(struct pp_hwmgr *hwmgr,
 		clk_request = (clk_freq << 16) | clk_select;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_RequestDisplayClockByFreq,
-				clk_request);
+				clk_request,
+				NULL);
 	}
 
 	return result;
@@ -3990,7 +4000,8 @@ static int vega10_notify_smc_display_config_after_ps_adjustment(
 		if (!vega10_display_clock_voltage_request(hwmgr, &clock_req)) {
 			smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetMinDeepSleepDcefclk,
-					min_clocks.dcefClockInSR / 100);
+					min_clocks.dcefClockInSR / 100,
+					NULL);
 		} else {
 			pr_info("Attempt to set Hard Min for DCEFCLK Failed!");
 		}
@@ -4000,7 +4011,8 @@ static int vega10_notify_smc_display_config_after_ps_adjustment(
 
 	if (min_clocks.memoryClock != 0) {
 		idx = vega10_get_uclk_index(hwmgr, mclk_table, min_clocks.memoryClock);
-		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetSoftMinUclkByIndex, idx);
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetSoftMinUclkByIndex, idx,
+						NULL);
 		data->dpm_table.mem_table.dpm_state.soft_min_level= idx;
 	}
 
@@ -4541,8 +4553,7 @@ static int vega10_print_clock_levels(struct pp_hwmgr *hwmgr,
 		if (data->registry_data.sclk_dpm_key_disabled)
 			break;
 
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentGfxclkIndex);
-		now = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentGfxclkIndex, &now);
 
 		if (hwmgr->pp_one_vf &&
 		    (hwmgr->dpm_level == AMD_DPM_FORCED_LEVEL_PROFILE_PEAK))
@@ -4558,8 +4569,7 @@ static int vega10_print_clock_levels(struct pp_hwmgr *hwmgr,
 		if (data->registry_data.mclk_dpm_key_disabled)
 			break;
 
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentUclkIndex);
-		now = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentUclkIndex, &now);
 
 		for (i = 0; i < mclk_table->count; i++)
 			size += sprintf(buf + size, "%d: %uMhz %s\n",
@@ -4570,8 +4580,7 @@ static int vega10_print_clock_levels(struct pp_hwmgr *hwmgr,
 		if (data->registry_data.socclk_dpm_key_disabled)
 			break;
 
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentSocclkIndex);
-		now = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentSocclkIndex, &now);
 
 		for (i = 0; i < soc_table->count; i++)
 			size += sprintf(buf + size, "%d: %uMhz %s\n",
@@ -4583,8 +4592,7 @@ static int vega10_print_clock_levels(struct pp_hwmgr *hwmgr,
 			break;
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_GetClockFreqMHz, CLK_DCEFCLK);
-		now = smum_get_argument(hwmgr);
+				PPSMC_MSG_GetClockFreqMHz, CLK_DCEFCLK, &now);
 
 		for (i = 0; i < dcef_table->count; i++)
 			size += sprintf(buf + size, "%d: %uMhz %s\n",
@@ -4593,8 +4601,7 @@ static int vega10_print_clock_levels(struct pp_hwmgr *hwmgr,
 					"*" : "");
 		break;
 	case PP_PCIE:
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentLinkIndex);
-		now = smum_get_argument(hwmgr);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentLinkIndex, &now);
 
 		for (i = 0; i < pcie_table->count; i++)
 			size += sprintf(buf + size, "%d: %s %s\n", i,
@@ -4658,7 +4665,8 @@ static int vega10_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
 
 	if (data->water_marks_bitmap & WaterMarksLoaded) {
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_NumOfDisplays, hwmgr->display_config->num_display);
+			PPSMC_MSG_NumOfDisplays, hwmgr->display_config->num_display,
+			NULL);
 	}
 
 	return result;
@@ -4924,21 +4932,26 @@ static int vega10_notify_cac_buffer_info(struct pp_hwmgr *hwmgr,
 {
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetSystemVirtualDramAddrHigh,
-					virtual_addr_hi);
+					virtual_addr_hi,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetSystemVirtualDramAddrLow,
-					virtual_addr_low);
+					virtual_addr_low,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramLogSetDramAddrHigh,
-					mc_addr_hi);
+					mc_addr_hi,
+					NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramLogSetDramAddrLow,
-					mc_addr_low);
+					mc_addr_low,
+					NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramLogSetDramSize,
-					size);
+					size,
+					NULL);
 	return 0;
 }
 
@@ -5040,12 +5053,14 @@ static int vega10_set_power_profile_mode(struct pp_hwmgr *hwmgr, long *input, ui
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetCustomGfxDpmParameters,
 					busy_set_point | FPS<<8 |
-					use_rlc_busy << 16 | min_active_level<<24);
+					use_rlc_busy << 16 | min_active_level<<24,
+					NULL);
 	}
 
 out:
 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetWorkloadMask,
-						1 << power_profile_mode);
+						1 << power_profile_mode,
+						NULL);
 	hwmgr->power_profile_mode = power_profile_mode;
 
 	return 0;
@@ -5302,7 +5317,7 @@ static int vega10_set_mp1_state(struct pp_hwmgr *hwmgr,
 		return 0;
 	}
 
-	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr, msg)) == 0,
+	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr, msg, NULL)) == 0,
 			    "[PrepareMp1] Failed!",
 			    return ret);
 
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
index 0a677d4bc87b..ca9b23b5abc9 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
@@ -925,7 +925,8 @@ static void vega10_didt_set_mask(struct pp_hwmgr *hwmgr, const bool enable)
 
 	/* For Vega10, SMC does not support any mask yet. */
 	if (enable)
-		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_ConfigureGfxDidt, didt_block_info);
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_ConfigureGfxDidt, didt_block_info,
+						NULL);
 
 }
 
@@ -1327,7 +1328,8 @@ int vega10_set_power_limit(struct pp_hwmgr *hwmgr, uint32_t n)
 
 	if (data->registry_data.enable_pkg_pwr_tracking_feature)
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_SetPptLimit, n);
+				PPSMC_MSG_SetPptLimit, n,
+				NULL);
 
 	return 0;
 }
@@ -1393,7 +1395,8 @@ static void vega10_set_overdrive_target_percentage(struct pp_hwmgr *hwmgr,
 		uint32_t adjust_percent)
 {
 	smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_OverDriveSetPercentage, adjust_percent);
+			PPSMC_MSG_OverDriveSetPercentage, adjust_percent,
+			NULL);
 }
 
 int vega10_power_control_set_level(struct pp_hwmgr *hwmgr)
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_thermal.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_thermal.c
index ba8763daa380..7783c7fd7ccb 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_thermal.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_thermal.c
@@ -31,8 +31,7 @@
 
 static int vega10_get_current_rpm(struct pp_hwmgr *hwmgr, uint32_t *current_rpm)
 {
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentRpm);
-	*current_rpm = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentRpm, current_rpm);
 	return 0;
 }
 
@@ -520,7 +519,8 @@ int vega10_thermal_setup_fan_table(struct pp_hwmgr *hwmgr)
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetFanTemperatureTarget,
-				(uint32_t)table->FanTargetTemperature);
+				(uint32_t)table->FanTargetTemperature,
+				NULL);
 
 	table->FanPwmMin = hwmgr->thermal_controller.
 			advanceFanControlParameters.usPWMMin * 255 / 100;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_baco.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_baco.c
index 9d8ca94a8f0c..bc53cce4f32d 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_baco.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_baco.c
@@ -96,7 +96,7 @@ int vega12_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state)
 	if (state == BACO_STATE_IN) {
 		if (soc15_baco_program_registers(hwmgr, pre_baco_tbl,
 					     ARRAY_SIZE(pre_baco_tbl))) {
-			if (smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_EnterBaco, 0))
+			if (smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_EnterBaco, 0, NULL))
 				return -EINVAL;
 
 			if (soc15_baco_program_registers(hwmgr, enter_baco_tbl,
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
index aca61d1ff3c2..f4d1692cccf3 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
@@ -357,10 +357,8 @@ static void vega12_init_dpm_defaults(struct pp_hwmgr *hwmgr)
 	}
 
 	/* Get the SN to turn into a Unique ID */
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumTop32);
-	top32 = smum_get_argument(hwmgr);
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumBottom32);
-	bottom32 = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumTop32, &top32);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumBottom32, &bottom32);
 
 	adev->unique_id = ((uint64_t)bottom32 << 32) | top32;
 }
@@ -483,16 +481,12 @@ static int vega12_get_number_of_dpm_level(struct pp_hwmgr *hwmgr,
 
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_GetDpmFreqByIndex,
-			(clk_id << 16 | 0xFF));
+			(clk_id << 16 | 0xFF),
+			num_of_levels);
 	PP_ASSERT_WITH_CODE(!ret,
 			"[GetNumOfDpmLevel] failed to get dpm levels!",
 			return ret);
 
-	*num_of_levels = smum_get_argument(hwmgr);
-	PP_ASSERT_WITH_CODE(*num_of_levels > 0,
-			"[GetNumOfDpmLevel] number of clk levels is invalid!",
-			return -EINVAL);
-
 	return ret;
 }
 
@@ -504,12 +498,11 @@ static int vega12_get_dpm_frequency_by_index(struct pp_hwmgr *hwmgr,
 	 *Lower 16 bits specify the level
 	 */
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
-		PPSMC_MSG_GetDpmFreqByIndex, (clkID << 16 | index)) == 0,
+		PPSMC_MSG_GetDpmFreqByIndex, (clkID << 16 | index),
+		clock) == 0,
 		"[GetDpmFrequencyByIndex] Failed to get dpm frequency from SMU!",
 		return -EINVAL);
 
-	*clock = smum_get_argument(hwmgr);
-
 	return 0;
 }
 
@@ -749,7 +742,8 @@ static int vega12_init_smc_table(struct pp_hwmgr *hwmgr)
 		data->vbios_boot_state.vclock = boot_up_values.ulVClk;
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetMinDeepSleepDcefclk,
-			(uint32_t)(data->vbios_boot_state.dcef_clock / 100));
+			(uint32_t)(data->vbios_boot_state.dcef_clock / 100),
+				NULL);
 	}
 
 	memcpy(pp_table, pptable_information->smc_pptable, sizeof(PPTable_t));
@@ -767,11 +761,10 @@ static int vega12_run_acg_btc(struct pp_hwmgr *hwmgr)
 	uint32_t result;
 
 	PP_ASSERT_WITH_CODE(
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAcgBtc) == 0,
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAcgBtc, &result) == 0,
 		"[Run_ACG_BTC] Attempt to run ACG BTC failed!",
 		return -EINVAL);
 
-	result = smum_get_argument(hwmgr);
 	PP_ASSERT_WITH_CODE(result == 1,
 			"Failed to run ACG BTC!", return -EINVAL);
 
@@ -792,12 +785,14 @@ static int vega12_set_allowed_featuresmask(struct pp_hwmgr *hwmgr)
 				(allowed_features_low |= ((data->smu_features[i].smu_feature_bitmap >> SMU_FEATURES_LOW_SHIFT) & 0xFFFFFFFF));
 
 	PP_ASSERT_WITH_CODE(
-		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetAllowedFeaturesMaskHigh, allowed_features_high) == 0,
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetAllowedFeaturesMaskHigh, allowed_features_high,
+			NULL) == 0,
 		"[SetAllowedFeaturesMask] Attempt to set allowed features mask (high) failed!",
 		return -1);
 
 	PP_ASSERT_WITH_CODE(
-		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetAllowedFeaturesMaskLow, allowed_features_low) == 0,
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetAllowedFeaturesMaskLow, allowed_features_low,
+			NULL) == 0,
 		"[SetAllowedFeaturesMask] Attempt to set allowed features mask (low) failed!",
 		return -1);
 
@@ -828,7 +823,7 @@ static int vega12_enable_all_smu_features(struct pp_hwmgr *hwmgr)
 	bool enabled;
 
 	PP_ASSERT_WITH_CODE(
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableAllSmuFeatures) == 0,
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableAllSmuFeatures, NULL) == 0,
 		"[EnableAllSMUFeatures] Failed to enable all smu features!",
 		return -1);
 
@@ -854,7 +849,7 @@ static int vega12_disable_all_smu_features(struct pp_hwmgr *hwmgr)
 	bool enabled;
 
 	PP_ASSERT_WITH_CODE(
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisableAllSmuFeatures) == 0,
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisableAllSmuFeatures, NULL) == 0,
 		"[DisableAllSMUFeatures] Failed to disable all smu features!",
 		return -1);
 
@@ -879,7 +874,8 @@ static int vega12_set_overdrive_target_percentage(struct pp_hwmgr *hwmgr,
 		uint32_t adjust_percent)
 {
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_OverDriveSetPercentage, adjust_percent);
+			PPSMC_MSG_OverDriveSetPercentage, adjust_percent,
+			NULL);
 }
 
 static int vega12_power_control_set_level(struct pp_hwmgr *hwmgr)
@@ -902,24 +898,24 @@ static int vega12_get_all_clock_ranges_helper(struct pp_hwmgr *hwmgr,
 {
 	/* AC Max */
 	PP_ASSERT_WITH_CODE(
-		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetMaxDpmFreq, (clkid << 16)) == 0,
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetMaxDpmFreq, (clkid << 16),
+			&(clock->ACMax)) == 0,
 		"[GetClockRanges] Failed to get max ac clock from SMC!",
 		return -EINVAL);
-	clock->ACMax = smum_get_argument(hwmgr);
 
 	/* AC Min */
 	PP_ASSERT_WITH_CODE(
-		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetMinDpmFreq, (clkid << 16)) == 0,
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetMinDpmFreq, (clkid << 16),
+			&(clock->ACMin)) == 0,
 		"[GetClockRanges] Failed to get min ac clock from SMC!",
 		return -EINVAL);
-	clock->ACMin = smum_get_argument(hwmgr);
 
 	/* DC Max */
 	PP_ASSERT_WITH_CODE(
-		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetDcModeMaxDpmFreq, (clkid << 16)) == 0,
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetDcModeMaxDpmFreq, (clkid << 16),
+			&(clock->DCMax)) == 0,
 		"[GetClockRanges] Failed to get max dc clock from SMC!",
 		return -EINVAL);
-	clock->DCMax = smum_get_argument(hwmgr);
 
 	return 0;
 }
@@ -944,7 +940,7 @@ static int vega12_enable_dpm_tasks(struct pp_hwmgr *hwmgr)
 	int tmp_result, result = 0;
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_NumOfDisplays, 0);
+			PPSMC_MSG_NumOfDisplays, 0, NULL);
 
 	result = vega12_set_allowed_featuresmask(hwmgr);
 	PP_ASSERT_WITH_CODE(result == 0,
@@ -1043,7 +1039,8 @@ static int vega12_upload_dpm_min_level(struct pp_hwmgr *hwmgr)
 		min_freq = data->dpm_table.gfx_table.dpm_state.soft_min_level;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_GFXCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_GFXCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min gfxclk !",
 					return ret);
 	}
@@ -1052,14 +1049,16 @@ static int vega12_upload_dpm_min_level(struct pp_hwmgr *hwmgr)
 		min_freq = data->dpm_table.mem_table.dpm_state.soft_min_level;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_UCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_UCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min memclk !",
 					return ret);
 
 		min_freq = data->dpm_table.mem_table.dpm_state.hard_min_level;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetHardMinByFreq,
-					(PPCLK_UCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_UCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set hard min memclk !",
 					return ret);
 	}
@@ -1069,7 +1068,8 @@ static int vega12_upload_dpm_min_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_VCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_VCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min vclk!",
 					return ret);
 
@@ -1077,7 +1077,8 @@ static int vega12_upload_dpm_min_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_DCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_DCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min dclk!",
 					return ret);
 	}
@@ -1087,7 +1088,8 @@ static int vega12_upload_dpm_min_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_ECLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_ECLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min eclk!",
 					return ret);
 	}
@@ -1097,7 +1099,8 @@ static int vega12_upload_dpm_min_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_SOCCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_SOCCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min socclk!",
 					return ret);
 	}
@@ -1107,7 +1110,8 @@ static int vega12_upload_dpm_min_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetHardMinByFreq,
-					(PPCLK_DCEFCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_DCEFCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set hard min dcefclk!",
 					return ret);
 	}
@@ -1127,7 +1131,8 @@ static int vega12_upload_dpm_max_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_GFXCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_GFXCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max gfxclk!",
 					return ret);
 	}
@@ -1137,7 +1142,8 @@ static int vega12_upload_dpm_max_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_UCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_UCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max memclk!",
 					return ret);
 	}
@@ -1147,14 +1153,16 @@ static int vega12_upload_dpm_max_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_VCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_VCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max vclk!",
 					return ret);
 
 		max_freq = data->dpm_table.dclk_table.dpm_state.soft_max_level;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_DCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_DCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max dclk!",
 					return ret);
 	}
@@ -1164,7 +1172,8 @@ static int vega12_upload_dpm_max_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_ECLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_ECLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max eclk!",
 					return ret);
 	}
@@ -1174,7 +1183,8 @@ static int vega12_upload_dpm_max_level(struct pp_hwmgr *hwmgr)
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_SOCCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_SOCCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max socclk!",
 					return ret);
 	}
@@ -1287,10 +1297,10 @@ static int vega12_get_current_gfx_clk_freq(struct pp_hwmgr *hwmgr, uint32_t *gfx
 	*gfx_freq = 0;
 
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_GetDpmClockFreq, (PPCLK_GFXCLK << 16)) == 0,
+			PPSMC_MSG_GetDpmClockFreq, (PPCLK_GFXCLK << 16),
+			&gfx_clk) == 0,
 			"[GetCurrentGfxClkFreq] Attempt to get Current GFXCLK Frequency Failed!",
 			return -EINVAL);
-	gfx_clk = smum_get_argument(hwmgr);
 
 	*gfx_freq = gfx_clk * 100;
 
@@ -1304,10 +1314,10 @@ static int vega12_get_current_mclk_freq(struct pp_hwmgr *hwmgr, uint32_t *mclk_f
 	*mclk_freq = 0;
 
 	PP_ASSERT_WITH_CODE(
-			smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetDpmClockFreq, (PPCLK_UCLK << 16)) == 0,
+			smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetDpmClockFreq, (PPCLK_UCLK << 16),
+				&mem_clk) == 0,
 			"[GetCurrentMClkFreq] Attempt to get Current MCLK Frequency Failed!",
 			return -EINVAL);
-	mem_clk = smum_get_argument(hwmgr);
 
 	*mclk_freq = mem_clk * 100;
 
@@ -1420,7 +1430,8 @@ static int vega12_notify_smc_display_change(struct pp_hwmgr *hwmgr,
 	if (data->smu_features[GNLD_DPM_UCLK].enabled)
 		return smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetUclkFastSwitch,
-			has_disp ? 1 : 0);
+			has_disp ? 1 : 0,
+			NULL);
 
 	return 0;
 }
@@ -1459,7 +1470,8 @@ int vega12_display_clock_voltage_request(struct pp_hwmgr *hwmgr,
 			clk_request = (clk_select << 16) | clk_freq;
 			result = smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetHardMinByFreq,
-					clk_request);
+					clk_request,
+					NULL);
 		}
 	}
 
@@ -1493,7 +1505,8 @@ static int vega12_notify_smc_display_config_after_ps_adjustment(
 				PP_ASSERT_WITH_CODE(
 					!smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetMinDeepSleepDcefclk,
-					min_clocks.dcefClockInSR /100),
+					min_clocks.dcefClockInSR /100,
+					NULL),
 					"Attempt to set divider for DCEFCLK Failed!",
 					return -1);
 		} else {
@@ -2124,10 +2137,10 @@ static int vega12_print_clock_levels(struct pp_hwmgr *hwmgr,
 	case PP_SOCCLK:
 		PP_ASSERT_WITH_CODE(
 				smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_GetDpmClockFreq, (PPCLK_SOCCLK << 16)) == 0,
+					PPSMC_MSG_GetDpmClockFreq, (PPCLK_SOCCLK << 16),
+					&now) == 0,
 				"Attempt to get Current SOCCLK Frequency Failed!",
 				return -EINVAL);
-		now = smum_get_argument(hwmgr);
 
 		PP_ASSERT_WITH_CODE(
 				vega12_get_socclocks(hwmgr, &clocks) == 0,
@@ -2142,10 +2155,10 @@ static int vega12_print_clock_levels(struct pp_hwmgr *hwmgr,
 	case PP_DCEFCLK:
 		PP_ASSERT_WITH_CODE(
 				smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_GetDpmClockFreq, (PPCLK_DCEFCLK << 16)) == 0,
+					PPSMC_MSG_GetDpmClockFreq, (PPCLK_DCEFCLK << 16),
+					&now) == 0,
 				"Attempt to get Current DCEFCLK Frequency Failed!",
 				return -EINVAL);
-		now = smum_get_argument(hwmgr);
 
 		PP_ASSERT_WITH_CODE(
 				vega12_get_dcefclocks(hwmgr, &clocks) == 0,
@@ -2343,7 +2356,8 @@ static int vega12_set_uclk_to_highest_dpm_level(struct pp_hwmgr *hwmgr,
 		dpm_table->dpm_state.hard_min_level = dpm_table->dpm_levels[dpm_table->count - 1].value;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetHardMinByFreq,
-				(PPCLK_UCLK << 16 ) | dpm_table->dpm_state.hard_min_level)),
+				(PPCLK_UCLK << 16 ) | dpm_table->dpm_state.hard_min_level,
+				NULL)),
 				"[SetUclkToHightestDpmLevel] Set hard min uclk failed!",
 				return ret);
 	}
@@ -2357,7 +2371,8 @@ static int vega12_pre_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
 	int ret = 0;
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_NumOfDisplays, 0);
+			PPSMC_MSG_NumOfDisplays, 0,
+			NULL);
 
 	ret = vega12_set_uclk_to_highest_dpm_level(hwmgr,
 			&data->dpm_table.mem_table);
@@ -2383,7 +2398,8 @@ static int vega12_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
 		data->smu_features[GNLD_DPM_DCEFCLK].supported &&
 		data->smu_features[GNLD_DPM_SOCCLK].supported)
 		smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_NumOfDisplays, hwmgr->display_config->num_display);
+			PPSMC_MSG_NumOfDisplays, hwmgr->display_config->num_display,
+			NULL);
 
 	return result;
 }
@@ -2555,21 +2571,26 @@ static int vega12_notify_cac_buffer_info(struct pp_hwmgr *hwmgr,
 {
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetSystemVirtualDramAddrHigh,
-					virtual_addr_hi);
+					virtual_addr_hi,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetSystemVirtualDramAddrLow,
-					virtual_addr_low);
+					virtual_addr_low,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramLogSetDramAddrHigh,
-					mc_addr_hi);
+					mc_addr_hi,
+					NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramLogSetDramAddrLow,
-					mc_addr_low);
+					mc_addr_low,
+					NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramLogSetDramSize,
-					size);
+					size,
+					NULL);
 	return 0;
 }
 
@@ -2605,7 +2626,7 @@ static int vega12_enable_gfx_off(struct pp_hwmgr *hwmgr)
 	int ret = 0;
 
 	if (data->gfxoff_controlled_by_driver)
-		ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_AllowGfxOff);
+		ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_AllowGfxOff, NULL);
 
 	return ret;
 }
@@ -2617,7 +2638,7 @@ static int vega12_disable_gfx_off(struct pp_hwmgr *hwmgr)
 	int ret = 0;
 
 	if (data->gfxoff_controlled_by_driver)
-		ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisallowGfxOff);
+		ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DisallowGfxOff, NULL);
 
 	return ret;
 }
@@ -2654,7 +2675,7 @@ static int vega12_set_mp1_state(struct pp_hwmgr *hwmgr,
 		return 0;
 	}
 
-	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr, msg)) == 0,
+	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr, msg, NULL)) == 0,
 			    "[PrepareMp1] Failed!",
 			    return ret);
 
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_thermal.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_thermal.c
index 904eb2c9155b..c85806a6f62e 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_thermal.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_thermal.c
@@ -32,10 +32,10 @@
 static int vega12_get_current_rpm(struct pp_hwmgr *hwmgr, uint32_t *current_rpm)
 {
 	PP_ASSERT_WITH_CODE(!smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_GetCurrentRpm),
+				PPSMC_MSG_GetCurrentRpm,
+				current_rpm),
 			"Attempt to get current RPM from SMC Failed!",
 			return -EINVAL);
-	*current_rpm = smum_get_argument(hwmgr);
 
 	return 0;
 }
@@ -259,7 +259,8 @@ int vega12_thermal_setup_fan_table(struct pp_hwmgr *hwmgr)
 
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetFanTemperatureTarget,
-				(uint32_t)table->FanTargetTemperature);
+				(uint32_t)table->FanTargetTemperature,
+				NULL);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_baco.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_baco.c
index a5f7d6c0315d..5230bfb0800d 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_baco.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_baco.c
@@ -91,16 +91,16 @@ int vega20_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state)
 			WREG32_SOC15(THM, 0, mmTHM_BACO_CNTL, data);
 
 			if(smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_EnterBaco, 0))
+					PPSMC_MSG_EnterBaco, 0, NULL))
 				return -EINVAL;
 		} else {
 			if(smum_send_msg_to_smc_with_parameter(hwmgr,
-					PPSMC_MSG_EnterBaco, 1))
+					PPSMC_MSG_EnterBaco, 1, NULL))
 				return -EINVAL;
 		}
 
 	} else if (state == BACO_STATE_OUT) {
-		if (smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ExitBaco))
+		if (smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ExitBaco, NULL))
 			return -EINVAL;
 		if (!soc15_baco_program_registers(hwmgr, clean_baco_tbl,
 						     ARRAY_SIZE(clean_baco_tbl)))
@@ -120,12 +120,12 @@ int vega20_baco_apply_vdci_flush_workaround(struct pp_hwmgr *hwmgr)
 	if (ret)
 		return ret;
 
-	ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_BacoWorkAroundFlushVDCI);
+	ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_BacoWorkAroundFlushVDCI, NULL);
 	if (ret)
 		return ret;
 
 	if (ras && ras->supported)
-		ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PrepareMp1ForUnload);
+		ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_PrepareMp1ForUnload, NULL);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
index f7de3e965493..b261d8f72c01 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
@@ -92,8 +92,7 @@ static void vega20_set_default_registry_data(struct pp_hwmgr *hwmgr)
 	 */
 	data->registry_data.disallowed_features = 0xE0041C00;
 	/* ECC feature should be disabled on old SMUs */
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetSmuVersion);
-	hwmgr->smu_version = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetSmuVersion, &hwmgr->smu_version);
 	if (hwmgr->smu_version < 0x282100)
 		data->registry_data.disallowed_features |= FEATURE_ECC_MASK;
 
@@ -400,10 +399,8 @@ static void vega20_init_dpm_defaults(struct pp_hwmgr *hwmgr)
 	}
 
 	/* Get the SN to turn into a Unique ID */
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumTop32);
-	top32 = smum_get_argument(hwmgr);
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumBottom32);
-	bottom32 = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumTop32, &top32);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ReadSerialNumBottom32, &bottom32);
 
 	adev->unique_id = ((uint64_t)bottom32 << 32) | top32;
 }
@@ -517,16 +514,12 @@ static int vega20_get_number_of_dpm_level(struct pp_hwmgr *hwmgr,
 
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_GetDpmFreqByIndex,
-			(clk_id << 16 | 0xFF));
+			(clk_id << 16 | 0xFF),
+			num_of_levels);
 	PP_ASSERT_WITH_CODE(!ret,
 			"[GetNumOfDpmLevel] failed to get dpm levels!",
 			return ret);
 
-	*num_of_levels = smum_get_argument(hwmgr);
-	PP_ASSERT_WITH_CODE(*num_of_levels > 0,
-			"[GetNumOfDpmLevel] number of clk levels is invalid!",
-			return -EINVAL);
-
 	return ret;
 }
 
@@ -537,16 +530,12 @@ static int vega20_get_dpm_frequency_by_index(struct pp_hwmgr *hwmgr,
 
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_GetDpmFreqByIndex,
-			(clk_id << 16 | index));
+			(clk_id << 16 | index),
+			clk);
 	PP_ASSERT_WITH_CODE(!ret,
 			"[GetDpmFreqByIndex] failed to get dpm freq by index!",
 			return ret);
 
-	*clk = smum_get_argument(hwmgr);
-	PP_ASSERT_WITH_CODE(*clk,
-			"[GetDpmFreqByIndex] clk value is invalid!",
-			return -EINVAL);
-
 	return ret;
 }
 
@@ -803,7 +792,8 @@ static int vega20_init_smc_table(struct pp_hwmgr *hwmgr)
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetMinDeepSleepDcefclk,
-		(uint32_t)(data->vbios_boot_state.dcef_clock / 100));
+		(uint32_t)(data->vbios_boot_state.dcef_clock / 100),
+			NULL);
 
 	memcpy(pp_table, pptable_information->smc_pptable, sizeof(PPTable_t));
 
@@ -858,7 +848,8 @@ static int vega20_override_pcie_parameters(struct pp_hwmgr *hwmgr)
 	 */
 	smu_pcie_arg = (1 << 16) | (pcie_gen << 8) | pcie_width;
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_OverridePcieParameters, smu_pcie_arg);
+			PPSMC_MSG_OverridePcieParameters, smu_pcie_arg,
+			NULL);
 	PP_ASSERT_WITH_CODE(!ret,
 		"[OverridePcieParameters] Attempt to override pcie params failed!",
 		return ret);
@@ -889,13 +880,13 @@ static int vega20_set_allowed_featuresmask(struct pp_hwmgr *hwmgr)
 				  & 0xFFFFFFFF));
 
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-		PPSMC_MSG_SetAllowedFeaturesMaskHigh, allowed_features_high);
+		PPSMC_MSG_SetAllowedFeaturesMaskHigh, allowed_features_high, NULL);
 	PP_ASSERT_WITH_CODE(!ret,
 		"[SetAllowedFeaturesMask] Attempt to set allowed features mask(high) failed!",
 		return ret);
 
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-		PPSMC_MSG_SetAllowedFeaturesMaskLow, allowed_features_low);
+		PPSMC_MSG_SetAllowedFeaturesMaskLow, allowed_features_low, NULL);
 	PP_ASSERT_WITH_CODE(!ret,
 		"[SetAllowedFeaturesMask] Attempt to set allowed features mask (low) failed!",
 		return ret);
@@ -905,12 +896,12 @@ static int vega20_set_allowed_featuresmask(struct pp_hwmgr *hwmgr)
 
 static int vega20_run_btc(struct pp_hwmgr *hwmgr)
 {
-	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunBtc);
+	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunBtc, NULL);
 }
 
 static int vega20_run_btc_afll(struct pp_hwmgr *hwmgr)
 {
-	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAfllBtc);
+	return smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunAfllBtc, NULL);
 }
 
 static int vega20_enable_all_smu_features(struct pp_hwmgr *hwmgr)
@@ -923,7 +914,8 @@ static int vega20_enable_all_smu_features(struct pp_hwmgr *hwmgr)
 	int ret = 0;
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr,
-			PPSMC_MSG_EnableAllSmuFeatures)) == 0,
+			PPSMC_MSG_EnableAllSmuFeatures,
+			NULL)) == 0,
 			"[EnableAllSMUFeatures] Failed to enable all smu features!",
 			return ret);
 
@@ -956,7 +948,8 @@ static int vega20_notify_smc_display_change(struct pp_hwmgr *hwmgr)
 	if (data->smu_features[GNLD_DPM_UCLK].enabled)
 		return smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetUclkFastSwitch,
-			1);
+			1,
+			NULL);
 
 	return 0;
 }
@@ -968,7 +961,8 @@ static int vega20_send_clock_ratio(struct pp_hwmgr *hwmgr)
 
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetFclkGfxClkRatio,
-			data->registry_data.fclk_gfxclk_ratio);
+			data->registry_data.fclk_gfxclk_ratio,
+			NULL);
 }
 
 static int vega20_disable_all_smu_features(struct pp_hwmgr *hwmgr)
@@ -981,7 +975,8 @@ static int vega20_disable_all_smu_features(struct pp_hwmgr *hwmgr)
 	int ret = 0;
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr,
-			PPSMC_MSG_DisableAllSmuFeatures)) == 0,
+			PPSMC_MSG_DisableAllSmuFeatures,
+			NULL)) == 0,
 			"[DisableAllSMUFeatures] Failed to disable all smu features!",
 			return ret);
 
@@ -1189,12 +1184,12 @@ static int vega20_od8_get_gfx_clock_base_voltage(
 
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_GetAVFSVoltageByDpm,
-			((AVFS_CURVE << 24) | (OD8_HOTCURVE_TEMPERATURE << 16) | freq));
+			((AVFS_CURVE << 24) | (OD8_HOTCURVE_TEMPERATURE << 16) | freq),
+			voltage);
 	PP_ASSERT_WITH_CODE(!ret,
 			"[GetBaseVoltage] failed to get GFXCLK AVFS voltage from SMU!",
 			return ret);
 
-	*voltage = smum_get_argument(hwmgr);
 	*voltage = *voltage / VOLTAGE_SCALE;
 
 	return 0;
@@ -1550,19 +1545,19 @@ static int vega20_get_max_sustainable_clock(struct pp_hwmgr *hwmgr,
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_GetDcModeMaxDpmFreq,
-			(clock_select << 16))) == 0,
+			(clock_select << 16),
+			clock)) == 0,
 			"[GetMaxSustainableClock] Failed to get max DC clock from SMC!",
 			return ret);
-	*clock = smum_get_argument(hwmgr);
 
 	/* if DC limit is zero, return AC limit */
 	if (*clock == 0) {
 		PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_GetMaxDpmFreq,
-			(clock_select << 16))) == 0,
+			(clock_select << 16),
+			clock)) == 0,
 			"[GetMaxSustainableClock] failed to get max AC clock from SMC!",
 			return ret);
-		*clock = smum_get_argument(hwmgr);
 	}
 
 	return 0;
@@ -1631,7 +1626,8 @@ static int vega20_enable_mgpu_fan_boost(struct pp_hwmgr *hwmgr)
 	int result;
 
 	result = smum_send_msg_to_smc(hwmgr,
-		PPSMC_MSG_SetMGpuFanBoostLimitRpm);
+		PPSMC_MSG_SetMGpuFanBoostLimitRpm,
+		NULL);
 	PP_ASSERT_WITH_CODE(!result,
 			"[EnableMgpuFan] Failed to enable mgpu fan boost!",
 			return result);
@@ -1659,7 +1655,7 @@ static int vega20_enable_dpm_tasks(struct pp_hwmgr *hwmgr)
 	int result = 0;
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_NumOfDisplays, 0);
+			PPSMC_MSG_NumOfDisplays, 0, NULL);
 
 	result = vega20_set_allowed_featuresmask(hwmgr);
 	PP_ASSERT_WITH_CODE(!result,
@@ -1730,12 +1726,12 @@ static int vega20_enable_dpm_tasks(struct pp_hwmgr *hwmgr)
 			return result);
 
 	result = smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetPptLimit,
-			POWER_SOURCE_AC << 16);
+			POWER_SOURCE_AC << 16, &hwmgr->default_power_limit);
 	PP_ASSERT_WITH_CODE(!result,
 			"[GetPptLimit] get default PPT limit failed!",
 			return result);
 	hwmgr->power_limit =
-		hwmgr->default_power_limit = smum_get_argument(hwmgr);
+		hwmgr->default_power_limit;
 
 	return 0;
 }
@@ -1796,7 +1792,8 @@ static int vega20_upload_dpm_min_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 		min_freq = data->dpm_table.gfx_table.dpm_state.soft_min_level;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_GFXCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_GFXCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min gfxclk !",
 					return ret);
 	}
@@ -1806,7 +1803,8 @@ static int vega20_upload_dpm_min_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 		min_freq = data->dpm_table.mem_table.dpm_state.soft_min_level;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_UCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_UCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min memclk !",
 					return ret);
 	}
@@ -1817,7 +1815,8 @@ static int vega20_upload_dpm_min_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_VCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_VCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min vclk!",
 					return ret);
 
@@ -1825,7 +1824,8 @@ static int vega20_upload_dpm_min_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_DCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_DCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min dclk!",
 					return ret);
 	}
@@ -1836,7 +1836,8 @@ static int vega20_upload_dpm_min_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_ECLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_ECLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min eclk!",
 					return ret);
 	}
@@ -1847,7 +1848,8 @@ static int vega20_upload_dpm_min_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_SOCCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_SOCCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min socclk!",
 					return ret);
 	}
@@ -1858,7 +1860,8 @@ static int vega20_upload_dpm_min_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMinByFreq,
-					(PPCLK_FCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_FCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set soft min fclk!",
 					return ret);
 	}
@@ -1869,7 +1872,8 @@ static int vega20_upload_dpm_min_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetHardMinByFreq,
-					(PPCLK_DCEFCLK << 16) | (min_freq & 0xffff))),
+					(PPCLK_DCEFCLK << 16) | (min_freq & 0xffff),
+					NULL)),
 					"Failed to set hard min dcefclk!",
 					return ret);
 	}
@@ -1890,7 +1894,8 @@ static int vega20_upload_dpm_max_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_GFXCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_GFXCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max gfxclk!",
 					return ret);
 	}
@@ -1901,7 +1906,8 @@ static int vega20_upload_dpm_max_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_UCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_UCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max memclk!",
 					return ret);
 	}
@@ -1912,14 +1918,16 @@ static int vega20_upload_dpm_max_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_VCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_VCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max vclk!",
 					return ret);
 
 		max_freq = data->dpm_table.dclk_table.dpm_state.soft_max_level;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_DCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_DCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max dclk!",
 					return ret);
 	}
@@ -1930,7 +1938,8 @@ static int vega20_upload_dpm_max_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_ECLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_ECLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max eclk!",
 					return ret);
 	}
@@ -1941,7 +1950,8 @@ static int vega20_upload_dpm_max_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_SOCCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_SOCCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max socclk!",
 					return ret);
 	}
@@ -1952,7 +1962,8 @@ static int vega20_upload_dpm_max_level(struct pp_hwmgr *hwmgr, uint32_t feature_
 
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetSoftMaxByFreq,
-					(PPCLK_FCLK << 16) | (max_freq & 0xffff))),
+					(PPCLK_FCLK << 16) | (max_freq & 0xffff),
+					NULL)),
 					"Failed to set soft max fclk!",
 					return ret);
 	}
@@ -1996,17 +2007,17 @@ static int vega20_get_clock_ranges(struct pp_hwmgr *hwmgr,
 
 	if (max) {
 		PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_GetMaxDpmFreq, (clock_select << 16))) == 0,
+				PPSMC_MSG_GetMaxDpmFreq, (clock_select << 16),
+				clock)) == 0,
 				"[GetClockRanges] Failed to get max clock from SMC!",
 				return ret);
-		*clock = smum_get_argument(hwmgr);
 	} else {
 		PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_GetMinDpmFreq,
-				(clock_select << 16))) == 0,
+				(clock_select << 16),
+				clock)) == 0,
 				"[GetClockRanges] Failed to get min clock from SMC!",
 				return ret);
-		*clock = smum_get_argument(hwmgr);
 	}
 
 	return 0;
@@ -2112,10 +2123,10 @@ static int vega20_get_current_clk_freq(struct pp_hwmgr *hwmgr,
 	*clk_freq = 0;
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_GetDpmClockFreq, (clk_id << 16))) == 0,
+			PPSMC_MSG_GetDpmClockFreq, (clk_id << 16),
+			clk_freq)) == 0,
 			"[GetCurrentClkFreq] Attempt to get Current Frequency Failed!",
 			return ret);
-	*clk_freq = smum_get_argument(hwmgr);
 
 	*clk_freq = *clk_freq * 100;
 
@@ -2266,7 +2277,8 @@ int vega20_display_clock_voltage_request(struct pp_hwmgr *hwmgr,
 			clk_request = (clk_select << 16) | clk_freq;
 			result = smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetHardMinByFreq,
-					clk_request);
+					clk_request,
+					NULL);
 		}
 	}
 
@@ -2302,7 +2314,8 @@ static int vega20_notify_smc_display_config_after_ps_adjustment(
 			if (data->smu_features[GNLD_DS_DCEFCLK].supported)
 				PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetMinDeepSleepDcefclk,
-					min_clocks.dcefClockInSR / 100)) == 0,
+					min_clocks.dcefClockInSR / 100,
+					NULL)) == 0,
 					"Attempt to set divider for DCEFCLK Failed!",
 					return ret);
 		} else {
@@ -2314,7 +2327,8 @@ static int vega20_notify_smc_display_config_after_ps_adjustment(
 		dpm_table->dpm_state.hard_min_level = min_clocks.memoryClock / 100;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetHardMinByFreq,
-				(PPCLK_UCLK << 16 ) | dpm_table->dpm_state.hard_min_level)),
+				(PPCLK_UCLK << 16 ) | dpm_table->dpm_state.hard_min_level,
+				NULL)),
 				"[SetHardMinFreq] Set hard min uclk failed!",
 				return ret);
 	}
@@ -2646,7 +2660,8 @@ static int vega20_force_clock_level(struct pp_hwmgr *hwmgr,
 			return -EINVAL;
 
 		ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_SetMinLinkDpmByIndex, soft_min_level);
+			PPSMC_MSG_SetMinLinkDpmByIndex, soft_min_level,
+			NULL);
 		PP_ASSERT_WITH_CODE(!ret,
 			"Failed to set min link dpm level!",
 			return ret);
@@ -3130,7 +3145,7 @@ static int vega20_set_mp1_state(struct pp_hwmgr *hwmgr,
 		return 0;
 	}
 
-	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr, msg)) == 0,
+	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr, msg, NULL)) == 0,
 			    "[PrepareMp1] Failed!",
 			    return ret);
 
@@ -3485,7 +3500,8 @@ static int vega20_set_uclk_to_highest_dpm_level(struct pp_hwmgr *hwmgr,
 		dpm_table->dpm_state.hard_min_level = dpm_table->dpm_levels[dpm_table->count - 1].value;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetHardMinByFreq,
-				(PPCLK_UCLK << 16 ) | dpm_table->dpm_state.hard_min_level)),
+				(PPCLK_UCLK << 16 ) | dpm_table->dpm_state.hard_min_level,
+				NULL)),
 				"[SetUclkToHightestDpmLevel] Set hard min uclk failed!",
 				return ret);
 	}
@@ -3510,7 +3526,8 @@ static int vega20_set_fclk_to_highest_dpm_level(struct pp_hwmgr *hwmgr)
 		dpm_table->dpm_state.soft_min_level = dpm_table->dpm_levels[dpm_table->count - 1].value;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSoftMinByFreq,
-				(PPCLK_FCLK << 16 ) | dpm_table->dpm_state.soft_min_level)),
+				(PPCLK_FCLK << 16 ) | dpm_table->dpm_state.soft_min_level,
+				NULL)),
 				"[SetFclkToHightestDpmLevel] Set soft min fclk failed!",
 				return ret);
 	}
@@ -3524,7 +3541,7 @@ static int vega20_pre_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
 	int ret = 0;
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_NumOfDisplays, 0);
+			PPSMC_MSG_NumOfDisplays, 0, NULL);
 
 	ret = vega20_set_uclk_to_highest_dpm_level(hwmgr,
 			&data->dpm_table.mem_table);
@@ -3555,7 +3572,8 @@ static int vega20_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
 	    data->smu_features[GNLD_DPM_SOCCLK].supported) {
 		result = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_NumOfDisplays,
-			hwmgr->display_config->num_display);
+			hwmgr->display_config->num_display,
+			NULL);
 	}
 
 	return result;
@@ -4072,7 +4090,8 @@ static int vega20_set_power_profile_mode(struct pp_hwmgr *hwmgr, long *input, ui
 	workload_type =
 		conv_power_profile_to_pplib_workload(power_profile_mode);
 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetWorkloadMask,
-						1 << workload_type);
+						1 << workload_type,
+						NULL);
 
 	hwmgr->power_profile_mode = power_profile_mode;
 
@@ -4088,21 +4107,26 @@ static int vega20_notify_cac_buffer_info(struct pp_hwmgr *hwmgr,
 {
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetSystemVirtualDramAddrHigh,
-					virtual_addr_hi);
+					virtual_addr_hi,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetSystemVirtualDramAddrLow,
-					virtual_addr_low);
+					virtual_addr_low,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramLogSetDramAddrHigh,
-					mc_addr_hi);
+					mc_addr_hi,
+					NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramLogSetDramAddrLow,
-					mc_addr_low);
+					mc_addr_low,
+					NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DramLogSetDramSize,
-					size);
+					size,
+					NULL);
 	return 0;
 }
 
@@ -4143,7 +4167,8 @@ static int vega20_smu_i2c_bus_access(struct pp_hwmgr *hwmgr, bool acquire)
 						  (acquire ?
 						  PPSMC_MSG_RequestI2CBus :
 						  PPSMC_MSG_ReleaseI2CBus),
-						  0);
+						  0,
+						  NULL);
 
 	PP_ASSERT_WITH_CODE(!res, "[SmuI2CAccessBus] Failed to access bus!", return res);
 	return res;
@@ -4160,7 +4185,8 @@ static int vega20_set_df_cstate(struct pp_hwmgr *hwmgr,
 		return -EINVAL;
 	}
 
-	ret = smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_DFCstateControl, state);
+	ret = smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_DFCstateControl, state,
+				NULL);
 	if (ret)
 		pr_err("SetDfCstate failed!\n");
 
@@ -4174,7 +4200,8 @@ static int vega20_set_xgmi_pstate(struct pp_hwmgr *hwmgr,
 
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 						  PPSMC_MSG_SetXgmiMode,
-						  pstate ? XGMI_MODE_PSTATE_D0 : XGMI_MODE_PSTATE_D3);
+						  pstate ? XGMI_MODE_PSTATE_D0 : XGMI_MODE_PSTATE_D3,
+						  NULL);
 	if (ret)
 		pr_err("SetXgmiPstate failed!\n");
 
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_powertune.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_powertune.c
index a0bfb65cc5d6..d7cc3d2d9e17 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_powertune.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_powertune.c
@@ -36,7 +36,8 @@ int vega20_set_power_limit(struct pp_hwmgr *hwmgr, uint32_t n)
 
 	if (data->smu_features[GNLD_PPT].enabled)
 		return smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_SetPptLimit, n);
+				PPSMC_MSG_SetPptLimit, n,
+				NULL);
 
 	return 0;
 }
@@ -51,7 +52,8 @@ static int vega20_set_overdrive_target_percentage(struct pp_hwmgr *hwmgr,
 		uint32_t adjust_percent)
 {
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_OverDriveSetPercentage, adjust_percent);
+			PPSMC_MSG_OverDriveSetPercentage, adjust_percent,
+			NULL);
 }
 
 int vega20_power_control_set_level(struct pp_hwmgr *hwmgr)
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_thermal.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_thermal.c
index ede54e87e287..7add2f60f49c 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_thermal.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_thermal.c
@@ -106,10 +106,10 @@ static int vega20_get_current_rpm(struct pp_hwmgr *hwmgr, uint32_t *current_rpm)
 	int ret = 0;
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr,
-				PPSMC_MSG_GetCurrentRpm)) == 0,
+				PPSMC_MSG_GetCurrentRpm,
+				current_rpm)) == 0,
 			"Attempt to get current RPM from SMC Failed!",
 			return ret);
-	*current_rpm = smum_get_argument(hwmgr);
 
 	return 0;
 }
@@ -329,7 +329,8 @@ static int vega20_thermal_setup_fan_table(struct pp_hwmgr *hwmgr)
 
 	ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetFanTemperatureTarget,
-				(uint32_t)table->FanTargetTemperature);
+				(uint32_t)table->FanTargetTemperature,
+				NULL);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smumgr.h b/drivers/gpu/drm/amd/powerplay/inc/smumgr.h
index c5288831aa15..ad100b533d04 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smumgr.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smumgr.h
@@ -81,16 +81,15 @@ enum SMU10_TABLE_ID {
 	SMU10_CLOCKTABLE,
 };
 
-extern uint32_t smum_get_argument(struct pp_hwmgr *hwmgr);
-
 extern int smum_download_powerplay_table(struct pp_hwmgr *hwmgr, void **table);
 
 extern int smum_upload_powerplay_table(struct pp_hwmgr *hwmgr);
 
-extern int smum_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg);
+extern int smum_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg, uint32_t *resp);
 
 extern int smum_send_msg_to_smc_with_parameter(struct pp_hwmgr *hwmgr,
-					uint16_t msg, uint32_t parameter);
+					uint16_t msg, uint32_t parameter,
+					uint32_t *resp);
 
 extern int smum_update_sclk_threshold(struct pp_hwmgr *hwmgr);
 
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
index 66289884c8df..85e5b1ed22c2 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
@@ -2780,7 +2780,7 @@ static int ci_update_dpm_settings(struct pp_hwmgr *hwmgr,
 
 	if (setting->bupdate_sclk) {
 		if (!data->sclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_FreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_FreezeLevel, NULL);
 		for (i = 0; i < smu_data->smc_state_table.GraphicsDpmLevelCount; i++) {
 			if (levels[i].ActivityLevel !=
 				cpu_to_be16(setting->sclk_activity)) {
@@ -2810,12 +2810,12 @@ static int ci_update_dpm_settings(struct pp_hwmgr *hwmgr,
 			}
 		}
 		if (!data->sclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_UnfreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_UnfreezeLevel, NULL);
 	}
 
 	if (setting->bupdate_mclk) {
 		if (!data->mclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_FreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_FreezeLevel, NULL);
 		for (i = 0; i < smu_data->smc_state_table.MemoryDpmLevelCount; i++) {
 			if (mclk_levels[i].ActivityLevel !=
 				cpu_to_be16(setting->mclk_activity)) {
@@ -2845,7 +2845,7 @@ static int ci_update_dpm_settings(struct pp_hwmgr *hwmgr,
 			}
 		}
 		if (!data->mclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_UnfreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_UnfreezeLevel, NULL);
 	}
 	return 0;
 }
@@ -2882,7 +2882,8 @@ static int ci_update_uvd_smc_table(struct pp_hwmgr *hwmgr)
 			break;
 	}
 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_UVDDPM_SetEnabledMask,
-				data->dpm_level_enable_mask.uvd_dpm_enable_mask);
+				data->dpm_level_enable_mask.uvd_dpm_enable_mask,
+				NULL);
 
 	return 0;
 }
@@ -2913,7 +2914,8 @@ static int ci_update_vce_smc_table(struct pp_hwmgr *hwmgr)
 			break;
 	}
 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_VCEDPM_SetEnabledMask,
-				data->dpm_level_enable_mask.vce_dpm_enable_mask);
+				data->dpm_level_enable_mask.vce_dpm_enable_mask,
+				NULL);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
index ab35e4619d15..ecb9ee46d6b3 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
@@ -137,7 +137,7 @@ static int fiji_start_smu_in_protection_mode(struct pp_hwmgr *hwmgr)
 	PHM_WAIT_VFPF_INDIRECT_FIELD(hwmgr, SMC_IND, RCU_UC_EVENTS,
 			INTERRUPTS_ENABLED, 1);
 
-	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_Test, 0x20000);
+	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_Test, 0x20000, NULL);
 
 	/* Wait for done bit to be set */
 	PHM_WAIT_VFPF_INDIRECT_FIELD_UNEQUAL(hwmgr, SMC_IND,
@@ -202,7 +202,8 @@ static int fiji_start_avfs_btc(struct pp_hwmgr *hwmgr)
 
 	if (0 != smu_data->avfs_btc_param) {
 		if (0 != smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_PerformBtc, smu_data->avfs_btc_param)) {
+				PPSMC_MSG_PerformBtc, smu_data->avfs_btc_param,
+				NULL)) {
 			pr_info("[AVFS][Fiji_PerformBtc] PerformBTC SMU msg failed");
 			result = -EINVAL;
 		}
@@ -1911,7 +1912,8 @@ static int fiji_setup_dpm_led_config(struct pp_hwmgr *hwmgr)
 	if (mask)
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						    PPSMC_MSG_LedConfig,
-						    mask);
+						    mask,
+						    NULL);
 	return 0;
 }
 
@@ -2218,14 +2220,16 @@ static int fiji_thermal_setup_fan_table(struct pp_hwmgr *hwmgr)
 		res = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetFanMinPwm,
 				hwmgr->thermal_controller.
-				advanceFanControlParameters.ucMinimumPWMLimit);
+				advanceFanControlParameters.ucMinimumPWMLimit,
+				NULL);
 
 	if (!res && hwmgr->thermal_controller.
 			advanceFanControlParameters.ulMinFanSCLKAcousticLimit)
 		res = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetFanSclkTarget,
 				hwmgr->thermal_controller.
-				advanceFanControlParameters.ulMinFanSCLKAcousticLimit);
+				advanceFanControlParameters.ulMinFanSCLKAcousticLimit,
+				NULL);
 
 	if (res)
 		phm_cap_unset(hwmgr->platform_descriptor.platformCaps,
@@ -2240,7 +2244,7 @@ static int fiji_thermal_avfs_enable(struct pp_hwmgr *hwmgr)
 	if (!hwmgr->avfs_supported)
 		return 0;
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableAvfs);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableAvfs, NULL);
 
 	return 0;
 }
@@ -2388,7 +2392,8 @@ static int fiji_update_uvd_smc_table(struct pp_hwmgr *hwmgr)
 			PHM_PlatformCaps_StablePState))
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_UVDDPM_SetEnabledMask,
-				(uint32_t)(1 << smu_data->smc_state_table.UvdBootLevel));
+				(uint32_t)(1 << smu_data->smc_state_table.UvdBootLevel),
+				NULL);
 	return 0;
 }
 
@@ -2420,7 +2425,8 @@ static int fiji_update_vce_smc_table(struct pp_hwmgr *hwmgr)
 	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps, PHM_PlatformCaps_StablePState))
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_VCEDPM_SetEnabledMask,
-				(uint32_t)1 << smu_data->smc_state_table.VceBootLevel);
+				(uint32_t)1 << smu_data->smc_state_table.VceBootLevel,
+				NULL);
 	return 0;
 }
 
@@ -2567,7 +2573,7 @@ static int fiji_update_dpm_settings(struct pp_hwmgr *hwmgr,
 
 	if (setting->bupdate_sclk) {
 		if (!data->sclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_FreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_FreezeLevel, NULL);
 		for (i = 0; i < smu_data->smc_state_table.GraphicsDpmLevelCount; i++) {
 			if (levels[i].ActivityLevel !=
 				cpu_to_be16(setting->sclk_activity)) {
@@ -2597,12 +2603,12 @@ static int fiji_update_dpm_settings(struct pp_hwmgr *hwmgr,
 			}
 		}
 		if (!data->sclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_UnfreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_UnfreezeLevel, NULL);
 	}
 
 	if (setting->bupdate_mclk) {
 		if (!data->mclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_FreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_FreezeLevel, NULL);
 		for (i = 0; i < smu_data->smc_state_table.MemoryDpmLevelCount; i++) {
 			if (mclk_levels[i].ActivityLevel !=
 				cpu_to_be16(setting->mclk_activity)) {
@@ -2632,7 +2638,7 @@ static int fiji_update_dpm_settings(struct pp_hwmgr *hwmgr,
 			}
 		}
 		if (!data->mclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_UnfreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_UnfreezeLevel, NULL);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
index aaf9fd87d8ed..c3d2e6dcf62a 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
@@ -99,7 +99,8 @@ static int polaris10_perform_btc(struct pp_hwmgr *hwmgr)
 	struct smu7_smumgr *smu_data = (struct smu7_smumgr *)(hwmgr->smu_backend);
 
 	if (0 != smu_data->avfs_btc_param) {
-		if (0 != smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_PerformBtc, smu_data->avfs_btc_param)) {
+		if (0 != smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_PerformBtc, smu_data->avfs_btc_param,
+					NULL)) {
 			pr_info("[AVFS][SmuPolaris10_PerformBtc] PerformBTC SMU msg failed");
 			result = -1;
 		}
@@ -2049,15 +2050,16 @@ int polaris10_thermal_avfs_enable(struct pp_hwmgr *hwmgr)
 		return 0;
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_SetGBDroopSettings, data->avfs_vdroop_override_setting);
+			PPSMC_MSG_SetGBDroopSettings, data->avfs_vdroop_override_setting,
+			NULL);
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableAvfs);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableAvfs, NULL);
 
 	/* Apply avfs cks-off voltages to avoid the overshoot
 	 * when switching to the highest sclk frequency
 	 */
 	if (data->apply_avfs_cks_off_voltage)
-		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ApplyAvfsCksOffVoltage);
+		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ApplyAvfsCksOffVoltage, NULL);
 
 	return 0;
 }
@@ -2158,14 +2160,16 @@ static int polaris10_thermal_setup_fan_table(struct pp_hwmgr *hwmgr)
 		res = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetFanMinPwm,
 				hwmgr->thermal_controller.
-				advanceFanControlParameters.ucMinimumPWMLimit);
+				advanceFanControlParameters.ucMinimumPWMLimit,
+				NULL);
 
 	if (!res && hwmgr->thermal_controller.
 			advanceFanControlParameters.ulMinFanSCLKAcousticLimit)
 		res = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetFanSclkTarget,
 				hwmgr->thermal_controller.
-				advanceFanControlParameters.ulMinFanSCLKAcousticLimit);
+				advanceFanControlParameters.ulMinFanSCLKAcousticLimit,
+				NULL);
 
 	if (res)
 		phm_cap_unset(hwmgr->platform_descriptor.platformCaps,
@@ -2202,7 +2206,8 @@ static int polaris10_update_uvd_smc_table(struct pp_hwmgr *hwmgr)
 			PHM_PlatformCaps_StablePState))
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_UVDDPM_SetEnabledMask,
-				(uint32_t)(1 << smu_data->smc_state_table.UvdBootLevel));
+				(uint32_t)(1 << smu_data->smc_state_table.UvdBootLevel),
+				NULL);
 	return 0;
 }
 
@@ -2234,7 +2239,8 @@ static int polaris10_update_vce_smc_table(struct pp_hwmgr *hwmgr)
 	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps, PHM_PlatformCaps_StablePState))
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_VCEDPM_SetEnabledMask,
-				(uint32_t)1 << smu_data->smc_state_table.VceBootLevel);
+				(uint32_t)1 << smu_data->smc_state_table.VceBootLevel,
+				NULL);
 	return 0;
 }
 
@@ -2485,7 +2491,7 @@ static int polaris10_update_dpm_settings(struct pp_hwmgr *hwmgr,
 
 	if (setting->bupdate_sclk) {
 		if (!data->sclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_FreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_FreezeLevel, NULL);
 		for (i = 0; i < smu_data->smc_state_table.GraphicsDpmLevelCount; i++) {
 			if (levels[i].ActivityLevel !=
 				cpu_to_be16(setting->sclk_activity)) {
@@ -2515,12 +2521,12 @@ static int polaris10_update_dpm_settings(struct pp_hwmgr *hwmgr,
 			}
 		}
 		if (!data->sclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_UnfreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_UnfreezeLevel, NULL);
 	}
 
 	if (setting->bupdate_mclk) {
 		if (!data->mclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_FreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_FreezeLevel, NULL);
 		for (i = 0; i < smu_data->smc_state_table.MemoryDpmLevelCount; i++) {
 			if (mclk_levels[i].ActivityLevel !=
 				cpu_to_be16(setting->mclk_activity)) {
@@ -2550,7 +2556,7 @@ static int polaris10_update_dpm_settings(struct pp_hwmgr *hwmgr,
 			}
 		}
 		if (!data->mclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_UnfreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_UnfreezeLevel, NULL);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c
index d652673b244f..801ba9ca6094 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c
@@ -128,13 +128,16 @@ static int smu10_copy_table_from_smc(struct pp_hwmgr *hwmgr,
 			"Invalid SMU Table Length!", return -EINVAL;);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr));
+			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr));
+			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_TransferTableSmu2Dram,
-			priv->smu_tables.entry[table_id].table_id);
+			priv->smu_tables.entry[table_id].table_id,
+			NULL);
 
 	/* flush hdp cache */
 	amdgpu_asic_flush_hdp(adev, NULL);
@@ -166,13 +169,16 @@ static int smu10_copy_table_to_smc(struct pp_hwmgr *hwmgr,
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr));
+			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr));
+			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_TransferTableDram2Smu,
-			priv->smu_tables.entry[table_id].table_id);
+			priv->smu_tables.entry[table_id].table_id,
+			NULL);
 
 	return 0;
 }
@@ -182,8 +188,8 @@ static int smu10_verify_smc_interface(struct pp_hwmgr *hwmgr)
 	uint32_t smc_driver_if_version;
 
 	smum_send_msg_to_smc(hwmgr,
-			PPSMC_MSG_GetDriverIfVersion);
-	smc_driver_if_version = smum_get_argument(hwmgr);
+			PPSMC_MSG_GetDriverIfVersion,
+			&smc_driver_if_version);
 
 	if ((smc_driver_if_version != SMU10_DRIVER_IF_VERSION) &&
 	    (smc_driver_if_version != SMU10_DRIVER_IF_VERSION + 1)) {
@@ -217,8 +223,7 @@ static int smu10_start_smu(struct pp_hwmgr *hwmgr)
 {
 	struct amdgpu_device *adev = hwmgr->adev;
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetSmuVersion);
-	hwmgr->smu_version = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetSmuVersion, &hwmgr->smu_version);
 	adev->pm.fw_version = hwmgr->smu_version >> 8;
 
 	if (adev->rev_id < 0x8 && adev->pdev->device != 0x15d8 &&
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c
index 627fe77a5f51..aae25243eb10 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c
@@ -207,7 +207,7 @@ uint32_t smu7_get_argument(struct pp_hwmgr *hwmgr)
 
 int smu7_send_msg_to_smc_offset(struct pp_hwmgr *hwmgr)
 {
-	return smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_Test, 0x20000);
+	return smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_Test, 0x20000, NULL);
 }
 
 enum cgs_ucode_id smu7_convert_fw_type_to_cgs(uint32_t fw_type)
@@ -337,10 +337,12 @@ int smu7_request_smu_load_fw(struct pp_hwmgr *hwmgr)
 		if (hwmgr->not_vf) {
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SMU_DRAM_ADDR_HI,
-						upper_32_bits(smu_data->smu_buffer.mc_addr));
+						upper_32_bits(smu_data->smu_buffer.mc_addr),
+						NULL);
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SMU_DRAM_ADDR_LO,
-						lower_32_bits(smu_data->smu_buffer.mc_addr));
+						lower_32_bits(smu_data->smu_buffer.mc_addr),
+						NULL);
 		}
 		fw_to_load = UCODE_ID_RLC_G_MASK
 			   + UCODE_ID_SDMA0_MASK
@@ -405,10 +407,16 @@ int smu7_request_smu_load_fw(struct pp_hwmgr *hwmgr)
 	}
 	memcpy_toio(smu_data->header_buffer.kaddr, smu_data->toc,
 		    sizeof(struct SMU_DRAMData_TOC));
-	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_DRV_DRAM_ADDR_HI, upper_32_bits(smu_data->header_buffer.mc_addr));
-	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_DRV_DRAM_ADDR_LO, lower_32_bits(smu_data->header_buffer.mc_addr));
-
-	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_LoadUcodes, fw_to_load);
+	smum_send_msg_to_smc_with_parameter(hwmgr,
+			PPSMC_MSG_DRV_DRAM_ADDR_HI,
+			upper_32_bits(smu_data->header_buffer.mc_addr),
+			NULL);
+	smum_send_msg_to_smc_with_parameter(hwmgr,
+			PPSMC_MSG_DRV_DRAM_ADDR_LO,
+			lower_32_bits(smu_data->header_buffer.mc_addr),
+			NULL);
+
+	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_LoadUcodes, fw_to_load, NULL);
 
 	r = smu7_check_fw_load_finish(hwmgr, fw_to_load);
 	if (!r)
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c
index 294e48e900dc..76d4f12ceedf 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c
@@ -612,16 +612,19 @@ static int smu8_download_pptable_settings(struct pp_hwmgr *hwmgr, void **table)
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetClkTableAddrHi,
-				upper_32_bits(smu8_smu->scratch_buffer[i].mc_addr));
+				upper_32_bits(smu8_smu->scratch_buffer[i].mc_addr),
+				NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetClkTableAddrLo,
-				lower_32_bits(smu8_smu->scratch_buffer[i].mc_addr));
+				lower_32_bits(smu8_smu->scratch_buffer[i].mc_addr),
+				NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_ExecuteJob,
-				smu8_smu->toc_entry_clock_table);
+				smu8_smu->toc_entry_clock_table,
+				NULL);
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ClkTableXferToDram);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ClkTableXferToDram, NULL);
 
 	return 0;
 }
@@ -639,16 +642,19 @@ static int smu8_upload_pptable_settings(struct pp_hwmgr *hwmgr)
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetClkTableAddrHi,
-				upper_32_bits(smu8_smu->scratch_buffer[i].mc_addr));
+				upper_32_bits(smu8_smu->scratch_buffer[i].mc_addr),
+				NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetClkTableAddrLo,
-				lower_32_bits(smu8_smu->scratch_buffer[i].mc_addr));
+				lower_32_bits(smu8_smu->scratch_buffer[i].mc_addr),
+				NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_ExecuteJob,
-				smu8_smu->toc_entry_clock_table);
+				smu8_smu->toc_entry_clock_table,
+				NULL);
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ClkTableXferToSmu);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ClkTableXferToSmu, NULL);
 
 	return 0;
 }
@@ -673,23 +679,28 @@ static int smu8_request_smu_load_fw(struct pp_hwmgr *hwmgr)
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DriverDramAddrHi,
-					upper_32_bits(smu8_smu->toc_buffer.mc_addr));
+					upper_32_bits(smu8_smu->toc_buffer.mc_addr),
+					NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_DriverDramAddrLo,
-					lower_32_bits(smu8_smu->toc_buffer.mc_addr));
+					lower_32_bits(smu8_smu->toc_buffer.mc_addr),
+					NULL);
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_InitJobs);
+	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_InitJobs, NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_ExecuteJob,
-					smu8_smu->toc_entry_aram);
+					smu8_smu->toc_entry_aram,
+					NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_ExecuteJob,
-				smu8_smu->toc_entry_power_profiling_index);
+				smu8_smu->toc_entry_power_profiling_index,
+				NULL);
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_ExecuteJob,
-					smu8_smu->toc_entry_initialize_index);
+					smu8_smu->toc_entry_initialize_index,
+					NULL);
 
 	fw_to_check = UCODE_ID_RLC_G_MASK |
 			UCODE_ID_SDMA0_MASK |
@@ -860,11 +871,13 @@ static bool smu8_dpm_check_smu_features(struct pp_hwmgr *hwmgr,
 				unsigned long check_feature)
 {
 	int result;
-	unsigned long features;
+	uint32_t features;
 
-	result = smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_GetFeatureStatus, 0);
+	result = smum_send_msg_to_smc_with_parameter(hwmgr,
+				PPSMC_MSG_GetFeatureStatus,
+				0,
+				&features);
 	if (result == 0) {
-		features = smum_get_argument(hwmgr);
 		if (features & check_feature)
 			return true;
 	}
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/smumgr.c
index 4240aeec9000..3bb0392994ec 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smumgr.c
@@ -103,14 +103,6 @@ int smum_process_firmware_header(struct pp_hwmgr *hwmgr)
 	return 0;
 }
 
-uint32_t smum_get_argument(struct pp_hwmgr *hwmgr)
-{
-	if (NULL != hwmgr->smumgr_funcs->get_argument)
-		return hwmgr->smumgr_funcs->get_argument(hwmgr);
-
-	return 0;
-}
-
 uint32_t smum_get_mac_definition(struct pp_hwmgr *hwmgr, uint32_t value)
 {
 	if (NULL != hwmgr->smumgr_funcs->get_mac_definition)
@@ -135,22 +127,46 @@ int smum_upload_powerplay_table(struct pp_hwmgr *hwmgr)
 	return 0;
 }
 
-int smum_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg)
+int smum_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg, uint32_t *resp)
 {
-	if (hwmgr == NULL || hwmgr->smumgr_funcs->send_msg_to_smc == NULL)
+	int ret = 0;
+
+	if (hwmgr == NULL ||
+	    hwmgr->smumgr_funcs->send_msg_to_smc == NULL ||
+	    (resp && !hwmgr->smumgr_funcs->get_argument))
 		return -EINVAL;
 
-	return hwmgr->smumgr_funcs->send_msg_to_smc(hwmgr, msg);
+	ret = hwmgr->smumgr_funcs->send_msg_to_smc(hwmgr, msg);
+	if (ret)
+		return ret;
+
+	if (resp)
+		*resp = hwmgr->smumgr_funcs->get_argument(hwmgr);
+
+	return ret;
 }
 
 int smum_send_msg_to_smc_with_parameter(struct pp_hwmgr *hwmgr,
-					uint16_t msg, uint32_t parameter)
+					uint16_t msg,
+					uint32_t parameter,
+					uint32_t *resp)
 {
+	int ret = 0;
+
 	if (hwmgr == NULL ||
-		hwmgr->smumgr_funcs->send_msg_to_smc_with_parameter == NULL)
+	    hwmgr->smumgr_funcs->send_msg_to_smc_with_parameter == NULL ||
+	    (resp && !hwmgr->smumgr_funcs->get_argument))
 		return -EINVAL;
-	return hwmgr->smumgr_funcs->send_msg_to_smc_with_parameter(
+
+	ret = hwmgr->smumgr_funcs->send_msg_to_smc_with_parameter(
 						hwmgr, msg, parameter);
+	if (ret)
+		return ret;
+
+	if (resp)
+		*resp = hwmgr->smumgr_funcs->get_argument(hwmgr);
+
+	return ret;
 }
 
 int smum_init_smc_table(struct pp_hwmgr *hwmgr)
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
index 6317434ad6b3..398e7e3587de 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
@@ -2702,7 +2702,8 @@ static int tonga_update_uvd_smc_table(struct pp_hwmgr *hwmgr)
 			PHM_PlatformCaps_StablePState))
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_UVDDPM_SetEnabledMask,
-				(uint32_t)(1 << smu_data->smc_state_table.UvdBootLevel));
+				(uint32_t)(1 << smu_data->smc_state_table.UvdBootLevel),
+				NULL);
 	return 0;
 }
 
@@ -2733,7 +2734,8 @@ static int tonga_update_vce_smc_table(struct pp_hwmgr *hwmgr)
 					PHM_PlatformCaps_StablePState))
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_VCEDPM_SetEnabledMask,
-				(uint32_t)1 << smu_data->smc_state_table.VceBootLevel);
+				(uint32_t)1 << smu_data->smc_state_table.VceBootLevel,
+				NULL);
 	return 0;
 }
 
@@ -3168,7 +3170,7 @@ static int tonga_update_dpm_settings(struct pp_hwmgr *hwmgr,
 
 	if (setting->bupdate_sclk) {
 		if (!data->sclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_FreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_FreezeLevel, NULL);
 		for (i = 0; i < smu_data->smc_state_table.GraphicsDpmLevelCount; i++) {
 			if (levels[i].ActivityLevel !=
 				cpu_to_be16(setting->sclk_activity)) {
@@ -3198,12 +3200,12 @@ static int tonga_update_dpm_settings(struct pp_hwmgr *hwmgr,
 			}
 		}
 		if (!data->sclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_UnfreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_SCLKDPM_UnfreezeLevel, NULL);
 	}
 
 	if (setting->bupdate_mclk) {
 		if (!data->mclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_FreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_FreezeLevel, NULL);
 		for (i = 0; i < smu_data->smc_state_table.MemoryDpmLevelCount; i++) {
 			if (mclk_levels[i].ActivityLevel !=
 				cpu_to_be16(setting->mclk_activity)) {
@@ -3233,7 +3235,7 @@ static int tonga_update_dpm_settings(struct pp_hwmgr *hwmgr,
 			}
 		}
 		if (!data->mclk_dpm_key_disabled)
-			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_UnfreezeLevel);
+			smum_send_msg_to_smc(hwmgr, PPSMC_MSG_MCLKDPM_UnfreezeLevel, NULL);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c
index 1769dded4f74..1e222c5d91a4 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c
@@ -49,13 +49,16 @@ static int vega10_copy_table_from_smc(struct pp_hwmgr *hwmgr,
 			"Invalid SMU Table Length!", return -EINVAL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr));
+			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr));
+			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_TransferTableSmu2Dram,
-			priv->smu_tables.entry[table_id].table_id);
+			priv->smu_tables.entry[table_id].table_id,
+			NULL);
 
 	/* flush hdp cache */
 	amdgpu_asic_flush_hdp(adev, NULL);
@@ -92,13 +95,16 @@ static int vega10_copy_table_to_smc(struct pp_hwmgr *hwmgr,
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr));
+			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr));
+			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL);
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_TransferTableDram2Smu,
-			priv->smu_tables.entry[table_id].table_id);
+			priv->smu_tables.entry[table_id].table_id,
+			NULL);
 
 	return 0;
 }
@@ -118,17 +124,21 @@ int vega10_enable_smc_features(struct pp_hwmgr *hwmgr,
 		return 0;
 
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
-			msg, feature_mask);
+			msg, feature_mask, NULL);
 }
 
 int vega10_get_enabled_smc_features(struct pp_hwmgr *hwmgr,
 			    uint64_t *features_enabled)
 {
+	uint32_t enabled_features;
+
 	if (features_enabled == NULL)
 		return -EINVAL;
 
-	smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetEnabledSmuFeatures);
-	*features_enabled = smum_get_argument(hwmgr);
+	smum_send_msg_to_smc(hwmgr,
+			PPSMC_MSG_GetEnabledSmuFeatures,
+			&enabled_features);
+	*features_enabled = enabled_features;
 
 	return 0;
 }
@@ -152,10 +162,12 @@ static int vega10_set_tools_address(struct pp_hwmgr *hwmgr)
 	if (priv->smu_tables.entry[TOOLSTABLE].mc_addr) {
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetToolsDramAddrHigh,
-				upper_32_bits(priv->smu_tables.entry[TOOLSTABLE].mc_addr));
+				upper_32_bits(priv->smu_tables.entry[TOOLSTABLE].mc_addr),
+				NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetToolsDramAddrLow,
-				lower_32_bits(priv->smu_tables.entry[TOOLSTABLE].mc_addr));
+				lower_32_bits(priv->smu_tables.entry[TOOLSTABLE].mc_addr),
+				NULL);
 	}
 	return 0;
 }
@@ -168,10 +180,10 @@ static int vega10_verify_smc_interface(struct pp_hwmgr *hwmgr)
 	uint32_t rev_id;
 
 	PP_ASSERT_WITH_CODE(!smum_send_msg_to_smc(hwmgr,
-			PPSMC_MSG_GetDriverIfVersion),
+			PPSMC_MSG_GetDriverIfVersion,
+			&smc_driver_if_version),
 			"Attempt to get SMC IF Version Number Failed!",
 			return -EINVAL);
-	smc_driver_if_version = smum_get_argument(hwmgr);
 
 	dev_id = adev->pdev->device;
 	rev_id = adev->pdev->revision;
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
index 34528a1285ac..f54df76537e4 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
@@ -52,16 +52,19 @@ static int vega12_copy_table_from_smc(struct pp_hwmgr *hwmgr,
 			"Invalid SMU Table Length!", return -EINVAL);
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr)) == 0,
+			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL) == 0,
 			"[CopyTableFromSMC] Attempt to Set Dram Addr High Failed!", return -EINVAL);
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr)) == 0,
+			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL) == 0,
 			"[CopyTableFromSMC] Attempt to Set Dram Addr Low Failed!",
 			return -EINVAL);
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_TransferTableSmu2Dram,
-			table_id) == 0,
+			table_id,
+			NULL) == 0,
 			"[CopyTableFromSMC] Attempt to Transfer Table From SMU Failed!",
 			return -EINVAL);
 
@@ -100,17 +103,20 @@ static int vega12_copy_table_to_smc(struct pp_hwmgr *hwmgr,
 
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr)) == 0,
+			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL) == 0,
 			"[CopyTableToSMC] Attempt to Set Dram Addr High Failed!",
 			return -EINVAL;);
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr)) == 0,
+			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL) == 0,
 			"[CopyTableToSMC] Attempt to Set Dram Addr Low Failed!",
 			return -EINVAL);
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_TransferTableDram2Smu,
-			table_id) == 0,
+			table_id,
+			NULL) == 0,
 			"[CopyTableToSMC] Attempt to Transfer Table To SMU Failed!",
 			return -EINVAL);
 
@@ -127,20 +133,20 @@ int vega12_enable_smc_features(struct pp_hwmgr *hwmgr,
 
 	if (enable) {
 		PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_EnableSmuFeaturesLow, smu_features_low) == 0,
+				PPSMC_MSG_EnableSmuFeaturesLow, smu_features_low, NULL) == 0,
 				"[EnableDisableSMCFeatures] Attempt to enable SMU features Low failed!",
 				return -EINVAL);
 		PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_EnableSmuFeaturesHigh, smu_features_high) == 0,
+				PPSMC_MSG_EnableSmuFeaturesHigh, smu_features_high, NULL) == 0,
 				"[EnableDisableSMCFeatures] Attempt to enable SMU features High failed!",
 				return -EINVAL);
 	} else {
 		PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_DisableSmuFeaturesLow, smu_features_low) == 0,
+				PPSMC_MSG_DisableSmuFeaturesLow, smu_features_low, NULL) == 0,
 				"[EnableDisableSMCFeatures] Attempt to disable SMU features Low failed!",
 				return -EINVAL);
 		PP_ASSERT_WITH_CODE(smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_DisableSmuFeaturesHigh, smu_features_high) == 0,
+				PPSMC_MSG_DisableSmuFeaturesHigh, smu_features_high, NULL) == 0,
 				"[EnableDisableSMCFeatures] Attempt to disable SMU features High failed!",
 				return -EINVAL);
 	}
@@ -157,16 +163,16 @@ int vega12_get_enabled_smc_features(struct pp_hwmgr *hwmgr,
 		return -EINVAL;
 
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc(hwmgr,
-			PPSMC_MSG_GetEnabledSmuFeaturesLow) == 0,
+			PPSMC_MSG_GetEnabledSmuFeaturesLow,
+			&smc_features_low) == 0,
 			"[GetEnabledSMCFeatures] Attempt to get SMU features Low failed!",
 			return -EINVAL);
-	smc_features_low = smum_get_argument(hwmgr);
 
 	PP_ASSERT_WITH_CODE(smum_send_msg_to_smc(hwmgr,
-			PPSMC_MSG_GetEnabledSmuFeaturesHigh) == 0,
+			PPSMC_MSG_GetEnabledSmuFeaturesHigh,
+			&smc_features_high) == 0,
 			"[GetEnabledSMCFeatures] Attempt to get SMU features High failed!",
 			return -EINVAL);
-	smc_features_high = smum_get_argument(hwmgr);
 
 	*features_enabled = ((((uint64_t)smc_features_low << SMU_FEATURES_LOW_SHIFT) & SMU_FEATURES_LOW_MASK) |
 			(((uint64_t)smc_features_high << SMU_FEATURES_HIGH_SHIFT) & SMU_FEATURES_HIGH_MASK));
@@ -194,10 +200,12 @@ static int vega12_set_tools_address(struct pp_hwmgr *hwmgr)
 	if (priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr) {
 		if (!smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetToolsDramAddrHigh,
-				upper_32_bits(priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr)))
+				upper_32_bits(priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr),
+				NULL))
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetToolsDramAddrLow,
-					lower_32_bits(priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr));
+					lower_32_bits(priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr),
+					NULL);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
index 2a9bf78e32bd..2fb97554134f 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
@@ -177,16 +177,18 @@ static int vega20_copy_table_from_smc(struct pp_hwmgr *hwmgr,
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr))) == 0,
+			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL)) == 0,
 			"[CopyTableFromSMC] Attempt to Set Dram Addr High Failed!",
 			return ret);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr))) == 0,
+			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL)) == 0,
 			"[CopyTableFromSMC] Attempt to Set Dram Addr Low Failed!",
 			return ret);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_TransferTableSmu2Dram, table_id)) == 0,
+			PPSMC_MSG_TransferTableSmu2Dram, table_id, NULL)) == 0,
 			"[CopyTableFromSMC] Attempt to Transfer Table From SMU Failed!",
 			return ret);
 
@@ -226,16 +228,18 @@ static int vega20_copy_table_to_smc(struct pp_hwmgr *hwmgr,
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr))) == 0,
+			upper_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL)) == 0,
 			"[CopyTableToSMC] Attempt to Set Dram Addr High Failed!",
 			return ret);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr))) == 0,
+			lower_32_bits(priv->smu_tables.entry[table_id].mc_addr),
+			NULL)) == 0,
 			"[CopyTableToSMC] Attempt to Set Dram Addr Low Failed!",
 			return ret);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_TransferTableDram2Smu, table_id)) == 0,
+			PPSMC_MSG_TransferTableDram2Smu, table_id, NULL)) == 0,
 			"[CopyTableToSMC] Attempt to Transfer Table To SMU Failed!",
 			return ret);
 
@@ -257,16 +261,20 @@ int vega20_set_activity_monitor_coeff(struct pp_hwmgr *hwmgr,
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[TABLE_ACTIVITY_MONITOR_COEFF].mc_addr))) == 0,
+			upper_32_bits(priv->smu_tables.entry[TABLE_ACTIVITY_MONITOR_COEFF].mc_addr),
+			NULL)) == 0,
 			"[SetActivityMonitor] Attempt to Set Dram Addr High Failed!",
 			return ret);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[TABLE_ACTIVITY_MONITOR_COEFF].mc_addr))) == 0,
+			lower_32_bits(priv->smu_tables.entry[TABLE_ACTIVITY_MONITOR_COEFF].mc_addr),
+			NULL)) == 0,
 			"[SetActivityMonitor] Attempt to Set Dram Addr Low Failed!",
 			return ret);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-			PPSMC_MSG_TransferTableDram2Smu, TABLE_ACTIVITY_MONITOR_COEFF | (workload_type << 16))) == 0,
+			PPSMC_MSG_TransferTableDram2Smu,
+			TABLE_ACTIVITY_MONITOR_COEFF | (workload_type << 16),
+			NULL)) == 0,
 			"[SetActivityMonitor] Attempt to Transfer Table To SMU Failed!",
 			return ret);
 
@@ -283,17 +291,19 @@ int vega20_get_activity_monitor_coeff(struct pp_hwmgr *hwmgr,
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[TABLE_ACTIVITY_MONITOR_COEFF].mc_addr))) == 0,
+			upper_32_bits(priv->smu_tables.entry[TABLE_ACTIVITY_MONITOR_COEFF].mc_addr),
+			NULL)) == 0,
 			"[GetActivityMonitor] Attempt to Set Dram Addr High Failed!",
 			return ret);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[TABLE_ACTIVITY_MONITOR_COEFF].mc_addr))) == 0,
+			lower_32_bits(priv->smu_tables.entry[TABLE_ACTIVITY_MONITOR_COEFF].mc_addr),
+			NULL)) == 0,
 			"[GetActivityMonitor] Attempt to Set Dram Addr Low Failed!",
 			return ret);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_TransferTableSmu2Dram,
-			TABLE_ACTIVITY_MONITOR_COEFF | (workload_type << 16))) == 0,
+			TABLE_ACTIVITY_MONITOR_COEFF | (workload_type << 16), NULL)) == 0,
 			"[GetActivityMonitor] Attempt to Transfer Table From SMU Failed!",
 			return ret);
 
@@ -317,20 +327,20 @@ int vega20_enable_smc_features(struct pp_hwmgr *hwmgr,
 
 	if (enable) {
 		PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_EnableSmuFeaturesLow, smu_features_low)) == 0,
+				PPSMC_MSG_EnableSmuFeaturesLow, smu_features_low, NULL)) == 0,
 				"[EnableDisableSMCFeatures] Attempt to enable SMU features Low failed!",
 				return ret);
 		PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_EnableSmuFeaturesHigh, smu_features_high)) == 0,
+				PPSMC_MSG_EnableSmuFeaturesHigh, smu_features_high, NULL)) == 0,
 				"[EnableDisableSMCFeatures] Attempt to enable SMU features High failed!",
 				return ret);
 	} else {
 		PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_DisableSmuFeaturesLow, smu_features_low)) == 0,
+				PPSMC_MSG_DisableSmuFeaturesLow, smu_features_low, NULL)) == 0,
 				"[EnableDisableSMCFeatures] Attempt to disable SMU features Low failed!",
 				return ret);
 		PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
-				PPSMC_MSG_DisableSmuFeaturesHigh, smu_features_high)) == 0,
+				PPSMC_MSG_DisableSmuFeaturesHigh, smu_features_high, NULL)) == 0,
 				"[EnableDisableSMCFeatures] Attempt to disable SMU features High failed!",
 				return ret);
 	}
@@ -348,15 +358,15 @@ int vega20_get_enabled_smc_features(struct pp_hwmgr *hwmgr,
 		return -EINVAL;
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr,
-			PPSMC_MSG_GetEnabledSmuFeaturesLow)) == 0,
+			PPSMC_MSG_GetEnabledSmuFeaturesLow,
+			&smc_features_low)) == 0,
 			"[GetEnabledSMCFeatures] Attempt to get SMU features Low failed!",
 			return ret);
-	smc_features_low = smum_get_argument(hwmgr);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr,
-			PPSMC_MSG_GetEnabledSmuFeaturesHigh)) == 0,
+			PPSMC_MSG_GetEnabledSmuFeaturesHigh,
+			&smc_features_high)) == 0,
 			"[GetEnabledSMCFeatures] Attempt to get SMU features High failed!",
 			return ret);
-	smc_features_high = smum_get_argument(hwmgr);
 
 	*features_enabled = ((((uint64_t)smc_features_low << SMU_FEATURES_LOW_SHIFT) & SMU_FEATURES_LOW_MASK) |
 			(((uint64_t)smc_features_high << SMU_FEATURES_HIGH_SHIFT) & SMU_FEATURES_HIGH_MASK));
@@ -373,11 +383,13 @@ static int vega20_set_tools_address(struct pp_hwmgr *hwmgr)
 	if (priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr) {
 		ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetToolsDramAddrHigh,
-				upper_32_bits(priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr));
+				upper_32_bits(priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr),
+				NULL);
 		if (!ret)
 			ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_SetToolsDramAddrLow,
-					lower_32_bits(priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr));
+					lower_32_bits(priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr),
+					NULL);
 	}
 
 	return ret;
@@ -391,12 +403,14 @@ int vega20_set_pptable_driver_address(struct pp_hwmgr *hwmgr)
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(priv->smu_tables.entry[TABLE_PPTABLE].mc_addr))) == 0,
+			upper_32_bits(priv->smu_tables.entry[TABLE_PPTABLE].mc_addr),
+			NULL)) == 0,
 			"[SetPPtabeDriverAddress] Attempt to Set Dram Addr High Failed!",
 			return ret);
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 			PPSMC_MSG_SetDriverDramAddrLow,
-			lower_32_bits(priv->smu_tables.entry[TABLE_PPTABLE].mc_addr))) == 0,
+			lower_32_bits(priv->smu_tables.entry[TABLE_PPTABLE].mc_addr),
+			NULL)) == 0,
 			"[SetPPtabeDriverAddress] Attempt to Set Dram Addr Low Failed!",
 			return ret);
 
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
index 0f38d5183985..3da71a088b92 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
@@ -356,7 +356,8 @@ static int vegam_update_uvd_smc_table(struct pp_hwmgr *hwmgr)
 			PHM_PlatformCaps_StablePState))
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_UVDDPM_SetEnabledMask,
-				(uint32_t)(1 << smu_data->smc_state_table.UvdBootLevel));
+				(uint32_t)(1 << smu_data->smc_state_table.UvdBootLevel),
+				NULL);
 	return 0;
 }
 
@@ -388,7 +389,8 @@ static int vegam_update_vce_smc_table(struct pp_hwmgr *hwmgr)
 	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps, PHM_PlatformCaps_StablePState))
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_VCEDPM_SetEnabledMask,
-				(uint32_t)1 << smu_data->smc_state_table.VceBootLevel);
+				(uint32_t)1 << smu_data->smc_state_table.VceBootLevel,
+				NULL);
 	return 0;
 }
 
@@ -1906,7 +1908,8 @@ static int vegam_enable_reconfig_cus(struct pp_hwmgr *hwmgr)
 
 	smum_send_msg_to_smc_with_parameter(hwmgr,
 					    PPSMC_MSG_EnableModeSwitchRLCNotification,
-					    adev->gfx.cu_info.number);
+					    adev->gfx.cu_info.number,
+					    NULL);
 
 	return 0;
 }
@@ -2060,7 +2063,7 @@ static int vegam_init_smc_table(struct pp_hwmgr *hwmgr)
 		table->AcDcGpio = gpio_pin.uc_gpio_pin_bit_shift;
 		if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
 				PHM_PlatformCaps_AutomaticDCTransition) &&
-				!smum_send_msg_to_smc(hwmgr, PPSMC_MSG_UseNewGPIOScheme))
+				!smum_send_msg_to_smc(hwmgr, PPSMC_MSG_UseNewGPIOScheme, NULL))
 			phm_cap_set(hwmgr->platform_descriptor.platformCaps,
 					PHM_PlatformCaps_SMCtoPPLIBAcdcGpioScheme);
 	} else {
@@ -2250,10 +2253,12 @@ int vegam_thermal_avfs_enable(struct pp_hwmgr *hwmgr)
 	if (!hwmgr->avfs_supported)
 		return 0;
 
-	ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableAvfs);
+	ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_EnableAvfs, NULL);
 	if (!ret) {
 		if (data->apply_avfs_cks_off_voltage)
-			ret = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_ApplyAvfsCksOffVoltage);
+			ret = smum_send_msg_to_smc(hwmgr,
+					PPSMC_MSG_ApplyAvfsCksOffVoltage,
+					NULL);
 	}
 
 	return ret;
-- 
2.26.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016F021AE2B
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2020 06:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DC06EB65;
	Fri, 10 Jul 2020 04:48:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643D96EB65
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2020 04:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdyVt/M0XWCA4rjEUk07ICuMkG59ORu25UdQmZtbonlQ8465bomTkOGA1dDA/TnLUCkD/e7vEt24yOY+eFhWeIqEZSX8JsLvAr1GhQKoD+qP2wFGc6LlnleissbgSg53g568GR53uyUzB2E1plCRBMpXoGngJzE4N+ve2KTp7ZI0zlb5x2LBVvWug19/OoUff3mOzUCubMTyOFEm5D0UQYABxVMXmvdmOG7zXoOlx638wAXYbe7UIid8yPII7vHlsjyVwc2EkY0xNT6gqSqT4QXgMB/PmU3yGTo2ihOJ52fNyyKWMNYxK6Wnpggh8zHU3dFFUDPXWxb3AMsQFZZykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbOoC4ECJbuLntHV7uHCaSpglf0lgE0pi9QXa5nQjvM=;
 b=Qh34/f3LVsRbIk9hAH+nxXq6SNeb3Rr252N2ebn61ETTFsNnL1r2Pf5jdmIzt7DZTP8486qJgjHCCvrcTzgjAcabLKY8hSyI63VKqZRczzGWhvd1Qvh8jb4Bi4b2Ci95k4mWXQgH15jTp4qFmyibC5DkdNSJo53D+HDj2LIN1p+3VSIEQECVplpRbi4W3YnICLIBplXrxiRG2LrqDAVTR4SVW7f0otma/4FYbnHGD6psSJcXUfx5iwayteZdFWp6X3mCLT6lQN8wdO6qjWXU1rK1xYCgn52N6ttkGCp6clA4W7srUM8PCBh06qMgzMGQUjwmN09iJ8WS2HCo1gPtGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbOoC4ECJbuLntHV7uHCaSpglf0lgE0pi9QXa5nQjvM=;
 b=kj1x6ROU9FJCd9DkqnF+fJNcwhxPuzMlRnHcbebxiKMH2wL73oV0VZskvpuzWmwUTI57bC5CbJ0sJWTYC2R94EYCB7cRMQ37F7bPbbHY0F59kG/6jBygSuMemN3lEnLmyVEgtPijWLFAgjMT1L+LUQC8VXvZDXhwouewsUsgoKM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB2360.namprd12.prod.outlook.com (2603:10b6:4:bb::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21; Fri, 10 Jul 2020 04:48:13 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::c157:8999:dcc3:536f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::c157:8999:dcc3:536f%3]) with mapi id 15.20.3174.023; Fri, 10 Jul 2020
 04:48:13 +0000
From: Evan Quan <evan.quan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/16] drm/amd/powerplay: update Arcturus default dpm table
 setting
Date: Fri, 10 Jul 2020 12:47:33 +0800
Message-Id: <20200710044746.23538-3-evan.quan@amd.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710044746.23538-1-evan.quan@amd.com>
References: <20200710044746.23538-1-evan.quan@amd.com>
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To DM6PR12MB2619.namprd12.prod.outlook.com
 (2603:10b6:5:45::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from equan-buildpc.amd.com (58.247.170.242) by
 HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.9 via Frontend Transport; Fri, 10 Jul 2020 04:48:12 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2f4f18c3-50d2-479b-5d69-08d8248c73f0
X-MS-TrafficTypeDiagnostic: DM5PR12MB2360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2360FC8F9EB3573ED71370C7E4650@DM5PR12MB2360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s470F+YizY4N/TdWLqMmp5xOVYMkYmCipCBFkG9mN0/Zd1yD1Qr8iCW8POGatrCM2HjngBJ/23HcIOsmQjOrc15xp7OdEompWHdeTGN5+4utaQCMhKlEjL75+vPG0VSIpGPOY7+TwCIhorwFeGgY496DxDkcecJl7vpTo9WU8zDtYYAysZdkBtBJpNY3DWnhZ+RplDPH9FoxAsVVckp+11BWJwos6C9cGxTPe+MUFdeHOYakpKf/oR9P2a01wVOj8JsTrQBkBN/8JMIJuXTAJWf77r34/1Lz11wgxcSADUXlYuazQQ/T91ZDCSq8H6bZvzIhErMzLaDx2IOm0Cn+UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(2906002)(4326008)(8676002)(8936002)(83380400001)(6486002)(44832011)(7696005)(52116002)(186003)(16526019)(956004)(2616005)(26005)(6916009)(316002)(478600001)(30864003)(86362001)(6666004)(5660300002)(66556008)(1076003)(66476007)(36756003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: B6FcBOCzyqjiMbeCk6Gs63Sm4l1jIWpGxvGolWmzZuEYhhl+7/OsSqW+h7FHTOsw9JN/Lbsx52pxnVZjCphAHZ/CHT6pN8huZzIKxQ/5326EPtu3iFSlU9DIV6biBiMQ7+wvYvNbBjXmAHmjq7eywUzArUxsKp0PYM8SjvWYbY0FRr00YOds/DewLM/m8tFkGc9KOGyI4fir2SkH84RlTAzZEDt56TkLG28Vs7uypt3ph6Eb+vq9Uj9ToxcRFLk0hV6NAjrjbjzxBKy0soJKkbcyFmHnSFahHbqajYqoI5o0m5wL5+sIhnCgAArLOE5nfT1EJbGJYvXCVM5rbC1AttceHzn5u+SnLCThfVIVDVYTd4qucaFdpM5PKoWSC4uiwYUYkSE4LISQydbEy0xZatIoxuFjWkQtFuZ3CEh1bEl2nVD1Ss4wi6Kc+kivNbTjc3PhWHjxw1TTK6MjfOZHZF27ngGEH29mWVXYPHh/V5EMNuR8KvQhjXg+byqWUBEX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4f18c3-50d2-479b-5d69-08d8248c73f0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 04:48:13.4347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvpSuEzHiRmSzNRUwy1H7ZRLc6QLath5R+NHSIoUWmIsgI9JThtaEHmHdFb/NDyI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2360
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
Cc: alexander.deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Preparing for coming code sharing around performance level
setting.

Change-Id: Iaa77af7a272121503f09ad5fbfbe9dff2d2597b1
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 297 ++++++++-----------
 1 file changed, 119 insertions(+), 178 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index 5b793e354704..a3747ab4af32 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -291,7 +291,6 @@ static int arcturus_get_pwr_src_index(struct smu_context *smc, uint32_t index)
 	return mapping.map_to;
 }
 
-
 static int arcturus_get_workload_type(struct smu_context *smu, enum PP_SMC_POWER_PROFILE profile)
 {
 	struct smu_11_0_cmn2aisc_mapping mapping;
@@ -338,23 +337,11 @@ static int arcturus_allocate_dpm_context(struct smu_context *smu)
 {
 	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
 
-	if (smu_dpm->dpm_context)
-		return -EINVAL;
-
-	smu_dpm->dpm_context = kzalloc(sizeof(struct arcturus_dpm_table),
+	smu_dpm->dpm_context = kzalloc(sizeof(struct smu_11_0_dpm_context),
 				       GFP_KERNEL);
 	if (!smu_dpm->dpm_context)
 		return -ENOMEM;
-
-	if (smu_dpm->golden_dpm_context)
-		return -EINVAL;
-
-	smu_dpm->golden_dpm_context = kzalloc(sizeof(struct arcturus_dpm_table),
-					      GFP_KERNEL);
-	if (!smu_dpm->golden_dpm_context)
-		return -ENOMEM;
-
-	smu_dpm->dpm_context_size = sizeof(struct arcturus_dpm_table);
+	smu_dpm->dpm_context_size = sizeof(struct smu_11_0_dpm_context);
 
 	smu_dpm->dpm_current_power_state = kzalloc(sizeof(struct smu_power_state),
 				       GFP_KERNEL);
@@ -382,119 +369,84 @@ arcturus_get_allowed_feature_mask(struct smu_context *smu,
 	return 0;
 }
 
-static int
-arcturus_set_single_dpm_table(struct smu_context *smu,
-			    struct arcturus_single_dpm_table *single_dpm_table,
-			    PPCLK_e clk_id)
-{
-	int ret = 0;
-	uint32_t i, num_of_levels = 0, clk;
-
-	ret = smu_send_smc_msg_with_param(smu,
-			SMU_MSG_GetDpmFreqByIndex,
-			(clk_id << 16 | 0xFF),
-			&num_of_levels);
-	if (ret) {
-		dev_err(smu->adev->dev, "[%s] failed to get dpm levels!\n", __func__);
-		return ret;
-	}
-
-	single_dpm_table->count = num_of_levels;
-	for (i = 0; i < num_of_levels; i++) {
-		ret = smu_send_smc_msg_with_param(smu,
-				SMU_MSG_GetDpmFreqByIndex,
-				(clk_id << 16 | i),
-				&clk);
-		if (ret) {
-			dev_err(smu->adev->dev, "[%s] failed to get dpm freq by index!\n", __func__);
-			return ret;
-		}
-		single_dpm_table->dpm_levels[i].value = clk;
-		single_dpm_table->dpm_levels[i].enabled = true;
-	}
-	return 0;
-}
-
-static void arcturus_init_single_dpm_state(struct arcturus_dpm_state *dpm_state)
-{
-	dpm_state->soft_min_level = 0x0;
-	dpm_state->soft_max_level = 0xffff;
-        dpm_state->hard_min_level = 0x0;
-        dpm_state->hard_max_level = 0xffff;
-}
-
 static int arcturus_set_default_dpm_table(struct smu_context *smu)
 {
-	int ret;
-
-	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
-	struct arcturus_dpm_table *dpm_table = NULL;
-	struct arcturus_single_dpm_table *single_dpm_table;
-
-	dpm_table = smu_dpm->dpm_context;
+	struct smu_11_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
+	PPTable_t *driver_ppt = smu->smu_table.driver_pptable;
+	struct smu_11_0_dpm_table *dpm_table = NULL;
+	int ret = 0;
 
-	/* socclk */
-	single_dpm_table = &(dpm_table->soc_table);
+	/* socclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.soc_table;
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_SOCCLK_BIT)) {
-		ret = arcturus_set_single_dpm_table(smu, single_dpm_table,
-						  PPCLK_SOCCLK);
-		if (ret) {
-			dev_err(smu->adev->dev, "[%s] failed to get socclk dpm levels!\n", __func__);
+		ret = smu_v11_0_set_single_dpm_table(smu,
+						     SMU_SOCCLK,
+						     dpm_table);
+		if (ret)
 			return ret;
-		}
+		dpm_table->is_fine_grained =
+			!driver_ppt->DpmDescriptor[PPCLK_SOCCLK].SnapToDiscrete;
 	} else {
-		single_dpm_table->count = 1;
-		single_dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.socclk / 100;
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.socclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
 	}
-	arcturus_init_single_dpm_state(&(single_dpm_table->dpm_state));
 
-	/* gfxclk */
-	single_dpm_table = &(dpm_table->gfx_table);
+	/* gfxclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.gfx_table;
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT)) {
-		ret = arcturus_set_single_dpm_table(smu, single_dpm_table,
-						  PPCLK_GFXCLK);
-		if (ret) {
-			dev_err(smu->adev->dev, "[SetupDefaultDpmTable] failed to get gfxclk dpm levels!");
+		ret = smu_v11_0_set_single_dpm_table(smu,
+						     SMU_GFXCLK,
+						     dpm_table);
+		if (ret)
 			return ret;
-		}
+		dpm_table->is_fine_grained =
+			!driver_ppt->DpmDescriptor[PPCLK_GFXCLK].SnapToDiscrete;
 	} else {
-		single_dpm_table->count = 1;
-		single_dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.gfxclk / 100;
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.gfxclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
 	}
-	arcturus_init_single_dpm_state(&(single_dpm_table->dpm_state));
 
-	/* memclk */
-	single_dpm_table = &(dpm_table->mem_table);
+	/* memclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.uclk_table;
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
-		ret = arcturus_set_single_dpm_table(smu, single_dpm_table,
-						  PPCLK_UCLK);
-		if (ret) {
-			dev_err(smu->adev->dev, "[SetupDefaultDpmTable] failed to get memclk dpm levels!");
+		ret = smu_v11_0_set_single_dpm_table(smu,
+						     SMU_UCLK,
+						     dpm_table);
+		if (ret)
 			return ret;
-		}
+		dpm_table->is_fine_grained =
+			!driver_ppt->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete;
 	} else {
-		single_dpm_table->count = 1;
-		single_dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.uclk / 100;
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.uclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
 	}
-	arcturus_init_single_dpm_state(&(single_dpm_table->dpm_state));
 
-	/* fclk */
-	single_dpm_table = &(dpm_table->fclk_table);
+	/* fclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.fclk_table;
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_FCLK_BIT)) {
-		ret = arcturus_set_single_dpm_table(smu, single_dpm_table,
-						  PPCLK_FCLK);
-		if (ret) {
-			dev_err(smu->adev->dev, "[SetupDefaultDpmTable] failed to get fclk dpm levels!");
+		ret = smu_v11_0_set_single_dpm_table(smu,
+						     SMU_FCLK,
+						     dpm_table);
+		if (ret)
 			return ret;
-		}
+		dpm_table->is_fine_grained =
+			!driver_ppt->DpmDescriptor[PPCLK_FCLK].SnapToDiscrete;
 	} else {
-		single_dpm_table->count = 1;
-		single_dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.fclk / 100;
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.fclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
 	}
-	arcturus_init_single_dpm_state(&(single_dpm_table->dpm_state));
-
-	memcpy(smu_dpm->golden_dpm_context, dpm_table,
-	       sizeof(struct arcturus_dpm_table));
 
 	return 0;
 }
@@ -622,7 +574,7 @@ static int arcturus_populate_umd_state_clk(struct smu_context *smu)
 
 static int arcturus_get_clk_table(struct smu_context *smu,
 			struct pp_clock_levels_with_latency *clocks,
-			struct arcturus_single_dpm_table *dpm_table)
+			struct smu_11_0_dpm_table *dpm_table)
 {
 	int i, count;
 
@@ -824,14 +776,14 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 	int i, now, size = 0;
 	int ret = 0;
 	struct pp_clock_levels_with_latency clocks;
-	struct arcturus_single_dpm_table *single_dpm_table;
+	struct smu_11_0_dpm_table *single_dpm_table;
 	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
-	struct arcturus_dpm_table *dpm_table = NULL;
+	struct smu_11_0_dpm_context *dpm_context = NULL;
 
 	if (amdgpu_ras_intr_triggered())
 		return snprintf(buf, PAGE_SIZE, "unavailable\n");
 
-	dpm_table = smu_dpm->dpm_context;
+	dpm_context = smu_dpm->dpm_context;
 
 	switch (type) {
 	case SMU_SCLK:
@@ -841,7 +793,7 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 			return ret;
 		}
 
-		single_dpm_table = &(dpm_table->gfx_table);
+		single_dpm_table = &(dpm_context->dpm_tables.gfx_table);
 		ret = arcturus_get_clk_table(smu, &clocks, single_dpm_table);
 		if (ret) {
 			dev_err(smu->adev->dev, "Attempt to get gfx clk levels Failed!");
@@ -868,7 +820,7 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 			return ret;
 		}
 
-		single_dpm_table = &(dpm_table->mem_table);
+		single_dpm_table = &(dpm_context->dpm_tables.uclk_table);
 		ret = arcturus_get_clk_table(smu, &clocks, single_dpm_table);
 		if (ret) {
 			dev_err(smu->adev->dev, "Attempt to get memory clk levels Failed!");
@@ -891,7 +843,7 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 			return ret;
 		}
 
-		single_dpm_table = &(dpm_table->soc_table);
+		single_dpm_table = &(dpm_context->dpm_tables.soc_table);
 		ret = arcturus_get_clk_table(smu, &clocks, single_dpm_table);
 		if (ret) {
 			dev_err(smu->adev->dev, "Attempt to get socclk levels Failed!");
@@ -914,7 +866,7 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 			return ret;
 		}
 
-		single_dpm_table = &(dpm_table->fclk_table);
+		single_dpm_table = &(dpm_context->dpm_tables.fclk_table);
 		ret = arcturus_get_clk_table(smu, &clocks, single_dpm_table);
 		if (ret) {
 			dev_err(smu->adev->dev, "Attempt to get fclk levels Failed!");
@@ -937,20 +889,19 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 	return size;
 }
 
-static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
-				     uint32_t feature_mask)
+static int arcturus_upload_dpm_level(struct smu_context *smu,
+				     bool max,
+				     uint32_t feature_mask,
+				     uint32_t level)
 {
-	struct arcturus_single_dpm_table *single_dpm_table;
-	struct arcturus_dpm_table *dpm_table =
+	struct smu_11_0_dpm_context *dpm_context =
 			smu->smu_dpm.dpm_context;
 	uint32_t freq;
 	int ret = 0;
 
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT) &&
 	    (feature_mask & FEATURE_DPM_GFXCLK_MASK)) {
-		single_dpm_table = &(dpm_table->gfx_table);
-		freq = max ? single_dpm_table->dpm_state.soft_max_level :
-			single_dpm_table->dpm_state.soft_min_level;
+		freq = dpm_context->dpm_tables.gfx_table.dpm_levels[level].value;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
 			(PPCLK_GFXCLK << 16) | (freq & 0xffff),
@@ -964,9 +915,7 @@ static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
 
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT) &&
 	    (feature_mask & FEATURE_DPM_UCLK_MASK)) {
-		single_dpm_table = &(dpm_table->mem_table);
-		freq = max ? single_dpm_table->dpm_state.soft_max_level :
-			single_dpm_table->dpm_state.soft_min_level;
+		freq = dpm_context->dpm_tables.uclk_table.dpm_levels[level].value;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
 			(PPCLK_UCLK << 16) | (freq & 0xffff),
@@ -980,9 +929,7 @@ static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
 
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_SOCCLK_BIT) &&
 	    (feature_mask & FEATURE_DPM_SOCCLK_MASK)) {
-		single_dpm_table = &(dpm_table->soc_table);
-		freq = max ? single_dpm_table->dpm_state.soft_max_level :
-			single_dpm_table->dpm_state.soft_min_level;
+		freq = dpm_context->dpm_tables.soc_table.dpm_levels[level].value;
 		ret = smu_send_smc_msg_with_param(smu,
 			(max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
 			(PPCLK_SOCCLK << 16) | (freq & 0xffff),
@@ -1000,8 +947,8 @@ static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
 static int arcturus_force_clk_levels(struct smu_context *smu,
 			enum smu_clk_type type, uint32_t mask)
 {
-	struct arcturus_dpm_table *dpm_table;
-	struct arcturus_single_dpm_table *single_dpm_table;
+	struct smu_11_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
+	struct smu_11_0_dpm_table *single_dpm_table = NULL;
 	uint32_t soft_min_level, soft_max_level;
 	uint32_t smu_version;
 	int ret = 0;
@@ -1021,12 +968,9 @@ static int arcturus_force_clk_levels(struct smu_context *smu,
 	soft_min_level = mask ? (ffs(mask) - 1) : 0;
 	soft_max_level = mask ? (fls(mask) - 1) : 0;
 
-	dpm_table = smu->smu_dpm.dpm_context;
-
 	switch (type) {
 	case SMU_SCLK:
-		single_dpm_table = &(dpm_table->gfx_table);
-
+		single_dpm_table = &(dpm_context->dpm_tables.gfx_table);
 		if (soft_max_level >= single_dpm_table->count) {
 			dev_err(smu->adev->dev, "Clock level specified %d is over max allowed %d\n",
 					soft_max_level, single_dpm_table->count - 1);
@@ -1034,18 +978,19 @@ static int arcturus_force_clk_levels(struct smu_context *smu,
 			break;
 		}
 
-		single_dpm_table->dpm_state.soft_min_level =
-			single_dpm_table->dpm_levels[soft_min_level].value;
-		single_dpm_table->dpm_state.soft_max_level =
-			single_dpm_table->dpm_levels[soft_max_level].value;
-
-		ret = arcturus_upload_dpm_level(smu, false, FEATURE_DPM_GFXCLK_MASK);
+		ret = arcturus_upload_dpm_level(smu,
+						false,
+						FEATURE_DPM_GFXCLK_MASK,
+						soft_min_level);
 		if (ret) {
 			dev_err(smu->adev->dev, "Failed to upload boot level to lowest!\n");
 			break;
 		}
 
-		ret = arcturus_upload_dpm_level(smu, true, FEATURE_DPM_GFXCLK_MASK);
+		ret = arcturus_upload_dpm_level(smu,
+						true,
+						FEATURE_DPM_GFXCLK_MASK,
+						soft_max_level);
 		if (ret)
 			dev_err(smu->adev->dev, "Failed to upload dpm max level to highest!\n");
 
@@ -1256,8 +1201,7 @@ static int arcturus_get_fan_speed_percent(struct smu_context *smu,
 	return ret;
 }
 
-
-static uint32_t arcturus_find_lowest_dpm_level(struct arcturus_single_dpm_table *table)
+static uint32_t arcturus_find_lowest_dpm_level(struct smu_11_0_dpm_table *table)
 {
 	uint32_t i;
 
@@ -1274,7 +1218,7 @@ static uint32_t arcturus_find_lowest_dpm_level(struct arcturus_single_dpm_table
 }
 
 static uint32_t arcturus_find_highest_dpm_level(struct smu_context *smu,
-						struct arcturus_single_dpm_table *table)
+						struct smu_11_0_dpm_table *table)
 {
 	int i = 0;
 
@@ -1299,34 +1243,33 @@ static uint32_t arcturus_find_highest_dpm_level(struct smu_context *smu,
 	return i;
 }
 
-
-
 static int arcturus_force_dpm_limit_value(struct smu_context *smu, bool highest)
 {
-	struct arcturus_dpm_table *dpm_table =
-		(struct arcturus_dpm_table *)smu->smu_dpm.dpm_context;
+	struct smu_11_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
 	struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(smu->adev, 0);
 	uint32_t soft_level;
 	int ret = 0;
 
 	/* gfxclk */
 	if (highest)
-		soft_level = arcturus_find_highest_dpm_level(smu, &(dpm_table->gfx_table));
+		soft_level = arcturus_find_highest_dpm_level(smu, &(dpm_context->dpm_tables.gfx_table));
 	else
-		soft_level = arcturus_find_lowest_dpm_level(&(dpm_table->gfx_table));
+		soft_level = arcturus_find_lowest_dpm_level(&(dpm_context->dpm_tables.gfx_table));
 
-	dpm_table->gfx_table.dpm_state.soft_min_level =
-		dpm_table->gfx_table.dpm_state.soft_max_level =
-		dpm_table->gfx_table.dpm_levels[soft_level].value;
-
-	ret = arcturus_upload_dpm_level(smu, false, FEATURE_DPM_GFXCLK_MASK);
+	ret = arcturus_upload_dpm_level(smu,
+					false,
+					FEATURE_DPM_GFXCLK_MASK,
+					soft_level);
 	if (ret) {
 		dev_err(smu->adev->dev, "Failed to upload boot level to %s!\n",
 				highest ? "highest" : "lowest");
 		return ret;
 	}
 
-	ret = arcturus_upload_dpm_level(smu, true, FEATURE_DPM_GFXCLK_MASK);
+	ret = arcturus_upload_dpm_level(smu,
+					true,
+					FEATURE_DPM_GFXCLK_MASK,
+					soft_level);
 	if (ret) {
 		dev_err(smu->adev->dev, "Failed to upload dpm max level to %s!\n!",
 				highest ? "highest" : "lowest");
@@ -1345,27 +1288,29 @@ static int arcturus_force_dpm_limit_value(struct smu_context *smu, bool highest)
 
 static int arcturus_unforce_dpm_levels(struct smu_context *smu)
 {
-	struct arcturus_dpm_table *dpm_table =
-		(struct arcturus_dpm_table *)smu->smu_dpm.dpm_context;
+	struct smu_11_0_dpm_context *dpm_context =
+		(struct smu_11_0_dpm_context *)smu->smu_dpm.dpm_context;
 	struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(smu->adev, 0);
 	uint32_t soft_min_level, soft_max_level;
 	int ret = 0;
 
 	/* gfxclk */
-	soft_min_level = arcturus_find_lowest_dpm_level(&(dpm_table->gfx_table));
-	soft_max_level = arcturus_find_highest_dpm_level(smu, &(dpm_table->gfx_table));
-	dpm_table->gfx_table.dpm_state.soft_min_level =
-		dpm_table->gfx_table.dpm_levels[soft_min_level].value;
-	dpm_table->gfx_table.dpm_state.soft_max_level =
-		dpm_table->gfx_table.dpm_levels[soft_max_level].value;
-
-	ret = arcturus_upload_dpm_level(smu, false, FEATURE_DPM_GFXCLK_MASK);
+	soft_min_level = arcturus_find_lowest_dpm_level(&(dpm_context->dpm_tables.gfx_table));
+	soft_max_level = arcturus_find_highest_dpm_level(smu, &(dpm_context->dpm_tables.gfx_table));
+
+	ret = arcturus_upload_dpm_level(smu,
+					false,
+					FEATURE_DPM_GFXCLK_MASK,
+					soft_min_level);
 	if (ret) {
 		dev_err(smu->adev->dev, "Failed to upload DPM Bootup Levels!");
 		return ret;
 	}
 
-	ret = arcturus_upload_dpm_level(smu, true, FEATURE_DPM_GFXCLK_MASK);
+	ret = arcturus_upload_dpm_level(smu,
+					true,
+					FEATURE_DPM_GFXCLK_MASK,
+					soft_max_level);
 	if (ret) {
 		dev_err(smu->adev->dev, "Failed to upload DPM Max Levels!");
 		return ret;
@@ -1388,18 +1333,15 @@ arcturus_get_profiling_clk_mask(struct smu_context *smu,
 				uint32_t *mclk_mask,
 				uint32_t *soc_mask)
 {
-	struct arcturus_dpm_table *dpm_table =
-		(struct arcturus_dpm_table *)smu->smu_dpm.dpm_context;
-	struct arcturus_single_dpm_table *gfx_dpm_table;
-	struct arcturus_single_dpm_table *mem_dpm_table;
-	struct arcturus_single_dpm_table *soc_dpm_table;
+	struct smu_11_0_dpm_context *dpm_context =
+		(struct smu_11_0_dpm_context *)smu->smu_dpm.dpm_context;
+	struct smu_11_0_dpm_table *gfx_dpm_table;
+	struct smu_11_0_dpm_table *mem_dpm_table;
+	struct smu_11_0_dpm_table *soc_dpm_table;
 
-	if (!smu->smu_dpm.dpm_context)
-		return -EINVAL;
-
-	gfx_dpm_table = &dpm_table->gfx_table;
-	mem_dpm_table = &dpm_table->mem_table;
-	soc_dpm_table = &dpm_table->soc_table;
+	gfx_dpm_table = &dpm_context->dpm_tables.gfx_table;
+	mem_dpm_table = &dpm_context->dpm_tables.uclk_table;
+	soc_dpm_table = &dpm_context->dpm_tables.soc_table;
 
 	*sclk_mask = 0;
 	*mclk_mask = 0;
@@ -2153,7 +2095,6 @@ static int arcturus_dpm_set_vcn_enable(struct smu_context *smu, bool enable)
 	return ret;
 }
 
-
 static void arcturus_fill_eeprom_i2c_req(SwI2cRequest_t  *req, bool write,
 				  uint8_t address, uint32_t numbytes,
 				  uint8_t *data)
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

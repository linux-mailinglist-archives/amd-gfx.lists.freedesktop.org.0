Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E601EF601
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jun 2020 13:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10DD6E8C7;
	Fri,  5 Jun 2020 11:02:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8B6E8BE
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2020 11:02:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z772vRSPq2r/8cIlruEyfW+oEcq4l94u+TTRp+mXFjNg30aGNL6AFMVcDtMkrQo2mAON9GmXP2zT0bybHuQGr4oQEMhhFrpDY30nAzilwfZT+s5YJRMas0/pFPkc6eNbgWLnu9KiJKstB6oeID8QgIlAeRrrnfB29TQKXMUjVRIIwnwF5ypQhgIgNLb06D7fMI1JutEEGqsF6xPJHrxdq0g22pwRodA0pRZUSfYICnr1UnAI58p49TD6X7lFARLlNUVR0eJ/ll/XNhTrAXSfNkXLMzAAQezFYcGRf+bRkkQARlVfU3kUioa05CkQwIhs72Kgjz2ivDkzW3RM9+ckpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTWeVjDOgjw8lfzxkTahnY/2uTXu9AlXt1M/4k0WJo4=;
 b=aWBPgIypUvwAe3Yk0FOOEZfL7AgTLyiQRMF6C4KO9UnfGhgQ+crmXvmFywwF7jK97lwPICfXQbekpacpinIgcrwz5aC8VK4VMTig0M0zzNnyHbAUfJS4K4LD15bev3chf/bOEC4twk9tICVlu66cPTRH7Zl/tpyd/h1VITaR4CSG2LvUaw4qX+KvEGwO1SJ3Gqlh42Cr+lx5Ch5XJNPnCkeSRT6v0relEuJiAyudWp9zM3CCH+hRq4bp7+OujzqegTPSFRLvjVoXHimeh426OzB6VM5Pxkiccsr/sM3NOk+8sTCMPweAZad0Lq9sRbmiQchnDDnaIHjVtVAwgLtspw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTWeVjDOgjw8lfzxkTahnY/2uTXu9AlXt1M/4k0WJo4=;
 b=F1ypCpGn0yec+XOl+tHNnksBNaCbFSJ2X7LD7KrgbXQ5vYCK8xskCM7Ro2MtUWVqDrGC4H6jpEFahBwsBjxo3+k/bi51/gDu1eY01Qg/8JKaEhtInshFMIotLt+aYG766mUChKGdOFbZ2QQdRluFJzySflq/iJSbvbWpgigCY8o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB2615.namprd12.prod.outlook.com (2603:10b6:a03:61::29)
 by BYASPR01MB2.namprd12.prod.outlook.com (2603:10b6:a02:ce::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 11:02:36 +0000
Received: from BYAPR12MB2615.namprd12.prod.outlook.com
 ([fe80::4c16:1697:3e6d:9157]) by BYAPR12MB2615.namprd12.prod.outlook.com
 ([fe80::4c16:1697:3e6d:9157%7]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 11:02:36 +0000
From: Evan Quan <evan.quan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amd/powerplay: use MGPU friendly err/warn/info/dbg
 messages
Date: Fri,  5 Jun 2020 19:01:58 +0800
Message-Id: <20200605110200.27206-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.27.0
X-ClientProxiedBy: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To BYAPR12MB2615.namprd12.prod.outlook.com
 (2603:10b6:a03:61::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from equan-buildpc.amd.com (58.247.170.242) by
 HK2PR03CA0050.apcprd03.prod.outlook.com (2603:1096:202:17::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.7 via Frontend Transport; Fri, 5 Jun 2020 11:02:34 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5bd9e324-d107-4ab1-c3da-08d8093ff3ee
X-MS-TrafficTypeDiagnostic: BYASPR01MB2:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYASPR01MB23ABA490ADA5D35B2AFC4E4860@BYASPR01MB2.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: opj3D7KAEZRJyA9kH0+AsmvygfYKq+DnJyA6OlkisbSIPOeihMHEazTEN+iv424XaoKq4wLUO7qXRHrdmvMKCqVbBBDPdjDpZlIKy+2Wsc1lddBafy+wW8qJC73+OCJJEfZXJYHS0loj/GGIscyff5sFV567mSG1GAo4lBnM5N3SKYUM17e9k4uVKCEgaatBRRHvvwVsRcKMCejiKOVnxM68cEDmw9REfvBu6RQ/hZcuib6b0ZUF7EoJMm3naubdoAuK2CCrBrg0N8+QHvQ+aXbZ7nPB1MiyKM5xZI9VKs+g+i8+T39HpNg8uD+laGQj89of7H7ae3atuKvbgwDi/0Pf1uKm59F1V7w5ktUyfv0PU7+XlnNgbtatNllL4Eam
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(4326008)(8676002)(15650500001)(83380400001)(2616005)(1076003)(956004)(8936002)(6486002)(186003)(6666004)(6916009)(2906002)(16526019)(478600001)(66556008)(66946007)(26005)(36756003)(66476007)(5660300002)(52116002)(86362001)(66574014)(30864003)(316002)(7696005)(44832011)(579004)(559001)(44824005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nYcmuisVJGlP5qv5S2SExMxSwZRn2AGTBb0JkXl3oVK7MMF4ml/tXqmzrjuNcig8u9f+NWnkqWQLYMDIlDZQUDAEwvKfa10NpF403Ny6V9s6MYP8t/Pl9Q6CvuTBCodZaP6He0kFUxRdk5w0BZB7qmyEcOh8K8jjFBsqbQdtSwmRkKURwAhZayr56oHaJUI35e/OnSvEFuTcAbFU2z5OBkzYI8qIBkmXZwCMnQZQ9dSWi3dZ9QTq2Qez8Y9robrEH0MFPxq4EwVo3kRNyS2ywvnjmACKKFAdggEcAPpLZdII3zAMRfG/4oS5dSJqkm99OXvOQ7i2iz9/r19N+iE6lPAdzIuPOu7l7ugQ9HGZLZ9Jn81e+7Y3arDLIkrGA97WGyFbbIatB/VEk5XBjI2VcaUFdc57WRQD2z7eeiu0VRBTgRPFwsoG31FQrBaFz9gOL264P6dzQA2pYp63K7UOCD3wv33ISagYyhA/RgxvORHpbRjbuj8yo1NhHGUAsvL/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd9e324-d107-4ab1-c3da-08d8093ff3ee
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 11:02:36.1115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/OAQBodj1L7bqd85zlX6m3Z0fuzGvOqIWrW+uqQNJf0/D+rZhenVMJtpXfsvE5n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB2
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

Use dev_err/warn/info/dbg instead of pr_err/warn/info/debug.

Change-Id: I9d46a1fb636e273cc64c4a6e3fd26ec8294caf94
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    |  70 +-
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c  | 527 ++++++------
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c    | 119 +--
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c    |  14 +-
 .../drm/amd/powerplay/sienna_cichlid_ppt.c    | 784 +++++++++---------
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     |  52 +-
 drivers/gpu/drm/amd/powerplay/smu_v12_0.c     |  14 +-
 7 files changed, 793 insertions(+), 787 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 4fb9aac729a4..30302ac37046 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -609,7 +609,7 @@ int smu_sys_set_pp_table(struct smu_context *smu,  void *buf, size_t size)
 		return -EOPNOTSUPP;
 
 	if (header->usStructureSize != size) {
-		pr_err("pp table size not matched !\n");
+		dev_err(smu->adev->dev, "pp table size not matched !\n");
 		return -EIO;
 	}
 
@@ -633,7 +633,7 @@ int smu_sys_set_pp_table(struct smu_context *smu,  void *buf, size_t size)
 
 	ret = smu_reset(smu);
 	if (ret)
-		pr_info("smu reset failed, ret = %d\n", ret);
+		dev_info(smu->adev->dev, "smu reset failed, ret = %d\n", ret);
 
 	smu->uploading_custom_pp_table = false;
 
@@ -847,7 +847,7 @@ static int smu_init_fb_allocations(struct smu_context *smu)
 					      &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
 					      &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
 		if (ret) {
-			pr_err("VRAM allocation for tool table failed!\n");
+			dev_err(adev->dev, "VRAM allocation for tool table failed!\n");
 			return ret;
 		}
 	}
@@ -876,7 +876,7 @@ static int smu_init_fb_allocations(struct smu_context *smu)
 				      &driver_table->mc_address,
 				      &driver_table->cpu_addr);
 	if (ret) {
-		pr_err("VRAM allocation for driver table failed!\n");
+		dev_err(adev->dev, "VRAM allocation for driver table failed!\n");
 		if (tables[SMU_TABLE_PMSTATUSLOG].mc_address)
 			amdgpu_bo_free_kernel(&tables[SMU_TABLE_PMSTATUSLOG].bo,
 					      &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
@@ -979,7 +979,7 @@ static int smu_smc_table_sw_init(struct smu_context *smu)
 	 */
 	ret = smu_init_smc_tables(smu);
 	if (ret) {
-		pr_err("Failed to init smc tables!\n");
+		dev_err(smu->adev->dev, "Failed to init smc tables!\n");
 		return ret;
 	}
 
@@ -989,7 +989,7 @@ static int smu_smc_table_sw_init(struct smu_context *smu)
 	 */
 	ret = smu_init_power(smu);
 	if (ret) {
-		pr_err("Failed to init smu_init_power!\n");
+		dev_err(smu->adev->dev, "Failed to init smu_init_power!\n");
 		return ret;
 	}
 
@@ -1021,13 +1021,13 @@ static int smu_smc_table_sw_fini(struct smu_context *smu)
 
 	ret = smu_fini_power(smu);
 	if (ret) {
-		pr_err("Failed to init smu_fini_power!\n");
+		dev_err(smu->adev->dev, "Failed to init smu_fini_power!\n");
 		return ret;
 	}
 
 	ret = smu_fini_smc_tables(smu);
 	if (ret) {
-		pr_err("Failed to smu_fini_smc_tables!\n");
+		dev_err(smu->adev->dev, "Failed to smu_fini_smc_tables!\n");
 		return ret;
 	}
 
@@ -1090,19 +1090,19 @@ static int smu_sw_init(void *handle)
 	smu->smu_dpm.requested_dpm_level = AMD_DPM_FORCED_LEVEL_AUTO;
 	ret = smu_init_microcode(smu);
 	if (ret) {
-		pr_err("Failed to load smu firmware!\n");
+		dev_err(adev->dev, "Failed to load smu firmware!\n");
 		return ret;
 	}
 
 	ret = smu_smc_table_sw_init(smu);
 	if (ret) {
-		pr_err("Failed to sw init smc table!\n");
+		dev_err(adev->dev, "Failed to sw init smc table!\n");
 		return ret;
 	}
 
 	ret = smu_register_irq_handler(smu);
 	if (ret) {
-		pr_err("Failed to register smc irq handler!\n");
+		dev_err(adev->dev, "Failed to register smc irq handler!\n");
 		return ret;
 	}
 
@@ -1117,7 +1117,7 @@ static int smu_sw_fini(void *handle)
 
 	ret = smu_smc_table_sw_fini(smu);
 	if (ret) {
-		pr_err("Failed to sw fini smc table!\n");
+		dev_err(adev->dev, "Failed to sw fini smc table!\n");
 		return ret;
 	}
 
@@ -1132,7 +1132,7 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 	int ret;
 
 	if (smu_is_dpm_running(smu) && adev->in_suspend) {
-		pr_info("dpm has been enabled\n");
+		dev_info(adev->dev, "dpm has been enabled\n");
 		return 0;
 	}
 
@@ -1182,7 +1182,7 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 		return ret;
 
 	if (!smu_is_dpm_running(smu))
-		pr_info("dpm has been disabled\n");
+		dev_info(adev->dev, "dpm has been disabled\n");
 
 	ret = smu_override_pcie_parameters(smu);
 	if (ret)
@@ -1198,7 +1198,7 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 
 	ret = smu_disable_umc_cdr_12gbps_workaround(smu);
 	if (ret) {
-		pr_err("Workaround failed to disable UMC CDR feature on 12Gbps SKU!\n");
+		dev_err(adev->dev, "Workaround failed to disable UMC CDR feature on 12Gbps SKU!\n");
 		return ret;
 	}
 
@@ -1210,7 +1210,7 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 				   adev->pm.ac_power ? SMU_POWER_SOURCE_AC :
 				   SMU_POWER_SOURCE_DC);
 	if (ret) {
-		pr_err("Failed to switch to %s mode!\n", adev->pm.ac_power ? "AC" : "DC");
+		dev_err(adev->dev, "Failed to switch to %s mode!\n", adev->pm.ac_power ? "AC" : "DC");
 		return ret;
 	}
 
@@ -1247,7 +1247,7 @@ static int smu_start_smc_engine(struct smu_context *smu)
 	if (smu->ppt_funcs->check_fw_status) {
 		ret = smu->ppt_funcs->check_fw_status(smu);
 		if (ret) {
-			pr_err("SMC is not ready\n");
+			dev_err(adev->dev, "SMC is not ready\n");
 			return ret;
 		}
 	}
@@ -1274,7 +1274,7 @@ static int smu_hw_init(void *handle)
 
 	ret = smu_start_smc_engine(smu);
 	if (ret) {
-		pr_err("SMU is not ready yet!\n");
+		dev_err(adev->dev, "SMU is not ready yet!\n");
 		return ret;
 	}
 
@@ -1307,7 +1307,7 @@ static int smu_hw_init(void *handle)
 
 	adev->pm.dpm_enabled = true;
 
-	pr_info("SMU is initialized successfully!\n");
+	dev_info(adev->dev, "SMU is initialized successfully!\n");
 
 	return 0;
 
@@ -1360,11 +1360,11 @@ static int smu_disable_dpms(struct smu_context *smu)
 						      features_to_disable,
 						      0);
 		if (ret)
-			pr_err("Failed to disable smu features except BACO.\n");
+			dev_err(adev->dev, "Failed to disable smu features except BACO.\n");
 	} else {
 		ret = smu_system_features_control(smu, false);
 		if (ret)
-			pr_err("Failed to disable smu features.\n");
+			dev_err(adev->dev, "Failed to disable smu features.\n");
 	}
 
 	if (adev->asic_type >= CHIP_NAVI10 &&
@@ -1385,7 +1385,7 @@ static int smu_smc_hw_cleanup(struct smu_context *smu)
 
 	ret = smu_disable_thermal_alert(smu);
 	if (ret) {
-		pr_warn("Fail to stop thermal control!\n");
+		dev_warn(adev->dev, "Fail to stop thermal control!\n");
 		return ret;
 	}
 
@@ -1479,11 +1479,11 @@ static int smu_resume(void *handle)
 	if (!smu->pm_enabled)
 		return 0;
 
-	pr_info("SMU is resuming...\n");
+	dev_info(adev->dev, "SMU is resuming...\n");
 
 	ret = smu_start_smc_engine(smu);
 	if (ret) {
-		pr_err("SMU is not ready yet!\n");
+		dev_err(adev->dev, "SMU is not ready yet!\n");
 		goto failed;
 	}
 
@@ -1498,7 +1498,7 @@ static int smu_resume(void *handle)
 
 	adev->pm.dpm_enabled = true;
 
-	pr_info("SMU is resumed successfully!\n");
+	dev_info(adev->dev, "SMU is resumed successfully!\n");
 
 	return 0;
 
@@ -1591,7 +1591,7 @@ int smu_get_current_clocks(struct smu_context *smu,
 		ret = smu_get_clock_info(smu, &hw_clocks, PERF_LEVEL_ACTIVITY);
 
 	if (ret) {
-		pr_err("Error in smu_get_clock_info\n");
+		dev_err(smu->adev->dev, "Error in smu_get_clock_info\n");
 		goto failed;
 	}
 
@@ -1687,21 +1687,21 @@ int smu_adjust_power_state_dynamic(struct smu_context *smu,
 	if (!skip_display_settings) {
 		ret = smu_display_config_changed(smu);
 		if (ret) {
-			pr_err("Failed to change display config!");
+			dev_err(smu->adev->dev, "Failed to change display config!");
 			return ret;
 		}
 	}
 
 	ret = smu_apply_clocks_adjust_rules(smu);
 	if (ret) {
-		pr_err("Failed to apply clocks adjust rules!");
+		dev_err(smu->adev->dev, "Failed to apply clocks adjust rules!");
 		return ret;
 	}
 
 	if (!skip_display_settings) {
 		ret = smu_notify_smc_display_config(smu);
 		if (ret) {
-			pr_err("Failed to notify smc display config!");
+			dev_err(smu->adev->dev, "Failed to notify smc display config!");
 			return ret;
 		}
 	}
@@ -1709,7 +1709,7 @@ int smu_adjust_power_state_dynamic(struct smu_context *smu,
 	if (smu_dpm_ctx->dpm_level != level) {
 		ret = smu_asic_set_performance_level(smu, level);
 		if (ret) {
-			pr_err("Failed to set performance level!");
+			dev_err(smu->adev->dev, "Failed to set performance level!");
 			return ret;
 		}
 
@@ -1875,7 +1875,7 @@ int smu_force_clk_levels(struct smu_context *smu,
 		return -EOPNOTSUPP;
 
 	if (smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_MANUAL) {
-		pr_debug("force clock level is for dpm manual mode only.\n");
+		dev_dbg(smu->adev->dev, "force clock level is for dpm manual mode only.\n");
 		return -EINVAL;
 	}
 
@@ -1933,7 +1933,7 @@ int smu_set_mp1_state(struct smu_context *smu,
 
 	ret = smu_send_smc_msg(smu, msg, NULL);
 	if (ret)
-		pr_err("[PrepareMp1] Failed!\n");
+		dev_err(smu->adev->dev, "[PrepareMp1] Failed!\n");
 
 	mutex_unlock(&smu->mutex);
 
@@ -1955,7 +1955,7 @@ int smu_set_df_cstate(struct smu_context *smu,
 
 	ret = smu->ppt_funcs->set_df_cstate(smu, state);
 	if (ret)
-		pr_err("[SetDfCstate] failed!\n");
+		dev_err(smu->adev->dev, "[SetDfCstate] failed!\n");
 
 	mutex_unlock(&smu->mutex);
 
@@ -1976,7 +1976,7 @@ int smu_allow_xgmi_power_down(struct smu_context *smu, bool en)
 
 	ret = smu->ppt_funcs->allow_xgmi_power_down(smu, en);
 	if (ret)
-		pr_err("[AllowXgmiPowerDown] failed!\n");
+		dev_err(smu->adev->dev, "[AllowXgmiPowerDown] failed!\n");
 
 	mutex_unlock(&smu->mutex);
 
@@ -2042,7 +2042,7 @@ int smu_set_ac_dc(struct smu_context *smu)
 				   smu->adev->pm.ac_power ? SMU_POWER_SOURCE_AC :
 				   SMU_POWER_SOURCE_DC);
 	if (ret)
-		pr_err("Failed to switch to %s mode!\n",
+		dev_err(smu->adev->dev, "Failed to switch to %s mode!\n",
 		       smu->adev->pm.ac_power ? "AC" : "DC");
 	mutex_unlock(&smu->mutex);
 
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index 6f859a370c5f..c6c20699884f 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -225,7 +225,7 @@ static int arcturus_get_smu_clk_index(struct smu_context *smc, uint32_t index)
 
 	mapping = arcturus_clk_map[index];
 	if (!(mapping.valid_mapping)) {
-		pr_warn("Unsupported SMU clk: %d\n", index);
+		dev_warn(smc->adev->dev, "Unsupported SMU clk: %d\n", index);
 		return -EINVAL;
 	}
 
@@ -256,7 +256,7 @@ static int arcturus_get_smu_table_index(struct smu_context *smc, uint32_t index)
 
 	mapping = arcturus_table_map[index];
 	if (!(mapping.valid_mapping)) {
-		pr_warn("Unsupported SMU table: %d\n", index);
+		dev_warn(smc->adev->dev, "Unsupported SMU table: %d\n", index);
 		return -EINVAL;
 	}
 
@@ -272,7 +272,7 @@ static int arcturus_get_pwr_src_index(struct smu_context *smc, uint32_t index)
 
 	mapping = arcturus_pwr_src_map[index];
 	if (!(mapping.valid_mapping)) {
-		pr_warn("Unsupported SMU power source: %d\n", index);
+		dev_warn(smc->adev->dev, "Unsupported SMU power source: %d\n", index);
 		return -EINVAL;
 	}
 
@@ -383,7 +383,7 @@ arcturus_set_single_dpm_table(struct smu_context *smu,
 			(clk_id << 16 | 0xFF),
 			&num_of_levels);
 	if (ret) {
-		pr_err("[%s] failed to get dpm levels!\n", __func__);
+		dev_err(smu->adev->dev, "[%s] failed to get dpm levels!\n", __func__);
 		return ret;
 	}
 
@@ -394,7 +394,7 @@ arcturus_set_single_dpm_table(struct smu_context *smu,
 				(clk_id << 16 | i),
 				&clk);
 		if (ret) {
-			pr_err("[%s] failed to get dpm freq by index!\n", __func__);
+			dev_err(smu->adev->dev, "[%s] failed to get dpm freq by index!\n", __func__);
 			return ret;
 		}
 		single_dpm_table->dpm_levels[i].value = clk;
@@ -427,7 +427,7 @@ static int arcturus_set_default_dpm_table(struct smu_context *smu)
 		ret = arcturus_set_single_dpm_table(smu, single_dpm_table,
 						  PPCLK_SOCCLK);
 		if (ret) {
-			pr_err("[%s] failed to get socclk dpm levels!\n", __func__);
+			dev_err(smu->adev->dev, "[%s] failed to get socclk dpm levels!\n", __func__);
 			return ret;
 		}
 	} else {
@@ -442,7 +442,7 @@ static int arcturus_set_default_dpm_table(struct smu_context *smu)
 		ret = arcturus_set_single_dpm_table(smu, single_dpm_table,
 						  PPCLK_GFXCLK);
 		if (ret) {
-			pr_err("[SetupDefaultDpmTable] failed to get gfxclk dpm levels!");
+			dev_err(smu->adev->dev, "[SetupDefaultDpmTable] failed to get gfxclk dpm levels!");
 			return ret;
 		}
 	} else {
@@ -457,7 +457,7 @@ static int arcturus_set_default_dpm_table(struct smu_context *smu)
 		ret = arcturus_set_single_dpm_table(smu, single_dpm_table,
 						  PPCLK_UCLK);
 		if (ret) {
-			pr_err("[SetupDefaultDpmTable] failed to get memclk dpm levels!");
+			dev_err(smu->adev->dev, "[SetupDefaultDpmTable] failed to get memclk dpm levels!");
 			return ret;
 		}
 	} else {
@@ -472,7 +472,7 @@ static int arcturus_set_default_dpm_table(struct smu_context *smu)
 		ret = arcturus_set_single_dpm_table(smu, single_dpm_table,
 						  PPCLK_FCLK);
 		if (ret) {
-			pr_err("[SetupDefaultDpmTable] failed to get fclk dpm levels!");
+			dev_err(smu->adev->dev, "[SetupDefaultDpmTable] failed to get fclk dpm levels!");
 			return ret;
 		}
 	} else {
@@ -533,7 +533,7 @@ static int arcturus_append_powerplay_table(struct smu_context *smu)
 	if (ret)
 		return ret;
 
-	pr_info("smc_dpm_info table revision(format.content): %d.%d\n",
+	dev_info(smu->adev->dev, "smc_dpm_info table revision(format.content): %d.%d\n",
 			smc_dpm_table->table_header.format_revision,
 			smc_dpm_table->table_header.content_revision);
 
@@ -575,7 +575,7 @@ static int arcturus_run_btc(struct smu_context *smu)
 
 	ret = smu_send_smc_msg(smu, SMU_MSG_RunAfllBtc, NULL);
 	if (ret) {
-		pr_err("RunAfllBtc failed!\n");
+		dev_err(smu->adev->dev, "RunAfllBtc failed!\n");
 		return ret;
 	}
 
@@ -651,14 +651,14 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 	case SMU_SCLK:
 		ret = smu_get_current_clk_freq(smu, SMU_GFXCLK, &now);
 		if (ret) {
-			pr_err("Attempt to get current gfx clk Failed!");
+			dev_err(smu->adev->dev, "Attempt to get current gfx clk Failed!");
 			return ret;
 		}
 
 		single_dpm_table = &(dpm_table->gfx_table);
 		ret = arcturus_get_clk_table(smu, &clocks, single_dpm_table);
 		if (ret) {
-			pr_err("Attempt to get gfx clk levels Failed!");
+			dev_err(smu->adev->dev, "Attempt to get gfx clk levels Failed!");
 			return ret;
 		}
 
@@ -678,14 +678,14 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 	case SMU_MCLK:
 		ret = smu_get_current_clk_freq(smu, SMU_UCLK, &now);
 		if (ret) {
-			pr_err("Attempt to get current mclk Failed!");
+			dev_err(smu->adev->dev, "Attempt to get current mclk Failed!");
 			return ret;
 		}
 
 		single_dpm_table = &(dpm_table->mem_table);
 		ret = arcturus_get_clk_table(smu, &clocks, single_dpm_table);
 		if (ret) {
-			pr_err("Attempt to get memory clk levels Failed!");
+			dev_err(smu->adev->dev, "Attempt to get memory clk levels Failed!");
 			return ret;
 		}
 
@@ -701,14 +701,14 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 	case SMU_SOCCLK:
 		ret = smu_get_current_clk_freq(smu, SMU_SOCCLK, &now);
 		if (ret) {
-			pr_err("Attempt to get current socclk Failed!");
+			dev_err(smu->adev->dev, "Attempt to get current socclk Failed!");
 			return ret;
 		}
 
 		single_dpm_table = &(dpm_table->soc_table);
 		ret = arcturus_get_clk_table(smu, &clocks, single_dpm_table);
 		if (ret) {
-			pr_err("Attempt to get socclk levels Failed!");
+			dev_err(smu->adev->dev, "Attempt to get socclk levels Failed!");
 			return ret;
 		}
 
@@ -724,14 +724,14 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
 	case SMU_FCLK:
 		ret = smu_get_current_clk_freq(smu, SMU_FCLK, &now);
 		if (ret) {
-			pr_err("Attempt to get current fclk Failed!");
+			dev_err(smu->adev->dev, "Attempt to get current fclk Failed!");
 			return ret;
 		}
 
 		single_dpm_table = &(dpm_table->fclk_table);
 		ret = arcturus_get_clk_table(smu, &clocks, single_dpm_table);
 		if (ret) {
-			pr_err("Attempt to get fclk levels Failed!");
+			dev_err(smu->adev->dev, "Attempt to get fclk levels Failed!");
 			return ret;
 		}
 
@@ -770,7 +770,7 @@ static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
 			(PPCLK_GFXCLK << 16) | (freq & 0xffff),
 			NULL);
 		if (ret) {
-			pr_err("Failed to set soft %s gfxclk !\n",
+			dev_err(smu->adev->dev, "Failed to set soft %s gfxclk !\n",
 						max ? "max" : "min");
 			return ret;
 		}
@@ -786,7 +786,7 @@ static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
 			(PPCLK_UCLK << 16) | (freq & 0xffff),
 			NULL);
 		if (ret) {
-			pr_err("Failed to set soft %s memclk !\n",
+			dev_err(smu->adev->dev, "Failed to set soft %s memclk !\n",
 						max ? "max" : "min");
 			return ret;
 		}
@@ -802,7 +802,7 @@ static int arcturus_upload_dpm_level(struct smu_context *smu, bool max,
 			(PPCLK_SOCCLK << 16) | (freq & 0xffff),
 			NULL);
 		if (ret) {
-			pr_err("Failed to set soft %s socclk !\n",
+			dev_err(smu->adev->dev, "Failed to set soft %s socclk !\n",
 						max ? "max" : "min");
 			return ret;
 		}
@@ -822,12 +822,12 @@ static int arcturus_force_clk_levels(struct smu_context *smu,
 
 	ret = smu_get_smc_version(smu, NULL, &smu_version);
 	if (ret) {
-		pr_err("Failed to get smu version!\n");
+		dev_err(smu->adev->dev, "Failed to get smu version!\n");
 		return ret;
 	}
 
 	if (smu_version >= 0x361200) {
-		pr_err("Forcing clock level is not supported with "
+		dev_err(smu->adev->dev, "Forcing clock level is not supported with "
 		       "54.18 and onwards SMU firmwares\n");
 		return -EOPNOTSUPP;
 	}
@@ -842,7 +842,7 @@ static int arcturus_force_clk_levels(struct smu_context *smu,
 		single_dpm_table = &(dpm_table->gfx_table);
 
 		if (soft_max_level >= single_dpm_table->count) {
-			pr_err("Clock level specified %d is over max allowed %d\n",
+			dev_err(smu->adev->dev, "Clock level specified %d is over max allowed %d\n",
 					soft_max_level, single_dpm_table->count - 1);
 			ret = -EINVAL;
 			break;
@@ -855,13 +855,13 @@ static int arcturus_force_clk_levels(struct smu_context *smu,
 
 		ret = arcturus_upload_dpm_level(smu, false, FEATURE_DPM_GFXCLK_MASK);
 		if (ret) {
-			pr_err("Failed to upload boot level to lowest!\n");
+			dev_err(smu->adev->dev, "Failed to upload boot level to lowest!\n");
 			break;
 		}
 
 		ret = arcturus_upload_dpm_level(smu, true, FEATURE_DPM_GFXCLK_MASK);
 		if (ret)
-			pr_err("Failed to upload dpm max level to highest!\n");
+			dev_err(smu->adev->dev, "Failed to upload dpm max level to highest!\n");
 
 		break;
 
@@ -924,7 +924,7 @@ static int arcturus_get_smu_metrics_data(struct smu_context *smu,
 				       smu_table->metrics_table,
 				       false);
 		if (ret) {
-			pr_info("Failed to export SMU metrics table!\n");
+			dev_info(smu->adev->dev, "Failed to export SMU metrics table!\n");
 			mutex_unlock(&smu->metrics_lock);
 			return ret;
 		}
@@ -1038,7 +1038,7 @@ static int arcturus_get_current_activity_percent(struct smu_context *smu,
 						    value);
 		break;
 	default:
-		pr_err("Invalid sensor for retrieving clock activity\n");
+		dev_err(smu->adev->dev, "Invalid sensor for retrieving clock activity\n");
 		return -EINVAL;
 	}
 
@@ -1081,7 +1081,7 @@ static int arcturus_thermal_get_temperature(struct smu_context *smu,
 						    value);
 		break;
 	default:
-		pr_err("Invalid sensor for retrieving temp\n");
+		dev_err(smu->adev->dev, "Invalid sensor for retrieving temp\n");
 		return -EINVAL;
 	}
 
@@ -1244,16 +1244,17 @@ static uint32_t arcturus_find_lowest_dpm_level(struct arcturus_single_dpm_table
 	return i;
 }
 
-static uint32_t arcturus_find_highest_dpm_level(struct arcturus_single_dpm_table *table)
+static uint32_t arcturus_find_highest_dpm_level(struct smu_context *smu,
+						struct arcturus_single_dpm_table *table)
 {
 	int i = 0;
 
 	if (table->count <= 0) {
-		pr_err("[%s] DPM Table has no entry!", __func__);
+		dev_err(smu->adev->dev, "[%s] DPM Table has no entry!", __func__);
 		return 0;
 	}
 	if (table->count > MAX_DPM_NUMBER) {
-		pr_err("[%s] DPM Table has too many entries!", __func__);
+		dev_err(smu->adev->dev, "[%s] DPM Table has too many entries!", __func__);
 		return MAX_DPM_NUMBER - 1;
 	}
 
@@ -1281,7 +1282,7 @@ static int arcturus_force_dpm_limit_value(struct smu_context *smu, bool highest)
 
 	/* gfxclk */
 	if (highest)
-		soft_level = arcturus_find_highest_dpm_level(&(dpm_table->gfx_table));
+		soft_level = arcturus_find_highest_dpm_level(smu, &(dpm_table->gfx_table));
 	else
 		soft_level = arcturus_find_lowest_dpm_level(&(dpm_table->gfx_table));
 
@@ -1291,14 +1292,14 @@ static int arcturus_force_dpm_limit_value(struct smu_context *smu, bool highest)
 
 	ret = arcturus_upload_dpm_level(smu, false, FEATURE_DPM_GFXCLK_MASK);
 	if (ret) {
-		pr_err("Failed to upload boot level to %s!\n",
+		dev_err(smu->adev->dev, "Failed to upload boot level to %s!\n",
 				highest ? "highest" : "lowest");
 		return ret;
 	}
 
 	ret = arcturus_upload_dpm_level(smu, true, FEATURE_DPM_GFXCLK_MASK);
 	if (ret) {
-		pr_err("Failed to upload dpm max level to %s!\n!",
+		dev_err(smu->adev->dev, "Failed to upload dpm max level to %s!\n!",
 				highest ? "highest" : "lowest");
 		return ret;
 	}
@@ -1323,7 +1324,7 @@ static int arcturus_unforce_dpm_levels(struct smu_context *smu)
 
 	/* gfxclk */
 	soft_min_level = arcturus_find_lowest_dpm_level(&(dpm_table->gfx_table));
-	soft_max_level = arcturus_find_highest_dpm_level(&(dpm_table->gfx_table));
+	soft_max_level = arcturus_find_highest_dpm_level(smu, &(dpm_table->gfx_table));
 	dpm_table->gfx_table.dpm_state.soft_min_level =
 		dpm_table->gfx_table.dpm_levels[soft_min_level].value;
 	dpm_table->gfx_table.dpm_state.soft_max_level =
@@ -1331,13 +1332,13 @@ static int arcturus_unforce_dpm_levels(struct smu_context *smu)
 
 	ret = arcturus_upload_dpm_level(smu, false, FEATURE_DPM_GFXCLK_MASK);
 	if (ret) {
-		pr_err("Failed to upload DPM Bootup Levels!");
+		dev_err(smu->adev->dev, "Failed to upload DPM Bootup Levels!");
 		return ret;
 	}
 
 	ret = arcturus_upload_dpm_level(smu, true, FEATURE_DPM_GFXCLK_MASK);
 	if (ret) {
-		pr_err("Failed to upload DPM Max Levels!");
+		dev_err(smu->adev->dev, "Failed to upload DPM Max Levels!");
 		return ret;
 	}
 
@@ -1414,13 +1415,13 @@ static int arcturus_get_power_limit(struct smu_context *smu,
 			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetPptLimit,
 				power_src << 16, &asic_default_power_limit);
 			if (ret) {
-				pr_err("[%s] get PPT limit failed!", __func__);
+				dev_err(smu->adev->dev, "[%s] get PPT limit failed!", __func__);
 				return ret;
 			}
 		} else {
 			/* the last hope to figure out the ppt limit */
 			if (!pptable) {
-				pr_err("Cannot get PPT limit due to pptable missing!");
+				dev_err(smu->adev->dev, "Cannot get PPT limit due to pptable missing!");
 				return -EINVAL;
 			}
 			asic_default_power_limit =
@@ -1498,7 +1499,7 @@ static int arcturus_get_power_profile_mode(struct smu_context *smu,
 						  (void *)(&activity_monitor),
 						  false);
 			if (result) {
-				pr_err("[%s] Failed to get activity monitor!", __func__);
+				dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
 				return result;
 			}
 		}
@@ -1551,7 +1552,7 @@ static int arcturus_set_power_profile_mode(struct smu_context *smu,
 	uint32_t smu_version;
 
 	if (profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
-		pr_err("Invalid power profile mode %d\n", profile_mode);
+		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", profile_mode);
 		return -EINVAL;
 	}
 
@@ -1567,7 +1568,7 @@ static int arcturus_set_power_profile_mode(struct smu_context *smu,
 				       (void *)(&activity_monitor),
 				       false);
 		if (ret) {
-			pr_err("[%s] Failed to get activity monitor!", __func__);
+			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
 			return ret;
 		}
 
@@ -1602,7 +1603,7 @@ static int arcturus_set_power_profile_mode(struct smu_context *smu,
 				       (void *)(&activity_monitor),
 				       true);
 		if (ret) {
-			pr_err("[%s] Failed to set activity monitor!", __func__);
+			dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
 			return ret;
 		}
 	}
@@ -1613,7 +1614,7 @@ static int arcturus_set_power_profile_mode(struct smu_context *smu,
 	 */
 	workload_type = smu_workload_get_type(smu, profile_mode);
 	if (workload_type < 0) {
-		pr_err("Unsupported power profile mode %d on arcturus\n", profile_mode);
+		dev_err(smu->adev->dev, "Unsupported power profile mode %d on arcturus\n", profile_mode);
 		return -EINVAL;
 	}
 
@@ -1622,7 +1623,7 @@ static int arcturus_set_power_profile_mode(struct smu_context *smu,
 					  1 << workload_type,
 					  NULL);
 	if (ret) {
-		pr_err("Fail to set workload type %d\n", workload_type);
+		dev_err(smu->adev->dev, "Fail to set workload type %d\n", workload_type);
 		return ret;
 	}
 
@@ -1639,7 +1640,7 @@ static int arcturus_set_performance_level(struct smu_context *smu,
 
 	ret = smu_get_smc_version(smu, NULL, &smu_version);
 	if (ret) {
-		pr_err("Failed to get smu version!\n");
+		dev_err(smu->adev->dev, "Failed to get smu version!\n");
 		return ret;
 	}
 
@@ -1651,7 +1652,7 @@ static int arcturus_set_performance_level(struct smu_context *smu,
 	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:
 	case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
 		if (smu_version >= 0x361200) {
-			pr_err("Forcing clock level is not supported with "
+			dev_err(smu->adev->dev, "Forcing clock level is not supported with "
 			       "54.18 and onwards SMU firmwares\n");
 			return -EOPNOTSUPP;
 		}
@@ -1669,53 +1670,53 @@ static void arcturus_dump_pptable(struct smu_context *smu)
 	PPTable_t *pptable = table_context->driver_pptable;
 	int i;
 
-	pr_info("Dumped PPTable:\n");
+	dev_info(smu->adev->dev, "Dumped PPTable:\n");
 
-	pr_info("Version = 0x%08x\n", pptable->Version);
+	dev_info(smu->adev->dev, "Version = 0x%08x\n", pptable->Version);
 
-	pr_info("FeaturesToRun[0] = 0x%08x\n", pptable->FeaturesToRun[0]);
-	pr_info("FeaturesToRun[1] = 0x%08x\n", pptable->FeaturesToRun[1]);
+	dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", pptable->FeaturesToRun[0]);
+	dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", pptable->FeaturesToRun[1]);
 
 	for (i = 0; i < PPT_THROTTLER_COUNT; i++) {
-		pr_info("SocketPowerLimitAc[%d] = %d\n", i, pptable->SocketPowerLimitAc[i]);
-		pr_info("SocketPowerLimitAcTau[%d] = %d\n", i, pptable->SocketPowerLimitAcTau[i]);
+		dev_info(smu->adev->dev, "SocketPowerLimitAc[%d] = %d\n", i, pptable->SocketPowerLimitAc[i]);
+		dev_info(smu->adev->dev, "SocketPowerLimitAcTau[%d] = %d\n", i, pptable->SocketPowerLimitAcTau[i]);
 	}
 
-	pr_info("TdcLimitSoc = %d\n", pptable->TdcLimitSoc);
-	pr_info("TdcLimitSocTau = %d\n", pptable->TdcLimitSocTau);
-	pr_info("TdcLimitGfx = %d\n", pptable->TdcLimitGfx);
-	pr_info("TdcLimitGfxTau = %d\n", pptable->TdcLimitGfxTau);
+	dev_info(smu->adev->dev, "TdcLimitSoc = %d\n", pptable->TdcLimitSoc);
+	dev_info(smu->adev->dev, "TdcLimitSocTau = %d\n", pptable->TdcLimitSocTau);
+	dev_info(smu->adev->dev, "TdcLimitGfx = %d\n", pptable->TdcLimitGfx);
+	dev_info(smu->adev->dev, "TdcLimitGfxTau = %d\n", pptable->TdcLimitGfxTau);
 
-	pr_info("TedgeLimit = %d\n", pptable->TedgeLimit);
-	pr_info("ThotspotLimit = %d\n", pptable->ThotspotLimit);
-	pr_info("TmemLimit = %d\n", pptable->TmemLimit);
-	pr_info("Tvr_gfxLimit = %d\n", pptable->Tvr_gfxLimit);
-	pr_info("Tvr_memLimit = %d\n", pptable->Tvr_memLimit);
-	pr_info("Tvr_socLimit = %d\n", pptable->Tvr_socLimit);
-	pr_info("FitLimit = %d\n", pptable->FitLimit);
+	dev_info(smu->adev->dev, "TedgeLimit = %d\n", pptable->TedgeLimit);
+	dev_info(smu->adev->dev, "ThotspotLimit = %d\n", pptable->ThotspotLimit);
+	dev_info(smu->adev->dev, "TmemLimit = %d\n", pptable->TmemLimit);
+	dev_info(smu->adev->dev, "Tvr_gfxLimit = %d\n", pptable->Tvr_gfxLimit);
+	dev_info(smu->adev->dev, "Tvr_memLimit = %d\n", pptable->Tvr_memLimit);
+	dev_info(smu->adev->dev, "Tvr_socLimit = %d\n", pptable->Tvr_socLimit);
+	dev_info(smu->adev->dev, "FitLimit = %d\n", pptable->FitLimit);
 
-	pr_info("PpmPowerLimit = %d\n", pptable->PpmPowerLimit);
-	pr_info("PpmTemperatureThreshold = %d\n", pptable->PpmTemperatureThreshold);
+	dev_info(smu->adev->dev, "PpmPowerLimit = %d\n", pptable->PpmPowerLimit);
+	dev_info(smu->adev->dev, "PpmTemperatureThreshold = %d\n", pptable->PpmTemperatureThreshold);
 
-	pr_info("ThrottlerControlMask = %d\n", pptable->ThrottlerControlMask);
+	dev_info(smu->adev->dev, "ThrottlerControlMask = %d\n", pptable->ThrottlerControlMask);
 
-	pr_info("UlvVoltageOffsetGfx = %d\n", pptable->UlvVoltageOffsetGfx);
-	pr_info("UlvPadding = 0x%08x\n", pptable->UlvPadding);
+	dev_info(smu->adev->dev, "UlvVoltageOffsetGfx = %d\n", pptable->UlvVoltageOffsetGfx);
+	dev_info(smu->adev->dev, "UlvPadding = 0x%08x\n", pptable->UlvPadding);
 
-	pr_info("UlvGfxclkBypass = %d\n", pptable->UlvGfxclkBypass);
-	pr_info("Padding234[0] = 0x%02x\n", pptable->Padding234[0]);
-	pr_info("Padding234[1] = 0x%02x\n", pptable->Padding234[1]);
-	pr_info("Padding234[2] = 0x%02x\n", pptable->Padding234[2]);
+	dev_info(smu->adev->dev, "UlvGfxclkBypass = %d\n", pptable->UlvGfxclkBypass);
+	dev_info(smu->adev->dev, "Padding234[0] = 0x%02x\n", pptable->Padding234[0]);
+	dev_info(smu->adev->dev, "Padding234[1] = 0x%02x\n", pptable->Padding234[1]);
+	dev_info(smu->adev->dev, "Padding234[2] = 0x%02x\n", pptable->Padding234[2]);
 
-	pr_info("MinVoltageGfx = %d\n", pptable->MinVoltageGfx);
-	pr_info("MinVoltageSoc = %d\n", pptable->MinVoltageSoc);
-	pr_info("MaxVoltageGfx = %d\n", pptable->MaxVoltageGfx);
-	pr_info("MaxVoltageSoc = %d\n", pptable->MaxVoltageSoc);
+	dev_info(smu->adev->dev, "MinVoltageGfx = %d\n", pptable->MinVoltageGfx);
+	dev_info(smu->adev->dev, "MinVoltageSoc = %d\n", pptable->MinVoltageSoc);
+	dev_info(smu->adev->dev, "MaxVoltageGfx = %d\n", pptable->MaxVoltageGfx);
+	dev_info(smu->adev->dev, "MaxVoltageSoc = %d\n", pptable->MaxVoltageSoc);
 
-	pr_info("LoadLineResistanceGfx = %d\n", pptable->LoadLineResistanceGfx);
-	pr_info("LoadLineResistanceSoc = %d\n", pptable->LoadLineResistanceSoc);
+	dev_info(smu->adev->dev, "LoadLineResistanceGfx = %d\n", pptable->LoadLineResistanceGfx);
+	dev_info(smu->adev->dev, "LoadLineResistanceSoc = %d\n", pptable->LoadLineResistanceSoc);
 
-	pr_info("[PPCLK_GFXCLK]\n"
+	dev_info(smu->adev->dev, "[PPCLK_GFXCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -1736,7 +1737,7 @@ static void arcturus_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_GFXCLK].SsFmin,
 			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding16);
 
-	pr_info("[PPCLK_VCLK]\n"
+	dev_info(smu->adev->dev, "[PPCLK_VCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -1757,7 +1758,7 @@ static void arcturus_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_VCLK].SsFmin,
 			pptable->DpmDescriptor[PPCLK_VCLK].Padding16);
 
-	pr_info("[PPCLK_DCLK]\n"
+	dev_info(smu->adev->dev, "[PPCLK_DCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -1778,7 +1779,7 @@ static void arcturus_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_DCLK].SsFmin,
 			pptable->DpmDescriptor[PPCLK_DCLK].Padding16);
 
-	pr_info("[PPCLK_SOCCLK]\n"
+	dev_info(smu->adev->dev, "[PPCLK_SOCCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -1799,7 +1800,7 @@ static void arcturus_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_SOCCLK].SsFmin,
 			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding16);
 
-	pr_info("[PPCLK_UCLK]\n"
+	dev_info(smu->adev->dev, "[PPCLK_UCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -1820,7 +1821,7 @@ static void arcturus_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_UCLK].SsFmin,
 			pptable->DpmDescriptor[PPCLK_UCLK].Padding16);
 
-	pr_info("[PPCLK_FCLK]\n"
+	dev_info(smu->adev->dev, "[PPCLK_FCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -1842,255 +1843,255 @@ static void arcturus_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_FCLK].Padding16);
 
 
-	pr_info("FreqTableGfx\n");
+	dev_info(smu->adev->dev, "FreqTableGfx\n");
 	for (i = 0; i < NUM_GFXCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableGfx[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableGfx[i]);
 
-	pr_info("FreqTableVclk\n");
+	dev_info(smu->adev->dev, "FreqTableVclk\n");
 	for (i = 0; i < NUM_VCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableVclk[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableVclk[i]);
 
-	pr_info("FreqTableDclk\n");
+	dev_info(smu->adev->dev, "FreqTableDclk\n");
 	for (i = 0; i < NUM_DCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableDclk[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableDclk[i]);
 
-	pr_info("FreqTableSocclk\n");
+	dev_info(smu->adev->dev, "FreqTableSocclk\n");
 	for (i = 0; i < NUM_SOCCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableSocclk[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableSocclk[i]);
 
-	pr_info("FreqTableUclk\n");
+	dev_info(smu->adev->dev, "FreqTableUclk\n");
 	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableUclk[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableUclk[i]);
 
-	pr_info("FreqTableFclk\n");
+	dev_info(smu->adev->dev, "FreqTableFclk\n");
 	for (i = 0; i < NUM_FCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableFclk[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableFclk[i]);
 
-	pr_info("Mp0clkFreq\n");
+	dev_info(smu->adev->dev, "Mp0clkFreq\n");
 	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->Mp0clkFreq[i]);
+		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->Mp0clkFreq[i]);
 
-	pr_info("Mp0DpmVoltage\n");
+	dev_info(smu->adev->dev, "Mp0DpmVoltage\n");
 	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->Mp0DpmVoltage[i]);
-
-	pr_info("GfxclkFidle = 0x%x\n", pptable->GfxclkFidle);
-	pr_info("GfxclkSlewRate = 0x%x\n", pptable->GfxclkSlewRate);
-	pr_info("Padding567[0] = 0x%x\n", pptable->Padding567[0]);
-	pr_info("Padding567[1] = 0x%x\n", pptable->Padding567[1]);
-	pr_info("Padding567[2] = 0x%x\n", pptable->Padding567[2]);
-	pr_info("Padding567[3] = 0x%x\n", pptable->Padding567[3]);
-	pr_info("GfxclkDsMaxFreq = %d\n", pptable->GfxclkDsMaxFreq);
-	pr_info("GfxclkSource = 0x%x\n", pptable->GfxclkSource);
-	pr_info("Padding456 = 0x%x\n", pptable->Padding456);
-
-	pr_info("EnableTdpm = %d\n", pptable->EnableTdpm);
-	pr_info("TdpmHighHystTemperature = %d\n", pptable->TdpmHighHystTemperature);
-	pr_info("TdpmLowHystTemperature = %d\n", pptable->TdpmLowHystTemperature);
-	pr_info("GfxclkFreqHighTempLimit = %d\n", pptable->GfxclkFreqHighTempLimit);
-
-	pr_info("FanStopTemp = %d\n", pptable->FanStopTemp);
-	pr_info("FanStartTemp = %d\n", pptable->FanStartTemp);
-
-	pr_info("FanGainEdge = %d\n", pptable->FanGainEdge);
-	pr_info("FanGainHotspot = %d\n", pptable->FanGainHotspot);
-	pr_info("FanGainVrGfx = %d\n", pptable->FanGainVrGfx);
-	pr_info("FanGainVrSoc = %d\n", pptable->FanGainVrSoc);
-	pr_info("FanGainVrMem = %d\n", pptable->FanGainVrMem);
-	pr_info("FanGainHbm = %d\n", pptable->FanGainHbm);
-
-	pr_info("FanPwmMin = %d\n", pptable->FanPwmMin);
-	pr_info("FanAcousticLimitRpm = %d\n", pptable->FanAcousticLimitRpm);
-	pr_info("FanThrottlingRpm = %d\n", pptable->FanThrottlingRpm);
-	pr_info("FanMaximumRpm = %d\n", pptable->FanMaximumRpm);
-	pr_info("FanTargetTemperature = %d\n", pptable->FanTargetTemperature);
-	pr_info("FanTargetGfxclk = %d\n", pptable->FanTargetGfxclk);
-	pr_info("FanZeroRpmEnable = %d\n", pptable->FanZeroRpmEnable);
-	pr_info("FanTachEdgePerRev = %d\n", pptable->FanTachEdgePerRev);
-	pr_info("FanTempInputSelect = %d\n", pptable->FanTempInputSelect);
-
-	pr_info("FuzzyFan_ErrorSetDelta = %d\n", pptable->FuzzyFan_ErrorSetDelta);
-	pr_info("FuzzyFan_ErrorRateSetDelta = %d\n", pptable->FuzzyFan_ErrorRateSetDelta);
-	pr_info("FuzzyFan_PwmSetDelta = %d\n", pptable->FuzzyFan_PwmSetDelta);
-	pr_info("FuzzyFan_Reserved = %d\n", pptable->FuzzyFan_Reserved);
-
-	pr_info("OverrideAvfsGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
-	pr_info("OverrideAvfsGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
-	pr_info("Padding8_Avfs[0] = %d\n", pptable->Padding8_Avfs[0]);
-	pr_info("Padding8_Avfs[1] = %d\n", pptable->Padding8_Avfs[1]);
-
-	pr_info("dBtcGbGfxPll{a = 0x%x b = 0x%x c = 0x%x}\n",
+		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->Mp0DpmVoltage[i]);
+
+	dev_info(smu->adev->dev, "GfxclkFidle = 0x%x\n", pptable->GfxclkFidle);
+	dev_info(smu->adev->dev, "GfxclkSlewRate = 0x%x\n", pptable->GfxclkSlewRate);
+	dev_info(smu->adev->dev, "Padding567[0] = 0x%x\n", pptable->Padding567[0]);
+	dev_info(smu->adev->dev, "Padding567[1] = 0x%x\n", pptable->Padding567[1]);
+	dev_info(smu->adev->dev, "Padding567[2] = 0x%x\n", pptable->Padding567[2]);
+	dev_info(smu->adev->dev, "Padding567[3] = 0x%x\n", pptable->Padding567[3]);
+	dev_info(smu->adev->dev, "GfxclkDsMaxFreq = %d\n", pptable->GfxclkDsMaxFreq);
+	dev_info(smu->adev->dev, "GfxclkSource = 0x%x\n", pptable->GfxclkSource);
+	dev_info(smu->adev->dev, "Padding456 = 0x%x\n", pptable->Padding456);
+
+	dev_info(smu->adev->dev, "EnableTdpm = %d\n", pptable->EnableTdpm);
+	dev_info(smu->adev->dev, "TdpmHighHystTemperature = %d\n", pptable->TdpmHighHystTemperature);
+	dev_info(smu->adev->dev, "TdpmLowHystTemperature = %d\n", pptable->TdpmLowHystTemperature);
+	dev_info(smu->adev->dev, "GfxclkFreqHighTempLimit = %d\n", pptable->GfxclkFreqHighTempLimit);
+
+	dev_info(smu->adev->dev, "FanStopTemp = %d\n", pptable->FanStopTemp);
+	dev_info(smu->adev->dev, "FanStartTemp = %d\n", pptable->FanStartTemp);
+
+	dev_info(smu->adev->dev, "FanGainEdge = %d\n", pptable->FanGainEdge);
+	dev_info(smu->adev->dev, "FanGainHotspot = %d\n", pptable->FanGainHotspot);
+	dev_info(smu->adev->dev, "FanGainVrGfx = %d\n", pptable->FanGainVrGfx);
+	dev_info(smu->adev->dev, "FanGainVrSoc = %d\n", pptable->FanGainVrSoc);
+	dev_info(smu->adev->dev, "FanGainVrMem = %d\n", pptable->FanGainVrMem);
+	dev_info(smu->adev->dev, "FanGainHbm = %d\n", pptable->FanGainHbm);
+
+	dev_info(smu->adev->dev, "FanPwmMin = %d\n", pptable->FanPwmMin);
+	dev_info(smu->adev->dev, "FanAcousticLimitRpm = %d\n", pptable->FanAcousticLimitRpm);
+	dev_info(smu->adev->dev, "FanThrottlingRpm = %d\n", pptable->FanThrottlingRpm);
+	dev_info(smu->adev->dev, "FanMaximumRpm = %d\n", pptable->FanMaximumRpm);
+	dev_info(smu->adev->dev, "FanTargetTemperature = %d\n", pptable->FanTargetTemperature);
+	dev_info(smu->adev->dev, "FanTargetGfxclk = %d\n", pptable->FanTargetGfxclk);
+	dev_info(smu->adev->dev, "FanZeroRpmEnable = %d\n", pptable->FanZeroRpmEnable);
+	dev_info(smu->adev->dev, "FanTachEdgePerRev = %d\n", pptable->FanTachEdgePerRev);
+	dev_info(smu->adev->dev, "FanTempInputSelect = %d\n", pptable->FanTempInputSelect);
+
+	dev_info(smu->adev->dev, "FuzzyFan_ErrorSetDelta = %d\n", pptable->FuzzyFan_ErrorSetDelta);
+	dev_info(smu->adev->dev, "FuzzyFan_ErrorRateSetDelta = %d\n", pptable->FuzzyFan_ErrorRateSetDelta);
+	dev_info(smu->adev->dev, "FuzzyFan_PwmSetDelta = %d\n", pptable->FuzzyFan_PwmSetDelta);
+	dev_info(smu->adev->dev, "FuzzyFan_Reserved = %d\n", pptable->FuzzyFan_Reserved);
+
+	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "Padding8_Avfs[0] = %d\n", pptable->Padding8_Avfs[0]);
+	dev_info(smu->adev->dev, "Padding8_Avfs[1] = %d\n", pptable->Padding8_Avfs[1]);
+
+	dev_info(smu->adev->dev, "dBtcGbGfxPll{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->dBtcGbGfxPll.a,
 			pptable->dBtcGbGfxPll.b,
 			pptable->dBtcGbGfxPll.c);
-	pr_info("dBtcGbGfxAfll{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "dBtcGbGfxAfll{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->dBtcGbGfxAfll.a,
 			pptable->dBtcGbGfxAfll.b,
 			pptable->dBtcGbGfxAfll.c);
-	pr_info("dBtcGbSoc{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "dBtcGbSoc{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->dBtcGbSoc.a,
 			pptable->dBtcGbSoc.b,
 			pptable->dBtcGbSoc.c);
 
-	pr_info("qAgingGb[AVFS_VOLTAGE_GFX]{m = 0x%x b = 0x%x}\n",
+	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_GFX]{m = 0x%x b = 0x%x}\n",
 			pptable->qAgingGb[AVFS_VOLTAGE_GFX].m,
 			pptable->qAgingGb[AVFS_VOLTAGE_GFX].b);
-	pr_info("qAgingGb[AVFS_VOLTAGE_SOC]{m = 0x%x b = 0x%x}\n",
+	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_SOC]{m = 0x%x b = 0x%x}\n",
 			pptable->qAgingGb[AVFS_VOLTAGE_SOC].m,
 			pptable->qAgingGb[AVFS_VOLTAGE_SOC].b);
 
-	pr_info("qStaticVoltageOffset[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].a,
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].b,
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].c);
-	pr_info("qStaticVoltageOffset[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].a,
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].b,
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].c);
 
-	pr_info("DcTol[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
-	pr_info("DcTol[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
 
-	pr_info("DcBtcEnabled[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcEnabled[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
-	pr_info("Padding8_GfxBtc[0] = 0x%x\n", pptable->Padding8_GfxBtc[0]);
-	pr_info("Padding8_GfxBtc[1] = 0x%x\n", pptable->Padding8_GfxBtc[1]);
+	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "Padding8_GfxBtc[0] = 0x%x\n", pptable->Padding8_GfxBtc[0]);
+	dev_info(smu->adev->dev, "Padding8_GfxBtc[1] = 0x%x\n", pptable->Padding8_GfxBtc[1]);
 
-	pr_info("DcBtcMin[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcMin[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
-	pr_info("DcBtcMax[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcMax[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
 
-	pr_info("DcBtcGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
 
-	pr_info("XgmiDpmPstates\n");
+	dev_info(smu->adev->dev, "XgmiDpmPstates\n");
 	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiDpmPstates[i]);
-	pr_info("XgmiDpmSpare[0] = 0x%02x\n", pptable->XgmiDpmSpare[0]);
-	pr_info("XgmiDpmSpare[1] = 0x%02x\n", pptable->XgmiDpmSpare[1]);
-
-	pr_info("VDDGFX_TVmin = %d\n", pptable->VDDGFX_TVmin);
-	pr_info("VDDSOC_TVmin = %d\n", pptable->VDDSOC_TVmin);
-	pr_info("VDDGFX_Vmin_HiTemp = %d\n", pptable->VDDGFX_Vmin_HiTemp);
-	pr_info("VDDGFX_Vmin_LoTemp = %d\n", pptable->VDDGFX_Vmin_LoTemp);
-	pr_info("VDDSOC_Vmin_HiTemp = %d\n", pptable->VDDSOC_Vmin_HiTemp);
-	pr_info("VDDSOC_Vmin_LoTemp = %d\n", pptable->VDDSOC_Vmin_LoTemp);
-	pr_info("VDDGFX_TVminHystersis = %d\n", pptable->VDDGFX_TVminHystersis);
-	pr_info("VDDSOC_TVminHystersis = %d\n", pptable->VDDSOC_TVminHystersis);
-
-	pr_info("DebugOverrides = 0x%x\n", pptable->DebugOverrides);
-	pr_info("ReservedEquation0{a = 0x%x b = 0x%x c = 0x%x}\n",
+		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiDpmPstates[i]);
+	dev_info(smu->adev->dev, "XgmiDpmSpare[0] = 0x%02x\n", pptable->XgmiDpmSpare[0]);
+	dev_info(smu->adev->dev, "XgmiDpmSpare[1] = 0x%02x\n", pptable->XgmiDpmSpare[1]);
+
+	dev_info(smu->adev->dev, "VDDGFX_TVmin = %d\n", pptable->VDDGFX_TVmin);
+	dev_info(smu->adev->dev, "VDDSOC_TVmin = %d\n", pptable->VDDSOC_TVmin);
+	dev_info(smu->adev->dev, "VDDGFX_Vmin_HiTemp = %d\n", pptable->VDDGFX_Vmin_HiTemp);
+	dev_info(smu->adev->dev, "VDDGFX_Vmin_LoTemp = %d\n", pptable->VDDGFX_Vmin_LoTemp);
+	dev_info(smu->adev->dev, "VDDSOC_Vmin_HiTemp = %d\n", pptable->VDDSOC_Vmin_HiTemp);
+	dev_info(smu->adev->dev, "VDDSOC_Vmin_LoTemp = %d\n", pptable->VDDSOC_Vmin_LoTemp);
+	dev_info(smu->adev->dev, "VDDGFX_TVminHystersis = %d\n", pptable->VDDGFX_TVminHystersis);
+	dev_info(smu->adev->dev, "VDDSOC_TVminHystersis = %d\n", pptable->VDDSOC_TVminHystersis);
+
+	dev_info(smu->adev->dev, "DebugOverrides = 0x%x\n", pptable->DebugOverrides);
+	dev_info(smu->adev->dev, "ReservedEquation0{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->ReservedEquation0.a,
 			pptable->ReservedEquation0.b,
 			pptable->ReservedEquation0.c);
-	pr_info("ReservedEquation1{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "ReservedEquation1{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->ReservedEquation1.a,
 			pptable->ReservedEquation1.b,
 			pptable->ReservedEquation1.c);
-	pr_info("ReservedEquation2{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "ReservedEquation2{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->ReservedEquation2.a,
 			pptable->ReservedEquation2.b,
 			pptable->ReservedEquation2.c);
-	pr_info("ReservedEquation3{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "ReservedEquation3{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->ReservedEquation3.a,
 			pptable->ReservedEquation3.b,
 			pptable->ReservedEquation3.c);
 
-	pr_info("MinVoltageUlvGfx = %d\n", pptable->MinVoltageUlvGfx);
-	pr_info("PaddingUlv = %d\n", pptable->PaddingUlv);
+	dev_info(smu->adev->dev, "MinVoltageUlvGfx = %d\n", pptable->MinVoltageUlvGfx);
+	dev_info(smu->adev->dev, "PaddingUlv = %d\n", pptable->PaddingUlv);
 
-	pr_info("TotalPowerConfig = %d\n", pptable->TotalPowerConfig);
-	pr_info("TotalPowerSpare1 = %d\n", pptable->TotalPowerSpare1);
-	pr_info("TotalPowerSpare2 = %d\n", pptable->TotalPowerSpare2);
+	dev_info(smu->adev->dev, "TotalPowerConfig = %d\n", pptable->TotalPowerConfig);
+	dev_info(smu->adev->dev, "TotalPowerSpare1 = %d\n", pptable->TotalPowerSpare1);
+	dev_info(smu->adev->dev, "TotalPowerSpare2 = %d\n", pptable->TotalPowerSpare2);
 
-	pr_info("PccThresholdLow = %d\n", pptable->PccThresholdLow);
-	pr_info("PccThresholdHigh = %d\n", pptable->PccThresholdHigh);
+	dev_info(smu->adev->dev, "PccThresholdLow = %d\n", pptable->PccThresholdLow);
+	dev_info(smu->adev->dev, "PccThresholdHigh = %d\n", pptable->PccThresholdHigh);
 
-	pr_info("Board Parameters:\n");
-	pr_info("MaxVoltageStepGfx = 0x%x\n", pptable->MaxVoltageStepGfx);
-	pr_info("MaxVoltageStepSoc = 0x%x\n", pptable->MaxVoltageStepSoc);
+	dev_info(smu->adev->dev, "Board Parameters:\n");
+	dev_info(smu->adev->dev, "MaxVoltageStepGfx = 0x%x\n", pptable->MaxVoltageStepGfx);
+	dev_info(smu->adev->dev, "MaxVoltageStepSoc = 0x%x\n", pptable->MaxVoltageStepSoc);
 
-	pr_info("VddGfxVrMapping = 0x%x\n", pptable->VddGfxVrMapping);
-	pr_info("VddSocVrMapping = 0x%x\n", pptable->VddSocVrMapping);
-	pr_info("VddMemVrMapping = 0x%x\n", pptable->VddMemVrMapping);
-	pr_info("BoardVrMapping = 0x%x\n", pptable->BoardVrMapping);
+	dev_info(smu->adev->dev, "VddGfxVrMapping = 0x%x\n", pptable->VddGfxVrMapping);
+	dev_info(smu->adev->dev, "VddSocVrMapping = 0x%x\n", pptable->VddSocVrMapping);
+	dev_info(smu->adev->dev, "VddMemVrMapping = 0x%x\n", pptable->VddMemVrMapping);
+	dev_info(smu->adev->dev, "BoardVrMapping = 0x%x\n", pptable->BoardVrMapping);
 
-	pr_info("GfxUlvPhaseSheddingMask = 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
-	pr_info("ExternalSensorPresent = 0x%x\n", pptable->ExternalSensorPresent);
+	dev_info(smu->adev->dev, "GfxUlvPhaseSheddingMask = 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
+	dev_info(smu->adev->dev, "ExternalSensorPresent = 0x%x\n", pptable->ExternalSensorPresent);
 
-	pr_info("GfxMaxCurrent = 0x%x\n", pptable->GfxMaxCurrent);
-	pr_info("GfxOffset = 0x%x\n", pptable->GfxOffset);
-	pr_info("Padding_TelemetryGfx = 0x%x\n", pptable->Padding_TelemetryGfx);
+	dev_info(smu->adev->dev, "GfxMaxCurrent = 0x%x\n", pptable->GfxMaxCurrent);
+	dev_info(smu->adev->dev, "GfxOffset = 0x%x\n", pptable->GfxOffset);
+	dev_info(smu->adev->dev, "Padding_TelemetryGfx = 0x%x\n", pptable->Padding_TelemetryGfx);
 
-	pr_info("SocMaxCurrent = 0x%x\n", pptable->SocMaxCurrent);
-	pr_info("SocOffset = 0x%x\n", pptable->SocOffset);
-	pr_info("Padding_TelemetrySoc = 0x%x\n", pptable->Padding_TelemetrySoc);
+	dev_info(smu->adev->dev, "SocMaxCurrent = 0x%x\n", pptable->SocMaxCurrent);
+	dev_info(smu->adev->dev, "SocOffset = 0x%x\n", pptable->SocOffset);
+	dev_info(smu->adev->dev, "Padding_TelemetrySoc = 0x%x\n", pptable->Padding_TelemetrySoc);
 
-	pr_info("MemMaxCurrent = 0x%x\n", pptable->MemMaxCurrent);
-	pr_info("MemOffset = 0x%x\n", pptable->MemOffset);
-	pr_info("Padding_TelemetryMem = 0x%x\n", pptable->Padding_TelemetryMem);
+	dev_info(smu->adev->dev, "MemMaxCurrent = 0x%x\n", pptable->MemMaxCurrent);
+	dev_info(smu->adev->dev, "MemOffset = 0x%x\n", pptable->MemOffset);
+	dev_info(smu->adev->dev, "Padding_TelemetryMem = 0x%x\n", pptable->Padding_TelemetryMem);
 
-	pr_info("BoardMaxCurrent = 0x%x\n", pptable->BoardMaxCurrent);
-	pr_info("BoardOffset = 0x%x\n", pptable->BoardOffset);
-	pr_info("Padding_TelemetryBoardInput = 0x%x\n", pptable->Padding_TelemetryBoardInput);
+	dev_info(smu->adev->dev, "BoardMaxCurrent = 0x%x\n", pptable->BoardMaxCurrent);
+	dev_info(smu->adev->dev, "BoardOffset = 0x%x\n", pptable->BoardOffset);
+	dev_info(smu->adev->dev, "Padding_TelemetryBoardInput = 0x%x\n", pptable->Padding_TelemetryBoardInput);
 
-	pr_info("VR0HotGpio = %d\n", pptable->VR0HotGpio);
-	pr_info("VR0HotPolarity = %d\n", pptable->VR0HotPolarity);
-	pr_info("VR1HotGpio = %d\n", pptable->VR1HotGpio);
-	pr_info("VR1HotPolarity = %d\n", pptable->VR1HotPolarity);
+	dev_info(smu->adev->dev, "VR0HotGpio = %d\n", pptable->VR0HotGpio);
+	dev_info(smu->adev->dev, "VR0HotPolarity = %d\n", pptable->VR0HotPolarity);
+	dev_info(smu->adev->dev, "VR1HotGpio = %d\n", pptable->VR1HotGpio);
+	dev_info(smu->adev->dev, "VR1HotPolarity = %d\n", pptable->VR1HotPolarity);
 
-	pr_info("PllGfxclkSpreadEnabled = %d\n", pptable->PllGfxclkSpreadEnabled);
-	pr_info("PllGfxclkSpreadPercent = %d\n", pptable->PllGfxclkSpreadPercent);
-	pr_info("PllGfxclkSpreadFreq = %d\n", pptable->PllGfxclkSpreadFreq);
+	dev_info(smu->adev->dev, "PllGfxclkSpreadEnabled = %d\n", pptable->PllGfxclkSpreadEnabled);
+	dev_info(smu->adev->dev, "PllGfxclkSpreadPercent = %d\n", pptable->PllGfxclkSpreadPercent);
+	dev_info(smu->adev->dev, "PllGfxclkSpreadFreq = %d\n", pptable->PllGfxclkSpreadFreq);
 
-	pr_info("UclkSpreadEnabled = %d\n", pptable->UclkSpreadEnabled);
-	pr_info("UclkSpreadPercent = %d\n", pptable->UclkSpreadPercent);
-	pr_info("UclkSpreadFreq = %d\n", pptable->UclkSpreadFreq);
+	dev_info(smu->adev->dev, "UclkSpreadEnabled = %d\n", pptable->UclkSpreadEnabled);
+	dev_info(smu->adev->dev, "UclkSpreadPercent = %d\n", pptable->UclkSpreadPercent);
+	dev_info(smu->adev->dev, "UclkSpreadFreq = %d\n", pptable->UclkSpreadFreq);
 
-	pr_info("FclkSpreadEnabled = %d\n", pptable->FclkSpreadEnabled);
-	pr_info("FclkSpreadPercent = %d\n", pptable->FclkSpreadPercent);
-	pr_info("FclkSpreadFreq = %d\n", pptable->FclkSpreadFreq);
+	dev_info(smu->adev->dev, "FclkSpreadEnabled = %d\n", pptable->FclkSpreadEnabled);
+	dev_info(smu->adev->dev, "FclkSpreadPercent = %d\n", pptable->FclkSpreadPercent);
+	dev_info(smu->adev->dev, "FclkSpreadFreq = %d\n", pptable->FclkSpreadFreq);
 
-	pr_info("FllGfxclkSpreadEnabled = %d\n", pptable->FllGfxclkSpreadEnabled);
-	pr_info("FllGfxclkSpreadPercent = %d\n", pptable->FllGfxclkSpreadPercent);
-	pr_info("FllGfxclkSpreadFreq = %d\n", pptable->FllGfxclkSpreadFreq);
+	dev_info(smu->adev->dev, "FllGfxclkSpreadEnabled = %d\n", pptable->FllGfxclkSpreadEnabled);
+	dev_info(smu->adev->dev, "FllGfxclkSpreadPercent = %d\n", pptable->FllGfxclkSpreadPercent);
+	dev_info(smu->adev->dev, "FllGfxclkSpreadFreq = %d\n", pptable->FllGfxclkSpreadFreq);
 
 	for (i = 0; i < NUM_I2C_CONTROLLERS; i++) {
-		pr_info("I2cControllers[%d]:\n", i);
-		pr_info("                   .Enabled = %d\n",
+		dev_info(smu->adev->dev, "I2cControllers[%d]:\n", i);
+		dev_info(smu->adev->dev, "                   .Enabled = %d\n",
 				pptable->I2cControllers[i].Enabled);
-		pr_info("                   .SlaveAddress = 0x%x\n",
+		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
 				pptable->I2cControllers[i].SlaveAddress);
-		pr_info("                   .ControllerPort = %d\n",
+		dev_info(smu->adev->dev, "                   .ControllerPort = %d\n",
 				pptable->I2cControllers[i].ControllerPort);
-		pr_info("                   .ControllerName = %d\n",
+		dev_info(smu->adev->dev, "                   .ControllerName = %d\n",
 				pptable->I2cControllers[i].ControllerName);
-		pr_info("                   .ThermalThrottler = %d\n",
+		dev_info(smu->adev->dev, "                   .ThermalThrottler = %d\n",
 				pptable->I2cControllers[i].ThermalThrotter);
-		pr_info("                   .I2cProtocol = %d\n",
+		dev_info(smu->adev->dev, "                   .I2cProtocol = %d\n",
 				pptable->I2cControllers[i].I2cProtocol);
-		pr_info("                   .Speed = %d\n",
+		dev_info(smu->adev->dev, "                   .Speed = %d\n",
 				pptable->I2cControllers[i].Speed);
 	}
 
-	pr_info("MemoryChannelEnabled = %d\n", pptable->MemoryChannelEnabled);
-	pr_info("DramBitWidth = %d\n", pptable->DramBitWidth);
+	dev_info(smu->adev->dev, "MemoryChannelEnabled = %d\n", pptable->MemoryChannelEnabled);
+	dev_info(smu->adev->dev, "DramBitWidth = %d\n", pptable->DramBitWidth);
 
-	pr_info("TotalBoardPower = %d\n", pptable->TotalBoardPower);
+	dev_info(smu->adev->dev, "TotalBoardPower = %d\n", pptable->TotalBoardPower);
 
-	pr_info("XgmiLinkSpeed\n");
+	dev_info(smu->adev->dev, "XgmiLinkSpeed\n");
 	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiLinkSpeed[i]);
-	pr_info("XgmiLinkWidth\n");
+		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiLinkSpeed[i]);
+	dev_info(smu->adev->dev, "XgmiLinkWidth\n");
 	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiLinkWidth[i]);
-	pr_info("XgmiFclkFreq\n");
+		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiLinkWidth[i]);
+	dev_info(smu->adev->dev, "XgmiFclkFreq\n");
 	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiFclkFreq[i]);
-	pr_info("XgmiSocVoltage\n");
+		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiFclkFreq[i]);
+	dev_info(smu->adev->dev, "XgmiSocVoltage\n");
 	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiSocVoltage[i]);
+		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiSocVoltage[i]);
 
 }
 
@@ -2115,7 +2116,7 @@ static int arcturus_dpm_set_uvd_enable(struct smu_context *smu, bool enable)
 		if (!smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
 			ret = smu_feature_set_enabled(smu, SMU_FEATURE_VCN_PG_BIT, 1);
 			if (ret) {
-				pr_err("[EnableVCNDPM] failed!\n");
+				dev_err(smu->adev->dev, "[EnableVCNDPM] failed!\n");
 				return ret;
 			}
 		}
@@ -2124,7 +2125,7 @@ static int arcturus_dpm_set_uvd_enable(struct smu_context *smu, bool enable)
 		if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
 			ret = smu_feature_set_enabled(smu, SMU_FEATURE_VCN_PG_BIT, 0);
 			if (ret) {
-				pr_err("[DisableVCNDPM] failed!\n");
+				dev_err(smu->adev->dev, "[DisableVCNDPM] failed!\n");
 				return ret;
 			}
 		}
@@ -2196,13 +2197,13 @@ static int arcturus_i2c_eeprom_read_data(struct i2c_adapter *control,
 		for (i = 0; i < numbytes; i++)
 			data[i] = res->SwI2cCmds[i].Data;
 
-		pr_debug("arcturus_i2c_eeprom_read_data, address = %x, bytes = %d, data :",
+		dev_dbg(adev->dev, "arcturus_i2c_eeprom_read_data, address = %x, bytes = %d, data :",
 				  (uint16_t)address, numbytes);
 
 		print_hex_dump(KERN_DEBUG, "data: ", DUMP_PREFIX_NONE,
 			       8, 1, data, numbytes, false);
 	} else
-		pr_err("arcturus_i2c_eeprom_read_data - error occurred :%x", ret);
+		dev_err(adev->dev, "arcturus_i2c_eeprom_read_data - error occurred :%x", ret);
 
 	return ret;
 }
@@ -2224,7 +2225,7 @@ static int arcturus_i2c_eeprom_write_data(struct i2c_adapter *control,
 	mutex_unlock(&adev->smu.mutex);
 
 	if (!ret) {
-		pr_debug("arcturus_i2c_write(), address = %x, bytes = %d , data: ",
+		dev_dbg(adev->dev, "arcturus_i2c_write(), address = %x, bytes = %d , data: ",
 					 (uint16_t)address, numbytes);
 
 		print_hex_dump(KERN_DEBUG, "data: ", DUMP_PREFIX_NONE,
@@ -2238,7 +2239,7 @@ static int arcturus_i2c_eeprom_write_data(struct i2c_adapter *control,
 		msleep(10);
 
 	} else
-		pr_err("arcturus_i2c_write- error occurred :%x", ret);
+		dev_err(adev->dev, "arcturus_i2c_write- error occurred :%x", ret);
 
 	return ret;
 }
@@ -2374,13 +2375,13 @@ static void arcturus_get_unique_id(struct smu_context *smu)
 	uint64_t id;
 
 	if (smu_get_smc_version(smu, NULL, &smu_version)) {
-		pr_warn("Failed to get smu version, cannot get unique_id or serial_number\n");
+		dev_warn(adev->dev, "Failed to get smu version, cannot get unique_id or serial_number\n");
 		return;
 	}
 
 	/* PPSMC_MSG_ReadSerial* is supported by 54.23.0 and onwards */
 	if (smu_version < 0x361700) {
-		pr_warn("ReadSerial is only supported by PMFW 54.23.0 and onwards\n");
+		dev_warn(adev->dev, "ReadSerial is only supported by PMFW 54.23.0 and onwards\n");
 		return;
 	}
 
@@ -2424,13 +2425,13 @@ static int arcturus_set_df_cstate(struct smu_context *smu,
 
 	ret = smu_get_smc_version(smu, NULL, &smu_version);
 	if (ret) {
-		pr_err("Failed to get smu version!\n");
+		dev_err(smu->adev->dev, "Failed to get smu version!\n");
 		return ret;
 	}
 
 	/* PPSMC_MSG_DFCstateControl is supported by 54.15.0 and onwards */
 	if (smu_version < 0x360F00) {
-		pr_err("DFCstateControl is only supported by PMFW 54.15.0 and onwards\n");
+		dev_err(smu->adev->dev, "DFCstateControl is only supported by PMFW 54.15.0 and onwards\n");
 		return -EINVAL;
 	}
 
@@ -2444,13 +2445,13 @@ static int arcturus_allow_xgmi_power_down(struct smu_context *smu, bool en)
 
 	ret = smu_get_smc_version(smu, NULL, &smu_version);
 	if (ret) {
-		pr_err("Failed to get smu version!\n");
+		dev_err(smu->adev->dev, "Failed to get smu version!\n");
 		return ret;
 	}
 
 	/* PPSMC_MSG_GmiPwrDnControl is supported by 54.23.0 and onwards */
 	if (smu_version < 0x00361700) {
-		pr_err("XGMI power down control is only supported by PMFW 54.23.0 and onwards\n");
+		dev_err(smu->adev->dev, "XGMI power down control is only supported by PMFW 54.23.0 and onwards\n");
 		return -EINVAL;
 	}
 
@@ -2500,7 +2501,7 @@ static void arcturus_log_thermal_throttling_event(struct smu_context *smu)
 					    throtting_events > 1 ? " and " : "",
 					    logging_label[throttler_idx].label);
 			if (buf_idx >= sizeof(log_buf)) {
-				pr_err("buffer overflow!\n");
+				dev_err(adev->dev, "buffer overflow!\n");
 				log_buf[sizeof(log_buf) - 1] = '\0';
 				break;
 			}
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 4cfb1efbc541..ce91743c7d1c 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -460,12 +460,12 @@ static int navi10_append_powerplay_table(struct smu_context *smu)
 	if (ret)
 		return ret;
 
-	pr_info("smc_dpm_info table revision(format.content): %d.%d\n",
+	dev_info(adev->dev, "smc_dpm_info table revision(format.content): %d.%d\n",
 			smc_dpm_table->table_header.format_revision,
 			smc_dpm_table->table_header.content_revision);
 
 	if (smc_dpm_table->table_header.format_revision != 4) {
-		pr_err("smc_dpm_info table format revision is not 4!\n");
+		dev_err(adev->dev, "smc_dpm_info table format revision is not 4!\n");
 		return -EINVAL;
 	}
 
@@ -483,7 +483,7 @@ static int navi10_append_powerplay_table(struct smu_context *smu)
 			sizeof(*smc_dpm_table_v4_7) - sizeof(smc_dpm_table_v4_7->table_header));
 		break;
 	default:
-		pr_err("smc_dpm_info with unsupported content revision %d!\n",
+		dev_err(smu->adev->dev, "smc_dpm_info with unsupported content revision %d!\n",
 				smc_dpm_table->table_header.content_revision);
 		return -EINVAL;
 	}
@@ -578,7 +578,7 @@ static int navi10_get_smu_metrics_data(struct smu_context *smu,
 				       smu_table->metrics_table,
 				       false);
 		if (ret) {
-			pr_info("Failed to export SMU metrics table!\n");
+			dev_info(smu->adev->dev, "Failed to export SMU metrics table!\n");
 			mutex_unlock(&smu->metrics_lock);
 			return ret;
 		}
@@ -1243,7 +1243,7 @@ static int navi10_get_current_activity_percent(struct smu_context *smu,
 						  value);
 		break;
 	default:
-		pr_err("Invalid sensor for retrieving clock activity\n");
+		dev_err(smu->adev->dev, "Invalid sensor for retrieving clock activity\n");
 		return -EINVAL;
 	}
 
@@ -1334,7 +1334,7 @@ static int navi10_get_power_profile_mode(struct smu_context *smu, char *buf)
 					  SMU_TABLE_ACTIVITY_MONITOR_COEFF, workload_type,
 					  (void *)(&activity_monitor), false);
 		if (result) {
-			pr_err("[%s] Failed to get activity monitor!", __func__);
+			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
 			return result;
 		}
 
@@ -1395,7 +1395,7 @@ static int navi10_set_power_profile_mode(struct smu_context *smu, long *input, u
 	smu->power_profile_mode = input[size];
 
 	if (smu->power_profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
-		pr_err("Invalid power profile mode %d\n", smu->power_profile_mode);
+		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", smu->power_profile_mode);
 		return -EINVAL;
 	}
 
@@ -1405,7 +1405,7 @@ static int navi10_set_power_profile_mode(struct smu_context *smu, long *input, u
 				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
 				       (void *)(&activity_monitor), false);
 		if (ret) {
-			pr_err("[%s] Failed to get activity monitor!", __func__);
+			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
 			return ret;
 		}
 
@@ -1449,7 +1449,7 @@ static int navi10_set_power_profile_mode(struct smu_context *smu, long *input, u
 				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
 				       (void *)(&activity_monitor), true);
 		if (ret) {
-			pr_err("[%s] Failed to set activity monitor!", __func__);
+			dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
 			return ret;
 		}
 	}
@@ -1527,19 +1527,19 @@ static int navi10_notify_smc_display_config(struct smu_context *smu)
 								  min_clocks.dcef_clock_in_sr/100,
 								  NULL);
 				if (ret) {
-					pr_err("Attempt to set divider for DCEFCLK Failed!");
+					dev_err(smu->adev->dev, "Attempt to set divider for DCEFCLK Failed!");
 					return ret;
 				}
 			}
 		} else {
-			pr_info("Attempt to set Hard Min for DCEFCLK Failed!");
+			dev_info(smu->adev->dev, "Attempt to set Hard Min for DCEFCLK Failed!");
 		}
 	}
 
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
 		ret = smu_set_hard_freq_range(smu, SMU_UCLK, min_clocks.memory_clock/100, 0);
 		if (ret) {
-			pr_err("[%s] Set hard min uclk failed!", __func__);
+			dev_err(smu->adev->dev, "[%s] Set hard min uclk failed!", __func__);
 			return ret;
 		}
 	}
@@ -1611,7 +1611,7 @@ static int navi10_set_watermarks_table(struct smu_context *smu,
 	if (!(smu->watermarks_bitmap & WATERMARKS_LOADED)) {
 		ret = smu_write_watermarks_table(smu);
 		if (ret) {
-			pr_err("Failed to update WMTABLE!");
+			dev_err(smu->adev->dev, "Failed to update WMTABLE!");
 			return ret;
 		}
 		smu->watermarks_bitmap |= WATERMARKS_LOADED;
@@ -1646,7 +1646,7 @@ static int navi10_thermal_get_temperature(struct smu_context *smu,
 						  value);
 		break;
 	default:
-		pr_err("Invalid sensor for retrieving temp\n");
+		dev_err(smu->adev->dev, "Invalid sensor for retrieving temp\n");
 		return -EINVAL;
 	}
 
@@ -1928,13 +1928,13 @@ static int navi10_get_power_limit(struct smu_context *smu,
 			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetPptLimit,
 				power_src << 16, &asic_default_power_limit);
 			if (ret) {
-				pr_err("[%s] get PPT limit failed!", __func__);
+				dev_err(smu->adev->dev, "[%s] get PPT limit failed!", __func__);
 				return ret;
 			}
 		} else {
 			/* the last hope to figure out the ppt limit */
 			if (!pptable) {
-				pr_err("Cannot get PPT limit due to pptable missing!");
+				dev_err(smu->adev->dev, "Cannot get PPT limit due to pptable missing!");
 				return -EINVAL;
 			}
 			asic_default_power_limit =
@@ -1985,23 +1985,28 @@ static int navi10_update_pcie_parameters(struct smu_context *smu,
 	return 0;
 }
 
-static inline void navi10_dump_od_table(OverDriveTable_t *od_table) {
-	pr_debug("OD: Gfxclk: (%d, %d)\n", od_table->GfxclkFmin, od_table->GfxclkFmax);
-	pr_debug("OD: Gfx1: (%d, %d)\n", od_table->GfxclkFreq1, od_table->GfxclkVolt1);
-	pr_debug("OD: Gfx2: (%d, %d)\n", od_table->GfxclkFreq2, od_table->GfxclkVolt2);
-	pr_debug("OD: Gfx3: (%d, %d)\n", od_table->GfxclkFreq3, od_table->GfxclkVolt3);
-	pr_debug("OD: UclkFmax: %d\n", od_table->UclkFmax);
-	pr_debug("OD: OverDrivePct: %d\n", od_table->OverDrivePct);
+static inline void navi10_dump_od_table(struct smu_context *smu,
+					OverDriveTable_t *od_table)
+{
+	dev_dbg(smu->adev->dev, "OD: Gfxclk: (%d, %d)\n", od_table->GfxclkFmin, od_table->GfxclkFmax);
+	dev_dbg(smu->adev->dev, "OD: Gfx1: (%d, %d)\n", od_table->GfxclkFreq1, od_table->GfxclkVolt1);
+	dev_dbg(smu->adev->dev, "OD: Gfx2: (%d, %d)\n", od_table->GfxclkFreq2, od_table->GfxclkVolt2);
+	dev_dbg(smu->adev->dev, "OD: Gfx3: (%d, %d)\n", od_table->GfxclkFreq3, od_table->GfxclkVolt3);
+	dev_dbg(smu->adev->dev, "OD: UclkFmax: %d\n", od_table->UclkFmax);
+	dev_dbg(smu->adev->dev, "OD: OverDrivePct: %d\n", od_table->OverDrivePct);
 }
 
-static int navi10_od_setting_check_range(struct smu_11_0_overdrive_table *od_table, enum SMU_11_0_ODSETTING_ID setting, uint32_t value)
+static int navi10_od_setting_check_range(struct smu_context *smu,
+					 struct smu_11_0_overdrive_table *od_table,
+					 enum SMU_11_0_ODSETTING_ID setting,
+					 uint32_t value)
 {
 	if (value < od_table->min[setting]) {
-		pr_warn("OD setting (%d, %d) is less than the minimum allowed (%d)\n", setting, value, od_table->min[setting]);
+		dev_warn(smu->adev->dev, "OD setting (%d, %d) is less than the minimum allowed (%d)\n", setting, value, od_table->min[setting]);
 		return -EINVAL;
 	}
 	if (value > od_table->max[setting]) {
-		pr_warn("OD setting (%d, %d) is greater than the maximum allowed (%d)\n", setting, value, od_table->max[setting]);
+		dev_warn(smu->adev->dev, "OD setting (%d, %d) is greater than the maximum allowed (%d)\n", setting, value, od_table->max[setting]);
 		return -EINVAL;
 	}
 	return 0;
@@ -2020,7 +2025,7 @@ static int navi10_overdrive_get_gfx_clk_base_voltage(struct smu_context *smu,
 					  param,
 					  &value);
 	if (ret) {
-		pr_err("[GetBaseVoltage] failed to get GFXCLK AVFS voltage from SMU!");
+		dev_err(smu->adev->dev, "[GetBaseVoltage] failed to get GFXCLK AVFS voltage from SMU!");
 		return ret;
 	}
 
@@ -2051,7 +2056,7 @@ static int navi10_set_default_od_settings(struct smu_context *smu)
 
 	ret = smu_update_table(smu, SMU_TABLE_OVERDRIVE, 0, (void *)od_table, false);
 	if (ret) {
-		pr_err("Failed to get overdrive table!\n");
+		dev_err(smu->adev->dev, "Failed to get overdrive table!\n");
 		return ret;
 	}
 
@@ -2081,7 +2086,7 @@ static int navi10_set_default_od_settings(struct smu_context *smu)
 
 	memcpy(boot_od_table, od_table, sizeof(OverDriveTable_t));
 
-	navi10_dump_od_table(od_table);
+	navi10_dump_od_table(smu, od_table);
 
 	return 0;
 }
@@ -2097,12 +2102,12 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 	od_table = (OverDriveTable_t *)table_context->overdrive_table;
 
 	if (!smu->od_enabled) {
-		pr_warn("OverDrive is not enabled!\n");
+		dev_warn(smu->adev->dev, "OverDrive is not enabled!\n");
 		return -EINVAL;
 	}
 
 	if (!smu->od_settings) {
-		pr_err("OD board limits are not set!\n");
+		dev_err(smu->adev->dev, "OD board limits are not set!\n");
 		return -ENOENT;
 	}
 
@@ -2111,16 +2116,16 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 	switch (type) {
 	case PP_OD_EDIT_SCLK_VDDC_TABLE:
 		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_GFXCLK_LIMITS)) {
-			pr_warn("GFXCLK_LIMITS not supported!\n");
+			dev_warn(smu->adev->dev, "GFXCLK_LIMITS not supported!\n");
 			return -ENOTSUPP;
 		}
 		if (!table_context->overdrive_table) {
-			pr_err("Overdrive is not initialized\n");
+			dev_err(smu->adev->dev, "Overdrive is not initialized\n");
 			return -EINVAL;
 		}
 		for (i = 0; i < size; i += 2) {
 			if (i + 2 > size) {
-				pr_info("invalid number of input parameters %d\n", size);
+				dev_info(smu->adev->dev, "invalid number of input parameters %d\n", size);
 				return -EINVAL;
 			}
 			switch (input[i]) {
@@ -2128,7 +2133,7 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 				freq_setting = SMU_11_0_ODSETTING_GFXCLKFMIN;
 				freq_ptr = &od_table->GfxclkFmin;
 				if (input[i + 1] > od_table->GfxclkFmax) {
-					pr_info("GfxclkFmin (%ld) must be <= GfxclkFmax (%u)!\n",
+					dev_info(smu->adev->dev, "GfxclkFmin (%ld) must be <= GfxclkFmax (%u)!\n",
 						input[i + 1],
 						od_table->GfxclkFmin);
 					return -EINVAL;
@@ -2138,18 +2143,18 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 				freq_setting = SMU_11_0_ODSETTING_GFXCLKFMAX;
 				freq_ptr = &od_table->GfxclkFmax;
 				if (input[i + 1] < od_table->GfxclkFmin) {
-					pr_info("GfxclkFmax (%ld) must be >= GfxclkFmin (%u)!\n",
+					dev_info(smu->adev->dev, "GfxclkFmax (%ld) must be >= GfxclkFmin (%u)!\n",
 						input[i + 1],
 						od_table->GfxclkFmax);
 					return -EINVAL;
 				}
 				break;
 			default:
-				pr_info("Invalid SCLK_VDDC_TABLE index: %ld\n", input[i]);
-				pr_info("Supported indices: [0:min,1:max]\n");
+				dev_info(smu->adev->dev, "Invalid SCLK_VDDC_TABLE index: %ld\n", input[i]);
+				dev_info(smu->adev->dev, "Supported indices: [0:min,1:max]\n");
 				return -EINVAL;
 			}
-			ret = navi10_od_setting_check_range(od_settings, freq_setting, input[i + 1]);
+			ret = navi10_od_setting_check_range(smu, od_settings, freq_setting, input[i + 1]);
 			if (ret)
 				return ret;
 			*freq_ptr = input[i + 1];
@@ -2157,35 +2162,35 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 		break;
 	case PP_OD_EDIT_MCLK_VDDC_TABLE:
 		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_UCLK_MAX)) {
-			pr_warn("UCLK_MAX not supported!\n");
+			dev_warn(smu->adev->dev, "UCLK_MAX not supported!\n");
 			return -ENOTSUPP;
 		}
 		if (size < 2) {
-			pr_info("invalid number of parameters: %d\n", size);
+			dev_info(smu->adev->dev, "invalid number of parameters: %d\n", size);
 			return -EINVAL;
 		}
 		if (input[0] != 1) {
-			pr_info("Invalid MCLK_VDDC_TABLE index: %ld\n", input[0]);
-			pr_info("Supported indices: [1:max]\n");
+			dev_info(smu->adev->dev, "Invalid MCLK_VDDC_TABLE index: %ld\n", input[0]);
+			dev_info(smu->adev->dev, "Supported indices: [1:max]\n");
 			return -EINVAL;
 		}
-		ret = navi10_od_setting_check_range(od_settings, SMU_11_0_ODSETTING_UCLKFMAX, input[1]);
+		ret = navi10_od_setting_check_range(smu, od_settings, SMU_11_0_ODSETTING_UCLKFMAX, input[1]);
 		if (ret)
 			return ret;
 		od_table->UclkFmax = input[1];
 		break;
 	case PP_OD_RESTORE_DEFAULT_TABLE:
 		if (!(table_context->overdrive_table && table_context->boot_overdrive_table)) {
-			pr_err("Overdrive table was not initialized!\n");
+			dev_err(smu->adev->dev, "Overdrive table was not initialized!\n");
 			return -EINVAL;
 		}
 		memcpy(table_context->overdrive_table, table_context->boot_overdrive_table, sizeof(OverDriveTable_t));
 		break;
 	case PP_OD_COMMIT_DPM_TABLE:
-		navi10_dump_od_table(od_table);
+		navi10_dump_od_table(smu, od_table);
 		ret = smu_update_table(smu, SMU_TABLE_OVERDRIVE, 0, (void *)od_table, true);
 		if (ret) {
-			pr_err("Failed to import overdrive table!\n");
+			dev_err(smu->adev->dev, "Failed to import overdrive table!\n");
 			return ret;
 		}
 		// no lock needed because smu_od_edit_dpm_table has it
@@ -2198,15 +2203,15 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 		break;
 	case PP_OD_EDIT_VDDC_CURVE:
 		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_GFXCLK_CURVE)) {
-			pr_warn("GFXCLK_CURVE not supported!\n");
+			dev_warn(smu->adev->dev, "GFXCLK_CURVE not supported!\n");
 			return -ENOTSUPP;
 		}
 		if (size < 3) {
-			pr_info("invalid number of parameters: %d\n", size);
+			dev_info(smu->adev->dev, "invalid number of parameters: %d\n", size);
 			return -EINVAL;
 		}
 		if (!od_table) {
-			pr_info("Overdrive is not initialized\n");
+			dev_info(smu->adev->dev, "Overdrive is not initialized\n");
 			return -EINVAL;
 		}
 
@@ -2230,28 +2235,28 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 			voltage_ptr = &od_table->GfxclkVolt3;
 			break;
 		default:
-			pr_info("Invalid VDDC_CURVE index: %ld\n", input[0]);
-			pr_info("Supported indices: [0, 1, 2]\n");
+			dev_info(smu->adev->dev, "Invalid VDDC_CURVE index: %ld\n", input[0]);
+			dev_info(smu->adev->dev, "Supported indices: [0, 1, 2]\n");
 			return -EINVAL;
 		}
-		ret = navi10_od_setting_check_range(od_settings, freq_setting, input[1]);
+		ret = navi10_od_setting_check_range(smu, od_settings, freq_setting, input[1]);
 		if (ret)
 			return ret;
 		// Allow setting zero to disable the OverDrive VDDC curve
 		if (input[2] != 0) {
-			ret = navi10_od_setting_check_range(od_settings, voltage_setting, input[2]);
+			ret = navi10_od_setting_check_range(smu, od_settings, voltage_setting, input[2]);
 			if (ret)
 				return ret;
 			*freq_ptr = input[1];
 			*voltage_ptr = ((uint16_t)input[2]) * NAVI10_VOLTAGE_SCALE;
-			pr_debug("OD: set curve %ld: (%d, %d)\n", input[0], *freq_ptr, *voltage_ptr);
+			dev_dbg(smu->adev->dev, "OD: set curve %ld: (%d, %d)\n", input[0], *freq_ptr, *voltage_ptr);
 		} else {
 			// If setting 0, disable all voltage curve settings
 			od_table->GfxclkVolt1 = 0;
 			od_table->GfxclkVolt2 = 0;
 			od_table->GfxclkVolt3 = 0;
 		}
-		navi10_dump_od_table(od_table);
+		navi10_dump_od_table(smu, od_table);
 		break;
 	default:
 		return -ENOSYS;
@@ -2265,7 +2270,7 @@ static int navi10_run_btc(struct smu_context *smu)
 
 	ret = smu_send_smc_msg(smu, SMU_MSG_RunBtc, NULL);
 	if (ret)
-		pr_err("RunBtc failed!\n");
+		dev_err(smu->adev->dev, "RunBtc failed!\n");
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
index 725e086c267c..7cc3f0cd6aa7 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -175,7 +175,7 @@ static int renoir_get_metrics_table(struct smu_context *smu,
 		ret = smu_update_table(smu, SMU_TABLE_SMU_METRICS, 0,
 				(void *)smu_table->metrics_table, false);
 		if (ret) {
-			pr_info("Failed to export SMU metrics table!\n");
+			dev_info(smu->adev->dev, "Failed to export SMU metrics table!\n");
 			mutex_unlock(&smu->metrics_lock);
 			return ret;
 		}
@@ -508,7 +508,7 @@ static int renoir_get_current_activity_percent(struct smu_context *smu,
 		*value = metrics.AverageGfxActivity / 100;
 		break;
 	default:
-		pr_err("Invalid sensor for retrieving clock activity\n");
+		dev_err(smu->adev->dev, "Invalid sensor for retrieving clock activity\n");
 		return -EINVAL;
 	}
 
@@ -620,7 +620,7 @@ static int renoir_force_clk_levels(struct smu_context *smu,
 	case SMU_GFXCLK:
 	case SMU_SCLK:
 		if (soft_min_level > 2 || soft_max_level > 2) {
-			pr_info("Currently sclk only support 3 levels on APU\n");
+			dev_info(smu->adev->dev, "Currently sclk only support 3 levels on APU\n");
 			return -EINVAL;
 		}
 
@@ -674,7 +674,7 @@ static int renoir_set_power_profile_mode(struct smu_context *smu, long *input, u
 	uint32_t profile_mode = input[size];
 
 	if (profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
-		pr_err("Invalid power profile mode %d\n", smu->power_profile_mode);
+		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", smu->power_profile_mode);
 		return -EINVAL;
 	}
 
@@ -685,7 +685,7 @@ static int renoir_set_power_profile_mode(struct smu_context *smu, long *input, u
 		 * TODO: If some case need switch to powersave/default power mode
 		 * then can consider enter WORKLOAD_COMPUTE/WORKLOAD_CUSTOM for power saving.
 		 */
-		pr_err_once("Unsupported power profile mode %d on RENOIR\n",smu->power_profile_mode);
+		dev_err_once(smu->adev->dev, "Unsupported power profile mode %d on RENOIR\n",smu->power_profile_mode);
 		return -EINVAL;
 	}
 
@@ -693,7 +693,7 @@ static int renoir_set_power_profile_mode(struct smu_context *smu, long *input, u
 				    1 << workload_type,
 				    NULL);
 	if (ret) {
-		pr_err_once("Fail to set workload type %d\n", workload_type);
+		dev_err_once(smu->adev->dev, "Fail to set workload type %d\n", workload_type);
 		return ret;
 	}
 
@@ -826,7 +826,7 @@ static int renoir_set_watermarks_table(
 	if (!(smu->watermarks_bitmap & WATERMARKS_LOADED)) {
 		ret = smu_write_watermarks_table(smu);
 		if (ret) {
-			pr_err("Failed to update WMTABLE!");
+			dev_err(smu->adev->dev, "Failed to update WMTABLE!");
 			return ret;
 		}
 		smu->watermarks_bitmap |= WATERMARKS_LOADED;
diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index 78657696b427..8ba40926b641 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -564,7 +564,7 @@ static int sienna_cichlid_get_smu_metrics_data(struct smu_context *smu,
 				       smu_table->metrics_table,
 				       false);
 		if (ret) {
-			pr_info("Failed to export SMU metrics table!\n");
+			dev_info(smu->adev->dev, "Failed to export SMU metrics table!\n");
 			mutex_unlock(&smu->metrics_lock);
 			return ret;
 		}
@@ -1129,7 +1129,7 @@ static int sienna_cichlid_get_current_activity_percent(struct smu_context *smu,
 							  value);
 		break;
 	default:
-		pr_err("Invalid sensor for retrieving clock activity\n");
+		dev_err(smu->adev->dev, "Invalid sensor for retrieving clock activity\n");
 		return -EINVAL;
 	}
 
@@ -1220,7 +1220,7 @@ static int sienna_cichlid_get_power_profile_mode(struct smu_context *smu, char *
 					  SMU_TABLE_ACTIVITY_MONITOR_COEFF, workload_type,
 					  (void *)(&activity_monitor), false);
 		if (result) {
-			pr_err("[%s] Failed to get activity monitor!", __func__);
+			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
 			return result;
 		}
 
@@ -1281,7 +1281,7 @@ static int sienna_cichlid_set_power_profile_mode(struct smu_context *smu, long *
 	smu->power_profile_mode = input[size];
 
 	if (smu->power_profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
-		pr_err("Invalid power profile mode %d\n", smu->power_profile_mode);
+		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", smu->power_profile_mode);
 		return -EINVAL;
 	}
 
@@ -1291,7 +1291,7 @@ static int sienna_cichlid_set_power_profile_mode(struct smu_context *smu, long *
 				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
 				       (void *)(&activity_monitor), false);
 		if (ret) {
-			pr_err("[%s] Failed to get activity monitor!", __func__);
+			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
 			return ret;
 		}
 
@@ -1335,7 +1335,7 @@ static int sienna_cichlid_set_power_profile_mode(struct smu_context *smu, long *
 				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
 				       (void *)(&activity_monitor), true);
 		if (ret) {
-			pr_err("[%s] Failed to set activity monitor!", __func__);
+			dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
 			return ret;
 		}
 	}
@@ -1416,19 +1416,19 @@ static int sienna_cichlid_notify_smc_display_config(struct smu_context *smu)
 								  min_clocks.dcef_clock_in_sr/100,
 								  NULL);
 				if (ret) {
-					pr_err("Attempt to set divider for DCEFCLK Failed!");
+					dev_err(smu->adev->dev, "Attempt to set divider for DCEFCLK Failed!");
 					return ret;
 				}
 			}
 		} else {
-			pr_info("Attempt to set Hard Min for DCEFCLK Failed!");
+			dev_info(smu->adev->dev, "Attempt to set Hard Min for DCEFCLK Failed!");
 		}
 	}
 
 	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
 		ret = smu_set_hard_freq_range(smu, SMU_UCLK, min_clocks.memory_clock/100, 0);
 		if (ret) {
-			pr_err("[%s] Set hard min uclk failed!", __func__);
+			dev_err(smu->adev->dev, "[%s] Set hard min uclk failed!", __func__);
 			return ret;
 		}
 	}
@@ -1499,7 +1499,7 @@ static int sienna_cichlid_set_watermarks_table(struct smu_context *smu,
 	if (!(smu->watermarks_bitmap & WATERMARKS_LOADED)) {
 		ret = smu_write_watermarks_table(smu);
 		if (ret) {
-			pr_err("Failed to update WMTABLE!");
+			dev_err(smu->adev->dev, "Failed to update WMTABLE!");
 			return ret;
 		}
 		smu->watermarks_bitmap |= WATERMARKS_LOADED;
@@ -1534,7 +1534,7 @@ static int sienna_cichlid_thermal_get_temperature(struct smu_context *smu,
 							  value);
 		break;
 	default:
-		pr_err("Invalid sensor for retrieving temp\n");
+		dev_err(smu->adev->dev, "Invalid sensor for retrieving temp\n");
 		return -EINVAL;
 	}
 
@@ -1749,13 +1749,13 @@ static int sienna_cichlid_get_power_limit(struct smu_context *smu,
 			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetPptLimit,
 							  power_src << 16, &asic_default_power_limit);
 			if (ret) {
-				pr_err("[%s] get PPT limit failed!", __func__);
+				dev_err(smu->adev->dev, "[%s] get PPT limit failed!", __func__);
 				return ret;
 			}
 		} else {
 			/* the last hope to figure out the ppt limit */
 			if (!pptable) {
-				pr_err("Cannot get PPT limit due to pptable missing!");
+				dev_err(smu->adev->dev, "Cannot get PPT limit due to pptable missing!");
 				return -EINVAL;
 			}
 			asic_default_power_limit =
@@ -1860,79 +1860,79 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 	PPTable_t *pptable = table_context->driver_pptable;
 	int i;
 
-	pr_info("Dumped PPTable:\n");
+	dev_info(smu->adev->dev, "Dumped PPTable:\n");
 
-	pr_info("Version = 0x%08x\n", pptable->Version);
-	pr_info("FeaturesToRun[0] = 0x%08x\n", pptable->FeaturesToRun[0]);
-	pr_info("FeaturesToRun[1] = 0x%08x\n", pptable->FeaturesToRun[1]);
+	dev_info(smu->adev->dev, "Version = 0x%08x\n", pptable->Version);
+	dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", pptable->FeaturesToRun[0]);
+	dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", pptable->FeaturesToRun[1]);
 
 	for (i = 0; i < PPT_THROTTLER_COUNT; i++) {
-		pr_info("SocketPowerLimitAc[%d] = 0x%x\n", i, pptable->SocketPowerLimitAc[i]);
-		pr_info("SocketPowerLimitAcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitAcTau[i]);
-		pr_info("SocketPowerLimitDc[%d] = 0x%x\n", i, pptable->SocketPowerLimitDc[i]);
-		pr_info("SocketPowerLimitDcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitDcTau[i]);
+		dev_info(smu->adev->dev, "SocketPowerLimitAc[%d] = 0x%x\n", i, pptable->SocketPowerLimitAc[i]);
+		dev_info(smu->adev->dev, "SocketPowerLimitAcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitAcTau[i]);
+		dev_info(smu->adev->dev, "SocketPowerLimitDc[%d] = 0x%x\n", i, pptable->SocketPowerLimitDc[i]);
+		dev_info(smu->adev->dev, "SocketPowerLimitDcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitDcTau[i]);
 	}
 
 	for (i = 0; i < TDC_THROTTLER_COUNT; i++) {
-		pr_info("TdcLimit[%d] = 0x%x\n", i, pptable->TdcLimit[i]);
-		pr_info("TdcLimitTau[%d] = 0x%x\n", i, pptable->TdcLimitTau[i]);
+		dev_info(smu->adev->dev, "TdcLimit[%d] = 0x%x\n", i, pptable->TdcLimit[i]);
+		dev_info(smu->adev->dev, "TdcLimitTau[%d] = 0x%x\n", i, pptable->TdcLimitTau[i]);
 	}
 
 	for (i = 0; i < TEMP_COUNT; i++) {
-		pr_info("TemperatureLimit[%d] = 0x%x\n", i, pptable->TemperatureLimit[i]);
+		dev_info(smu->adev->dev, "TemperatureLimit[%d] = 0x%x\n", i, pptable->TemperatureLimit[i]);
 	}
 
-	pr_info("FitLimit = 0x%x\n", pptable->FitLimit);
-	pr_info("TotalPowerConfig = 0x%x\n", pptable->TotalPowerConfig);
-	pr_info("TotalPowerPadding[0] = 0x%x\n", pptable->TotalPowerPadding[0]);
-	pr_info("TotalPowerPadding[1] = 0x%x\n", pptable->TotalPowerPadding[1]);
-	pr_info("TotalPowerPadding[2] = 0x%x\n", pptable->TotalPowerPadding[2]);
+	dev_info(smu->adev->dev, "FitLimit = 0x%x\n", pptable->FitLimit);
+	dev_info(smu->adev->dev, "TotalPowerConfig = 0x%x\n", pptable->TotalPowerConfig);
+	dev_info(smu->adev->dev, "TotalPowerPadding[0] = 0x%x\n", pptable->TotalPowerPadding[0]);
+	dev_info(smu->adev->dev, "TotalPowerPadding[1] = 0x%x\n", pptable->TotalPowerPadding[1]);
+	dev_info(smu->adev->dev, "TotalPowerPadding[2] = 0x%x\n", pptable->TotalPowerPadding[2]);
 
-	pr_info("ApccPlusResidencyLimit = 0x%x\n", pptable->ApccPlusResidencyLimit);
+	dev_info(smu->adev->dev, "ApccPlusResidencyLimit = 0x%x\n", pptable->ApccPlusResidencyLimit);
 	for (i = 0; i < NUM_SMNCLK_DPM_LEVELS; i++) {
-		pr_info("SmnclkDpmFreq[%d] = 0x%x\n", i, pptable->SmnclkDpmFreq[i]);
-		pr_info("SmnclkDpmVoltage[%d] = 0x%x\n", i, pptable->SmnclkDpmVoltage[i]);
+		dev_info(smu->adev->dev, "SmnclkDpmFreq[%d] = 0x%x\n", i, pptable->SmnclkDpmFreq[i]);
+		dev_info(smu->adev->dev, "SmnclkDpmVoltage[%d] = 0x%x\n", i, pptable->SmnclkDpmVoltage[i]);
 	}
-	pr_info("PaddingAPCC[0] = 0x%x\n", pptable->PaddingAPCC[0]);
-	pr_info("PaddingAPCC[1] = 0x%x\n", pptable->PaddingAPCC[1]);
-	pr_info("PaddingAPCC[2] = 0x%x\n", pptable->PaddingAPCC[2]);
-	pr_info("PaddingAPCC[3] = 0x%x\n", pptable->PaddingAPCC[3]);
-
-	pr_info("ThrottlerControlMask = 0x%x\n", pptable->ThrottlerControlMask);
-
-	pr_info("FwDStateMask = 0x%x\n", pptable->FwDStateMask);
-
-	pr_info("UlvVoltageOffsetSoc = 0x%x\n", pptable->UlvVoltageOffsetSoc);
-	pr_info("UlvVoltageOffsetGfx = 0x%x\n", pptable->UlvVoltageOffsetGfx);
-	pr_info("MinVoltageUlvGfx = 0x%x\n", pptable->MinVoltageUlvGfx);
-	pr_info("MinVoltageUlvSoc = 0x%x\n", pptable->MinVoltageUlvSoc);
-
-	pr_info("SocLIVmin = 0x%x\n", pptable->SocLIVmin);
-	pr_info("PaddingLIVmin = 0x%x\n", pptable->PaddingLIVmin);
-
-	pr_info("GceaLinkMgrIdleThreshold = 0x%x\n", pptable->GceaLinkMgrIdleThreshold);
-	pr_info("paddingRlcUlvParams[0] = 0x%x\n", pptable->paddingRlcUlvParams[0]);
-	pr_info("paddingRlcUlvParams[1] = 0x%x\n", pptable->paddingRlcUlvParams[1]);
-	pr_info("paddingRlcUlvParams[2] = 0x%x\n", pptable->paddingRlcUlvParams[2]);
-
-	pr_info("MinVoltageGfx = 0x%x\n", pptable->MinVoltageGfx);
-	pr_info("MinVoltageSoc = 0x%x\n", pptable->MinVoltageSoc);
-	pr_info("MaxVoltageGfx = 0x%x\n", pptable->MaxVoltageGfx);
-	pr_info("MaxVoltageSoc = 0x%x\n", pptable->MaxVoltageSoc);
-
-	pr_info("LoadLineResistanceGfx = 0x%x\n", pptable->LoadLineResistanceGfx);
-	pr_info("LoadLineResistanceSoc = 0x%x\n", pptable->LoadLineResistanceSoc);
-
-	pr_info("VDDGFX_TVmin = 0x%x\n", pptable->VDDGFX_TVmin);
-	pr_info("VDDSOC_TVmin = 0x%x\n", pptable->VDDSOC_TVmin);
-	pr_info("VDDGFX_Vmin_HiTemp = 0x%x\n", pptable->VDDGFX_Vmin_HiTemp);
-	pr_info("VDDGFX_Vmin_LoTemp = 0x%x\n", pptable->VDDGFX_Vmin_LoTemp);
-	pr_info("VDDSOC_Vmin_HiTemp = 0x%x\n", pptable->VDDSOC_Vmin_HiTemp);
-	pr_info("VDDSOC_Vmin_LoTemp = 0x%x\n", pptable->VDDSOC_Vmin_LoTemp);
-	pr_info("VDDGFX_TVminHystersis = 0x%x\n", pptable->VDDGFX_TVminHystersis);
-	pr_info("VDDSOC_TVminHystersis = 0x%x\n", pptable->VDDSOC_TVminHystersis);
-
-	pr_info("[PPCLK_GFXCLK]\n"
+	dev_info(smu->adev->dev, "PaddingAPCC[0] = 0x%x\n", pptable->PaddingAPCC[0]);
+	dev_info(smu->adev->dev, "PaddingAPCC[1] = 0x%x\n", pptable->PaddingAPCC[1]);
+	dev_info(smu->adev->dev, "PaddingAPCC[2] = 0x%x\n", pptable->PaddingAPCC[2]);
+	dev_info(smu->adev->dev, "PaddingAPCC[3] = 0x%x\n", pptable->PaddingAPCC[3]);
+
+	dev_info(smu->adev->dev, "ThrottlerControlMask = 0x%x\n", pptable->ThrottlerControlMask);
+
+	dev_info(smu->adev->dev, "FwDStateMask = 0x%x\n", pptable->FwDStateMask);
+
+	dev_info(smu->adev->dev, "UlvVoltageOffsetSoc = 0x%x\n", pptable->UlvVoltageOffsetSoc);
+	dev_info(smu->adev->dev, "UlvVoltageOffsetGfx = 0x%x\n", pptable->UlvVoltageOffsetGfx);
+	dev_info(smu->adev->dev, "MinVoltageUlvGfx = 0x%x\n", pptable->MinVoltageUlvGfx);
+	dev_info(smu->adev->dev, "MinVoltageUlvSoc = 0x%x\n", pptable->MinVoltageUlvSoc);
+
+	dev_info(smu->adev->dev, "SocLIVmin = 0x%x\n", pptable->SocLIVmin);
+	dev_info(smu->adev->dev, "PaddingLIVmin = 0x%x\n", pptable->PaddingLIVmin);
+
+	dev_info(smu->adev->dev, "GceaLinkMgrIdleThreshold = 0x%x\n", pptable->GceaLinkMgrIdleThreshold);
+	dev_info(smu->adev->dev, "paddingRlcUlvParams[0] = 0x%x\n", pptable->paddingRlcUlvParams[0]);
+	dev_info(smu->adev->dev, "paddingRlcUlvParams[1] = 0x%x\n", pptable->paddingRlcUlvParams[1]);
+	dev_info(smu->adev->dev, "paddingRlcUlvParams[2] = 0x%x\n", pptable->paddingRlcUlvParams[2]);
+
+	dev_info(smu->adev->dev, "MinVoltageGfx = 0x%x\n", pptable->MinVoltageGfx);
+	dev_info(smu->adev->dev, "MinVoltageSoc = 0x%x\n", pptable->MinVoltageSoc);
+	dev_info(smu->adev->dev, "MaxVoltageGfx = 0x%x\n", pptable->MaxVoltageGfx);
+	dev_info(smu->adev->dev, "MaxVoltageSoc = 0x%x\n", pptable->MaxVoltageSoc);
+
+	dev_info(smu->adev->dev, "LoadLineResistanceGfx = 0x%x\n", pptable->LoadLineResistanceGfx);
+	dev_info(smu->adev->dev, "LoadLineResistanceSoc = 0x%x\n", pptable->LoadLineResistanceSoc);
+
+	dev_info(smu->adev->dev, "VDDGFX_TVmin = 0x%x\n", pptable->VDDGFX_TVmin);
+	dev_info(smu->adev->dev, "VDDSOC_TVmin = 0x%x\n", pptable->VDDSOC_TVmin);
+	dev_info(smu->adev->dev, "VDDGFX_Vmin_HiTemp = 0x%x\n", pptable->VDDGFX_Vmin_HiTemp);
+	dev_info(smu->adev->dev, "VDDGFX_Vmin_LoTemp = 0x%x\n", pptable->VDDGFX_Vmin_LoTemp);
+	dev_info(smu->adev->dev, "VDDSOC_Vmin_HiTemp = 0x%x\n", pptable->VDDSOC_Vmin_HiTemp);
+	dev_info(smu->adev->dev, "VDDSOC_Vmin_LoTemp = 0x%x\n", pptable->VDDSOC_Vmin_LoTemp);
+	dev_info(smu->adev->dev, "VDDGFX_TVminHystersis = 0x%x\n", pptable->VDDGFX_TVminHystersis);
+	dev_info(smu->adev->dev, "VDDSOC_TVminHystersis = 0x%x\n", pptable->VDDSOC_TVminHystersis);
+
+	dev_info(smu->adev->dev, "[PPCLK_GFXCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -1953,7 +1953,7 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_GFXCLK].SsFmin,
 			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding16);
 
-	pr_info("[PPCLK_SOCCLK]\n"
+	dev_info(smu->adev->dev, "[PPCLK_SOCCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -1974,7 +1974,7 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_SOCCLK].SsFmin,
 			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding16);
 
-	pr_info("[PPCLK_UCLK]\n"
+	dev_info(smu->adev->dev, "[PPCLK_UCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -1995,7 +1995,7 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_UCLK].SsFmin,
 			pptable->DpmDescriptor[PPCLK_UCLK].Padding16);
 
-	pr_info("[PPCLK_FCLK]\n"
+	dev_info(smu->adev->dev, "[PPCLK_FCLK]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -2016,7 +2016,7 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_FCLK].SsFmin,
 			pptable->DpmDescriptor[PPCLK_FCLK].Padding16);
 
-	pr_info("[PPCLK_DCLK_0]\n"
+	dev_info(smu->adev->dev, "[PPCLK_DCLK_0]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -2037,7 +2037,7 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_DCLK_0].SsFmin,
 			pptable->DpmDescriptor[PPCLK_DCLK_0].Padding16);
 
-	pr_info("[PPCLK_VCLK_0]\n"
+	dev_info(smu->adev->dev, "[PPCLK_VCLK_0]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -2058,7 +2058,7 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_VCLK_0].SsFmin,
 			pptable->DpmDescriptor[PPCLK_VCLK_0].Padding16);
 
-	pr_info("[PPCLK_DCLK_1]\n"
+	dev_info(smu->adev->dev, "[PPCLK_DCLK_1]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -2079,7 +2079,7 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_DCLK_1].SsFmin,
 			pptable->DpmDescriptor[PPCLK_DCLK_1].Padding16);
 
-	pr_info("[PPCLK_VCLK_1]\n"
+	dev_info(smu->adev->dev, "[PPCLK_VCLK_1]\n"
 			"  .VoltageMode          = 0x%02x\n"
 			"  .SnapToDiscrete       = 0x%02x\n"
 			"  .NumDiscreteLevels    = 0x%02x\n"
@@ -2100,425 +2100,425 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 			pptable->DpmDescriptor[PPCLK_VCLK_1].SsFmin,
 			pptable->DpmDescriptor[PPCLK_VCLK_1].Padding16);
 
-	pr_info("FreqTableGfx\n");
+	dev_info(smu->adev->dev, "FreqTableGfx\n");
 	for (i = 0; i < NUM_GFXCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableGfx[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableGfx[i]);
 
-	pr_info("FreqTableVclk\n");
+	dev_info(smu->adev->dev, "FreqTableVclk\n");
 	for (i = 0; i < NUM_VCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableVclk[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableVclk[i]);
 
-	pr_info("FreqTableDclk\n");
+	dev_info(smu->adev->dev, "FreqTableDclk\n");
 	for (i = 0; i < NUM_DCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableDclk[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableDclk[i]);
 
-	pr_info("FreqTableSocclk\n");
+	dev_info(smu->adev->dev, "FreqTableSocclk\n");
 	for (i = 0; i < NUM_SOCCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableSocclk[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableSocclk[i]);
 
-	pr_info("FreqTableUclk\n");
+	dev_info(smu->adev->dev, "FreqTableUclk\n");
 	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableUclk[i]);
+		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableUclk[i]);
 
-	pr_info("FreqTableFclk\n");
+	dev_info(smu->adev->dev, "FreqTableFclk\n");
 	for (i = 0; i < NUM_FCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableFclk[i]);
-
-	pr_info("Paddingclks[0] = 0x%x\n",  pptable->Paddingclks[0]);
-	pr_info("Paddingclks[1] = 0x%x\n",  pptable->Paddingclks[1]);
-	pr_info("Paddingclks[2] = 0x%x\n",  pptable->Paddingclks[2]);
-	pr_info("Paddingclks[3] = 0x%x\n",  pptable->Paddingclks[3]);
-	pr_info("Paddingclks[4] = 0x%x\n",  pptable->Paddingclks[4]);
-	pr_info("Paddingclks[5] = 0x%x\n",  pptable->Paddingclks[5]);
-	pr_info("Paddingclks[6] = 0x%x\n",  pptable->Paddingclks[6]);
-	pr_info("Paddingclks[7] = 0x%x\n",  pptable->Paddingclks[7]);
-	pr_info("Paddingclks[8] = 0x%x\n",  pptable->Paddingclks[8]);
-	pr_info("Paddingclks[9] = 0x%x\n",  pptable->Paddingclks[9]);
-	pr_info("Paddingclks[10] = 0x%x\n", pptable->Paddingclks[10]);
-	pr_info("Paddingclks[11] = 0x%x\n", pptable->Paddingclks[11]);
-	pr_info("Paddingclks[12] = 0x%x\n", pptable->Paddingclks[12]);
-	pr_info("Paddingclks[13] = 0x%x\n", pptable->Paddingclks[13]);
-	pr_info("Paddingclks[14] = 0x%x\n", pptable->Paddingclks[14]);
-	pr_info("Paddingclks[15] = 0x%x\n", pptable->Paddingclks[15]);
-
-	pr_info("DcModeMaxFreq\n");
-	pr_info("  .PPCLK_GFXCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_GFXCLK]);
-	pr_info("  .PPCLK_SOCCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_SOCCLK]);
-	pr_info("  .PPCLK_UCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_UCLK]);
-	pr_info("  .PPCLK_FCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_FCLK]);
-	pr_info("  .PPCLK_DCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_0]);
-	pr_info("  .PPCLK_VCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_0]);
-	pr_info("  .PPCLK_DCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_1]);
-	pr_info("  .PPCLK_VCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_1]);
-
-	pr_info("FreqTableUclkDiv\n");
+		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableFclk[i]);
+
+	dev_info(smu->adev->dev, "Paddingclks[0] = 0x%x\n",  pptable->Paddingclks[0]);
+	dev_info(smu->adev->dev, "Paddingclks[1] = 0x%x\n",  pptable->Paddingclks[1]);
+	dev_info(smu->adev->dev, "Paddingclks[2] = 0x%x\n",  pptable->Paddingclks[2]);
+	dev_info(smu->adev->dev, "Paddingclks[3] = 0x%x\n",  pptable->Paddingclks[3]);
+	dev_info(smu->adev->dev, "Paddingclks[4] = 0x%x\n",  pptable->Paddingclks[4]);
+	dev_info(smu->adev->dev, "Paddingclks[5] = 0x%x\n",  pptable->Paddingclks[5]);
+	dev_info(smu->adev->dev, "Paddingclks[6] = 0x%x\n",  pptable->Paddingclks[6]);
+	dev_info(smu->adev->dev, "Paddingclks[7] = 0x%x\n",  pptable->Paddingclks[7]);
+	dev_info(smu->adev->dev, "Paddingclks[8] = 0x%x\n",  pptable->Paddingclks[8]);
+	dev_info(smu->adev->dev, "Paddingclks[9] = 0x%x\n",  pptable->Paddingclks[9]);
+	dev_info(smu->adev->dev, "Paddingclks[10] = 0x%x\n", pptable->Paddingclks[10]);
+	dev_info(smu->adev->dev, "Paddingclks[11] = 0x%x\n", pptable->Paddingclks[11]);
+	dev_info(smu->adev->dev, "Paddingclks[12] = 0x%x\n", pptable->Paddingclks[12]);
+	dev_info(smu->adev->dev, "Paddingclks[13] = 0x%x\n", pptable->Paddingclks[13]);
+	dev_info(smu->adev->dev, "Paddingclks[14] = 0x%x\n", pptable->Paddingclks[14]);
+	dev_info(smu->adev->dev, "Paddingclks[15] = 0x%x\n", pptable->Paddingclks[15]);
+
+	dev_info(smu->adev->dev, "DcModeMaxFreq\n");
+	dev_info(smu->adev->dev, "  .PPCLK_GFXCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_GFXCLK]);
+	dev_info(smu->adev->dev, "  .PPCLK_SOCCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_SOCCLK]);
+	dev_info(smu->adev->dev, "  .PPCLK_UCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_UCLK]);
+	dev_info(smu->adev->dev, "  .PPCLK_FCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_FCLK]);
+	dev_info(smu->adev->dev, "  .PPCLK_DCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_0]);
+	dev_info(smu->adev->dev, "  .PPCLK_VCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_0]);
+	dev_info(smu->adev->dev, "  .PPCLK_DCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_1]);
+	dev_info(smu->adev->dev, "  .PPCLK_VCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_1]);
+
+	dev_info(smu->adev->dev, "FreqTableUclkDiv\n");
 	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->FreqTableUclkDiv[i]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->FreqTableUclkDiv[i]);
 
-	pr_info("FclkBoostFreq = 0x%x\n", pptable->FclkBoostFreq);
-	pr_info("FclkParamPadding = 0x%x\n", pptable->FclkParamPadding);
+	dev_info(smu->adev->dev, "FclkBoostFreq = 0x%x\n", pptable->FclkBoostFreq);
+	dev_info(smu->adev->dev, "FclkParamPadding = 0x%x\n", pptable->FclkParamPadding);
 
-	pr_info("Mp0clkFreq\n");
+	dev_info(smu->adev->dev, "Mp0clkFreq\n");
 	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->Mp0clkFreq[i]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->Mp0clkFreq[i]);
 
-	pr_info("Mp0DpmVoltage\n");
+	dev_info(smu->adev->dev, "Mp0DpmVoltage\n");
 	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->Mp0DpmVoltage[i]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->Mp0DpmVoltage[i]);
 
-	pr_info("MemVddciVoltage\n");
+	dev_info(smu->adev->dev, "MemVddciVoltage\n");
 	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->MemVddciVoltage[i]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->MemVddciVoltage[i]);
 
-	pr_info("MemMvddVoltage\n");
+	dev_info(smu->adev->dev, "MemMvddVoltage\n");
 	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->MemMvddVoltage[i]);
-
-	pr_info("GfxclkFgfxoffEntry = 0x%x\n", pptable->GfxclkFgfxoffEntry);
-	pr_info("GfxclkFinit = 0x%x\n", pptable->GfxclkFinit);
-	pr_info("GfxclkFidle = 0x%x\n", pptable->GfxclkFidle);
-	pr_info("GfxclkSource = 0x%x\n", pptable->GfxclkSource);
-	pr_info("GfxclkPadding = 0x%x\n", pptable->GfxclkPadding);
-
-	pr_info("GfxGpoSubFeatureMask = 0x%x\n", pptable->GfxGpoSubFeatureMask);
-
-	pr_info("GfxGpoEnabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoEnabledWorkPolicyMask);
-	pr_info("GfxGpoDisabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoDisabledWorkPolicyMask);
-	pr_info("GfxGpoPadding[0] = 0x%x\n", pptable->GfxGpoPadding[0]);
-	pr_info("GfxGpoVotingAllow = 0x%x\n", pptable->GfxGpoVotingAllow);
-	pr_info("GfxGpoPadding32[0] = 0x%x\n", pptable->GfxGpoPadding32[0]);
-	pr_info("GfxGpoPadding32[1] = 0x%x\n", pptable->GfxGpoPadding32[1]);
-	pr_info("GfxGpoPadding32[2] = 0x%x\n", pptable->GfxGpoPadding32[2]);
-	pr_info("GfxGpoPadding32[3] = 0x%x\n", pptable->GfxGpoPadding32[3]);
-	pr_info("GfxDcsFopt = 0x%x\n", pptable->GfxDcsFopt);
-	pr_info("GfxDcsFclkFopt = 0x%x\n", pptable->GfxDcsFclkFopt);
-	pr_info("GfxDcsUclkFopt = 0x%x\n", pptable->GfxDcsUclkFopt);
-
-	pr_info("DcsGfxOffVoltage = 0x%x\n", pptable->DcsGfxOffVoltage);
-	pr_info("DcsMinGfxOffTime = 0x%x\n", pptable->DcsMinGfxOffTime);
-	pr_info("DcsMaxGfxOffTime = 0x%x\n", pptable->DcsMaxGfxOffTime);
-	pr_info("DcsMinCreditAccum = 0x%x\n", pptable->DcsMinCreditAccum);
-	pr_info("DcsExitHysteresis = 0x%x\n", pptable->DcsExitHysteresis);
-	pr_info("DcsTimeout = 0x%x\n", pptable->DcsTimeout);
-
-	pr_info("DcsParamPadding[0] = 0x%x\n", pptable->DcsParamPadding[0]);
-	pr_info("DcsParamPadding[1] = 0x%x\n", pptable->DcsParamPadding[1]);
-	pr_info("DcsParamPadding[2] = 0x%x\n", pptable->DcsParamPadding[2]);
-	pr_info("DcsParamPadding[3] = 0x%x\n", pptable->DcsParamPadding[3]);
-	pr_info("DcsParamPadding[4] = 0x%x\n", pptable->DcsParamPadding[4]);
-
-	pr_info("FlopsPerByteTable\n");
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->MemMvddVoltage[i]);
+
+	dev_info(smu->adev->dev, "GfxclkFgfxoffEntry = 0x%x\n", pptable->GfxclkFgfxoffEntry);
+	dev_info(smu->adev->dev, "GfxclkFinit = 0x%x\n", pptable->GfxclkFinit);
+	dev_info(smu->adev->dev, "GfxclkFidle = 0x%x\n", pptable->GfxclkFidle);
+	dev_info(smu->adev->dev, "GfxclkSource = 0x%x\n", pptable->GfxclkSource);
+	dev_info(smu->adev->dev, "GfxclkPadding = 0x%x\n", pptable->GfxclkPadding);
+
+	dev_info(smu->adev->dev, "GfxGpoSubFeatureMask = 0x%x\n", pptable->GfxGpoSubFeatureMask);
+
+	dev_info(smu->adev->dev, "GfxGpoEnabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoEnabledWorkPolicyMask);
+	dev_info(smu->adev->dev, "GfxGpoDisabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoDisabledWorkPolicyMask);
+	dev_info(smu->adev->dev, "GfxGpoPadding[0] = 0x%x\n", pptable->GfxGpoPadding[0]);
+	dev_info(smu->adev->dev, "GfxGpoVotingAllow = 0x%x\n", pptable->GfxGpoVotingAllow);
+	dev_info(smu->adev->dev, "GfxGpoPadding32[0] = 0x%x\n", pptable->GfxGpoPadding32[0]);
+	dev_info(smu->adev->dev, "GfxGpoPadding32[1] = 0x%x\n", pptable->GfxGpoPadding32[1]);
+	dev_info(smu->adev->dev, "GfxGpoPadding32[2] = 0x%x\n", pptable->GfxGpoPadding32[2]);
+	dev_info(smu->adev->dev, "GfxGpoPadding32[3] = 0x%x\n", pptable->GfxGpoPadding32[3]);
+	dev_info(smu->adev->dev, "GfxDcsFopt = 0x%x\n", pptable->GfxDcsFopt);
+	dev_info(smu->adev->dev, "GfxDcsFclkFopt = 0x%x\n", pptable->GfxDcsFclkFopt);
+	dev_info(smu->adev->dev, "GfxDcsUclkFopt = 0x%x\n", pptable->GfxDcsUclkFopt);
+
+	dev_info(smu->adev->dev, "DcsGfxOffVoltage = 0x%x\n", pptable->DcsGfxOffVoltage);
+	dev_info(smu->adev->dev, "DcsMinGfxOffTime = 0x%x\n", pptable->DcsMinGfxOffTime);
+	dev_info(smu->adev->dev, "DcsMaxGfxOffTime = 0x%x\n", pptable->DcsMaxGfxOffTime);
+	dev_info(smu->adev->dev, "DcsMinCreditAccum = 0x%x\n", pptable->DcsMinCreditAccum);
+	dev_info(smu->adev->dev, "DcsExitHysteresis = 0x%x\n", pptable->DcsExitHysteresis);
+	dev_info(smu->adev->dev, "DcsTimeout = 0x%x\n", pptable->DcsTimeout);
+
+	dev_info(smu->adev->dev, "DcsParamPadding[0] = 0x%x\n", pptable->DcsParamPadding[0]);
+	dev_info(smu->adev->dev, "DcsParamPadding[1] = 0x%x\n", pptable->DcsParamPadding[1]);
+	dev_info(smu->adev->dev, "DcsParamPadding[2] = 0x%x\n", pptable->DcsParamPadding[2]);
+	dev_info(smu->adev->dev, "DcsParamPadding[3] = 0x%x\n", pptable->DcsParamPadding[3]);
+	dev_info(smu->adev->dev, "DcsParamPadding[4] = 0x%x\n", pptable->DcsParamPadding[4]);
+
+	dev_info(smu->adev->dev, "FlopsPerByteTable\n");
 	for (i = 0; i < RLC_PACE_TABLE_NUM_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->FlopsPerByteTable[i]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->FlopsPerByteTable[i]);
 
-	pr_info("LowestUclkReservedForUlv = 0x%x\n", pptable->LowestUclkReservedForUlv);
-	pr_info("vddingMem[0] = 0x%x\n", pptable->PaddingMem[0]);
-	pr_info("vddingMem[1] = 0x%x\n", pptable->PaddingMem[1]);
-	pr_info("vddingMem[2] = 0x%x\n", pptable->PaddingMem[2]);
+	dev_info(smu->adev->dev, "LowestUclkReservedForUlv = 0x%x\n", pptable->LowestUclkReservedForUlv);
+	dev_info(smu->adev->dev, "vddingMem[0] = 0x%x\n", pptable->PaddingMem[0]);
+	dev_info(smu->adev->dev, "vddingMem[1] = 0x%x\n", pptable->PaddingMem[1]);
+	dev_info(smu->adev->dev, "vddingMem[2] = 0x%x\n", pptable->PaddingMem[2]);
 
-	pr_info("UclkDpmPstates\n");
+	dev_info(smu->adev->dev, "UclkDpmPstates\n");
 	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->UclkDpmPstates[i]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->UclkDpmPstates[i]);
 
-	pr_info("UclkDpmSrcFreqRange\n");
-	pr_info("  .Fmin = 0x%x\n",
+	dev_info(smu->adev->dev, "UclkDpmSrcFreqRange\n");
+	dev_info(smu->adev->dev, "  .Fmin = 0x%x\n",
 		pptable->UclkDpmSrcFreqRange.Fmin);
-	pr_info("  .Fmax = 0x%x\n",
+	dev_info(smu->adev->dev, "  .Fmax = 0x%x\n",
 		pptable->UclkDpmSrcFreqRange.Fmax);
-	pr_info("UclkDpmTargFreqRange\n");
-	pr_info("  .Fmin = 0x%x\n",
+	dev_info(smu->adev->dev, "UclkDpmTargFreqRange\n");
+	dev_info(smu->adev->dev, "  .Fmin = 0x%x\n",
 		pptable->UclkDpmTargFreqRange.Fmin);
-	pr_info("  .Fmax = 0x%x\n",
+	dev_info(smu->adev->dev, "  .Fmax = 0x%x\n",
 		pptable->UclkDpmTargFreqRange.Fmax);
-	pr_info("UclkDpmMidstepFreq = 0x%x\n", pptable->UclkDpmMidstepFreq);
-	pr_info("UclkMidstepPadding = 0x%x\n", pptable->UclkMidstepPadding);
+	dev_info(smu->adev->dev, "UclkDpmMidstepFreq = 0x%x\n", pptable->UclkDpmMidstepFreq);
+	dev_info(smu->adev->dev, "UclkMidstepPadding = 0x%x\n", pptable->UclkMidstepPadding);
 
-	pr_info("PcieGenSpeed\n");
+	dev_info(smu->adev->dev, "PcieGenSpeed\n");
 	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->PcieGenSpeed[i]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->PcieGenSpeed[i]);
 
-	pr_info("PcieLaneCount\n");
+	dev_info(smu->adev->dev, "PcieLaneCount\n");
 	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->PcieLaneCount[i]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->PcieLaneCount[i]);
 
-	pr_info("LclkFreq\n");
+	dev_info(smu->adev->dev, "LclkFreq\n");
 	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->LclkFreq[i]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->LclkFreq[i]);
 
-	pr_info("FanStopTemp = 0x%x\n", pptable->FanStopTemp);
-	pr_info("FanStartTemp = 0x%x\n", pptable->FanStartTemp);
+	dev_info(smu->adev->dev, "FanStopTemp = 0x%x\n", pptable->FanStopTemp);
+	dev_info(smu->adev->dev, "FanStartTemp = 0x%x\n", pptable->FanStartTemp);
 
-	pr_info("FanGain\n");
+	dev_info(smu->adev->dev, "FanGain\n");
 	for (i = 0; i < TEMP_COUNT; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->FanGain[i]);
-
-	pr_info("FanPwmMin = 0x%x\n", pptable->FanPwmMin);
-	pr_info("FanAcousticLimitRpm = 0x%x\n", pptable->FanAcousticLimitRpm);
-	pr_info("FanThrottlingRpm = 0x%x\n", pptable->FanThrottlingRpm);
-	pr_info("FanMaximumRpm = 0x%x\n", pptable->FanMaximumRpm);
-	pr_info("MGpuFanBoostLimitRpm = 0x%x\n", pptable->MGpuFanBoostLimitRpm);
-	pr_info("FanTargetTemperature = 0x%x\n", pptable->FanTargetTemperature);
-	pr_info("FanTargetGfxclk = 0x%x\n", pptable->FanTargetGfxclk);
-	pr_info("FanPadding16 = 0x%x\n", pptable->FanPadding16);
-	pr_info("FanTempInputSelect = 0x%x\n", pptable->FanTempInputSelect);
-	pr_info("FanPadding = 0x%x\n", pptable->FanPadding);
-	pr_info("FanZeroRpmEnable = 0x%x\n", pptable->FanZeroRpmEnable);
-	pr_info("FanTachEdgePerRev = 0x%x\n", pptable->FanTachEdgePerRev);
-
-	pr_info("FuzzyFan_ErrorSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorSetDelta);
-	pr_info("FuzzyFan_ErrorRateSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorRateSetDelta);
-	pr_info("FuzzyFan_PwmSetDelta = 0x%x\n", pptable->FuzzyFan_PwmSetDelta);
-	pr_info("FuzzyFan_Reserved = 0x%x\n", pptable->FuzzyFan_Reserved);
-
-	pr_info("OverrideAvfsGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
-	pr_info("OverrideAvfsGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
-	pr_info("dBtcGbGfxDfllModelSelect = 0x%x\n", pptable->dBtcGbGfxDfllModelSelect);
-	pr_info("Padding8_Avfs = 0x%x\n", pptable->Padding8_Avfs);
-
-	pr_info("qAvfsGb[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->FanGain[i]);
+
+	dev_info(smu->adev->dev, "FanPwmMin = 0x%x\n", pptable->FanPwmMin);
+	dev_info(smu->adev->dev, "FanAcousticLimitRpm = 0x%x\n", pptable->FanAcousticLimitRpm);
+	dev_info(smu->adev->dev, "FanThrottlingRpm = 0x%x\n", pptable->FanThrottlingRpm);
+	dev_info(smu->adev->dev, "FanMaximumRpm = 0x%x\n", pptable->FanMaximumRpm);
+	dev_info(smu->adev->dev, "MGpuFanBoostLimitRpm = 0x%x\n", pptable->MGpuFanBoostLimitRpm);
+	dev_info(smu->adev->dev, "FanTargetTemperature = 0x%x\n", pptable->FanTargetTemperature);
+	dev_info(smu->adev->dev, "FanTargetGfxclk = 0x%x\n", pptable->FanTargetGfxclk);
+	dev_info(smu->adev->dev, "FanPadding16 = 0x%x\n", pptable->FanPadding16);
+	dev_info(smu->adev->dev, "FanTempInputSelect = 0x%x\n", pptable->FanTempInputSelect);
+	dev_info(smu->adev->dev, "FanPadding = 0x%x\n", pptable->FanPadding);
+	dev_info(smu->adev->dev, "FanZeroRpmEnable = 0x%x\n", pptable->FanZeroRpmEnable);
+	dev_info(smu->adev->dev, "FanTachEdgePerRev = 0x%x\n", pptable->FanTachEdgePerRev);
+
+	dev_info(smu->adev->dev, "FuzzyFan_ErrorSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorSetDelta);
+	dev_info(smu->adev->dev, "FuzzyFan_ErrorRateSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorRateSetDelta);
+	dev_info(smu->adev->dev, "FuzzyFan_PwmSetDelta = 0x%x\n", pptable->FuzzyFan_PwmSetDelta);
+	dev_info(smu->adev->dev, "FuzzyFan_Reserved = 0x%x\n", pptable->FuzzyFan_Reserved);
+
+	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "dBtcGbGfxDfllModelSelect = 0x%x\n", pptable->dBtcGbGfxDfllModelSelect);
+	dev_info(smu->adev->dev, "Padding8_Avfs = 0x%x\n", pptable->Padding8_Avfs);
+
+	dev_info(smu->adev->dev, "qAvfsGb[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].a,
 			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].b,
 			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].c);
-	pr_info("qAvfsGb[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "qAvfsGb[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].a,
 			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].b,
 			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].c);
-	pr_info("dBtcGbGfxPll{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "dBtcGbGfxPll{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->dBtcGbGfxPll.a,
 			pptable->dBtcGbGfxPll.b,
 			pptable->dBtcGbGfxPll.c);
-	pr_info("dBtcGbGfxAfll{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "dBtcGbGfxAfll{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->dBtcGbGfxDfll.a,
 			pptable->dBtcGbGfxDfll.b,
 			pptable->dBtcGbGfxDfll.c);
-	pr_info("dBtcGbSoc{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "dBtcGbSoc{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->dBtcGbSoc.a,
 			pptable->dBtcGbSoc.b,
 			pptable->dBtcGbSoc.c);
-	pr_info("qAgingGb[AVFS_VOLTAGE_GFX]{m = 0x%x b = 0x%x}\n",
+	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_GFX]{m = 0x%x b = 0x%x}\n",
 			pptable->qAgingGb[AVFS_VOLTAGE_GFX].m,
 			pptable->qAgingGb[AVFS_VOLTAGE_GFX].b);
-	pr_info("qAgingGb[AVFS_VOLTAGE_SOC]{m = 0x%x b = 0x%x}\n",
+	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_SOC]{m = 0x%x b = 0x%x}\n",
 			pptable->qAgingGb[AVFS_VOLTAGE_SOC].m,
 			pptable->qAgingGb[AVFS_VOLTAGE_SOC].b);
 
-	pr_info("PiecewiseLinearDroopIntGfxDfll\n");
+	dev_info(smu->adev->dev, "PiecewiseLinearDroopIntGfxDfll\n");
 	for (i = 0; i < NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS; i++) {
-		pr_info("		Fset[%d] = 0x%x\n",
+		dev_info(smu->adev->dev, "		Fset[%d] = 0x%x\n",
 			i, pptable->PiecewiseLinearDroopIntGfxDfll.Fset[i]);
-		pr_info("		Vdroop[%d] = 0x%x\n",
+		dev_info(smu->adev->dev, "		Vdroop[%d] = 0x%x\n",
 			i, pptable->PiecewiseLinearDroopIntGfxDfll.Vdroop[i]);
 	}
 
-	pr_info("qStaticVoltageOffset[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].a,
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].b,
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].c);
-	pr_info("qStaticVoltageOffset[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].a,
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].b,
 			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].c);
 
-	pr_info("DcTol[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
-	pr_info("DcTol[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
 
-	pr_info("DcBtcEnabled[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcEnabled[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
-	pr_info("Padding8_GfxBtc[0] = 0x%x\n", pptable->Padding8_GfxBtc[0]);
-	pr_info("Padding8_GfxBtc[1] = 0x%x\n", pptable->Padding8_GfxBtc[1]);
+	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "Padding8_GfxBtc[0] = 0x%x\n", pptable->Padding8_GfxBtc[0]);
+	dev_info(smu->adev->dev, "Padding8_GfxBtc[1] = 0x%x\n", pptable->Padding8_GfxBtc[1]);
 
-	pr_info("DcBtcMin[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcMin[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
-	pr_info("DcBtcMax[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcMax[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
 
-	pr_info("DcBtcGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
+	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
+	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
 
-	pr_info("XgmiDpmPstates\n");
+	dev_info(smu->adev->dev, "XgmiDpmPstates\n");
 	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiDpmPstates[i]);
-	pr_info("XgmiDpmSpare[0] = 0x%02x\n", pptable->XgmiDpmSpare[0]);
-	pr_info("XgmiDpmSpare[1] = 0x%02x\n", pptable->XgmiDpmSpare[1]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiDpmPstates[i]);
+	dev_info(smu->adev->dev, "XgmiDpmSpare[0] = 0x%02x\n", pptable->XgmiDpmSpare[0]);
+	dev_info(smu->adev->dev, "XgmiDpmSpare[1] = 0x%02x\n", pptable->XgmiDpmSpare[1]);
 
-	pr_info("DebugOverrides = 0x%x\n", pptable->DebugOverrides);
-	pr_info("ReservedEquation0{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "DebugOverrides = 0x%x\n", pptable->DebugOverrides);
+	dev_info(smu->adev->dev, "ReservedEquation0{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->ReservedEquation0.a,
 			pptable->ReservedEquation0.b,
 			pptable->ReservedEquation0.c);
-	pr_info("ReservedEquation1{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "ReservedEquation1{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->ReservedEquation1.a,
 			pptable->ReservedEquation1.b,
 			pptable->ReservedEquation1.c);
-	pr_info("ReservedEquation2{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "ReservedEquation2{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->ReservedEquation2.a,
 			pptable->ReservedEquation2.b,
 			pptable->ReservedEquation2.c);
-	pr_info("ReservedEquation3{a = 0x%x b = 0x%x c = 0x%x}\n",
+	dev_info(smu->adev->dev, "ReservedEquation3{a = 0x%x b = 0x%x c = 0x%x}\n",
 			pptable->ReservedEquation3.a,
 			pptable->ReservedEquation3.b,
 			pptable->ReservedEquation3.c);
 
-	pr_info("SkuReserved[0] = 0x%x\n", pptable->SkuReserved[0]);
-	pr_info("SkuReserved[1] = 0x%x\n", pptable->SkuReserved[1]);
-	pr_info("SkuReserved[2] = 0x%x\n", pptable->SkuReserved[2]);
-	pr_info("SkuReserved[3] = 0x%x\n", pptable->SkuReserved[3]);
-	pr_info("SkuReserved[4] = 0x%x\n", pptable->SkuReserved[4]);
-	pr_info("SkuReserved[5] = 0x%x\n", pptable->SkuReserved[5]);
-	pr_info("SkuReserved[6] = 0x%x\n", pptable->SkuReserved[6]);
-	pr_info("SkuReserved[7] = 0x%x\n", pptable->SkuReserved[7]);
-	pr_info("SkuReserved[8] = 0x%x\n", pptable->SkuReserved[8]);
-	pr_info("SkuReserved[9] = 0x%x\n", pptable->SkuReserved[9]);
-	pr_info("SkuReserved[10] = 0x%x\n", pptable->SkuReserved[10]);
-	pr_info("SkuReserved[11] = 0x%x\n", pptable->SkuReserved[11]);
-	pr_info("SkuReserved[12] = 0x%x\n", pptable->SkuReserved[12]);
-	pr_info("SkuReserved[13] = 0x%x\n", pptable->SkuReserved[13]);
-	pr_info("SkuReserved[14] = 0x%x\n", pptable->SkuReserved[14]);
-
-	pr_info("GamingClk[0] = 0x%x\n", pptable->GamingClk[0]);
-	pr_info("GamingClk[1] = 0x%x\n", pptable->GamingClk[1]);
-	pr_info("GamingClk[2] = 0x%x\n", pptable->GamingClk[2]);
-	pr_info("GamingClk[3] = 0x%x\n", pptable->GamingClk[3]);
-	pr_info("GamingClk[4] = 0x%x\n", pptable->GamingClk[4]);
-	pr_info("GamingClk[5] = 0x%x\n", pptable->GamingClk[5]);
+	dev_info(smu->adev->dev, "SkuReserved[0] = 0x%x\n", pptable->SkuReserved[0]);
+	dev_info(smu->adev->dev, "SkuReserved[1] = 0x%x\n", pptable->SkuReserved[1]);
+	dev_info(smu->adev->dev, "SkuReserved[2] = 0x%x\n", pptable->SkuReserved[2]);
+	dev_info(smu->adev->dev, "SkuReserved[3] = 0x%x\n", pptable->SkuReserved[3]);
+	dev_info(smu->adev->dev, "SkuReserved[4] = 0x%x\n", pptable->SkuReserved[4]);
+	dev_info(smu->adev->dev, "SkuReserved[5] = 0x%x\n", pptable->SkuReserved[5]);
+	dev_info(smu->adev->dev, "SkuReserved[6] = 0x%x\n", pptable->SkuReserved[6]);
+	dev_info(smu->adev->dev, "SkuReserved[7] = 0x%x\n", pptable->SkuReserved[7]);
+	dev_info(smu->adev->dev, "SkuReserved[8] = 0x%x\n", pptable->SkuReserved[8]);
+	dev_info(smu->adev->dev, "SkuReserved[9] = 0x%x\n", pptable->SkuReserved[9]);
+	dev_info(smu->adev->dev, "SkuReserved[10] = 0x%x\n", pptable->SkuReserved[10]);
+	dev_info(smu->adev->dev, "SkuReserved[11] = 0x%x\n", pptable->SkuReserved[11]);
+	dev_info(smu->adev->dev, "SkuReserved[12] = 0x%x\n", pptable->SkuReserved[12]);
+	dev_info(smu->adev->dev, "SkuReserved[13] = 0x%x\n", pptable->SkuReserved[13]);
+	dev_info(smu->adev->dev, "SkuReserved[14] = 0x%x\n", pptable->SkuReserved[14]);
+
+	dev_info(smu->adev->dev, "GamingClk[0] = 0x%x\n", pptable->GamingClk[0]);
+	dev_info(smu->adev->dev, "GamingClk[1] = 0x%x\n", pptable->GamingClk[1]);
+	dev_info(smu->adev->dev, "GamingClk[2] = 0x%x\n", pptable->GamingClk[2]);
+	dev_info(smu->adev->dev, "GamingClk[3] = 0x%x\n", pptable->GamingClk[3]);
+	dev_info(smu->adev->dev, "GamingClk[4] = 0x%x\n", pptable->GamingClk[4]);
+	dev_info(smu->adev->dev, "GamingClk[5] = 0x%x\n", pptable->GamingClk[5]);
 
 	for (i = 0; i < NUM_I2C_CONTROLLERS; i++) {
-		pr_info("I2cControllers[%d]:\n", i);
-		pr_info("                   .Enabled = 0x%x\n",
+		dev_info(smu->adev->dev, "I2cControllers[%d]:\n", i);
+		dev_info(smu->adev->dev, "                   .Enabled = 0x%x\n",
 				pptable->I2cControllers[i].Enabled);
-		pr_info("                   .Speed = 0x%x\n",
+		dev_info(smu->adev->dev, "                   .Speed = 0x%x\n",
 				pptable->I2cControllers[i].Speed);
-		pr_info("                   .SlaveAddress = 0x%x\n",
+		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
 				pptable->I2cControllers[i].SlaveAddress);
-		pr_info("                   .ControllerPort = 0x%x\n",
+		dev_info(smu->adev->dev, "                   .ControllerPort = 0x%x\n",
 				pptable->I2cControllers[i].ControllerPort);
-		pr_info("                   .ControllerName = 0x%x\n",
+		dev_info(smu->adev->dev, "                   .ControllerName = 0x%x\n",
 				pptable->I2cControllers[i].ControllerName);
-		pr_info("                   .ThermalThrottler = 0x%x\n",
+		dev_info(smu->adev->dev, "                   .ThermalThrottler = 0x%x\n",
 				pptable->I2cControllers[i].ThermalThrotter);
-		pr_info("                   .I2cProtocol = 0x%x\n",
+		dev_info(smu->adev->dev, "                   .I2cProtocol = 0x%x\n",
 				pptable->I2cControllers[i].I2cProtocol);
-		pr_info("                   .PaddingConfig = 0x%x\n",
+		dev_info(smu->adev->dev, "                   .PaddingConfig = 0x%x\n",
 				pptable->I2cControllers[i].PaddingConfig);
 	}
 
-	pr_info("GpioScl = 0x%x\n", pptable->GpioScl);
-	pr_info("GpioSda = 0x%x\n", pptable->GpioSda);
-	pr_info("FchUsbPdSlaveAddr = 0x%x\n", pptable->FchUsbPdSlaveAddr);
-	pr_info("I2cSpare[0] = 0x%x\n", pptable->I2cSpare[0]);
-
-	pr_info("Board Parameters:\n");
-	pr_info("VddGfxVrMapping = 0x%x\n", pptable->VddGfxVrMapping);
-	pr_info("VddSocVrMapping = 0x%x\n", pptable->VddSocVrMapping);
-	pr_info("VddMem0VrMapping = 0x%x\n", pptable->VddMem0VrMapping);
-	pr_info("VddMem1VrMapping = 0x%x\n", pptable->VddMem1VrMapping);
-	pr_info("GfxUlvPhaseSheddingMask = 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
-	pr_info("SocUlvPhaseSheddingMask = 0x%x\n", pptable->SocUlvPhaseSheddingMask);
-	pr_info("VddciUlvPhaseSheddingMask = 0x%x\n", pptable->VddciUlvPhaseSheddingMask);
-	pr_info("MvddUlvPhaseSheddingMask = 0x%x\n", pptable->MvddUlvPhaseSheddingMask);
-
-	pr_info("GfxMaxCurrent = 0x%x\n", pptable->GfxMaxCurrent);
-	pr_info("GfxOffset = 0x%x\n", pptable->GfxOffset);
-	pr_info("Padding_TelemetryGfx = 0x%x\n", pptable->Padding_TelemetryGfx);
-
-	pr_info("SocMaxCurrent = 0x%x\n", pptable->SocMaxCurrent);
-	pr_info("SocOffset = 0x%x\n", pptable->SocOffset);
-	pr_info("Padding_TelemetrySoc = 0x%x\n", pptable->Padding_TelemetrySoc);
-
-	pr_info("Mem0MaxCurrent = 0x%x\n", pptable->Mem0MaxCurrent);
-	pr_info("Mem0Offset = 0x%x\n", pptable->Mem0Offset);
-	pr_info("Padding_TelemetryMem0 = 0x%x\n", pptable->Padding_TelemetryMem0);
-
-	pr_info("Mem1MaxCurrent = 0x%x\n", pptable->Mem1MaxCurrent);
-	pr_info("Mem1Offset = 0x%x\n", pptable->Mem1Offset);
-	pr_info("Padding_TelemetryMem1 = 0x%x\n", pptable->Padding_TelemetryMem1);
-
-	pr_info("MvddRatio = 0x%x\n", pptable->MvddRatio);
-
-	pr_info("AcDcGpio = 0x%x\n", pptable->AcDcGpio);
-	pr_info("AcDcPolarity = 0x%x\n", pptable->AcDcPolarity);
-	pr_info("VR0HotGpio = 0x%x\n", pptable->VR0HotGpio);
-	pr_info("VR0HotPolarity = 0x%x\n", pptable->VR0HotPolarity);
-	pr_info("VR1HotGpio = 0x%x\n", pptable->VR1HotGpio);
-	pr_info("VR1HotPolarity = 0x%x\n", pptable->VR1HotPolarity);
-	pr_info("GthrGpio = 0x%x\n", pptable->GthrGpio);
-	pr_info("GthrPolarity = 0x%x\n", pptable->GthrPolarity);
-	pr_info("LedPin0 = 0x%x\n", pptable->LedPin0);
-	pr_info("LedPin1 = 0x%x\n", pptable->LedPin1);
-	pr_info("LedPin2 = 0x%x\n", pptable->LedPin2);
-	pr_info("LedEnableMask = 0x%x\n", pptable->LedEnableMask);
-	pr_info("LedPcie = 0x%x\n", pptable->LedPcie);
-	pr_info("LedError = 0x%x\n", pptable->LedError);
-	pr_info("LedSpare1[0] = 0x%x\n", pptable->LedSpare1[0]);
-	pr_info("LedSpare1[1] = 0x%x\n", pptable->LedSpare1[1]);
-
-	pr_info("PllGfxclkSpreadEnabled = 0x%x\n", pptable->PllGfxclkSpreadEnabled);
-	pr_info("PllGfxclkSpreadPercent = 0x%x\n", pptable->PllGfxclkSpreadPercent);
-	pr_info("PllGfxclkSpreadFreq = 0x%x\n",    pptable->PllGfxclkSpreadFreq);
-
-	pr_info("DfllGfxclkSpreadEnabled = 0x%x\n", pptable->DfllGfxclkSpreadEnabled);
-	pr_info("DfllGfxclkSpreadPercent = 0x%x\n", pptable->DfllGfxclkSpreadPercent);
-	pr_info("DfllGfxclkSpreadFreq = 0x%x\n",    pptable->DfllGfxclkSpreadFreq);
-
-	pr_info("UclkSpreadEnabled = 0x%x\n", pptable->UclkSpreadEnabled);
-	pr_info("UclkSpreadPercent = 0x%x\n", pptable->UclkSpreadPercent);
-	pr_info("UclkSpreadFreq = 0x%x\n", pptable->UclkSpreadFreq);
-
-	pr_info("FclkSpreadEnabled = 0x%x\n", pptable->FclkSpreadEnabled);
-	pr_info("FclkSpreadPercent = 0x%x\n", pptable->FclkSpreadPercent);
-	pr_info("FclkSpreadFreq = 0x%x\n", pptable->FclkSpreadFreq);
-
-	pr_info("MemoryChannelEnabled = 0x%x\n", pptable->MemoryChannelEnabled);
-	pr_info("DramBitWidth = 0x%x\n", pptable->DramBitWidth);
-	pr_info("PaddingMem1[0] = 0x%x\n", pptable->PaddingMem1[0]);
-	pr_info("PaddingMem1[1] = 0x%x\n", pptable->PaddingMem1[1]);
-	pr_info("PaddingMem1[2] = 0x%x\n", pptable->PaddingMem1[2]);
-
-	pr_info("TotalBoardPower = 0x%x\n", pptable->TotalBoardPower);
-	pr_info("BoardPowerPadding = 0x%x\n", pptable->BoardPowerPadding);
-
-	pr_info("XgmiLinkSpeed\n");
+	dev_info(smu->adev->dev, "GpioScl = 0x%x\n", pptable->GpioScl);
+	dev_info(smu->adev->dev, "GpioSda = 0x%x\n", pptable->GpioSda);
+	dev_info(smu->adev->dev, "FchUsbPdSlaveAddr = 0x%x\n", pptable->FchUsbPdSlaveAddr);
+	dev_info(smu->adev->dev, "I2cSpare[0] = 0x%x\n", pptable->I2cSpare[0]);
+
+	dev_info(smu->adev->dev, "Board Parameters:\n");
+	dev_info(smu->adev->dev, "VddGfxVrMapping = 0x%x\n", pptable->VddGfxVrMapping);
+	dev_info(smu->adev->dev, "VddSocVrMapping = 0x%x\n", pptable->VddSocVrMapping);
+	dev_info(smu->adev->dev, "VddMem0VrMapping = 0x%x\n", pptable->VddMem0VrMapping);
+	dev_info(smu->adev->dev, "VddMem1VrMapping = 0x%x\n", pptable->VddMem1VrMapping);
+	dev_info(smu->adev->dev, "GfxUlvPhaseSheddingMask = 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
+	dev_info(smu->adev->dev, "SocUlvPhaseSheddingMask = 0x%x\n", pptable->SocUlvPhaseSheddingMask);
+	dev_info(smu->adev->dev, "VddciUlvPhaseSheddingMask = 0x%x\n", pptable->VddciUlvPhaseSheddingMask);
+	dev_info(smu->adev->dev, "MvddUlvPhaseSheddingMask = 0x%x\n", pptable->MvddUlvPhaseSheddingMask);
+
+	dev_info(smu->adev->dev, "GfxMaxCurrent = 0x%x\n", pptable->GfxMaxCurrent);
+	dev_info(smu->adev->dev, "GfxOffset = 0x%x\n", pptable->GfxOffset);
+	dev_info(smu->adev->dev, "Padding_TelemetryGfx = 0x%x\n", pptable->Padding_TelemetryGfx);
+
+	dev_info(smu->adev->dev, "SocMaxCurrent = 0x%x\n", pptable->SocMaxCurrent);
+	dev_info(smu->adev->dev, "SocOffset = 0x%x\n", pptable->SocOffset);
+	dev_info(smu->adev->dev, "Padding_TelemetrySoc = 0x%x\n", pptable->Padding_TelemetrySoc);
+
+	dev_info(smu->adev->dev, "Mem0MaxCurrent = 0x%x\n", pptable->Mem0MaxCurrent);
+	dev_info(smu->adev->dev, "Mem0Offset = 0x%x\n", pptable->Mem0Offset);
+	dev_info(smu->adev->dev, "Padding_TelemetryMem0 = 0x%x\n", pptable->Padding_TelemetryMem0);
+
+	dev_info(smu->adev->dev, "Mem1MaxCurrent = 0x%x\n", pptable->Mem1MaxCurrent);
+	dev_info(smu->adev->dev, "Mem1Offset = 0x%x\n", pptable->Mem1Offset);
+	dev_info(smu->adev->dev, "Padding_TelemetryMem1 = 0x%x\n", pptable->Padding_TelemetryMem1);
+
+	dev_info(smu->adev->dev, "MvddRatio = 0x%x\n", pptable->MvddRatio);
+
+	dev_info(smu->adev->dev, "AcDcGpio = 0x%x\n", pptable->AcDcGpio);
+	dev_info(smu->adev->dev, "AcDcPolarity = 0x%x\n", pptable->AcDcPolarity);
+	dev_info(smu->adev->dev, "VR0HotGpio = 0x%x\n", pptable->VR0HotGpio);
+	dev_info(smu->adev->dev, "VR0HotPolarity = 0x%x\n", pptable->VR0HotPolarity);
+	dev_info(smu->adev->dev, "VR1HotGpio = 0x%x\n", pptable->VR1HotGpio);
+	dev_info(smu->adev->dev, "VR1HotPolarity = 0x%x\n", pptable->VR1HotPolarity);
+	dev_info(smu->adev->dev, "GthrGpio = 0x%x\n", pptable->GthrGpio);
+	dev_info(smu->adev->dev, "GthrPolarity = 0x%x\n", pptable->GthrPolarity);
+	dev_info(smu->adev->dev, "LedPin0 = 0x%x\n", pptable->LedPin0);
+	dev_info(smu->adev->dev, "LedPin1 = 0x%x\n", pptable->LedPin1);
+	dev_info(smu->adev->dev, "LedPin2 = 0x%x\n", pptable->LedPin2);
+	dev_info(smu->adev->dev, "LedEnableMask = 0x%x\n", pptable->LedEnableMask);
+	dev_info(smu->adev->dev, "LedPcie = 0x%x\n", pptable->LedPcie);
+	dev_info(smu->adev->dev, "LedError = 0x%x\n", pptable->LedError);
+	dev_info(smu->adev->dev, "LedSpare1[0] = 0x%x\n", pptable->LedSpare1[0]);
+	dev_info(smu->adev->dev, "LedSpare1[1] = 0x%x\n", pptable->LedSpare1[1]);
+
+	dev_info(smu->adev->dev, "PllGfxclkSpreadEnabled = 0x%x\n", pptable->PllGfxclkSpreadEnabled);
+	dev_info(smu->adev->dev, "PllGfxclkSpreadPercent = 0x%x\n", pptable->PllGfxclkSpreadPercent);
+	dev_info(smu->adev->dev, "PllGfxclkSpreadFreq = 0x%x\n",    pptable->PllGfxclkSpreadFreq);
+
+	dev_info(smu->adev->dev, "DfllGfxclkSpreadEnabled = 0x%x\n", pptable->DfllGfxclkSpreadEnabled);
+	dev_info(smu->adev->dev, "DfllGfxclkSpreadPercent = 0x%x\n", pptable->DfllGfxclkSpreadPercent);
+	dev_info(smu->adev->dev, "DfllGfxclkSpreadFreq = 0x%x\n",    pptable->DfllGfxclkSpreadFreq);
+
+	dev_info(smu->adev->dev, "UclkSpreadEnabled = 0x%x\n", pptable->UclkSpreadEnabled);
+	dev_info(smu->adev->dev, "UclkSpreadPercent = 0x%x\n", pptable->UclkSpreadPercent);
+	dev_info(smu->adev->dev, "UclkSpreadFreq = 0x%x\n", pptable->UclkSpreadFreq);
+
+	dev_info(smu->adev->dev, "FclkSpreadEnabled = 0x%x\n", pptable->FclkSpreadEnabled);
+	dev_info(smu->adev->dev, "FclkSpreadPercent = 0x%x\n", pptable->FclkSpreadPercent);
+	dev_info(smu->adev->dev, "FclkSpreadFreq = 0x%x\n", pptable->FclkSpreadFreq);
+
+	dev_info(smu->adev->dev, "MemoryChannelEnabled = 0x%x\n", pptable->MemoryChannelEnabled);
+	dev_info(smu->adev->dev, "DramBitWidth = 0x%x\n", pptable->DramBitWidth);
+	dev_info(smu->adev->dev, "PaddingMem1[0] = 0x%x\n", pptable->PaddingMem1[0]);
+	dev_info(smu->adev->dev, "PaddingMem1[1] = 0x%x\n", pptable->PaddingMem1[1]);
+	dev_info(smu->adev->dev, "PaddingMem1[2] = 0x%x\n", pptable->PaddingMem1[2]);
+
+	dev_info(smu->adev->dev, "TotalBoardPower = 0x%x\n", pptable->TotalBoardPower);
+	dev_info(smu->adev->dev, "BoardPowerPadding = 0x%x\n", pptable->BoardPowerPadding);
+
+	dev_info(smu->adev->dev, "XgmiLinkSpeed\n");
 	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiLinkSpeed[i]);
-	pr_info("XgmiLinkWidth\n");
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiLinkSpeed[i]);
+	dev_info(smu->adev->dev, "XgmiLinkWidth\n");
 	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiLinkWidth[i]);
-	pr_info("XgmiFclkFreq\n");
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiLinkWidth[i]);
+	dev_info(smu->adev->dev, "XgmiFclkFreq\n");
 	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiFclkFreq[i]);
-	pr_info("XgmiSocVoltage\n");
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiFclkFreq[i]);
+	dev_info(smu->adev->dev, "XgmiSocVoltage\n");
 	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiSocVoltage[i]);
-
-	pr_info("HsrEnabled = 0x%x\n", pptable->HsrEnabled);
-	pr_info("VddqOffEnabled = 0x%x\n", pptable->VddqOffEnabled);
-	pr_info("PaddingUmcFlags[0] = 0x%x\n", pptable->PaddingUmcFlags[0]);
-	pr_info("PaddingUmcFlags[1] = 0x%x\n", pptable->PaddingUmcFlags[1]);
-
-	pr_info("BoardReserved[0] = 0x%x\n", pptable->BoardReserved[0]);
-	pr_info("BoardReserved[1] = 0x%x\n", pptable->BoardReserved[1]);
-	pr_info("BoardReserved[2] = 0x%x\n", pptable->BoardReserved[2]);
-	pr_info("BoardReserved[3] = 0x%x\n", pptable->BoardReserved[3]);
-	pr_info("BoardReserved[4] = 0x%x\n", pptable->BoardReserved[4]);
-	pr_info("BoardReserved[5] = 0x%x\n", pptable->BoardReserved[5]);
-	pr_info("BoardReserved[6] = 0x%x\n", pptable->BoardReserved[6]);
-	pr_info("BoardReserved[7] = 0x%x\n", pptable->BoardReserved[7]);
-	pr_info("BoardReserved[8] = 0x%x\n", pptable->BoardReserved[8]);
-	pr_info("BoardReserved[9] = 0x%x\n", pptable->BoardReserved[9]);
-	pr_info("BoardReserved[10] = 0x%x\n", pptable->BoardReserved[10]);
-	pr_info("BoardReserved[11] = 0x%x\n", pptable->BoardReserved[11]);
-	pr_info("BoardReserved[12] = 0x%x\n", pptable->BoardReserved[12]);
-	pr_info("BoardReserved[13] = 0x%x\n", pptable->BoardReserved[13]);
-	pr_info("BoardReserved[14] = 0x%x\n", pptable->BoardReserved[14]);
-
-	pr_info("MmHubPadding[0] = 0x%x\n", pptable->MmHubPadding[0]);
-	pr_info("MmHubPadding[1] = 0x%x\n", pptable->MmHubPadding[1]);
-	pr_info("MmHubPadding[2] = 0x%x\n", pptable->MmHubPadding[2]);
-	pr_info("MmHubPadding[3] = 0x%x\n", pptable->MmHubPadding[3]);
-	pr_info("MmHubPadding[4] = 0x%x\n", pptable->MmHubPadding[4]);
-	pr_info("MmHubPadding[5] = 0x%x\n", pptable->MmHubPadding[5]);
-	pr_info("MmHubPadding[6] = 0x%x\n", pptable->MmHubPadding[6]);
-	pr_info("MmHubPadding[7] = 0x%x\n", pptable->MmHubPadding[7]);
+		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiSocVoltage[i]);
+
+	dev_info(smu->adev->dev, "HsrEnabled = 0x%x\n", pptable->HsrEnabled);
+	dev_info(smu->adev->dev, "VddqOffEnabled = 0x%x\n", pptable->VddqOffEnabled);
+	dev_info(smu->adev->dev, "PaddingUmcFlags[0] = 0x%x\n", pptable->PaddingUmcFlags[0]);
+	dev_info(smu->adev->dev, "PaddingUmcFlags[1] = 0x%x\n", pptable->PaddingUmcFlags[1]);
+
+	dev_info(smu->adev->dev, "BoardReserved[0] = 0x%x\n", pptable->BoardReserved[0]);
+	dev_info(smu->adev->dev, "BoardReserved[1] = 0x%x\n", pptable->BoardReserved[1]);
+	dev_info(smu->adev->dev, "BoardReserved[2] = 0x%x\n", pptable->BoardReserved[2]);
+	dev_info(smu->adev->dev, "BoardReserved[3] = 0x%x\n", pptable->BoardReserved[3]);
+	dev_info(smu->adev->dev, "BoardReserved[4] = 0x%x\n", pptable->BoardReserved[4]);
+	dev_info(smu->adev->dev, "BoardReserved[5] = 0x%x\n", pptable->BoardReserved[5]);
+	dev_info(smu->adev->dev, "BoardReserved[6] = 0x%x\n", pptable->BoardReserved[6]);
+	dev_info(smu->adev->dev, "BoardReserved[7] = 0x%x\n", pptable->BoardReserved[7]);
+	dev_info(smu->adev->dev, "BoardReserved[8] = 0x%x\n", pptable->BoardReserved[8]);
+	dev_info(smu->adev->dev, "BoardReserved[9] = 0x%x\n", pptable->BoardReserved[9]);
+	dev_info(smu->adev->dev, "BoardReserved[10] = 0x%x\n", pptable->BoardReserved[10]);
+	dev_info(smu->adev->dev, "BoardReserved[11] = 0x%x\n", pptable->BoardReserved[11]);
+	dev_info(smu->adev->dev, "BoardReserved[12] = 0x%x\n", pptable->BoardReserved[12]);
+	dev_info(smu->adev->dev, "BoardReserved[13] = 0x%x\n", pptable->BoardReserved[13]);
+	dev_info(smu->adev->dev, "BoardReserved[14] = 0x%x\n", pptable->BoardReserved[14]);
+
+	dev_info(smu->adev->dev, "MmHubPadding[0] = 0x%x\n", pptable->MmHubPadding[0]);
+	dev_info(smu->adev->dev, "MmHubPadding[1] = 0x%x\n", pptable->MmHubPadding[1]);
+	dev_info(smu->adev->dev, "MmHubPadding[2] = 0x%x\n", pptable->MmHubPadding[2]);
+	dev_info(smu->adev->dev, "MmHubPadding[3] = 0x%x\n", pptable->MmHubPadding[3]);
+	dev_info(smu->adev->dev, "MmHubPadding[4] = 0x%x\n", pptable->MmHubPadding[4]);
+	dev_info(smu->adev->dev, "MmHubPadding[5] = 0x%x\n", pptable->MmHubPadding[5]);
+	dev_info(smu->adev->dev, "MmHubPadding[6] = 0x%x\n", pptable->MmHubPadding[6]);
+	dev_info(smu->adev->dev, "MmHubPadding[7] = 0x%x\n", pptable->MmHubPadding[7]);
 }
 
 static const struct pptable_funcs sienna_cichlid_ppt_funcs = {
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
index 17766126bae6..c3f860168f04 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -106,7 +106,7 @@ smu_v11_0_send_msg_with_param(struct smu_context *smu,
 	mutex_lock(&smu->message_lock);
 	ret = smu_v11_0_wait_for_response(smu);
 	if (ret) {
-		pr_err("Msg issuing pre-check failed and "
+		dev_err(adev->dev, "Msg issuing pre-check failed and "
 		       "SMU may be not in the right state!\n");
 		goto out;
 	}
@@ -119,7 +119,7 @@ smu_v11_0_send_msg_with_param(struct smu_context *smu,
 
 	ret = smu_v11_0_wait_for_response(smu);
 	if (ret) {
-		pr_err("failed send message: %10s (%d) \tparam: 0x%08x response %#x\n",
+		dev_err(adev->dev, "failed send message: %10s (%d) \tparam: 0x%08x response %#x\n",
 		       smu_get_message_name(smu, msg), index, param, ret);
 		goto out;
 	}
@@ -127,7 +127,7 @@ smu_v11_0_send_msg_with_param(struct smu_context *smu,
 	if (read_arg) {
 		ret = smu_v11_0_read_arg(smu, read_arg);
 		if (ret) {
-			pr_err("failed to read message arg: %10s (%d) \tparam: 0x%08x response %#x\n",
+			dev_err(adev->dev, "failed to read message arg: %10s (%d) \tparam: 0x%08x response %#x\n",
 			       smu_get_message_name(smu, msg), index, param, ret);
 			goto out;
 		}
@@ -295,7 +295,7 @@ int smu_v11_0_check_fw_version(struct smu_context *smu)
 		smu->smc_driver_if_version = SMU11_DRIVER_IF_VERSION_Sienna_Cichlid;
 		break;
 	default:
-		pr_err("smu unsupported asic type:%d.\n", smu->adev->asic_type);
+		dev_err(smu->adev->dev, "smu unsupported asic type:%d.\n", smu->adev->asic_type);
 		smu->smc_driver_if_version = SMU11_DRIVER_IF_VERSION_INV;
 		break;
 	}
@@ -309,11 +309,11 @@ int smu_v11_0_check_fw_version(struct smu_context *smu)
 	 * of halt driver loading.
 	 */
 	if (if_version != smu->smc_driver_if_version) {
-		pr_info("smu driver if version = 0x%08x, smu fw if version = 0x%08x, "
+		dev_info(smu->adev->dev, "smu driver if version = 0x%08x, smu fw if version = 0x%08x, "
 			"smu fw version = 0x%08x (%d.%d.%d)\n",
 			smu->smc_driver_if_version, if_version,
 			smu_version, smu_major, smu_minor, smu_debug);
-		pr_warn("SMU driver if version not matched\n");
+		dev_warn(smu->adev->dev, "SMU driver if version not matched\n");
 	}
 
 	return ret;
@@ -376,7 +376,7 @@ int smu_v11_0_setup_pptable(struct smu_context *smu)
 	version_major = le16_to_cpu(hdr->header.header_version_major);
 	version_minor = le16_to_cpu(hdr->header.header_version_minor);
 	if (version_major == 2 && smu->smu_table.boot_values.pp_table_id > 0) {
-		pr_info("use driver provided pptable %d\n", smu->smu_table.boot_values.pp_table_id);
+		dev_info(adev->dev, "use driver provided pptable %d\n", smu->smu_table.boot_values.pp_table_id);
 		switch (version_minor) {
 		case 0:
 			ret = smu_v11_0_set_pptable_v2_0(smu, &table, &size);
@@ -393,7 +393,7 @@ int smu_v11_0_setup_pptable(struct smu_context *smu)
 			return ret;
 
 	} else {
-		pr_info("use vbios provided pptable\n");
+		dev_info(adev->dev, "use vbios provided pptable\n");
 		index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
 						    powerplayinfo);
 
@@ -618,7 +618,7 @@ int smu_v11_0_get_vbios_bootup_values(struct smu_context *smu)
 		return ret;
 
 	if (header->format_revision != 3) {
-		pr_err("unknown atom_firmware_info version! for smu11\n");
+		dev_err(smu->adev->dev, "unknown atom_firmware_info version! for smu11\n");
 		return -EINVAL;
 	}
 
@@ -768,7 +768,7 @@ int smu_v11_0_set_deep_sleep_dcefclk(struct smu_context *smu, uint32_t clk)
 	ret = smu_send_smc_msg_with_param(smu,
 					  SMU_MSG_SetMinDeepSleepDcefclk, clk, NULL);
 	if (ret)
-		pr_err("SMU11 attempt to set divider for DCEFCLK Failed!");
+		dev_err(smu->adev->dev, "SMU11 attempt to set divider for DCEFCLK Failed!");
 
 	return ret;
 }
@@ -952,7 +952,7 @@ smu_v11_0_get_max_sustainable_clock(struct smu_context *smu, uint32_t *clock,
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetDcModeMaxDpmFreq,
 					  clk_id << 16, clock);
 	if (ret) {
-		pr_err("[GetMaxSustainableClock] Failed to get max DC clock from SMC!");
+		dev_err(smu->adev->dev, "[GetMaxSustainableClock] Failed to get max DC clock from SMC!");
 		return ret;
 	}
 
@@ -963,7 +963,7 @@ smu_v11_0_get_max_sustainable_clock(struct smu_context *smu, uint32_t *clock,
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetMaxDpmFreq,
 					  clk_id << 16, clock);
 	if (ret) {
-		pr_err("[GetMaxSustainableClock] failed to get max AC clock from SMC!");
+		dev_err(smu->adev->dev, "[GetMaxSustainableClock] failed to get max AC clock from SMC!");
 		return ret;
 	}
 
@@ -988,7 +988,7 @@ int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
 							  &(max_sustainable_clocks->uclock),
 							  SMU_UCLK);
 		if (ret) {
-			pr_err("[%s] failed to get max UCLK from SMC!",
+			dev_err(smu->adev->dev, "[%s] failed to get max UCLK from SMC!",
 			       __func__);
 			return ret;
 		}
@@ -999,7 +999,7 @@ int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
 							  &(max_sustainable_clocks->soc_clock),
 							  SMU_SOCCLK);
 		if (ret) {
-			pr_err("[%s] failed to get max SOCCLK from SMC!",
+			dev_err(smu->adev->dev, "[%s] failed to get max SOCCLK from SMC!",
 			       __func__);
 			return ret;
 		}
@@ -1010,7 +1010,7 @@ int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
 							  &(max_sustainable_clocks->dcef_clock),
 							  SMU_DCEFCLK);
 		if (ret) {
-			pr_err("[%s] failed to get max DCEFCLK from SMC!",
+			dev_err(smu->adev->dev, "[%s] failed to get max DCEFCLK from SMC!",
 			       __func__);
 			return ret;
 		}
@@ -1019,7 +1019,7 @@ int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
 							  &(max_sustainable_clocks->display_clock),
 							  SMU_DISPCLK);
 		if (ret) {
-			pr_err("[%s] failed to get max DISPCLK from SMC!",
+			dev_err(smu->adev->dev, "[%s] failed to get max DISPCLK from SMC!",
 			       __func__);
 			return ret;
 		}
@@ -1027,7 +1027,7 @@ int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
 							  &(max_sustainable_clocks->phy_clock),
 							  SMU_PHYCLK);
 		if (ret) {
-			pr_err("[%s] failed to get max PHYCLK from SMC!",
+			dev_err(smu->adev->dev, "[%s] failed to get max PHYCLK from SMC!",
 			       __func__);
 			return ret;
 		}
@@ -1035,7 +1035,7 @@ int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
 							  &(max_sustainable_clocks->pixel_clock),
 							  SMU_PIXCLK);
 		if (ret) {
-			pr_err("[%s] failed to get max PIXCLK from SMC!",
+			dev_err(smu->adev->dev, "[%s] failed to get max PIXCLK from SMC!",
 			       __func__);
 			return ret;
 		}
@@ -1065,7 +1065,7 @@ uint32_t smu_v11_0_get_max_power_limit(struct smu_context *smu) {
 	if (smu->od_enabled) {
 		od_limit = le32_to_cpu(powerplay_table->overdrive_table.max[SMU_11_0_ODSETTING_POWERPERCENTAGE]);
 
-		pr_debug("ODSETTING_POWERPERCENTAGE: %d (default: %d)\n", od_limit, smu->default_power_limit);
+		dev_dbg(smu->adev->dev, "ODSETTING_POWERPERCENTAGE: %d (default: %d)\n", od_limit, smu->default_power_limit);
 
 		max_power_limit *= (100 + od_limit);
 		max_power_limit /= 100;
@@ -1082,7 +1082,7 @@ int smu_v11_0_set_power_limit(struct smu_context *smu, uint32_t n)
 	max_power_limit = smu_v11_0_get_max_power_limit(smu);
 
 	if (n > max_power_limit) {
-		pr_err("New power limit (%d) is over the max allowed %d\n",
+		dev_err(smu->adev->dev, "New power limit (%d) is over the max allowed %d\n",
 				n,
 				max_power_limit);
 		return -EINVAL;
@@ -1092,13 +1092,13 @@ int smu_v11_0_set_power_limit(struct smu_context *smu, uint32_t n)
 		n = smu->default_power_limit;
 
 	if (!smu_feature_is_enabled(smu, SMU_FEATURE_PPT_BIT)) {
-		pr_err("Setting new power limit is not supported!\n");
+		dev_err(smu->adev->dev, "Setting new power limit is not supported!\n");
 		return -EOPNOTSUPP;
 	}
 
 	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetPptLimit, n, NULL);
 	if (ret) {
-		pr_err("[%s] Set power limit Failed!\n", __func__);
+		dev_err(smu->adev->dev, "[%s] Set power limit Failed!\n", __func__);
 		return ret;
 	}
 	smu->power_limit = n;
@@ -1300,7 +1300,7 @@ smu_v11_0_display_clock_voltage_request(struct smu_context *smu,
 			clk_select = SMU_UCLK;
 			break;
 		default:
-			pr_info("[%s] Invalid Clock Type!", __func__);
+			dev_info(smu->adev->dev, "[%s] Invalid Clock Type!", __func__);
 			ret = -EINVAL;
 			break;
 		}
@@ -1364,7 +1364,7 @@ smu_v11_0_auto_fan_control(struct smu_context *smu, bool auto_fan_control)
 
 	ret = smu_feature_set_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT, auto_fan_control);
 	if (ret)
-		pr_err("[%s]%s smc FAN CONTROL feature failed!",
+		dev_err(smu->adev->dev, "[%s]%s smc FAN CONTROL feature failed!",
 		       __func__, (auto_fan_control ? "Start" : "Stop"));
 
 	return ret;
@@ -1435,7 +1435,7 @@ smu_v11_0_set_fan_control_mode(struct smu_context *smu,
 	}
 
 	if (ret) {
-		pr_err("[%s]Set fan control mode failed!", __func__);
+		dev_err(smu->adev->dev, "[%s]Set fan control mode failed!", __func__);
 		return -EINVAL;
 	}
 
@@ -1900,7 +1900,7 @@ int smu_v11_0_override_pcie_parameters(struct smu_context *smu)
 	ret = smu_update_pcie_parameters(smu, pcie_gen, pcie_width);
 
 	if (ret)
-		pr_err("[%s] Attempt to override pcie params failed!\n", __func__);
+		dev_err(adev->dev, "[%s] Attempt to override pcie params failed!\n", __func__);
 
 	return ret;
 
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
index 186479e2f13e..29bc6c07e536 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
@@ -92,7 +92,7 @@ smu_v12_0_send_msg_with_param(struct smu_context *smu,
 	mutex_lock(&smu->message_lock);
 	ret = smu_v12_0_wait_for_response(smu);
 	if (ret) {
-		pr_err("Msg issuing pre-check failed and "
+		dev_err(adev->dev, "Msg issuing pre-check failed and "
 		       "SMU may be not in the right state!\n");
 		goto out;
 	}
@@ -105,14 +105,14 @@ smu_v12_0_send_msg_with_param(struct smu_context *smu,
 
 	ret = smu_v12_0_wait_for_response(smu);
 	if (ret) {
-		pr_err("Failed to send message 0x%x, response 0x%x param 0x%x\n",
+		dev_err(adev->dev, "Failed to send message 0x%x, response 0x%x param 0x%x\n",
 		       index, ret, param);
 		goto out;
 	}
 	if (read_arg) {
 		ret = smu_v12_0_read_arg(smu, read_arg);
 		if (ret) {
-			pr_err("Failed to read message arg 0x%x, response 0x%x param 0x%x\n",
+			dev_err(adev->dev, "Failed to read message arg 0x%x, response 0x%x param 0x%x\n",
 			       index, ret, param);
 			goto out;
 		}
@@ -161,11 +161,11 @@ int smu_v12_0_check_fw_version(struct smu_context *smu)
 	 * of halt driver loading.
 	 */
 	if (if_version != smu->smc_driver_if_version) {
-		pr_info("smu driver if version = 0x%08x, smu fw if version = 0x%08x, "
+		dev_info(smu->adev->dev, "smu driver if version = 0x%08x, smu fw if version = 0x%08x, "
 			"smu fw version = 0x%08x (%d.%d.%d)\n",
 			smu->smc_driver_if_version, if_version,
 			smu_version, smu_major, smu_minor, smu_debug);
-		pr_warn("SMU driver if version not matched\n");
+		dev_warn(smu->adev->dev, "SMU driver if version not matched\n");
 	}
 
 	return ret;
@@ -378,7 +378,7 @@ int smu_v12_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type c
 		case SMU_SCLK:
 			ret = smu_send_smc_msg(smu, SMU_MSG_GetMaxGfxclkFrequency, max);
 			if (ret) {
-				pr_err("Attempt to get max GX frequency from SMC Failed !\n");
+				dev_err(smu->adev->dev, "Attempt to get max GX frequency from SMC Failed !\n");
 				goto failed;
 			}
 			break;
@@ -406,7 +406,7 @@ int smu_v12_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type c
 		case SMU_SCLK:
 			ret = smu_send_smc_msg(smu, SMU_MSG_GetMinGfxclkFrequency, min);
 			if (ret) {
-				pr_err("Attempt to get min GX frequency from SMC Failed !\n");
+				dev_err(smu->adev->dev, "Attempt to get min GX frequency from SMC Failed !\n");
 				goto failed;
 			}
 			break;
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

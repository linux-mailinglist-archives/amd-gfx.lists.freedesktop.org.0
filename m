Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 111EA49AED0
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jan 2022 10:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2677810E93B;
	Tue, 25 Jan 2022 09:00:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835BC10E91B
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jan 2022 09:00:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ni46nKRkYZxXv6Cm8M0iQ4c/OGsJTKXFso+r5jLyRlq1qx0J6XWfgmlWKJrZmFVLqQbt1S34jDpoFJa3TOs/444S4btMWyVbCvfcHn60BKrp76SH43aetWqPcHm1XrD42sWyUc+98zl6Bhd1UHXjJKjn65iRf2cUVzUvwbU0n7lvOGSKMH5ool/4MtCcGvaDxFZe0mqCJcJNZWVuMT59hFRuI17TU+Y/kGSwiHLwmZ/0Ht0fuF/kGng6/zYf73snWpgUzBOB12MsMCvsRPDylOFAmvMczx8s4TYuBkxGNrCdpzIAsEAb9vxCbNR1aMgCSgDpuoCqSv9i2Kc94jSsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ya15nOeJyyjj9OWuqQi8iC/eGw4SwHALkw2Smr5iKtk=;
 b=fd/EMb2Qstk+iEgJUbYHHvhB+LXHmUR4Xaxz9aaJptwgSitUHOhp4Lj6UIdwjvhwXLQIUXxeO0nYtdOfFf5lnWKVbmljuo5FqtDgflJ9oMsLq6BhvnNwpwCaiBB3HIqU1NV6Hhs6siVQeFMv3li55gXrQ3plfsrnvqhhELk3atrTzs6E1FzBs+8GnxrT9XYalbdRABbraXqpEKXoNHlx2vTynaCjE2uo/DFQZ1pXP0/W/3KIlHyFr0X1V6RnZneB4HW9C+4Gxm34xMVQDTvkmynGh/0QvwwYaGiSqoW/vMOW03wp0RaMtjLhXzbCbbGY6t5qr8jGiZnNeqOqv483+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ya15nOeJyyjj9OWuqQi8iC/eGw4SwHALkw2Smr5iKtk=;
 b=Qpn5gjeyHKyM4GHufHdBfvJ15JmVL9vbXHza8zjzDiLhJk3etKgcOCVx/P2LZ8RuxYW34DfM4L8P1P/FAcz6hZXQnVQWUKWF5mnnNduedlZ9nRVBTuyCIFyhdNsJswQFDoiwJ9rlINbbGXq3R6/S/G3wzHjqkTkNw3t8YFwKuiw=
Received: from MW4PR03CA0241.namprd03.prod.outlook.com (2603:10b6:303:b4::6)
 by DM6PR12MB3419.namprd12.prod.outlook.com (2603:10b6:5:3c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 09:00:40 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::e) by MW4PR03CA0241.outlook.office365.com
 (2603:10b6:303:b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17 via Frontend
 Transport; Tue, 25 Jan 2022 09:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 25 Jan 2022 09:00:39 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 03:00:37 -0600
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2 5/7] drm/amd/pm: drop the cache for enabled ppfeatures
Date: Tue, 25 Jan 2022 17:00:11 +0800
Message-ID: <20220125090013.102080-5-evan.quan@amd.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20220125090013.102080-1-evan.quan@amd.com>
References: <20220125090013.102080-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de165dae-3e3c-4334-68c9-08d9dfe12925
X-MS-TrafficTypeDiagnostic: DM6PR12MB3419:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB34191CA832852FC4A254BF73E45F9@DM6PR12MB3419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /GEaioaspae6oN3aqL4Q80M4kAjUImepHjF8qHs85/oSf78AlysCMx8QPj5t97efRceb7+/TaaJ96jjxXnhzGPnepOJAHVjrQkox5tyZipPn7BsRfFqbySSFtAbxrsQXUCaVNffhPQiFH0896KCZIXIOzGBVytynp3OMAa5dRhObuE29OlpVQ6WlqXs8O8kPDoctC+XY5123tXyMxIz2G1ndPbUqDVCSbdIMK1yqBcLfsXIv6WIQ2Y8n5fgfx21H/YnBnWVOCon0SKzw+ylrIwZQgtjRmQ2yNk6NNFiuz59FMdnb1mkaDP3WQp4hE/tWJN6HoVQuwFAMWaKtrUcnVdMWPg8xkWtb7FQVOnpAMT8koijJX8fvKDDjNXtLLHrK7YSA1UUde5ko7WYG2gCSdWrElxX3e6dUyko3kG+2ryoIs+MiW9Ho55iidk8hypt/AkJ8MdmnKYwMIeeSbViMy/U30fAenfLCJXo0MoqHfMVbY2M2Vd6Jx6qG6Rir+VWDn7T+7CiF9meiuEYncUi4o1pTM2dyjpR9P+sHBo6zfcV0c7HFi17mekTx9omnY6iJh2wQjU+AHdealEn2CkQvmw1QlrUtND5JsM+3tVFhhfl6U/J5hpNzXd7tNIxDGyxMiSPq51Vc8JqzRAPFQRhVulg1pETnosdhipJIC+TjGeTKh6lszZta5c9ov9r6dqFW1jhsNFbd94Q0zMcM+4MgXuX8+5lvm6NEZ3KckdvyRV153VOpxfwBR20kX3gsqjutWsgNRF/PX2mLq+UdGSiQCnFHGgSP6XlDu3iuNmxKuaE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(36840700001)(46966006)(2906002)(356005)(83380400001)(82310400004)(508600001)(81166007)(6666004)(54906003)(30864003)(1076003)(6916009)(36756003)(5660300002)(44832011)(2616005)(70206006)(426003)(70586007)(8936002)(7696005)(8676002)(36860700001)(26005)(336012)(4326008)(186003)(86362001)(16526019)(40460700003)(47076005)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 09:00:39.9026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de165dae-3e3c-4334-68c9-08d9dfe12925
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3419
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
Cc: Alexander.Deucher@amd.com, Lijo.Lazar@amd.com,
 Evan Quan <evan.quan@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The following scenarios make the driver cache for enabled ppfeatures
outdated and invalid:
  - Other tools interact with PMFW to change the enabled ppfeatures.
  - PMFW may enable/disable some features behind driver's back. E.g.
    for sienna_cichild, on gfxoff entering, PMFW will disable gfx
    related DPM features. All those are performed without driver's
    notice.
Also considering driver does not actually interact with PMFW such
frequently, the benefit brought by such cache is very limited.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Change-Id: I20ed58ab216e930c7a5d223be1eb99146889f2b3
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |  1 -
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  1 -
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 23 +---------
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 16 +------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    | 23 +---------
 .../drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c  | 16 +------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        | 46 +++++--------------
 7 files changed, 17 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 1ef15f092b35..1e552c083e87 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -950,7 +950,6 @@ static int smu_sw_init(void *handle)
 	smu->pool_size = adev->pm.smu_prv_buffer_size;
 	smu->smu_feature.feature_num = SMU_FEATURE_MAX;
 	bitmap_zero(smu->smu_feature.supported, SMU_FEATURE_MAX);
-	bitmap_zero(smu->smu_feature.enabled, SMU_FEATURE_MAX);
 	bitmap_zero(smu->smu_feature.allowed, SMU_FEATURE_MAX);
 
 	mutex_init(&smu->message_lock);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 3fc130fbdc33..33355bf0f557 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -390,7 +390,6 @@ struct smu_feature
 	uint32_t feature_num;
 	DECLARE_BITMAP(supported, SMU_FEATURE_MAX);
 	DECLARE_BITMAP(allowed, SMU_FEATURE_MAX);
-	DECLARE_BITMAP(enabled, SMU_FEATURE_MAX);
 };
 
 struct smu_clocks {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index d36b64371492..d71155a66f97 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -798,27 +798,8 @@ int smu_v11_0_set_allowed_mask(struct smu_context *smu)
 int smu_v11_0_system_features_control(struct smu_context *smu,
 					     bool en)
 {
-	struct smu_feature *feature = &smu->smu_feature;
-	uint64_t feature_mask;
-	int ret = 0;
-
-	ret = smu_cmn_send_smc_msg(smu, (en ? SMU_MSG_EnableAllSmuFeatures :
-				     SMU_MSG_DisableAllSmuFeatures), NULL);
-	if (ret)
-		return ret;
-
-	bitmap_zero(feature->enabled, feature->feature_num);
-
-	if (en) {
-		ret = smu_cmn_get_enabled_mask(smu, &feature_mask);
-		if (ret)
-			return ret;
-
-		bitmap_copy(feature->enabled, (unsigned long *)&feature_mask,
-			    feature->feature_num);
-	}
-
-	return ret;
+	return smu_cmn_send_smc_msg(smu, (en ? SMU_MSG_EnableAllSmuFeatures :
+					  SMU_MSG_DisableAllSmuFeatures), NULL);
 }
 
 int smu_v11_0_notify_display_change(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 478151e72889..96a5b31f708d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -1947,27 +1947,13 @@ static int vangogh_get_dpm_clock_table(struct smu_context *smu, struct dpm_clock
 static int vangogh_system_features_control(struct smu_context *smu, bool en)
 {
 	struct amdgpu_device *adev = smu->adev;
-	struct smu_feature *feature = &smu->smu_feature;
-	uint64_t feature_mask;
 	int ret = 0;
 
 	if (adev->pm.fw_version >= 0x43f1700 && !en)
 		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_RlcPowerNotify,
 						      RLC_STATUS_OFF, NULL);
 
-	bitmap_zero(feature->enabled, feature->feature_num);
-
-	if (!en)
-		return ret;
-
-	ret = smu_cmn_get_enabled_mask(smu, &feature_mask);
-	if (ret)
-		return ret;
-
-	bitmap_copy(feature->enabled, (unsigned long *)&feature_mask,
-		    feature->feature_num);
-
-	return 0;
+	return ret;
 }
 
 static int vangogh_post_smu_init(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 92b5c1108a2e..f0ab1dc3ca59 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -764,27 +764,8 @@ int smu_v13_0_gfx_off_control(struct smu_context *smu, bool enable)
 int smu_v13_0_system_features_control(struct smu_context *smu,
 				      bool en)
 {
-	struct smu_feature *feature = &smu->smu_feature;
-	uint64_t feature_mask;
-	int ret = 0;
-
-	ret = smu_cmn_send_smc_msg(smu, (en ? SMU_MSG_EnableAllSmuFeatures :
-					 SMU_MSG_DisableAllSmuFeatures), NULL);
-	if (ret)
-		return ret;
-
-	bitmap_zero(feature->enabled, feature->feature_num);
-
-	if (en) {
-		ret = smu_cmn_get_enabled_mask(smu, &feature_mask);
-		if (ret)
-			return ret;
-
-		bitmap_copy(feature->enabled, (unsigned long *)&feature_mask,
-			    feature->feature_num);
-	}
-
-	return ret;
+	return smu_cmn_send_smc_msg(smu, (en ? SMU_MSG_EnableAllSmuFeatures :
+					  SMU_MSG_DisableAllSmuFeatures), NULL);
 }
 
 int smu_v13_0_notify_display_change(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
index d89e8a03651b..e90387a84cbb 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
@@ -195,27 +195,13 @@ static int yellow_carp_fini_smc_tables(struct smu_context *smu)
 
 static int yellow_carp_system_features_control(struct smu_context *smu, bool en)
 {
-	struct smu_feature *feature = &smu->smu_feature;
 	struct amdgpu_device *adev = smu->adev;
-	uint64_t feature_mask;
 	int ret = 0;
 
 	if (!en && !adev->in_s0ix)
 		ret = smu_cmn_send_smc_msg(smu, SMU_MSG_PrepareMp1ForUnload, NULL);
 
-	bitmap_zero(feature->enabled, feature->feature_num);
-
-	if (!en)
-		return ret;
-
-	ret = smu_cmn_get_enabled_mask(smu, &feature_mask);
-	if (ret)
-		return ret;
-
-	bitmap_copy(feature->enabled, (unsigned long *)&feature_mask,
-		    feature->feature_num);
-
-	return 0;
+	return ret;
 }
 
 static int yellow_carp_dpm_set_vcn_enable(struct smu_context *smu, bool enable)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
index 834a27590991..c4fe509fd420 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -496,8 +496,8 @@ int smu_cmn_feature_is_supported(struct smu_context *smu,
 int smu_cmn_feature_is_enabled(struct smu_context *smu,
 			       enum smu_feature_mask mask)
 {
-	struct smu_feature *feature = &smu->smu_feature;
 	struct amdgpu_device *adev = smu->adev;
+	uint64_t enabled_features;
 	int feature_id;
 
 	if (smu->is_apu && adev->family < AMDGPU_FAMILY_VGH)
@@ -509,9 +509,12 @@ int smu_cmn_feature_is_enabled(struct smu_context *smu,
 	if (feature_id < 0)
 		return 0;
 
-	WARN_ON(feature_id > feature->feature_num);
+	if (smu_cmn_get_enabled_mask(smu, &enabled_features)) {
+		dev_err(adev->dev, "Failed to retrieve enabled ppfeatures!\n");
+		return 0;
+	}
 
-	return test_bit(feature_id, feature->enabled);
+	return test_bit(feature_id, (unsigned long *)&enabled_features);
 }
 
 bool smu_cmn_clk_dpm_is_enabled(struct smu_context *smu,
@@ -544,7 +547,6 @@ bool smu_cmn_clk_dpm_is_enabled(struct smu_context *smu,
 int smu_cmn_get_enabled_mask(struct smu_context *smu,
 			     uint64_t *feature_mask)
 {
-	struct smu_feature *feature = &smu->smu_feature;
 	struct amdgpu_device *adev = smu->adev;
 	uint32_t *feature_mask_high;
 	uint32_t *feature_mask_low;
@@ -553,13 +555,6 @@ int smu_cmn_get_enabled_mask(struct smu_context *smu,
 	if (!feature_mask)
 		return -EINVAL;
 
-	if (!bitmap_empty(feature->enabled, feature->feature_num)) {
-		bitmap_copy((unsigned long *)feature_mask,
-			     feature->enabled,
-			     feature->feature_num);
-		return 0;
-	}
-
 	feature_mask_low = &((uint32_t *)feature_mask)[0];
 	feature_mask_high = &((uint32_t *)feature_mask)[1];
 
@@ -614,7 +609,6 @@ int smu_cmn_feature_update_enable_state(struct smu_context *smu,
 					uint64_t feature_mask,
 					bool enabled)
 {
-	struct smu_feature *feature = &smu->smu_feature;
 	int ret = 0;
 
 	if (enabled) {
@@ -628,8 +622,6 @@ int smu_cmn_feature_update_enable_state(struct smu_context *smu,
 						  SMU_MSG_EnableSmuFeaturesHigh,
 						  upper_32_bits(feature_mask),
 						  NULL);
-		if (ret)
-			return ret;
 	} else {
 		ret = smu_cmn_send_smc_msg_with_param(smu,
 						  SMU_MSG_DisableSmuFeaturesLow,
@@ -641,17 +633,8 @@ int smu_cmn_feature_update_enable_state(struct smu_context *smu,
 						  SMU_MSG_DisableSmuFeaturesHigh,
 						  upper_32_bits(feature_mask),
 						  NULL);
-		if (ret)
-			return ret;
 	}
 
-	if (enabled)
-		bitmap_or(feature->enabled, feature->enabled,
-				(unsigned long *)(&feature_mask), SMU_FEATURE_MAX);
-	else
-		bitmap_andnot(feature->enabled, feature->enabled,
-				(unsigned long *)(&feature_mask), SMU_FEATURE_MAX);
-
 	return ret;
 }
 
@@ -659,7 +642,6 @@ int smu_cmn_feature_set_enabled(struct smu_context *smu,
 				enum smu_feature_mask mask,
 				bool enable)
 {
-	struct smu_feature *feature = &smu->smu_feature;
 	int feature_id;
 
 	feature_id = smu_cmn_to_asic_specific_index(smu,
@@ -668,8 +650,6 @@ int smu_cmn_feature_set_enabled(struct smu_context *smu,
 	if (feature_id < 0)
 		return -EINVAL;
 
-	WARN_ON(feature_id > feature->feature_num);
-
 	return smu_cmn_feature_update_enable_state(smu,
 					       1ULL << feature_id,
 					       enable);
@@ -791,7 +771,6 @@ int smu_cmn_disable_all_features_with_exception(struct smu_context *smu,
 						bool no_hw_disablement,
 						enum smu_feature_mask mask)
 {
-	struct smu_feature *feature = &smu->smu_feature;
 	uint64_t features_to_disable = U64_MAX;
 	int skipped_feature_id;
 
@@ -805,15 +784,12 @@ int smu_cmn_disable_all_features_with_exception(struct smu_context *smu,
 		features_to_disable &= ~(1ULL << skipped_feature_id);
 	}
 
-	if (no_hw_disablement) {
-		bitmap_andnot(feature->enabled, feature->enabled,
-				(unsigned long *)(&features_to_disable), SMU_FEATURE_MAX);
+	if (no_hw_disablement)
 		return 0;
-	} else {
-		return smu_cmn_feature_update_enable_state(smu,
-							   features_to_disable,
-							   0);
-	}
+
+	return smu_cmn_feature_update_enable_state(smu,
+						   features_to_disable,
+						   0);
 }
 
 int smu_cmn_get_smc_version(struct smu_context *smu,
-- 
2.29.0


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C6471FBC
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Dec 2021 04:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318EA10ECF6;
	Mon, 13 Dec 2021 03:53:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558DB10ED10
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Dec 2021 03:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWlUs5dzVEJ0ZQ71DfblId4hkvMzviBV7LhxOBUoQQ5Rop1ImoRAfXlsQDWurZvZznZihR9eVMrwjw19fBGzJAwXzbSFlK6iz7Ht7gcBGhfoEhG+aVj5uDoumPtXx0Zm65DtcTTWQ6uLIerEGSpAg+0L1tIn5fEzTFAfPRLrrYyDHroYIY3XzFEKXYy1wt7+1qVMhCQGQHSMKmA9e9FKda2ryXRgCh58jRu+meRFofFJwL2RcbYAYnhbRpi0HpCzigb4UWpGbiwI1Fclm96TbUk7z/3I2GIbeXBjYm0KehLyeft/8wltIWrAmW9ZSuIgx3cUa5Zb4Z8wWH/A4NSn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFfjW4/lxds/l1nuO6xNN7XTEAKSlGMbW138u5G01Jc=;
 b=YKnPoo/KZORB+C3HG2L2aBTCcMzOnwYMLTPxeWLm62ByHrhAK+Yy0yO99rEcVnHsGQ6IqeKcSRnSaPphzX7MfJYrJ+ausCwJeaj7eBD0lzG/mQd5PRUtaqPE6DQmvARxpNaZS0OMJ9HtWrcZNqZpbtdGM7xs5bRZbCGF4bxT7kkUOHBE9Lbft6YuZffr2QfzM98kMtLw9rSgwgLfl0zJq6OKGWNsuLXJCzaoA9ufIeYTZcz+DiozX6VFrpXAo+vO3iMI9slsQVbecISBQUZ9o7ZJnz2j8CwZYRn2rjhkuR9iz7nKSvhYNXS+ZBt1aW5rSSExG76tKzrKewlyi//czQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFfjW4/lxds/l1nuO6xNN7XTEAKSlGMbW138u5G01Jc=;
 b=FwIjkzbCJJWtE1/VOA3P+HxfsgVL0Jbb76g4tZ/r5Ox42JJrOraRMuN7bu7zyh8zbcNqJiYefQ/5pAD6FWxOfQXscQ9ig3rs41WzbjSDHh/IYaW1k3SQ91f0N9vVLU34TpeCld2dsMkT/KfKcaQAW6RBmqrZFuO+IARewv0f9vI=
Received: from DM5PR2201CA0008.namprd22.prod.outlook.com (2603:10b6:4:14::18)
 by BN7PR12MB2788.namprd12.prod.outlook.com (2603:10b6:408:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 03:53:02 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:14:cafe::f7) by DM5PR2201CA0008.outlook.office365.com
 (2603:10b6:4:14::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17 via Frontend
 Transport; Mon, 13 Dec 2021 03:53:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Mon, 13 Dec 2021 03:53:02 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 12 Dec
 2021 21:53:00 -0600
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V5 12/16] drm/amd/pm: do not expose the smu_context structure
 used internally in power
Date: Mon, 13 Dec 2021 11:52:19 +0800
Message-ID: <20211213035223.772700-13-evan.quan@amd.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211213035223.772700-1-evan.quan@amd.com>
References: <20211213035223.772700-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 463be170-fd2a-40b6-6145-08d9bdec0ff8
X-MS-TrafficTypeDiagnostic: BN7PR12MB2788:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB278836AAC690E891267FB3C6E4749@BN7PR12MB2788.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQh6ssc7E4GHyCld37tavWO7ysnzH1oy6nroRovSu4OhWZxsrBibKRRJkGLqPZOdQFpKjBEjdOu7a/O/gbKZ44cekyrboxYcwnyUWHS7dLkfbVKyWfGAFfXXJzHqtOhimlMcq50MqhVLhKuqBfdziab+cF0elYNVeQvl3O7pg2pKOh50TZSV1AGD0hBadsG3PXePYHeL/WngPDWnTrPfzbWuCc3JA1iTqGogEa/GK1Iv7pk8ymHD8bV0bUT3xlpeNZcGH7a7CHVlaZOT+dSIQ0oPgtAQnho1WaKwEbPLdLYu8SNLck0ZeXlgJiv9OqdZkB+IX+CNORgFTOGqyH4oFpxcgWEcgKl/8+OCH+G2Oeib6wL6q7+XznIe21ojCQsrIMseSn9aK8lFXDtQy9OKJKMvdLtunITUSbeLqvxOZOIrEKOpXfhtU8e800HjLBPyKkFVXImSIPMzeMMnJW/Hz4iREAgbhLdyCpQdmbGwgPDsXHT9YYIPnxP3QhtfgFBqy+YjREVttOV3yAGghoetFHkH40+/zZbw4fa2/WnQrT7+LxoCweR/h2NklbnLcXm2Tkt05/T6qwcQ/huEwFyVwNeYRJIAVJA6CRoWvq5hQQw1peyzmczo5hgN234pm3bh8YDnjxqfsXj6upj9lFWCbJngQt22d+cMkDRKNgFdWekPdQoWuDte3lw4nrePZGVAyoCqQGRQjLvVuptB+oUKKcDmCYRIaQ4CetVcVnPtpyFLNtsNHZu1mt/zC2pSQBQJ9ZeTNhHnik30nRiBmUE8RGRikH2SMzVxXrLfMdb1DSvWnntuiBi7FBSNSQVI+g/RmzvrKcSb/E8NTAW0Aukqfw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(8936002)(81166007)(7696005)(36756003)(6916009)(316002)(47076005)(86362001)(36860700001)(8676002)(70206006)(30864003)(70586007)(426003)(2616005)(336012)(186003)(44832011)(54906003)(16526019)(356005)(4326008)(1076003)(6666004)(508600001)(83380400001)(82310400004)(40460700001)(2906002)(5660300002)(26005)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 03:53:02.6409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 463be170-fd2a-40b6-6145-08d9bdec0ff8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2788
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
Cc: Alexander.Deucher@amd.com, lijo.lazar@amd.com,
 Evan Quan <evan.quan@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This can cover the power implementation details. And as what did for
powerplay framework, we hook the smu_context to adev->powerplay.pp_handle.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Change-Id: I3969c9f62a8b63dc6e4321a488d8f15022ffeb3d
--
v1->v2:
  - drop smu_ppt_limit_type used internally from kgd_pp_interface.h(Lijo)
  - drop the smu_send_hbm_bad_pages_num() change which can be combined into
    the patch ahead(Lijo)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  6 ---
 .../gpu/drm/amd/include/kgd_pp_interface.h    |  3 ++
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c           | 50 +++++++++++++------
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            |  2 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h       |  4 --
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 48 +++++++++++-------
 .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  9 ++--
 .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   |  9 ++--
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  9 ++--
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  4 +-
 .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    |  9 ++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  8 +--
 12 files changed, 94 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 2d8070a9394e..9c94adf578ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -99,7 +99,6 @@
 #include "amdgpu_gem.h"
 #include "amdgpu_doorbell.h"
 #include "amdgpu_amdkfd.h"
-#include "amdgpu_smu.h"
 #include "amdgpu_discovery.h"
 #include "amdgpu_mes.h"
 #include "amdgpu_umc.h"
@@ -953,11 +952,6 @@ struct amdgpu_device {
 
 	/* powerplay */
 	struct amd_powerplay		powerplay;
-
-	/* smu */
-	struct smu_context		smu;
-
-	/* dpm */
 	struct amdgpu_pm		pm;
 	u32				cg_flags;
 	u32				pg_flags;
diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
index 7919e96e772b..a8eec91c0995 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -25,6 +25,9 @@
 #define __KGD_PP_INTERFACE_H__
 
 extern const struct amdgpu_ip_block_version pp_smu_ip_block;
+extern const struct amdgpu_ip_block_version smu_v11_0_ip_block;
+extern const struct amdgpu_ip_block_version smu_v12_0_ip_block;
+extern const struct amdgpu_ip_block_version smu_v13_0_ip_block;
 
 enum smu_event_type {
 	SMU_EVENT_RESET_COMPLETE = 0,
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index 166c62b68727..93bab1b977e4 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -31,6 +31,7 @@
 #include "amdgpu_display.h"
 #include "hwmgr.h"
 #include <linux/power_supply.h>
+#include "amdgpu_smu.h"
 
 #define amdgpu_dpm_enable_bapm(adev, e) \
 		((adev)->powerplay.pp_funcs->enable_bapm((adev)->powerplay.pp_handle, (e)))
@@ -213,7 +214,7 @@ int amdgpu_dpm_baco_reset(struct amdgpu_device *adev)
 
 bool amdgpu_dpm_is_mode1_reset_supported(struct amdgpu_device *adev)
 {
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (is_support_sw_smu(adev))
 		return smu_mode1_reset_is_support(smu);
@@ -223,7 +224,7 @@ bool amdgpu_dpm_is_mode1_reset_supported(struct amdgpu_device *adev)
 
 int amdgpu_dpm_mode1_reset(struct amdgpu_device *adev)
 {
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (is_support_sw_smu(adev))
 		return smu_mode1_reset(smu);
@@ -276,7 +277,7 @@ int amdgpu_dpm_set_df_cstate(struct amdgpu_device *adev,
 
 int amdgpu_dpm_allow_xgmi_power_down(struct amdgpu_device *adev, bool en)
 {
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (is_support_sw_smu(adev))
 		return smu_allow_xgmi_power_down(smu, en);
@@ -341,7 +342,7 @@ void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev)
 		mutex_unlock(&adev->pm.mutex);
 
 		if (is_support_sw_smu(adev))
-			smu_set_ac_dc(&adev->smu);
+			smu_set_ac_dc(adev->powerplay.pp_handle);
 	}
 }
 
@@ -426,12 +427,14 @@ int amdgpu_pm_load_smu_firmware(struct amdgpu_device *adev, uint32_t *smu_versio
 
 int amdgpu_dpm_set_light_sbr(struct amdgpu_device *adev, bool enable)
 {
-	return smu_set_light_sbr(&adev->smu, enable);
+	return smu_set_light_sbr(adev->powerplay.pp_handle, enable);
 }
 
 int amdgpu_dpm_send_hbm_bad_pages_num(struct amdgpu_device *adev, uint32_t size)
 {
-	return smu_send_hbm_bad_pages_num(&adev->smu, size);
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
+	return smu_send_hbm_bad_pages_num(smu, size);
 }
 
 int amdgpu_dpm_get_dpm_freq_range(struct amdgpu_device *adev,
@@ -444,7 +447,7 @@ int amdgpu_dpm_get_dpm_freq_range(struct amdgpu_device *adev,
 
 	switch (type) {
 	case PP_SCLK:
-		return smu_get_dpm_freq_range(&adev->smu, SMU_SCLK, min, max);
+		return smu_get_dpm_freq_range(adev->powerplay.pp_handle, SMU_SCLK, min, max);
 	default:
 		return -EINVAL;
 	}
@@ -455,12 +458,14 @@ int amdgpu_dpm_set_soft_freq_range(struct amdgpu_device *adev,
 				   uint32_t min,
 				   uint32_t max)
 {
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
 	if (!is_support_sw_smu(adev))
 		return -EOPNOTSUPP;
 
 	switch (type) {
 	case PP_SCLK:
-		return smu_set_soft_freq_range(&adev->smu, SMU_SCLK, min, max);
+		return smu_set_soft_freq_range(smu, SMU_SCLK, min, max);
 	default:
 		return -EINVAL;
 	}
@@ -468,33 +473,41 @@ int amdgpu_dpm_set_soft_freq_range(struct amdgpu_device *adev,
 
 int amdgpu_dpm_write_watermarks_table(struct amdgpu_device *adev)
 {
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
 	if (!is_support_sw_smu(adev))
 		return 0;
 
-	return smu_write_watermarks_table(&adev->smu);
+	return smu_write_watermarks_table(smu);
 }
 
 int amdgpu_dpm_wait_for_event(struct amdgpu_device *adev,
 			      enum smu_event_type event,
 			      uint64_t event_arg)
 {
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
 	if (!is_support_sw_smu(adev))
 		return -EOPNOTSUPP;
 
-	return smu_wait_for_event(&adev->smu, event, event_arg);
+	return smu_wait_for_event(smu, event, event_arg);
 }
 
 int amdgpu_dpm_get_status_gfxoff(struct amdgpu_device *adev, uint32_t *value)
 {
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
 	if (!is_support_sw_smu(adev))
 		return -EOPNOTSUPP;
 
-	return smu_get_status_gfxoff(&adev->smu, value);
+	return smu_get_status_gfxoff(smu, value);
 }
 
 uint64_t amdgpu_dpm_get_thermal_throttling_counter(struct amdgpu_device *adev)
 {
-	return atomic64_read(&adev->smu.throttle_int_counter);
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
+	return atomic64_read(&smu->throttle_int_counter);
 }
 
 /* amdgpu_dpm_gfx_state_change - Handle gfx power state change set
@@ -516,10 +529,12 @@ void amdgpu_dpm_gfx_state_change(struct amdgpu_device *adev,
 int amdgpu_dpm_get_ecc_info(struct amdgpu_device *adev,
 			    void *umc_ecc)
 {
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
 	if (!is_support_sw_smu(adev))
 		return -EOPNOTSUPP;
 
-	return smu_get_ecc_info(&adev->smu, umc_ecc);
+	return smu_get_ecc_info(smu, umc_ecc);
 }
 
 struct amd_vce_state *amdgpu_dpm_get_vce_clock_state(struct amdgpu_device *adev,
@@ -943,9 +958,10 @@ int amdgpu_dpm_get_smu_prv_buf_details(struct amdgpu_device *adev,
 int amdgpu_dpm_is_overdrive_supported(struct amdgpu_device *adev)
 {
 	struct pp_hwmgr *hwmgr = adev->powerplay.pp_handle;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
-	if ((is_support_sw_smu(adev) && adev->smu.od_enabled) ||
-	    (is_support_sw_smu(adev) && adev->smu.is_apu) ||
+	if ((is_support_sw_smu(adev) && smu->od_enabled) ||
+	    (is_support_sw_smu(adev) && smu->is_apu) ||
 		(!is_support_sw_smu(adev) && hwmgr->od_enabled))
 		return true;
 
@@ -968,7 +984,9 @@ int amdgpu_dpm_set_pp_table(struct amdgpu_device *adev,
 
 int amdgpu_dpm_get_num_cpu_cores(struct amdgpu_device *adev)
 {
-	return adev->smu.cpu_core_num;
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
+	return smu->cpu_core_num;
 }
 
 void amdgpu_dpm_stb_debug_fs_init(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index fa2f4e11e94e..ce80430c0eb6 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -2862,7 +2862,7 @@ static ssize_t amdgpu_hwmon_show_power_label(struct device *dev,
 	int limit_type = to_sensor_dev_attr(attr)->index;
 
 	return sysfs_emit(buf, "%s\n",
-		limit_type == SMU_FAST_PPT_LIMIT ? "fastPPT" : "slowPPT");
+		limit_type == PP_PWR_TYPE_FAST ? "fastPPT" : "slowPPT");
 }
 
 static ssize_t amdgpu_hwmon_set_power_cap(struct device *dev,
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
index fa7a510e1498..9d4a85c39ad2 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
@@ -1390,10 +1390,6 @@ int smu_mode1_reset(struct smu_context *smu);
 
 extern const struct amd_ip_funcs smu_ip_funcs;
 
-extern const struct amdgpu_ip_block_version smu_v11_0_ip_block;
-extern const struct amdgpu_ip_block_version smu_v12_0_ip_block;
-extern const struct amdgpu_ip_block_version smu_v13_0_ip_block;
-
 bool is_support_sw_smu(struct amdgpu_device *adev);
 bool is_support_cclk_dpm(struct amdgpu_device *adev);
 int smu_write_watermarks_table(struct smu_context *smu);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 7b616fc43df2..3714518e21b4 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -468,7 +468,7 @@ bool is_support_sw_smu(struct amdgpu_device *adev)
 
 bool is_support_cclk_dpm(struct amdgpu_device *adev)
 {
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (!smu_feature_is_enabled(smu, SMU_FEATURE_CCLK_DPM_BIT))
 		return false;
@@ -572,7 +572,7 @@ static int smu_get_driver_allowed_feature_mask(struct smu_context *smu)
 
 static int smu_set_funcs(struct amdgpu_device *adev)
 {
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (adev->pm.pp_feature & PP_OVERDRIVE_MASK)
 		smu->od_enabled = true;
@@ -624,7 +624,11 @@ static int smu_set_funcs(struct amdgpu_device *adev)
 static int smu_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu;
+
+	smu = kzalloc(sizeof(struct smu_context), GFP_KERNEL);
+	if (!smu)
+		return -ENOMEM;
 
 	smu->adev = adev;
 	smu->pm_enabled = !!amdgpu_dpm;
@@ -684,7 +688,7 @@ static int smu_set_default_dpm_table(struct smu_context *smu)
 static int smu_late_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 	int ret = 0;
 
 	smu_set_fine_grain_gfx_freq_parameters(smu);
@@ -730,7 +734,7 @@ static int smu_late_init(void *handle)
 
 	smu_get_fan_parameters(smu);
 
-	smu_handle_task(&adev->smu,
+	smu_handle_task(smu,
 			smu->smu_dpm.dpm_level,
 			AMD_PP_TASK_COMPLETE_INIT,
 			false);
@@ -1020,7 +1024,7 @@ static void smu_interrupt_work_fn(struct work_struct *work)
 static int smu_sw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 	int ret;
 
 	smu->pool_size = adev->pm.smu_prv_buffer_size;
@@ -1095,7 +1099,7 @@ static int smu_sw_init(void *handle)
 static int smu_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 	int ret;
 
 	ret = smu_smc_table_sw_fini(smu);
@@ -1330,7 +1334,7 @@ static int smu_hw_init(void *handle)
 {
 	int ret;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev)) {
 		smu->pm_enabled = false;
@@ -1346,7 +1350,7 @@ static int smu_hw_init(void *handle)
 	if (smu->is_apu) {
 		smu_dpm_set_vcn_enable(smu, true);
 		smu_dpm_set_jpeg_enable(smu, true);
-		smu_set_gfx_cgpg(&adev->smu, true);
+		smu_set_gfx_cgpg(smu, true);
 	}
 
 	if (!smu->pm_enabled)
@@ -1500,7 +1504,7 @@ static int smu_smc_hw_cleanup(struct smu_context *smu)
 static int smu_hw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
 		return 0;
@@ -1519,6 +1523,14 @@ static int smu_hw_fini(void *handle)
 	return smu_smc_hw_cleanup(smu);
 }
 
+static void smu_late_fini(void *handle)
+{
+	struct amdgpu_device *adev = handle;
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
+	kfree(smu);
+}
+
 static int smu_reset(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
@@ -1546,7 +1558,7 @@ static int smu_reset(struct smu_context *smu)
 static int smu_suspend(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 	int ret;
 
 	if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
@@ -1565,7 +1577,7 @@ static int smu_suspend(void *handle)
 
 	/* skip CGPG when in S0ix */
 	if (smu->is_apu && !adev->in_s0ix)
-		smu_set_gfx_cgpg(&adev->smu, false);
+		smu_set_gfx_cgpg(smu, false);
 
 	return 0;
 }
@@ -1574,7 +1586,7 @@ static int smu_resume(void *handle)
 {
 	int ret;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
 		return 0;
@@ -1597,7 +1609,7 @@ static int smu_resume(void *handle)
 	}
 
 	if (smu->is_apu)
-		smu_set_gfx_cgpg(&adev->smu, true);
+		smu_set_gfx_cgpg(smu, true);
 
 	smu->disable_uclk_switch = 0;
 
@@ -2129,6 +2141,7 @@ const struct amd_ip_funcs smu_ip_funcs = {
 	.sw_fini = smu_sw_fini,
 	.hw_init = smu_hw_init,
 	.hw_fini = smu_hw_fini,
+	.late_fini = smu_late_fini,
 	.suspend = smu_suspend,
 	.resume = smu_resume,
 	.is_idle = NULL,
@@ -3193,7 +3206,7 @@ int smu_stb_collect_info(struct smu_context *smu, void *buf, uint32_t size)
 static int smu_stb_debugfs_open(struct inode *inode, struct file *filp)
 {
 	struct amdgpu_device *adev = filp->f_inode->i_private;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 	unsigned char *buf;
 	int r;
 
@@ -3218,7 +3231,7 @@ static ssize_t smu_stb_debugfs_read(struct file *filp, char __user *buf, size_t
 				loff_t *pos)
 {
 	struct amdgpu_device *adev = filp->f_inode->i_private;
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 
 	if (!filp->private_data)
@@ -3259,7 +3272,7 @@ void amdgpu_smu_stb_debug_fs_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
 
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (!smu->stb_context.stb_buf_size)
 		return;
@@ -3271,7 +3284,6 @@ void amdgpu_smu_stb_debug_fs_init(struct amdgpu_device *adev)
 			    &smu_stb_debugfs_fops,
 			    smu->stb_context.stb_buf_size);
 #endif
-
 }
 
 int smu_send_hbm_bad_pages_num(struct smu_context *smu, uint32_t size)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index 05defeee0c87..a03bbd2a7aa0 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -2082,7 +2082,8 @@ static int arcturus_i2c_xfer(struct i2c_adapter *i2c_adap,
 			     struct i2c_msg *msg, int num_msgs)
 {
 	struct amdgpu_device *adev = to_amdgpu_device(i2c_adap);
-	struct smu_table_context *smu_table = &adev->smu.smu_table;
+	struct smu_context *smu = adev->powerplay.pp_handle;
+	struct smu_table_context *smu_table = &smu->smu_table;
 	struct smu_table *table = &smu_table->driver_table;
 	SwI2cRequest_t *req, *res = (SwI2cRequest_t *)table->cpu_addr;
 	int i, j, r, c;
@@ -2128,9 +2129,9 @@ static int arcturus_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		}
 	}
-	mutex_lock(&adev->smu.mutex);
-	r = smu_cmn_update_table(&adev->smu, SMU_TABLE_I2C_COMMANDS, 0, req, true);
-	mutex_unlock(&adev->smu.mutex);
+	mutex_lock(&smu->mutex);
+	r = smu_cmn_update_table(smu, SMU_TABLE_I2C_COMMANDS, 0, req, true);
+	mutex_unlock(&smu->mutex);
 	if (r)
 		goto fail;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 2bb7816b245a..37e11716e919 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -2779,7 +2779,8 @@ static int navi10_i2c_xfer(struct i2c_adapter *i2c_adap,
 			   struct i2c_msg *msg, int num_msgs)
 {
 	struct amdgpu_device *adev = to_amdgpu_device(i2c_adap);
-	struct smu_table_context *smu_table = &adev->smu.smu_table;
+	struct smu_context *smu = adev->powerplay.pp_handle;
+	struct smu_table_context *smu_table = &smu->smu_table;
 	struct smu_table *table = &smu_table->driver_table;
 	SwI2cRequest_t *req, *res = (SwI2cRequest_t *)table->cpu_addr;
 	int i, j, r, c;
@@ -2825,9 +2826,9 @@ static int navi10_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		}
 	}
-	mutex_lock(&adev->smu.mutex);
-	r = smu_cmn_update_table(&adev->smu, SMU_TABLE_I2C_COMMANDS, 0, req, true);
-	mutex_unlock(&adev->smu.mutex);
+	mutex_lock(&smu->mutex);
+	r = smu_cmn_update_table(smu, SMU_TABLE_I2C_COMMANDS, 0, req, true);
+	mutex_unlock(&smu->mutex);
 	if (r)
 		goto fail;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 777f717c37ae..6a5064f4ea86 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -3459,7 +3459,8 @@ static int sienna_cichlid_i2c_xfer(struct i2c_adapter *i2c_adap,
 				   struct i2c_msg *msg, int num_msgs)
 {
 	struct amdgpu_device *adev = to_amdgpu_device(i2c_adap);
-	struct smu_table_context *smu_table = &adev->smu.smu_table;
+	struct smu_context *smu = adev->powerplay.pp_handle;
+	struct smu_table_context *smu_table = &smu->smu_table;
 	struct smu_table *table = &smu_table->driver_table;
 	SwI2cRequest_t *req, *res = (SwI2cRequest_t *)table->cpu_addr;
 	int i, j, r, c;
@@ -3505,9 +3506,9 @@ static int sienna_cichlid_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		}
 	}
-	mutex_lock(&adev->smu.mutex);
-	r = smu_cmn_update_table(&adev->smu, SMU_TABLE_I2C_COMMANDS, 0, req, true);
-	mutex_unlock(&adev->smu.mutex);
+	mutex_lock(&smu->mutex);
+	r = smu_cmn_update_table(smu, SMU_TABLE_I2C_COMMANDS, 0, req, true);
+	mutex_unlock(&smu->mutex);
 	if (r)
 		goto fail;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index 28b7c0562b99..2a53b5b1d261 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -1372,7 +1372,7 @@ static int smu_v11_0_set_irq_state(struct amdgpu_device *adev,
 				   unsigned tyep,
 				   enum amdgpu_interrupt_state state)
 {
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 	uint32_t low, high;
 	uint32_t val = 0;
 
@@ -1441,7 +1441,7 @@ static int smu_v11_0_irq_process(struct amdgpu_device *adev,
 				 struct amdgpu_irq_src *source,
 				 struct amdgpu_iv_entry *entry)
 {
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 	uint32_t client_id = entry->client_id;
 	uint32_t src_id = entry->src_id;
 	/*
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index 6e781cee8bb6..3c82f5455f88 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1484,7 +1484,8 @@ static int aldebaran_i2c_xfer(struct i2c_adapter *i2c_adap,
 			      struct i2c_msg *msg, int num_msgs)
 {
 	struct amdgpu_device *adev = to_amdgpu_device(i2c_adap);
-	struct smu_table_context *smu_table = &adev->smu.smu_table;
+	struct smu_context *smu = adev->powerplay.pp_handle;
+	struct smu_table_context *smu_table = &smu->smu_table;
 	struct smu_table *table = &smu_table->driver_table;
 	SwI2cRequest_t *req, *res = (SwI2cRequest_t *)table->cpu_addr;
 	int i, j, r, c;
@@ -1530,9 +1531,9 @@ static int aldebaran_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		}
 	}
-	mutex_lock(&adev->smu.mutex);
-	r = smu_cmn_update_table(&adev->smu, SMU_TABLE_I2C_COMMANDS, 0, req, true);
-	mutex_unlock(&adev->smu.mutex);
+	mutex_lock(&smu->mutex);
+	r = smu_cmn_update_table(smu, SMU_TABLE_I2C_COMMANDS, 0, req, true);
+	mutex_unlock(&smu->mutex);
 	if (r)
 		goto fail;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 55421ea622fb..4ed01e9d88fb 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -1195,7 +1195,7 @@ static int smu_v13_0_set_irq_state(struct amdgpu_device *adev,
 				   unsigned tyep,
 				   enum amdgpu_interrupt_state state)
 {
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 	uint32_t low, high;
 	uint32_t val = 0;
 
@@ -1270,7 +1270,7 @@ static int smu_v13_0_irq_process(struct amdgpu_device *adev,
 				 struct amdgpu_irq_src *source,
 				 struct amdgpu_iv_entry *entry)
 {
-	struct smu_context *smu = &adev->smu;
+	struct smu_context *smu = adev->powerplay.pp_handle;
 	uint32_t client_id = entry->client_id;
 	uint32_t src_id = entry->src_id;
 	/*
@@ -1316,11 +1316,11 @@ static int smu_v13_0_irq_process(struct amdgpu_device *adev,
 			switch (ctxid) {
 			case 0x3:
 				dev_dbg(adev->dev, "Switched to AC mode!\n");
-				smu_v13_0_ack_ac_dc_interrupt(&adev->smu);
+				smu_v13_0_ack_ac_dc_interrupt(smu);
 				break;
 			case 0x4:
 				dev_dbg(adev->dev, "Switched to DC mode!\n");
-				smu_v13_0_ack_ac_dc_interrupt(&adev->smu);
+				smu_v13_0_ack_ac_dc_interrupt(smu);
 				break;
 			case 0x7:
 				/*
-- 
2.29.0


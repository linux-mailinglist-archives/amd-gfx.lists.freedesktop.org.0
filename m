Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146CD77B66D
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Aug 2023 12:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E4710E19B;
	Mon, 14 Aug 2023 10:18:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92BA10E19B
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Aug 2023 10:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXcfpJ2tGd0HN3YBEZAgNsmkKalpHh63ddD9l7rs+AEftoJKQkp5e513ppDm68brsCAVyPTuO6QlvylWyAUyKCXK8wIx+T8IQtsdOKJgzFtUOB9fHWv5amnPTqR06rE9QqrSOnKolntu/d+pB5xIObdVR/5UusWBLMGr5zgJUh6CkCaDcgFLQmrwMG0F1U8Q6XybfbjX7lDPlQYurCiIAPvg3MADS1ydz4opKTikOlJ9NwHcc8aX93IFhweMXTTQFb3I3jXOQPOSqj8AInXCg4jMWYNm6mOUDahl8ihFLI4jXKZXxbhSfWSjLYiaxhFIB29pI1fVAadlvlj+vqRf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdO946Ysly2JCc4CGWPXLYS4eBblCBIgoyBu5nFHYsQ=;
 b=ASuQUxYMlqUgxBXvfRf7hWxREnIOqcjH8/xtHhaEKVdwXgP5iLUHgZCFVeR1zfhQ5KTS0vE4ZUOpkNpVTy6O1uOAqq5G2Iw4fVxT5hvzuPKZfYo0JZ5riLR4s3Jwp6YbEHffs1SF5Kdyj+qMnLy6UFG09qif1knoqeCdqdm/wQUIhgvksNiMrtVxleYb46rK+64Pmut4zTxJvHYsRTHa+xDht6iA8vP27nRc+0g818GRazcReWRW2VovJm7a+rDp6v+XkBthySnXTK3MJd0p7osbCuWretSCoE28rZIuBHAeAiIxhLGlu9Te2STelcsnyDXuynIIZ9FdPQfvIvYN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdO946Ysly2JCc4CGWPXLYS4eBblCBIgoyBu5nFHYsQ=;
 b=IcQLFTa7peSu5+HiY8taK25gYzbqJxDnFpPOr7R+o6Fi2cTkZ+gBlY1zITSTNYeSlnnRAmraf5TcugVW7LKp4KdFN30/1OS8LTXq8TVq4sa0oRJHQCiMrs0RQlslks0fbDPPAH4ajFv+gaCgmbGmgm30zEsJpOYnInrfmOkIsCU=
Received: from CH0P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::6) by
 MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.26; Mon, 14 Aug 2023 10:18:10 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:610:ef:cafe::52) by CH0P220CA0008.outlook.office365.com
 (2603:10b6:610:ef::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 10:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6723.3 via Frontend Transport; Mon, 14 Aug 2023 10:18:10 +0000
Received: from asad-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 14 Aug
 2023 05:18:07 -0500
From: Asad Kamal <asad.kamal@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/2] drm/amd/pm: Update pci link speed for smu v13.0.6
Date: Mon, 14 Aug 2023 18:17:34 +0800
Message-ID: <20230814101734.1149593-2-asad.kamal@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814101734.1149593-1-asad.kamal@amd.com>
References: <20230814101734.1149593-1-asad.kamal@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|MW4PR12MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c76f2fe-5114-466a-b286-08db9cafc2d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UxMhD0rkCLNVofsO1zOnDvsuYFEUPAVYnl72NO7ivCWbZEKrsWT85rHooW4yHpkvu0Fd5mrSsk7wlPyln2oKol8TqLKoyIuoum6EM15WtThhwfPrNEijhxRArTXtVC+rAqBfh2cd8wg8In3KaITr/QP2cICTb/x/WMu8CN8mFFgYI1oVaJVFVyf9v78jGTOqy2pIzGd8sfSVmRkhsGqa3IPgAK0CcjS71rGQ87FjGrFHKW2vrqgvv0ZtHlgQ9vBEHHIo6Q/nDePdiN/YsqAr2A245b+qjMAcimINab9vlpgIVEa8sw9en7ZI9rWHEkeXt8zsufDXtml2Xm6VdevOa8XBQdfwyDGXq9N0Y3rqnpmxl5O8cWIXQN3PY1rhv6KrzPiJjtgGSCSMNuNbqIIYMRB+iRxswfowdCCgbLq2yi4YLKSx+rDJ9CEsA7EcCC3vF5ITp+9NHB11XMOGri5sWWwGabbwrguWSn0/dulrPFMui8BmaRtHQAAgrRakZmhShGiKIiq6mmVPf8xtfY9ZTqfRLMjC93SAIOgq6rHXZfqc1VioQPDjF+btUxYIXoyXT6xjp15F5cOLYFw6GIgB1x3MW9C/4aA5d/mWwMfw8aDLPHZ0+B+Oe+BKlAPRnPA5hF4ZIAW+opvA0+zOziSiBkqOPIOgKO9//XCLzjFgpxKzFFjgI6Ee14/3IAOOiNTeqPko9fJ3eOGWvphNXIb4Hfex7nwDHoHios/ceLbrJroFP+QC0aL/BPCOZhVJZ9+WKT8L+YuNepHC+YVVm/sBA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(1800799006)(186006)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(16526019)(26005)(1076003)(336012)(8936002)(41300700001)(70206006)(70586007)(8676002)(316002)(36860700001)(83380400001)(47076005)(426003)(2616005)(6666004)(7696005)(81166007)(40460700003)(478600001)(40480700001)(54906003)(44832011)(15650500001)(36756003)(86362001)(6916009)(4326008)(82740400003)(356005)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 10:18:10.3776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c76f2fe-5114-466a-b286-08db9cafc2d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625
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
Cc: Lijo.Lazar@amd.com, asad.kamal@amd.com, le.ma@amd.com, shiwu.zhang@amd.com,
 maisam.arif@amd.com, hawking.zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Update pcie link speed registers for smu v13.0.6 &
populate gpu metric table with pcie link speed rather than
gen for smu v13_0_0, smu v13_0_6 & smu v13_0_7

v2:
Update ESM register address
Used macro to convert pcie gen to speed

v3:
Chaged macro to inline function for pcie gen to speed

Signed-off-by: Asad Kamal <asad.kamal@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h     |  1 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c   |  1 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c |  7 ++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 16 ++++++++++++++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c |  7 ++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c           |  2 ++
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h           |  8 ++++++++
 7 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
index 1b4e0e4716ea..a0e5ad0381d6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
@@ -64,7 +64,6 @@
 #define LINK_SPEED_MAX			3
 
 static const __maybe_unused uint16_t link_width[] = {0, 1, 2, 4, 8, 12, 16};
-static const __maybe_unused uint16_t link_speed[] = {25, 50, 80, 160};
 
 static const
 struct smu_temperature_range __maybe_unused smu11_thermal_policy[] = {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 895cda8e6934..6863186937f7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -83,7 +83,6 @@ MODULE_FIRMWARE("amdgpu/smu_13_0_10.bin");
 #define PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE__SHIFT 0xE
 
 static const int link_width[] = {0, 1, 2, 4, 8, 12, 16};
-static const int link_speed[] = {25, 50, 80, 160};
 
 const int pmfw_decoded_link_speed[5] = {1, 2, 3, 4, 5};
 const int pmfw_decoded_link_width[7] = {0, 1, 2, 4, 8, 12, 16};
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 48b03524a52d..f4e2ac4a8713 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -102,6 +102,8 @@
 #define PP_OD_FEATURE_UCLK_FMAX				3
 #define PP_OD_FEATURE_GFX_VF_CURVE			4
 
+#define LINK_SPEED_MAX					3
+
 static struct cmn2asic_msg_mapping smu_v13_0_0_message_map[SMU_MSG_MAX_COUNT] = {
 	MSG_MAP(TestMessage,			PPSMC_MSG_TestMessage,                 1),
 	MSG_MAP(GetSmuVersion,			PPSMC_MSG_GetSmuVersion,               1),
@@ -1759,7 +1761,10 @@ static ssize_t smu_v13_0_0_get_gpu_metrics(struct smu_context *smu,
 	gpu_metrics->current_fan_speed = metrics->AvgFanRpm;
 
 	gpu_metrics->pcie_link_width = metrics->PcieWidth;
-	gpu_metrics->pcie_link_speed = metrics->PcieRate;
+	if ((metrics->PcieRate - 1) > LINK_SPEED_MAX)
+		gpu_metrics->pcie_link_speed = pcie_gen_to_speed(1);
+	else
+		gpu_metrics->pcie_link_speed = pcie_gen_to_speed(metrics->PcieRate);
 
 	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index 21275e496852..d1a9be37bece 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -80,12 +80,17 @@
 /* possible frequency drift (1Mhz) */
 #define EPSILON 1
 
-#define smnPCIE_ESM_CTRL 0x193D0
+#define smnPCIE_ESM_CTRL 0x93D0
 #define smnPCIE_LC_LINK_WIDTH_CNTL 0x1a340288
 #define PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD_MASK 0x00000070L
 #define PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD__SHIFT 0x4
 #define MAX_LINK_WIDTH 6
 
+#define smnPCIE_LC_SPEED_CNTL                   0x1a340290
+#define PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE_MASK 0xE0
+#define PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE__SHIFT 0x5
+#define LINK_SPEED_MAX				4
+
 static const struct cmn2asic_msg_mapping smu_v13_0_6_message_map[SMU_MSG_MAX_COUNT] = {
 	MSG_MAP(TestMessage,			     PPSMC_MSG_TestMessage,			0),
 	MSG_MAP(GetSmuVersion,			     PPSMC_MSG_GetSmuVersion,			1),
@@ -1936,6 +1941,7 @@ smu_v13_0_6_get_current_pcie_link_width_level(struct smu_context *smu)
 static int smu_v13_0_6_get_current_pcie_link_speed(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
+	uint32_t speed_level;
 	uint32_t esm_ctrl;
 
 	/* TODO: confirm this on real target */
@@ -1943,7 +1949,13 @@ static int smu_v13_0_6_get_current_pcie_link_speed(struct smu_context *smu)
 	if ((esm_ctrl >> 15) & 0x1FFFF)
 		return (((esm_ctrl >> 8) & 0x3F) + 128);
 
-	return smu_v13_0_get_current_pcie_link_speed(smu);
+	speed_level = (RREG32_PCIE(smnPCIE_LC_SPEED_CNTL) &
+		PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE_MASK)
+		>> PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE__SHIFT;
+	if (speed_level > LINK_SPEED_MAX)
+		speed_level = 0;
+
+	return pcie_gen_to_speed(speed_level + 1);
 }
 
 static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 690f89fcbbe3..df88206aaf13 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -78,6 +78,8 @@
 #define PP_OD_FEATURE_UCLK_FMAX				3
 #define PP_OD_FEATURE_GFX_VF_CURVE			4
 
+#define LINK_SPEED_MAX					3
+
 static struct cmn2asic_msg_mapping smu_v13_0_7_message_map[SMU_MSG_MAX_COUNT] = {
 	MSG_MAP(TestMessage,			PPSMC_MSG_TestMessage,                 1),
 	MSG_MAP(GetSmuVersion,			PPSMC_MSG_GetSmuVersion,               1),
@@ -1735,7 +1737,10 @@ static ssize_t smu_v13_0_7_get_gpu_metrics(struct smu_context *smu,
 	gpu_metrics->current_fan_speed = metrics->AvgFanRpm;
 
 	gpu_metrics->pcie_link_width = metrics->PcieWidth;
-	gpu_metrics->pcie_link_speed = metrics->PcieRate;
+	if ((metrics->PcieRate - 1) > LINK_SPEED_MAX)
+		gpu_metrics->pcie_link_speed = pcie_gen_to_speed(1);
+	else
+		gpu_metrics->pcie_link_speed = pcie_gen_to_speed(metrics->PcieRate);
 
 	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
index 442d267088bc..12618a583e97 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -39,6 +39,8 @@
 
 #define MP1_C2PMSG_90__CONTENT_MASK                                                                    0xFFFFFFFFL
 
+const int link_speed[] = {25, 50, 80, 160, 320, 640};
+
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(type)	#type
 static const char * const __smu_message_names[] = {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
index d7cd358a53bd..7d0251422228 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
@@ -30,6 +30,14 @@
 #define FDO_PWM_MODE_STATIC  1
 #define FDO_PWM_MODE_STATIC_RPM 5
 
+extern const int link_speed[];
+
+/* Helper to Convert from PCIE Gen 1/2/3/4/5/6 to 0.1 GT/s speed units */
+static inline int pcie_gen_to_speed(uint32_t gen)
+{
+	return ((gen <= 0) ? link_speed[0] : link_speed[gen - 1]);
+}
+
 int smu_cmn_send_msg_without_waiting(struct smu_context *smu,
 				     uint16_t msg_index,
 				     uint32_t param);
-- 
2.34.1


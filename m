Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38F518EF0
	for <lists+amd-gfx@lfdr.de>; Tue,  3 May 2022 22:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB8C10F371;
	Tue,  3 May 2022 20:37:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5A210F371
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 May 2022 20:37:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4Ei+/W+c1HREdI5Pue1g+IifzbVexl3hlP0JnQi6tnIkoqwUBhU0xE+XTRVJajmk0fk6A2o2nA/ZHExStn/9hYd6oos0JtZEtbJhVmIGgi8WAnKIuPouWHKKKKXt14lVHOY6jupX8FN+KdWzsaAo8lEBUIf8RQvEEEAyQnAOX2CQBvtnmgkBa2jtMi5VwB7gknacEN0k42N0tOR3lIFQDZCdPiEl2qQ3Rnrb3RIK1jZXB00/lvoTgTvD9Neq/AFr7T4JjfS+XnoQW3p/4zJ+oSdm9UHifjQVDVxgjme5sAR2y06dREnmnfa60Zoc/LyuS6+N5f3XwQJ7vd5jRCyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTTWpsSolPzptAuiETbGhgCvUvVGv3sKxhPyJimNcuM=;
 b=geUIhhfRgNMo8ekKh46hYE7xt6jcGf2Way6ZaXTfEDV87mrqX0/cvP6zVsGcz6zAaS5xLkfL9PXKhmOhbmqdPQHhOUmK+UvY/GGsJafoAGnw8QZKj4hxNvmgaza/WfEjfrQv3w/f0I9C+g1qJwC6kdKBi6T7zPUdTas8AwgiX12kxf4KPP1Rg7nX8Icz29dzHL9OkEHn8gBImyRKOKUOWVVIP9FQR39UfQDRz9oRMhSHRdiB/QbWghWXBqA0R83T9P2T6aN5M7LLHreuF2itZPMi5AIqPHkY9Umir7a75K6HrVm1c3uSsr9+x+PXNBG4sTJcZRA/kGEaL2xpOIj15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTTWpsSolPzptAuiETbGhgCvUvVGv3sKxhPyJimNcuM=;
 b=gVpz2tIz79v6Lr/FOUbEv+ii5m52zZxEOhRmGn7K70HxsT7fjjHU0jmCh/BC+EiMVMyJ+DQ4+lS/sFtPo7BH8GPY1mQHqfvkWpzB7ezU6JsUeIhJO4ObsSG1wlBn5y1nOJhwLWp4I0Xq2RowdqDF/puHcEnYze9NQb2PhEyLGj4=
Received: from MW4PR04CA0134.namprd04.prod.outlook.com (2603:10b6:303:84::19)
 by CH0PR12MB5330.namprd12.prod.outlook.com (2603:10b6:610:d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 20:37:32 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::f0) by MW4PR04CA0134.outlook.office365.com
 (2603:10b6:303:84::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Tue, 3 May 2022 20:37:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Tue, 3 May 2022 20:37:31 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 3 May
 2022 15:37:29 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/26] drm/amd/pm: add SMU_13_0_7 ppt_funcs for SMU_13_0_7
Date: Tue, 3 May 2022 16:36:53 -0400
Message-ID: <20220503203716.1230313-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503203716.1230313-1-alexander.deucher@amd.com>
References: <20220503203716.1230313-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3542f3f-1f1d-46c4-eac7-08da2d44bf8d
X-MS-TrafficTypeDiagnostic: CH0PR12MB5330:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5330872614112104B93694D5F7C09@CH0PR12MB5330.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUip5e3QeskeLE9ML44BjZ9VO1RNICZKRqRh/P2mi6s57tmL1nZETYyiwpIzxQbBbmn+Gn9UAjlzwdSUJld8zu5sJP6Kz2aIoHb6+P3kYtmXjoEIZsfoUhGKDViatDMU9lXMFrD49JKBupzseQDsSCYLaQ2k060iGWzDXfW3mSi7sLg6/f9D2JbzFMywFpaUi4DvLqQM0gtFKPT2iLSiPyciobtam/BJZdG/phZ8Ei/9bZ+rLh/FlOKiH8IPj+DULA0OdIIWA/8xNWZe3s+o/isSaeAEbHnmftQnDSDAV6jB22HNlQ24E/io0HNOF/HTNXT3ZTpPcJ4aIha8j9ynnzKO1hYI/k58YqEKD3vpEJhWPY6ZJXrugxmi/65F/rZSti6OehqdGEHScv1JVAQTBkfxbpsEat4dmQRtLiyiThU2i0jI4diPCw5YaQF2AfbE8pDDiBsHtdNmzj1gHh1jc96pAnl05CHWSzGJDg216FIBT0FY92osoA5HLiGNHGh1Va/Euq4CeseoWZJo4BHk3ZiVgy5G4RuXz94Ngg6VVxLDwpPxR+WFfpAjpu8jq/5E3qRU6qfLSn1nPsSnvHnmQRSOM9NmqDqXtLK7sfe0D+h0bHtc3PNKO4fjReslKFDFuDiXDEIqCB4C8IO/R50IENYIEp4qWnTChzuNMehcpsjuQ8k0yReCjw+mlsIP7HrUwIp5Q4eRCiKk6opci9L6Rw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(86362001)(5660300002)(70586007)(70206006)(508600001)(8936002)(8676002)(40460700003)(36860700001)(26005)(186003)(2616005)(16526019)(7696005)(47076005)(356005)(2906002)(81166007)(83380400001)(54906003)(1076003)(336012)(30864003)(6666004)(82310400005)(316002)(36756003)(6916009)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 20:37:31.8777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3542f3f-1f1d-46c4-eac7-08da2d44bf8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5330
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Chengming Gui <Jack.Gui@amd.com>

Add initial support for SMU 13.0.7.

V2: unify ppt name, fix copyright format, add missing break (Kenneth/Evan)
V3: Split PMFW headers as separate patch (Alex)

Signed-off-by: Chengming Gui <Jack.Gui@amd.com>
Reviewed-by: Evan Quan <evan.quan@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |   4 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile   |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |   3 +
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 473 ++++++++++++++++++
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.h  |  28 ++
 6 files changed, 510 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.h

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 6c71106b12c3..395f266be690 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -39,6 +39,7 @@
 #include "cyan_skillfish_ppt.h"
 #include "smu_v13_0_0_ppt.h"
 #include "smu_v13_0_5_ppt.h"
+#include "smu_v13_0_7_ppt.h"
 #include "amd_pcie.h"
 
 /*
@@ -569,6 +570,9 @@ static int smu_set_funcs(struct amdgpu_device *adev)
 	case IP_VERSION(13, 0, 0):
 		smu_v13_0_0_set_ppt_funcs(smu);
 		break;
+	case IP_VERSION(13, 0, 7):
+		smu_v13_0_7_set_ppt_funcs(smu);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
index 39b51f7a2c1d..4a52ab737dd5 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
@@ -30,6 +30,7 @@
 #define SMU13_DRIVER_IF_VERSION_ALDE 0x08
 #define SMU13_DRIVER_IF_VERSION_SMU_V13_0_5 0x04
 #define SMU13_DRIVER_IF_VERSION_SMU_V13_0_0 0x27
+#define SMU13_DRIVER_IF_VERSION_SMU_V13_0_7 0x28
 
 #define SMU13_MODE1_RESET_WAIT_TIME_IN_MS 500  //500ms
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
index 74e9614a26d3..4711fb53dd19 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
@@ -23,7 +23,7 @@
 # Makefile for the 'smu manager' sub-component of powerplay.
 # It provides the smu management services for the driver.
 
-SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_5_ppt.o
+SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o
 
 AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 3e6f33210008..8946df456a95 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -280,6 +280,9 @@ int smu_v13_0_check_fw_version(struct smu_context *smu)
 	case IP_VERSION(13, 0, 0):
 		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_SMU_V13_0_0;
 		break;
+	case IP_VERSION(13, 0, 7):
+		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_SMU_V13_0_7;
+		break;
 	case IP_VERSION(13, 0, 1):
 	case IP_VERSION(13, 0, 3):
 	case IP_VERSION(13, 0, 8):
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
new file mode 100644
index 000000000000..f62402f698ed
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -0,0 +1,473 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#define SWSMU_CODE_LAYER_L2
+
+#include <linux/firmware.h>
+#include <linux/pci.h>
+#include <linux/i2c.h>
+#include "amdgpu.h"
+#include "amdgpu_smu.h"
+#include "atomfirmware.h"
+#include "amdgpu_atomfirmware.h"
+#include "amdgpu_atombios.h"
+#include "smu_v13_0.h"
+#include "smu13_driver_if_v13_0_7.h"
+#include "soc15_common.h"
+#include "atom.h"
+#include "smu_v13_0_7_ppt.h"
+#include "smu_v13_0_7_pptable.h"
+#include "smu_v13_0_7_ppsmc.h"
+#include "nbio/nbio_4_3_0_offset.h"
+#include "nbio/nbio_4_3_0_sh_mask.h"
+#include "mp/mp_13_0_0_offset.h"
+#include "mp/mp_13_0_0_sh_mask.h"
+
+#include "asic_reg/mp/mp_13_0_0_sh_mask.h"
+#include "smu_cmn.h"
+
+/*
+ * DO NOT use these for err/warn/info/debug messages.
+ * Use dev_err, dev_warn, dev_info and dev_dbg instead.
+ * They are more MGPU friendly.
+ */
+#undef pr_err
+#undef pr_warn
+#undef pr_info
+#undef pr_debug
+
+#define to_amdgpu_device(x) (container_of(x, struct amdgpu_device, pm.smu_i2c))
+
+#define FEATURE_MASK(feature) (1ULL << feature)
+#define SMC_DPM_FEATURE ( \
+	FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT)     | \
+	FEATURE_MASK(FEATURE_DPM_UCLK_BIT)	 | \
+	FEATURE_MASK(FEATURE_DPM_LINK_BIT)       | \
+	FEATURE_MASK(FEATURE_DPM_SOCCLK_BIT)     | \
+	FEATURE_MASK(FEATURE_DPM_FCLK_BIT)	 | \
+	FEATURE_MASK(FEATURE_DPM_MP0CLK_BIT))
+
+#define smnMP1_FIRMWARE_FLAGS_SMU_13_0_7   0x3b10028
+
+static struct cmn2asic_msg_mapping smu_v13_0_7_message_map[SMU_MSG_MAX_COUNT] = {
+	MSG_MAP(TestMessage,			PPSMC_MSG_TestMessage,                 1),
+	MSG_MAP(GetSmuVersion,			PPSMC_MSG_GetSmuVersion,               1),
+	MSG_MAP(GetDriverIfVersion,		PPSMC_MSG_GetDriverIfVersion,          1),
+	MSG_MAP(SetAllowedFeaturesMaskLow,	PPSMC_MSG_SetAllowedFeaturesMaskLow,   0),
+	MSG_MAP(SetAllowedFeaturesMaskHigh,	PPSMC_MSG_SetAllowedFeaturesMaskHigh,  0),
+	MSG_MAP(EnableAllSmuFeatures,		PPSMC_MSG_EnableAllSmuFeatures,        0),
+	MSG_MAP(DisableAllSmuFeatures,		PPSMC_MSG_DisableAllSmuFeatures,       0),
+	MSG_MAP(EnableSmuFeaturesLow,		PPSMC_MSG_EnableSmuFeaturesLow,        1),
+	MSG_MAP(EnableSmuFeaturesHigh,		PPSMC_MSG_EnableSmuFeaturesHigh,       1),
+	MSG_MAP(DisableSmuFeaturesLow,		PPSMC_MSG_DisableSmuFeaturesLow,       1),
+	MSG_MAP(DisableSmuFeaturesHigh,		PPSMC_MSG_DisableSmuFeaturesHigh,      1),
+	MSG_MAP(GetEnabledSmuFeaturesLow,       PPSMC_MSG_GetRunningSmuFeaturesLow,    1),
+	MSG_MAP(GetEnabledSmuFeaturesHigh,	PPSMC_MSG_GetRunningSmuFeaturesHigh,   1),
+	MSG_MAP(SetWorkloadMask,		PPSMC_MSG_SetWorkloadMask,             1),
+	MSG_MAP(SetPptLimit,			PPSMC_MSG_SetPptLimit,                 0),
+	MSG_MAP(SetDriverDramAddrHigh,		PPSMC_MSG_SetDriverDramAddrHigh,       1),
+	MSG_MAP(SetDriverDramAddrLow,		PPSMC_MSG_SetDriverDramAddrLow,        1),
+	MSG_MAP(SetToolsDramAddrHigh,		PPSMC_MSG_SetToolsDramAddrHigh,        0),
+	MSG_MAP(SetToolsDramAddrLow,		PPSMC_MSG_SetToolsDramAddrLow,         0),
+	MSG_MAP(TransferTableSmu2Dram,		PPSMC_MSG_TransferTableSmu2Dram,       1),
+	MSG_MAP(TransferTableDram2Smu,		PPSMC_MSG_TransferTableDram2Smu,       0),
+	MSG_MAP(UseDefaultPPTable,		PPSMC_MSG_UseDefaultPPTable,           0),
+	MSG_MAP(RunDcBtc,			PPSMC_MSG_RunDcBtc,                    0),
+	MSG_MAP(EnterBaco,			PPSMC_MSG_EnterBaco,                   0),
+	MSG_MAP(SetSoftMinByFreq,		PPSMC_MSG_SetSoftMinByFreq,            1),
+	MSG_MAP(SetSoftMaxByFreq,		PPSMC_MSG_SetSoftMaxByFreq,            1),
+	MSG_MAP(SetHardMinByFreq,		PPSMC_MSG_SetHardMinByFreq,            1),
+	MSG_MAP(SetHardMaxByFreq,		PPSMC_MSG_SetHardMaxByFreq,            0),
+	MSG_MAP(GetMinDpmFreq,			PPSMC_MSG_GetMinDpmFreq,               1),
+	MSG_MAP(GetMaxDpmFreq,			PPSMC_MSG_GetMaxDpmFreq,               1),
+	MSG_MAP(GetDpmFreqByIndex,		PPSMC_MSG_GetDpmFreqByIndex,           1),
+};
+
+static struct cmn2asic_mapping smu_v13_0_7_clk_map[SMU_CLK_COUNT] = {
+	CLK_MAP(GFXCLK,		PPCLK_GFXCLK),
+	CLK_MAP(SCLK,		PPCLK_GFXCLK),
+	CLK_MAP(SOCCLK,		PPCLK_SOCCLK),
+	CLK_MAP(FCLK,		PPCLK_FCLK),
+	CLK_MAP(UCLK,		PPCLK_UCLK),
+	CLK_MAP(MCLK,		PPCLK_UCLK),
+};
+
+static struct cmn2asic_mapping smu_v13_0_7_feature_mask_map[SMU_FEATURE_COUNT] = {
+	FEA_MAP(DPM_GFXCLK),
+};
+
+static struct cmn2asic_mapping smu_v13_0_7_table_map[SMU_TABLE_COUNT] = {
+	TAB_MAP(PPTABLE),
+	TAB_MAP(WATERMARKS),
+	TAB_MAP(AVFS_PSM_DEBUG),
+	TAB_MAP(PMSTATUSLOG),
+	TAB_MAP(SMU_METRICS),
+	TAB_MAP(DRIVER_SMU_CONFIG),
+	TAB_MAP(ACTIVITY_MONITOR_COEFF),
+};
+
+static struct cmn2asic_mapping smu_v13_0_7_pwr_src_map[SMU_POWER_SOURCE_COUNT] = {
+	PWR_MAP(AC),
+	PWR_MAP(DC),
+};
+
+static struct cmn2asic_mapping smu_v13_0_7_workload_map[PP_SMC_POWER_PROFILE_COUNT] = {
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT,	WORKLOAD_PPLIB_DEFAULT_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_FULLSCREEN3D,		WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_POWERSAVING,		WORKLOAD_PPLIB_POWER_SAVING_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_VIDEO,		WORKLOAD_PPLIB_VIDEO_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_VR,			WORKLOAD_PPLIB_VR_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_COMPUTE,		WORKLOAD_PPLIB_CUSTOM_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_CUSTOM,		WORKLOAD_PPLIB_CUSTOM_BIT),
+};
+
+static int
+smu_v13_0_7_get_allowed_feature_mask(struct smu_context *smu,
+				  uint32_t *feature_mask, uint32_t num)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	if (num > 2)
+		return -EINVAL;
+
+	memset(feature_mask, 0, sizeof(uint32_t) * num);
+
+	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_GFX_IMU_BIT);
+
+	if (adev->pm.pp_feature & PP_SCLK_DPM_MASK) {
+		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT);
+	}
+
+	return 0;
+}
+
+static int smu_v13_0_7_check_powerplay_table(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_13_0_7_powerplay_table *powerplay_table =
+		table_context->power_play_table;
+	struct smu_baco_context *smu_baco = &smu->smu_baco;
+
+	if (powerplay_table->platform_caps & SMU_13_0_7_PP_PLATFORM_CAP_HARDWAREDC)
+		smu->dc_controlled_by_gpio = true;
+
+	if (powerplay_table->platform_caps & SMU_13_0_7_PP_PLATFORM_CAP_BACO ||
+	    powerplay_table->platform_caps & SMU_13_0_7_PP_PLATFORM_CAP_MACO)
+		smu_baco->platform_support = true;
+
+	table_context->thermal_controller_type =
+		powerplay_table->thermal_controller_type;
+
+	/*
+	 * Instead of having its own buffer space and get overdrive_table copied,
+	 * smu->od_settings just points to the actual overdrive_table
+	 */
+	smu->od_settings = &powerplay_table->overdrive_table;
+
+	return 0;
+}
+
+static int smu_v13_0_7_store_powerplay_table(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_13_0_7_powerplay_table *powerplay_table =
+		table_context->power_play_table;
+	struct amdgpu_device *adev = smu->adev;
+
+	if (adev->pdev->device == 0x51)
+		powerplay_table->smc_pptable.SkuTable.DebugOverrides |= 0x00000080;
+
+	memcpy(table_context->driver_pptable, &powerplay_table->smc_pptable,
+	       sizeof(PPTable_t));
+
+	return 0;
+}
+
+int smu_v13_0_7_check_fw_status(struct smu_context *smu) {
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t mp1_fw_flags;
+
+	mp1_fw_flags = RREG32_PCIE(MP1_Public |
+				   (smnMP1_FIRMWARE_FLAGS_SMU_13_0_7 & 0xffffffff));
+
+	if ((mp1_fw_flags & MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED_MASK) >>
+			MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED__SHIFT)
+		return 0;
+
+	return -EIO;
+}
+
+#ifndef atom_smc_dpm_info_table_13_0_7
+struct atom_smc_dpm_info_table_13_0_7
+{
+	struct atom_common_table_header table_header;
+	BoardTable_t BoardTable;
+};
+#endif
+
+static int smu_v13_0_7_append_powerplay_table(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+
+	PPTable_t *smc_pptable = table_context->driver_pptable;
+
+	struct atom_smc_dpm_info_table_13_0_7 *smc_dpm_table;
+
+	BoardTable_t *BoardTable = &smc_pptable->BoardTable;
+
+	int index, ret;
+
+	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
+	smc_dpm_info);
+
+	ret = amdgpu_atombios_get_data_table(smu->adev, index, NULL, NULL, NULL,
+			(uint8_t **)&smc_dpm_table);
+	if (ret)
+		return ret;
+
+	memcpy(BoardTable, &smc_dpm_table->BoardTable, sizeof(BoardTable_t));
+
+	return 0;
+}
+
+
+static int smu_v13_0_7_setup_pptable(struct smu_context *smu)
+{
+	int ret = 0;
+
+	ret = smu_v13_0_setup_pptable(smu);
+	if (ret)
+		return ret;
+
+	ret = smu_v13_0_7_store_powerplay_table(smu);
+	if (ret)
+		return ret;
+
+	ret = smu_v13_0_7_append_powerplay_table(smu);
+	if (ret)
+		return ret;
+
+	ret = smu_v13_0_7_check_powerplay_table(smu);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int smu_v13_0_7_tables_init(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *tables = smu_table->tables;
+	struct amdgpu_device *adev = smu->adev;
+
+	SMU_TABLE_INIT(tables, SMU_TABLE_PPTABLE, sizeof(PPTable_t),
+		PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+
+	SMU_TABLE_INIT(tables, SMU_TABLE_WATERMARKS, sizeof(Watermarks_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS, sizeof(SmuMetricsExternal_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_I2C_COMMANDS, sizeof(SwI2cRequest_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_OVERDRIVE, sizeof(OverDriveTable_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_PMSTATUSLOG, SMU13_TOOL_SIZE,
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_ACTIVITY_MONITOR_COEFF,
+		       sizeof(DpmActivityMonitorCoeffIntExternal_t), PAGE_SIZE,
+	               AMDGPU_GEM_DOMAIN_VRAM);
+
+	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
+	if (!smu_table->metrics_table)
+		goto err0_out;
+	smu_table->metrics_time = 0;
+
+	smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v1_1);
+	smu_table->gpu_metrics_table = kzalloc(smu_table->gpu_metrics_table_size, GFP_KERNEL);
+	if (!smu_table->gpu_metrics_table)
+		goto err1_out;
+
+	smu_table->watermarks_table = kzalloc(sizeof(Watermarks_t), GFP_KERNEL);
+	if (!smu_table->watermarks_table)
+		goto err2_out;
+
+	return 0;
+
+err2_out:
+	kfree(smu_table->gpu_metrics_table);
+err1_out:
+	kfree(smu_table->metrics_table);
+err0_out:
+	return -ENOMEM;
+}
+
+static int smu_v13_0_7_allocate_dpm_context(struct smu_context *smu)
+{
+	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
+
+	smu_dpm->dpm_context = kzalloc(sizeof(struct smu_13_0_dpm_context),
+				       GFP_KERNEL);
+	if (!smu_dpm->dpm_context)
+		return -ENOMEM;
+
+	smu_dpm->dpm_context_size = sizeof(struct smu_13_0_dpm_context);
+
+	return 0;
+}
+
+static int smu_v13_0_7_init_smc_tables(struct smu_context *smu)
+{
+	int ret = 0;
+
+	ret = smu_v13_0_7_tables_init(smu);
+	if (ret)
+		return ret;
+
+	ret = smu_v13_0_7_allocate_dpm_context(smu);
+	if (ret)
+		return ret;
+
+	return smu_v13_0_init_smc_tables(smu);
+}
+
+static int smu_v13_0_7_set_default_dpm_table(struct smu_context *smu)
+{
+	struct smu_13_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
+	PPTable_t *driver_ppt = smu->smu_table.driver_pptable;
+	SkuTable_t *sku_ppt = &driver_ppt->SkuTable;
+	struct smu_13_0_dpm_table *dpm_table;
+	struct amdgpu_device *adev = smu->adev;
+	int ret = 0;
+
+	/* socclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.soc_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_SOCCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_SOCCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+		dpm_table->is_fine_grained =
+			!sku_ppt->DpmDescriptor[PPCLK_SOCCLK].SnapToDiscrete;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.socclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* gfxclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.gfx_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_GFXCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+		dpm_table->is_fine_grained =
+			!sku_ppt->DpmDescriptor[PPCLK_GFXCLK].SnapToDiscrete;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.gfxclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* uclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.uclk_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_UCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+		dpm_table->is_fine_grained =
+			!sku_ppt->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.uclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	return 0;
+}
+
+static bool smu_v13_0_7_is_dpm_running(struct smu_context *smu)
+{
+	int ret = 0;
+	uint64_t feature_enabled;
+
+	ret = smu_cmn_get_enabled_mask(smu, &feature_enabled);
+	if (ret)
+		return false;
+
+	return !!(feature_enabled & SMC_DPM_FEATURE);
+}
+
+static void smu_v13_0_7_dump_pptable(struct smu_context *smu)
+{
+       struct smu_table_context *table_context = &smu->smu_table;
+       PPTable_t *pptable = table_context->driver_pptable;
+       SkuTable_t *skutable = &pptable->SkuTable;
+
+       dev_info(smu->adev->dev, "Dumped PPTable:\n");
+
+       dev_info(smu->adev->dev, "Version = 0x%08x\n", skutable->Version);
+       dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", skutable->FeaturesToRun[0]);
+       dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", skutable->FeaturesToRun[1]);
+}
+
+static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
+	.get_allowed_feature_mask = smu_v13_0_7_get_allowed_feature_mask,
+	.set_default_dpm_table = smu_v13_0_7_set_default_dpm_table,
+	.is_dpm_running = smu_v13_0_7_is_dpm_running,
+	.dump_pptable = smu_v13_0_7_dump_pptable,
+	.init_microcode = smu_v13_0_init_microcode,
+	.load_microcode = smu_v13_0_load_microcode,
+	.init_smc_tables = smu_v13_0_7_init_smc_tables,
+	.init_power = smu_v13_0_init_power,
+	.check_fw_status = smu_v13_0_7_check_fw_status,
+	.setup_pptable = smu_v13_0_7_setup_pptable,
+	.check_fw_version = smu_v13_0_check_fw_version,
+	.write_pptable = smu_cmn_write_pptable,
+	.set_driver_table_location = smu_v13_0_set_driver_table_location,
+	.system_features_control = smu_v13_0_system_features_control,
+	.set_allowed_mask = smu_v13_0_set_allowed_mask,
+};
+
+void smu_v13_0_7_set_ppt_funcs(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	smu->ppt_funcs = &smu_v13_0_7_ppt_funcs;
+	smu->message_map = smu_v13_0_7_message_map;
+	smu->clock_map = smu_v13_0_7_clk_map;
+	smu->feature_map = smu_v13_0_7_feature_mask_map;
+	smu->table_map = smu_v13_0_7_table_map;
+	smu->pwr_src_map = smu_v13_0_7_pwr_src_map;
+	smu->workload_map = smu_v13_0_7_workload_map;
+}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.h b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.h
new file mode 100644
index 000000000000..a4763cfedc4f
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#ifndef __SMU_V13_0_7_PPT_H__
+#define __SMU_V13_0_7_PPT_H__
+
+extern void smu_v13_0_7_set_ppt_funcs(struct smu_context *smu);
+
+#endif
-- 
2.35.1


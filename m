Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CEC524355
	for <lists+amd-gfx@lfdr.de>; Thu, 12 May 2022 05:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7278D10F04B;
	Thu, 12 May 2022 03:23:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDF110EFA8
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 May 2022 03:23:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtATUm4YU30W0+0i1y53xBsagNw75YZbFL4HZH7H1pexAsyyn3eZnTOaNdH8tM7cwgX/iVIIKr/TSYblyMRDNo0tg+bUHoTWwRRwIa1VTG639JwnNa6O6vsvZPhGtAGqwKjI0zhUn6Kx9+6TSAMdgeJ4Kp57nu1f7aeUdltrjDtZMxJqvDsQKqmvotbXCe2R9KxQqGcF4cRgiKNxYX3+dlnGXvXCK1eTUS1DW0Mww6ogFvGKKLzS1wDE47PycFhLfSi2FpVSd4/wVLBYnm+6BHd4911/QdgWsjQRfFJaxU/wvUPlmAxExr4y3jOESAab/ifObIIbfgqdEGkCxYU8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYa8DYUzvBzhfqpEDKjQ6PfTFajAplVCzofJqxwt4e4=;
 b=gn2veIZla3h9OWN3wxA06YyjrvfBzWzAVU7EsxgRQX5KSfA9fzDCN+RiKMFWjdi5USL4SubRszhIGSMwyFjrRKn0RQnc9e8iMgpnNoCjXetiWO/fGq87FnmopFTZKoIjyzg6+uiyCB6kTQu/3fNpLjslJlE+MVNPvYnC9CJWwdcfLzcHdox3GagStTRKMKQP9mTEOIw3BN4kWxJneaONAZhwRkeKcMjA7ku2zdH+6LeYaeI4Cs3zGN9HmFwe1hscBHzVuovK5WcapuF5nfOTD7DbjmvT1ZDrGKF3uTy0JIWfcFQiarYCi5SWMU4HGvp8+ol6RZSc35SNtNFcTWLpyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYa8DYUzvBzhfqpEDKjQ6PfTFajAplVCzofJqxwt4e4=;
 b=meqQJRzlmwgy3RHaVdxcikBx3XJ13Q8awpQBbY5DcRs9vFgrJlHsXDk/TA2EI9QufwL9PIwa8GjcZ21Gp7CeLjwGRd48DNxPT3mteYnfOKnL+sm/s+dSIYwtvHVQ372xs3/wofjswFOgx2VkIp5sGiTRAK4Ksjd8g39RgODJVgM=
Received: from DM6PR11CA0051.namprd11.prod.outlook.com (2603:10b6:5:14c::28)
 by BN8PR12MB3314.namprd12.prod.outlook.com (2603:10b6:408:45::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Thu, 12 May
 2022 03:23:05 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::75) by DM6PR11CA0051.outlook.office365.com
 (2603:10b6:5:14c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Thu, 12 May 2022 03:23:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 03:23:04 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 22:23:03 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/8] drm/amdgpu/pm: add swsmu ppt implementation for SMU IP
 v13.0.4
Date: Wed, 11 May 2022 23:22:43 -0400
Message-ID: <20220512032247.528556-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512032247.528556-1-alexander.deucher@amd.com>
References: <20220512032247.528556-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 935e8aa0-c7b2-4a41-031b-08da33c6ba42
X-MS-TrafficTypeDiagnostic: BN8PR12MB3314:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB331464BAEF866F01413BA50CF7CB9@BN8PR12MB3314.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YcoSTvGqwVbliuUqn6B9cYpF5nTizBVgDhqnaF9n1/eZBtjpdfEMrbDXIjpiBXcOPZ/QMx22cCbsZmMQYXFZsSXng72g5xL+/3aAO2xJ8uQN0eYQsAu6oLh24XFt5G6L8MpzjSbE8+vinDC9baIZ8FS8hrzFjQ+jvFDjIX5XYjw4Uv2LJvmsn35cq9i8ZtkqMcfW9AzO59jbU4NWFgWOexHBTJKQK17Pec2AImqv1qEabCLpc0MZV2QyhmfMpXHo/GZTj2sapRSgG3oZSRbhm7E2Xc6UbThMxqBNN0ulb5F+7ftbmNR+7IifZnOgPIozIlbYeuknO/vYPoS7BHQ+XwRuxF007aIoakJC4lA6t2vjoaW8JADKMcXKb1eezpXPdG5RNFkEccrjSJODGzxAO3T9nP7SGcllJyyutY6Qur5q5hdlbPTUVg+1NSyoyO0L6vMXQF1mi3YDFEo7Exg4iuUaGf3LBQUDJIt72MRqRXqYu20zHAcla2nsJP72tIvCmGX8KYPyvkc20kgQr0m68PQeg7U9wawK0bGNDJwQIZKnT+YCfYouvxK6cySBBaHzVMR4KVaKb6iuPpmKwdTjpaQ4uy665rAlEqMkX+hxg8Ij6SMTUDqoYP09DCZEq0wrmTTVWgupB66sr4R/+JkYPeXYPmHNWmG6FBq+1+OaRFuRDhy8uv3duFCFebD54Uw0UVf6k5Ll+HhJBUG6/oNMXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(83380400001)(2906002)(356005)(186003)(16526019)(40460700003)(26005)(336012)(426003)(36860700001)(5660300002)(30864003)(47076005)(86362001)(7696005)(6666004)(2616005)(1076003)(8936002)(36756003)(82310400005)(8676002)(4326008)(81166007)(6916009)(70586007)(54906003)(70206006)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 03:23:04.6682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935e8aa0-c7b2-4a41-031b-08da33c6ba42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3314
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tim Huang <tim.huang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Tim Huang <tim.huang@amd.com>

Add swsmu ppt files for SMU IP v13.0.4.

Signed-off-by: Tim Huang <tim.huang@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile   |    3 +-
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c  | 1044 +++++++++++++++++
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.h  |   28 +
 3 files changed, 1074 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.h

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
index 4711fb53dd19..9043f6ef1aee 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
@@ -23,7 +23,8 @@
 # Makefile for the 'smu manager' sub-component of powerplay.
 # It provides the smu management services for the driver.
 
-SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o
+SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_4_ppt.o \
+	    smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o
 
 AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
new file mode 100644
index 000000000000..7d6ff141b43f
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
@@ -0,0 +1,1044 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+#include "smu_types.h"
+#define SWSMU_CODE_LAYER_L2
+
+#include "amdgpu.h"
+#include "amdgpu_smu.h"
+#include "smu_v13_0.h"
+#include "smu13_driver_if_v13_0_4.h"
+#include "smu_v13_0_4_ppt.h"
+#include "smu_v13_0_4_ppsmc.h"
+#include "smu_v13_0_4_pmfw.h"
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
+#define FEATURE_MASK(feature) (1ULL << feature)
+
+#define SMC_DPM_FEATURE ( \
+	FEATURE_MASK(FEATURE_CCLK_DPM_BIT) | \
+	FEATURE_MASK(FEATURE_VCN_DPM_BIT)	 | \
+	FEATURE_MASK(FEATURE_FCLK_DPM_BIT)	 | \
+	FEATURE_MASK(FEATURE_SOCCLK_DPM_BIT)	 | \
+	FEATURE_MASK(FEATURE_MP0CLK_DPM_BIT)	 | \
+	FEATURE_MASK(FEATURE_LCLK_DPM_BIT)	 | \
+	FEATURE_MASK(FEATURE_SHUBCLK_DPM_BIT)	 | \
+	FEATURE_MASK(FEATURE_DCFCLK_DPM_BIT)	 | \
+	FEATURE_MASK(FEATURE_ISP_DPM_BIT)	 | \
+	FEATURE_MASK(FEATURE_IPU_DPM_BIT)	 | \
+	FEATURE_MASK(FEATURE_GFX_DPM_BIT))
+
+static struct cmn2asic_msg_mapping smu_v13_0_4_message_map[SMU_MSG_MAX_COUNT] = {
+	MSG_MAP(TestMessage,                    PPSMC_MSG_TestMessage,			1),
+	MSG_MAP(GetSmuVersion,                  PPSMC_MSG_GetPmfwVersion,		1),
+	MSG_MAP(GetDriverIfVersion,             PPSMC_MSG_GetDriverIfVersion,		1),
+	MSG_MAP(EnableGfxOff,                   PPSMC_MSG_EnableGfxOff,			1),
+	MSG_MAP(AllowGfxOff,                    PPSMC_MSG_AllowGfxOff,			1),
+	MSG_MAP(DisallowGfxOff,                 PPSMC_MSG_DisallowGfxOff,		1),
+	MSG_MAP(PowerDownVcn,                   PPSMC_MSG_PowerDownVcn,			1),
+	MSG_MAP(PowerUpVcn,                     PPSMC_MSG_PowerUpVcn,			1),
+	MSG_MAP(SetHardMinVcn,                  PPSMC_MSG_SetHardMinVcn,		1),
+	MSG_MAP(PrepareMp1ForUnload,            PPSMC_MSG_PrepareMp1ForUnload,		1),
+	MSG_MAP(SetDriverDramAddrHigh,          PPSMC_MSG_SetDriverDramAddrHigh,	1),
+	MSG_MAP(SetDriverDramAddrLow,           PPSMC_MSG_SetDriverDramAddrLow,		1),
+	MSG_MAP(TransferTableSmu2Dram,          PPSMC_MSG_TransferTableSmu2Dram,	1),
+	MSG_MAP(TransferTableDram2Smu,          PPSMC_MSG_TransferTableDram2Smu,	1),
+	MSG_MAP(GfxDeviceDriverReset,           PPSMC_MSG_GfxDeviceDriverReset,		1),
+	MSG_MAP(GetEnabledSmuFeatures,          PPSMC_MSG_GetEnabledSmuFeatures,	1),
+	MSG_MAP(SetHardMinSocclkByFreq,         PPSMC_MSG_SetHardMinSocclkByFreq,	1),
+	MSG_MAP(SetSoftMinVcn,                  PPSMC_MSG_SetSoftMinVcn,		1),
+	MSG_MAP(GetGfxclkFrequency,             PPSMC_MSG_GetGfxclkFrequency,		1),
+	MSG_MAP(GetFclkFrequency,               PPSMC_MSG_GetFclkFrequency,		1),
+	MSG_MAP(SetSoftMaxGfxClk,               PPSMC_MSG_SetSoftMaxGfxClk,		1),
+	MSG_MAP(SetHardMinGfxClk,               PPSMC_MSG_SetHardMinGfxClk,		1),
+	MSG_MAP(SetSoftMaxSocclkByFreq,         PPSMC_MSG_SetSoftMaxSocclkByFreq,	1),
+	MSG_MAP(SetSoftMaxFclkByFreq,           PPSMC_MSG_SetSoftMaxFclkByFreq,		1),
+	MSG_MAP(SetSoftMaxVcn,                  PPSMC_MSG_SetSoftMaxVcn,		1),
+	MSG_MAP(SetPowerLimitPercentage,        PPSMC_MSG_SetPowerLimitPercentage,	1),
+	MSG_MAP(PowerDownJpeg,                  PPSMC_MSG_PowerDownJpeg,		1),
+	MSG_MAP(PowerUpJpeg,                    PPSMC_MSG_PowerUpJpeg,			1),
+	MSG_MAP(SetHardMinFclkByFreq,           PPSMC_MSG_SetHardMinFclkByFreq,		1),
+	MSG_MAP(SetSoftMinSocclkByFreq,         PPSMC_MSG_SetSoftMinSocclkByFreq,	1),
+	MSG_MAP(EnableGfxImu,                   PPSMC_MSG_EnableGfxImu,			1),
+	MSG_MAP(PowerUpIspByTile,               PPSMC_MSG_PowerUpIspByTile,		1),
+	MSG_MAP(PowerDownIspByTile,             PPSMC_MSG_PowerDownIspByTile,		1),
+};
+
+static struct cmn2asic_mapping smu_v13_0_4_feature_mask_map[SMU_FEATURE_COUNT] = {
+	FEA_MAP(CCLK_DPM),
+	FEA_MAP(FAN_CONTROLLER),
+	FEA_MAP(PPT),
+	FEA_MAP(TDC),
+	FEA_MAP(THERMAL),
+	FEA_MAP(VCN_DPM),
+	FEA_MAP_REVERSE(FCLK),
+	FEA_MAP_REVERSE(SOCCLK),
+	FEA_MAP(LCLK_DPM),
+	FEA_MAP(SHUBCLK_DPM),
+	FEA_MAP(DCFCLK_DPM),
+	FEA_MAP_HALF_REVERSE(GFX),
+	FEA_MAP(DS_GFXCLK),
+	FEA_MAP(DS_SOCCLK),
+	FEA_MAP(DS_LCLK),
+	FEA_MAP(DS_DCFCLK),
+	FEA_MAP(DS_FCLK),
+	FEA_MAP(DS_MP1CLK),
+	FEA_MAP(DS_MP0CLK),
+	FEA_MAP(GFX_DEM),
+	FEA_MAP(PSI),
+	FEA_MAP(PROCHOT),
+	FEA_MAP(CPUOFF),
+	FEA_MAP(STAPM),
+	FEA_MAP(S0I3),
+	FEA_MAP(PERF_LIMIT),
+	FEA_MAP(CORE_DLDO),
+	FEA_MAP(DS_VCN),
+	FEA_MAP(CPPC),
+	FEA_MAP(DF_CSTATES),
+	FEA_MAP(ATHUB_PG),
+};
+
+static struct cmn2asic_mapping smu_v13_0_4_table_map[SMU_TABLE_COUNT] = {
+	TAB_MAP_VALID(WATERMARKS),
+	TAB_MAP_VALID(SMU_METRICS),
+	TAB_MAP_VALID(CUSTOM_DPM),
+	TAB_MAP_VALID(DPMCLOCKS),
+};
+
+static int smu_v13_0_4_init_smc_tables(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *tables = smu_table->tables;
+
+	SMU_TABLE_INIT(tables, SMU_TABLE_WATERMARKS, sizeof(Watermarks_t),
+		PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_DPMCLOCKS, sizeof(DpmClocks_t),
+		PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS, sizeof(SmuMetrics_t),
+		PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+
+	smu_table->clocks_table = kzalloc(sizeof(DpmClocks_t), GFP_KERNEL);
+	if (!smu_table->clocks_table)
+		goto err0_out;
+
+	smu_table->metrics_table = kzalloc(sizeof(SmuMetrics_t), GFP_KERNEL);
+	if (!smu_table->metrics_table)
+		goto err1_out;
+	smu_table->metrics_time = 0;
+
+	smu_table->watermarks_table = kzalloc(sizeof(Watermarks_t), GFP_KERNEL);
+	if (!smu_table->watermarks_table)
+		goto err2_out;
+
+	smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v2_1);
+	smu_table->gpu_metrics_table = kzalloc(smu_table->gpu_metrics_table_size, GFP_KERNEL);
+	if (!smu_table->gpu_metrics_table)
+		goto err3_out;
+
+	return 0;
+
+err3_out:
+	kfree(smu_table->watermarks_table);
+err2_out:
+	kfree(smu_table->metrics_table);
+err1_out:
+	kfree(smu_table->clocks_table);
+err0_out:
+	return -ENOMEM;
+}
+
+static int smu_v13_0_4_fini_smc_tables(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+
+	kfree(smu_table->clocks_table);
+	smu_table->clocks_table = NULL;
+
+	kfree(smu_table->metrics_table);
+	smu_table->metrics_table = NULL;
+
+	kfree(smu_table->watermarks_table);
+	smu_table->watermarks_table = NULL;
+
+	return 0;
+}
+
+static bool smu_v13_0_4_is_dpm_running(struct smu_context *smu)
+{
+	int ret = 0;
+	uint64_t feature_enabled;
+
+	ret = smu_cmn_get_enabled_mask(smu, &feature_enabled);
+
+	if (ret)
+		return false;
+
+	return !!(feature_enabled & SMC_DPM_FEATURE);
+}
+
+static int smu_v13_0_4_system_features_control(struct smu_context *smu, bool en)
+{
+	struct amdgpu_device *adev = smu->adev;
+	int ret = 0;
+	/* SMU fw need this message to trigger IMU to complete the initialization */
+	if (en)
+		ret = smu_cmn_send_smc_msg(smu, SMU_MSG_EnableGfxImu, NULL);
+	else {
+		if (!adev->in_s0ix)
+			ret = smu_cmn_send_smc_msg(smu,
+						   SMU_MSG_PrepareMp1ForUnload,
+						   NULL);
+	}
+	return ret;
+}
+
+static int smu_v13_0_4_post_smu_init(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	int ret = 0;
+
+	/* allow message will be sent after enable message */
+	ret = smu_cmn_send_smc_msg(smu, SMU_MSG_EnableGfxOff, NULL);
+	if (ret)
+		dev_err(adev->dev, "Failed to Enable GfxOff!\n");
+	return ret;
+}
+
+static ssize_t smu_v13_0_4_get_gpu_metrics(struct smu_context *smu,
+					   void **table)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct gpu_metrics_v2_1 *gpu_metrics =
+		(struct gpu_metrics_v2_1 *)smu_table->gpu_metrics_table;
+	SmuMetrics_t metrics;
+	int ret = 0;
+
+	ret = smu_cmn_get_metrics_table(smu, &metrics, true);
+	if (ret)
+		return ret;
+
+	smu_cmn_init_soft_gpu_metrics(gpu_metrics, 2, 1);
+
+	gpu_metrics->temperature_gfx = metrics.GfxTemperature;
+	gpu_metrics->temperature_soc = metrics.SocTemperature;
+	memcpy(&gpu_metrics->temperature_core[0],
+		&metrics.CoreTemperature[0],
+		sizeof(uint16_t) * 8);
+	gpu_metrics->temperature_l3[0] = metrics.L3Temperature;
+
+	gpu_metrics->average_gfx_activity = metrics.GfxActivity;
+	gpu_metrics->average_mm_activity = metrics.UvdActivity;
+
+	gpu_metrics->average_socket_power = metrics.CurrentSocketPower;
+	gpu_metrics->average_gfx_power = metrics.Power[0];
+	gpu_metrics->average_soc_power = metrics.Power[1];
+	memcpy(&gpu_metrics->average_core_power[0],
+		&metrics.CorePower[0],
+		sizeof(uint16_t) * 8);
+
+	gpu_metrics->average_gfxclk_frequency = metrics.GfxclkFrequency;
+	gpu_metrics->average_socclk_frequency = metrics.SocclkFrequency;
+	gpu_metrics->average_uclk_frequency = metrics.MemclkFrequency;
+	gpu_metrics->average_fclk_frequency = metrics.MemclkFrequency;
+	gpu_metrics->average_vclk_frequency = metrics.VclkFrequency;
+	gpu_metrics->average_dclk_frequency = metrics.DclkFrequency;
+
+	memcpy(&gpu_metrics->current_coreclk[0],
+		&metrics.CoreFrequency[0],
+		sizeof(uint16_t) * 8);
+	gpu_metrics->current_l3clk[0] = metrics.L3Frequency;
+
+	gpu_metrics->throttle_status = metrics.ThrottlerStatus;
+
+	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
+
+	*table = (void *)gpu_metrics;
+
+	return sizeof(struct gpu_metrics_v2_1);
+}
+
+static int smu_v13_0_4_get_smu_metrics_data(struct smu_context *smu,
+					    MetricsMember_t member,
+					    uint32_t *value)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+
+	SmuMetrics_t *metrics = (SmuMetrics_t *)smu_table->metrics_table;
+	int ret = 0;
+
+	ret = smu_cmn_get_metrics_table(smu, NULL, false);
+	if (ret)
+		return ret;
+
+	switch (member) {
+	case METRICS_AVERAGE_GFXCLK:
+		*value = metrics->GfxclkFrequency;
+		break;
+	case METRICS_AVERAGE_SOCCLK:
+		*value = metrics->SocclkFrequency;
+		break;
+	case METRICS_AVERAGE_VCLK:
+		*value = metrics->VclkFrequency;
+		break;
+	case METRICS_AVERAGE_DCLK:
+		*value = metrics->DclkFrequency;
+		break;
+	case METRICS_AVERAGE_UCLK:
+		*value = metrics->MemclkFrequency;
+		break;
+	case METRICS_AVERAGE_GFXACTIVITY:
+		*value = metrics->GfxActivity / 100;
+		break;
+	case METRICS_AVERAGE_VCNACTIVITY:
+		*value = metrics->UvdActivity;
+		break;
+	case METRICS_AVERAGE_SOCKETPOWER:
+		*value = (metrics->CurrentSocketPower << 8) / 1000;
+		break;
+	case METRICS_TEMPERATURE_EDGE:
+		*value = metrics->GfxTemperature / 100 *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_HOTSPOT:
+		*value = metrics->SocTemperature / 100 *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_THROTTLER_STATUS:
+		*value = metrics->ThrottlerStatus;
+		break;
+	case METRICS_VOLTAGE_VDDGFX:
+		*value = metrics->Voltage[0];
+		break;
+	case METRICS_VOLTAGE_VDDSOC:
+		*value = metrics->Voltage[1];
+		break;
+	case METRICS_SS_APU_SHARE:
+		/* return the percentage of APU power with respect to APU's power limit.
+		 * percentage is reported, this isn't boost value. Smartshift power
+		 * boost/shift is only when the percentage is more than 100.
+		 */
+		if (metrics->StapmOpnLimit > 0)
+			*value =  (metrics->ApuPower * 100) / metrics->StapmOpnLimit;
+		else
+			*value = 0;
+		break;
+	case METRICS_SS_DGPU_SHARE:
+		/* return the percentage of dGPU power with respect to dGPU's power limit.
+		 * percentage is reported, this isn't boost value. Smartshift power
+		 * boost/shift is only when the percentage is more than 100.
+		 */
+		if ((metrics->dGpuPower > 0) &&
+		    (metrics->StapmCurrentLimit > metrics->StapmOpnLimit))
+			*value = (metrics->dGpuPower * 100) /
+				 (metrics->StapmCurrentLimit - metrics->StapmOpnLimit);
+		else
+			*value = 0;
+		break;
+	default:
+		*value = UINT_MAX;
+		break;
+	}
+
+	return ret;
+}
+
+static int smu_v13_0_4_get_current_clk_freq(struct smu_context *smu,
+					    enum smu_clk_type clk_type,
+					    uint32_t *value)
+{
+	MetricsMember_t member_type;
+
+	switch (clk_type) {
+	case SMU_SOCCLK:
+		member_type = METRICS_AVERAGE_SOCCLK;
+		break;
+	case SMU_VCLK:
+		member_type = METRICS_AVERAGE_VCLK;
+		break;
+	case SMU_DCLK:
+		member_type = METRICS_AVERAGE_DCLK;
+		break;
+	case SMU_MCLK:
+		member_type = METRICS_AVERAGE_UCLK;
+		break;
+	case SMU_FCLK:
+		return smu_cmn_send_smc_msg_with_param(smu,
+						       SMU_MSG_GetFclkFrequency,
+						       0, value);
+	case SMU_GFXCLK:
+	case SMU_SCLK:
+		return smu_cmn_send_smc_msg_with_param(smu,
+						       SMU_MSG_GetGfxclkFrequency,
+						       0, value);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return smu_v13_0_4_get_smu_metrics_data(smu, member_type, value);
+}
+
+static int smu_v13_0_4_get_dpm_freq_by_index(struct smu_context *smu,
+					     enum smu_clk_type clk_type,
+					     uint32_t dpm_level,
+					     uint32_t *freq)
+{
+	DpmClocks_t *clk_table = smu->smu_table.clocks_table;
+
+	if (!clk_table || clk_type >= SMU_CLK_COUNT)
+		return -EINVAL;
+
+	switch (clk_type) {
+	case SMU_SOCCLK:
+		if (dpm_level >= clk_table->NumSocClkLevelsEnabled)
+			return -EINVAL;
+		*freq = clk_table->SocClocks[dpm_level];
+		break;
+	case SMU_VCLK:
+		if (dpm_level >= clk_table->VcnClkLevelsEnabled)
+			return -EINVAL;
+		*freq = clk_table->VClocks[dpm_level];
+		break;
+	case SMU_DCLK:
+		if (dpm_level >= clk_table->VcnClkLevelsEnabled)
+			return -EINVAL;
+		*freq = clk_table->DClocks[dpm_level];
+		break;
+	case SMU_UCLK:
+	case SMU_MCLK:
+		if (dpm_level >= clk_table->NumDfPstatesEnabled)
+			return -EINVAL;
+		*freq = clk_table->DfPstateTable[dpm_level].MemClk;
+		break;
+	case SMU_FCLK:
+		if (dpm_level >= clk_table->NumDfPstatesEnabled)
+			return -EINVAL;
+		*freq = clk_table->DfPstateTable[dpm_level].FClk;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int smu_v13_0_4_get_dpm_level_count(struct smu_context *smu,
+					   enum smu_clk_type clk_type,
+					   uint32_t *count)
+{
+	DpmClocks_t *clk_table = smu->smu_table.clocks_table;
+
+	switch (clk_type) {
+	case SMU_SOCCLK:
+		*count = clk_table->NumSocClkLevelsEnabled;
+		break;
+	case SMU_VCLK:
+		*count = clk_table->VcnClkLevelsEnabled;
+		break;
+	case SMU_DCLK:
+		*count = clk_table->VcnClkLevelsEnabled;
+		break;
+	case SMU_MCLK:
+		*count = clk_table->NumDfPstatesEnabled;
+		break;
+	case SMU_FCLK:
+		*count = clk_table->NumDfPstatesEnabled;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int smu_v13_0_4_print_clk_levels(struct smu_context *smu,
+					enum smu_clk_type clk_type, char *buf)
+{
+	int i, size = 0, ret = 0;
+	uint32_t cur_value = 0, value = 0, count = 0;
+	uint32_t min, max;
+
+	smu_cmn_get_sysfs_buf(&buf, &size);
+
+	switch (clk_type) {
+	case SMU_OD_SCLK:
+		size += sysfs_emit_at(buf, size, "%s:\n", "OD_SCLK");
+		size += sysfs_emit_at(buf, size, "0: %10uMhz\n",
+		(smu->gfx_actual_hard_min_freq > 0) ? smu->gfx_actual_hard_min_freq : smu->gfx_default_hard_min_freq);
+		size += sysfs_emit_at(buf, size, "1: %10uMhz\n",
+		(smu->gfx_actual_soft_max_freq > 0) ? smu->gfx_actual_soft_max_freq : smu->gfx_default_soft_max_freq);
+		break;
+	case SMU_OD_RANGE:
+		size += sysfs_emit_at(buf, size, "%s:\n", "OD_RANGE");
+		size += sysfs_emit_at(buf, size, "SCLK: %7uMhz %10uMhz\n",
+				      smu->gfx_default_hard_min_freq,
+				      smu->gfx_default_soft_max_freq);
+		break;
+	case SMU_SOCCLK:
+	case SMU_VCLK:
+	case SMU_DCLK:
+	case SMU_MCLK:
+	case SMU_FCLK:
+		ret = smu_v13_0_4_get_current_clk_freq(smu, clk_type, &cur_value);
+		if (ret)
+			break;
+
+		ret = smu_v13_0_4_get_dpm_level_count(smu, clk_type, &count);
+		if (ret)
+			break;
+
+		for (i = 0; i < count; i++) {
+			ret = smu_v13_0_4_get_dpm_freq_by_index(smu, clk_type, i, &value);
+			if (ret)
+				break;
+
+			size += sysfs_emit_at(buf, size, "%d: %uMhz %s\n", i, value,
+					      cur_value == value ? "*" : "");
+		}
+		break;
+	case SMU_GFXCLK:
+	case SMU_SCLK:
+		ret = smu_v13_0_4_get_current_clk_freq(smu, clk_type, &cur_value);
+		if (ret)
+			break;
+		min = (smu->gfx_actual_hard_min_freq > 0) ? smu->gfx_actual_hard_min_freq : smu->gfx_default_hard_min_freq;
+		max = (smu->gfx_actual_soft_max_freq > 0) ? smu->gfx_actual_soft_max_freq : smu->gfx_default_soft_max_freq;
+		if (cur_value  == max)
+			i = 2;
+		else if (cur_value == min)
+			i = 0;
+		else
+			i = 1;
+		size += sysfs_emit_at(buf, size, "0: %uMhz %s\n", min,
+				      i == 0 ? "*" : "");
+		size += sysfs_emit_at(buf, size, "1: %uMhz %s\n",
+				      i == 1 ? cur_value : 1100, /* UMD PSTATE GFXCLK 1100 */
+				      i == 1 ? "*" : "");
+		size += sysfs_emit_at(buf, size, "2: %uMhz %s\n", max,
+				      i == 2 ? "*" : "");
+		break;
+	default:
+		break;
+	}
+
+	return size;
+}
+
+static int smu_v13_0_4_read_sensor(struct smu_context *smu,
+				   enum amd_pp_sensors sensor,
+				   void *data, uint32_t *size)
+{
+	int ret = 0;
+
+	if (!data || !size)
+		return -EINVAL;
+
+	switch (sensor) {
+	case AMDGPU_PP_SENSOR_GPU_LOAD:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_AVERAGE_GFXACTIVITY,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GPU_POWER:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_AVERAGE_SOCKETPOWER,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_EDGE_TEMP:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_TEMPERATURE_EDGE,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_TEMPERATURE_HOTSPOT,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GFX_MCLK:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_AVERAGE_UCLK,
+						       (uint32_t *)data);
+		*(uint32_t *)data *= 100;
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GFX_SCLK:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_AVERAGE_GFXCLK,
+						       (uint32_t *)data);
+		*(uint32_t *)data *= 100;
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_VDDGFX:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_VOLTAGE_VDDGFX,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_VDDNB:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_VOLTAGE_VDDSOC,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_SS_APU_SHARE:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_SS_APU_SHARE,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_SS_DGPU_SHARE:
+		ret = smu_v13_0_4_get_smu_metrics_data(smu,
+						       METRICS_SS_DGPU_SHARE,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static int smu_v13_0_4_set_watermarks_table(struct smu_context *smu,
+					    struct pp_smu_wm_range_sets *clock_ranges)
+{
+	int i;
+	int ret = 0;
+	Watermarks_t *table = smu->smu_table.watermarks_table;
+
+	if (!table || !clock_ranges)
+		return -EINVAL;
+
+	if (clock_ranges) {
+		if (clock_ranges->num_reader_wm_sets > NUM_WM_RANGES ||
+			clock_ranges->num_writer_wm_sets > NUM_WM_RANGES)
+			return -EINVAL;
+
+		for (i = 0; i < clock_ranges->num_reader_wm_sets; i++) {
+			table->WatermarkRow[WM_DCFCLK][i].MinClock =
+				clock_ranges->reader_wm_sets[i].min_drain_clk_mhz;
+			table->WatermarkRow[WM_DCFCLK][i].MaxClock =
+				clock_ranges->reader_wm_sets[i].max_drain_clk_mhz;
+			table->WatermarkRow[WM_DCFCLK][i].MinMclk =
+				clock_ranges->reader_wm_sets[i].min_fill_clk_mhz;
+			table->WatermarkRow[WM_DCFCLK][i].MaxMclk =
+				clock_ranges->reader_wm_sets[i].max_fill_clk_mhz;
+
+			table->WatermarkRow[WM_DCFCLK][i].WmSetting =
+				clock_ranges->reader_wm_sets[i].wm_inst;
+		}
+
+		for (i = 0; i < clock_ranges->num_writer_wm_sets; i++) {
+			table->WatermarkRow[WM_SOCCLK][i].MinClock =
+				clock_ranges->writer_wm_sets[i].min_fill_clk_mhz;
+			table->WatermarkRow[WM_SOCCLK][i].MaxClock =
+				clock_ranges->writer_wm_sets[i].max_fill_clk_mhz;
+			table->WatermarkRow[WM_SOCCLK][i].MinMclk =
+				clock_ranges->writer_wm_sets[i].min_drain_clk_mhz;
+			table->WatermarkRow[WM_SOCCLK][i].MaxMclk =
+				clock_ranges->writer_wm_sets[i].max_drain_clk_mhz;
+
+			table->WatermarkRow[WM_SOCCLK][i].WmSetting =
+				clock_ranges->writer_wm_sets[i].wm_inst;
+		}
+
+		smu->watermarks_bitmap |= WATERMARKS_EXIST;
+	}
+
+	/* pass data to smu controller */
+	if ((smu->watermarks_bitmap & WATERMARKS_EXIST) &&
+	     !(smu->watermarks_bitmap & WATERMARKS_LOADED)) {
+		ret = smu_cmn_write_watermarks_table(smu);
+		if (ret) {
+			dev_err(smu->adev->dev, "Failed to update WMTABLE!");
+			return ret;
+		}
+		smu->watermarks_bitmap |= WATERMARKS_LOADED;
+	}
+
+	return 0;
+}
+
+static bool smu_v13_0_4_clk_dpm_is_enabled(struct smu_context *smu,
+					   enum smu_clk_type clk_type)
+{
+	enum smu_feature_mask feature_id = 0;
+
+	switch (clk_type) {
+	case SMU_MCLK:
+	case SMU_UCLK:
+	case SMU_FCLK:
+		feature_id = SMU_FEATURE_DPM_FCLK_BIT;
+		break;
+	case SMU_GFXCLK:
+	case SMU_SCLK:
+		feature_id = SMU_FEATURE_DPM_GFXCLK_BIT;
+		break;
+	case SMU_SOCCLK:
+		feature_id = SMU_FEATURE_DPM_SOCCLK_BIT;
+		break;
+	case SMU_VCLK:
+	case SMU_DCLK:
+		feature_id = SMU_FEATURE_VCN_DPM_BIT;
+		break;
+	default:
+		return true;
+	}
+
+	return smu_cmn_feature_is_enabled(smu, feature_id);
+}
+
+static int smu_v13_0_4_get_dpm_ultimate_freq(struct smu_context *smu,
+					     enum smu_clk_type clk_type,
+					     uint32_t *min,
+					     uint32_t *max)
+{
+	DpmClocks_t *clk_table = smu->smu_table.clocks_table;
+	uint32_t clock_limit;
+	uint32_t max_dpm_level, min_dpm_level;
+	int ret = 0;
+
+	if (!smu_v13_0_4_clk_dpm_is_enabled(smu, clk_type)) {
+		switch (clk_type) {
+		case SMU_MCLK:
+		case SMU_UCLK:
+			clock_limit = smu->smu_table.boot_values.uclk;
+			break;
+		case SMU_FCLK:
+			clock_limit = smu->smu_table.boot_values.fclk;
+			break;
+		case SMU_GFXCLK:
+		case SMU_SCLK:
+			clock_limit = smu->smu_table.boot_values.gfxclk;
+			break;
+		case SMU_SOCCLK:
+			clock_limit = smu->smu_table.boot_values.socclk;
+			break;
+		case SMU_VCLK:
+			clock_limit = smu->smu_table.boot_values.vclk;
+			break;
+		case SMU_DCLK:
+			clock_limit = smu->smu_table.boot_values.dclk;
+			break;
+		default:
+			clock_limit = 0;
+			break;
+		}
+
+		/* clock in Mhz unit */
+		if (min)
+			*min = clock_limit / 100;
+		if (max)
+			*max = clock_limit / 100;
+
+		return 0;
+	}
+
+	if (max) {
+		switch (clk_type) {
+		case SMU_GFXCLK:
+		case SMU_SCLK:
+			*max = clk_table->MaxGfxClk;
+			break;
+		case SMU_MCLK:
+		case SMU_UCLK:
+		case SMU_FCLK:
+			max_dpm_level = 0;
+			break;
+		case SMU_SOCCLK:
+			max_dpm_level = clk_table->NumSocClkLevelsEnabled - 1;
+			break;
+		case SMU_VCLK:
+		case SMU_DCLK:
+			max_dpm_level = clk_table->VcnClkLevelsEnabled - 1;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (clk_type != SMU_GFXCLK && clk_type != SMU_SCLK) {
+			ret = smu_v13_0_4_get_dpm_freq_by_index(smu, clk_type,
+								max_dpm_level,
+								max);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (min) {
+		switch (clk_type) {
+		case SMU_GFXCLK:
+		case SMU_SCLK:
+			*min = clk_table->MinGfxClk;
+			break;
+		case SMU_MCLK:
+		case SMU_UCLK:
+		case SMU_FCLK:
+			min_dpm_level = clk_table->NumDfPstatesEnabled - 1;
+			break;
+		case SMU_SOCCLK:
+			min_dpm_level = 0;
+			break;
+		case SMU_VCLK:
+		case SMU_DCLK:
+			min_dpm_level = 0;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (clk_type != SMU_GFXCLK && clk_type != SMU_SCLK) {
+			ret = smu_v13_0_4_get_dpm_freq_by_index(smu, clk_type,
+								min_dpm_level,
+								min);
+		}
+	}
+
+	return ret;
+}
+
+static int smu_v13_0_4_set_soft_freq_limited_range(struct smu_context *smu,
+						   enum smu_clk_type clk_type,
+						   uint32_t min,
+						   uint32_t max)
+{
+	enum smu_message_type msg_set_min, msg_set_max;
+	int ret = 0;
+
+	if (!smu_v13_0_4_clk_dpm_is_enabled(smu, clk_type))
+		return -EINVAL;
+
+	switch (clk_type) {
+	case SMU_GFXCLK:
+	case SMU_SCLK:
+		msg_set_min = SMU_MSG_SetHardMinGfxClk;
+		msg_set_max = SMU_MSG_SetSoftMaxGfxClk;
+		break;
+	case SMU_FCLK:
+		msg_set_min = SMU_MSG_SetHardMinFclkByFreq;
+		msg_set_max = SMU_MSG_SetSoftMaxFclkByFreq;
+		break;
+	case SMU_SOCCLK:
+		msg_set_min = SMU_MSG_SetHardMinSocclkByFreq;
+		msg_set_max = SMU_MSG_SetSoftMaxSocclkByFreq;
+		break;
+	case SMU_VCLK:
+	case SMU_DCLK:
+		msg_set_min = SMU_MSG_SetHardMinVcn;
+		msg_set_max = SMU_MSG_SetSoftMaxVcn;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = smu_cmn_send_smc_msg_with_param(smu, msg_set_min, min, NULL);
+	if (ret)
+		return ret;
+
+	return smu_cmn_send_smc_msg_with_param(smu, msg_set_max,
+					       max, NULL);
+}
+
+static int smu_v13_0_4_force_clk_levels(struct smu_context *smu,
+					enum smu_clk_type clk_type,
+					uint32_t mask)
+{
+	uint32_t soft_min_level = 0, soft_max_level = 0;
+	uint32_t min_freq = 0, max_freq = 0;
+	int ret = 0;
+
+	soft_min_level = mask ? (ffs(mask) - 1) : 0;
+	soft_max_level = mask ? (fls(mask) - 1) : 0;
+
+	switch (clk_type) {
+	case SMU_SOCCLK:
+	case SMU_FCLK:
+	case SMU_VCLK:
+	case SMU_DCLK:
+		ret = smu_v13_0_4_get_dpm_freq_by_index(smu, clk_type, soft_min_level, &min_freq);
+		if (ret)
+			break;
+
+		ret = smu_v13_0_4_get_dpm_freq_by_index(smu, clk_type, soft_max_level, &max_freq);
+		if (ret)
+			break;
+
+		ret = smu_v13_0_4_set_soft_freq_limited_range(smu, clk_type, min_freq, max_freq);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int smu_v13_0_4_set_performance_level(struct smu_context *smu,
+					     enum amd_dpm_forced_level level)
+{
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t sclk_min = 0, sclk_max = 0;
+	uint32_t fclk_min = 0, fclk_max = 0;
+	uint32_t socclk_min = 0, socclk_max = 0;
+	int ret = 0;
+
+	switch (level) {
+	case AMD_DPM_FORCED_LEVEL_HIGH:
+		smu_v13_0_4_get_dpm_ultimate_freq(smu, SMU_SCLK, NULL, &sclk_max);
+		smu_v13_0_4_get_dpm_ultimate_freq(smu, SMU_FCLK, NULL, &fclk_max);
+		smu_v13_0_4_get_dpm_ultimate_freq(smu, SMU_SOCCLK, NULL, &socclk_max);
+		sclk_min = sclk_max;
+		fclk_min = fclk_max;
+		socclk_min = socclk_max;
+		break;
+	case AMD_DPM_FORCED_LEVEL_LOW:
+		smu_v13_0_4_get_dpm_ultimate_freq(smu, SMU_SCLK, &sclk_min, NULL);
+		smu_v13_0_4_get_dpm_ultimate_freq(smu, SMU_FCLK, &fclk_min, NULL);
+		smu_v13_0_4_get_dpm_ultimate_freq(smu, SMU_SOCCLK, &socclk_min, NULL);
+		sclk_max = sclk_min;
+		fclk_max = fclk_min;
+		socclk_max = socclk_min;
+		break;
+	case AMD_DPM_FORCED_LEVEL_AUTO:
+		smu_v13_0_4_get_dpm_ultimate_freq(smu, SMU_SCLK, &sclk_min, &sclk_max);
+		smu_v13_0_4_get_dpm_ultimate_freq(smu, SMU_FCLK, &fclk_min, &fclk_max);
+		smu_v13_0_4_get_dpm_ultimate_freq(smu, SMU_SOCCLK, &socclk_min, &socclk_max);
+		break;
+	case AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:
+	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:
+	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:
+	case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
+		/* Temporarily do nothing since the optimal clocks haven't been provided yet */
+		break;
+	case AMD_DPM_FORCED_LEVEL_MANUAL:
+	case AMD_DPM_FORCED_LEVEL_PROFILE_EXIT:
+		return 0;
+	default:
+		dev_err(adev->dev, "Invalid performance level %d\n", level);
+		return -EINVAL;
+	}
+
+	if (sclk_min && sclk_max) {
+		ret = smu_v13_0_4_set_soft_freq_limited_range(smu,
+							      SMU_SCLK,
+							      sclk_min,
+							      sclk_max);
+		if (ret)
+			return ret;
+
+		smu->gfx_actual_hard_min_freq = sclk_min;
+		smu->gfx_actual_soft_max_freq = sclk_max;
+	}
+
+	if (fclk_min && fclk_max) {
+		ret = smu_v13_0_4_set_soft_freq_limited_range(smu,
+							      SMU_FCLK,
+							      fclk_min,
+							      fclk_max);
+		if (ret)
+			return ret;
+	}
+
+	if (socclk_min && socclk_max) {
+		ret = smu_v13_0_4_set_soft_freq_limited_range(smu,
+							      SMU_SOCCLK,
+							      socclk_min,
+							      socclk_max);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int smu_v13_0_4_mode2_reset(struct smu_context *smu)
+{
+	return smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_GfxDeviceDriverReset,
+					       SMU_RESET_MODE_2, NULL);
+}
+
+static int smu_v13_0_4_set_fine_grain_gfx_freq_parameters(struct smu_context *smu)
+{
+	DpmClocks_t *clk_table = smu->smu_table.clocks_table;
+
+	smu->gfx_default_hard_min_freq = clk_table->MinGfxClk;
+	smu->gfx_default_soft_max_freq = clk_table->MaxGfxClk;
+	smu->gfx_actual_hard_min_freq = 0;
+	smu->gfx_actual_soft_max_freq = 0;
+
+	return 0;
+}
+
+static const struct pptable_funcs smu_v13_0_4_ppt_funcs = {
+	.check_fw_status = smu_v13_0_check_fw_status,
+	.check_fw_version = smu_v13_0_check_fw_version,
+	.init_smc_tables = smu_v13_0_4_init_smc_tables,
+	.fini_smc_tables = smu_v13_0_4_fini_smc_tables,
+	.get_vbios_bootup_values = smu_v13_0_get_vbios_bootup_values,
+	.system_features_control = smu_v13_0_4_system_features_control,
+	.send_smc_msg_with_param = smu_cmn_send_smc_msg_with_param,
+	.send_smc_msg = smu_cmn_send_smc_msg,
+	.dpm_set_vcn_enable = smu_v13_0_set_vcn_enable,
+	.dpm_set_jpeg_enable = smu_v13_0_set_jpeg_enable,
+	.set_default_dpm_table = smu_v13_0_set_default_dpm_tables,
+	.read_sensor = smu_v13_0_4_read_sensor,
+	.is_dpm_running = smu_v13_0_4_is_dpm_running,
+	.set_watermarks_table = smu_v13_0_4_set_watermarks_table,
+	.get_gpu_metrics = smu_v13_0_4_get_gpu_metrics,
+	.get_enabled_mask = smu_cmn_get_enabled_mask,
+	.get_pp_feature_mask = smu_cmn_get_pp_feature_mask,
+	.set_driver_table_location = smu_v13_0_set_driver_table_location,
+	.gfx_off_control = smu_v13_0_gfx_off_control,
+	.post_init = smu_v13_0_4_post_smu_init,
+	.mode2_reset = smu_v13_0_4_mode2_reset,
+	.get_dpm_ultimate_freq = smu_v13_0_4_get_dpm_ultimate_freq,
+	.od_edit_dpm_table = smu_v13_0_od_edit_dpm_table,
+	.print_clk_levels = smu_v13_0_4_print_clk_levels,
+	.force_clk_levels = smu_v13_0_4_force_clk_levels,
+	.set_performance_level = smu_v13_0_4_set_performance_level,
+	.set_fine_grain_gfx_freq_parameters = smu_v13_0_4_set_fine_grain_gfx_freq_parameters,
+};
+
+void smu_v13_0_4_set_ppt_funcs(struct smu_context *smu)
+{
+	smu->ppt_funcs = &smu_v13_0_4_ppt_funcs;
+	smu->message_map = smu_v13_0_4_message_map;
+	smu->feature_map = smu_v13_0_4_feature_mask_map;
+	smu->table_map = smu_v13_0_4_table_map;
+	smu->is_apu = true;
+}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.h b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.h
new file mode 100644
index 000000000000..f0bd5d3ac4b6
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+#ifndef __SMU_V13_0_4_PPT_H__
+#define __SMU_V13_0_4_PPT_H__
+
+extern void smu_v13_0_4_set_ppt_funcs(struct smu_context *smu);
+
+#endif
-- 
2.35.3


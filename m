Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A493785CA8
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Aug 2023 17:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8415D10E453;
	Wed, 23 Aug 2023 15:52:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AC010E444
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Aug 2023 15:51:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BB+vBdPZP5R0OKLna91XBIrBTImuo0tGlBOLVfaLQX/hWzeGNM637ZMkQpp+pzgVDZ8dp8AMaSAGxtBlkf/58ax1CWxfI6Z60HTsZsGAmzsPnGEoEmUq0WRy7dRZPKPPC3j/gJmXI1NNGZQSSp98KxNSaXl2bUFWUmDNFy2cL3r79h/ZQqfWqwJInmA4CMHJ0NwrvpfsJ2bt1ZkpZzSD1FEkSsNmBFJnHvjuvmXA8ZbkUkNelhm0isRc6TY/nJHjrSYQPSCgfhuTycqt9yBFfMxxaa8jiFll2iLsHpO0C1Lh0ACnZF4VR7Pl1KEiyYYzbIWr6AtheeGsl3IOy5HSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whEb9g+QlXhWL8phAIuU4XhNo6HrwtzmRWpaMbZYEkI=;
 b=aKlvP/RMHMnLqU/EZ6cJTUs8XMlMwYUx/ZAulpuFZ5dqyoALGcmtHUrF0KyVK4RIU5rUPxNMwoMHY1u7gH4EuCE5FC4rFnB1BYyX9arsrPK8Qt0M1UIHOLSQUBIqcBJhEt7g3t6xBmewmyDspvRoRS5flIpX3gG3XjPnpAbswaYkrJL2JroebbXw7t0+q7mPb3+dumCDsJNu9wVVTImRiem6Y9LLjlUjK71xJJnWL5Y9MKZosyj78cy89JKESfd4rdWit5bsFlSFYMSYkKm6qUyJbkMA0sWFwRbfoeNYi4Xi1oxdge56v8kETV0yDVUQCvgBHKtrfIRXgunIvqkg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whEb9g+QlXhWL8phAIuU4XhNo6HrwtzmRWpaMbZYEkI=;
 b=nEHM78Ic/qj8Mtt/c8hcZ1yGGYi7xox/4tIRQNht0jxTmFp9bXL7Ttzn0coWe6WouhgJyWopKD3Ljz3TCjVKyhmg2kVM5f0tO3psXXjfHAQmKU3FhJhddBteKnH2Pr3/YIvsVSUg2hm5i0oQpjdoRgS1m5mtoQi3ovsNfKKflVU=
Received: from CY5PR18CA0037.namprd18.prod.outlook.com (2603:10b6:930:13::20)
 by SA1PR12MB8722.namprd12.prod.outlook.com (2603:10b6:806:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 15:51:26 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:13:cafe::3) by CY5PR18CA0037.outlook.office365.com
 (2603:10b6:930:13::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Wed, 23 Aug 2023 15:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Wed, 23 Aug 2023 15:51:26 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 10:51:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 30/35] drm/amd/display: Add DCN35 Resource
Date: Wed, 23 Aug 2023 11:50:43 -0400
Message-ID: <20230823155048.2526343-30-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823155048.2526343-1-alexander.deucher@amd.com>
References: <20230823155048.2526343-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SA1PR12MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd05b5b-4837-4d59-5881-08dba3f0cf3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mk3nYYkUesVodgvj2yO/yda9Z/tpILE9ic2BcBjXg7htw5/xua09Wolt7YIqFudXjXZ5A0aHrnWatJrvmWjlPP+WAfdS1WF7mlHi32HMbxaDUHn7CiiqFCRvXz0EIxYFFP3ieT17nWDIxOq1Ack8WbdvxsOIWrL5nfjdMJj60A5It49wCFPlTWoTa67O4v7USNwdYTrD/fFDWPWw3XLf+QIzexcr6GAy4YfAtRfd1XU21cB6PIpS/nL9Ti7+ylh0+KFvtHybw0/G0YBn9lP5ghA9wayOsNoiwJcdd02Z7ocmOzjQV2c5gyvsMmZOdBxiP2uKho1gGlLlT4cNg0KBxyg1RDg3YNN0hmaNbz/vHa/zifa0T2jDXDgtCu6IgxseQD9TqepHlpuOYOp6UYMJGEPpAOp7+T3Qd6zW70naDJUF2vchDl49kFQHeU7xzYhl7UqcSOi3uFHyq8Sn1eJzzGwTO8vQsBjztQzOZ4i1SDToETB4V98pHAOQ7rn9gQyXePsU8m4vWLXSL4nFcmJek7CJXZ8iYg0dS4sVfGBR7ef1KrQ9p2g0XxJ8wJxtRTFuu87CDPhltevYKQmN9NI3c5B9EPygqIvIl/YmbnILTT+/X0Fj7ud5oK/58EmV7sv2H/8gUzpA0bdbFQxSVwY887wZNlRfGDC8aSDdifGpHicJZFy2aYaFFo1yjWJgrHosD8wNUT6x+fy9TLjoeuXiE9rtsHwISqNri0ojHVzPHFBetHQlcQTF94ZWBzV/N/3zeht+kiB2V0hzcofFhh/lJZfgik2uv0g2USFWZ5T9ASE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(82310400011)(186009)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(478600001)(6666004)(426003)(1076003)(26005)(16526019)(7696005)(336012)(36860700001)(2616005)(70206006)(30864003)(2906002)(70586007)(8936002)(5660300002)(41300700001)(6916009)(4326008)(8676002)(86362001)(316002)(36756003)(54906003)(47076005)(83380400001)(356005)(81166007)(82740400003)(66899024)(40480700001)(40460700003)(36900700001)(579004)(559001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 15:51:26.6477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd05b5b-4837-4d59-5881-08dba3f0cf3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8722
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Harry Wentland <Harry.Wentland@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Qingqing Zhuo <Qingqing.Zhuo@amd.com>

[Why & How]
Add resource handling for DCN35.

v2: drop unused guard

Signed-off-by: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
Acked-by: Harry Wentland <Harry.Wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile |   20 +
 .../drm/amd/display/dc/dcn35/dcn35_resource.c | 2085 +++++++++++++++++
 .../drm/amd/display/dc/dcn35/dcn35_resource.h |  307 +++
 3 files changed, 2412 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/Makefile b/drivers/gpu/drm/amd/display/dc/dcn35/Makefile
new file mode 100644
index 000000000000..c01d4ab4cdb6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/Makefile
@@ -0,0 +1,20 @@
+#
+# (c) Copyright 2022 Advanced Micro Devices, Inc. All the rights reserved
+#
+#  All rights reserved.  This notice is intended as a precaution against
+#  inadvertent publication and does not imply publication or any waiver
+#  of confidentiality.  The year included in the foregoing notice is the
+#  year of creation of the work.
+#
+#  Authors: AMD
+#
+# Makefile for DCN35.
+
+DCN35 = dcn35_resource.o dcn35_hwseq.o dcn35_init.o dcn35_dio_stream_encoder.o \
+	dcn35_dio_link_encoder.o dcn35_dccg.o dcn35_optc.o \
+	dcn35_dsc.o dcn35_hubp.o dcn35_hubbub.o \
+	dcn35_mmhubbub.o dcn35_opp.o dcn35_dpp.o dcn35_pg_cntl.o dcn35_dwb.o
+
+AMD_DAL_DCN35 = $(addprefix $(AMDDALPATH)/dc/dcn35/,$(DCN35))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DCN35)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
new file mode 100644
index 000000000000..70b26aa0230e
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
@@ -0,0 +1,2085 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#include "dm_services.h"
+#include "dc.h"
+
+#include "dcn31/dcn31_init.h"
+#include "dcn35/dcn35_init.h"
+
+#include "resource.h"
+#include "include/irq_service_interface.h"
+#include "dcn35_resource.h"
+#include "dml2/dml2_wrapper.h"
+
+#include "dcn20/dcn20_resource.h"
+#include "dcn30/dcn30_resource.h"
+#include "dcn31/dcn31_resource.h"
+#include "dcn32/dcn32_resource.h"
+
+#include "dcn10/dcn10_ipp.h"
+#include "dcn30/dcn30_hubbub.h"
+#include "dcn31/dcn31_hubbub.h"
+#include "dcn35/dcn35_hubbub.h"
+#include "dcn32/dcn32_mpc.h"
+#include "dcn35/dcn35_hubp.h"
+#include "irq/dcn35/irq_service_dcn35.h"
+#include "dcn35/dcn35_dpp.h"
+#include "dcn35/dcn35_optc.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dce110/dce110_hw_sequencer.h"
+#include "dcn35/dcn35_opp.h"
+#include "dcn35/dcn35_dsc.h"
+#include "dcn30/dcn30_vpg.h"
+#include "dcn30/dcn30_afmt.h"
+#include "dcn31/dcn31_dio_link_encoder.h"
+#include "dcn35/dcn35_dio_stream_encoder.h"
+#include "dcn31/dcn31_hpo_dp_stream_encoder.h"
+#include "dcn31/dcn31_hpo_dp_link_encoder.h"
+#include "dcn32/dcn32_hpo_dp_link_encoder.h"
+#include "link.h"
+#include "dcn31/dcn31_apg.h"
+#include "dcn31/dcn31_dio_link_encoder.h"
+#include "dcn32/dcn32_dio_link_encoder.h"
+#include "dcn31/dcn31_vpg.h"
+#include "dcn31/dcn31_afmt.h"
+#include "dce/dce_clock_source.h"
+#include "dce/dce_audio.h"
+#include "dce/dce_hwseq.h"
+#include "clk_mgr.h"
+#include "virtual/virtual_stream_encoder.h"
+#include "dce110/dce110_resource.h"
+#include "dml/display_mode_vba.h"
+#include "dcn35/dcn35_dccg.h"
+#include "dcn35/dcn35_pg_cntl.h"
+#include "dcn10/dcn10_resource.h"
+#include "dcn31/dcn31_panel_cntl.h"
+#include "dcn35_hwseq.h"
+#include "dcn35_dio_link_encoder.h"
+#include "dml/dcn31/dcn31_fpu.h" /*todo*/
+#include "dml/dcn35/dcn35_fpu.h"
+#include "dcn35/dcn35_dwb.h"
+#include "dcn35/dcn35_mmhubbub.h"
+
+#include "dcn/dcn_3_5_0_offset.h"
+#include "dcn/dcn_3_5_0_sh_mask.h"
+#include "nbio/nbio_7_11_0_offset.h"
+#include "mmhub/mmhub_3_3_0_offset.h"
+#include "mmhub/mmhub_3_3_0_sh_mask.h"
+
+#define DSCC0_DSCC_CONFIG0__ICH_RESET_AT_END_OF_LINE__SHIFT                   0x0
+#define DSCC0_DSCC_CONFIG0__ICH_RESET_AT_END_OF_LINE_MASK                     0x0000000FL
+
+#include "reg_helper.h"
+#include "dce/dmub_abm.h"
+#include "dce/dmub_psr.h"
+#include "dce/dce_aux.h"
+#include "dce/dce_i2c.h"
+#include "dml/dcn31/display_mode_vba_31.h" /*temp*/
+#include "vm_helper.h"
+#include "dcn20/dcn20_vmid.h"
+
+#include "dml2/dml2_wrapper.h"
+
+#include "link_enc_cfg.h"
+#define DC_LOGGER_INIT(logger)
+
+enum dcn35_clk_src_array_id {
+	DCN35_CLK_SRC_PLL0,
+	DCN35_CLK_SRC_PLL1,
+	DCN35_CLK_SRC_PLL2,
+	DCN35_CLK_SRC_PLL3,
+	DCN35_CLK_SRC_PLL4,
+	DCN35_CLK_SRC_TOTAL
+};
+
+/* begin *********************
+ * macros to expend register list macro defined in HW object header file
+ */
+
+/* DCN */
+/* TODO awful hack. fixup dcn20_dwb.h */
+#undef BASE_INNER
+#define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
+
+#define BASE(seg) BASE_INNER(seg)
+
+#define SR(reg_name)\
+		REG_STRUCT.reg_name = BASE(reg ## reg_name ## _BASE_IDX) +  \
+					reg ## reg_name
+
+#define SR_ARR(reg_name, id) \
+	REG_STRUCT[id].reg_name = BASE(reg##reg_name##_BASE_IDX) + reg##reg_name
+
+#define SR_ARR_INIT(reg_name, id, value) \
+	REG_STRUCT[id].reg_name = value
+
+#define SRI(reg_name, block, id)\
+	REG_STRUCT.reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRI_ARR(reg_name, block, id)\
+	REG_STRUCT[id].reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SR_ARR_I2C(reg_name, id) \
+	REG_STRUCT[id-1].reg_name = BASE(reg##reg_name##_BASE_IDX) + reg##reg_name
+
+#define SRI_ARR_I2C(reg_name, block, id)\
+	REG_STRUCT[id-1].reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SRI_ARR_ALPHABET(reg_name, block, index, id)\
+	REG_STRUCT[index].reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SRI2(reg_name, block, id)\
+	.reg_name = BASE(reg ## reg_name ## _BASE_IDX) + \
+					reg ## reg_name
+
+#define SRI2_ARR(reg_name, block, id)\
+	REG_STRUCT[id].reg_name = BASE(reg ## reg_name ## _BASE_IDX) +	\
+		reg ## reg_name
+
+#define SRIR(var_name, reg_name, block, id)\
+	.var_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRII(reg_name, block, id)\
+	REG_STRUCT.reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRII_ARR_2(reg_name, block, id, inst)\
+	REG_STRUCT[inst].reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SRII_MPC_RMU(reg_name, block, id)\
+	.RMU##_##reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRII_DWB(reg_name, temp_name, block, id)\
+	REG_STRUCT.reg_name[id] = BASE(reg ## block ## id ## _ ## temp_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## temp_name
+
+#define SF_DWB2(reg_name, block, id, field_name, post_fix) \
+	.field_name = reg_name ## __ ## field_name ## post_fix
+
+#define DCCG_SRII(reg_name, block, id)\
+	REG_STRUCT.block ## _ ## reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define VUPDATE_SRII(reg_name, block, id)\
+	REG_STRUCT.reg_name[id] = BASE(reg ## reg_name ## _ ## block ## id ## _BASE_IDX) + \
+		reg ## reg_name ## _ ## block ## id
+
+/* NBIO */
+#define NBIO_BASE_INNER(seg) ctx->nbio_reg_offsets[seg]
+
+#define NBIO_BASE(seg) \
+	NBIO_BASE_INNER(seg)
+
+#define NBIO_SR(reg_name)\
+	REG_STRUCT.reg_name = NBIO_BASE(regBIF_BX2_ ## reg_name ## _BASE_IDX) + \
+				regBIF_BX2_ ## reg_name
+
+#define NBIO_SR_ARR(reg_name, id)\
+	REG_STRUCT[id].reg_name = NBIO_BASE(regBIF_BX2_ ## reg_name ## _BASE_IDX) + \
+		regBIF_BX2_ ## reg_name
+
+/* MMHUB */
+#define MMHUB_BASE_INNER(seg) ctx->mmhub_reg_offsets[seg]
+
+#define MMHUB_BASE(seg) \
+	MMHUB_BASE_INNER(seg)
+
+#define MMHUB_SR(reg_name)\
+		REG_STRUCT.reg_name = MMHUB_BASE(reg ## reg_name ## _BASE_IDX) + \
+					reg ## reg_name
+
+#define bios_regs_init() \
+		( \
+		NBIO_SR(BIOS_SCRATCH_3),\
+		NBIO_SR(BIOS_SCRATCH_6)\
+		)
+
+static struct bios_registers bios_regs;
+
+#define clk_src_regs_init(index, pllid)\
+	CS_COMMON_REG_LIST_DCN3_0_RI(index, pllid)
+
+static struct dce110_clk_src_regs clk_src_regs[5];
+
+static const struct dce110_clk_src_shift cs_shift = {
+		CS_COMMON_MASK_SH_LIST_DCN3_1_4(__SHIFT)
+};
+
+static const struct dce110_clk_src_mask cs_mask = {
+		CS_COMMON_MASK_SH_LIST_DCN3_1_4(_MASK)
+};
+
+#define abm_regs_init(id)\
+		ABM_DCN32_REG_LIST_RI(id)
+
+static struct dce_abm_registers abm_regs[4];
+
+static const struct dce_abm_shift abm_shift = {
+		ABM_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dce_abm_mask abm_mask = {
+		ABM_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define audio_regs_init(id)\
+		AUD_COMMON_REG_LIST_RI(id)
+
+static struct dce_audio_registers audio_regs[7];
+
+
+#define DCE120_AUD_COMMON_MASK_SH_LIST(mask_sh)\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_INDEX, AZALIA_ENDPOINT_REG_INDEX, mask_sh),\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_DATA, AZALIA_ENDPOINT_REG_DATA, mask_sh),\
+		AUD_COMMON_MASK_SH_LIST_BASE(mask_sh)
+
+static const struct dce_audio_shift audio_shift = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_audio_mask audio_mask = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(_MASK)
+};
+
+#define vpg_regs_init(id)\
+	VPG_DCN31_REG_LIST_RI(id)
+
+static struct dcn31_vpg_registers vpg_regs[10];
+
+static const struct dcn31_vpg_shift vpg_shift = {
+	DCN31_VPG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_vpg_mask vpg_mask = {
+	DCN31_VPG_MASK_SH_LIST(_MASK)
+};
+
+#define afmt_regs_init(id)\
+	AFMT_DCN31_REG_LIST_RI(id)
+
+static struct dcn31_afmt_registers afmt_regs[6];
+
+static const struct dcn31_afmt_shift afmt_shift = {
+	DCN31_AFMT_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_afmt_mask afmt_mask = {
+	DCN31_AFMT_MASK_SH_LIST(_MASK)
+};
+
+#define apg_regs_init(id)\
+	APG_DCN31_REG_LIST_RI(id)
+
+static struct dcn31_apg_registers apg_regs[4];
+
+static const struct dcn31_apg_shift apg_shift = {
+	DCN31_APG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_apg_mask apg_mask = {
+	DCN31_APG_MASK_SH_LIST(_MASK)
+};
+
+#define stream_enc_regs_init(id)\
+	SE_DCN32_REG_LIST_RI(id)
+
+static struct dcn10_stream_enc_registers stream_enc_regs[5];
+
+static const struct dcn10_stream_encoder_shift se_shift = {
+		SE_COMMON_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn10_stream_encoder_mask se_mask = {
+		SE_COMMON_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define aux_regs_init(id)\
+	DCN2_AUX_REG_LIST_RI(id)
+
+static struct dcn10_link_enc_aux_registers link_enc_aux_regs[5];
+
+#define hpd_regs_init(id)\
+	HPD_REG_LIST_RI(id)
+
+static struct dcn10_link_enc_hpd_registers link_enc_hpd_regs[5];
+
+
+static const struct dce110_aux_registers_shift aux_shift = {
+	DCN_AUX_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce110_aux_registers_mask aux_mask = {
+	DCN_AUX_MASK_SH_LIST(_MASK)
+};
+
+#define link_regs_init(id, phyid)\
+	( \
+	LE_DCN35_REG_LIST_RI(id), \
+	UNIPHY_DCN2_REG_LIST_RI(id, phyid)\
+	)
+
+static struct dcn10_link_enc_registers link_enc_regs[5];
+
+static const struct dcn10_link_enc_shift le_shift = {
+	LINK_ENCODER_MASK_SH_LIST_DCN35(__SHIFT), \
+	//DPCS_DCN31_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn10_link_enc_mask le_mask = {
+	LINK_ENCODER_MASK_SH_LIST_DCN35(_MASK), \
+	//DPCS_DCN31_MASK_SH_LIST(_MASK)
+};
+
+#define hpo_dp_stream_encoder_reg_init(id)\
+	DCN3_1_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
+
+static struct dcn31_hpo_dp_stream_encoder_registers hpo_dp_stream_enc_regs[4];
+
+static const struct dcn31_hpo_dp_stream_encoder_shift hpo_dp_se_shift = {
+	DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_hpo_dp_stream_encoder_mask hpo_dp_se_mask = {
+	DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(_MASK)
+};
+
+#define hpo_dp_link_encoder_reg_init(id)\
+	DCN3_1_HPO_DP_LINK_ENC_REG_LIST_RI(id)
+	/*DCN3_1_RDPCSTX_REG_LIST(0),*/
+	/*DCN3_1_RDPCSTX_REG_LIST(1),*/
+	/*DCN3_1_RDPCSTX_REG_LIST(2),*/
+	/*DCN3_1_RDPCSTX_REG_LIST(3),*/
+
+static struct dcn31_hpo_dp_link_encoder_registers hpo_dp_link_enc_regs[2];
+
+static const struct dcn31_hpo_dp_link_encoder_shift hpo_dp_le_shift = {
+	DCN3_1_HPO_DP_LINK_ENC_COMMON_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_hpo_dp_link_encoder_mask hpo_dp_le_mask = {
+	DCN3_1_HPO_DP_LINK_ENC_COMMON_MASK_SH_LIST(_MASK)
+};
+
+#define dpp_regs_init(id)\
+	DPP_REG_LIST_DCN35_RI(id)
+
+static struct dcn3_dpp_registers dpp_regs[4];
+
+static const struct dcn35_dpp_shift tf_shift = {
+		DPP_REG_LIST_SH_MASK_DCN35(__SHIFT)
+};
+
+static const struct dcn35_dpp_mask tf_mask = {
+		DPP_REG_LIST_SH_MASK_DCN35(_MASK)
+};
+
+#define opp_regs_init(id)\
+	OPP_REG_LIST_DCN35_RI(id)
+
+static struct dcn35_opp_registers opp_regs[4];
+
+static const struct dcn35_opp_shift opp_shift = {
+	OPP_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn35_opp_mask opp_mask = {
+	OPP_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define aux_engine_regs_init(id)\
+	( \
+	AUX_COMMON_REG_LIST0_RI(id), \
+	SR_ARR_INIT(AUXN_IMPCAL, id, 0), \
+	SR_ARR_INIT(AUXP_IMPCAL, id, 0), \
+	SR_ARR_INIT(AUX_RESET_MASK, id, DP_AUX0_AUX_CONTROL__AUX_RESET_MASK) \
+	)
+
+static struct dce110_aux_registers aux_engine_regs[5];
+
+#define dwbc_regs_dcn3_init(id)\
+	DWBC_COMMON_REG_LIST_DCN30_RI(id)
+
+static struct dcn30_dwbc_registers dwbc35_regs[1];
+
+static const struct dcn35_dwbc_shift dwbc35_shift = {
+	DWBC_COMMON_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn35_dwbc_mask dwbc35_mask = {
+	DWBC_COMMON_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define mcif_wb_regs_dcn3_init(id)\
+	MCIF_WB_COMMON_REG_LIST_DCN3_5_RI(id)
+
+static struct dcn35_mmhubbub_registers mcif_wb35_regs[1];
+
+static const struct dcn35_mmhubbub_shift mcif_wb35_shift = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN3_5(__SHIFT)
+};
+
+static const struct dcn35_mmhubbub_mask mcif_wb35_mask = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN3_5(_MASK)
+};
+
+#define dsc_regsDCN35_init(id)\
+	DSC_REG_LIST_DCN20_RI(id)
+
+static struct dcn20_dsc_registers dsc_regs[4];
+
+static const struct dcn35_dsc_shift dsc_shift = {
+	DSC_REG_LIST_SH_MASK_DCN35(__SHIFT)
+};
+
+static const struct dcn35_dsc_mask dsc_mask = {
+	DSC_REG_LIST_SH_MASK_DCN35(_MASK)
+};
+
+static struct dcn30_mpc_registers mpc_regs;
+
+#define dcn_mpc_regs_init() \
+	MPC_REG_LIST_DCN3_2_RI(0),\
+	MPC_REG_LIST_DCN3_2_RI(1),\
+	MPC_REG_LIST_DCN3_2_RI(2),\
+	MPC_REG_LIST_DCN3_2_RI(3),\
+	MPC_OUT_MUX_REG_LIST_DCN3_0_RI(0),\
+	MPC_OUT_MUX_REG_LIST_DCN3_0_RI(1),\
+	MPC_OUT_MUX_REG_LIST_DCN3_0_RI(2),\
+	MPC_OUT_MUX_REG_LIST_DCN3_0_RI(3),\
+	MPC_DWB_MUX_REG_LIST_DCN3_0_RI(0)
+
+static const struct dcn30_mpc_shift mpc_shift = {
+	MPC_COMMON_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct dcn30_mpc_mask mpc_mask = {
+	MPC_COMMON_MASK_SH_LIST_DCN32(_MASK)
+};
+
+#define optc_regs_init(id)\
+	OPTC_COMMON_REG_LIST_DCN3_5_RI(id)
+
+static struct dcn_optc_registers optc_regs[4];
+
+static const struct dcn_optc_shift optc_shift = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_5(__SHIFT)
+};
+
+static const struct dcn_optc_mask optc_mask = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_5(_MASK)
+};
+
+#define hubp_regs_init(id)\
+	HUBP_REG_LIST_DCN30_RI(id)
+
+static struct dcn_hubp2_registers hubp_regs[4];
+
+
+static const struct dcn35_hubp2_shift hubp_shift = {
+		HUBP_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn35_hubp2_mask hubp_mask = {
+		HUBP_MASK_SH_LIST_DCN35(_MASK)
+};
+
+static struct dcn_hubbub_registers hubbub_reg;
+
+#define hubbub_reg_init()\
+		HUBBUB_REG_LIST_DCN35(0)
+
+static const struct dcn_hubbub_shift hubbub_shift = {
+		HUBBUB_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn_hubbub_mask hubbub_mask = {
+		HUBBUB_MASK_SH_LIST_DCN35(_MASK)
+};
+
+static struct dccg_registers dccg_regs;
+
+#define dccg_regs_init()\
+	DCCG_REG_LIST_DCN35()
+
+static const struct dccg_shift dccg_shift = {
+		DCCG_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dccg_mask dccg_mask = {
+		DCCG_MASK_SH_LIST_DCN35(_MASK)
+};
+
+static struct pg_cntl_registers pg_cntl_regs;
+
+#define pg_cntl_dcn35_regs_init() \
+	PG_CNTL_REG_LIST_DCN35()
+
+static const struct pg_cntl_shift pg_cntl_shift = {
+		PG_CNTL_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct pg_cntl_mask pg_cntl_mask = {
+		PG_CNTL_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define SRII2(reg_name_pre, reg_name_post, id)\
+	.reg_name_pre ## _ ##  reg_name_post[id] = BASE(reg ## reg_name_pre \
+			## id ## _ ## reg_name_post ## _BASE_IDX) + \
+			reg ## reg_name_pre ## id ## _ ## reg_name_post
+
+static struct dce_hwseq_registers hwseq_reg;
+
+#define hwseq_reg_init()\
+	HWSEQ_DCN35_REG_LIST()
+
+#define HWSEQ_DCN35_MASK_SH_LIST(mask_sh)\
+	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
+	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
+	HWS_SF(, DCHUBBUB_ARB_HOSTVM_CNTL, DISABLE_HOSTVM_FORCE_ALLOW_PSTATE, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
+	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh), \
+	HWS_SF(, HPO_TOP_CLOCK_CONTROL, HPO_HDMISTREAMCLK_G_GATE_DIS, mask_sh), \
+	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_UNASSIGNED_PWR_MODE, mask_sh), \
+	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_VBLANK_PWR_MODE, mask_sh), \
+	HWS_SF(, DIO_MEM_PWR_CTRL, I2C_LIGHT_SLEEP_FORCE, mask_sh), \
+	HWS_SF(, HPO_TOP_HW_CONTROL, HPO_IO_EN, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DISPCLK_R_DMU_GATE_DIS, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DISPCLK_G_RBBMIF_GATE_DIS, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, RBBMIF_FGCG_REP_DIS, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DPREFCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DISPCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DPPCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DTBCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DCFCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DPIACLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, LONO_FGCG_REP_DIS, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, LONO_DISPCLK_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, LONO_SOCCLK_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, LONO_DMCUBCLK_GATE_DISABLE, mask_sh)
+
+static const struct dce_hwseq_shift hwseq_shift = {
+		HWSEQ_DCN35_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_hwseq_mask hwseq_mask = {
+		HWSEQ_DCN35_MASK_SH_LIST(_MASK)
+};
+
+#define vmid_regs_init(id)\
+		DCN20_VMID_REG_LIST_RI(id)
+
+static struct dcn_vmid_registers vmid_regs[16];
+
+static const struct dcn20_vmid_shift vmid_shifts = {
+		DCN20_VMID_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn20_vmid_mask vmid_masks = {
+		DCN20_VMID_MASK_SH_LIST(_MASK)
+};
+
+static const struct resource_caps res_cap_dcn35 = {
+	.num_timing_generator = 4,
+	.num_opp = 4,
+	.num_video_plane = 4,
+	.num_audio = 5,
+	.num_stream_encoder = 5,
+	.num_dig_link_enc = 5,
+	.num_hpo_dp_stream_encoder = 4,
+	.num_hpo_dp_link_encoder = 2,
+	.num_pll = 4,/*1 c10 edp, 3xc20 combo PHY*/
+	.num_dwb = 1,
+	.num_ddc = 5,
+	.num_vmid = 16,
+	.num_mpc_3dlut = 2,
+	.num_dsc = 4,
+};
+
+static const struct dc_plane_cap plane_cap = {
+	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
+	.per_pixel_alpha = true,
+
+	.pixel_format_support = {
+			.argb8888 = true,
+			.nv12 = true,
+			.fp16 = true,
+			.p010 = true,
+			.ayuv = false,
+	},
+
+	.max_upscale_factor = {
+			.argb8888 = 16000,
+			.nv12 = 16000,
+			.fp16 = 16000
+	},
+
+	// 6:1 downscaling ratio: 1000/6 = 166.666
+	.max_downscale_factor = {
+			.argb8888 = 167,
+			.nv12 = 167,
+			.fp16 = 167
+	},
+	64,
+	64
+};
+
+static const struct dc_debug_options debug_defaults_drv = {
+	.disable_dmcu = true,
+	.force_abm_enable = false,
+	.timing_trace = false,
+	.clock_trace = true,
+	.disable_pplib_clock_request = false,
+	.pipe_split_policy = MPC_SPLIT_AVOID,
+	.force_single_disp_pipe_split = false,
+	.disable_dcc = DCC_ENABLE,
+	.disable_dpp_power_gate = true,
+	.disable_hubp_power_gate = true,
+	.disable_dsc_power_gate = true,
+	.vsr_support = true,
+	.performance_trace = false,
+	.max_downscale_src_width = 4096,/*upto true 4k*/
+	.disable_pplib_wm_range = false,
+	.scl_reset_length10 = true,
+	.sanity_checks = false,
+	.underflow_assert_delay_us = 0xFFFFFFFF,
+	.dwb_fi_phase = -1, // -1 = disable,
+	.dmub_command_table = true,
+	.pstate_enabled = false,
+	.use_max_lb = true,
+	.enable_mem_low_power = {
+		.bits = {
+			.vga = false,
+			.i2c = true,
+			.dmcu = false, // This is previously known to cause hang on S3 cycles if enabled
+			.dscl = true,
+			.cm = true,
+			.mpc = true,
+			.optc = true,
+			.vpg = true,
+			.afmt = true,
+		}
+	},
+	.root_clock_optimization = {
+		.bits = {
+			.dpp = true,
+			.dsc = true,/*dscclk and dsc pg*/
+			.hdmistream = false,
+			.hdmichar = false,
+			.dpstream = false,
+			.symclk32_se = false,
+			.symclk32_le = false,
+			.symclk_fe = false,
+			.physymclk = false,
+			.dpiasymclk = false,
+		}
+	},
+	.seamless_boot_odm_combine = DML_FAIL_SOURCE_PIXEL_FORMAT,
+	.enable_z9_disable_interface = true, /* Allow support for the PMFW interface for disable Z9*/
+	.using_dml2 = true,
+	.support_eDP1_5 = true,
+	.enable_hpo_pg_support = false,
+	.enable_legacy_fast_update = true,
+	.disable_stutter = true,
+	.enable_single_display_2to1_odm_policy = true,
+	.disable_idle_power_optimizations = true,
+	.dmcub_emulation = false,
+	.disable_boot_optimizations = false,
+	.disable_unbounded_requesting = false,
+	.disable_mem_low_power = true,
+	.enable_hpo_pg_support = false,
+
+	//must match enable_single_display_2to1_odm_policy to support dynamic ODM transitions
+	.enable_double_buffered_dsc_pg_support = false,
+	.enable_dp_dig_pixel_rate_div_policy = 1,
+	.disable_stutter = true,
+	.disable_idle_power_optimizations = true,
+	.disable_z10 = false,
+	.disable_mem_low_power = true,
+	.ignore_pg = true,
+	.psp_disabled_wa = true,
+};
+
+static const struct dc_panel_config panel_config_defaults = {
+	.psr = {
+		.disable_psr = false,
+		.disallow_psrsu = false,
+	},
+	.ilr = {
+		.optimize_edp_link_rate = true,
+	},
+};
+
+static void dcn35_dpp_destroy(struct dpp **dpp)
+{
+	kfree(TO_DCN20_DPP(*dpp));
+	*dpp = NULL;
+}
+
+static struct dpp *dcn35_dpp_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn3_dpp *dpp = kzalloc(sizeof(struct dcn3_dpp), GFP_KERNEL);
+	bool success = (dpp != NULL);
+
+	if (!success)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT dpp_regs
+	dpp_regs_init(0),
+	dpp_regs_init(1),
+	dpp_regs_init(2),
+	dpp_regs_init(3);
+
+	success = dpp35_construct(dpp, ctx, inst, &dpp_regs[inst], &tf_shift,
+				  &tf_mask);
+	if (success) {
+		dpp35_set_fgcg(
+			dpp,
+			ctx->dc->debug.enable_fine_grain_clock_gating.bits.dpp);
+		return &dpp->base;
+	}
+
+	BREAK_TO_DEBUGGER();
+	kfree(dpp);
+	return NULL;
+}
+
+static struct output_pixel_processor *dcn35_opp_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_opp *opp =
+		kzalloc(sizeof(struct dcn20_opp), GFP_KERNEL);
+
+	if (!opp) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT opp_regs
+	opp_regs_init(0),
+	opp_regs_init(1),
+	opp_regs_init(2),
+	opp_regs_init(3);
+
+	dcn35_opp_construct(opp, ctx, inst,
+			&opp_regs[inst], &opp_shift, &opp_mask);
+
+	dcn35_opp_set_fgcg(opp, ctx->dc->debug.enable_fine_grain_clock_gating.bits.opp);
+
+	return &opp->base;
+}
+
+static struct dce_aux *dcn31_aux_engine_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct aux_engine_dce110 *aux_engine =
+		kzalloc(sizeof(struct aux_engine_dce110), GFP_KERNEL);
+
+	if (!aux_engine)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT aux_engine_regs
+	aux_engine_regs_init(0),
+	aux_engine_regs_init(1),
+	aux_engine_regs_init(2),
+	aux_engine_regs_init(3),
+	aux_engine_regs_init(4);
+
+	dce110_aux_engine_construct(aux_engine, ctx, inst,
+				    SW_AUX_TIMEOUT_PERIOD_MULTIPLIER * AUX_TIMEOUT_PERIOD,
+				    &aux_engine_regs[inst],
+					&aux_mask,
+					&aux_shift,
+					ctx->dc->caps.extended_aux_timeout_support);
+
+	return &aux_engine->base;
+}
+
+#define i2c_inst_regs_init(id)\
+	I2C_HW_ENGINE_COMMON_REG_LIST_DCN30_RI(id)
+
+static struct dce_i2c_registers i2c_hw_regs[5];
+
+static const struct dce_i2c_shift i2c_shifts = {
+		I2C_COMMON_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dce_i2c_mask i2c_masks = {
+		I2C_COMMON_MASK_SH_LIST_DCN35(_MASK)
+};
+
+static struct dce_i2c_hw *dcn31_i2c_hw_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dce_i2c_hw *dce_i2c_hw =
+		kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
+
+	if (!dce_i2c_hw)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT i2c_hw_regs
+	i2c_inst_regs_init(1),
+	i2c_inst_regs_init(2),
+	i2c_inst_regs_init(3),
+	i2c_inst_regs_init(4),
+	i2c_inst_regs_init(5);
+
+	dcn2_i2c_hw_construct(dce_i2c_hw, ctx, inst,
+				    &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
+
+	return dce_i2c_hw;
+}
+static struct mpc *dcn35_mpc_create(
+		struct dc_context *ctx,
+		int num_mpcc,
+		int num_rmu)
+{
+	struct dcn30_mpc *mpc30 = kzalloc(sizeof(struct dcn30_mpc), GFP_KERNEL);
+
+	if (!mpc30)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT mpc_regs
+	dcn_mpc_regs_init();
+
+	dcn32_mpc_construct(mpc30, ctx,
+			&mpc_regs,
+			&mpc_shift,
+			&mpc_mask,
+			num_mpcc,
+			num_rmu);
+
+	return &mpc30->base;
+}
+
+static struct hubbub *dcn35_hubbub_create(struct dc_context *ctx)
+{
+	int i;
+
+	struct dcn20_hubbub *hubbub3 = kzalloc(sizeof(struct dcn20_hubbub),
+					  GFP_KERNEL);
+
+	if (!hubbub3)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT hubbub_reg
+	hubbub_reg_init();
+
+#undef REG_STRUCT
+#define REG_STRUCT vmid_regs
+	vmid_regs_init(0),
+	vmid_regs_init(1),
+	vmid_regs_init(2),
+	vmid_regs_init(3),
+	vmid_regs_init(4),
+	vmid_regs_init(5),
+	vmid_regs_init(6),
+	vmid_regs_init(7),
+	vmid_regs_init(8),
+	vmid_regs_init(9),
+	vmid_regs_init(10),
+	vmid_regs_init(11),
+	vmid_regs_init(12),
+	vmid_regs_init(13),
+	vmid_regs_init(14),
+	vmid_regs_init(15);
+
+	hubbub35_construct(hubbub3, ctx,
+			&hubbub_reg,
+			&hubbub_shift,
+			&hubbub_mask,
+			384,/*ctx->dc->dml.ip.det_buffer_size_kbytes,*/
+			8, /*ctx->dc->dml.ip.pixel_chunk_size_kbytes,*/
+			1792 /*ctx->dc->dml.ip.config_return_buffer_size_in_kbytes*/);
+
+
+	for (i = 0; i < res_cap_dcn35.num_vmid; i++) {
+		struct dcn20_vmid *vmid = &hubbub3->vmid[i];
+
+		vmid->ctx = ctx;
+
+		vmid->regs = &vmid_regs[i];
+		vmid->shifts = &vmid_shifts;
+		vmid->masks = &vmid_masks;
+	}
+
+	return &hubbub3->base;
+}
+
+static struct timing_generator *dcn35_timing_generator_create(
+		struct dc_context *ctx,
+		uint32_t instance)
+{
+	struct optc *tgn10 =
+		kzalloc(sizeof(struct optc), GFP_KERNEL);
+
+	if (!tgn10)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT optc_regs
+	optc_regs_init(0),
+	optc_regs_init(1),
+	optc_regs_init(2),
+	optc_regs_init(3);
+
+	tgn10->base.inst = instance;
+	tgn10->base.ctx = ctx;
+
+	tgn10->tg_regs = &optc_regs[instance];
+	tgn10->tg_shift = &optc_shift;
+	tgn10->tg_mask = &optc_mask;
+
+	dcn35_timing_generator_init(tgn10);
+
+	return &tgn10->base;
+}
+
+static const struct encoder_feature_support link_enc_feature = {
+		.max_hdmi_deep_color = COLOR_DEPTH_121212,
+		.max_hdmi_pixel_clock = 600000,
+		.hdmi_ycbcr420_supported = true,
+		.dp_ycbcr420_supported = true,
+		.fec_supported = true,
+		.flags.bits.IS_HBR2_CAPABLE = true,
+		.flags.bits.IS_HBR3_CAPABLE = true,
+		.flags.bits.IS_TPS3_CAPABLE = true,
+		.flags.bits.IS_TPS4_CAPABLE = true
+};
+
+static struct link_encoder *dcn35_link_encoder_create(
+	struct dc_context *ctx,
+	const struct encoder_init_data *enc_init_data)
+{
+	struct dcn20_link_encoder *enc20 =
+		kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+
+	if (!enc20)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT link_enc_aux_regs
+	aux_regs_init(0),
+	aux_regs_init(1),
+	aux_regs_init(2),
+	aux_regs_init(3),
+	aux_regs_init(4);
+
+#undef REG_STRUCT
+#define REG_STRUCT link_enc_hpd_regs
+	hpd_regs_init(0),
+	hpd_regs_init(1),
+	hpd_regs_init(2),
+	hpd_regs_init(3),
+	hpd_regs_init(4);
+
+#undef REG_STRUCT
+#define REG_STRUCT link_enc_regs
+	link_regs_init(0, A),
+	link_regs_init(1, B),
+	link_regs_init(2, C),
+	link_regs_init(3, D),
+	link_regs_init(4, E);
+
+	dcn35_link_encoder_construct(enc20,
+			enc_init_data,
+			&link_enc_feature,
+			&link_enc_regs[enc_init_data->transmitter],
+			&link_enc_aux_regs[enc_init_data->channel - 1],
+			&link_enc_hpd_regs[enc_init_data->hpd_source],
+			&le_shift,
+			&le_mask);
+
+	return &enc20->enc10.base;
+}
+
+/* Create a minimal link encoder object not associated with a particular
+ * physical connector.
+ * resource_funcs.link_enc_create_minimal
+ */
+static struct link_encoder *dcn31_link_enc_create_minimal(
+		struct dc_context *ctx, enum engine_id eng_id)
+{
+	struct dcn20_link_encoder *enc20;
+
+	if ((eng_id - ENGINE_ID_DIGA) > ctx->dc->res_pool->res_cap->num_dig_link_enc)
+		return NULL;
+
+	enc20 = kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+	if (!enc20)
+		return NULL;
+
+	dcn31_link_encoder_construct_minimal(
+			enc20,
+			ctx,
+			&link_enc_feature,
+			&link_enc_regs[eng_id - ENGINE_ID_DIGA],
+			eng_id);
+
+	return &enc20->enc10.base;
+}
+
+static struct panel_cntl *dcn31_panel_cntl_create(const struct panel_cntl_init_data *init_data)
+{
+	struct dcn31_panel_cntl *panel_cntl =
+		kzalloc(sizeof(struct dcn31_panel_cntl), GFP_KERNEL);
+
+	if (!panel_cntl)
+		return NULL;
+
+	dcn31_panel_cntl_construct(panel_cntl, init_data);
+
+	return &panel_cntl->base;
+}
+
+static void read_dce_straps(
+	struct dc_context *ctx,
+	struct resource_straps *straps)
+{
+	generic_reg_get(ctx, regDC_PINSTRAPS + BASE(regDC_PINSTRAPS_BASE_IDX),
+		FN(DC_PINSTRAPS, DC_PINSTRAPS_AUDIO), &straps->dc_pinstraps_audio);
+
+}
+
+static struct audio *dcn31_create_audio(
+		struct dc_context *ctx, unsigned int inst)
+{
+
+#undef REG_STRUCT
+#define REG_STRUCT audio_regs
+	audio_regs_init(0),
+	audio_regs_init(1),
+	audio_regs_init(2),
+	audio_regs_init(3),
+	audio_regs_init(4);
+	audio_regs_init(5);
+	audio_regs_init(6);
+
+	return dce_audio_create(ctx, inst,
+			&audio_regs[inst], &audio_shift, &audio_mask);
+}
+
+static struct vpg *dcn31_vpg_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn31_vpg *vpg31 = kzalloc(sizeof(struct dcn31_vpg), GFP_KERNEL);
+
+	if (!vpg31)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT vpg_regs
+	vpg_regs_init(0),
+	vpg_regs_init(1),
+	vpg_regs_init(2),
+	vpg_regs_init(3),
+	vpg_regs_init(4),
+	vpg_regs_init(5),
+	vpg_regs_init(6),
+	vpg_regs_init(7),
+	vpg_regs_init(8),
+	vpg_regs_init(9);
+
+	vpg31_construct(vpg31, ctx, inst,
+			&vpg_regs[inst],
+			&vpg_shift,
+			&vpg_mask);
+
+	return &vpg31->base;
+}
+
+static struct afmt *dcn31_afmt_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn31_afmt *afmt31 = kzalloc(sizeof(struct dcn31_afmt), GFP_KERNEL);
+
+	if (!afmt31)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT afmt_regs
+	afmt_regs_init(0),
+	afmt_regs_init(1),
+	afmt_regs_init(2),
+	afmt_regs_init(3),
+	afmt_regs_init(4),
+	afmt_regs_init(5);
+
+	afmt31_construct(afmt31, ctx, inst,
+			&afmt_regs[inst],
+			&afmt_shift,
+			&afmt_mask);
+
+	// Light sleep by default, no need to power down here
+
+	return &afmt31->base;
+}
+
+static struct apg *dcn31_apg_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn31_apg *apg31 = kzalloc(sizeof(struct dcn31_apg), GFP_KERNEL);
+
+	if (!apg31)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT apg_regs
+	apg_regs_init(0),
+	apg_regs_init(1),
+	apg_regs_init(2),
+	apg_regs_init(3);
+
+	apg31_construct(apg31, ctx, inst,
+			&apg_regs[inst],
+			&apg_shift,
+			&apg_mask);
+
+	return &apg31->base;
+}
+
+static struct stream_encoder *dcn35_stream_encoder_create(
+	enum engine_id eng_id,
+	struct dc_context *ctx)
+{
+	struct dcn10_stream_encoder *enc1;
+	struct vpg *vpg;
+	struct afmt *afmt;
+	int vpg_inst;
+	int afmt_inst;
+
+	/* Mapping of VPG, AFMT, DME register blocks to DIO block instance */
+	if (eng_id <= ENGINE_ID_DIGF) {
+		vpg_inst = eng_id;
+		afmt_inst = eng_id;
+	} else
+		return NULL;
+
+	enc1 = kzalloc(sizeof(struct dcn10_stream_encoder), GFP_KERNEL);
+	vpg = dcn31_vpg_create(ctx, vpg_inst);
+	afmt = dcn31_afmt_create(ctx, afmt_inst);
+
+	if (!enc1 || !vpg || !afmt) {
+		kfree(enc1);
+		kfree(vpg);
+		kfree(afmt);
+		return NULL;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT stream_enc_regs
+	stream_enc_regs_init(0),
+	stream_enc_regs_init(1),
+	stream_enc_regs_init(2),
+	stream_enc_regs_init(3),
+	stream_enc_regs_init(4);
+
+	dcn35_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios,
+					eng_id, vpg, afmt,
+					&stream_enc_regs[eng_id],
+					&se_shift, &se_mask);
+
+	return &enc1->base;
+}
+
+static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
+	enum engine_id eng_id,
+	struct dc_context *ctx)
+{
+	struct dcn31_hpo_dp_stream_encoder *hpo_dp_enc31;
+	struct vpg *vpg;
+	struct apg *apg;
+	uint32_t hpo_dp_inst;
+	uint32_t vpg_inst;
+	uint32_t apg_inst;
+
+	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
+
+	/* Mapping of VPG register blocks to HPO DP block instance:
+	 * VPG[6] -> HPO_DP[0]
+	 * VPG[7] -> HPO_DP[1]
+	 * VPG[8] -> HPO_DP[2]
+	 * VPG[9] -> HPO_DP[3]
+	 */
+	vpg_inst = hpo_dp_inst + 6;
+
+	/* Mapping of APG register blocks to HPO DP block instance:
+	 * APG[0] -> HPO_DP[0]
+	 * APG[1] -> HPO_DP[1]
+	 * APG[2] -> HPO_DP[2]
+	 * APG[3] -> HPO_DP[3]
+	 */
+	apg_inst = hpo_dp_inst;
+
+	/* allocate HPO stream encoder and create VPG sub-block */
+	hpo_dp_enc31 = kzalloc(sizeof(struct dcn31_hpo_dp_stream_encoder), GFP_KERNEL);
+	vpg = dcn31_vpg_create(ctx, vpg_inst);
+	apg = dcn31_apg_create(ctx, apg_inst);
+
+	if (!hpo_dp_enc31 || !vpg || !apg) {
+		kfree(hpo_dp_enc31);
+		kfree(vpg);
+		kfree(apg);
+		return NULL;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT hpo_dp_stream_enc_regs
+	hpo_dp_stream_encoder_reg_init(0),
+	hpo_dp_stream_encoder_reg_init(1),
+	hpo_dp_stream_encoder_reg_init(2),
+	hpo_dp_stream_encoder_reg_init(3);
+
+	dcn31_hpo_dp_stream_encoder_construct(hpo_dp_enc31, ctx, ctx->dc_bios,
+					hpo_dp_inst, eng_id, vpg, apg,
+					&hpo_dp_stream_enc_regs[hpo_dp_inst],
+					&hpo_dp_se_shift, &hpo_dp_se_mask);
+
+	return &hpo_dp_enc31->base;
+}
+
+static struct hpo_dp_link_encoder *dcn31_hpo_dp_link_encoder_create(
+	uint8_t inst,
+	struct dc_context *ctx)
+{
+	struct dcn31_hpo_dp_link_encoder *hpo_dp_enc31;
+
+	/* allocate HPO link encoder */
+	hpo_dp_enc31 = kzalloc(sizeof(struct dcn31_hpo_dp_link_encoder), GFP_KERNEL);
+
+#undef REG_STRUCT
+#define REG_STRUCT hpo_dp_link_enc_regs
+	hpo_dp_link_encoder_reg_init(0),
+	hpo_dp_link_encoder_reg_init(1);
+
+	hpo_dp_link_encoder31_construct(hpo_dp_enc31, ctx, inst,
+					&hpo_dp_link_enc_regs[inst],
+					&hpo_dp_le_shift, &hpo_dp_le_mask);
+
+	return &hpo_dp_enc31->base;
+}
+
+static struct dce_hwseq *dcn35_hwseq_create(
+	struct dc_context *ctx)
+{
+	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
+
+#undef REG_STRUCT
+#define REG_STRUCT hwseq_reg
+	hwseq_reg_init();
+
+	if (hws) {
+		hws->ctx = ctx;
+		hws->regs = &hwseq_reg;
+		hws->shifts = &hwseq_shift;
+		hws->masks = &hwseq_mask;
+	}
+	return hws;
+}
+static const struct resource_create_funcs res_create_funcs = {
+	.read_dce_straps = read_dce_straps,
+	.create_audio = dcn31_create_audio,
+	.create_stream_encoder = dcn35_stream_encoder_create,
+	.create_hpo_dp_stream_encoder = dcn31_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn31_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn35_hwseq_create,
+};
+
+static void dcn35_resource_destruct(struct dcn35_resource_pool *pool)
+{
+	unsigned int i;
+
+	for (i = 0; i < pool->base.stream_enc_count; i++) {
+		if (pool->base.stream_enc[i] != NULL) {
+			if (pool->base.stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->base.stream_enc[i]->vpg));
+				pool->base.stream_enc[i]->vpg = NULL;
+			}
+			if (pool->base.stream_enc[i]->afmt != NULL) {
+				kfree(DCN30_AFMT_FROM_AFMT(pool->base.stream_enc[i]->afmt));
+				pool->base.stream_enc[i]->afmt = NULL;
+			}
+			kfree(DCN10STRENC_FROM_STRENC(pool->base.stream_enc[i]));
+			pool->base.stream_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.hpo_dp_stream_enc_count; i++) {
+		if (pool->base.hpo_dp_stream_enc[i] != NULL) {
+			if (pool->base.hpo_dp_stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->base.hpo_dp_stream_enc[i]->vpg));
+				pool->base.hpo_dp_stream_enc[i]->vpg = NULL;
+			}
+			if (pool->base.hpo_dp_stream_enc[i]->apg != NULL) {
+				kfree(DCN31_APG_FROM_APG(pool->base.hpo_dp_stream_enc[i]->apg));
+				pool->base.hpo_dp_stream_enc[i]->apg = NULL;
+			}
+			kfree(DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(pool->base.hpo_dp_stream_enc[i]));
+			pool->base.hpo_dp_stream_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.hpo_dp_link_enc_count; i++) {
+		if (pool->base.hpo_dp_link_enc[i] != NULL) {
+			kfree(DCN3_1_HPO_DP_LINK_ENC_FROM_HPO_LINK_ENC(pool->base.hpo_dp_link_enc[i]));
+			pool->base.hpo_dp_link_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		if (pool->base.dscs[i] != NULL)
+			dcn20_dsc_destroy(&pool->base.dscs[i]);
+	}
+
+	if (pool->base.mpc != NULL) {
+		kfree(TO_DCN20_MPC(pool->base.mpc));
+		pool->base.mpc = NULL;
+	}
+	if (pool->base.hubbub != NULL) {
+		kfree(pool->base.hubbub);
+		pool->base.hubbub = NULL;
+	}
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		if (pool->base.dpps[i] != NULL)
+			dcn35_dpp_destroy(&pool->base.dpps[i]);
+
+		if (pool->base.ipps[i] != NULL)
+			pool->base.ipps[i]->funcs->ipp_destroy(&pool->base.ipps[i]);
+
+		if (pool->base.hubps[i] != NULL) {
+			kfree(TO_DCN20_HUBP(pool->base.hubps[i]));
+			pool->base.hubps[i] = NULL;
+		}
+
+		if (pool->base.irqs != NULL) {
+			dal_irq_service_destroy(&pool->base.irqs);
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		if (pool->base.engines[i] != NULL)
+			dce110_engine_destroy(&pool->base.engines[i]);
+		if (pool->base.hw_i2cs[i] != NULL) {
+			kfree(pool->base.hw_i2cs[i]);
+			pool->base.hw_i2cs[i] = NULL;
+		}
+		if (pool->base.sw_i2cs[i] != NULL) {
+			kfree(pool->base.sw_i2cs[i]);
+			pool->base.sw_i2cs[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_opp; i++) {
+		if (pool->base.opps[i] != NULL)
+			pool->base.opps[i]->funcs->opp_destroy(&pool->base.opps[i]);
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		if (pool->base.timing_generators[i] != NULL)	{
+			kfree(DCN10TG_FROM_TG(pool->base.timing_generators[i]));
+			pool->base.timing_generators[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dwb; i++) {
+		if (pool->base.dwbc[i] != NULL) {
+			kfree(TO_DCN30_DWBC(pool->base.dwbc[i]));
+			pool->base.dwbc[i] = NULL;
+		}
+		if (pool->base.mcif_wb[i] != NULL) {
+			kfree(TO_DCN30_MMHUBBUB(pool->base.mcif_wb[i]));
+			pool->base.mcif_wb[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.audio_count; i++) {
+		if (pool->base.audios[i])
+			dce_aud_destroy(&pool->base.audios[i]);
+	}
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] != NULL) {
+			dcn20_clock_source_destroy(&pool->base.clock_sources[i]);
+			pool->base.clock_sources[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_mpc_3dlut; i++) {
+		if (pool->base.mpc_lut[i] != NULL) {
+			dc_3dlut_func_release(pool->base.mpc_lut[i]);
+			pool->base.mpc_lut[i] = NULL;
+		}
+		if (pool->base.mpc_shaper[i] != NULL) {
+			dc_transfer_func_release(pool->base.mpc_shaper[i]);
+			pool->base.mpc_shaper[i] = NULL;
+		}
+	}
+
+	if (pool->base.dp_clock_source != NULL) {
+		dcn20_clock_source_destroy(&pool->base.dp_clock_source);
+		pool->base.dp_clock_source = NULL;
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		if (pool->base.multiple_abms[i] != NULL)
+			dce_abm_destroy(&pool->base.multiple_abms[i]);
+	}
+
+	if (pool->base.psr != NULL)
+		dmub_psr_destroy(&pool->base.psr);
+
+	if (pool->base.pg_cntl != NULL)
+		dcn_pg_cntl_destroy(&pool->base.pg_cntl);
+
+	if (pool->base.dccg != NULL)
+		dcn_dccg_destroy(&pool->base.dccg);
+}
+
+static struct hubp *dcn35_hubp_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn20_hubp *hubp2 =
+		kzalloc(sizeof(struct dcn20_hubp), GFP_KERNEL);
+
+	if (!hubp2)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT hubp_regs
+	hubp_regs_init(0),
+	hubp_regs_init(1),
+	hubp_regs_init(2),
+	hubp_regs_init(3);
+
+	if (hubp35_construct(hubp2, ctx, inst,
+			&hubp_regs[inst], &hubp_shift, &hubp_mask))
+		return &hubp2->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(hubp2);
+	return NULL;
+}
+
+static void dcn35_dwbc_init(struct dcn30_dwbc *dwbc30, struct dc_context *ctx)
+{
+	dcn35_dwbc_set_fgcg(
+		dwbc30, ctx->dc->debug.enable_fine_grain_clock_gating.bits.dwb);
+}
+
+static bool dcn35_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_dwbc *dwbc30 = kzalloc(sizeof(struct dcn30_dwbc),
+						    GFP_KERNEL);
+
+		if (!dwbc30) {
+			dm_error("DC: failed to create dwbc30!\n");
+			return false;
+		}
+
+#undef REG_STRUCT
+#define REG_STRUCT dwbc35_regs
+		dwbc_regs_dcn3_init(0);
+
+		dcn35_dwbc_construct(dwbc30, ctx,
+				&dwbc35_regs[i],
+				&dwbc35_shift,
+				&dwbc35_mask,
+				i);
+
+		pool->dwbc[i] = &dwbc30->base;
+
+		dcn35_dwbc_init(dwbc30, ctx);
+	}
+	return true;
+}
+
+static void dcn35_mmhubbub_init(struct dcn30_mmhubbub *mcif_wb30,
+				struct dc_context *ctx)
+{
+	dcn35_mmhubbub_set_fgcg(
+		mcif_wb30,
+		ctx->dc->debug.enable_fine_grain_clock_gating.bits.mmhubbub);
+}
+
+static bool dcn35_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_mmhubbub *mcif_wb30 = kzalloc(sizeof(struct dcn30_mmhubbub),
+						    GFP_KERNEL);
+
+		if (!mcif_wb30) {
+			dm_error("DC: failed to create mcif_wb30!\n");
+			return false;
+		}
+
+#undef REG_STRUCT
+#define REG_STRUCT mcif_wb35_regs
+		mcif_wb_regs_dcn3_init(0);
+
+		dcn35_mmhubbub_construct(mcif_wb30, ctx,
+				&mcif_wb35_regs[i],
+				&mcif_wb35_shift,
+				&mcif_wb35_mask,
+				i);
+
+		dcn35_mmhubbub_init(mcif_wb30, ctx);
+
+		pool->mcif_wb[i] = &mcif_wb30->base;
+	}
+	return true;
+}
+
+static struct display_stream_compressor *dcn35_dsc_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_dsc *dsc =
+		kzalloc(sizeof(struct dcn20_dsc), GFP_KERNEL);
+
+	if (!dsc) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT dsc_regs
+	dsc_regsDCN35_init(0),
+	dsc_regsDCN35_init(1),
+	dsc_regsDCN35_init(2),
+	dsc_regsDCN35_init(3);
+
+	dsc35_construct(dsc, ctx, inst, &dsc_regs[inst], &dsc_shift, &dsc_mask);
+	dsc35_set_fgcg(dsc,
+		       ctx->dc->debug.enable_fine_grain_clock_gating.bits.dsc);
+	return &dsc->base;
+}
+
+static void dcn35_destroy_resource_pool(struct resource_pool **pool)
+{
+	struct dcn35_resource_pool *dcn35_pool = TO_DCN35_RES_POOL(*pool);
+
+	dcn35_resource_destruct(dcn35_pool);
+	kfree(dcn35_pool);
+	*pool = NULL;
+}
+
+static struct clock_source *dcn35_clock_source_create(
+		struct dc_context *ctx,
+		struct dc_bios *bios,
+		enum clock_source_id id,
+		const struct dce110_clk_src_regs *regs,
+		bool dp_clk_src)
+{
+	struct dce110_clk_src *clk_src =
+		kzalloc(sizeof(struct dce110_clk_src), GFP_KERNEL);
+
+	if (!clk_src)
+		return NULL;
+
+	if (dcn31_clk_src_construct(clk_src, ctx, bios, id,
+			regs, &cs_shift, &cs_mask)) {
+		clk_src->base.dp_clk_src = dp_clk_src;
+		return &clk_src->base;
+	}
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static struct dc_cap_funcs cap_funcs = {
+	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
+};
+
+static void dcn35_get_panel_config_defaults(struct dc_panel_config *panel_config)
+{
+	*panel_config = panel_config_defaults;
+}
+
+
+static bool dcn35_validate_bandwidth(struct dc *dc,
+		struct dc_state *context,
+		bool fast_validate)
+{
+	bool out = false;
+
+	out = dml2_validate(dc, context, fast_validate);
+
+	return out;
+}
+
+static struct resource_funcs dcn35_res_pool_funcs = {
+	.destroy = dcn35_destroy_resource_pool,
+	.link_enc_create = dcn35_link_encoder_create,
+	.link_enc_create_minimal = dcn31_link_enc_create_minimal,
+	.link_encs_assign = link_enc_cfg_link_encs_assign,
+	.link_enc_unassign = link_enc_cfg_link_enc_unassign,
+	.panel_cntl_create = dcn31_panel_cntl_create,
+	.validate_bandwidth = dcn35_validate_bandwidth,
+	.calculate_wm_and_dlg = dcn31_calculate_wm_and_dlg,
+	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
+	.populate_dml_pipes = dcn35_populate_dml_pipes_from_context_fpu,
+	.acquire_free_pipe_as_secondary_dpp_pipe = dcn20_acquire_free_pipe_for_layer,
+	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
+	.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
+	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
+	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
+	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
+	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+	.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
+	.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
+	.update_bw_bounding_box = dcn35_update_bw_bounding_box_fpu,
+	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
+	.get_panel_config_defaults = dcn35_get_panel_config_defaults,
+};
+
+static bool dcn35_resource_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dcn35_resource_pool *pool)
+{
+	int i;
+	struct dc_context *ctx = dc->ctx;
+	struct irq_service_init_data init_data;
+
+#undef REG_STRUCT
+#define REG_STRUCT bios_regs
+	bios_regs_init();
+
+#undef REG_STRUCT
+#define REG_STRUCT clk_src_regs
+	clk_src_regs_init(0, A),
+	clk_src_regs_init(1, B),
+	clk_src_regs_init(2, C),
+	clk_src_regs_init(3, D),
+	clk_src_regs_init(4, E);
+
+#undef REG_STRUCT
+#define REG_STRUCT abm_regs
+	abm_regs_init(0),
+	abm_regs_init(1),
+	abm_regs_init(2),
+	abm_regs_init(3);
+
+#undef REG_STRUCT
+#define REG_STRUCT dccg_regs
+	dccg_regs_init();
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap_dcn35;
+
+	pool->base.funcs = &dcn35_res_pool_funcs;
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->base.pipe_count = pool->base.res_cap->num_timing_generator;
+	pool->base.mpcc_count = pool->base.res_cap->num_timing_generator;
+	dc->caps.max_downscale_ratio = 600;
+	dc->caps.i2c_speed_in_khz = 100;
+	dc->caps.i2c_speed_in_khz_hdcp = 100;
+	dc->caps.max_cursor_size = 256;
+	dc->caps.min_horizontal_blanking_period = 80;
+	dc->caps.dmdata_alloc_size = 2048;
+	dc->caps.max_slave_planes = 2;
+	dc->caps.max_slave_yuv_planes = 2;
+	dc->caps.max_slave_rgb_planes = 2;
+	dc->caps.post_blend_color_processing = true;
+	dc->caps.force_dp_tps4_for_cp2520 = true;
+	if (dc->config.forceHBR2CP2520)
+		dc->caps.force_dp_tps4_for_cp2520 = false;
+	dc->caps.dp_hpo = true;
+	dc->caps.dp_hdmi21_pcon_support = true;
+
+	dc->caps.edp_dsc_support = true;
+	dc->caps.extended_aux_timeout_support = true;
+	dc->caps.dmcub_support = true;
+	dc->caps.is_apu = true;
+	dc->caps.seamless_odm = true;
+
+	dc->caps.zstate_support = true;
+	dc->caps.ips_support = true;
+	dc->caps.max_v_total = (1 << 15) - 1;
+
+	/* Color pipeline capabilities */
+	dc->caps.color.dpp.dcn_arch = 1;
+	dc->caps.color.dpp.input_lut_shared = 0;
+	dc->caps.color.dpp.icsc = 1;
+	dc->caps.color.dpp.dgam_ram = 0; // must use gamma_corr
+	dc->caps.color.dpp.dgam_rom_caps.srgb = 1;
+	dc->caps.color.dpp.dgam_rom_caps.bt2020 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.gamma2_2 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.pq = 1;
+	dc->caps.color.dpp.dgam_rom_caps.hlg = 1;
+	dc->caps.color.dpp.post_csc = 1;
+	dc->caps.color.dpp.gamma_corr = 1;
+	dc->caps.color.dpp.dgam_rom_for_yuv = 0;
+
+	dc->caps.color.dpp.hw_3d_lut = 1;
+	dc->caps.color.dpp.ogam_ram = 0;  // no OGAM in DPP since DCN1
+	// no OGAM ROM on DCN301
+	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
+	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.pq = 0;
+	dc->caps.color.dpp.ogam_rom_caps.hlg = 0;
+	dc->caps.color.dpp.ocsc = 0;
+
+	dc->caps.color.mpc.gamut_remap = 1;
+	dc->caps.color.mpc.num_3dluts = pool->base.res_cap->num_mpc_3dlut; //2
+	dc->caps.color.mpc.ogam_ram = 1;
+	dc->caps.color.mpc.ogam_rom_caps.srgb = 0;
+	dc->caps.color.mpc.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.pq = 0;
+	dc->caps.color.mpc.ogam_rom_caps.hlg = 0;
+	dc->caps.color.mpc.ocsc = 1;
+
+	/* Use pipe context based otg sync logic */
+	dc->config.use_pipe_ctx_sync_logic = true;
+
+	/* read VBIOS LTTPR caps */
+	{
+		if (ctx->dc_bios->funcs->get_lttpr_caps) {
+			enum bp_result bp_query_result;
+			uint8_t is_vbios_lttpr_enable = 0;
+
+			bp_query_result = ctx->dc_bios->funcs->get_lttpr_caps(ctx->dc_bios, &is_vbios_lttpr_enable);
+			dc->caps.vbios_lttpr_enable = (bp_query_result == BP_RESULT_OK) && !!is_vbios_lttpr_enable;
+		}
+
+		/* interop bit is implicit */
+		{
+			dc->caps.vbios_lttpr_aware = true;
+		}
+	}
+
+	if (dc->ctx->dce_environment == DCE_ENV_PRODUCTION_DRV)
+		dc->debug = debug_defaults_drv;
+
+	// Init the vm_helper
+	if (dc->vm_helper)
+		vm_helper_init(dc->vm_helper, 16);
+
+	/*************************************************
+	 *  Create resources                             *
+	 *************************************************/
+
+	/* Clock Sources for Pixel Clock*/
+	pool->base.clock_sources[DCN35_CLK_SRC_PLL0] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL0,
+				&clk_src_regs[0], false);
+	pool->base.clock_sources[DCN35_CLK_SRC_PLL1] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL1,
+				&clk_src_regs[1], false);
+	pool->base.clock_sources[DCN35_CLK_SRC_PLL2] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL2,
+				&clk_src_regs[2], false);
+	pool->base.clock_sources[DCN35_CLK_SRC_PLL3] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL3,
+				&clk_src_regs[3], false);
+	pool->base.clock_sources[DCN35_CLK_SRC_PLL4] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL4,
+				&clk_src_regs[4], false);
+
+	pool->base.clk_src_count = DCN35_CLK_SRC_TOTAL;
+
+	/* todo: not reuse phy_pll registers */
+	pool->base.dp_clock_source =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_ID_DP_DTO,
+				&clk_src_regs[0], true);
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] == NULL) {
+			dm_error("DC: failed to create clock sources!\n");
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+	/*temp till dml2 fully work without dml1*/
+		dml_init_instance(&dc->dml, &dcn3_5_soc, &dcn3_5_ip, DML_PROJECT_DCN31);
+
+	/* TODO: DCCG */
+	pool->base.dccg = dccg35_create(ctx, &dccg_regs, &dccg_shift, &dccg_mask);
+	if (pool->base.dccg == NULL) {
+		dm_error("DC: failed to create dccg!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT pg_cntl_regs
+	pg_cntl_dcn35_regs_init();
+
+	pool->base.pg_cntl = pg_cntl35_create(ctx, &pg_cntl_regs, &pg_cntl_shift, &pg_cntl_mask);
+	if (pool->base.pg_cntl == NULL) {
+		dm_error("DC: failed to create power gate control!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* TODO: IRQ */
+	init_data.ctx = dc->ctx;
+	pool->base.irqs = dal_irq_service_dcn35_create(&init_data);
+	if (!pool->base.irqs)
+		goto create_fail;
+
+	/* HUBBUB */
+	pool->base.hubbub = dcn35_hubbub_create(ctx);
+	if (pool->base.hubbub == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create hubbub!\n");
+		goto create_fail;
+	}
+
+	/* HUBPs, DPPs, OPPs and TGs */
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		pool->base.hubps[i] = dcn35_hubp_create(ctx, i);
+		if (pool->base.hubps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create hubps!\n");
+			goto create_fail;
+		}
+
+		pool->base.dpps[i] = dcn35_dpp_create(ctx, i);
+		if (pool->base.dpps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create dpps!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_opp; i++) {
+		pool->base.opps[i] = dcn35_opp_create(ctx, i);
+		if (pool->base.opps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create output pixel processor!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		pool->base.timing_generators[i] = dcn35_timing_generator_create(
+				ctx, i);
+		if (pool->base.timing_generators[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto create_fail;
+		}
+	}
+	pool->base.timing_generator_count = i;
+
+	/* PSR */
+	pool->base.psr = dmub_psr_create(ctx);
+	if (pool->base.psr == NULL) {
+		dm_error("DC: failed to create psr obj!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* ABM */
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		pool->base.multiple_abms[i] = dmub_abm_create(ctx,
+				&abm_regs[i],
+				&abm_shift,
+				&abm_mask);
+		if (pool->base.multiple_abms[i] == NULL) {
+			dm_error("DC: failed to create abm for pipe %d!\n", i);
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* MPC and DSC */
+	pool->base.mpc = dcn35_mpc_create(ctx, pool->base.mpcc_count, pool->base.res_cap->num_mpc_3dlut);
+	if (pool->base.mpc == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mpc!\n");
+		goto create_fail;
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		pool->base.dscs[i] = dcn35_dsc_create(ctx, i);
+		if (pool->base.dscs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create display stream compressor %d!\n", i);
+			goto create_fail;
+		}
+	}
+
+	/* DWB and MMHUBBUB */
+	if (!dcn35_dwbc_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create dwbc!\n");
+		goto create_fail;
+	}
+
+	if (!dcn35_mmhubbub_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mcif_wb!\n");
+		goto create_fail;
+	}
+
+	/* AUX and I2C */
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		pool->base.engines[i] = dcn31_aux_engine_create(ctx, i);
+		if (pool->base.engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create aux engine!!\n");
+			goto create_fail;
+		}
+		pool->base.hw_i2cs[i] = dcn31_i2c_hw_create(ctx, i);
+		if (pool->base.hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create hw i2c!!\n");
+			goto create_fail;
+		}
+		pool->base.sw_i2cs[i] = NULL;
+	}
+
+	/* DCN3.5 has 6 DPIA */
+	pool->base.usb4_dpia_count = 4;
+	if (dc->debug.dpia_debug.bits.disable_dpia)
+		pool->base.usb4_dpia_count = 0;
+
+	/* Audio, Stream Encoders including HPO and virtual, MPC 3D LUTs */
+	if (!resource_construct(num_virtual_links, dc, &pool->base,
+			&res_create_funcs))
+		goto create_fail;
+
+	/* HW Sequencer and Plane caps */
+	dcn35_hw_sequencer_construct(dc);
+
+	dc->caps.max_planes =  pool->base.pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->cap_funcs = cap_funcs;
+
+
+	dc->dcn_ip->max_num_dpp = pool->base.pipe_count;
+	dc->dml2_options.dcn_pipe_count = pool->base.pipe_count;
+	dc->dml2_options.use_native_pstate_optimization = false;
+	dc->dml2_options.use_native_soc_bb_construction = true;
+
+	dc->dml2_options.callbacks.dc = dc;
+	dc->dml2_options.callbacks.build_scaling_params = &resource_build_scaling_params;
+	dc->dml2_options.callbacks.can_support_mclk_switch_using_fw_based_vblank_stretch = &dcn30_can_support_mclk_switch_using_fw_based_vblank_stretch;
+	dc->dml2_options.callbacks.acquire_secondary_pipe_for_mpc_odm = &dc_resource_acquire_secondary_pipe_for_mpc_odm;
+	dc->dml2_options.max_segments_per_hubp = 18;
+	dc->dml2_options.det_segment_size = DCN3_2_DET_SEG_SIZE;/*todo*/
+
+	if (dc->config.sdpif_request_limit_words_per_umc == 0)
+		dc->config.sdpif_request_limit_words_per_umc = 16;/*todo*/
+
+	return true;
+
+create_fail:
+
+	dcn35_resource_destruct(pool);
+
+	return false;
+}
+
+struct resource_pool *dcn35_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc)
+{
+	struct dcn35_resource_pool *pool =
+		kzalloc(sizeof(struct dcn35_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dcn35_resource_construct(init_data->num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(pool);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.h b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.h
new file mode 100644
index 000000000000..00e2216b6205
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.h
@@ -0,0 +1,307 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef _DCN35_RESOURCE_H_
+#define _DCN35_RESOURCE_H_
+
+#include "core_types.h"
+
+#define DCN3_5_VMIN_DISPCLK_HZ 717000000
+#define TO_DCN35_RES_POOL(pool)\
+	container_of(pool, struct dcn35_resource_pool, base)
+
+extern struct _vcs_dpi_ip_params_st dcn3_5_ip;
+extern struct _vcs_dpi_soc_bounding_box_st dcn3_5_soc;
+
+struct dcn35_resource_pool {
+	struct resource_pool base;
+};
+
+struct resource_pool *dcn35_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc);
+
+/* Defs for runtime init of registers */
+
+#define OPP_REG_LIST_DCN20_RI(id) \
+	OPP_REG_LIST_DCN10_RI(id), \
+	OPP_DPG_REG_LIST_RI(id), \
+	SRI_ARR(FMT_422_CONTROL, FMT, id), \
+	SRI_ARR(OPPBUF_CONTROL1, OPPBUF, id)
+
+#define OPP_REG_LIST_DCN35_RI(id) \
+	OPP_REG_LIST_DCN20_RI(id), \
+	SRI2_ARR(OPP_TOP_CLK_CONTROL, OPP, id)
+
+#define VPG_DCN31_REG_LIST_RI(id) \
+	SRI_ARR(VPG_GENERIC_STATUS, VPG, id), \
+	SRI_ARR(VPG_GENERIC_PACKET_ACCESS_CTRL, VPG, id), \
+	SRI_ARR(VPG_GENERIC_PACKET_DATA, VPG, id), \
+	SRI_ARR(VPG_GSP_FRAME_UPDATE_CTRL, VPG, id), \
+	SRI_ARR(VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG, id), \
+	SRI_ARR(VPG_MEM_PWR, VPG, id)
+
+#define AFMT_DCN31_REG_LIST_RI(id) \
+	SRI_ARR(AFMT_INFOFRAME_CONTROL0, AFMT, id), \
+	SRI_ARR(AFMT_VBI_PACKET_CONTROL, AFMT, id), \
+	SRI_ARR(AFMT_AUDIO_PACKET_CONTROL, AFMT, id), \
+	SRI_ARR(AFMT_AUDIO_PACKET_CONTROL2, AFMT, id), \
+	SRI_ARR(AFMT_AUDIO_SRC_CONTROL, AFMT, id), \
+	SRI_ARR(AFMT_60958_0, AFMT, id), \
+	SRI_ARR(AFMT_60958_1, AFMT, id), \
+	SRI_ARR(AFMT_60958_2, AFMT, id), \
+	SRI_ARR(AFMT_MEM_PWR, AFMT, id)
+
+/* Stream encoder */
+#define SE_DCN35_REG_LIST_RI(id) \
+	SRI_ARR(AFMT_CNTL, DIG, id), \
+	SRI_ARR(DIG_FE_CNTL, DIG, id), \
+	SRI_ARR(HDMI_CONTROL, DIG, id), \
+	SRI_ARR(HDMI_DB_CONTROL, DIG, id), \
+	SRI_ARR(HDMI_GC, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL0, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL1, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL2, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL3, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL4, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL5, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL6, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL7, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL8, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL9, DIG, id), \
+	SRI_ARR(HDMI_GENERIC_PACKET_CONTROL10, DIG, id), \
+	SRI_ARR(HDMI_INFOFRAME_CONTROL0, DIG, id), \
+	SRI_ARR(HDMI_INFOFRAME_CONTROL1, DIG, id), \
+	SRI_ARR(HDMI_VBI_PACKET_CONTROL, DIG, id), \
+	SRI_ARR(HDMI_AUDIO_PACKET_CONTROL, DIG, id),\
+	SRI_ARR(HDMI_ACR_PACKET_CONTROL, DIG, id),\
+	SRI_ARR(HDMI_ACR_32_0, DIG, id),\
+	SRI_ARR(HDMI_ACR_32_1, DIG, id),\
+	SRI_ARR(HDMI_ACR_44_0, DIG, id),\
+	SRI_ARR(HDMI_ACR_44_1, DIG, id),\
+	SRI_ARR(HDMI_ACR_48_0, DIG, id),\
+	SRI_ARR(HDMI_ACR_48_1, DIG, id),\
+	SRI_ARR(DP_DB_CNTL, DP, id), \
+	SRI_ARR(DP_MSA_MISC, DP, id), \
+	SRI_ARR(DP_MSA_VBID_MISC, DP, id), \
+	SRI_ARR(DP_MSA_COLORIMETRY, DP, id), \
+	SRI_ARR(DP_MSA_TIMING_PARAM1, DP, id), \
+	SRI_ARR(DP_MSA_TIMING_PARAM2, DP, id), \
+	SRI_ARR(DP_MSA_TIMING_PARAM3, DP, id), \
+	SRI_ARR(DP_MSA_TIMING_PARAM4, DP, id), \
+	SRI_ARR(DP_MSE_RATE_CNTL, DP, id), \
+	SRI_ARR(DP_MSE_RATE_UPDATE, DP, id), \
+	SRI_ARR(DP_PIXEL_FORMAT, DP, id), \
+	SRI_ARR(DP_SEC_CNTL, DP, id), \
+	SRI_ARR(DP_SEC_CNTL1, DP, id), \
+	SRI_ARR(DP_SEC_CNTL2, DP, id), \
+	SRI_ARR(DP_SEC_CNTL5, DP, id), \
+	SRI_ARR(DP_SEC_CNTL6, DP, id), \
+	SRI_ARR(DP_STEER_FIFO, DP, id), \
+	SRI_ARR(DP_VID_M, DP, id), \
+	SRI_ARR(DP_VID_N, DP, id), \
+	SRI_ARR(DP_VID_STREAM_CNTL, DP, id), \
+	SRI_ARR(DP_VID_TIMING, DP, id), \
+	SRI_ARR(DP_SEC_AUD_N, DP, id), \
+	SRI_ARR(DP_SEC_TIMESTAMP, DP, id), \
+	SRI_ARR(DP_DSC_CNTL, DP, id), \
+	SRI_ARR(DP_SEC_METADATA_TRANSMISSION, DP, id), \
+	SRI_ARR(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
+	SRI_ARR(DP_SEC_FRAMING4, DP, id), \
+	SRI_ARR(DP_GSP11_CNTL, DP, id), \
+	SRI_ARR(DME_CONTROL, DME, id),\
+	SRI_ARR(DP_SEC_METADATA_TRANSMISSION, DP, id), \
+	SRI_ARR(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
+	SRI_ARR(DIG_FE_CNTL, DIG, id), \
+	SRI_ARR(DIG_FE_EN_CNTL, DIG, id), \
+	SRI_ARR(DIG_FE_CLK_CNTL, DIG, id), \
+	SRI_ARR(DIG_CLOCK_PATTERN, DIG, id), \
+	SRI_ARR(DIG_FIFO_CTRL0, DIG, id)
+
+#define LE_DCN35_REG_LIST_RI(id)\
+	LE_DCN3_REG_LIST_RI(id),\
+	SRI_ARR(DP_DPHY_INTERNAL_CTRL, DP, id), \
+	SR_ARR(DIO_LINKA_CNTL, id), \
+	SR_ARR(DIO_LINKB_CNTL, id), \
+	SR_ARR(DIO_LINKC_CNTL, id), \
+	SR_ARR(DIO_LINKD_CNTL, id), \
+	SR_ARR(DIO_LINKE_CNTL, id), \
+	SR_ARR(DIO_LINKF_CNTL, id),\
+	SRI_ARR(DIG_BE_CLK_CNTL, DIG, id),\
+	SR_ARR(DIO_CLK_CNTL, id)
+
+#define MCIF_WB_COMMON_REG_LIST_DCN3_5_RI(inst)  \
+	MCIF_WB_COMMON_REG_LIST_DCN32_RI(inst), \
+		SRI2_ARR(MMHUBBUB_CLOCK_CNTL, MMHUBBUB, inst)
+
+#define HWSEQ_DCN35_REG_LIST()\
+	SR(DCHUBBUB_GLOBAL_TIMER_CNTL), \
+	SR(DCHUBBUB_ARB_HOSTVM_CNTL), \
+	SR(DIO_MEM_PWR_CTRL), \
+	SR(ODM_MEM_PWR_CTRL3), \
+	SR(MMHUBBUB_MEM_PWR_CNTL), \
+	SR(DCCG_GATE_DISABLE_CNTL), \
+	SR(DCCG_GATE_DISABLE_CNTL2), \
+	SR(DCCG_GATE_DISABLE_CNTL5), \
+	SR(DCFCLK_CNTL),\
+	SR(DC_MEM_GLOBAL_PWR_REQ_CNTL), \
+	SRII(PIXEL_RATE_CNTL, OTG, 0), \
+	SRII(PIXEL_RATE_CNTL, OTG, 1),\
+	SRII(PIXEL_RATE_CNTL, OTG, 2),\
+	SRII(PIXEL_RATE_CNTL, OTG, 3),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 0),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 1),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 2),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 3),\
+	SR(MICROSECOND_TIME_BASE_DIV), \
+	SR(MILLISECOND_TIME_BASE_DIV), \
+	SR(DISPCLK_FREQ_CHANGE_CNTL), \
+	SR(RBBMIF_TIMEOUT_DIS), \
+	SR(RBBMIF_TIMEOUT_DIS_2), \
+	SR(DCHUBBUB_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_VAL_B_A), \
+	SR(DPP_TOP0_DPP_CRC_VAL_R_G), \
+	SR(MPC_CRC_CTRL), \
+	SR(MPC_CRC_RESULT_GB), \
+	SR(MPC_CRC_RESULT_C), \
+	SR(MPC_CRC_RESULT_AR), \
+	SR(DOMAIN0_PG_CONFIG), \
+	SR(DOMAIN1_PG_CONFIG), \
+	SR(DOMAIN2_PG_CONFIG), \
+	SR(DOMAIN3_PG_CONFIG), \
+	SR(DOMAIN16_PG_CONFIG), \
+	SR(DOMAIN17_PG_CONFIG), \
+	SR(DOMAIN18_PG_CONFIG), \
+	SR(DOMAIN19_PG_CONFIG), \
+	SR(DOMAIN0_PG_STATUS), \
+	SR(DOMAIN1_PG_STATUS), \
+	SR(DOMAIN2_PG_STATUS), \
+	SR(DOMAIN3_PG_STATUS), \
+	SR(DOMAIN16_PG_STATUS), \
+	SR(DOMAIN17_PG_STATUS), \
+	SR(DOMAIN18_PG_STATUS), \
+	SR(DOMAIN19_PG_STATUS), \
+	SR(DC_IP_REQUEST_CNTL), \
+	SR(AZALIA_AUDIO_DTO), \
+	SR(AZALIA_CONTROLLER_CLOCK_GATING), \
+	SR(HPO_TOP_HW_CONTROL),\
+	SR(DMU_CLK_CNTL)
+
+/* OPTC */
+#define OPTC_COMMON_REG_LIST_DCN3_5_RI(inst)                                   \
+	SRI_ARR(OTG_VSTARTUP_PARAM, OTG, inst),\
+	SRI_ARR(OTG_VUPDATE_PARAM, OTG, inst),\
+	SRI_ARR(OTG_VREADY_PARAM, OTG, inst),\
+	SRI_ARR(OTG_MASTER_UPDATE_LOCK, OTG, inst),\
+	SRI_ARR(OTG_GLOBAL_CONTROL0, OTG, inst),\
+	SRI_ARR(OTG_GLOBAL_CONTROL1, OTG, inst),\
+	SRI_ARR(OTG_GLOBAL_CONTROL2, OTG, inst),\
+	SRI_ARR(OTG_GLOBAL_CONTROL4, OTG, inst),\
+	SRI_ARR(OTG_DOUBLE_BUFFER_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_H_TOTAL, OTG, inst),\
+	SRI_ARR(OTG_H_BLANK_START_END, OTG, inst),\
+	SRI_ARR(OTG_H_SYNC_A, OTG, inst),\
+	SRI_ARR(OTG_H_SYNC_A_CNTL, OTG, inst),\
+	SRI_ARR(OTG_H_TIMING_CNTL, OTG, inst),\
+	SRI_ARR(OTG_V_TOTAL, OTG, inst),\
+	SRI_ARR(OTG_V_BLANK_START_END, OTG, inst),\
+	SRI_ARR(OTG_V_SYNC_A, OTG, inst),\
+	SRI_ARR(OTG_V_SYNC_A_CNTL, OTG, inst),\
+	SRI_ARR(OTG_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_STEREO_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_3D_STRUCTURE_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_STEREO_STATUS, OTG, inst),\
+	SRI_ARR(OTG_V_TOTAL_MAX, OTG, inst),\
+	SRI_ARR(OTG_V_TOTAL_MIN, OTG, inst),\
+	SRI_ARR(OTG_V_TOTAL_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_TRIGA_CNTL, OTG, inst),\
+	SRI_ARR(OTG_FORCE_COUNT_NOW_CNTL, OTG, inst),\
+	SRI_ARR(OTG_STATIC_SCREEN_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_STATUS_FRAME_COUNT, OTG, inst),\
+	SRI_ARR(OTG_STATUS, OTG, inst),\
+	SRI_ARR(OTG_STATUS_POSITION, OTG, inst),\
+	SRI_ARR(OTG_NOM_VERT_POSITION, OTG, inst),\
+	SRI_ARR(OTG_M_CONST_DTO0, OTG, inst),\
+	SRI_ARR(OTG_M_CONST_DTO1, OTG, inst),\
+	SRI_ARR(OTG_CLOCK_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_VERTICAL_INTERRUPT0_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_VERTICAL_INTERRUPT0_POSITION, OTG, inst),\
+	SRI_ARR(OTG_VERTICAL_INTERRUPT1_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_VERTICAL_INTERRUPT1_POSITION, OTG, inst),\
+	SRI_ARR(OTG_VERTICAL_INTERRUPT2_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_VERTICAL_INTERRUPT2_POSITION, OTG, inst),\
+	SRI_ARR(OPTC_INPUT_CLOCK_CONTROL, ODM, inst),\
+	SRI_ARR(OPTC_DATA_SOURCE_SELECT, ODM, inst),\
+	SRI_ARR(OPTC_INPUT_GLOBAL_CONTROL, ODM, inst),\
+	SRI_ARR(CONTROL, VTG, inst),\
+	SRI_ARR(OTG_VERT_SYNC_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_GSL_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_CRC_CNTL, OTG, inst),\
+	SRI_ARR(OTG_CRC0_DATA_RG, OTG, inst),\
+	SRI_ARR(OTG_CRC0_DATA_B, OTG, inst),\
+	SRI_ARR(OTG_CRC1_DATA_RG, OTG, inst),\
+	SRI_ARR(OTG_CRC1_DATA_B, OTG, inst),\
+	SRI_ARR(OTG_CRC2_DATA_RG, OTG, inst),\
+	SRI_ARR(OTG_CRC2_DATA_B, OTG, inst),\
+	SRI_ARR(OTG_CRC3_DATA_RG, OTG, inst),\
+	SRI_ARR(OTG_CRC3_DATA_B, OTG, inst),\
+	SRI_ARR(OTG_CRC0_WINDOWA_X_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_CRC0_WINDOWA_Y_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_CRC0_WINDOWB_X_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_CRC0_WINDOWB_Y_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_CRC1_WINDOWA_X_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_CRC1_WINDOWA_Y_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_CRC1_WINDOWB_X_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_CRC1_WINDOWB_Y_CONTROL, OTG, inst),\
+	SRI_ARR(OTG_CRC0_WINDOWA_X_CONTROL_READBACK, OTG, inst),\
+	SRI_ARR(OTG_CRC0_WINDOWA_Y_CONTROL_READBACK, OTG, inst),\
+	SRI_ARR(OTG_CRC0_WINDOWB_X_CONTROL_READBACK, OTG, inst),\
+	SRI_ARR(OTG_CRC0_WINDOWB_Y_CONTROL_READBACK, OTG, inst),\
+	SRI_ARR(OTG_CRC1_WINDOWA_X_CONTROL_READBACK, OTG, inst),\
+	SRI_ARR(OTG_CRC1_WINDOWA_Y_CONTROL_READBACK, OTG, inst),\
+	SRI_ARR(OTG_CRC1_WINDOWB_X_CONTROL_READBACK, OTG, inst),\
+	SRI_ARR(OTG_CRC1_WINDOWB_Y_CONTROL_READBACK, OTG, inst),\
+	SR_ARR(GSL_SOURCE_SELECT, inst),\
+	SRI_ARR(OTG_TRIGA_MANUAL_TRIG, OTG, inst),\
+	SRI_ARR(OTG_GLOBAL_CONTROL1, OTG, inst),\
+	SRI_ARR(OTG_GLOBAL_CONTROL2, OTG, inst),\
+	SRI_ARR(OTG_GSL_WINDOW_X, OTG, inst),\
+	SRI_ARR(OTG_GSL_WINDOW_Y, OTG, inst),\
+	SRI_ARR(OTG_VUPDATE_KEEPOUT, OTG, inst),\
+	SRI_ARR(OTG_DSC_START_POSITION, OTG, inst),\
+	SRI_ARR(OTG_DRR_TRIGGER_WINDOW, OTG, inst),\
+	SRI_ARR(OTG_DRR_V_TOTAL_CHANGE, OTG, inst),\
+	SRI_ARR(OPTC_DATA_FORMAT_CONTROL, ODM, inst),\
+	SRI_ARR(OPTC_BYTES_PER_PIXEL, ODM, inst),\
+	SRI_ARR(OPTC_WIDTH_CONTROL, ODM, inst),\
+	SRI_ARR(OPTC_MEMORY_CONFIG, ODM, inst),\
+	SRI_ARR(OTG_DRR_CONTROL, OTG, inst),\
+	SRI2_ARR(OPTC_CLOCK_CONTROL, OPTC, inst)
+
+/* DPP */
+#define DPP_REG_LIST_DCN35_RI(id)\
+	DPP_REG_LIST_DCN30_COMMON_RI(id)
+
+#endif /* _DCN35_RESOURCE_H_ */
-- 
2.41.0


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB28785CA7
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Aug 2023 17:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D95510E44F;
	Wed, 23 Aug 2023 15:51:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D9B10E43B
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Aug 2023 15:51:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wr3QN5E+nMxNiomkJ6pHplCA7pMUzA/GVh4pzo4Rk9qJCX8zjdAQ4o4bd3HebNOFf8eZfPXGnu1iC8dY1pab/FrB7KzKKyp0pNDtg2oqEF6TUMTCKO2Ynx5GvTKmxFuretuSyo+EDil6SJxAATi+HueBcZ45DyrXS+Oxqun3RmciSnYCoGwuYxvBljSSOg/xBjwiY3sBj1L15B7MUOSDZaInROyTmhxykxFpjVi33N2gUMW/OM5bz85vIwWig03cQ3/TEI0/k97vDlTbCLJ6/7PVt/OcRCYz6eX5Y+ZAzC2iO6J3zCA7INn1Y5ZCz681cj26F8iYu1CuUvZpFoD2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8R/wcUsaWNNlVa7sran2XRVR/a7AYOk8xUej0C3PtSY=;
 b=NGk3dQ658TpXnKbrBeLHpuOt6tW+G9GwNYO6sE2zwO2+DoXhhAMI69WN+1FrGohVmwlxEH8t9vi+tycsxp5ZScnMYW9ST0sPhOupEQjCKlNcLu3fyAuJz2XoxJXUwxYPeVXVa42Vqvlgbp29N1k3KW7e1Keh5x7Zgj/kC7nn0PuhdcOFK3xt/gbKb566A7AJKc0pbxJcmg4dgqVG4SaLaGB8N7RjyMP0Bkx9rk1ytn8ZjHaqorOR/A2+yhy15EdzbmrOcakeGy5ww976GPzqL8LLzS80aIK/uTgm2El09Gq/H31BYjn2CjzS7dyJSrtz8+w83fuDGXjOEo8IdnK0Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8R/wcUsaWNNlVa7sran2XRVR/a7AYOk8xUej0C3PtSY=;
 b=b/pPLX3eExnNsX6n0V/iwnpauYBvEFR3s+I/ItKWTcVNGxG3qiWA09Fb3iqP8EnozQlE8G5XyyLOE1NdIn01SLE1gUQbH9ztNmRxGThFB/SObbZyd7mDuqnALDjmEV2vpmwmgUj2r/Pj0sRMN/+pd15s3vbo+Ewi/tk64SC4U2w=
Received: from CY5PR18CA0053.namprd18.prod.outlook.com (2603:10b6:930:13::29)
 by PH7PR12MB8428.namprd12.prod.outlook.com (2603:10b6:510:243::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 23 Aug
 2023 15:51:25 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:13:cafe::18) by CY5PR18CA0053.outlook.office365.com
 (2603:10b6:930:13::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25 via Frontend
 Transport; Wed, 23 Aug 2023 15:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Wed, 23 Aug 2023 15:51:24 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 10:51:19 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 26/35] drm/amd/display: Add DCN35 CLK_MGR
Date: Wed, 23 Aug 2023 11:50:39 -0400
Message-ID: <20230823155048.2526343-26-alexander.deucher@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|PH7PR12MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c684f1-e576-4b03-a073-08dba3f0ce23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjV+ADace40zluQmr8H2M7uvd8M0fo1oSgSXs3GHE6NVSH194ChWGGhLtSEfIR7NHt2GVadYppmdkZwNSkLGV5wnd6mxD+FeI/FadS0F8oBXPPDigvQolifW7LLcBzAxelp/5cJ/RDdGriGVoHp5jHueAv00j7tmRAhEY4CIOsTEvd3wIrSEx3eYhNY4f8Zyi8YJaWGHWb9ttJfk6+7aLAEFQR7y2SKsghZxGSzHQ14o1oyil72Lu3Ai37x1I/b2Ybc2F35kh4wf8QbAE6v+3dqszsWByqSb+Rv6uHj5VAYyz0zJPbFJ1Qm3u/69mTAHWRPPZd4FHqjP+8prVVy93kpFEPJ1lx04aGBz8KXSIfhCYWv13mm/2vKmZVjqbzX0RuD/Dpry9/EGYDgOBDAmxoLPiD/YtyEnMaph3jqs4kYRfWPm2q902hnyg/E0gRKy2VT9Tijk3fZx0ubU7pqYIupty/NHRGzZC5BbTiSqBuQj90vOzWdz74wWlc6NdsUwLWCwRGMzBb9OsVI+GnRhW11X+HzdU3q11lGgLPMfm1ON8f9t15IgiSxijI4JBj6SsaFtS0B++hSkeOMnxmo3St7A9nvZKhamTDDHPfCQXezBtmyHgCbts/akz2GwKjXAqiMu+eQTHvYtJVztsGK+H9YI8VS6XwNEpUv4+uvuzGxVJ5WKkgvEl6ZLdWsDJQvpz75EknZBO+cf1N5m9bqcPjzPPiJr4Tday930WOuSrX2c8uXJV2hLahzDkM3fHPn+zeMWHjoy4/tx28sT71iPnQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199024)(82310400011)(1800799009)(186009)(36840700001)(46966006)(40470700004)(40460700003)(356005)(66899024)(426003)(336012)(2616005)(1076003)(26005)(6666004)(47076005)(7696005)(30864003)(83380400001)(36860700001)(8676002)(5660300002)(4326008)(8936002)(2906002)(16526019)(70586007)(478600001)(6916009)(70206006)(41300700001)(316002)(19627235002)(82740400003)(54906003)(36756003)(86362001)(40480700001)(81166007)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 15:51:24.7883 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c684f1-e576-4b03-a073-08dba3f0ce23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8428
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
Add CLK_MGR handling for DCN35.

v2: Drop stale SMU interfaces (Alex)

Signed-off-by: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
Acked-by: Harry Wentland <Harry.Wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 +
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |    8 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |    5 +
 .../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  | 1001 +++++++++++++++++
 .../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h  |   63 ++
 .../amd/display/dc/clk_mgr/dcn35/dcn35_smu.c  |  453 ++++++++
 .../amd/display/dc/clk_mgr/dcn35/dcn35_smu.h  |  180 +++
 drivers/gpu/drm/amd/display/dc/core/dc.c      |    2 +
 drivers/gpu/drm/amd/display/dc/dc.h           |    2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |    1 +
 .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   |    1 +
 11 files changed, 1717 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e9aff5014e39..968d8fb74373 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1680,6 +1680,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 	init_data.dcn_reg_offsets = adev->reg_offset[DCE_HWIP][0];
 	init_data.nbio_reg_offsets = adev->reg_offset[NBIO_HWIP][0];
+	init_data.clk_reg_offsets = adev->reg_offset[CLK_HWIP][0];
 
 	INIT_LIST_HEAD(&adev->dm.da_list);
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index ad390e4cd0a9..1c443e549afa 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -172,4 +172,12 @@ AMD_DAL_CLK_MGR_DCN32 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn32/,$(CLK_MGR_DC
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN32)
 
+###############################################################################
+# DCN35
+###############################################################################
+CLK_MGR_DCN35 = dcn35_smu.o dcn35_clk_mgr.o
+
+AMD_DAL_CLK_MGR_DCN35 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn35/,$(CLK_MGR_DCN35))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN35)
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index dcedf9645161..c0a2d21200ed 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -48,6 +48,7 @@
 #include "dcn315/dcn315_clk_mgr.h"
 #include "dcn316/dcn316_clk_mgr.h"
 #include "dcn32/dcn32_clk_mgr.h"
+#include "dcn35/dcn35_clk_mgr.h"
 
 int clk_mgr_helper_get_active_display_cnt(
 		struct dc *dc,
@@ -405,6 +406,10 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 		dcn314_clk_mgr_destroy(clk_mgr);
 		break;
 
+	case AMDGPU_FAMILY_GC_11_5_0:
+		dcn35_clk_mgr_destroy(clk_mgr);
+		break;
+
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
new file mode 100644
index 000000000000..3b2463c03694
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -0,0 +1,1001 @@
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
+ * Authors: AMD
+ *
+ */
+
+
+#include "dcn35_clk_mgr.h"
+
+#include "dccg.h"
+#include "clk_mgr_internal.h"
+
+// For dce12_get_dp_ref_freq_khz
+#include "dce100/dce_clk_mgr.h"
+
+// For dcn20_update_clocks_update_dpp_dto
+#include "dcn20/dcn20_clk_mgr.h"
+
+
+
+
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dcn35_smu.h"
+#include "dm_helpers.h"
+
+/* TODO: remove this include once we ported over remaining clk mgr functions*/
+#include "dcn30/dcn30_clk_mgr.h"
+#include "dcn31/dcn31_clk_mgr.h"
+#include "dcn35_clk_mgr.h"
+
+#include "dc_dmub_srv.h"
+#include "link.h"
+#include "logger_types.h"
+#undef DC_LOGGER
+#define DC_LOGGER \
+	clk_mgr->base.base.ctx->logger
+
+#define regCLK1_CLK_PLL_REQ			0x0237
+#define regCLK1_CLK_PLL_REQ_BASE_IDX		0
+
+#define CLK1_CLK_PLL_REQ__FbMult_int__SHIFT	0x0
+#define CLK1_CLK_PLL_REQ__PllSpineDiv__SHIFT	0xc
+#define CLK1_CLK_PLL_REQ__FbMult_frac__SHIFT	0x10
+#define CLK1_CLK_PLL_REQ__FbMult_int_MASK	0x000001FFL
+#define CLK1_CLK_PLL_REQ__PllSpineDiv_MASK	0x0000F000L
+#define CLK1_CLK_PLL_REQ__FbMult_frac_MASK	0xFFFF0000L
+
+#define regCLK1_CLK2_BYPASS_CNTL			0x029c
+#define regCLK1_CLK2_BYPASS_CNTL_BASE_IDX	0
+
+#define CLK1_CLK2_BYPASS_CNTL__CLK2_BYPASS_SEL__SHIFT	0x0
+#define CLK1_CLK2_BYPASS_CNTL__CLK2_BYPASS_DIV__SHIFT	0x10
+#define CLK1_CLK2_BYPASS_CNTL__CLK2_BYPASS_SEL_MASK		0x00000007L
+#define CLK1_CLK2_BYPASS_CNTL__CLK2_BYPASS_DIV_MASK		0x000F0000L
+
+#define REG(reg_name) \
+	(ctx->clk_reg_offsets[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
+
+#define TO_CLK_MGR_DCN35(clk_mgr)\
+	container_of(clk_mgr, struct clk_mgr_dcn35, base)
+
+static int dcn35_get_active_display_cnt_wa(
+		struct dc *dc,
+		struct dc_state *context)
+{
+	int i, display_count;
+	bool tmds_present = false;
+
+	display_count = 0;
+	for (i = 0; i < context->stream_count; i++) {
+		const struct dc_stream_state *stream = context->streams[i];
+
+		if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A ||
+				stream->signal == SIGNAL_TYPE_DVI_SINGLE_LINK ||
+				stream->signal == SIGNAL_TYPE_DVI_DUAL_LINK)
+			tmds_present = true;
+	}
+
+	for (i = 0; i < dc->link_count; i++) {
+		const struct dc_link *link = dc->links[i];
+
+		/* abusing the fact that the dig and phy are coupled to see if the phy is enabled */
+		if (link->link_enc && link->link_enc->funcs->is_dig_enabled &&
+				link->link_enc->funcs->is_dig_enabled(link->link_enc))
+			display_count++;
+	}
+
+	/* WA for hang on HDMI after display off back on*/
+	if (display_count == 0 && tmds_present)
+		display_count = 1;
+
+	return display_count;
+}
+
+static void dcn35_disable_otg_wa(struct clk_mgr *clk_mgr_base, struct dc_state *context, bool disable)
+{
+	struct dc *dc = clk_mgr_base->ctx->dc;
+	int i;
+
+	for (i = 0; i < dc->res_pool->pipe_count; ++i) {
+		struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		if (pipe->top_pipe || pipe->prev_odm_pipe)
+			continue;
+		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal))) {
+			struct stream_encoder *stream_enc = pipe->stream_res.stream_enc;
+
+			if (disable) {
+				if (stream_enc && stream_enc->funcs->disable_fifo)
+					pipe->stream_res.stream_enc->funcs->disable_fifo(stream_enc);
+
+				pipe->stream_res.tg->funcs->immediate_disable_crtc(pipe->stream_res.tg);
+				reset_sync_context_for_pipe(dc, context, i);
+			} else {
+				pipe->stream_res.tg->funcs->enable_crtc(pipe->stream_res.tg);
+
+				if (stream_enc && stream_enc->funcs->enable_fifo)
+					pipe->stream_res.stream_enc->funcs->enable_fifo(stream_enc);
+			}
+		}
+	}
+}
+
+static void dcn35_update_clocks_update_dtb_dto(struct clk_mgr_internal *clk_mgr,
+			struct dc_state *context,
+			int ref_dtbclk_khz)
+{
+	struct dccg *dccg = clk_mgr->dccg;
+	uint32_t tg_mask = 0;
+	int i;
+
+	for (i = 0; i < clk_mgr->base.ctx->dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
+		struct dtbclk_dto_params dto_params = {0};
+
+		/* use mask to program DTO once per tg */
+		if (pipe_ctx->stream_res.tg &&
+				!(tg_mask & (1 << pipe_ctx->stream_res.tg->inst))) {
+			tg_mask |= (1 << pipe_ctx->stream_res.tg->inst);
+
+			dto_params.otg_inst = pipe_ctx->stream_res.tg->inst;
+			dto_params.ref_dtbclk_khz = ref_dtbclk_khz;
+
+			dccg->funcs->set_dtbclk_dto(clk_mgr->dccg, &dto_params);
+			//dccg->funcs->set_audio_dtbclk_dto(clk_mgr->dccg, &dto_params);
+		}
+	}
+}
+
+static void dcn35_update_clocks_update_dpp_dto(struct clk_mgr_internal *clk_mgr,
+		struct dc_state *context, bool safe_to_lower)
+{
+	int i;
+	bool dppclk_active[MAX_PIPES] = {0};
+
+
+	clk_mgr->dccg->ref_dppclk = clk_mgr->base.clks.dppclk_khz;
+	for (i = 0; i < clk_mgr->base.ctx->dc->res_pool->pipe_count; i++) {
+		int dpp_inst = 0, dppclk_khz, prev_dppclk_khz;
+
+		dppclk_khz = context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz;
+
+		if (context->res_ctx.pipe_ctx[i].plane_res.dpp)
+			dpp_inst = context->res_ctx.pipe_ctx[i].plane_res.dpp->inst;
+		else if (!context->res_ctx.pipe_ctx[i].plane_res.dpp && dppclk_khz == 0) {
+			/* dpp == NULL && dppclk_khz == 0 is valid because of pipe harvesting.
+			 * In this case just continue in loop
+			 */
+			continue;
+		} else if (!context->res_ctx.pipe_ctx[i].plane_res.dpp && dppclk_khz > 0) {
+			/* The software state is not valid if dpp resource is NULL and
+			 * dppclk_khz > 0.
+			 */
+			ASSERT(false);
+			continue;
+		}
+
+		prev_dppclk_khz = clk_mgr->dccg->pipe_dppclk_khz[i];
+
+		if (safe_to_lower || prev_dppclk_khz < dppclk_khz)
+			clk_mgr->dccg->funcs->update_dpp_dto(
+							clk_mgr->dccg, dpp_inst, dppclk_khz);
+		dppclk_active[dpp_inst] = true;
+	}
+	if (safe_to_lower)
+		for (i = 0; i < clk_mgr->base.ctx->dc->res_pool->pipe_count; i++) {
+			struct dpp *old_dpp = clk_mgr->base.ctx->dc->current_state->res_ctx.pipe_ctx[i].plane_res.dpp;
+
+			if (old_dpp && !dppclk_active[old_dpp->inst])
+				clk_mgr->dccg->funcs->update_dpp_dto(clk_mgr->dccg, old_dpp->inst, 0);
+		}
+}
+
+void dcn35_update_clocks(struct clk_mgr *clk_mgr_base,
+			struct dc_state *context,
+			bool safe_to_lower)
+{
+	union dmub_rb_cmd cmd;
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
+	struct dc *dc = clk_mgr_base->ctx->dc;
+	int display_count;
+	bool update_dppclk = false;
+	bool update_dispclk = false;
+	bool dpp_clock_lowered = false;
+
+	if (dc->work_arounds.skip_clock_update)
+		return;
+
+	/*
+	 * if it is safe to lower, but we are already in the lower state, we don't have to do anything
+	 * also if safe to lower is false, we just go in the higher state
+	 */
+	if (safe_to_lower) {
+		if (new_clocks->zstate_support != DCN_ZSTATE_SUPPORT_DISALLOW &&
+				new_clocks->zstate_support != clk_mgr_base->clks.zstate_support) {
+			dcn35_smu_set_zstate_support(clk_mgr, new_clocks->zstate_support);
+			dm_helpers_enable_periodic_detection(clk_mgr_base->ctx, true);
+			clk_mgr_base->clks.zstate_support = new_clocks->zstate_support;
+		}
+
+		if (clk_mgr_base->clks.dtbclk_en && !new_clocks->dtbclk_en) {
+			dcn35_smu_set_dtbclk(clk_mgr, false);
+			clk_mgr_base->clks.dtbclk_en = new_clocks->dtbclk_en;
+		}
+		/* check that we're not already in lower */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_LOW_POWER) {
+			display_count = dcn35_get_active_display_cnt_wa(dc, context);
+			/* if we can go lower, go lower */
+			if (display_count == 0)
+				clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_LOW_POWER;
+		}
+	} else {
+		if (new_clocks->zstate_support == DCN_ZSTATE_SUPPORT_DISALLOW &&
+				new_clocks->zstate_support != clk_mgr_base->clks.zstate_support) {
+			dcn35_smu_set_zstate_support(clk_mgr, DCN_ZSTATE_SUPPORT_DISALLOW);
+			dm_helpers_enable_periodic_detection(clk_mgr_base->ctx, false);
+			clk_mgr_base->clks.zstate_support = new_clocks->zstate_support;
+		}
+
+		if (!clk_mgr_base->clks.dtbclk_en && new_clocks->dtbclk_en) {
+			dcn35_smu_set_dtbclk(clk_mgr, true);
+			dcn35_update_clocks_update_dtb_dto(clk_mgr, context, clk_mgr_base->clks.ref_dtbclk_khz);
+			clk_mgr_base->clks.dtbclk_en = new_clocks->dtbclk_en;
+		}
+
+		/* check that we're not already in D0 */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_MISSION_MODE) {
+			union display_idle_optimization_u idle_info = { 0 };
+
+			dcn35_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
+			/* update power state */
+			clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_MISSION_MODE;
+		}
+	}
+	if (dc->debug.force_min_dcfclk_mhz > 0)
+		new_clocks->dcfclk_khz = (new_clocks->dcfclk_khz > (dc->debug.force_min_dcfclk_mhz * 1000)) ?
+				new_clocks->dcfclk_khz : (dc->debug.force_min_dcfclk_mhz * 1000);
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
+		clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
+		dcn35_smu_set_hard_min_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_khz);
+	}
+
+	if (should_set_clock(safe_to_lower,
+			new_clocks->dcfclk_deep_sleep_khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
+		clk_mgr_base->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
+		dcn35_smu_set_min_deep_sleep_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_deep_sleep_khz);
+	}
+
+	// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
+		if (new_clocks->dppclk_khz < 100000)
+			new_clocks->dppclk_khz = 100000;
+
+	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
+		if (clk_mgr->base.clks.dppclk_khz > new_clocks->dppclk_khz)
+			dpp_clock_lowered = true;
+		clk_mgr_base->clks.dppclk_khz = new_clocks->dppclk_khz;
+		update_dppclk = true;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
+		dcn35_disable_otg_wa(clk_mgr_base, context, true);
+
+		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
+		dcn35_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
+		dcn35_disable_otg_wa(clk_mgr_base, context, false);
+
+		update_dispclk = true;
+	}
+
+	if (!new_clocks->dtbclk_en) {
+		new_clocks->ref_dtbclk_khz = 600000;
+	}
+
+	/* clock limits are received with MHz precision, divide by 1000 to prevent setting clocks at every call */
+	if (!dc->debug.disable_dtb_ref_clk_switch &&
+			should_set_clock(safe_to_lower, new_clocks->ref_dtbclk_khz / 1000, clk_mgr_base->clks.ref_dtbclk_khz / 1000)) {
+		/* DCCG requires KHz precision for DTBCLK */
+		dcn35_smu_set_dtbclk(clk_mgr, true);
+
+		dcn35_update_clocks_update_dtb_dto(clk_mgr, context, clk_mgr_base->clks.ref_dtbclk_khz);
+	}
+
+	if (dpp_clock_lowered) {
+		// increase per DPP DTO before lowering global dppclk
+		dcn35_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+		dcn35_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+	} else {
+		// increase global DPPCLK before lowering per DPP DTO
+		if (update_dppclk || update_dispclk)
+			dcn35_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+		dcn35_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+	}
+
+	// notify DMCUB of latest clocks
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.notify_clocks.header.type = DMUB_CMD__CLK_MGR;
+	cmd.notify_clocks.header.sub_type = DMUB_CMD__CLK_MGR_NOTIFY_CLOCKS;
+	cmd.notify_clocks.clocks.dcfclk_khz = clk_mgr_base->clks.dcfclk_khz;
+	cmd.notify_clocks.clocks.dcfclk_deep_sleep_khz =
+		clk_mgr_base->clks.dcfclk_deep_sleep_khz;
+	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
+	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
+
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+}
+
+static int get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
+{
+	/* get FbMult value */
+	struct fixed31_32 pll_req;
+	unsigned int fbmult_frac_val = 0;
+	unsigned int fbmult_int_val = 0;
+	struct dc_context *ctx = clk_mgr->base.ctx;
+
+	/*
+	 * Register value of fbmult is in 8.16 format, we are converting to 314.32
+	 * to leverage the fix point operations available in driver
+	 */
+
+	REG_GET(CLK1_CLK_PLL_REQ, FbMult_frac, &fbmult_frac_val); /* 16 bit fractional part*/
+	REG_GET(CLK1_CLK_PLL_REQ, FbMult_int, &fbmult_int_val); /* 8 bit integer part */
+
+	pll_req = dc_fixpt_from_int(fbmult_int_val);
+
+	/*
+	 * since fractional part is only 16 bit in register definition but is 32 bit
+	 * in our fix point definiton, need to shift left by 16 to obtain correct value
+	 */
+	pll_req.value |= fbmult_frac_val << 16;
+
+	/* multiply by REFCLK period */
+	pll_req = dc_fixpt_mul_int(pll_req, clk_mgr->dfs_ref_freq_khz);
+
+	/* integer part is now VCO frequency in kHz */
+	return dc_fixpt_floor(pll_req);
+}
+
+static void dcn35_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	dcn35_smu_enable_pme_wa(clk_mgr);
+}
+
+void dcn35_init_clocks(struct clk_mgr *clk_mgr)
+{
+	uint32_t ref_dtbclk = clk_mgr->clks.ref_dtbclk_khz;
+
+	memset(&(clk_mgr->clks), 0, sizeof(struct dc_clocks));
+
+	// Assumption is that boot state always supports pstate
+	clk_mgr->clks.ref_dtbclk_khz = ref_dtbclk;	// restore ref_dtbclk
+	clk_mgr->clks.p_state_change_support = true;
+	clk_mgr->clks.prev_p_state_change_support = true;
+	clk_mgr->clks.pwr_state = DCN_PWR_STATE_UNKNOWN;
+	clk_mgr->clks.zstate_support = DCN_ZSTATE_SUPPORT_UNKNOWN;
+}
+
+bool dcn35_are_clock_states_equal(struct dc_clocks *a,
+		struct dc_clocks *b)
+{
+	if (a->dispclk_khz != b->dispclk_khz)
+		return false;
+	else if (a->dppclk_khz != b->dppclk_khz)
+		return false;
+	else if (a->dcfclk_khz != b->dcfclk_khz)
+		return false;
+	else if (a->dcfclk_deep_sleep_khz != b->dcfclk_deep_sleep_khz)
+		return false;
+	else if (a->zstate_support != b->zstate_support)
+		return false;
+	else if (a->dtbclk_en != b->dtbclk_en)
+		return false;
+
+	return true;
+}
+
+static void dcn35_dump_clk_registers(struct clk_state_registers_and_bypass *regs_and_bypass,
+		struct clk_mgr *clk_mgr_base, struct clk_log_info *log_info)
+{
+
+}
+
+static struct clk_bw_params dcn35_bw_params = {
+	.vram_type = Ddr4MemType,
+	.num_channels = 1,
+	.clk_table = {
+		.num_entries = 4,
+	},
+
+};
+
+static struct wm_table ddr5_wm_table = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 9,
+			.sr_enter_plus_exit_time_us = 11,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 9,
+			.sr_enter_plus_exit_time_us = 11,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 9,
+			.sr_enter_plus_exit_time_us = 11,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 9,
+			.sr_enter_plus_exit_time_us = 11,
+			.valid = true,
+		},
+	}
+};
+
+static struct wm_table lpddr5_wm_table = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+	}
+};
+
+static DpmClocks_t dummy_clocks;
+
+static struct dcn35_watermarks dummy_wms = { 0 };
+
+static struct dcn35_ss_info_table ss_info_table = {
+	.ss_divider = 1000,
+	.ss_percentage = {0, 0, 375, 375, 375}
+};
+
+static void dcn35_build_watermark_ranges(struct clk_bw_params *bw_params, struct dcn35_watermarks *table)
+{
+	int i, num_valid_sets;
+
+	num_valid_sets = 0;
+
+	for (i = 0; i < WM_SET_COUNT; i++) {
+		/* skip empty entries, the smu array has no holes*/
+		if (!bw_params->wm_table.entries[i].valid)
+			continue;
+
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].WmSetting = bw_params->wm_table.entries[i].wm_inst;
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].WmType = bw_params->wm_table.entries[i].wm_type;
+		/* We will not select WM based on fclk, so leave it as unconstrained */
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinClock = 0;
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].MaxClock = 0xFFFF;
+
+		if (table->WatermarkRow[WM_DCFCLK][num_valid_sets].WmType == WM_TYPE_PSTATE_CHG) {
+			if (i == 0)
+				table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinMclk = 0;
+			else {
+				/* add 1 to make it non-overlapping with next lvl */
+				table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinMclk =
+						bw_params->clk_table.entries[i - 1].dcfclk_mhz + 1;
+			}
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets].MaxMclk =
+					bw_params->clk_table.entries[i].dcfclk_mhz;
+
+		} else {
+			/* unconstrained for memory retraining */
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinClock = 0;
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets].MaxClock = 0xFFFF;
+
+			/* Modify previous watermark range to cover up to max */
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets - 1].MaxClock = 0xFFFF;
+		}
+		num_valid_sets++;
+	}
+
+	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+
+	/* modify the min and max to make sure we cover the whole range*/
+	table->WatermarkRow[WM_DCFCLK][0].MinMclk = 0;
+	table->WatermarkRow[WM_DCFCLK][0].MinClock = 0;
+	table->WatermarkRow[WM_DCFCLK][num_valid_sets - 1].MaxMclk = 0xFFFF;
+	table->WatermarkRow[WM_DCFCLK][num_valid_sets - 1].MaxClock = 0xFFFF;
+
+	/* This is for writeback only, does not matter currently as no writeback support*/
+	table->WatermarkRow[WM_SOCCLK][0].WmSetting = WM_A;
+	table->WatermarkRow[WM_SOCCLK][0].MinClock = 0;
+	table->WatermarkRow[WM_SOCCLK][0].MaxClock = 0xFFFF;
+	table->WatermarkRow[WM_SOCCLK][0].MinMclk = 0;
+	table->WatermarkRow[WM_SOCCLK][0].MaxMclk = 0xFFFF;
+}
+
+static void dcn35_notify_wm_ranges(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct clk_mgr_dcn35 *clk_mgr_dcn35 = TO_CLK_MGR_DCN35(clk_mgr);
+	struct dcn35_watermarks *table = clk_mgr_dcn35->smu_wm_set.wm_set;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || clk_mgr_dcn35->smu_wm_set.mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn35_build_watermark_ranges(clk_mgr_base->bw_params, table);
+
+	dcn35_smu_set_dram_addr_high(clk_mgr,
+			clk_mgr_dcn35->smu_wm_set.mc_address.high_part);
+	dcn35_smu_set_dram_addr_low(clk_mgr,
+			clk_mgr_dcn35->smu_wm_set.mc_address.low_part);
+	dcn35_smu_transfer_wm_table_dram_2_smu(clk_mgr);
+}
+
+static void dcn35_get_dpm_table_from_smu(struct clk_mgr_internal *clk_mgr,
+		struct dcn35_smu_dpm_clks *smu_dpm_clks)
+{
+	DpmClocks_t *table = smu_dpm_clks->dpm_clks;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || smu_dpm_clks->mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn35_smu_set_dram_addr_high(clk_mgr,
+			smu_dpm_clks->mc_address.high_part);
+	dcn35_smu_set_dram_addr_low(clk_mgr,
+			smu_dpm_clks->mc_address.low_part);
+	dcn35_smu_transfer_dpm_table_smu_2_dram(clk_mgr);
+}
+
+static uint32_t find_max_clk_value(const uint32_t clocks[], uint32_t num_clocks)
+{
+	uint32_t max = 0;
+	int i;
+
+	for (i = 0; i < num_clocks; ++i) {
+		if (clocks[i] > max)
+			max = clocks[i];
+	}
+
+	return max;
+}
+
+static unsigned int find_clk_for_voltage(
+		const DpmClocks_t *clock_table,
+		const uint32_t clocks[],
+		unsigned int voltage)
+{
+	int i;
+	int max_voltage = 0;
+	int clock = 0;
+
+	for (i = 0; i < NUM_SOC_VOLTAGE_LEVELS; i++) {
+		if (clock_table->SocVoltage[i] == voltage) {
+			return clocks[i];
+		} else if (clock_table->SocVoltage[i] >= max_voltage &&
+				clock_table->SocVoltage[i] < voltage) {
+			max_voltage = clock_table->SocVoltage[i];
+			clock = clocks[i];
+		}
+	}
+
+	ASSERT(clock);
+	return clock;
+}
+
+static void dcn35_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk_mgr,
+						    struct integrated_info *bios_info,
+						    const DpmClocks_t *clock_table)
+{
+	int i, j;
+	struct clk_bw_params *bw_params = clk_mgr->base.bw_params;
+	uint32_t max_dispclk = 0, max_dppclk = 0;
+
+	j = -1;
+
+	ASSERT(NUM_DF_PSTATE_LEVELS <= MAX_NUM_DPM_LVL);
+
+	/* Find lowest DPM, FCLK is filled in reverse order*/
+
+	for (i = NUM_DF_PSTATE_LEVELS - 1; i >= 0; i--) {
+		if (clock_table->DfPstateTable[i].FClk != 0) {
+			j = i;
+			break;
+		}
+	}
+
+	if (j == -1) {
+		/* clock table is all 0s, just use our own hardcode */
+		ASSERT(0);
+		return;
+	}
+
+	bw_params->clk_table.num_entries = j + 1;
+
+	/* dispclk and dppclk can be max at any voltage, same number of levels for both */
+	if (clock_table->NumDispClkLevelsEnabled <= NUM_DISPCLK_DPM_LEVELS &&
+	    clock_table->NumDispClkLevelsEnabled <= NUM_DPPCLK_DPM_LEVELS) {
+		max_dispclk = find_max_clk_value(clock_table->DispClocks, clock_table->NumDispClkLevelsEnabled);
+		max_dppclk = find_max_clk_value(clock_table->DppClocks, clock_table->NumDispClkLevelsEnabled);
+	} else {
+		ASSERT(0);
+	}
+
+	for (i = 0; i < bw_params->clk_table.num_entries; i++, j--) {
+		bw_params->clk_table.entries[i].fclk_mhz = clock_table->DfPstateTable[j].FClk;
+		bw_params->clk_table.entries[i].memclk_mhz = clock_table->DfPstateTable[j].MemClk;
+		bw_params->clk_table.entries[i].voltage = clock_table->DfPstateTable[j].Voltage;
+		switch (clock_table->DfPstateTable[j].WckRatio) {
+		case WCK_RATIO_1_2:
+			bw_params->clk_table.entries[i].wck_ratio = 2;
+			break;
+		case WCK_RATIO_1_4:
+			bw_params->clk_table.entries[i].wck_ratio = 4;
+			break;
+		default:
+			bw_params->clk_table.entries[i].wck_ratio = 1;
+		}
+		bw_params->clk_table.entries[i].dcfclk_mhz = find_clk_for_voltage(clock_table, clock_table->DcfClocks, clock_table->DfPstateTable[j].Voltage);
+		bw_params->clk_table.entries[i].socclk_mhz = find_clk_for_voltage(clock_table, clock_table->SocClocks, clock_table->DfPstateTable[j].Voltage);
+		bw_params->clk_table.entries[i].dispclk_mhz = max_dispclk;
+		bw_params->clk_table.entries[i].dppclk_mhz = max_dppclk;
+	}
+
+	bw_params->vram_type = bios_info->memory_type;
+	bw_params->num_channels = bios_info->ma_channel_number ? bios_info->ma_channel_number : 4;
+
+	for (i = 0; i < WM_SET_COUNT; i++) {
+		bw_params->wm_table.entries[i].wm_inst = i;
+
+		if (i >= bw_params->clk_table.num_entries) {
+			bw_params->wm_table.entries[i].valid = false;
+			continue;
+		}
+
+		bw_params->wm_table.entries[i].wm_type = WM_TYPE_PSTATE_CHG;
+		bw_params->wm_table.entries[i].valid = true;
+	}
+}
+
+static void dcn35_set_low_power_state(struct clk_mgr *clk_mgr_base)
+{
+	int display_count;
+	struct dc *dc = clk_mgr_base->ctx->dc;
+	struct dc_state *context = dc->current_state;
+
+	if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_LOW_POWER) {
+		display_count = dcn35_get_active_display_cnt_wa(dc, context);
+		/* if we can go lower, go lower */
+		if (display_count == 0)
+			clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_LOW_POWER;
+	}
+}
+
+static void dcn35_exit_low_power_state(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	//SMU optimization is performed part of low power state exit.
+	dcn35_smu_exit_low_power_state(clk_mgr);
+
+}
+
+static void dcn35_init_clocks_fpga(struct clk_mgr *clk_mgr)
+{
+	dcn35_init_clocks(clk_mgr);
+
+/* TODO: Implement the functions and remove the ifndef guard */
+}
+
+static void dcn35_update_clocks_fpga(struct clk_mgr *clk_mgr,
+		struct dc_state *context,
+		bool safe_to_lower)
+{
+	struct clk_mgr_internal *clk_mgr_int = TO_CLK_MGR_INTERNAL(clk_mgr);
+	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
+	int fclk_adj = new_clocks->fclk_khz;
+
+	/* TODO: remove this after correctly set by DML */
+	new_clocks->dcfclk_khz = 400000;
+	new_clocks->socclk_khz = 400000;
+
+	/* Min fclk = 1.2GHz since all the extra scemi logic seems to run off of it */
+	//int fclk_adj = new_clocks->fclk_khz > 1200000 ? new_clocks->fclk_khz : 1200000;
+	new_clocks->fclk_khz = 4320000;
+
+	if (should_set_clock(safe_to_lower, new_clocks->phyclk_khz, clk_mgr->clks.phyclk_khz)) {
+		clk_mgr->clks.phyclk_khz = new_clocks->phyclk_khz;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr->clks.dcfclk_khz)) {
+		clk_mgr->clks.dcfclk_khz = new_clocks->dcfclk_khz;
+	}
+
+	if (should_set_clock(safe_to_lower,
+			new_clocks->dcfclk_deep_sleep_khz, clk_mgr->clks.dcfclk_deep_sleep_khz)) {
+		clk_mgr->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->socclk_khz, clk_mgr->clks.socclk_khz)) {
+		clk_mgr->clks.socclk_khz = new_clocks->socclk_khz;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dramclk_khz, clk_mgr->clks.dramclk_khz)) {
+		clk_mgr->clks.dramclk_khz = new_clocks->dramclk_khz;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->clks.dppclk_khz)) {
+		clk_mgr->clks.dppclk_khz = new_clocks->dppclk_khz;
+	}
+
+	if (should_set_clock(safe_to_lower, fclk_adj, clk_mgr->clks.fclk_khz)) {
+		clk_mgr->clks.fclk_khz = fclk_adj;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr->clks.dispclk_khz)) {
+		clk_mgr->clks.dispclk_khz = new_clocks->dispclk_khz;
+	}
+
+	/* Both fclk and ref_dppclk run on the same scemi clock.
+	 * So take the higher value since the DPP DTO is typically programmed
+	 * such that max dppclk is 1:1 with ref_dppclk.
+	 */
+	if (clk_mgr->clks.fclk_khz > clk_mgr->clks.dppclk_khz)
+		clk_mgr->clks.dppclk_khz = clk_mgr->clks.fclk_khz;
+	if (clk_mgr->clks.dppclk_khz > clk_mgr->clks.fclk_khz)
+		clk_mgr->clks.fclk_khz = clk_mgr->clks.dppclk_khz;
+
+	// Both fclk and ref_dppclk run on the same scemi clock.
+	clk_mgr_int->dccg->ref_dppclk = clk_mgr->clks.fclk_khz;
+
+	/* TODO: set dtbclk in correct place */
+	clk_mgr->clks.dtbclk_en = true;
+	dm_set_dcn_clocks(clk_mgr->ctx, &clk_mgr->clks);
+	dcn35_update_clocks_update_dpp_dto(clk_mgr_int, context, safe_to_lower);
+
+	dcn35_update_clocks_update_dtb_dto(clk_mgr_int, context, clk_mgr->clks.ref_dtbclk_khz);
+}
+
+static struct clk_mgr_funcs dcn35_funcs = {
+	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
+	.get_dtb_ref_clk_frequency = dcn31_get_dtb_ref_freq_khz,
+	.update_clocks = dcn35_update_clocks,
+	.init_clocks = dcn35_init_clocks,
+	.enable_pme_wa = dcn35_enable_pme_wa,
+	.are_clock_states_equal = dcn35_are_clock_states_equal,
+	.notify_wm_ranges = dcn35_notify_wm_ranges,
+	.set_low_power_state = dcn35_set_low_power_state,
+	.exit_low_power_state = dcn35_exit_low_power_state,
+};
+
+struct clk_mgr_funcs dcn35_fpga_funcs = {
+	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
+	.update_clocks = dcn35_update_clocks_fpga,
+	.init_clocks = dcn35_init_clocks_fpga,
+	.get_dtb_ref_clk_frequency = dcn31_get_dtb_ref_freq_khz,
+};
+
+static void dcn35_read_ss_info_from_lut(struct clk_mgr_internal *clk_mgr)
+{
+	uint32_t clock_source;
+	struct dc_context *ctx = clk_mgr->base.ctx;
+
+	REG_GET(CLK1_CLK2_BYPASS_CNTL, CLK2_BYPASS_SEL, &clock_source);
+
+	clk_mgr->dprefclk_ss_percentage = ss_info_table.ss_percentage[clock_source];
+
+	if (clk_mgr->dprefclk_ss_percentage != 0) {
+		clk_mgr->ss_on_dprefclk = true;
+		clk_mgr->dprefclk_ss_divider = ss_info_table.ss_divider;
+	}
+}
+
+void dcn35_clk_mgr_construct(
+		struct dc_context *ctx,
+		struct clk_mgr_dcn35 *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg)
+{
+	struct dcn35_smu_dpm_clks smu_dpm_clks = { 0 };
+	struct clk_log_info log_info = {0};
+	clk_mgr->base.base.ctx = ctx;
+	clk_mgr->base.base.funcs = &dcn35_funcs;
+
+	clk_mgr->base.pp_smu = pp_smu;
+
+	clk_mgr->base.dccg = dccg;
+	clk_mgr->base.dfs_bypass_disp_clk = 0;
+
+	clk_mgr->base.dprefclk_ss_percentage = 0;
+	clk_mgr->base.dprefclk_ss_divider = 1000;
+	clk_mgr->base.ss_on_dprefclk = false;
+	clk_mgr->base.dfs_ref_freq_khz = 48000;
+
+	clk_mgr->smu_wm_set.wm_set = (struct dcn35_watermarks *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(struct dcn35_watermarks),
+				&clk_mgr->smu_wm_set.mc_address.quad_part);
+
+	if (!clk_mgr->smu_wm_set.wm_set) {
+		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
+		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
+	}
+	ASSERT(clk_mgr->smu_wm_set.wm_set);
+
+	smu_dpm_clks.dpm_clks = (DpmClocks_t *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(DpmClocks_t),
+				&smu_dpm_clks.mc_address.quad_part);
+
+	if (smu_dpm_clks.dpm_clks == NULL) {
+		smu_dpm_clks.dpm_clks = &dummy_clocks;
+		smu_dpm_clks.mc_address.quad_part = 0;
+	}
+
+	ASSERT(smu_dpm_clks.dpm_clks);
+
+		clk_mgr->base.smu_ver = dcn35_smu_get_smu_version(&clk_mgr->base);
+
+		if (clk_mgr->base.smu_ver)
+			clk_mgr->base.smu_present = true;
+
+		/* TODO: Check we get what we expect during bringup */
+		clk_mgr->base.base.dentist_vco_freq_khz = get_vco_frequency_from_reg(&clk_mgr->base);
+
+		if (ctx->dc_bios->integrated_info->memory_type == LpDdr5MemType) {
+			dcn35_bw_params.wm_table = lpddr5_wm_table;
+		} else {
+			dcn35_bw_params.wm_table = ddr5_wm_table;
+		}
+		/* Saved clocks configured at boot for debug purposes */
+		 dcn35_dump_clk_registers(&clk_mgr->base.base.boot_snapshot, &clk_mgr->base.base, &log_info);
+
+	clk_mgr->base.base.dprefclk_khz = dcn35_smu_get_dprefclk(&clk_mgr->base);
+	clk_mgr->base.base.clks.ref_dtbclk_khz = dcn35_smu_get_dtbclk(&clk_mgr->base);
+
+	if (!clk_mgr->base.base.clks.ref_dtbclk_khz)
+		dcn35_smu_set_dtbclk(&clk_mgr->base, true);
+
+	clk_mgr->base.base.clks.dtbclk_en = true;
+	dce_clock_read_ss_info(&clk_mgr->base);
+	/*when clk src is from FCH, it could have ss, same clock src as DPREF clk*/
+
+	dcn35_read_ss_info_from_lut(&clk_mgr->base);
+	clk_mgr->base.base.dprefclk_khz =
+		dce_adjust_dp_ref_freq_for_ss(&clk_mgr->base, clk_mgr->base.base.dprefclk_khz);
+
+	clk_mgr->base.base.bw_params = &dcn35_bw_params;
+
+	if (clk_mgr->base.base.ctx->dc->debug.pstate_enabled) {
+		int i;
+		dcn35_get_dpm_table_from_smu(&clk_mgr->base, &smu_dpm_clks);
+		DC_LOG_SMU("NumDcfClkLevelsEnabled: %d\n"
+				   "NumDispClkLevelsEnabled: %d\n"
+				   "NumSocClkLevelsEnabled: %d\n"
+				   "VcnClkLevelsEnabled: %d\n"
+				   "NumDfPst atesEnabled: %d\n"
+				   "MinGfxClk: %d\n"
+				   "MaxGfxClk: %d\n",
+				   smu_dpm_clks.dpm_clks->NumDcfClkLevelsEnabled,
+				   smu_dpm_clks.dpm_clks->NumDispClkLevelsEnabled,
+				   smu_dpm_clks.dpm_clks->NumSocClkLevelsEnabled,
+				   smu_dpm_clks.dpm_clks->VcnClkLevelsEnabled,
+				   smu_dpm_clks.dpm_clks->NumDfPstatesEnabled,
+				   smu_dpm_clks.dpm_clks->MinGfxClk,
+				   smu_dpm_clks.dpm_clks->MaxGfxClk);
+		for (i = 0; i < smu_dpm_clks.dpm_clks->NumDcfClkLevelsEnabled; i++) {
+			DC_LOG_SMU("smu_dpm_clks.dpm_clks->DcfClocks[%d] = %d\n",
+					   i,
+					   smu_dpm_clks.dpm_clks->DcfClocks[i]);
+		}
+		for (i = 0; i < smu_dpm_clks.dpm_clks->NumDispClkLevelsEnabled; i++) {
+			DC_LOG_SMU("smu_dpm_clks.dpm_clks->DispClocks[%d] = %d\n",
+					   i, smu_dpm_clks.dpm_clks->DispClocks[i]);
+		}
+		for (i = 0; i < smu_dpm_clks.dpm_clks->NumSocClkLevelsEnabled; i++) {
+			DC_LOG_SMU("smu_dpm_clks.dpm_clks->SocClocks[%d] = %d\n",
+					   i, smu_dpm_clks.dpm_clks->SocClocks[i]);
+		}
+		for (i = 0; i < NUM_SOC_VOLTAGE_LEVELS; i++)
+			DC_LOG_SMU("smu_dpm_clks.dpm_clks->SocVoltage[%d] = %d\n",
+					   i, smu_dpm_clks.dpm_clks->SocVoltage[i]);
+
+		for (i = 0; i < NUM_DF_PSTATE_LEVELS; i++) {
+			DC_LOG_SMU("smu_dpm_clks.dpm_clks.DfPstateTable[%d].FClk = %d\n"
+					   "smu_dpm_clks.dpm_clks->DfPstateTable[%d].MemClk= %d\n"
+					   "smu_dpm_clks.dpm_clks->DfPstateTable[%d].Voltage = %d\n",
+					   i, smu_dpm_clks.dpm_clks->DfPstateTable[i].FClk,
+					   i, smu_dpm_clks.dpm_clks->DfPstateTable[i].MemClk,
+					   i, smu_dpm_clks.dpm_clks->DfPstateTable[i].Voltage);
+		}
+
+		if (ctx->dc_bios && ctx->dc_bios->integrated_info && ctx->dc->config.use_default_clock_table == false) {
+			dcn35_clk_mgr_helper_populate_bw_params(
+					&clk_mgr->base,
+					ctx->dc_bios->integrated_info,
+					smu_dpm_clks.dpm_clks);
+		}
+	}
+
+	if (smu_dpm_clks.dpm_clks && smu_dpm_clks.mc_address.quad_part != 0)
+		dm_helpers_free_gpu_mem(clk_mgr->base.base.ctx, DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				smu_dpm_clks.dpm_clks);
+
+}
+
+void dcn35_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr_int)
+{
+	struct clk_mgr_dcn35 *clk_mgr = TO_CLK_MGR_DCN35(clk_mgr_int);
+
+	if (clk_mgr->smu_wm_set.wm_set && clk_mgr->smu_wm_set.mc_address.quad_part != 0)
+		dm_helpers_free_gpu_mem(clk_mgr_int->base.ctx, DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				clk_mgr->smu_wm_set.wm_set);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h
new file mode 100644
index 000000000000..1203dc605b12
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h
@@ -0,0 +1,63 @@
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DCN35_CLK_MGR_H__
+#define __DCN35_CLK_MGR_H__
+#include "clk_mgr_internal.h"
+
+#define NUM_CLOCK_SOURCES   5
+
+struct dcn35_watermarks;
+
+struct dcn35_smu_watermark_set {
+	struct dcn35_watermarks *wm_set;
+	union large_integer mc_address;
+};
+
+struct dcn35_ss_info_table {
+	uint32_t ss_divider;
+	uint32_t ss_percentage[NUM_CLOCK_SOURCES];
+};
+
+struct clk_mgr_dcn35 {
+	struct clk_mgr_internal base;
+	struct dcn35_smu_watermark_set smu_wm_set;
+};
+
+bool dcn35_are_clock_states_equal(struct dc_clocks *a,
+		struct dc_clocks *b);
+void dcn35_init_clocks(struct clk_mgr *clk_mgr);
+void dcn35_update_clocks(struct clk_mgr *clk_mgr_base,
+			struct dc_state *context,
+			bool safe_to_lower);
+
+void dcn35_clk_mgr_construct(struct dc_context *ctx,
+		struct clk_mgr_dcn35 *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg);
+
+void dcn35_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr_int);
+
+#endif //__DCN35_CLK_MGR_H__
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
new file mode 100644
index 000000000000..8d870880ec15
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
@@ -0,0 +1,453 @@
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
+ * Authors: AMD
+ *
+ */
+
+
+
+#include "core_types.h"
+#include "clk_mgr_internal.h"
+#include "reg_helper.h"
+#include "dm_helpers.h"
+#include "dcn35_smu.h"
+
+#include "mp/mp_14_0_0_offset.h"
+#include "mp/mp_14_0_0_sh_mask.h"
+
+/* TODO: Use the real headers when they're correct */
+#define MP1_BASE__INST0_SEG0                       0x00016000
+#define MP1_BASE__INST0_SEG1                       0x0243FC00
+#define MP1_BASE__INST0_SEG2                       0x00DC0000
+#define MP1_BASE__INST0_SEG3                       0x00E00000
+#define MP1_BASE__INST0_SEG4                       0x00E40000
+#define MP1_BASE__INST0_SEG5                       0
+
+#ifdef BASE_INNER
+#undef BASE_INNER
+#endif
+
+#define BASE_INNER(seg) MP1_BASE__INST0_SEG ## seg
+
+#define BASE(seg) BASE_INNER(seg)
+
+#define REG(reg_name) (BASE(reg##reg_name##_BASE_IDX) + reg##reg_name)
+
+#define FN(reg_name, field) \
+	FD(reg_name##__##field)
+
+#include "logger_types.h"
+#undef DC_LOGGER
+#define DC_LOGGER \
+	CTX->logger
+#define smu_print(str, ...) {DC_LOG_SMU(str, ##__VA_ARGS__); }
+
+#define VBIOSSMC_MSG_TestMessage                  0x1
+#define VBIOSSMC_MSG_GetSmuVersion                0x2
+#define VBIOSSMC_MSG_PowerUpGfx                   0x3
+#define VBIOSSMC_MSG_SetDispclkFreq               0x4
+#define VBIOSSMC_MSG_SetDprefclkFreq              0x5   //Not used. DPRef is constant
+#define VBIOSSMC_MSG_SetDppclkFreq                0x6
+#define VBIOSSMC_MSG_SetHardMinDcfclkByFreq       0x7
+#define VBIOSSMC_MSG_SetMinDeepSleepDcfclk        0x8
+#define VBIOSSMC_MSG_SetPhyclkVoltageByFreq       0x9	//Keep it in case VMIN dees not support phy clk
+#define VBIOSSMC_MSG_GetFclkFrequency             0xA
+#define VBIOSSMC_MSG_SetDisplayCount              0xB   //Not used anymore
+#define VBIOSSMC_MSG_EnableTmdp48MHzRefclkPwrDown 0xC   //To ask PMFW turn off TMDP 48MHz refclk during display off to save power
+#define VBIOSSMC_MSG_UpdatePmeRestore             0xD
+#define VBIOSSMC_MSG_SetVbiosDramAddrHigh         0xE   //Used for WM table txfr
+#define VBIOSSMC_MSG_SetVbiosDramAddrLow          0xF
+#define VBIOSSMC_MSG_TransferTableSmu2Dram        0x10
+#define VBIOSSMC_MSG_TransferTableDram2Smu        0x11
+#define VBIOSSMC_MSG_SetDisplayIdleOptimizations  0x12
+#define VBIOSSMC_MSG_GetDprefclkFreq              0x13
+#define VBIOSSMC_MSG_GetDtbclkFreq                0x14
+#define VBIOSSMC_MSG_AllowZstatesEntry            0x15
+#define VBIOSSMC_MSG_DisallowZstatesEntry     	  0x16
+#define VBIOSSMC_MSG_SetDtbClk                    0x17
+#define VBIOSSMC_MSG_DispPsrEntry                 0x18 ///< Display PSR entry, DMU
+#define VBIOSSMC_MSG_DispPsrExit                  0x19 ///< Display PSR exit, DMU
+#define VBIOSSMC_Message_Count                    0x1A
+
+#define VBIOSSMC_Status_BUSY                      0x0
+#define VBIOSSMC_Result_OK                        0x1
+#define VBIOSSMC_Result_Failed                    0xFF
+#define VBIOSSMC_Result_UnknownCmd                0xFE
+#define VBIOSSMC_Result_CmdRejectedPrereq         0xFD
+#define VBIOSSMC_Result_CmdRejectedBusy           0xFC
+
+/*
+ * Function to be used instead of REG_WAIT macro because the wait ends when
+ * the register is NOT EQUAL to zero, and because `the translation in msg_if.h
+ * won't work with REG_WAIT.
+ */
+static uint32_t dcn35_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsigned int delay_us, unsigned int max_retries)
+{
+	uint32_t res_val = VBIOSSMC_Status_BUSY;
+
+	do {
+		res_val = REG_READ(MP1_SMN_C2PMSG_91);
+		if (res_val != VBIOSSMC_Status_BUSY)
+			break;
+
+		if (delay_us >= 1000)
+			msleep(delay_us/1000);
+		else if (delay_us > 0)
+			udelay(delay_us);
+	} while (max_retries--);
+
+	return res_val;
+}
+
+static int dcn35_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
+					 unsigned int msg_id,
+					 unsigned int param)
+{
+	uint32_t result;
+
+	result = dcn35_smu_wait_for_response(clk_mgr, 10, 2000000);
+	ASSERT(result == VBIOSSMC_Result_OK);
+
+
+
+	if (result == VBIOSSMC_Status_BUSY) {
+		smu_print("SMU response after wait: %d\n", result);
+		return -1;
+	}
+
+	/* First clear response register */
+	REG_WRITE(MP1_SMN_C2PMSG_91, VBIOSSMC_Status_BUSY);
+
+	/* Set the parameter register for the SMU message, unit is Mhz */
+	REG_WRITE(MP1_SMN_C2PMSG_83, param);
+
+	/* Trigger the message transaction by writing the message ID */
+	REG_WRITE(MP1_SMN_C2PMSG_67, msg_id);
+
+	result = dcn35_smu_wait_for_response(clk_mgr, 10, 2000000);
+
+	if (result == VBIOSSMC_Result_Failed) {
+		if (msg_id == VBIOSSMC_MSG_TransferTableDram2Smu &&
+		    param == TABLE_WATERMARKS)
+			DC_LOG_WARNING("Watermarks table not configured properly by SMU");
+		else
+			ASSERT(0);
+		REG_WRITE(MP1_SMN_C2PMSG_91, VBIOSSMC_Result_OK);
+		smu_print("SMU response after wait: %d\n", result);
+		return -1;
+	}
+
+	if (IS_SMU_TIMEOUT(result)) {
+		ASSERT(0);
+		result = dcn35_smu_wait_for_response(clk_mgr, 10, 2000000);
+		//dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
+		smu_print("SMU response after wait: %d\n", result);
+	}
+
+	return REG_READ(MP1_SMN_C2PMSG_83);
+}
+
+int dcn35_smu_get_smu_version(struct clk_mgr_internal *clk_mgr)
+{
+	return dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_GetSmuVersion,
+			0);
+}
+
+
+int dcn35_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz)
+{
+	int actual_dispclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dispclk_khz;
+
+	/*  Unit of SMU msg parameter is Mhz */
+	actual_dispclk_set_mhz = dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDispclkFreq,
+			khz_to_mhz_ceil(requested_dispclk_khz));
+
+	smu_print("requested_dispclk_khz = %d, actual_dispclk_set_mhz: %d\n", requested_dispclk_khz, actual_dispclk_set_mhz);
+	return actual_dispclk_set_mhz * 1000;
+}
+
+int dcn35_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
+{
+	int actual_dprefclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return clk_mgr->base.dprefclk_khz;
+
+	actual_dprefclk_set_mhz = dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDprefclkFreq,
+			khz_to_mhz_ceil(clk_mgr->base.dprefclk_khz));
+
+	/* TODO: add code for programing DP DTO, currently this is down by command table */
+
+	return actual_dprefclk_set_mhz * 1000;
+}
+
+int dcn35_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz)
+{
+	int actual_dcfclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dcfclk_khz;
+
+	actual_dcfclk_set_mhz = dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetHardMinDcfclkByFreq,
+			khz_to_mhz_ceil(requested_dcfclk_khz));
+
+	smu_print("requested_dcfclk_khz = %d, actual_dcfclk_set_mhz: %d\n", requested_dcfclk_khz, actual_dcfclk_set_mhz);
+
+	return actual_dcfclk_set_mhz * 1000;
+}
+
+int dcn35_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz)
+{
+	int actual_min_ds_dcfclk_mhz = -1;
+
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_min_ds_dcfclk_khz;
+
+	actual_min_ds_dcfclk_mhz = dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetMinDeepSleepDcfclk,
+			khz_to_mhz_ceil(requested_min_ds_dcfclk_khz));
+
+	smu_print("requested_min_ds_dcfclk_khz = %d, actual_min_ds_dcfclk_mhz: %d\n", requested_min_ds_dcfclk_khz, actual_min_ds_dcfclk_mhz);
+
+	return actual_min_ds_dcfclk_mhz * 1000;
+}
+
+int dcn35_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz)
+{
+	int actual_dppclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dpp_khz;
+
+	actual_dppclk_set_mhz = dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDppclkFreq,
+			khz_to_mhz_ceil(requested_dpp_khz));
+
+	smu_print("requested_dpp_khz = %d, actual_dppclk_set_mhz: %d\n", requested_dpp_khz, actual_dppclk_set_mhz);
+
+	return actual_dppclk_set_mhz * 1000;
+}
+
+void dcn35_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info)
+{
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	//TODO: Work with smu team to define optimization options.
+	dcn35_smu_send_msg_with_param(
+		clk_mgr,
+		VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+		idle_info);
+	smu_print("VBIOSSMC_MSG_SetDisplayIdleOptimizations idle_info  = %d\n", idle_info);
+}
+
+void dcn35_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable)
+{
+	union display_idle_optimization_u idle_info = { 0 };
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	if (enable) {
+		idle_info.idle_info.df_request_disabled = 1;
+		idle_info.idle_info.phy_ref_clk_off = 1;
+	}
+
+	dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+			idle_info.data);
+	smu_print("dcn35_smu_enable_phy_refclk_pwrdwn  = %d\n", enable ? 1 : 0);
+}
+
+void dcn35_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_UpdatePmeRestore,
+			0);
+}
+
+void dcn35_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn35_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrHigh, addr_high);
+}
+
+void dcn35_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn35_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrLow, addr_low);
+}
+
+void dcn35_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn35_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableSmu2Dram, TABLE_DPMCLOCKS);
+}
+
+void dcn35_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn35_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableDram2Smu, TABLE_WATERMARKS);
+}
+
+void dcn35_smu_set_zstate_support(struct clk_mgr_internal *clk_mgr, enum dcn_zstate_support_state support)
+{
+	unsigned int msg_id, param;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	switch (support) {
+
+	case DCN_ZSTATE_SUPPORT_ALLOW:
+		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
+		param = (1 << 10) | (1 << 9) | (1 << 8);
+		break;
+
+	case DCN_ZSTATE_SUPPORT_DISALLOW:
+		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
+		param = 0;
+		break;
+
+
+	case DCN_ZSTATE_SUPPORT_ALLOW_Z10_ONLY:
+		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
+		param = (1 << 10);
+		break;
+
+	case DCN_ZSTATE_SUPPORT_ALLOW_Z8_Z10_ONLY:
+		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
+		param = (1 << 10) | (1 << 8);
+		break;
+
+	case DCN_ZSTATE_SUPPORT_ALLOW_Z8_ONLY:
+		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
+		param = (1 << 8);
+		break;
+
+	default: //DCN_ZSTATE_SUPPORT_UNKNOWN
+		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
+		param = 0;
+		break;
+	}
+
+
+	dcn35_smu_send_msg_with_param(
+		clk_mgr,
+		msg_id,
+		param);
+	smu_print("dcn35_smu_set_zstate_support msg_id = %d, param = %d\n", msg_id, param);
+}
+
+int dcn35_smu_get_dprefclk(struct clk_mgr_internal *clk_mgr)
+{
+	int dprefclk;
+
+	if (!clk_mgr->smu_present)
+		return 0;
+
+	dprefclk = dcn35_smu_send_msg_with_param(clk_mgr,
+						 VBIOSSMC_MSG_GetDprefclkFreq,
+						 0);
+
+	smu_print("dcn35_smu_get_DPREF clk  = %d mhz\n", dprefclk);
+	return dprefclk * 1000;
+}
+
+int dcn35_smu_get_dtbclk(struct clk_mgr_internal *clk_mgr)
+{
+	int dtbclk;
+
+	if (!clk_mgr->smu_present)
+		return 0;
+
+	dtbclk = dcn35_smu_send_msg_with_param(clk_mgr,
+					       VBIOSSMC_MSG_GetDtbclkFreq,
+					       0);
+
+	smu_print("dcn35_smu_get_dtbclk  = %d mhz\n", dtbclk);
+	return dtbclk * 1000;
+}
+/* Arg = 1: Turn DTB on; 0: Turn DTB CLK OFF. when it is on, it is 600MHZ */
+void dcn35_smu_set_dtbclk(struct clk_mgr_internal *clk_mgr, bool enable)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDtbClk,
+			enable);
+	smu_print("dcn35_smu_set_dtbclk  = %d \n", enable ? 1 : 0);
+}
+
+void dcn35_vbios_smu_enable_48mhz_tmdp_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable)
+{
+	dcn35_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_EnableTmdp48MHzRefclkPwrDown,
+			enable);
+}
+
+void dcn35_smu_exit_low_power_state(struct clk_mgr_internal *clk_mgr)
+{
+	dcn35_smu_send_msg_with_param(
+		clk_mgr,
+		VBIOSSMC_MSG_DispPsrExit,
+		0);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h
new file mode 100644
index 000000000000..793d86c33d12
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h
@@ -0,0 +1,180 @@
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef DAL_DC_35_SMU_H_
+#define DAL_DC_35_SMU_H_
+
+#include "os_types.h"
+
+#ifndef PMFW_DRIVER_IF_H
+#define PMFW_DRIVER_IF_H
+#define PMFW_DRIVER_IF_VERSION 4
+
+typedef enum {
+  DSPCLK_DCFCLK = 0,
+  DSPCLK_DISPCLK,
+  DSPCLK_PIXCLK,
+  DSPCLK_PHYCLK,
+  DSPCLK_COUNT,
+} DSPCLK_e;
+
+typedef struct {
+  uint16_t Freq; // in MHz
+  uint16_t Vid;  // min voltage in SVI3 VID
+} DisplayClockTable_t;
+
+typedef struct {
+  uint16_t MinClock; // This is either DCFCLK or SOCCLK (in MHz)
+  uint16_t MaxClock; // This is either DCFCLK or SOCCLK (in MHz)
+  uint16_t MinMclk;
+  uint16_t MaxMclk;
+
+  uint8_t  WmSetting;
+  uint8_t  WmType;  // Used for normal pstate change or memory retraining
+  uint8_t  Padding[2];
+} WatermarkRowGeneric_t;
+
+#define NUM_WM_RANGES 4
+#define WM_PSTATE_CHG 0
+#define WM_RETRAINING 1
+
+typedef enum {
+  WM_SOCCLK = 0,
+  WM_DCFCLK,
+  WM_COUNT,
+} WM_CLOCK_e;
+
+typedef struct {
+  // Watermarks
+  WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+
+  uint32_t MmHubPadding[7]; // SMU internal use
+} Watermarks_t;
+
+#define NUM_DCFCLK_DPM_LEVELS   8
+#define NUM_DISPCLK_DPM_LEVELS  8
+#define NUM_DPPCLK_DPM_LEVELS   8
+#define NUM_SOCCLK_DPM_LEVELS   8
+#define NUM_VCN_DPM_LEVELS      8
+#define NUM_SOC_VOLTAGE_LEVELS  8
+#define NUM_DF_PSTATE_LEVELS    4
+
+typedef enum{
+  WCK_RATIO_1_1 = 0,  // DDR5, Wck:ck is always 1:1;
+  WCK_RATIO_1_2,
+  WCK_RATIO_1_4,
+  WCK_RATIO_MAX
+} WCK_RATIO_e;
+
+typedef struct {
+  uint32_t FClk;
+  uint32_t MemClk;
+  uint32_t Voltage;
+  uint8_t  WckRatio;
+  uint8_t  Spare[3];
+} DfPstateTable_t;
+
+//Freq in MHz
+//Voltage in milli volts with 2 fractional bits
+typedef struct {
+  uint32_t DcfClocks[NUM_DCFCLK_DPM_LEVELS];
+  uint32_t DispClocks[NUM_DISPCLK_DPM_LEVELS];
+  uint32_t DppClocks[NUM_DPPCLK_DPM_LEVELS];
+  uint32_t SocClocks[NUM_SOCCLK_DPM_LEVELS];
+  uint32_t VClocks[NUM_VCN_DPM_LEVELS];
+  uint32_t DClocks[NUM_VCN_DPM_LEVELS];
+  uint32_t SocVoltage[NUM_SOC_VOLTAGE_LEVELS];
+  DfPstateTable_t DfPstateTable[NUM_DF_PSTATE_LEVELS];
+
+  uint8_t  NumDcfClkLevelsEnabled;
+  uint8_t  NumDispClkLevelsEnabled; //Applies to both Dispclk and Dppclk
+  uint8_t  NumSocClkLevelsEnabled;
+  uint8_t  VcnClkLevelsEnabled;     //Applies to both Vclk and Dclk
+  uint8_t  NumDfPstatesEnabled;
+  uint8_t  spare[3];
+
+  uint32_t MinGfxClk;
+  uint32_t MaxGfxClk;
+} DpmClocks_t;
+
+#define TABLE_BIOS_IF            0 // Called by BIOS
+#define TABLE_WATERMARKS         1 // Called by DAL through VBIOS
+#define TABLE_CUSTOM_DPM         2 // Called by Driver
+#define TABLE_SPARE1             3
+#define TABLE_DPMCLOCKS          4 // Called by Driver
+#define TABLE_MOMENTARY_PM       5 // Called by Tools
+#define TABLE_MODERN_STDBY       6 // Called by Tools for Modern Standby Log
+#define TABLE_SMU_METRICS        7 // Called by Driver
+#define TABLE_COUNT              8
+
+#endif
+
+struct dcn35_watermarks {
+  // Watermarks
+  WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+
+  uint32_t MmHubPadding[7]; // SMU internal use
+};
+
+struct dcn35_smu_dpm_clks {
+	DpmClocks_t *dpm_clks;
+	union large_integer mc_address;
+};
+
+/* TODO: taken from vgh, may not be correct */
+struct display_idle_optimization {
+	unsigned int df_request_disabled : 1;
+	unsigned int phy_ref_clk_off     : 1;
+	unsigned int s0i2_rdy            : 1;
+	unsigned int reserved            : 29;
+};
+
+union display_idle_optimization_u {
+	struct display_idle_optimization idle_info;
+	uint32_t data;
+};
+
+int dcn35_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
+int dcn35_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
+int dcn35_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
+int dcn35_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz);
+int dcn35_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz);
+int dcn35_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz);
+void dcn35_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info);
+void dcn35_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable);
+void dcn35_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr);
+void dcn35_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high);
+void dcn35_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low);
+void dcn35_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr);
+void dcn35_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr);
+
+void dcn35_smu_set_zstate_support(struct clk_mgr_internal *clk_mgr, enum dcn_zstate_support_state support);
+void dcn35_smu_set_dtbclk(struct clk_mgr_internal *clk_mgr, bool enable);
+void dcn35_vbios_smu_enable_48mhz_tmdp_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable);
+
+void dcn35_smu_exit_low_power_state(struct clk_mgr_internal *clk_mgr);
+int dcn35_smu_get_dtbclk(struct clk_mgr_internal *clk_mgr);
+int dcn35_smu_get_dprefclk(struct clk_mgr_internal *clk_mgr);
+#endif /* DAL_DC_35_SMU_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 5f351bddac8f..a04642d0d35e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -870,6 +870,7 @@ static bool dc_construct_ctx(struct dc *dc,
 	dc_ctx->dce_environment = init_params->dce_environment;
 	dc_ctx->dcn_reg_offsets = init_params->dcn_reg_offsets;
 	dc_ctx->nbio_reg_offsets = init_params->nbio_reg_offsets;
+	dc_ctx->clk_reg_offsets = init_params->clk_reg_offsets;
 
 	/* Create logger */
 
@@ -1369,6 +1370,7 @@ struct dc *dc_create(const struct dc_init_data *init_params)
 
 	dc->dcn_reg_offsets = init_params->dcn_reg_offsets;
 	dc->nbio_reg_offsets = init_params->nbio_reg_offsets;
+	dc->clk_reg_offsets = init_params->clk_reg_offsets;
 
 	/* Populate versioning information */
 	dc->versions.dc_ver = DC_VER;
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 4d04728b48de..1b02a59a2b1c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1030,6 +1030,7 @@ struct dc {
 
 	uint32_t *dcn_reg_offsets;
 	uint32_t *nbio_reg_offsets;
+	uint32_t *clk_reg_offsets;
 
 	/* Scratch memory */
 	struct {
@@ -1091,6 +1092,7 @@ struct dc_init_data {
 	 */
 	uint32_t *dcn_reg_offsets;
 	uint32_t *nbio_reg_offsets;
+	uint32_t *clk_reg_offsets;
 };
 
 struct dc_callback_init {
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 445ad79001ce..4b44c18a61a0 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -808,6 +808,7 @@ struct dc_context {
 	struct cp_psp cp_psp;
 	uint32_t *dcn_reg_offsets;
 	uint32_t *nbio_reg_offsets;
+	uint32_t *clk_reg_offsets;
 };
 
 /* DSC DPCD capabilities */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
index ecb7bcc39469..580fea4fde52 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
@@ -258,6 +258,7 @@ struct clk_mgr_funcs {
 	int (*get_dtb_ref_clk_frequency)(struct clk_mgr *clk_mgr);
 
 	void (*set_low_power_state)(struct clk_mgr *clk_mgr);
+	void (*exit_low_power_state)(struct clk_mgr *clk_mgr);
 
 	void (*init_clocks)(struct clk_mgr *clk_mgr);
 
-- 
2.41.0


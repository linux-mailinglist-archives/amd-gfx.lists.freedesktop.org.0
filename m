Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88C4BBDE9
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Feb 2022 17:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1310EFCB;
	Fri, 18 Feb 2022 16:59:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB1A10EE69
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Feb 2022 16:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYbzOB10O+jC7r5j6O+MUuaBXdV99on4Ubi//E0sXiLZxggMVUhHtMxyY2CfgPGda6DB8Z1KHsNP1JHi/4tcUTwQeXgFpYpKITtgohA4el3S0JKC2d5pMuiOiKCjpbrg6q4IpBLLlvQ/cpnfsckv/IXwcPlQc9G7o2zchu8e4WdUdpN0pZh3S9bJS4UTyVeUFBP8vp5NzUT01sCszmEFrbnKDn4fxijYPJ5a2gFCgSuTnF08qJkvBT48jU+QqOVOBTa4OdG2+MOTKGbSUdrAPJGILVfKXmSgM3QCQbYgw4Lbxyfy6P2XNEI4NOw/imrlI8XBaMy4uvqsS3LQMfEs+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMtnoggoe4oschNam7zch/76zO7JqVRRqw1OpOtbRXM=;
 b=Z6WZQHsbOcz3wrJM6cQD4gXsRAsubfEOCRJUNed7lQbzYtqHvDGyt5f/cyD1LBqu9OHXxauruZfhyZxpQSARruOOKKjK1RXFoVthE3R2BwTRNx/bFjdg6bb5z9JMgoVVDyH1TNFB1+89sWQgfbQL6eOwb56ezemX+fHaSZ6yrjA5Q0Q4tWpI4sZTUmhlpNbRtP9VXm2DqJpfZUxHzZm64U4HnlaNWnyH4dYgBv5YA8pNUkulcVIRr3DNuiIJ31mZKbR0CZVxM2VncutwJAIVgSqvKQqwz65+kkXfRPqQQExr8pmU7bmC0ulU2Vj0JUtlh3F+vebhR1gv72Ylw/k+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMtnoggoe4oschNam7zch/76zO7JqVRRqw1OpOtbRXM=;
 b=g6lkiy101RZCjgjVuJ/hhjS+IcXX7nJBERWI1U9gS4dpE5oh+H/VdTNVsvpjI5cul61XsGvRhPl/PKVxcl3wxbIxLeRtpz5Qybz89WE81+flkJxwzGFHTlj50l00+dIv0NOotFPMFG76H1gvGlCgojGygjmc0N3Q+MRuaHQkmh0=
Received: from MW4PR04CA0353.namprd04.prod.outlook.com (2603:10b6:303:8a::28)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 16:59:11 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::cf) by MW4PR04CA0353.outlook.office365.com
 (2603:10b6:303:8a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Fri, 18 Feb 2022 16:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Fri, 18 Feb 2022 16:59:11 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Feb
 2022 10:59:09 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/13] drm/amd/display: Add DCN315 CLK_MGR
Date: Fri, 18 Feb 2022 11:58:45 -0500
Message-ID: <20220218165854.1417733-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218165854.1417733-1-alexander.deucher@amd.com>
References: <20220218165854.1417733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07867320-60b1-47b8-9359-08d9f2fffc7d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4141:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4141C4F434DAD2C831BBEDB4F7379@MN2PR12MB4141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9QqlItvy04sjydr4zpnKT63ijtf9n2cGTihzK7d2MxOJKrTvpRI7QTx+AlcJfWMhYCErTx0jEoGTtHKtvK5xLf4mpXyI0n0o092gT6GO6WwR44jIf0oD+7Lr96S5gipwoKT6VJJPm/bMuT80uYGA+ObW0S+Wvgt3GNau+c12nZPLu32DH4N740IGtpme7NO9xtx/GAQvzAAtDD8iKVImtJaqAewYxF+n9gTMEV6hJbPDplx9hIO+gYjSlkSuAloSsrGPJSEAB+EPW6FMLa08dEc2FHBNU9xdlx2+WzEs6BTodohmm1LTuiHlf7qDnSzl3ejXWg3dYc/snLTVUEI5g4XnnaO8Ym8pwdyXTZJZ0J6vrv5gGjBwGM0rE0QyRvgqj8NDNjqb/eg+gFsyCBTstlcwEz835AZHovI5aG5k+WHQlHxxfbc9hhsafcS57L9gTKy6k0fPESe6ER/X+rRNinnDIftYSMB7gTyj5RFPT1d621gSJU39dhbUjgYsOuNO6rGLg5rzvPU2lc4Uo13zwVaGdgeMja417ZcU6ELgHRSN12EU2Vmjn4o4lPsACcCbXxe5DdTiglgbmpO8fzGUCuvN9rhI4sLWVthmsUEwgSmz8hAcvRkFA6zEhS2AVcIlVe8ONNljokstQi/ycUNB3XY73DUb5XgCfQailKdSBFZq88y+IsKs15YZXMyB1JZBHnMFkcaQEVvUCnt2OtOuoQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(83380400001)(54906003)(6916009)(19627235002)(316002)(2906002)(82310400004)(1076003)(8676002)(36756003)(70586007)(70206006)(16526019)(356005)(2616005)(508600001)(81166007)(86362001)(47076005)(30864003)(4326008)(7696005)(26005)(336012)(426003)(8936002)(36860700001)(6666004)(5660300002)(186003)(40460700003)(36900700001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 16:59:11.4431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07867320-60b1-47b8-9359-08d9f2fffc7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
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
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Harry Wentland <Harry.Wentland@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Qingqing Zhuo <qingqing.zhuo@amd.com>

Clk and SMU interfaces for DCN 3.1.5.

Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Acked-by: Harry Wentland <Harry.Wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |   9 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |  23 +-
 .../dc/clk_mgr/dcn315/dcn315_clk_mgr.c        | 607 ++++++++++++++++++
 .../dc/clk_mgr/dcn315/dcn315_clk_mgr.h        |  49 ++
 .../display/dc/clk_mgr/dcn315/dcn315_smu.c    | 329 ++++++++++
 .../display/dc/clk_mgr/dcn315/dcn315_smu.h    | 126 ++++
 6 files changed, 1141 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index 3bf8ef9373e8..817871917632 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -154,6 +154,15 @@ AMD_DAL_CLK_MGR_DCN31 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn31/,$(CLK_MGR_DC
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN31)
 
+###############################################################################
+# DCN315
+###############################################################################
+CLK_MGR_DCN315 = dcn315_smu.o dcn315_clk_mgr.o
+
+AMD_DAL_CLK_MGR_DCN315 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn315/,$(CLK_MGR_DCN315))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN315)
+
 ###############################################################################
 # DCN316
 ###############################################################################
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index 0a608bd4bd61..772bffda68cc 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -43,6 +43,7 @@
 #include "dcn30/dcn30_clk_mgr.h"
 #include "dcn301/vg_clk_mgr.h"
 #include "dcn31/dcn31_clk_mgr.h"
+#include "dcn315/dcn315_clk_mgr.h"
 #include "dcn316/dcn316_clk_mgr.h"
 
 
@@ -290,6 +291,19 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 		dcn31_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 		return &clk_mgr->base.base;
 	}
+		break;
+	case AMDGPU_FAMILY_GC_10_3_6: {
+		struct clk_mgr_dcn315 *clk_mgr = kzalloc(sizeof(*clk_mgr), GFP_KERNEL);
+
+		if (clk_mgr == NULL) {
+			BREAK_TO_DEBUGGER();
+			return NULL;
+		}
+
+		dcn315_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+		return &clk_mgr->base.base;
+	}
+		break;
 	case AMDGPU_FAMILY_GC_10_3_7: {
 		struct clk_mgr_dcn316 *clk_mgr = kzalloc(sizeof(*clk_mgr), GFP_KERNEL);
 
@@ -301,6 +315,7 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 		dcn316_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 		return &clk_mgr->base.base;
 	}
+		break;
 #endif
 
 	default:
@@ -334,11 +349,15 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 		break;
 
 	case FAMILY_YELLOW_CARP:
-			dcn31_clk_mgr_destroy(clk_mgr);
+		dcn31_clk_mgr_destroy(clk_mgr);
+		break;
+
+	case AMDGPU_FAMILY_GC_10_3_6:
+		dcn315_clk_mgr_destroy(clk_mgr);
 		break;
 
 	case AMDGPU_FAMILY_GC_10_3_7:
-			dcn316_clk_mgr_destroy(clk_mgr);
+		dcn316_clk_mgr_destroy(clk_mgr);
 		break;
 
 	default:
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
new file mode 100644
index 000000000000..90c265275f93
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -0,0 +1,607 @@
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
+ * Authors: AMD
+ *
+ */
+
+
+
+#include "dccg.h"
+#include "clk_mgr_internal.h"
+
+// For dce12_get_dp_ref_freq_khz
+#include "dce100/dce_clk_mgr.h"
+// For dcn20_update_clocks_update_dpp_dto
+#include "dcn20/dcn20_clk_mgr.h"
+#include "dcn31/dcn31_clk_mgr.h"
+#include "dcn315_clk_mgr.h"
+
+#include "core_types.h"
+#include "dcn315_smu.h"
+#include "dm_helpers.h"
+
+#include "dc_dmub_srv.h"
+
+#if defined (CONFIG_DRM_AMD_DC_DP2_0)
+#include "dc_link_dp.h"
+#endif
+
+#define TO_CLK_MGR_DCN315(clk_mgr)\
+	container_of(clk_mgr, struct clk_mgr_dcn315, base)
+
+static int dcn315_get_active_display_cnt_wa(
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
+	/* WA for hang on HDMI after display off back back on*/
+	if (display_count == 0 && tmds_present)
+		display_count = 1;
+
+	return display_count;
+}
+
+static void dcn315_disable_otg_wa(struct clk_mgr *clk_mgr_base, bool disable)
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
+			if (disable)
+				pipe->stream_res.tg->funcs->immediate_disable_crtc(pipe->stream_res.tg);
+			else
+				pipe->stream_res.tg->funcs->enable_crtc(pipe->stream_res.tg);
+		}
+	}
+}
+
+static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
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
+	clk_mgr_base->clks.zstate_support = new_clocks->zstate_support;
+	/*
+	 * if it is safe to lower, but we are already in the lower state, we don't have to do anything
+	 * also if safe to lower is false, we just go in the higher state
+	 */
+	clk_mgr_base->clks.zstate_support = new_clocks->zstate_support;
+	if (safe_to_lower) {
+		/* check that we're not already in lower */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_LOW_POWER) {
+			display_count = dcn315_get_active_display_cnt_wa(dc, context);
+			/* if we can go lower, go lower */
+			if (display_count == 0) {
+				union display_idle_optimization_u idle_info = { 0 };
+				idle_info.idle_info.df_request_disabled = 1;
+				idle_info.idle_info.phy_ref_clk_off = 1;
+				dcn315_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
+				/* update power state */
+				clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_LOW_POWER;
+			}
+		}
+	} else {
+		/* check that we're not already in D0 */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_MISSION_MODE) {
+			union display_idle_optimization_u idle_info = { 0 };
+			dcn315_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
+			/* update power state */
+			clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_MISSION_MODE;
+		}
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
+		clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
+		dcn315_smu_set_hard_min_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_khz);
+	}
+
+	if (should_set_clock(safe_to_lower,
+			new_clocks->dcfclk_deep_sleep_khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
+		clk_mgr_base->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
+		dcn315_smu_set_min_deep_sleep_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_deep_sleep_khz);
+	}
+
+	// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
+	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
+		if (new_clocks->dppclk_khz < 100000)
+			new_clocks->dppclk_khz = 100000;
+		if (new_clocks->dispclk_khz < 100000)
+			new_clocks->dispclk_khz = 100000;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
+		if (clk_mgr->base.clks.dppclk_khz > new_clocks->dppclk_khz)
+			dpp_clock_lowered = true;
+		clk_mgr_base->clks.dppclk_khz = new_clocks->dppclk_khz;
+		update_dppclk = true;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
+		dcn315_disable_otg_wa(clk_mgr_base, true);
+
+		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
+		dcn315_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
+		dcn315_disable_otg_wa(clk_mgr_base, false);
+
+		update_dispclk = true;
+	}
+
+	if (dpp_clock_lowered) {
+		// increase per DPP DTO before lowering global dppclk
+		dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+		dcn315_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+	} else {
+		// increase global DPPCLK before lowering per DPP DTO
+		if (update_dppclk || update_dispclk)
+			dcn315_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+		// always update dtos unless clock is lowered and not safe to lower
+		if (new_clocks->dppclk_khz >= dc->current_state->bw_ctx.bw.dcn.clk.dppclk_khz)
+			dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
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
+	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+}
+
+static void dcn315_dump_clk_registers(struct clk_state_registers_and_bypass *regs_and_bypass,
+		struct clk_mgr *clk_mgr_base, struct clk_log_info *log_info)
+{
+	return;
+}
+
+static struct clk_bw_params dcn315_bw_params = {
+	.vram_type = Ddr4MemType,
+	.num_channels = 1,
+	.clk_table = {
+		.num_entries = 5,
+	},
+
+};
+
+static struct wm_table ddr5_wm_table = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 64.0,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 64.0,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 64.0,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 64.0,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
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
+static DpmClocks_315_t dummy_clocks;
+
+static struct dcn315_watermarks dummy_wms = { 0 };
+
+static void dcn315_build_watermark_ranges(struct clk_bw_params *bw_params, struct dcn315_watermarks *table)
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
+static void dcn315_notify_wm_ranges(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct clk_mgr_dcn315 *clk_mgr_dcn315 = TO_CLK_MGR_DCN315(clk_mgr);
+	struct dcn315_watermarks *table = clk_mgr_dcn315->smu_wm_set.wm_set;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || clk_mgr_dcn315->smu_wm_set.mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn315_build_watermark_ranges(clk_mgr_base->bw_params, table);
+
+	dcn315_smu_set_dram_addr_high(clk_mgr,
+			clk_mgr_dcn315->smu_wm_set.mc_address.high_part);
+	dcn315_smu_set_dram_addr_low(clk_mgr,
+			clk_mgr_dcn315->smu_wm_set.mc_address.low_part);
+	dcn315_smu_transfer_wm_table_dram_2_smu(clk_mgr);
+}
+
+static void dcn315_get_dpm_table_from_smu(struct clk_mgr_internal *clk_mgr,
+		struct dcn315_smu_dpm_clks *smu_dpm_clks)
+{
+	DpmClocks_315_t *table = smu_dpm_clks->dpm_clks;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || smu_dpm_clks->mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn315_smu_set_dram_addr_high(clk_mgr,
+			smu_dpm_clks->mc_address.high_part);
+	dcn315_smu_set_dram_addr_low(clk_mgr,
+			smu_dpm_clks->mc_address.low_part);
+	dcn315_smu_transfer_dpm_table_smu_2_dram(clk_mgr);
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
+static unsigned int find_dfpstate_for_voltage(
+		const DfPstateTable_t table[],
+		unsigned int NumDfPstatesEnabled,
+		unsigned int voltage)
+{
+	int i;
+	unsigned int minVoltage = table[0].Voltage;
+	unsigned int minlevel = 0;
+
+	for (i = 1; i < NumDfPstatesEnabled; i++) {
+		if (table[i].Voltage >= voltage && minVoltage > table[i].Voltage) {
+			minVoltage = table[i].Voltage;
+			minlevel = i;
+		}
+	}
+
+	return minlevel;
+}
+
+void dcn315_clk_mgr_helper_populate_bw_params(
+		struct clk_mgr_internal *clk_mgr,
+		struct integrated_info *bios_info,
+		const DpmClocks_315_t *clock_table)
+{
+	int i, num_clk_lvl;
+	struct clk_bw_params *bw_params = clk_mgr->base.bw_params;
+	uint32_t max_dispclk = 0, max_dppclk = 0;
+
+	num_clk_lvl = clock_table->NumDcfClkLevelsEnabled;
+
+	ASSERT(num_clk_lvl <= MAX_NUM_DPM_LVL);
+
+	if (num_clk_lvl == 0 || clock_table->DcfClocks[0] == 0) {
+		/* clock table is no good, just use our own hardcode */
+		ASSERT(0);
+		return;
+	}
+
+	bw_params->clk_table.num_entries = num_clk_lvl;
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
+	for (i = 0; i < bw_params->clk_table.num_entries; i++) {
+		int j = find_dfpstate_for_voltage(clock_table->DfPstateTable, clock_table->NumDfPstatesEnabled, clock_table->SocVoltage[i]);
+
+		bw_params->clk_table.entries[i].fclk_mhz = clock_table->DfPstateTable[j].FClk;
+		bw_params->clk_table.entries[i].memclk_mhz = clock_table->DfPstateTable[j].MemClk;
+		bw_params->clk_table.entries[i].voltage = clock_table->DfPstateTable[j].Voltage;
+		bw_params->clk_table.entries[i].wck_ratio = 1;
+		bw_params->clk_table.entries[i].dcfclk_mhz = clock_table->DcfClocks[i];
+		bw_params->clk_table.entries[i].socclk_mhz = clock_table->SocClocks[i];
+		bw_params->clk_table.entries[i].dispclk_mhz = max_dispclk;
+		bw_params->clk_table.entries[i].dppclk_mhz = max_dppclk;
+	}
+
+	bw_params->vram_type = bios_info->memory_type;
+	bw_params->num_channels = bios_info->ma_channel_number;
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
+static void dcn315_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	dcn315_smu_enable_pme_wa(clk_mgr);
+}
+
+static struct clk_mgr_funcs dcn315_funcs = {
+	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
+	.update_clocks = dcn315_update_clocks,
+	.init_clocks = dcn31_init_clocks,
+	.enable_pme_wa = dcn315_enable_pme_wa,
+	.are_clock_states_equal = dcn31_are_clock_states_equal,
+	.notify_wm_ranges = dcn315_notify_wm_ranges
+};
+extern struct clk_mgr_funcs dcn3_fpga_funcs;
+
+void dcn315_clk_mgr_construct(
+		struct dc_context *ctx,
+		struct clk_mgr_dcn315 *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg)
+{
+	struct dcn315_smu_dpm_clks smu_dpm_clks = { 0 };
+
+	clk_mgr->base.base.ctx = ctx;
+	clk_mgr->base.base.funcs = &dcn315_funcs;
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
+	clk_mgr->smu_wm_set.wm_set = (struct dcn315_watermarks *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(struct dcn315_watermarks),
+				&clk_mgr->smu_wm_set.mc_address.quad_part);
+
+	if (!clk_mgr->smu_wm_set.wm_set) {
+		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
+		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
+	}
+	ASSERT(clk_mgr->smu_wm_set.wm_set);
+
+	smu_dpm_clks.dpm_clks = (DpmClocks_315_t *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(DpmClocks_315_t),
+				&smu_dpm_clks.mc_address.quad_part);
+
+	if (smu_dpm_clks.dpm_clks == NULL) {
+		smu_dpm_clks.dpm_clks = &dummy_clocks;
+		smu_dpm_clks.mc_address.quad_part = 0;
+	}
+
+	ASSERT(smu_dpm_clks.dpm_clks);
+
+	if (IS_FPGA_MAXIMUS_DC(ctx->dce_environment)) {
+		clk_mgr->base.base.funcs = &dcn3_fpga_funcs;
+	} else {
+		struct clk_log_info log_info = {0};
+
+		clk_mgr->base.smu_ver = dcn315_smu_get_smu_version(&clk_mgr->base);
+
+		if (clk_mgr->base.smu_ver > 0)
+			clk_mgr->base.smu_present = true;
+
+		if (ctx->dc_bios->integrated_info->memory_type == LpDdr5MemType) {
+			dcn315_bw_params.wm_table = lpddr5_wm_table;
+		} else {
+			dcn315_bw_params.wm_table = ddr5_wm_table;
+		}
+		/* Saved clocks configured at boot for debug purposes */
+		 dcn315_dump_clk_registers(&clk_mgr->base.base.boot_snapshot, &clk_mgr->base.base, &log_info);
+
+	}
+
+	clk_mgr->base.base.dprefclk_khz = 600000;
+	clk_mgr->base.dccg->ref_dtbclk_khz = 600000;
+	dce_clock_read_ss_info(&clk_mgr->base);
+
+	clk_mgr->base.base.bw_params = &dcn315_bw_params;
+
+	if (clk_mgr->base.base.ctx->dc->debug.pstate_enabled) {
+		dcn315_get_dpm_table_from_smu(&clk_mgr->base, &smu_dpm_clks);
+
+		if (ctx->dc_bios && ctx->dc_bios->integrated_info) {
+			dcn315_clk_mgr_helper_populate_bw_params(
+					&clk_mgr->base,
+					ctx->dc_bios->integrated_info,
+					smu_dpm_clks.dpm_clks);
+		}
+	}
+
+	if (smu_dpm_clks.dpm_clks && smu_dpm_clks.mc_address.quad_part != 0)
+		dm_helpers_free_gpu_mem(clk_mgr->base.base.ctx, DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				smu_dpm_clks.dpm_clks);
+}
+
+void dcn315_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr_int)
+{
+	struct clk_mgr_dcn315 *clk_mgr = TO_CLK_MGR_DCN315(clk_mgr_int);
+
+	if (clk_mgr->smu_wm_set.wm_set && clk_mgr->smu_wm_set.mc_address.quad_part != 0)
+		dm_helpers_free_gpu_mem(clk_mgr_int->base.ctx, DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				clk_mgr->smu_wm_set.wm_set);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h
new file mode 100644
index 000000000000..ac36ddf5dd1a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h
@@ -0,0 +1,49 @@
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DCN315_CLK_MGR_H__
+#define __DCN315_CLK_MGR_H__
+#include "clk_mgr_internal.h"
+
+struct dcn315_watermarks;
+
+struct dcn315_smu_watermark_set {
+	struct dcn315_watermarks *wm_set;
+	union large_integer mc_address;
+};
+
+struct clk_mgr_dcn315 {
+	struct clk_mgr_internal base;
+	struct dcn315_smu_watermark_set smu_wm_set;
+};
+
+void dcn315_clk_mgr_construct(struct dc_context *ctx,
+		struct clk_mgr_dcn315 *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg);
+
+void dcn315_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr_int);
+
+#endif //__DCN315_CLK_MGR_H__
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
new file mode 100644
index 000000000000..a60543258a5b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
@@ -0,0 +1,329 @@
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
+ * Authors: AMD
+ *
+ */
+
+#include "core_types.h"
+#include "clk_mgr_internal.h"
+#include "reg_helper.h"
+#include "dm_helpers.h"
+#include "dcn315_smu.h"
+#include "mp/mp_13_0_5_offset.h"
+
+#define MAX_INSTANCE                                        6
+#define MAX_SEGMENT                                         6
+
+struct IP_BASE_INSTANCE
+{
+    unsigned int segment[MAX_SEGMENT];
+};
+
+struct IP_BASE
+{
+    struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
+};
+
+static const struct IP_BASE MP0_BASE = { { { { 0x00016000, 0x00DC0000, 0x00E00000, 0x00E40000, 0x0243FC00, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE NBIO_BASE = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x0241B000, 0x04040000 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+
+#define regBIF_BX_PF2_RSMU_INDEX                                                                        0x0000
+#define regBIF_BX_PF2_RSMU_INDEX_BASE_IDX                                                               1
+#define regBIF_BX_PF2_RSMU_DATA                                                                         0x0001
+#define regBIF_BX_PF2_RSMU_DATA_BASE_IDX                                                                1
+
+#define REG(reg_name) \
+	(MP0_BASE.instance[0].segment[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
+
+#define FN(reg_name, field) \
+	FD(reg_name##__##field)
+
+#define REG_NBIO(reg_name) \
+	(NBIO_BASE.instance[0].segment[regBIF_BX_PF2_ ## reg_name ## _BASE_IDX] + regBIF_BX_PF2_ ## reg_name)
+
+#define mmMP1_C2PMSG_3                            0x3B1050C
+
+#define VBIOSSMC_MSG_TestMessage                  0x01 ///< To check if PMFW is alive and responding. Requirement specified by PMFW team
+#define VBIOSSMC_MSG_GetPmfwVersion               0x02 ///< Get PMFW version
+#define VBIOSSMC_MSG_Spare0                       0x03 ///< Spare0
+#define VBIOSSMC_MSG_SetDispclkFreq               0x04 ///< Set display clock frequency in MHZ
+#define VBIOSSMC_MSG_Spare1                       0x05 ///< Spare1
+#define VBIOSSMC_MSG_SetDppclkFreq                0x06 ///< Set DPP clock frequency in MHZ
+#define VBIOSSMC_MSG_SetHardMinDcfclkByFreq       0x07 ///< Set DCF clock frequency hard min in MHZ
+#define VBIOSSMC_MSG_SetMinDeepSleepDcfclk        0x08 ///< Set DCF clock minimum frequency in deep sleep in MHZ
+#define VBIOSSMC_MSG_SetPhyclkVoltageByFreq       0x09 ///< Set display phy clock frequency in MHZ in case VMIN does not support phy frequency
+#define VBIOSSMC_MSG_GetFclkFrequency             0x0A ///< Get FCLK frequency, return frequemcy in MHZ
+#define VBIOSSMC_MSG_SetDisplayCount              0x0B ///< Inform PMFW of number of display connected
+#define VBIOSSMC_MSG_EnableTmdp48MHzRefclkPwrDown 0x0C ///< To ask PMFW turn off TMDP 48MHz refclk during display off to save power
+#define VBIOSSMC_MSG_UpdatePmeRestore             0x0D ///< To ask PMFW to write into Azalia for PME wake up event
+#define VBIOSSMC_MSG_SetVbiosDramAddrHigh         0x0E ///< Set DRAM address high 32 bits for WM table transfer
+#define VBIOSSMC_MSG_SetVbiosDramAddrLow          0x0F ///< Set DRAM address low 32 bits for WM table transfer
+#define VBIOSSMC_MSG_TransferTableSmu2Dram        0x10 ///< Transfer table from PMFW SRAM to system DRAM
+#define VBIOSSMC_MSG_TransferTableDram2Smu        0x11 ///< Transfer table from system DRAM to PMFW
+#define VBIOSSMC_MSG_SetDisplayIdleOptimizations  0x12 ///< Set Idle state optimization for display off
+#define VBIOSSMC_MSG_GetDprefclkFreq              0x13 ///< Get DPREF clock frequency. Return in MHZ
+#define VBIOSSMC_Message_Count                    0x14 ///< Total number of VBIS and DAL messages
+
+#define VBIOSSMC_Status_BUSY                      0x0
+#define VBIOSSMC_Result_OK                        0x01 ///< Message Response OK
+#define VBIOSSMC_Result_Failed                    0xFF ///< Message Response Failed
+#define VBIOSSMC_Result_UnknownCmd                0xFE ///< Message Response Unknown Command
+#define VBIOSSMC_Result_CmdRejectedPrereq         0xFD ///< Message Response Command Failed Prerequisite
+#define VBIOSSMC_Result_CmdRejectedBusy           0xFC ///< Message Response Command Rejected due to PMFW is busy. Sender should retry sending this message
+
+/*
+ * Function to be used instead of REG_WAIT macro because the wait ends when
+ * the register is NOT EQUAL to zero, and because the translation in msg_if.h
+ * won't work with REG_WAIT.
+ */
+static uint32_t dcn315_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsigned int delay_us, unsigned int max_retries)
+{
+	uint32_t res_val = VBIOSSMC_Status_BUSY;
+
+	do {
+		res_val = REG_READ(MP1_SMN_C2PMSG_38);
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
+int dcn315_smu_send_msg_with_param(
+		struct clk_mgr_internal *clk_mgr,
+		unsigned int msg_id, unsigned int param)
+{
+	uint32_t result;
+
+	result = dcn315_smu_wait_for_response(clk_mgr, 10, 200000);
+	ASSERT(result == VBIOSSMC_Result_OK);
+
+	if (result == VBIOSSMC_Status_BUSY) {
+		return -1;
+	}
+
+	/* First clear response register */
+	REG_WRITE(MP1_SMN_C2PMSG_38, VBIOSSMC_Status_BUSY);
+
+	/* Set the parameter register for the SMU message, unit is Mhz */
+	REG_WRITE(MP1_SMN_C2PMSG_37, param);
+
+	/* Trigger the message transaction by writing the message ID */
+	generic_write_indirect_reg(CTX,
+		REG_NBIO(RSMU_INDEX), REG_NBIO(RSMU_DATA),
+		mmMP1_C2PMSG_3, msg_id);
+
+	result = dcn315_smu_wait_for_response(clk_mgr, 10, 200000);
+
+	if (result == VBIOSSMC_Status_BUSY) {
+		ASSERT(0);
+		dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
+	}
+
+	return REG_READ(MP1_SMN_C2PMSG_37);
+}
+
+int dcn315_smu_get_smu_version(struct clk_mgr_internal *clk_mgr)
+{
+	return dcn315_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_GetPmfwVersion,
+			0);
+}
+
+
+int dcn315_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz)
+{
+	int actual_dispclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dispclk_khz;
+
+	/*  Unit of SMU msg parameter is Mhz */
+	actual_dispclk_set_mhz = dcn315_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDispclkFreq,
+			khz_to_mhz_ceil(requested_dispclk_khz));
+
+	return actual_dispclk_set_mhz * 1000;
+}
+int dcn315_smu_set_voltage_via_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phyclk_khz)
+{
+	int actual_phypclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present && requested_phyclk_khz)
+		return requested_phyclk_khz;
+
+	/*  Unit of SMU msg parameter is Mhz */
+	actual_phypclk_set_mhz = dcn315_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetPhyclkVoltageByFreq,
+			khz_to_mhz_ceil(requested_phyclk_khz));
+
+	return actual_phypclk_set_mhz * 1000;
+}
+
+int dcn315_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz)
+{
+	int actual_dcfclk_set_mhz = -1;
+
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dcfclk_khz;
+
+	actual_dcfclk_set_mhz = dcn315_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetHardMinDcfclkByFreq,
+			khz_to_mhz_ceil(requested_dcfclk_khz));
+
+	return actual_dcfclk_set_mhz * 1000;
+}
+
+int dcn315_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz)
+{
+	int actual_min_ds_dcfclk_mhz = -1;
+
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_min_ds_dcfclk_khz;
+
+	actual_min_ds_dcfclk_mhz = dcn315_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetMinDeepSleepDcfclk,
+			khz_to_mhz_ceil(requested_min_ds_dcfclk_khz));
+
+	return actual_min_ds_dcfclk_mhz * 1000;
+}
+
+int dcn315_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz)
+{
+	int actual_dppclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dpp_khz;
+
+	actual_dppclk_set_mhz = dcn315_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDppclkFreq,
+			khz_to_mhz_ceil(requested_dpp_khz));
+
+	return actual_dppclk_set_mhz * 1000;
+}
+
+void dcn315_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info)
+{
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	//TODO: Work with smu team to define optimization options.
+	dcn315_smu_send_msg_with_param(
+		clk_mgr,
+		VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+		idle_info);
+}
+
+void dcn315_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable)
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
+	dcn315_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+			idle_info.data);
+}
+
+void dcn315_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn315_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_UpdatePmeRestore,
+			0);
+}
+void dcn315_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn315_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrHigh, addr_high);
+}
+
+void dcn315_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn315_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrLow, addr_low);
+}
+
+void dcn315_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn315_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableSmu2Dram, TABLE_DPMCLOCKS);
+}
+
+void dcn315_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn315_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableDram2Smu, TABLE_WATERMARKS);
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h
new file mode 100644
index 000000000000..96ec6bfcad22
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h
@@ -0,0 +1,126 @@
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef DAL_DC_315_SMU_H_
+#define DAL_DC_315_SMU_H_
+#include "os_types.h"
+
+#define PMFW_DRIVER_IF_VERSION 4
+
+#define NUM_DCFCLK_DPM_LEVELS   4
+#define NUM_DISPCLK_DPM_LEVELS  4
+#define NUM_DPPCLK_DPM_LEVELS   4
+#define NUM_SOCCLK_DPM_LEVELS   4
+#define NUM_VCN_DPM_LEVELS      4
+#define NUM_SOC_VOLTAGE_LEVELS  4
+#define NUM_DF_PSTATE_LEVELS    4
+
+typedef struct {
+  uint16_t MinClock; // This is either DCFCLK or SOCCLK (in MHz)
+  uint16_t MaxClock; // This is either DCFCLK or SOCCLK (in MHz)
+  uint16_t MinMclk;
+  uint16_t MaxMclk;
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
+  uint32_t FClk;
+  uint32_t MemClk;
+  uint32_t Voltage;
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
+  uint8_t  NumDcfClkLevelsEnabled;
+  uint8_t  NumDispClkLevelsEnabled; //Applies to both Dispclk and Dppclk
+  uint8_t  NumSocClkLevelsEnabled;
+  uint8_t  VcnClkLevelsEnabled;     //Applies to both Vclk and Dclk
+  uint8_t  NumDfPstatesEnabled;
+  uint8_t  spare[3];
+  uint32_t MinGfxClk;
+  uint32_t MaxGfxClk;
+} DpmClocks_315_t;
+
+struct dcn315_watermarks {
+  // Watermarks
+  WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+  uint32_t MmHubPadding[7]; // SMU internal use
+};
+
+struct dcn315_smu_dpm_clks {
+	DpmClocks_315_t *dpm_clks;
+	union large_integer mc_address;
+};
+
+#define TABLE_WATERMARKS         1 // Called by DAL through VBIOS
+#define TABLE_DPMCLOCKS          4 // Called by Driver and VBIOS
+
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
+int dcn315_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
+int dcn315_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
+int dcn315_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz);
+int dcn315_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz);
+int dcn315_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz);
+void dcn315_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info);
+void dcn315_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable);
+void dcn315_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high);
+void dcn315_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low);
+void dcn315_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr);
+void dcn315_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr);
+void dcn315_smu_request_voltage_via_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phyclk_khz);
+void dcn315_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr);
+#endif /* DAL_DC_315_SMU_H_ */
-- 
2.35.1


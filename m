Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B89342B9
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2024 21:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED33C10E3B7;
	Wed, 17 Jul 2024 19:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="12QYq9WZ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C31610E141
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2024 19:40:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCEEwFRhB2c4J7EO/Qh2sZNnDQVYZRJ8IcT6bEOvY/urH9hZl+OKuJFZEG+y7BARm0N2ygtXuqdQvGNTcodv+MjNlWGBa0Lra5FF5sVFzdUOAzlH8tgl0/JbkYyCMq7OXFubFTP5F+N/d+ywGD6d62/HYVjJyd7r5OM/2Ly9vUUWKGLIZoJloF/FoaY7pyufp0iRDhz2/EFaYjJLPtopJz1wXEfdwfwoZu8M7P9qZEZx8MjtRC9Bj0Q6FfxtKBJktCTPP9O1HrFfVXaTPbYnEmAcgcwNw/bcH+HG+RGkWw2vT6t44Pc2rA1XimQg9XRfV4KmiJE1AmHoNzhiEXgUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1G+Gveq4Eie480XwEGoa34IfVr7quzKaLjnXjxiiqHU=;
 b=ViAakL11BbAvrlQ9Sx4BFgOYkVDcbpgbENAaoqYbBi9rQWNSXuxU5OZag3muxB3A/Xzm58IFwqbO6o/ZRwokgyT1Y4HB4HzGAWG2iTlHUFkt6ZE3rBQB30Ip845vA/GcRPPqEW/Bkxw0G8GisTHZFs89Rq8oaLVK1Oax5/+RgwJdn96YjF8yboGxpicUVB+D70vGhUwhsAEpC2mZiH+QmPx/FomFPYptxD3eRmVlcBX0NfNKgb6Z4tzb44qBC7FuQvOGWmiukYZ0MiprgsQPRFiMxLK2W5aEtv36ruV3iu3fbpZfzYtkeLKnwo1NQil7mXbot46s0qx/nIw5KG6ILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1G+Gveq4Eie480XwEGoa34IfVr7quzKaLjnXjxiiqHU=;
 b=12QYq9WZYDj1ZHBtoN+w1Eo802g5Ov3LkBHM0cndlD1qYP0qsXEOeO26w1+iN7sXkHwN8bS3L+ONk0CC+niCikw/jzRAihIch7NIsxE9A8UHDZzc/0/wuwwz8Wyjnyxk28youNg2o4kF0fBC55s6PcgfQ3HbaSra6r1XmAPm/JE=
Received: from CH2PR17CA0025.namprd17.prod.outlook.com (2603:10b6:610:53::35)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 19:40:23 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::6a) by CH2PR17CA0025.outlook.office365.com
 (2603:10b6:610:53::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Wed, 17 Jul 2024 19:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 17 Jul 2024 19:40:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 14:40:21 -0500
Received: from debian.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 14:40:11 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, <zaeem.mohamed@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Subject: [PATCH 11/22] drm/amd/display: rename dcn3/dcn4 to more sound terms
Date: Wed, 17 Jul 2024 19:38:50 +0000
Message-ID: <20240717193901.8821-12-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717193901.8821-1-aurabindo.pillai@amd.com>
References: <20240717193901.8821-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d4536c-13fc-4bc9-518e-08dca6984c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ulSqXMRwJ6bOZDVZgeyTwvL76HrmEZe2f+A9BWq6z8v9ic3cPqgQvb/kU4dZ?=
 =?us-ascii?Q?LHcIvdLBSqbBPms+IsPkn9tPGOfVmVsO4cdXt1LqnuugXgY6S53/TLldOU26?=
 =?us-ascii?Q?OiCGn5tX4NaAqW3rtrrm70q30Q35JXHdYXGpitllNyrXTB1zOauoh8HEs3Sa?=
 =?us-ascii?Q?7Yfey33Fxg4lyP2nsjJ8qKFVhgV7u5NyiUxXckbp8Zc4ADPWv4oFkVRXJte1?=
 =?us-ascii?Q?51bsClzID2ThnS3EQF5qzMfLChAQRnR56KPhL/NgDnjMpoJPor7Mtqjs/Zm5?=
 =?us-ascii?Q?vLsmlJO1NN7TTu7bCBBTFm968xW8mvkRwf7a0k8kEB0cT/YcX1LYK1rea1tA?=
 =?us-ascii?Q?MaRYtdZXxPgZ/S1BUN4Pu5AgYTGJguEKfw9ZfKtVtH7aCCTT1dFp1W+7u7yg?=
 =?us-ascii?Q?iZyoGN0f+iF/bwVkac087ozOOWkqI4f6f/+rzC/BnKwey/utL4R4N6hnPNi1?=
 =?us-ascii?Q?WRLuX9/Ja8vS6RAR8flYantg34UMIdh3BoFbXlNXz9phr/gOvG6Oo1lEY34g?=
 =?us-ascii?Q?dBkyLiyX+VZ8aRacE8Vt5NF8hmwd9W0tBSbfrP/nY+0kfw4onVuwqcynve8H?=
 =?us-ascii?Q?mLrlNLV1ABuvMwGg/Eou5Q1ryXc/1hjhDryLFZxCCbLs47JBZ80GWGWW2kx1?=
 =?us-ascii?Q?lWvku12yDoT18MWEzs81bdsbpwZvOoeh3oQPOa1au8uoOBlfncNqxB+2ncN4?=
 =?us-ascii?Q?eRTkRyGb141gYY8v7LkTDnmpgBlrVxsdu04xELlqG+ybdiWhv0JdebOzwxuy?=
 =?us-ascii?Q?VJNWTI2k2qWXWhCJ609AdU3+ggKq6gU3CHi+wmPgNfHiledy0n+PuAzbYAww?=
 =?us-ascii?Q?HVF18kwF8H0CDiZiuuLe7SDAzbWjJUpg6+X9cMDxJ0Lkr56fBZ+38dDXNZdO?=
 =?us-ascii?Q?Au5T/JYmwl1K/52L1tBWa40wl3CLdyi2WwxnYPT7/n8sezvovA4lLnRnSFVx?=
 =?us-ascii?Q?1ZzVTtUi2sVkjiWZbGiOgti4uvdOe+WZJRiOPd0XaeM3RxGYCt/JgJSWDCH0?=
 =?us-ascii?Q?BerWHaNNpXTIqV1f6P+D/rHjY/u26AYHs/JPwU2D2yfyr3Lks8/MshqlH2LJ?=
 =?us-ascii?Q?CZFjyAX6UjamCrSLm8n3dbcbRYUj5i9ykBK6lyPCsYBOw0AbBYU6sujykr+E?=
 =?us-ascii?Q?sLvEJF9sggM302JjS+0IZx3nvQ8vyv45rOa8zBQT9dq/1t/gSiqDr6QFkdr2?=
 =?us-ascii?Q?tTnbBBVAERq19/6/DqwOPmmkpXtVNoBZ1J5tuwTleJ5ZaZVhe7B035krFyKn?=
 =?us-ascii?Q?/u38cymvGVGxnbVq08i3Ny2Iz6M1QXyvd2K/D4oFQeBy8ORtEQY+jF6H09Es?=
 =?us-ascii?Q?XP8bdKI4XH4OT2Hh9Kh+6tEDLvBgXMQ7eQt4mqyho+Dx3/mlwdZK0jydvGQT?=
 =?us-ascii?Q?8LFfvIDg4wpT+4Q00kKRTS8c0uyFvaC4nptYPOL95FzUkIsxagDriojw859m?=
 =?us-ascii?Q?biDkGi7lQ+RURMaeB9LSmTy6ldOETwcK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:40:22.7784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d4536c-13fc-4bc9-518e-08dca6984c86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Use more accurate names to refer to the asic architecture.
dcn3 in DML actually refers to DCN32 and DCN321, so rename it to dcn32x
dcn4 refers to any DCN4x soc., and hence rename dcn4 to dcn4x

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 .../dc/dml2/dml21/dml21_translation_helper.c  |  36 +-
 .../amd/display/dc/dml2/dml21/dml21_utils.c   |   2 +-
 .../dml21/inc/bounding_boxes/dcn3_soc_bb.h    |   8 +-
 .../dml21/inc/bounding_boxes/dcn4_soc_bb.h    |   8 +-
 .../dml21/inc/dml_top_soc_parameter_types.h   |  10 +-
 .../display/dc/dml2/dml21/inc/dml_top_types.h |  10 +-
 .../dml2/dml21/src/dml2_core/dml2_core_dcn4.c |   2 +-
 .../src/dml2_core/dml2_core_dcn4_calcs.c      | 186 ++++-----
 .../dml21/src/dml2_core/dml2_core_shared.c    | 192 ++++-----
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c | 130 +++----
 .../display/dc/hubbub/dcn401/dcn401_hubbub.c  | 364 +++++++++---------
 .../gpu/drm/amd/display/dc/inc/hw/mem_input.h |   2 +-
 12 files changed, 475 insertions(+), 475 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index 9fdb209bcab2..ec663c7442e5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -1027,17 +1027,17 @@ bool dml21_map_dc_state_into_dml_display_cfg(const struct dc *in_dc, struct dc_s
 void dml21_copy_clocks_to_dc_state(struct dml2_context *in_ctx, struct dc_state *context)
 {
 	/* TODO these should be the max of active, svp prefetch and idle should be tracked seperately */
-	context->bw_ctx.bw.dcn.clk.dispclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.dispclk_khz;
-	context->bw_ctx.bw.dcn.clk.dcfclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.active.dcfclk_khz;
-	context->bw_ctx.bw.dcn.clk.dramclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.active.uclk_khz;
-	context->bw_ctx.bw.dcn.clk.fclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.active.fclk_khz;
-	context->bw_ctx.bw.dcn.clk.idle_dramclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.idle.uclk_khz;
-	context->bw_ctx.bw.dcn.clk.idle_fclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.idle.fclk_khz;
-	context->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.deepsleep_dcfclk_khz;
+	context->bw_ctx.bw.dcn.clk.dispclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.dispclk_khz;
+	context->bw_ctx.bw.dcn.clk.dcfclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.active.dcfclk_khz;
+	context->bw_ctx.bw.dcn.clk.dramclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.active.uclk_khz;
+	context->bw_ctx.bw.dcn.clk.fclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.active.fclk_khz;
+	context->bw_ctx.bw.dcn.clk.idle_dramclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.idle.uclk_khz;
+	context->bw_ctx.bw.dcn.clk.idle_fclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.idle.fclk_khz;
+	context->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.deepsleep_dcfclk_khz;
 	context->bw_ctx.bw.dcn.clk.fclk_p_state_change_support = in_ctx->v21.mode_programming.programming->fclk_pstate_supported;
 	context->bw_ctx.bw.dcn.clk.p_state_change_support = in_ctx->v21.mode_programming.programming->uclk_pstate_supported;
-	context->bw_ctx.bw.dcn.clk.dtbclk_en = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.dtbrefclk_khz > 0;
-	context->bw_ctx.bw.dcn.clk.ref_dtbclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.dtbrefclk_khz;
+	context->bw_ctx.bw.dcn.clk.dtbclk_en = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.dtbrefclk_khz > 0;
+	context->bw_ctx.bw.dcn.clk.ref_dtbclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.dtbrefclk_khz;
 }
 
 void dml21_extract_legacy_watermark_set(const struct dc *in_dc, struct dcn_watermarks *watermark, enum dml2_dchub_watermark_reg_set_index reg_set_idx, struct dml2_context *in_ctx)
@@ -1068,16 +1068,16 @@ static struct dml2_dchub_watermark_regs *wm_set_index_to_dc_wm_set(union dcn_wat
 
 	switch (wm_index) {
 	case DML2_DCHUB_WATERMARK_SET_A:
-		wm_regs = &watermarks->dcn4.a;
+		wm_regs = &watermarks->dcn4x.a;
 		break;
 	case DML2_DCHUB_WATERMARK_SET_B:
-		wm_regs = &watermarks->dcn4.b;
+		wm_regs = &watermarks->dcn4x.b;
 		break;
 	case DML2_DCHUB_WATERMARK_SET_C:
-		wm_regs = &watermarks->dcn4.c;
+		wm_regs = &watermarks->dcn4x.c;
 		break;
 	case DML2_DCHUB_WATERMARK_SET_D:
-		wm_regs = &watermarks->dcn4.d;
+		wm_regs = &watermarks->dcn4x.d;
 		break;
 	case DML2_DCHUB_WATERMARK_SET_NUM:
 	default:
@@ -1125,11 +1125,11 @@ void dml21_populate_pipe_ctx_dlg_params(struct dml2_context *dml_ctx, struct dc_
 		global_sync = &stream_programming->phantom_stream.global_sync;
 	}
 
-	pipe_ctx->pipe_dlg_param.vstartup_start = global_sync->dcn4.vstartup_lines;
-	pipe_ctx->pipe_dlg_param.vupdate_offset = global_sync->dcn4.vupdate_offset_pixels;
-	pipe_ctx->pipe_dlg_param.vupdate_width = global_sync->dcn4.vupdate_vupdate_width_pixels;
-	pipe_ctx->pipe_dlg_param.vready_offset = global_sync->dcn4.vready_offset_pixels;
-	pipe_ctx->pipe_dlg_param.pstate_keepout = global_sync->dcn4.pstate_keepout_start_lines;
+	pipe_ctx->pipe_dlg_param.vstartup_start = global_sync->dcn4x.vstartup_lines;
+	pipe_ctx->pipe_dlg_param.vupdate_offset = global_sync->dcn4x.vupdate_offset_pixels;
+	pipe_ctx->pipe_dlg_param.vupdate_width = global_sync->dcn4x.vupdate_vupdate_width_pixels;
+	pipe_ctx->pipe_dlg_param.vready_offset = global_sync->dcn4x.vready_offset_pixels;
+	pipe_ctx->pipe_dlg_param.pstate_keepout = global_sync->dcn4x.pstate_keepout_start_lines;
 
 	pipe_ctx->pipe_dlg_param.otg_inst = pipe_ctx->stream_res.tg->inst;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
index ec4195336444..51d491bffa32 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
@@ -326,7 +326,7 @@ void dml21_program_dc_pipe(struct dml2_context *dml_ctx, struct dc_state *contex
 		pipe_ctx->det_buffer_size_kb = pln_prog->pipe_regs[pipe_reg_index]->det_size * 64;
 	}
 
-	pipe_ctx->plane_res.bw.dppclk_khz = pln_prog->min_clocks.dcn4.dppclk_khz;
+	pipe_ctx->plane_res.bw.dppclk_khz = pln_prog->min_clocks.dcn4x.dppclk_khz;
 	if (context->bw_ctx.bw.dcn.clk.dppclk_khz < pipe_ctx->plane_res.bw.dppclk_khz)
 		context->bw_ctx.bw.dcn.clk.dppclk_khz = pipe_ctx->plane_res.bw.dppclk_khz;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h
index 521f77b8ac44..d82c681a5402 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h
@@ -72,7 +72,7 @@ static const struct dml2_soc_qos_parameters dml_dcn31_soc_qos_params = {
 		.scaling_factor_mhz = 0,
 	},
 	.qos_params = {
-		.dcn4 = {
+		.dcn4x = {
 			.df_qos_response_time_fclk_cycles = 300,
 			.max_round_trip_to_furthest_cs_fclk_cycles = 350,
 			.mall_overhead_fclk_cycles = 50,
@@ -128,7 +128,7 @@ static const struct dml2_soc_qos_parameters dml_dcn31_soc_qos_params = {
 			},
 		},
 	},
-	.qos_type = dml2_qos_param_type_dcn4,
+	.qos_type = dml2_qos_param_type_dcn4x,
 };
 
 static const struct dml2_soc_bb dml2_socbb_dcn31 = {
@@ -228,7 +228,7 @@ static const struct dml2_soc_bb dml2_socbb_dcn31 = {
 			.scaling_factor_mhz = 0,
 		},
 		.qos_params = {
-			.dcn4 = {
+			.dcn4x = {
 				.df_qos_response_time_fclk_cycles = 300,
 				.max_round_trip_to_furthest_cs_fclk_cycles = 350,
 				.mall_overhead_fclk_cycles = 50,
@@ -332,7 +332,7 @@ static const struct dml2_soc_bb dml2_socbb_dcn31 = {
 				},
 			},
 		},
-		.qos_type = dml2_qos_param_type_dcn4,
+		.qos_type = dml2_qos_param_type_dcn4x,
 	},
 
 	.power_management_parameters = {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
index 5af94f06c667..0fe70bd0dbac 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
@@ -52,7 +52,7 @@ static const struct dml2_soc_qos_parameters dml_dcn401_soc_qos_params = {
 		.scaling_factor_mhz = 0,
 	},
 	.qos_params = {
-		.dcn4 = {
+		.dcn4x = {
 			.df_qos_response_time_fclk_cycles = 300,
 			.max_round_trip_to_furthest_cs_fclk_cycles = 350,
 			.mall_overhead_fclk_cycles = 50,
@@ -78,7 +78,7 @@ static const struct dml2_soc_qos_parameters dml_dcn401_soc_qos_params = {
 			},
 		},
 	},
-	.qos_type = dml2_qos_param_type_dcn4,
+	.qos_type = dml2_qos_param_type_dcn4x,
 };
 
 static const struct dml2_soc_bb dml2_socbb_dcn401 = {
@@ -178,7 +178,7 @@ static const struct dml2_soc_bb dml2_socbb_dcn401 = {
 			.scaling_factor_mhz = 0,
 		},
 		.qos_params = {
-			.dcn4 = {
+			.dcn4x = {
 				.df_qos_response_time_fclk_cycles = 300,
 				.max_round_trip_to_furthest_cs_fclk_cycles = 350,
 				.mall_overhead_fclk_cycles = 50,
@@ -282,7 +282,7 @@ static const struct dml2_soc_bb dml2_socbb_dcn401 = {
 				},
 			},
 		},
-		.qos_type = dml2_qos_param_type_dcn4,
+		.qos_type = dml2_qos_param_type_dcn4x,
 	},
 
 	.power_management_parameters = {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
index 99d775adc3e0..4a46b21c3e55 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
@@ -26,7 +26,7 @@ struct dml2_soc_derates {
 	struct dml2_soc_derate_values system_idle_average;
 };
 
-struct dml2_dcn3_soc_qos_params {
+struct dml2_dcn32x_soc_qos_params {
 	struct {
 		unsigned int base_latency_us;
 		unsigned int base_latency_pixel_vm_us;
@@ -52,7 +52,7 @@ struct dml2_dcn4_uclk_dpm_dependent_qos_params {
 	unsigned int average_latency_when_non_urgent_uclk_cycles;
 };
 
-struct dml2_dcn4_soc_qos_params {
+struct dml2_dcn4x_soc_qos_params {
 	unsigned int df_qos_response_time_fclk_cycles;
 	unsigned int max_round_trip_to_furthest_cs_fclk_cycles;
 	unsigned int mall_overhead_fclk_cycles;
@@ -68,7 +68,7 @@ struct dml2_dcn4_soc_qos_params {
 
 enum dml2_qos_param_type {
 	dml2_qos_param_type_dcn3,
-	dml2_qos_param_type_dcn4
+	dml2_qos_param_type_dcn4x
 };
 
 struct dml2_soc_qos_parameters {
@@ -80,8 +80,8 @@ struct dml2_soc_qos_parameters {
 	} writeback;
 
 	union {
-		struct dml2_dcn3_soc_qos_params dcn3;
-		struct dml2_dcn4_soc_qos_params dcn4;
+		struct dml2_dcn32x_soc_qos_params dcn32x;
+		struct dml2_dcn4x_soc_qos_params dcn4x;
 	} qos_params;
 
 	enum dml2_qos_param_type qos_type;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
index c47a07f473e5..a824ce56c54e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
@@ -228,7 +228,7 @@ struct dml2_per_plane_programming {
 	union {
 		struct {
 			unsigned long dppclk_khz;
-		} dcn4;
+		} dcn4x;
 	} min_clocks;
 
 	struct dml2_mcache_surface_allocation mcache_allocation;
@@ -263,7 +263,7 @@ union dml2_global_sync_programming {
 		unsigned int vupdate_vupdate_width_pixels;
 		unsigned int vready_offset_pixels;
 		unsigned int pstate_keepout_start_lines;
-	} dcn4;
+	} dcn4x;
 };
 
 struct dml2_per_stream_programming {
@@ -274,7 +274,7 @@ struct dml2_per_stream_programming {
 			unsigned long dscclk_khz;
 			unsigned long dtbclk_khz;
 			unsigned long phyclk_khz;
-		} dcn4;
+		} dcn4x;
 	} min_clocks;
 
 	union dml2_global_sync_programming global_sync;
@@ -375,7 +375,7 @@ struct dml2_display_cfg_programming {
 			unsigned long dispclk_khz;
 			unsigned long dcfclk_deepsleep_khz;
 			unsigned long dpp_ref_khz;
-		} dcn3;
+		} dcn32x;
 		struct {
 			struct {
 				unsigned long uclk_khz;
@@ -404,7 +404,7 @@ struct dml2_display_cfg_programming {
 				uint32_t dpprefclk_did;
 				uint32_t dtbrefclk_did;
 			} divider_ids;
-		} dcn4;
+		} dcn4x;
 	} min_clocks;
 
 	bool uclk_pstate_supported;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
index f5c6cd5cf5e9..9375c6ae1147 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
@@ -551,7 +551,7 @@ bool core_dcn4_mode_programming(struct dml2_core_mode_programming_in_out *in_out
 	l->mode_programming_ex_params.min_clk_table = in_out->instance->minimum_clock_table;
 	l->mode_programming_ex_params.cfg_support_info = in_out->cfg_support_info;
 	l->mode_programming_ex_params.programming = in_out->programming;
-	l->mode_programming_ex_params.min_clk_index = lookup_uclk_dpm_index_by_freq(in_out->programming->min_clocks.dcn4.active.uclk_khz,
+	l->mode_programming_ex_params.min_clk_index = lookup_uclk_dpm_index_by_freq(in_out->programming->min_clocks.dcn4x.active.uclk_khz,
 		&core->clean_me_up.mode_lib.soc);
 
 	result = dml2_core_calcs_mode_programming_ex(&l->mode_programming_ex_params);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 3b1e5c548435..0b671c665373 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -3183,7 +3183,7 @@ static double CalculateUrgentLatency(
 	double fabric_max_transport_latency_margin)
 {
 	double urgent_latency = 0;
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		urgent_latency = (df_qos_response_time_fclk_cycles + mall_overhead_fclk_cycles) / FabricClock
 			+ max_round_trip_to_furthest_cs_fclk_cycles / FabricClock * (1 + fabric_max_transport_latency_margin / 100.0)
 			+ urgent_ramp_uclk_cycles / uclk_freq_mhz * (1 + umc_urgent_ramp_latency_margin / 100.0);
@@ -3194,7 +3194,7 @@ static double CalculateUrgentLatency(
 		}
 	}
 #ifdef __DML_VBA_DEBUG__
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		dml2_printf("DML::%s: qos_type = %d\n", __func__, qos_type);
 		dml2_printf("DML::%s: urgent_ramp_uclk_cycles = %d\n", __func__, urgent_ramp_uclk_cycles);
 		dml2_printf("DML::%s: uclk_freq_mhz = %f\n", __func__, uclk_freq_mhz);
@@ -3224,7 +3224,7 @@ static double CalculateTripToMemory(
 	double fabric_max_transport_latency_margin)
 {
 	double trip_to_memory_us;
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		trip_to_memory_us = mall_overhead_fclk_cycles / FabricClock
 			+ max_round_trip_to_furthest_cs_fclk_cycles / FabricClock * (1.0 + fabric_max_transport_latency_margin / 100.0)
 			+ trip_to_memory_uclk_cycles / uclk_freq_mhz * (1.0 + umc_max_latency_margin / 100.0);
@@ -3233,7 +3233,7 @@ static double CalculateTripToMemory(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		dml2_printf("DML::%s: qos_type = %d\n", __func__, qos_type);
 		dml2_printf("DML::%s: max_round_trip_to_furthest_cs_fclk_cycles = %d\n", __func__, max_round_trip_to_furthest_cs_fclk_cycles);
 		dml2_printf("DML::%s: mall_overhead_fclk_cycles = %d\n", __func__, mall_overhead_fclk_cycles);
@@ -3263,7 +3263,7 @@ static double CalculateMetaTripToMemory(
 	double fabric_max_transport_latency_margin)
 {
 	double meta_trip_to_memory_us;
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		meta_trip_to_memory_us = meta_trip_to_memory_fclk_cycles / FabricClock * (1.0 + fabric_max_transport_latency_margin / 100.0)
 			+ meta_trip_to_memory_uclk_cycles / uclk_freq_mhz * (1.0 + umc_max_latency_margin / 100.0);
 	} else {
@@ -3271,7 +3271,7 @@ static double CalculateMetaTripToMemory(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		dml2_printf("DML::%s: qos_type = %d\n", __func__, qos_type);
 		dml2_printf("DML::%s: meta_trip_to_memory_fclk_cycles = %d\n", __func__, meta_trip_to_memory_fclk_cycles);
 		dml2_printf("DML::%s: meta_trip_to_memory_uclk_cycles = %d\n", __func__, meta_trip_to_memory_uclk_cycles);
@@ -4961,7 +4961,7 @@ static void CalculateExtraLatency(
 			max_request_size_bytes = request_size_bytes_chroma[k];
 	}
 
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		*ExtraLatency_sr = dchub_arb_to_ret_delay / DCFCLK;
 		*ExtraLatency = *ExtraLatency_sr;
 		if (max_oustanding_when_urgent_expected)
@@ -6979,7 +6979,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	mode_lib->ms.uclk_freq_mhz = dram_bw_kbps_to_uclk_mhz(min_clk_table->dram_bw_table.entries[in_out_params->min_clk_index].pre_derate_dram_bw_kbps, &mode_lib->soc.clk_table.dram_config);
 	mode_lib->ms.dram_bw_mbps = ((double)min_clk_table->dram_bw_table.entries[in_out_params->min_clk_index].pre_derate_dram_bw_kbps / 1000);
 	mode_lib->ms.max_dram_bw_mbps = ((double)min_clk_table->dram_bw_table.entries[min_clk_table->dram_bw_table.num_entries - 1].pre_derate_dram_bw_kbps / 1000);
-	mode_lib->ms.qos_param_index = get_qos_param_index((unsigned int) (mode_lib->ms.uclk_freq_mhz * 1000.0), mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params);
+	mode_lib->ms.qos_param_index = get_qos_param_index((unsigned int) (mode_lib->ms.uclk_freq_mhz * 1000.0), mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params);
 	mode_lib->ms.active_min_uclk_dpm_index = get_active_min_uclk_dpm_index((unsigned int) (mode_lib->ms.uclk_freq_mhz * 1000.0), &mode_lib->soc.clk_table);
 
 #if defined(__DML_VBA_DEBUG__)
@@ -8079,32 +8079,32 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			mode_lib->ms.excess_vactive_fill_bw_c);
 
 	mode_lib->ms.UrgLatency = CalculateUrgentLatency(
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_pixel_vm_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_vm_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_pixel_vm_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_vm_us,
 		mode_lib->soc.do_urgent_latency_adjustment,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.scaling_factor_fclk_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.scaling_factor_mhz,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.scaling_factor_fclk_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.scaling_factor_mhz,
 		mode_lib->ms.FabricClock,
 		mode_lib->ms.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].urgent_ramp_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.df_qos_response_time_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_urgent_ramp_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].urgent_ramp_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.df_qos_response_time_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_urgent_ramp_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	mode_lib->ms.TripToMemory = CalculateTripToMemory(
 		mode_lib->ms.UrgLatency,
 		mode_lib->ms.FabricClock,
 		mode_lib->ms.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].trip_to_memory_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].trip_to_memory_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	mode_lib->ms.TripToMemory = math_max2(mode_lib->ms.UrgLatency, mode_lib->ms.TripToMemory);
 
@@ -8274,20 +8274,20 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	mode_lib->ms.support.OutstandingRequestsUrgencyAvoidance = true;
 
 	mode_lib->ms.support.avg_urgent_latency_us
-		= (mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].average_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-			* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_average_latency_margin / 100.0)
-			+ mode_lib->soc.qos_parameters.qos_params.dcn4.average_transport_distance_fclk_cycles / mode_lib->ms.FabricClock)
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_average_transport_latency_margin / 100.0);
+		= (mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].average_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
+			* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_average_latency_margin / 100.0)
+			+ mode_lib->soc.qos_parameters.qos_params.dcn4x.average_transport_distance_fclk_cycles / mode_lib->ms.FabricClock)
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_average_transport_latency_margin / 100.0);
 
 	mode_lib->ms.support.avg_non_urgent_latency_us
-		= (mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].average_latency_when_non_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-			* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_average_latency_margin / 100.0)
-			+ mode_lib->soc.qos_parameters.qos_params.dcn4.average_transport_distance_fclk_cycles / mode_lib->ms.FabricClock)
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_average_transport_latency_margin / 100.0);
+		= (mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].average_latency_when_non_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
+			* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_average_latency_margin / 100.0)
+			+ mode_lib->soc.qos_parameters.qos_params.dcn4x.average_transport_distance_fclk_cycles / mode_lib->ms.FabricClock)
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_average_transport_latency_margin / 100.0);
 
 	for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 
-		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x) {
 			outstanding_latency_us = (mode_lib->soc.max_outstanding_reqs * mode_lib->ms.support.request_size_bytes_luma[k]
 				/ (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes));
 
@@ -8307,7 +8307,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 #endif
 		}
 
-		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4 && mode_lib->ms.BytePerPixelC[k] > 0) {
+		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x && mode_lib->ms.BytePerPixelC[k] > 0) {
 			outstanding_latency_us = (mode_lib->soc.max_outstanding_reqs * mode_lib->ms.support.request_size_bytes_chroma[k]
 				/ (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes));
 
@@ -8522,14 +8522,14 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		min_return_bw_for_latency = mode_lib->ms.support.urg_bandwidth_available_min_latency[dml2_core_internal_soc_state_sys_active];
 
 		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn3)
-			s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_only_bytes,
-											mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
-											mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_vm_only_bytes));
+			s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_pixel_only_bytes,
+											mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
+											mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_vm_only_bytes));
 
 		CalculateExtraLatency(
 			display_cfg,
 			mode_lib->ip.rob_buffer_size_kbytes,
-			mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles,
+			mode_lib->soc.qos_parameters.qos_params.dcn32x.loaded_round_trip_latency_fclk_cycles,
 			s->ReorderingBytes,
 			mode_lib->ms.DCFCLK,
 			mode_lib->ms.FabricClock,
@@ -9015,13 +9015,13 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 	//Re-ordering Buffer Support Check
 	mode_lib->ms.support.max_urgent_latency_us
-		= mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
+		= mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin / 100.0)
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin / 100.0);
 
-	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x) {
 		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
 			/ mode_lib->ms.support.non_urg_bandwidth_required_flip[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= mode_lib->ms.support.max_urgent_latency_us) {
 			mode_lib->ms.support.ROBSupport = true;
@@ -9029,7 +9029,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			mode_lib->ms.support.ROBSupport = false;
 		}
 	} else {
-		if (mode_lib->ip.rob_buffer_size_kbytes * 1024 >= mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles * mode_lib->soc.fabric_datapath_to_dcn_data_return_bytes) {
+		if (mode_lib->ip.rob_buffer_size_kbytes * 1024 >= mode_lib->soc.qos_parameters.qos_params.dcn32x.loaded_round_trip_latency_fclk_cycles * mode_lib->soc.fabric_datapath_to_dcn_data_return_bytes) {
 			mode_lib->ms.support.ROBSupport = true;
 		} else {
 			mode_lib->ms.support.ROBSupport = false;
@@ -9939,14 +9939,14 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	mode_lib->mp.num_active_pipes = dml_get_num_active_pipes(display_cfg->num_planes, cfg_support_info);
 	dml_calc_pipe_plane_mapping(cfg_support_info, mode_lib->mp.pipe_plane);
 
-	mode_lib->mp.Dcfclk = programming->min_clocks.dcn4.active.dcfclk_khz / 1000.0;
-	mode_lib->mp.FabricClock = programming->min_clocks.dcn4.active.fclk_khz / 1000.0;
-	mode_lib->mp.dram_bw_mbps = uclk_khz_to_dram_bw_mbps(programming->min_clocks.dcn4.active.uclk_khz, &mode_lib->soc.clk_table.dram_config);
-	mode_lib->mp.uclk_freq_mhz = programming->min_clocks.dcn4.active.uclk_khz / 1000.0;
-	mode_lib->mp.GlobalDPPCLK = programming->min_clocks.dcn4.dpprefclk_khz / 1000.0;
-	s->SOCCLK = (double)programming->min_clocks.dcn4.socclk_khz / 1000;
-	mode_lib->mp.qos_param_index = get_qos_param_index(programming->min_clocks.dcn4.active.uclk_khz, mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params);
-	mode_lib->mp.active_min_uclk_dpm_index = get_active_min_uclk_dpm_index(programming->min_clocks.dcn4.active.uclk_khz, &mode_lib->soc.clk_table);
+	mode_lib->mp.Dcfclk = programming->min_clocks.dcn4x.active.dcfclk_khz / 1000.0;
+	mode_lib->mp.FabricClock = programming->min_clocks.dcn4x.active.fclk_khz / 1000.0;
+	mode_lib->mp.dram_bw_mbps = uclk_khz_to_dram_bw_mbps(programming->min_clocks.dcn4x.active.uclk_khz, &mode_lib->soc.clk_table.dram_config);
+	mode_lib->mp.uclk_freq_mhz = programming->min_clocks.dcn4x.active.uclk_khz / 1000.0;
+	mode_lib->mp.GlobalDPPCLK = programming->min_clocks.dcn4x.dpprefclk_khz / 1000.0;
+	s->SOCCLK = (double)programming->min_clocks.dcn4x.socclk_khz / 1000;
+	mode_lib->mp.qos_param_index = get_qos_param_index(programming->min_clocks.dcn4x.active.uclk_khz, mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params);
+	mode_lib->mp.active_min_uclk_dpm_index = get_active_min_uclk_dpm_index(programming->min_clocks.dcn4x.active.uclk_khz, &mode_lib->soc.clk_table);
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
@@ -9981,18 +9981,18 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		mode_lib->mp.NoOfDPP[k] = cfg_support_info->plane_support_info[k].dpps_used;
-		mode_lib->mp.Dppclk[k] = programming->plane_programming[k].min_clocks.dcn4.dppclk_khz / 1000.0;
+		mode_lib->mp.Dppclk[k] = programming->plane_programming[k].min_clocks.dcn4x.dppclk_khz / 1000.0;
 		dml2_assert(mode_lib->mp.Dppclk[k] > 0);
 	}
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
-		mode_lib->mp.DSCCLK[k] = programming->stream_programming[stream_index].min_clocks.dcn4.dscclk_khz / 1000.0;
+		mode_lib->mp.DSCCLK[k] = programming->stream_programming[stream_index].min_clocks.dcn4x.dscclk_khz / 1000.0;
 		dml2_printf("DML::%s: k=%d stream_index=%d, mode_lib->mp.DSCCLK = %f\n", __func__, k, stream_index, mode_lib->mp.DSCCLK[k]);
 	}
 
-	mode_lib->mp.Dispclk = programming->min_clocks.dcn4.dispclk_khz / 1000.0;
-	mode_lib->mp.DCFCLKDeepSleep = programming->min_clocks.dcn4.deepsleep_dcfclk_khz / 1000.0;
+	mode_lib->mp.Dispclk = programming->min_clocks.dcn4x.dispclk_khz / 1000.0;
+	mode_lib->mp.DCFCLKDeepSleep = programming->min_clocks.dcn4x.deepsleep_dcfclk_khz / 1000.0;
 
 	dml2_assert(mode_lib->mp.Dcfclk > 0);
 	dml2_assert(mode_lib->mp.FabricClock > 0);
@@ -10474,14 +10474,14 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	}
 
 	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn3)
-		s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_only_bytes,
-										mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
-										mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_vm_only_bytes));
+		s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_pixel_only_bytes,
+										mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
+										mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_vm_only_bytes));
 
 	CalculateExtraLatency(
 		display_cfg,
 		mode_lib->ip.rob_buffer_size_kbytes,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.loaded_round_trip_latency_fclk_cycles,
 		s->ReorderingBytes,
 		mode_lib->mp.Dcfclk,
 		mode_lib->mp.FabricClock,
@@ -10567,32 +10567,32 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			mode_lib->mp.excess_vactive_fill_bw_c);
 
 	mode_lib->mp.UrgentLatency = CalculateUrgentLatency(
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_pixel_vm_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_vm_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_pixel_vm_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_vm_us,
 		mode_lib->soc.do_urgent_latency_adjustment,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.scaling_factor_fclk_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.scaling_factor_mhz,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.scaling_factor_fclk_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.scaling_factor_mhz,
 		mode_lib->mp.FabricClock,
 		mode_lib->mp.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].urgent_ramp_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.df_qos_response_time_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_urgent_ramp_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->mp.qos_param_index].urgent_ramp_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.df_qos_response_time_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_urgent_ramp_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	mode_lib->mp.TripToMemory = CalculateTripToMemory(
 		mode_lib->mp.UrgentLatency,
 		mode_lib->mp.FabricClock,
 		mode_lib->mp.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].trip_to_memory_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->mp.qos_param_index].trip_to_memory_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	mode_lib->mp.TripToMemory = math_max2(mode_lib->mp.UrgentLatency, mode_lib->mp.TripToMemory);
 
@@ -10601,10 +10601,10 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		mode_lib->mp.FabricClock,
 		mode_lib->mp.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].meta_trip_to_memory_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.meta_trip_adder_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->mp.qos_param_index].meta_trip_to_memory_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.meta_trip_adder_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		bool cursor_not_enough_urgent_latency_hiding = 0;
@@ -12205,11 +12205,11 @@ void dml2_core_calcs_get_pipe_regs(const struct dml2_display_cfg *display_cfg,
 
 void dml2_core_calcs_get_global_sync_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, union dml2_global_sync_programming *out, int pipe_index)
 {
-	out->dcn4.vready_offset_pixels = dml_get_vready_offset(mode_lib, pipe_index);
-	out->dcn4.vstartup_lines = dml_get_vstartup_calculated(mode_lib, pipe_index);
-	out->dcn4.vupdate_offset_pixels = dml_get_vupdate_offset(mode_lib, pipe_index);
-	out->dcn4.vupdate_vupdate_width_pixels = dml_get_vupdate_width(mode_lib, pipe_index);
-	out->dcn4.pstate_keepout_start_lines = dml_get_pstate_keepout_dst_lines(mode_lib, pipe_index);
+	out->dcn4x.vready_offset_pixels = dml_get_vready_offset(mode_lib, pipe_index);
+	out->dcn4x.vstartup_lines = dml_get_vstartup_calculated(mode_lib, pipe_index);
+	out->dcn4x.vupdate_offset_pixels = dml_get_vupdate_offset(mode_lib, pipe_index);
+	out->dcn4x.vupdate_vupdate_width_pixels = dml_get_vupdate_width(mode_lib, pipe_index);
+	out->dcn4x.pstate_keepout_start_lines = dml_get_pstate_keepout_dst_lines(mode_lib, pipe_index);
 }
 
 void dml2_core_calcs_get_stream_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_per_stream_programming *out, int pipe_index)
@@ -12658,7 +12658,7 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 
 	out->informative.misc.cstate_max_cap_mode = dml_get_cstate_max_cap_mode(mode_lib);
 
-	out->min_clocks.dcn4.dpprefclk_khz = (int unsigned)dml_get_global_dppclk_khz(mode_lib);
+	out->min_clocks.dcn4x.dpprefclk_khz = (int unsigned)dml_get_global_dppclk_khz(mode_lib);
 
 	out->informative.qos.max_active_fclk_change_latency_supported = dml_get_fclk_change_latency(mode_lib);
 
@@ -12771,13 +12771,13 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 		}
 	}
 
-	out->informative.qos.max_non_urgent_latency_us = mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles
-		/ mode_lib->mp.uclk_freq_mhz * (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->mp.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->mp.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
+	out->informative.qos.max_non_urgent_latency_us = mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->mp.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles
+		/ mode_lib->mp.uclk_freq_mhz * (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin / 100.0)
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles / mode_lib->mp.FabricClock
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->mp.FabricClock
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin / 100.0);
 
-	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x) {
 		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
 			/ mode_lib->mp.non_urg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= out->informative.qos.max_non_urgent_latency_us) {
 			out->informative.misc.ROBUrgencyAvoidance = true;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
index 6d7701a97d3f..c54c29711a65 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
@@ -779,7 +779,7 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 	mode_lib->ms.max_dppclk_freq_mhz = (double)min_clk_table->max_clocks_khz.dppclk / 1000;
 	mode_lib->ms.uclk_freq_mhz = dram_bw_kbps_to_uclk_mhz(min_clk_table->dram_bw_table.entries[in_out_params->min_clk_index].pre_derate_dram_bw_kbps, &mode_lib->soc.clk_table.dram_config);
 	mode_lib->ms.dram_bw_mbps = ((double)min_clk_table->dram_bw_table.entries[in_out_params->min_clk_index].pre_derate_dram_bw_kbps / 1000);
-	mode_lib->ms.qos_param_index = get_qos_param_index((unsigned int)(mode_lib->ms.uclk_freq_mhz * 1000.0), mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params);
+	mode_lib->ms.qos_param_index = get_qos_param_index((unsigned int)(mode_lib->ms.uclk_freq_mhz * 1000.0), mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params);
 	mode_lib->ms.active_min_uclk_dpm_index = get_active_min_uclk_dpm_index((unsigned int)(mode_lib->ms.uclk_freq_mhz * 1000.0), &mode_lib->soc.clk_table);
 
 #if defined(__DML_VBA_DEBUG__)
@@ -1776,32 +1776,32 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 #endif
 
 	mode_lib->ms.UrgLatency = CalculateUrgentLatency(
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_pixel_vm_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_vm_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_pixel_vm_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_vm_us,
 		mode_lib->soc.do_urgent_latency_adjustment,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.scaling_factor_fclk_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.scaling_factor_mhz,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.scaling_factor_fclk_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.scaling_factor_mhz,
 		mode_lib->ms.FabricClock,
 		mode_lib->ms.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].urgent_ramp_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.df_qos_response_time_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_urgent_ramp_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].urgent_ramp_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.df_qos_response_time_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_urgent_ramp_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	mode_lib->ms.TripToMemory = CalculateTripToMemory(
 		mode_lib->ms.UrgLatency,
 		mode_lib->ms.FabricClock,
 		mode_lib->ms.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].trip_to_memory_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].trip_to_memory_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	mode_lib->ms.TripToMemory = math_max2(mode_lib->ms.UrgLatency, mode_lib->ms.TripToMemory);
 
@@ -1995,21 +1995,21 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 	mode_lib->ms.support.OutstandingRequestsUrgencyAvoidance = true;
 
 	mode_lib->ms.support.avg_urgent_latency_us
-		= (mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].average_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-			* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_average_latency_margin / 100.0)
-			+ mode_lib->soc.qos_parameters.qos_params.dcn4.average_transport_distance_fclk_cycles / mode_lib->ms.FabricClock)
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_average_transport_latency_margin / 100.0);
+		= (mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].average_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
+			* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_average_latency_margin / 100.0)
+			+ mode_lib->soc.qos_parameters.qos_params.dcn4x.average_transport_distance_fclk_cycles / mode_lib->ms.FabricClock)
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_average_transport_latency_margin / 100.0);
 
 	mode_lib->ms.support.avg_non_urgent_latency_us
-		= (mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].average_latency_when_non_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-			* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_average_latency_margin / 100.0)
-			+ mode_lib->soc.qos_parameters.qos_params.dcn4.average_transport_distance_fclk_cycles / mode_lib->ms.FabricClock)
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_average_transport_latency_margin / 100.0);
+		= (mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].average_latency_when_non_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
+			* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_average_latency_margin / 100.0)
+			+ mode_lib->soc.qos_parameters.qos_params.dcn4x.average_transport_distance_fclk_cycles / mode_lib->ms.FabricClock)
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_average_transport_latency_margin / 100.0);
 
 	double outstanding_latency_us = 0;
 	for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 
-		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x) {
 			outstanding_latency_us = (mode_lib->soc.max_outstanding_reqs * mode_lib->ms.support.request_size_bytes_luma[k]
 				/ (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes));
 
@@ -2029,7 +2029,7 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 #endif
 		}
 
-		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4 && mode_lib->ms.BytePerPixelC[k] > 0) {
+		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x && mode_lib->ms.BytePerPixelC[k] > 0) {
 			outstanding_latency_us = (mode_lib->soc.max_outstanding_reqs * mode_lib->ms.support.request_size_bytes_chroma[k]
 				/ (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes));
 
@@ -2243,14 +2243,14 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 
 		double min_return_bw_for_latency = mode_lib->ms.support.urg_bandwidth_available_min_latency[dml2_core_internal_soc_state_sys_active];
 		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn3)
-			s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_only_bytes,
-											mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
-											mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_vm_only_bytes));
+			s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_pixel_only_bytes,
+											mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
+											mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_vm_only_bytes));
 
 		CalculateExtraLatency(
 			display_cfg,
 			mode_lib->ip.rob_buffer_size_kbytes,
-			mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles,
+			mode_lib->soc.qos_parameters.qos_params.dcn32x.loaded_round_trip_latency_fclk_cycles,
 			s->ReorderingBytes,
 			mode_lib->ms.DCFCLK,
 			mode_lib->ms.FabricClock,
@@ -2717,13 +2717,13 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 
 	//Re-ordering Buffer Support Check
 	mode_lib->ms.support.max_urgent_latency_us
-		= mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
+		= mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin / 100.0)
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin / 100.0);
 
-	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x) {
 		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
 			/ mode_lib->ms.support.non_urg_bandwidth_required_flip[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= mode_lib->ms.support.max_urgent_latency_us) {
 			mode_lib->ms.support.ROBSupport = true;
@@ -2731,7 +2731,7 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 			mode_lib->ms.support.ROBSupport = false;
 		}
 	} else {
-		if (mode_lib->ip.rob_buffer_size_kbytes * 1024 >= mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles * mode_lib->soc.fabric_datapath_to_dcn_data_return_bytes) {
+		if (mode_lib->ip.rob_buffer_size_kbytes * 1024 >= mode_lib->soc.qos_parameters.qos_params.dcn32x.loaded_round_trip_latency_fclk_cycles * mode_lib->soc.fabric_datapath_to_dcn_data_return_bytes) {
 			mode_lib->ms.support.ROBSupport = true;
 		} else {
 			mode_lib->ms.support.ROBSupport = false;
@@ -5885,7 +5885,7 @@ static double CalculateUrgentLatency(
 	double fabric_max_transport_latency_margin)
 {
 	double urgent_latency = 0;
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		urgent_latency = (df_qos_response_time_fclk_cycles + mall_overhead_fclk_cycles) / FabricClock
 			+ max_round_trip_to_furthest_cs_fclk_cycles / FabricClock * (1 + fabric_max_transport_latency_margin / 100.0)
 			+ urgent_ramp_uclk_cycles / uclk_freq_mhz * (1 + umc_urgent_ramp_latency_margin / 100.0);
@@ -5896,7 +5896,7 @@ static double CalculateUrgentLatency(
 		}
 	}
 #ifdef __DML_VBA_DEBUG__
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		dml2_printf("DML::%s: qos_type = %d\n", __func__, qos_type);
 		dml2_printf("DML::%s: urgent_ramp_uclk_cycles = %d\n", __func__, urgent_ramp_uclk_cycles);
 		dml2_printf("DML::%s: uclk_freq_mhz = %f\n", __func__, uclk_freq_mhz);
@@ -5926,7 +5926,7 @@ static double CalculateTripToMemory(
 	double fabric_max_transport_latency_margin)
 {
 	double trip_to_memory_us;
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		trip_to_memory_us = mall_overhead_fclk_cycles / FabricClock
 			+ max_round_trip_to_furthest_cs_fclk_cycles / FabricClock * (1.0 + fabric_max_transport_latency_margin / 100.0)
 			+ trip_to_memory_uclk_cycles / uclk_freq_mhz * (1.0 + umc_max_latency_margin / 100.0);
@@ -5935,7 +5935,7 @@ static double CalculateTripToMemory(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		dml2_printf("DML::%s: qos_type = %d\n", __func__, qos_type);
 		dml2_printf("DML::%s: max_round_trip_to_furthest_cs_fclk_cycles = %d\n", __func__, max_round_trip_to_furthest_cs_fclk_cycles);
 		dml2_printf("DML::%s: mall_overhead_fclk_cycles = %d\n", __func__, mall_overhead_fclk_cycles);
@@ -5965,7 +5965,7 @@ static double CalculateMetaTripToMemory(
 	double fabric_max_transport_latency_margin)
 {
 	double meta_trip_to_memory_us;
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		meta_trip_to_memory_us = meta_trip_to_memory_fclk_cycles / FabricClock * (1.0 + fabric_max_transport_latency_margin / 100.0)
 			+ meta_trip_to_memory_uclk_cycles / uclk_freq_mhz * (1.0 + umc_max_latency_margin / 100.0);
 	} else {
@@ -5973,7 +5973,7 @@ static double CalculateMetaTripToMemory(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		dml2_printf("DML::%s: qos_type = %d\n", __func__, qos_type);
 		dml2_printf("DML::%s: meta_trip_to_memory_fclk_cycles = %d\n", __func__, meta_trip_to_memory_fclk_cycles);
 		dml2_printf("DML::%s: meta_trip_to_memory_uclk_cycles = %d\n", __func__, meta_trip_to_memory_uclk_cycles);
@@ -7489,7 +7489,7 @@ static void CalculateExtraLatency(
 			max_request_size_bytes = request_size_bytes_chroma[k];
 	}
 
-	if (qos_type == dml2_qos_param_type_dcn4) {
+	if (qos_type == dml2_qos_param_type_dcn4x) {
 		*ExtraLatency_sr = dchub_arb_to_ret_delay / DCFCLK;
 		*ExtraLatency = *ExtraLatency_sr;
 		if (max_oustanding_when_urgent_expected)
@@ -9835,14 +9835,14 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
 	mode_lib->mp.num_active_pipes = dml_get_num_active_pipes(display_cfg->num_planes, cfg_support_info);
 	dml_calc_pipe_plane_mapping(cfg_support_info, mode_lib->mp.pipe_plane);
 
-	mode_lib->mp.Dcfclk = programming->min_clocks.dcn4.active.dcfclk_khz / 1000.0;
-	mode_lib->mp.FabricClock = programming->min_clocks.dcn4.active.fclk_khz / 1000.0;
-	mode_lib->mp.dram_bw_mbps = uclk_khz_to_dram_bw_mbps(programming->min_clocks.dcn4.active.uclk_khz, &mode_lib->soc.clk_table.dram_config);
-	mode_lib->mp.uclk_freq_mhz = programming->min_clocks.dcn4.active.uclk_khz / 1000.0;
-	mode_lib->mp.GlobalDPPCLK = programming->min_clocks.dcn4.dpprefclk_khz / 1000.0;
-	s->SOCCLK = (double)programming->min_clocks.dcn4.socclk_khz / 1000;
-	mode_lib->mp.qos_param_index = get_qos_param_index(programming->min_clocks.dcn4.active.uclk_khz, mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params);
-	mode_lib->mp.active_min_uclk_dpm_index = get_active_min_uclk_dpm_index(programming->min_clocks.dcn4.active.uclk_khz, &mode_lib->soc.clk_table);
+	mode_lib->mp.Dcfclk = programming->min_clocks.dcn4x.active.dcfclk_khz / 1000.0;
+	mode_lib->mp.FabricClock = programming->min_clocks.dcn4x.active.fclk_khz / 1000.0;
+	mode_lib->mp.dram_bw_mbps = uclk_khz_to_dram_bw_mbps(programming->min_clocks.dcn4x.active.uclk_khz, &mode_lib->soc.clk_table.dram_config);
+	mode_lib->mp.uclk_freq_mhz = programming->min_clocks.dcn4x.active.uclk_khz / 1000.0;
+	mode_lib->mp.GlobalDPPCLK = programming->min_clocks.dcn4x.dpprefclk_khz / 1000.0;
+	s->SOCCLK = (double)programming->min_clocks.dcn4x.socclk_khz / 1000;
+	mode_lib->mp.qos_param_index = get_qos_param_index(programming->min_clocks.dcn4x.active.uclk_khz, mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params);
+	mode_lib->mp.active_min_uclk_dpm_index = get_active_min_uclk_dpm_index(programming->min_clocks.dcn4x.active.uclk_khz, &mode_lib->soc.clk_table);
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
@@ -9877,18 +9877,18 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		mode_lib->mp.NoOfDPP[k] = cfg_support_info->plane_support_info[k].dpps_used;
-		mode_lib->mp.Dppclk[k] = programming->plane_programming[k].min_clocks.dcn4.dppclk_khz / 1000.0;
+		mode_lib->mp.Dppclk[k] = programming->plane_programming[k].min_clocks.dcn4x.dppclk_khz / 1000.0;
 		dml2_assert(mode_lib->mp.Dppclk[k] > 0);
 	}
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
-		mode_lib->mp.DSCCLK[k] = programming->stream_programming[stream_index].min_clocks.dcn4.dscclk_khz / 1000.0;
+		mode_lib->mp.DSCCLK[k] = programming->stream_programming[stream_index].min_clocks.dcn4x.dscclk_khz / 1000.0;
 		dml2_printf("DML::%s: k=%d stream_index=%d, mode_lib->mp.DSCCLK = %f\n", __func__, k, stream_index, mode_lib->mp.DSCCLK[k]);
 	}
 
-	mode_lib->mp.Dispclk = programming->min_clocks.dcn4.dispclk_khz / 1000.0;
-	mode_lib->mp.DCFCLKDeepSleep = programming->min_clocks.dcn4.deepsleep_dcfclk_khz / 1000.0;
+	mode_lib->mp.Dispclk = programming->min_clocks.dcn4x.dispclk_khz / 1000.0;
+	mode_lib->mp.DCFCLKDeepSleep = programming->min_clocks.dcn4x.deepsleep_dcfclk_khz / 1000.0;
 
 	dml2_assert(mode_lib->mp.Dcfclk > 0);
 	dml2_assert(mode_lib->mp.FabricClock > 0);
@@ -10410,14 +10410,14 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
 	}
 
 	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn3)
-		s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_only_bytes,
-										mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
-										mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_vm_only_bytes));
+		s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_pixel_only_bytes,
+										mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
+										mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_out_of_order_return_per_channel_vm_only_bytes));
 
 	CalculateExtraLatency(
 		display_cfg,
 		mode_lib->ip.rob_buffer_size_kbytes,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.loaded_round_trip_latency_fclk_cycles,
 		s->ReorderingBytes,
 		mode_lib->mp.Dcfclk,
 		mode_lib->mp.FabricClock,
@@ -10491,32 +10491,32 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
 				mode_lib->mp.WritebackDelay[k] = mode_lib->mp.WritebackDelay[j];
 
 	mode_lib->mp.UrgentLatency = CalculateUrgentLatency(
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_pixel_vm_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_vm_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_pixel_vm_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.base_latency_vm_us,
 		mode_lib->soc.do_urgent_latency_adjustment,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.scaling_factor_fclk_us,
-		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.scaling_factor_mhz,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.scaling_factor_fclk_us,
+		mode_lib->soc.qos_parameters.qos_params.dcn32x.urgent_latency_us.scaling_factor_mhz,
 		mode_lib->mp.FabricClock,
 		mode_lib->mp.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].urgent_ramp_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.df_qos_response_time_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_urgent_ramp_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->mp.qos_param_index].urgent_ramp_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.df_qos_response_time_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_urgent_ramp_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	mode_lib->mp.TripToMemory = CalculateTripToMemory(
 		mode_lib->mp.UrgentLatency,
 		mode_lib->mp.FabricClock,
 		mode_lib->mp.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].trip_to_memory_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->mp.qos_param_index].trip_to_memory_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	mode_lib->mp.TripToMemory = math_max2(mode_lib->mp.UrgentLatency, mode_lib->mp.TripToMemory);
 
@@ -10525,10 +10525,10 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
 		mode_lib->mp.FabricClock,
 		mode_lib->mp.uclk_freq_mhz,
 		mode_lib->soc.qos_parameters.qos_type,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].meta_trip_to_memory_uclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.meta_trip_adder_fclk_cycles,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin,
-		mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin);
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->mp.qos_param_index].meta_trip_to_memory_uclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.meta_trip_adder_fclk_cycles,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin,
+		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		calculate_cursor_req_attributes(
@@ -11971,14 +11971,14 @@ void dml2_core_shared_get_pipe_regs(const struct dml2_display_cfg *display_cfg,
 
 void dml2_core_shared_get_stream_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_per_stream_programming *out, int pipe_index)
 {
-	// out->min_clocks.dcn4.dscclk_khz = (unsigned int)(dml_get_dscclk_calculated(mode_lib, pipe_index) * 1000); // FIXME_STAGE2
-	// out->min_clocks.dcn4.dtbclk_khz = (unsigned int)(dml_get_dscclk_calculated(mode_lib, pipe_index) * 1000);
-	// out->min_clocks.dcn4.phyclk_khz = (unsigned int)(dml_get_dscclk_calculated(mode_lib, pipe_index) * 1000);
-
-	out->global_sync.dcn4.vready_offset_pixels = mode_lib->mp.VReadyOffsetPix[mode_lib->mp.pipe_plane[pipe_index]];
-	out->global_sync.dcn4.vstartup_lines = mode_lib->mp.VStartup[mode_lib->mp.pipe_plane[pipe_index]];
-	out->global_sync.dcn4.vupdate_offset_pixels = mode_lib->mp.VUpdateOffsetPix[mode_lib->mp.pipe_plane[pipe_index]];
-	out->global_sync.dcn4.vupdate_vupdate_width_pixels = mode_lib->mp.VUpdateWidthPix[mode_lib->mp.pipe_plane[pipe_index]];
+	// out->min_clocks.dcn4x.dscclk_khz = (unsigned int)(dml_get_dscclk_calculated(mode_lib, pipe_index) * 1000); // FIXME_STAGE2
+	// out->min_clocks.dcn4x.dtbclk_khz = (unsigned int)(dml_get_dscclk_calculated(mode_lib, pipe_index) * 1000);
+	// out->min_clocks.dcn4x.phyclk_khz = (unsigned int)(dml_get_dscclk_calculated(mode_lib, pipe_index) * 1000);
+
+	out->global_sync.dcn4x.vready_offset_pixels = mode_lib->mp.VReadyOffsetPix[mode_lib->mp.pipe_plane[pipe_index]];
+	out->global_sync.dcn4x.vstartup_lines = mode_lib->mp.VStartup[mode_lib->mp.pipe_plane[pipe_index]];
+	out->global_sync.dcn4x.vupdate_offset_pixels = mode_lib->mp.VUpdateOffsetPix[mode_lib->mp.pipe_plane[pipe_index]];
+	out->global_sync.dcn4x.vupdate_vupdate_width_pixels = mode_lib->mp.VUpdateWidthPix[mode_lib->mp.pipe_plane[pipe_index]];
 }
 
 void dml2_core_shared_get_mcache_allocation(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_mcache_surface_allocation *out, int plane_idx)
@@ -12281,7 +12281,7 @@ void dml2_core_shared_get_informative(const struct dml2_core_internal_display_mo
 
 	out->informative.misc.cstate_max_cap_mode = mode_lib->mp.DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE;
 
-	out->min_clocks.dcn4.dpprefclk_khz = (int unsigned)(mode_lib->mp.GlobalDPPCLK * 1000.0);
+	out->min_clocks.dcn4x.dpprefclk_khz = (int unsigned)(mode_lib->mp.GlobalDPPCLK * 1000.0);
 
 	out->informative.qos.max_active_fclk_change_latency_supported = mode_lib->mp.MaxActiveFCLKChangeLatencySupported;
 
@@ -12394,13 +12394,13 @@ void dml2_core_shared_get_informative(const struct dml2_core_internal_display_mo
 		}
 	}
 
-	out->informative.qos.max_non_urgent_latency_us = mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles
-		/ mode_lib->mp.uclk_freq_mhz * (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->mp.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->mp.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
+	out->informative.qos.max_non_urgent_latency_us = mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->mp.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles
+		/ mode_lib->mp.uclk_freq_mhz * (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin / 100.0)
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles / mode_lib->mp.FabricClock
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->mp.FabricClock
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin / 100.0);
 
-	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x) {
 		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
 			/ mode_lib->mp.non_urg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= out->informative.qos.max_non_urgent_latency_us) {
 			out->informative.misc.ROBUrgencyAvoidance = true;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
index 0d847bccd5d2..0021bbaa4b91 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
@@ -82,9 +82,9 @@ static void calculate_system_active_minimums(struct dml2_dpmm_map_mode_to_soc_dp
 
 	get_minimum_clocks_for_latency(in_out, &min_uclk_latency, &min_fclk_latency, &min_dcfclk_latency);
 
-	in_out->programming->min_clocks.dcn4.active.uclk_khz = dml_round_up(min_uclk_bw > min_uclk_latency ? min_uclk_bw : min_uclk_latency);
-	in_out->programming->min_clocks.dcn4.active.fclk_khz = dml_round_up(min_fclk_bw > min_fclk_latency ? min_fclk_bw : min_fclk_latency);
-	in_out->programming->min_clocks.dcn4.active.dcfclk_khz = dml_round_up(min_dcfclk_bw > min_dcfclk_latency ? min_dcfclk_bw : min_dcfclk_latency);
+	in_out->programming->min_clocks.dcn4x.active.uclk_khz = dml_round_up(min_uclk_bw > min_uclk_latency ? min_uclk_bw : min_uclk_latency);
+	in_out->programming->min_clocks.dcn4x.active.fclk_khz = dml_round_up(min_fclk_bw > min_fclk_latency ? min_fclk_bw : min_fclk_latency);
+	in_out->programming->min_clocks.dcn4x.active.dcfclk_khz = dml_round_up(min_dcfclk_bw > min_dcfclk_latency ? min_dcfclk_bw : min_dcfclk_latency);
 }
 
 static void calculate_svp_prefetch_minimums(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_out *in_out)
@@ -122,9 +122,9 @@ static void calculate_svp_prefetch_minimums(struct dml2_dpmm_map_mode_to_soc_dpm
 
 	get_minimum_clocks_for_latency(in_out, &min_uclk_latency, &min_fclk_latency, &min_dcfclk_latency);
 
-	in_out->programming->min_clocks.dcn4.svp_prefetch.uclk_khz = dml_round_up(min_uclk_bw > min_uclk_latency ? min_uclk_bw : min_uclk_latency);
-	in_out->programming->min_clocks.dcn4.svp_prefetch.fclk_khz = dml_round_up(min_fclk_bw > min_fclk_latency ? min_fclk_bw : min_fclk_latency);
-	in_out->programming->min_clocks.dcn4.svp_prefetch.dcfclk_khz = dml_round_up(min_dcfclk_bw > min_dcfclk_latency ? min_dcfclk_bw : min_dcfclk_latency);
+	in_out->programming->min_clocks.dcn4x.svp_prefetch.uclk_khz = dml_round_up(min_uclk_bw > min_uclk_latency ? min_uclk_bw : min_uclk_latency);
+	in_out->programming->min_clocks.dcn4x.svp_prefetch.fclk_khz = dml_round_up(min_fclk_bw > min_fclk_latency ? min_fclk_bw : min_fclk_latency);
+	in_out->programming->min_clocks.dcn4x.svp_prefetch.dcfclk_khz = dml_round_up(min_dcfclk_bw > min_dcfclk_latency ? min_dcfclk_bw : min_dcfclk_latency);
 }
 
 static void calculate_idle_minimums(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_out *in_out)
@@ -146,9 +146,9 @@ static void calculate_idle_minimums(struct dml2_dpmm_map_mode_to_soc_dpm_params_
 
 	get_minimum_clocks_for_latency(in_out, &min_uclk_latency, &min_fclk_latency, &min_dcfclk_latency);
 
-	in_out->programming->min_clocks.dcn4.idle.uclk_khz = dml_round_up(min_uclk_avg > min_uclk_latency ? min_uclk_avg : min_uclk_latency);
-	in_out->programming->min_clocks.dcn4.idle.fclk_khz = dml_round_up(min_fclk_avg > min_fclk_latency ? min_fclk_avg : min_fclk_latency);
-	in_out->programming->min_clocks.dcn4.idle.dcfclk_khz = dml_round_up(min_dcfclk_avg > min_dcfclk_latency ? min_dcfclk_avg : min_dcfclk_latency);
+	in_out->programming->min_clocks.dcn4x.idle.uclk_khz = dml_round_up(min_uclk_avg > min_uclk_latency ? min_uclk_avg : min_uclk_latency);
+	in_out->programming->min_clocks.dcn4x.idle.fclk_khz = dml_round_up(min_fclk_avg > min_fclk_latency ? min_fclk_avg : min_fclk_latency);
+	in_out->programming->min_clocks.dcn4x.idle.dcfclk_khz = dml_round_up(min_dcfclk_avg > min_dcfclk_latency ? min_dcfclk_avg : min_dcfclk_latency);
 }
 
 static bool add_margin_and_round_to_dfs_grainularity(double clock_khz, double margin, unsigned long vco_freq_khz, unsigned long *rounded_khz, uint32_t *divider_id)
@@ -232,25 +232,25 @@ static bool map_soc_min_clocks_to_dpm_fine_grained(struct dml2_display_cfg_progr
 {
 	bool result;
 
-	result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.active.dcfclk_khz, &state_table->dcfclk);
+	result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.active.dcfclk_khz, &state_table->dcfclk);
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.active.fclk_khz, &state_table->fclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.active.fclk_khz, &state_table->fclk);
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.active.uclk_khz, &state_table->uclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.active.uclk_khz, &state_table->uclk);
 
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.svp_prefetch.dcfclk_khz, &state_table->dcfclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.svp_prefetch.dcfclk_khz, &state_table->dcfclk);
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.svp_prefetch.fclk_khz, &state_table->fclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.svp_prefetch.fclk_khz, &state_table->fclk);
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.svp_prefetch.uclk_khz, &state_table->uclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.svp_prefetch.uclk_khz, &state_table->uclk);
 
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.idle.dcfclk_khz, &state_table->dcfclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.idle.dcfclk_khz, &state_table->dcfclk);
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.idle.fclk_khz, &state_table->fclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.idle.fclk_khz, &state_table->fclk);
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.idle.uclk_khz, &state_table->uclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.idle.uclk_khz, &state_table->uclk);
 
 	return result;
 }
@@ -262,12 +262,12 @@ static bool map_soc_min_clocks_to_dpm_coarse_grained(struct dml2_display_cfg_pro
 
 	result = false;
 	for (index = 0; index < state_table->uclk.num_clk_values; index++) {
-		if (display_cfg->min_clocks.dcn4.active.dcfclk_khz <= state_table->dcfclk.clk_values_khz[index] &&
-			display_cfg->min_clocks.dcn4.active.fclk_khz <= state_table->fclk.clk_values_khz[index] &&
-			display_cfg->min_clocks.dcn4.active.uclk_khz <= state_table->uclk.clk_values_khz[index]) {
-			display_cfg->min_clocks.dcn4.active.dcfclk_khz = state_table->dcfclk.clk_values_khz[index];
-			display_cfg->min_clocks.dcn4.active.fclk_khz = state_table->fclk.clk_values_khz[index];
-			display_cfg->min_clocks.dcn4.active.uclk_khz = state_table->uclk.clk_values_khz[index];
+		if (display_cfg->min_clocks.dcn4x.active.dcfclk_khz <= state_table->dcfclk.clk_values_khz[index] &&
+			display_cfg->min_clocks.dcn4x.active.fclk_khz <= state_table->fclk.clk_values_khz[index] &&
+			display_cfg->min_clocks.dcn4x.active.uclk_khz <= state_table->uclk.clk_values_khz[index]) {
+			display_cfg->min_clocks.dcn4x.active.dcfclk_khz = state_table->dcfclk.clk_values_khz[index];
+			display_cfg->min_clocks.dcn4x.active.fclk_khz = state_table->fclk.clk_values_khz[index];
+			display_cfg->min_clocks.dcn4x.active.uclk_khz = state_table->uclk.clk_values_khz[index];
 			result = true;
 			break;
 		}
@@ -276,12 +276,12 @@ static bool map_soc_min_clocks_to_dpm_coarse_grained(struct dml2_display_cfg_pro
 	if (result) {
 		result = false;
 		for (index = 0; index < state_table->uclk.num_clk_values; index++) {
-			if (display_cfg->min_clocks.dcn4.idle.dcfclk_khz <= state_table->dcfclk.clk_values_khz[index] &&
-				display_cfg->min_clocks.dcn4.idle.fclk_khz <= state_table->fclk.clk_values_khz[index] &&
-				display_cfg->min_clocks.dcn4.idle.uclk_khz <= state_table->uclk.clk_values_khz[index]) {
-				display_cfg->min_clocks.dcn4.idle.dcfclk_khz = state_table->dcfclk.clk_values_khz[index];
-				display_cfg->min_clocks.dcn4.idle.fclk_khz = state_table->fclk.clk_values_khz[index];
-				display_cfg->min_clocks.dcn4.idle.uclk_khz = state_table->uclk.clk_values_khz[index];
+			if (display_cfg->min_clocks.dcn4x.idle.dcfclk_khz <= state_table->dcfclk.clk_values_khz[index] &&
+				display_cfg->min_clocks.dcn4x.idle.fclk_khz <= state_table->fclk.clk_values_khz[index] &&
+				display_cfg->min_clocks.dcn4x.idle.uclk_khz <= state_table->uclk.clk_values_khz[index]) {
+				display_cfg->min_clocks.dcn4x.idle.dcfclk_khz = state_table->dcfclk.clk_values_khz[index];
+				display_cfg->min_clocks.dcn4x.idle.fclk_khz = state_table->fclk.clk_values_khz[index];
+				display_cfg->min_clocks.dcn4x.idle.uclk_khz = state_table->uclk.clk_values_khz[index];
 				result = true;
 				break;
 			}
@@ -289,9 +289,9 @@ static bool map_soc_min_clocks_to_dpm_coarse_grained(struct dml2_display_cfg_pro
 	}
 
 	// SVP is not supported on any coarse grained SoCs
-	display_cfg->min_clocks.dcn4.svp_prefetch.dcfclk_khz = 0;
-	display_cfg->min_clocks.dcn4.svp_prefetch.fclk_khz = 0;
-	display_cfg->min_clocks.dcn4.svp_prefetch.uclk_khz = 0;
+	display_cfg->min_clocks.dcn4x.svp_prefetch.dcfclk_khz = 0;
+	display_cfg->min_clocks.dcn4x.svp_prefetch.fclk_khz = 0;
+	display_cfg->min_clocks.dcn4x.svp_prefetch.uclk_khz = 0;
 
 	return result;
 }
@@ -324,30 +324,30 @@ static bool map_min_clocks_to_dpm(const struct dml2_core_mode_support_result *mo
 		result = map_soc_min_clocks_to_dpm_coarse_grained(display_cfg, state_table);
 
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.dispclk_khz, &state_table->dispclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.dispclk_khz, &state_table->dispclk);
 
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.deepsleep_dcfclk_khz, &state_table->dcfclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.deepsleep_dcfclk_khz, &state_table->dcfclk);
 
 	for (i = 0; i < DML2_MAX_DCN_PIPES; i++) {
 		if (result)
-			result = round_up_to_next_dpm(&display_cfg->plane_programming[i].min_clocks.dcn4.dppclk_khz, &state_table->dppclk);
+			result = round_up_to_next_dpm(&display_cfg->plane_programming[i].min_clocks.dcn4x.dppclk_khz, &state_table->dppclk);
 	}
 
 	for (i = 0; i < display_cfg->display_config.num_streams; i++) {
 		if (result)
-			result = round_up_and_copy_to_next_dpm(mode_support_result->per_stream[i].dscclk_khz, &display_cfg->stream_programming[i].min_clocks.dcn4.dscclk_khz, &state_table->dscclk);
+			result = round_up_and_copy_to_next_dpm(mode_support_result->per_stream[i].dscclk_khz, &display_cfg->stream_programming[i].min_clocks.dcn4x.dscclk_khz, &state_table->dscclk);
 		if (result)
-			result = round_up_and_copy_to_next_dpm(mode_support_result->per_stream[i].dtbclk_khz, &display_cfg->stream_programming[i].min_clocks.dcn4.dtbclk_khz, &state_table->dtbclk);
+			result = round_up_and_copy_to_next_dpm(mode_support_result->per_stream[i].dtbclk_khz, &display_cfg->stream_programming[i].min_clocks.dcn4x.dtbclk_khz, &state_table->dtbclk);
 		if (result)
-			result = round_up_and_copy_to_next_dpm(mode_support_result->per_stream[i].phyclk_khz, &display_cfg->stream_programming[i].min_clocks.dcn4.phyclk_khz, &state_table->phyclk);
+			result = round_up_and_copy_to_next_dpm(mode_support_result->per_stream[i].phyclk_khz, &display_cfg->stream_programming[i].min_clocks.dcn4x.phyclk_khz, &state_table->phyclk);
 	}
 
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.dpprefclk_khz, &state_table->dppclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.dpprefclk_khz, &state_table->dppclk);
 
 	if (result)
-		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.dtbrefclk_khz, &state_table->dtbclk);
+		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4x.dtbrefclk_khz, &state_table->dtbclk);
 
 	return result;
 }
@@ -515,15 +515,15 @@ static bool determine_power_management_features_with_fams(struct dml2_dpmm_map_m
 
 static void clamp_uclk_to_max(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_out *in_out)
 {
-	in_out->programming->min_clocks.dcn4.active.uclk_khz = in_out->soc_bb->clk_table.uclk.clk_values_khz[in_out->soc_bb->clk_table.uclk.num_clk_values - 1];
-	in_out->programming->min_clocks.dcn4.svp_prefetch.uclk_khz = in_out->soc_bb->clk_table.uclk.clk_values_khz[in_out->soc_bb->clk_table.uclk.num_clk_values - 1];
-	in_out->programming->min_clocks.dcn4.idle.uclk_khz = in_out->soc_bb->clk_table.uclk.clk_values_khz[in_out->soc_bb->clk_table.uclk.num_clk_values - 1];
+	in_out->programming->min_clocks.dcn4x.active.uclk_khz = in_out->soc_bb->clk_table.uclk.clk_values_khz[in_out->soc_bb->clk_table.uclk.num_clk_values - 1];
+	in_out->programming->min_clocks.dcn4x.svp_prefetch.uclk_khz = in_out->soc_bb->clk_table.uclk.clk_values_khz[in_out->soc_bb->clk_table.uclk.num_clk_values - 1];
+	in_out->programming->min_clocks.dcn4x.idle.uclk_khz = in_out->soc_bb->clk_table.uclk.clk_values_khz[in_out->soc_bb->clk_table.uclk.num_clk_values - 1];
 }
 
 static void clamp_fclk_to_max(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_out *in_out)
 {
-	in_out->programming->min_clocks.dcn4.active.fclk_khz = in_out->soc_bb->clk_table.fclk.clk_values_khz[in_out->soc_bb->clk_table.fclk.num_clk_values - 1];
-	in_out->programming->min_clocks.dcn4.idle.fclk_khz = in_out->soc_bb->clk_table.fclk.clk_values_khz[in_out->soc_bb->clk_table.fclk.num_clk_values - 1];
+	in_out->programming->min_clocks.dcn4x.active.fclk_khz = in_out->soc_bb->clk_table.fclk.clk_values_khz[in_out->soc_bb->clk_table.fclk.num_clk_values - 1];
+	in_out->programming->min_clocks.dcn4x.idle.fclk_khz = in_out->soc_bb->clk_table.fclk.clk_values_khz[in_out->soc_bb->clk_table.fclk.num_clk_values - 1];
 }
 
 static bool map_mode_to_soc_dpm(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_out *in_out)
@@ -539,14 +539,14 @@ static bool map_mode_to_soc_dpm(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_o
 
 	// In NV4, there's no support for FCLK or DCFCLK DPM change before SVP prefetch starts, therefore
 	// active minimums must be boosted to prefetch minimums
-	if (in_out->programming->min_clocks.dcn4.svp_prefetch.uclk_khz > in_out->programming->min_clocks.dcn4.active.uclk_khz)
-		in_out->programming->min_clocks.dcn4.active.uclk_khz = in_out->programming->min_clocks.dcn4.svp_prefetch.uclk_khz;
+	if (in_out->programming->min_clocks.dcn4x.svp_prefetch.uclk_khz > in_out->programming->min_clocks.dcn4x.active.uclk_khz)
+		in_out->programming->min_clocks.dcn4x.active.uclk_khz = in_out->programming->min_clocks.dcn4x.svp_prefetch.uclk_khz;
 
-	if (in_out->programming->min_clocks.dcn4.svp_prefetch.fclk_khz > in_out->programming->min_clocks.dcn4.active.fclk_khz)
-		in_out->programming->min_clocks.dcn4.active.fclk_khz = in_out->programming->min_clocks.dcn4.svp_prefetch.fclk_khz;
+	if (in_out->programming->min_clocks.dcn4x.svp_prefetch.fclk_khz > in_out->programming->min_clocks.dcn4x.active.fclk_khz)
+		in_out->programming->min_clocks.dcn4x.active.fclk_khz = in_out->programming->min_clocks.dcn4x.svp_prefetch.fclk_khz;
 
-	if (in_out->programming->min_clocks.dcn4.svp_prefetch.dcfclk_khz > in_out->programming->min_clocks.dcn4.active.dcfclk_khz)
-		in_out->programming->min_clocks.dcn4.active.dcfclk_khz = in_out->programming->min_clocks.dcn4.svp_prefetch.dcfclk_khz;
+	if (in_out->programming->min_clocks.dcn4x.svp_prefetch.dcfclk_khz > in_out->programming->min_clocks.dcn4x.active.dcfclk_khz)
+		in_out->programming->min_clocks.dcn4x.active.dcfclk_khz = in_out->programming->min_clocks.dcn4x.svp_prefetch.dcfclk_khz;
 
 	// need some massaging for the dispclk ramping cases:
 	dispclk_khz = mode_support_result->global.dispclk_khz * (1 + in_out->soc_bb->dcn_downspread_percent / 100.0) * (1.0 + in_out->ip->dispclk_ramp_margin_percent / 100.0);
@@ -556,33 +556,33 @@ static bool map_mode_to_soc_dpm(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_o
 	dispclk_khz = math_max2(dispclk_khz, mode_support_result->global.dispclk_khz * (1 + in_out->soc_bb->dcn_downspread_percent / 100.0));
 
 	add_margin_and_round_to_dfs_grainularity(dispclk_khz, 0.0,
-		(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4.dispclk_khz, &in_out->programming->min_clocks.dcn4.divider_ids.dispclk_did);
+		(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4x.dispclk_khz, &in_out->programming->min_clocks.dcn4x.divider_ids.dispclk_did);
 
 	// DPP Ref is always set to max of all DPP clocks
 	for (i = 0; i < DML2_MAX_DCN_PIPES; i++) {
-		if (in_out->programming->min_clocks.dcn4.dpprefclk_khz < mode_support_result->per_plane[i].dppclk_khz)
-			in_out->programming->min_clocks.dcn4.dpprefclk_khz = mode_support_result->per_plane[i].dppclk_khz;
+		if (in_out->programming->min_clocks.dcn4x.dpprefclk_khz < mode_support_result->per_plane[i].dppclk_khz)
+			in_out->programming->min_clocks.dcn4x.dpprefclk_khz = mode_support_result->per_plane[i].dppclk_khz;
 	}
 
-	add_margin_and_round_to_dfs_grainularity(in_out->programming->min_clocks.dcn4.dpprefclk_khz, in_out->soc_bb->dcn_downspread_percent / 100.0,
-		(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4.dpprefclk_khz, &in_out->programming->min_clocks.dcn4.divider_ids.dpprefclk_did);
+	add_margin_and_round_to_dfs_grainularity(in_out->programming->min_clocks.dcn4x.dpprefclk_khz, in_out->soc_bb->dcn_downspread_percent / 100.0,
+		(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4x.dpprefclk_khz, &in_out->programming->min_clocks.dcn4x.divider_ids.dpprefclk_did);
 
 	for (i = 0; i < DML2_MAX_DCN_PIPES; i++) {
-		in_out->programming->plane_programming[i].min_clocks.dcn4.dppclk_khz = (unsigned long)(in_out->programming->min_clocks.dcn4.dpprefclk_khz / 255.0
-			* math_ceil2(in_out->display_cfg->mode_support_result.per_plane[i].dppclk_khz * (1.0 + in_out->soc_bb->dcn_downspread_percent / 100.0) * 255.0 / in_out->programming->min_clocks.dcn4.dpprefclk_khz, 1.0));
+		in_out->programming->plane_programming[i].min_clocks.dcn4x.dppclk_khz = (unsigned long)(in_out->programming->min_clocks.dcn4x.dpprefclk_khz / 255.0
+			* math_ceil2(in_out->display_cfg->mode_support_result.per_plane[i].dppclk_khz * (1.0 + in_out->soc_bb->dcn_downspread_percent / 100.0) * 255.0 / in_out->programming->min_clocks.dcn4x.dpprefclk_khz, 1.0));
 	}
 
 	// DTB Ref is always set to max of all DTB clocks
 	for (i = 0; i < DML2_MAX_DCN_PIPES; i++) {
-		if (in_out->programming->min_clocks.dcn4.dtbrefclk_khz < mode_support_result->per_stream[i].dtbclk_khz)
-			in_out->programming->min_clocks.dcn4.dtbrefclk_khz = mode_support_result->per_stream[i].dtbclk_khz;
+		if (in_out->programming->min_clocks.dcn4x.dtbrefclk_khz < mode_support_result->per_stream[i].dtbclk_khz)
+			in_out->programming->min_clocks.dcn4x.dtbrefclk_khz = mode_support_result->per_stream[i].dtbclk_khz;
 	}
 
-	add_margin_and_round_to_dfs_grainularity(in_out->programming->min_clocks.dcn4.dtbrefclk_khz, in_out->soc_bb->dcn_downspread_percent / 100.0,
-		(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4.dtbrefclk_khz, &in_out->programming->min_clocks.dcn4.divider_ids.dtbrefclk_did);
+	add_margin_and_round_to_dfs_grainularity(in_out->programming->min_clocks.dcn4x.dtbrefclk_khz, in_out->soc_bb->dcn_downspread_percent / 100.0,
+		(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4x.dtbrefclk_khz, &in_out->programming->min_clocks.dcn4x.divider_ids.dtbrefclk_did);
 
-	in_out->programming->min_clocks.dcn4.deepsleep_dcfclk_khz = mode_support_result->global.dcfclk_deepsleep_khz;
-	in_out->programming->min_clocks.dcn4.socclk_khz = mode_support_result->global.socclk_khz;
+	in_out->programming->min_clocks.dcn4x.deepsleep_dcfclk_khz = mode_support_result->global.dcfclk_deepsleep_khz;
+	in_out->programming->min_clocks.dcn4x.socclk_khz = mode_support_result->global.socclk_khz;
 
 	result = map_min_clocks_to_dpm(mode_support_result, in_out->programming, &in_out->soc_bb->clk_table);
 
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
index 181041d6d177..d36f758971a8 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
@@ -75,108 +75,108 @@ bool hubbub401_program_urgent_watermarks(
 
 	/* Repeat for water mark set A and B */
 	/* clock state A */
-	if (safe_to_lower || watermarks->dcn4.a.urgent > hubbub2->watermarks.dcn4.a.urgent) {
-		hubbub2->watermarks.dcn4.a.urgent = watermarks->dcn4.a.urgent;
+	if (safe_to_lower || watermarks->dcn4x.a.urgent > hubbub2->watermarks.dcn4x.a.urgent) {
+		hubbub2->watermarks.dcn4x.a.urgent = watermarks->dcn4x.a.urgent;
 		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, 0,
-				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, watermarks->dcn4.a.urgent);
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, watermarks->dcn4x.a.urgent);
 		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_A calculated =%d\n"
 			"HW register value = 0x%x\n",
-			watermarks->dcn4.a.urgent, watermarks->dcn4.a.urgent);
-	} else if (watermarks->dcn4.a.urgent < hubbub2->watermarks.dcn4.a.urgent)
+			watermarks->dcn4x.a.urgent, watermarks->dcn4x.a.urgent);
+	} else if (watermarks->dcn4x.a.urgent < hubbub2->watermarks.dcn4x.a.urgent)
 		wm_pending = true;
 
 	/* determine the transfer time for a quantity of data for a particular requestor.*/
-	if (safe_to_lower || watermarks->dcn4.a.frac_urg_bw_flip
-			> hubbub2->watermarks.dcn4.a.frac_urg_bw_flip) {
-		hubbub2->watermarks.dcn4.a.frac_urg_bw_flip = watermarks->dcn4.a.frac_urg_bw_flip;
+	if (safe_to_lower || watermarks->dcn4x.a.frac_urg_bw_flip
+			> hubbub2->watermarks.dcn4x.a.frac_urg_bw_flip) {
+		hubbub2->watermarks.dcn4x.a.frac_urg_bw_flip = watermarks->dcn4x.a.frac_urg_bw_flip;
 		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, 0,
-				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, watermarks->dcn4.a.frac_urg_bw_flip);
-	} else if (watermarks->dcn4.a.frac_urg_bw_flip
-			< hubbub2->watermarks.dcn4.a.frac_urg_bw_flip)
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, watermarks->dcn4x.a.frac_urg_bw_flip);
+	} else if (watermarks->dcn4x.a.frac_urg_bw_flip
+			< hubbub2->watermarks.dcn4x.a.frac_urg_bw_flip)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.a.frac_urg_bw_nom
-			> hubbub2->watermarks.dcn4.a.frac_urg_bw_nom) {
-		hubbub2->watermarks.dcn4.a.frac_urg_bw_nom = watermarks->dcn4.a.frac_urg_bw_nom;
+	if (safe_to_lower || watermarks->dcn4x.a.frac_urg_bw_nom
+			> hubbub2->watermarks.dcn4x.a.frac_urg_bw_nom) {
+		hubbub2->watermarks.dcn4x.a.frac_urg_bw_nom = watermarks->dcn4x.a.frac_urg_bw_nom;
 		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, 0,
-				DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, watermarks->dcn4.a.frac_urg_bw_nom);
-	} else if (watermarks->dcn4.a.frac_urg_bw_nom
-			< hubbub2->watermarks.dcn4.a.frac_urg_bw_nom)
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, watermarks->dcn4x.a.frac_urg_bw_nom);
+	} else if (watermarks->dcn4x.a.frac_urg_bw_nom
+			< hubbub2->watermarks.dcn4x.a.frac_urg_bw_nom)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.a.frac_urg_bw_mall
-			> hubbub2->watermarks.dcn4.a.frac_urg_bw_mall) {
-		hubbub2->watermarks.dcn4.a.frac_urg_bw_mall = watermarks->dcn4.a.frac_urg_bw_mall;
+	if (safe_to_lower || watermarks->dcn4x.a.frac_urg_bw_mall
+			> hubbub2->watermarks.dcn4x.a.frac_urg_bw_mall) {
+		hubbub2->watermarks.dcn4x.a.frac_urg_bw_mall = watermarks->dcn4x.a.frac_urg_bw_mall;
 		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_MALL_A, 0,
-				DCHUBBUB_ARB_FRAC_URG_BW_MALL_A, watermarks->dcn4.a.frac_urg_bw_mall);
-	} else if (watermarks->dcn4.a.frac_urg_bw_mall < hubbub2->watermarks.dcn4.a.frac_urg_bw_mall)
+				DCHUBBUB_ARB_FRAC_URG_BW_MALL_A, watermarks->dcn4x.a.frac_urg_bw_mall);
+	} else if (watermarks->dcn4x.a.frac_urg_bw_mall < hubbub2->watermarks.dcn4x.a.frac_urg_bw_mall)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.a.refcyc_per_trip_to_mem > hubbub2->watermarks.dcn4.a.refcyc_per_trip_to_mem) {
-		hubbub2->watermarks.dcn4.a.refcyc_per_trip_to_mem = watermarks->dcn4.a.refcyc_per_trip_to_mem;
+	if (safe_to_lower || watermarks->dcn4x.a.refcyc_per_trip_to_mem > hubbub2->watermarks.dcn4x.a.refcyc_per_trip_to_mem) {
+		hubbub2->watermarks.dcn4x.a.refcyc_per_trip_to_mem = watermarks->dcn4x.a.refcyc_per_trip_to_mem;
 		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, 0,
-				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, watermarks->dcn4.a.refcyc_per_trip_to_mem);
-	} else if (watermarks->dcn4.a.refcyc_per_trip_to_mem < hubbub2->watermarks.dcn4.a.refcyc_per_trip_to_mem)
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, watermarks->dcn4x.a.refcyc_per_trip_to_mem);
+	} else if (watermarks->dcn4x.a.refcyc_per_trip_to_mem < hubbub2->watermarks.dcn4x.a.refcyc_per_trip_to_mem)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.a.refcyc_per_meta_trip_to_mem > hubbub2->watermarks.dcn4.a.refcyc_per_meta_trip_to_mem) {
-		hubbub2->watermarks.dcn4.a.refcyc_per_meta_trip_to_mem = watermarks->dcn4.a.refcyc_per_meta_trip_to_mem;
+	if (safe_to_lower || watermarks->dcn4x.a.refcyc_per_meta_trip_to_mem > hubbub2->watermarks.dcn4x.a.refcyc_per_meta_trip_to_mem) {
+		hubbub2->watermarks.dcn4x.a.refcyc_per_meta_trip_to_mem = watermarks->dcn4x.a.refcyc_per_meta_trip_to_mem;
 		REG_SET(DCHUBBUB_ARB_REFCYC_PER_META_TRIP_A, 0,
-				DCHUBBUB_ARB_REFCYC_PER_META_TRIP_A, watermarks->dcn4.a.refcyc_per_meta_trip_to_mem);
-	} else if (watermarks->dcn4.a.refcyc_per_meta_trip_to_mem < hubbub2->watermarks.dcn4.a.refcyc_per_meta_trip_to_mem)
+				DCHUBBUB_ARB_REFCYC_PER_META_TRIP_A, watermarks->dcn4x.a.refcyc_per_meta_trip_to_mem);
+	} else if (watermarks->dcn4x.a.refcyc_per_meta_trip_to_mem < hubbub2->watermarks.dcn4x.a.refcyc_per_meta_trip_to_mem)
 		wm_pending = true;
 
 
 	/* clock state B */
-	if (safe_to_lower || watermarks->dcn4.b.urgent > hubbub2->watermarks.dcn4.b.urgent) {
-		hubbub2->watermarks.dcn4.b.urgent = watermarks->dcn4.b.urgent;
+	if (safe_to_lower || watermarks->dcn4x.b.urgent > hubbub2->watermarks.dcn4x.b.urgent) {
+		hubbub2->watermarks.dcn4x.b.urgent = watermarks->dcn4x.b.urgent;
 		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, 0,
-				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, watermarks->dcn4.b.urgent);
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, watermarks->dcn4x.b.urgent);
 		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_B calculated =%d\n"
 			"HW register value = 0x%x\n",
-			watermarks->dcn4.b.urgent, watermarks->dcn4.b.urgent);
-	} else if (watermarks->dcn4.b.urgent < hubbub2->watermarks.dcn4.b.urgent)
+			watermarks->dcn4x.b.urgent, watermarks->dcn4x.b.urgent);
+	} else if (watermarks->dcn4x.b.urgent < hubbub2->watermarks.dcn4x.b.urgent)
 		wm_pending = true;
 
 	/* determine the transfer time for a quantity of data for a particular requestor.*/
-	if (safe_to_lower || watermarks->dcn4.b.frac_urg_bw_flip
-			> hubbub2->watermarks.dcn4.b.frac_urg_bw_flip) {
-		hubbub2->watermarks.dcn4.b.frac_urg_bw_flip = watermarks->dcn4.b.frac_urg_bw_flip;
+	if (safe_to_lower || watermarks->dcn4x.b.frac_urg_bw_flip
+			> hubbub2->watermarks.dcn4x.b.frac_urg_bw_flip) {
+		hubbub2->watermarks.dcn4x.b.frac_urg_bw_flip = watermarks->dcn4x.b.frac_urg_bw_flip;
 		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, 0,
-				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, watermarks->dcn4.b.frac_urg_bw_flip);
-	} else if (watermarks->dcn4.b.frac_urg_bw_flip
-			< hubbub2->watermarks.dcn4.b.frac_urg_bw_flip)
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, watermarks->dcn4x.b.frac_urg_bw_flip);
+	} else if (watermarks->dcn4x.b.frac_urg_bw_flip
+			< hubbub2->watermarks.dcn4x.b.frac_urg_bw_flip)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.b.frac_urg_bw_nom
-			> hubbub2->watermarks.dcn4.b.frac_urg_bw_nom) {
-		hubbub2->watermarks.dcn4.b.frac_urg_bw_nom = watermarks->dcn4.b.frac_urg_bw_nom;
+	if (safe_to_lower || watermarks->dcn4x.b.frac_urg_bw_nom
+			> hubbub2->watermarks.dcn4x.b.frac_urg_bw_nom) {
+		hubbub2->watermarks.dcn4x.b.frac_urg_bw_nom = watermarks->dcn4x.b.frac_urg_bw_nom;
 		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, 0,
-				DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, watermarks->dcn4.b.frac_urg_bw_nom);
-	} else if (watermarks->dcn4.b.frac_urg_bw_nom
-			< hubbub2->watermarks.dcn4.b.frac_urg_bw_nom)
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, watermarks->dcn4x.b.frac_urg_bw_nom);
+	} else if (watermarks->dcn4x.b.frac_urg_bw_nom
+			< hubbub2->watermarks.dcn4x.b.frac_urg_bw_nom)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.b.frac_urg_bw_mall
-			> hubbub2->watermarks.dcn4.b.frac_urg_bw_mall) {
-		hubbub2->watermarks.dcn4.b.frac_urg_bw_mall = watermarks->dcn4.b.frac_urg_bw_mall;
+	if (safe_to_lower || watermarks->dcn4x.b.frac_urg_bw_mall
+			> hubbub2->watermarks.dcn4x.b.frac_urg_bw_mall) {
+		hubbub2->watermarks.dcn4x.b.frac_urg_bw_mall = watermarks->dcn4x.b.frac_urg_bw_mall;
 		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_MALL_B, 0,
-				DCHUBBUB_ARB_FRAC_URG_BW_MALL_B, watermarks->dcn4.b.frac_urg_bw_mall);
-	} else if (watermarks->dcn4.b.frac_urg_bw_mall < hubbub2->watermarks.dcn4.b.frac_urg_bw_mall)
+				DCHUBBUB_ARB_FRAC_URG_BW_MALL_B, watermarks->dcn4x.b.frac_urg_bw_mall);
+	} else if (watermarks->dcn4x.b.frac_urg_bw_mall < hubbub2->watermarks.dcn4x.b.frac_urg_bw_mall)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.b.refcyc_per_trip_to_mem > hubbub2->watermarks.dcn4.b.refcyc_per_trip_to_mem) {
-		hubbub2->watermarks.dcn4.b.refcyc_per_trip_to_mem = watermarks->dcn4.b.refcyc_per_trip_to_mem;
+	if (safe_to_lower || watermarks->dcn4x.b.refcyc_per_trip_to_mem > hubbub2->watermarks.dcn4x.b.refcyc_per_trip_to_mem) {
+		hubbub2->watermarks.dcn4x.b.refcyc_per_trip_to_mem = watermarks->dcn4x.b.refcyc_per_trip_to_mem;
 		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, 0,
-				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, watermarks->dcn4.b.refcyc_per_trip_to_mem);
-	} else if (watermarks->dcn4.b.refcyc_per_trip_to_mem < hubbub2->watermarks.dcn4.b.refcyc_per_trip_to_mem)
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, watermarks->dcn4x.b.refcyc_per_trip_to_mem);
+	} else if (watermarks->dcn4x.b.refcyc_per_trip_to_mem < hubbub2->watermarks.dcn4x.b.refcyc_per_trip_to_mem)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.b.refcyc_per_meta_trip_to_mem > hubbub2->watermarks.dcn4.b.refcyc_per_meta_trip_to_mem) {
-		hubbub2->watermarks.dcn4.b.refcyc_per_meta_trip_to_mem = watermarks->dcn4.b.refcyc_per_meta_trip_to_mem;
+	if (safe_to_lower || watermarks->dcn4x.b.refcyc_per_meta_trip_to_mem > hubbub2->watermarks.dcn4x.b.refcyc_per_meta_trip_to_mem) {
+		hubbub2->watermarks.dcn4x.b.refcyc_per_meta_trip_to_mem = watermarks->dcn4x.b.refcyc_per_meta_trip_to_mem;
 		REG_SET(DCHUBBUB_ARB_REFCYC_PER_META_TRIP_B, 0,
-				DCHUBBUB_ARB_REFCYC_PER_META_TRIP_B, watermarks->dcn4.b.refcyc_per_meta_trip_to_mem);
-	} else if (watermarks->dcn4.b.refcyc_per_meta_trip_to_mem < hubbub2->watermarks.dcn4.b.refcyc_per_meta_trip_to_mem)
+				DCHUBBUB_ARB_REFCYC_PER_META_TRIP_B, watermarks->dcn4x.b.refcyc_per_meta_trip_to_mem);
+	} else if (watermarks->dcn4x.b.refcyc_per_meta_trip_to_mem < hubbub2->watermarks.dcn4x.b.refcyc_per_meta_trip_to_mem)
 		wm_pending = true;
 
 	return wm_pending;
@@ -192,89 +192,89 @@ bool hubbub401_program_stutter_watermarks(
 	bool wm_pending = false;
 
 	/* clock state A */
-	if (safe_to_lower || watermarks->dcn4.a.sr_enter
-			> hubbub2->watermarks.dcn4.a.sr_enter) {
-		hubbub2->watermarks.dcn4.a.sr_enter =
-				watermarks->dcn4.a.sr_enter;
+	if (safe_to_lower || watermarks->dcn4x.a.sr_enter
+			> hubbub2->watermarks.dcn4x.a.sr_enter) {
+		hubbub2->watermarks.dcn4x.a.sr_enter =
+				watermarks->dcn4x.a.sr_enter;
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, 0,
-				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, watermarks->dcn4.a.sr_enter);
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, watermarks->dcn4x.a.sr_enter);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_A calculated =%d\n"
 			"HW register value = 0x%x\n",
-			watermarks->dcn4.a.sr_enter, watermarks->dcn4.a.sr_enter);
+			watermarks->dcn4x.a.sr_enter, watermarks->dcn4x.a.sr_enter);
 		// On dGPU Z states are N/A, so program all other 3 Stutter Enter wm A with the same value
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK1_A, 0,
-				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK1_A, watermarks->dcn4.a.sr_enter);
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK1_A, watermarks->dcn4x.a.sr_enter);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK2_A, 0,
-				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK2_A, watermarks->dcn4.a.sr_enter);
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK2_A, watermarks->dcn4x.a.sr_enter);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK3_A, 0,
-				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK3_A, watermarks->dcn4.a.sr_enter);
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK3_A, watermarks->dcn4x.a.sr_enter);
 
-	} else if (watermarks->dcn4.a.sr_enter
-			< hubbub2->watermarks.dcn4.a.sr_enter)
+	} else if (watermarks->dcn4x.a.sr_enter
+			< hubbub2->watermarks.dcn4x.a.sr_enter)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.a.sr_exit
-			> hubbub2->watermarks.dcn4.a.sr_exit) {
-		hubbub2->watermarks.dcn4.a.sr_exit =
-				watermarks->dcn4.a.sr_exit;
+	if (safe_to_lower || watermarks->dcn4x.a.sr_exit
+			> hubbub2->watermarks.dcn4x.a.sr_exit) {
+		hubbub2->watermarks.dcn4x.a.sr_exit =
+				watermarks->dcn4x.a.sr_exit;
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, 0,
-				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, watermarks->dcn4.a.sr_exit);
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, watermarks->dcn4x.a.sr_exit);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_A calculated =%d\n"
 			"HW register value = 0x%x\n",
-			watermarks->dcn4.a.sr_exit, watermarks->dcn4.a.sr_exit);
+			watermarks->dcn4x.a.sr_exit, watermarks->dcn4x.a.sr_exit);
 		// On dGPU Z states are N/A, so program all other 3 Stutter Exit wm A with the same value
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK1_A, 0,
-				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK1_A, watermarks->dcn4.a.sr_exit);
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK1_A, watermarks->dcn4x.a.sr_exit);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK2_A, 0,
-				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK2_A, watermarks->dcn4.a.sr_exit);
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK2_A, watermarks->dcn4x.a.sr_exit);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK3_A, 0,
-				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK3_A, watermarks->dcn4.a.sr_exit);
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK3_A, watermarks->dcn4x.a.sr_exit);
 
-	} else if (watermarks->dcn4.a.sr_exit
-			< hubbub2->watermarks.dcn4.a.sr_exit)
+	} else if (watermarks->dcn4x.a.sr_exit
+			< hubbub2->watermarks.dcn4x.a.sr_exit)
 		wm_pending = true;
 
 	/* clock state B */
-	if (safe_to_lower || watermarks->dcn4.b.sr_enter
-			> hubbub2->watermarks.dcn4.b.sr_enter) {
-		hubbub2->watermarks.dcn4.b.sr_enter =
-				watermarks->dcn4.b.sr_enter;
+	if (safe_to_lower || watermarks->dcn4x.b.sr_enter
+			> hubbub2->watermarks.dcn4x.b.sr_enter) {
+		hubbub2->watermarks.dcn4x.b.sr_enter =
+				watermarks->dcn4x.b.sr_enter;
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, 0,
-				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, watermarks->dcn4.b.sr_enter);
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, watermarks->dcn4x.b.sr_enter);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_B calculated =%d\n"
 			"HW register value = 0x%x\n",
-			watermarks->dcn4.b.sr_enter, watermarks->dcn4.b.sr_enter);
+			watermarks->dcn4x.b.sr_enter, watermarks->dcn4x.b.sr_enter);
 		// On dGPU Z states are N/A, so program all other 3 Stutter Enter wm A with the same value
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK1_B, 0,
-				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK1_B, watermarks->dcn4.b.sr_enter);
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK1_B, watermarks->dcn4x.b.sr_enter);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK2_B, 0,
-				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK2_B, watermarks->dcn4.b.sr_enter);
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK2_B, watermarks->dcn4x.b.sr_enter);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK3_B, 0,
-				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK3_B, watermarks->dcn4.b.sr_enter);
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK3_B, watermarks->dcn4x.b.sr_enter);
 
-	} else if (watermarks->dcn4.b.sr_enter
-			< hubbub2->watermarks.dcn4.b.sr_enter)
+	} else if (watermarks->dcn4x.b.sr_enter
+			< hubbub2->watermarks.dcn4x.b.sr_enter)
 		wm_pending = true;
 
-	if (safe_to_lower || watermarks->dcn4.b.sr_exit
-			> hubbub2->watermarks.dcn4.b.sr_exit) {
-		hubbub2->watermarks.dcn4.b.sr_exit =
-				watermarks->dcn4.b.sr_exit;
+	if (safe_to_lower || watermarks->dcn4x.b.sr_exit
+			> hubbub2->watermarks.dcn4x.b.sr_exit) {
+		hubbub2->watermarks.dcn4x.b.sr_exit =
+				watermarks->dcn4x.b.sr_exit;
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, 0,
-				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, watermarks->dcn4.b.sr_exit);
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, watermarks->dcn4x.b.sr_exit);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_B calculated =%d\n"
 			"HW register value = 0x%x\n",
-			watermarks->dcn4.b.sr_exit, watermarks->dcn4.b.sr_exit);
+			watermarks->dcn4x.b.sr_exit, watermarks->dcn4x.b.sr_exit);
 		// On dGPU Z states are N/A, so program all other 3 Stutter Exit wm A with the same value
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK1_B, 0,
-				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK1_B, watermarks->dcn4.b.sr_exit);
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK1_B, watermarks->dcn4x.b.sr_exit);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK2_B, 0,
-				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK2_B, watermarks->dcn4.b.sr_exit);
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK2_B, watermarks->dcn4x.b.sr_exit);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK3_B, 0,
-				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK3_B, watermarks->dcn4.b.sr_exit);
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK3_B, watermarks->dcn4x.b.sr_exit);
 
-	} else if (watermarks->dcn4.b.sr_exit
-			< hubbub2->watermarks.dcn4.b.sr_exit)
+	} else if (watermarks->dcn4x.b.sr_exit
+			< hubbub2->watermarks.dcn4x.b.sr_exit)
 		wm_pending = true;
 
 	return wm_pending;
@@ -292,116 +292,116 @@ bool hubbub401_program_pstate_watermarks(
 
 	/* Section for UCLK_PSTATE_CHANGE_WATERMARKS */
 	/* clock state A */
-	if (safe_to_lower || watermarks->dcn4.a.uclk_pstate
-			> hubbub2->watermarks.dcn4.a.uclk_pstate) {
-		hubbub2->watermarks.dcn4.a.uclk_pstate =
-				watermarks->dcn4.a.uclk_pstate;
+	if (safe_to_lower || watermarks->dcn4x.a.uclk_pstate
+			> hubbub2->watermarks.dcn4x.a.uclk_pstate) {
+		hubbub2->watermarks.dcn4x.a.uclk_pstate =
+				watermarks->dcn4x.a.uclk_pstate;
 		REG_SET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, 0,
-				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, watermarks->dcn4.a.uclk_pstate);
+				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, watermarks->dcn4x.a.uclk_pstate);
 		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_A calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.a.uclk_pstate, watermarks->dcn4.a.uclk_pstate);
-	} else if (watermarks->dcn4.a.uclk_pstate
-			< hubbub2->watermarks.dcn4.a.uclk_pstate)
+			watermarks->dcn4x.a.uclk_pstate, watermarks->dcn4x.a.uclk_pstate);
+	} else if (watermarks->dcn4x.a.uclk_pstate
+			< hubbub2->watermarks.dcn4x.a.uclk_pstate)
 		wm_pending = true;
 
 	/* clock state B */
-	if (safe_to_lower || watermarks->dcn4.b.uclk_pstate
-			> hubbub2->watermarks.dcn4.b.uclk_pstate) {
-		hubbub2->watermarks.dcn4.b.uclk_pstate =
-				watermarks->dcn4.b.uclk_pstate;
+	if (safe_to_lower || watermarks->dcn4x.b.uclk_pstate
+			> hubbub2->watermarks.dcn4x.b.uclk_pstate) {
+		hubbub2->watermarks.dcn4x.b.uclk_pstate =
+				watermarks->dcn4x.b.uclk_pstate;
 		REG_SET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, 0,
-				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, watermarks->dcn4.b.uclk_pstate);
+				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, watermarks->dcn4x.b.uclk_pstate);
 		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_B calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.b.uclk_pstate, watermarks->dcn4.b.uclk_pstate);
-	} else if (watermarks->dcn4.b.uclk_pstate
-			< hubbub2->watermarks.dcn4.b.uclk_pstate)
+			watermarks->dcn4x.b.uclk_pstate, watermarks->dcn4x.b.uclk_pstate);
+	} else if (watermarks->dcn4x.b.uclk_pstate
+			< hubbub2->watermarks.dcn4x.b.uclk_pstate)
 		wm_pending = true;
 
 	/* Section for UCLK_PSTATE_CHANGE_WATERMARKS1 (DUMMY_PSTATE/TEMP_READ/PPT) */
-	if (safe_to_lower || watermarks->dcn4.a.temp_read_or_ppt
-			> hubbub2->watermarks.dcn4.a.temp_read_or_ppt) {
-		hubbub2->watermarks.dcn4.a.temp_read_or_ppt =
-				watermarks->dcn4.a.temp_read_or_ppt;
+	if (safe_to_lower || watermarks->dcn4x.a.temp_read_or_ppt
+			> hubbub2->watermarks.dcn4x.a.temp_read_or_ppt) {
+		hubbub2->watermarks.dcn4x.a.temp_read_or_ppt =
+				watermarks->dcn4x.a.temp_read_or_ppt;
 		REG_SET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK1_A, 0,
-				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK1_A, watermarks->dcn4.a.temp_read_or_ppt);
+				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK1_A, watermarks->dcn4x.a.temp_read_or_ppt);
 		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK1_A calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.a.temp_read_or_ppt, watermarks->dcn4.a.temp_read_or_ppt);
-	} else if (watermarks->dcn4.a.temp_read_or_ppt
-			< hubbub2->watermarks.dcn4.a.temp_read_or_ppt)
+			watermarks->dcn4x.a.temp_read_or_ppt, watermarks->dcn4x.a.temp_read_or_ppt);
+	} else if (watermarks->dcn4x.a.temp_read_or_ppt
+			< hubbub2->watermarks.dcn4x.a.temp_read_or_ppt)
 		wm_pending = true;
 
 	/* clock state B */
-	if (safe_to_lower || watermarks->dcn4.b.temp_read_or_ppt
-			> hubbub2->watermarks.dcn4.b.temp_read_or_ppt) {
-		hubbub2->watermarks.dcn4.b.temp_read_or_ppt =
-				watermarks->dcn4.b.temp_read_or_ppt;
+	if (safe_to_lower || watermarks->dcn4x.b.temp_read_or_ppt
+			> hubbub2->watermarks.dcn4x.b.temp_read_or_ppt) {
+		hubbub2->watermarks.dcn4x.b.temp_read_or_ppt =
+				watermarks->dcn4x.b.temp_read_or_ppt;
 		REG_SET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK1_B, 0,
-				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK1_B, watermarks->dcn4.b.temp_read_or_ppt);
+				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK1_B, watermarks->dcn4x.b.temp_read_or_ppt);
 		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK1_B calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.b.temp_read_or_ppt, watermarks->dcn4.b.temp_read_or_ppt);
-	} else if (watermarks->dcn4.b.temp_read_or_ppt
-			< hubbub2->watermarks.dcn4.b.temp_read_or_ppt)
+			watermarks->dcn4x.b.temp_read_or_ppt, watermarks->dcn4x.b.temp_read_or_ppt);
+	} else if (watermarks->dcn4x.b.temp_read_or_ppt
+			< hubbub2->watermarks.dcn4x.b.temp_read_or_ppt)
 		wm_pending = true;
 
 	/* Section for FCLK_PSTATE_CHANGE_WATERMARKS */
 	/* clock state A */
-	if (safe_to_lower || watermarks->dcn4.a.fclk_pstate
-			> hubbub2->watermarks.dcn4.a.fclk_pstate) {
-		hubbub2->watermarks.dcn4.a.fclk_pstate =
-				watermarks->dcn4.a.fclk_pstate;
+	if (safe_to_lower || watermarks->dcn4x.a.fclk_pstate
+			> hubbub2->watermarks.dcn4x.a.fclk_pstate) {
+		hubbub2->watermarks.dcn4x.a.fclk_pstate =
+				watermarks->dcn4x.a.fclk_pstate;
 		REG_SET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A, 0,
-				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A, watermarks->dcn4.a.fclk_pstate);
+				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A, watermarks->dcn4x.a.fclk_pstate);
 		DC_LOG_BANDWIDTH_CALCS("FCLK_CHANGE_WATERMARK_A calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.a.fclk_pstate, watermarks->dcn4.a.fclk_pstate);
-	} else if (watermarks->dcn4.a.fclk_pstate
-			< hubbub2->watermarks.dcn4.a.fclk_pstate)
+			watermarks->dcn4x.a.fclk_pstate, watermarks->dcn4x.a.fclk_pstate);
+	} else if (watermarks->dcn4x.a.fclk_pstate
+			< hubbub2->watermarks.dcn4x.a.fclk_pstate)
 		wm_pending = true;
 
 	/* clock state B */
-	if (safe_to_lower || watermarks->dcn4.b.fclk_pstate
-			> hubbub2->watermarks.dcn4.b.fclk_pstate) {
-		hubbub2->watermarks.dcn4.b.fclk_pstate =
-				watermarks->dcn4.b.fclk_pstate;
+	if (safe_to_lower || watermarks->dcn4x.b.fclk_pstate
+			> hubbub2->watermarks.dcn4x.b.fclk_pstate) {
+		hubbub2->watermarks.dcn4x.b.fclk_pstate =
+				watermarks->dcn4x.b.fclk_pstate;
 		REG_SET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B, 0,
-				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B, watermarks->dcn4.b.fclk_pstate);
+				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B, watermarks->dcn4x.b.fclk_pstate);
 		DC_LOG_BANDWIDTH_CALCS("FCLK_CHANGE_WATERMARK_B calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.b.fclk_pstate, watermarks->dcn4.b.fclk_pstate);
-	} else if (watermarks->dcn4.b.fclk_pstate
-			< hubbub2->watermarks.dcn4.b.fclk_pstate)
+			watermarks->dcn4x.b.fclk_pstate, watermarks->dcn4x.b.fclk_pstate);
+	} else if (watermarks->dcn4x.b.fclk_pstate
+			< hubbub2->watermarks.dcn4x.b.fclk_pstate)
 		wm_pending = true;
 
 	/* Section for FCLK_CHANGE_WATERMARKS1 (DUMMY_PSTATE/TEMP_READ/PPT) */
-	if (safe_to_lower || watermarks->dcn4.a.temp_read_or_ppt
-			> hubbub2->watermarks.dcn4.a.temp_read_or_ppt) {
-		hubbub2->watermarks.dcn4.a.temp_read_or_ppt =
-				watermarks->dcn4.a.temp_read_or_ppt;
+	if (safe_to_lower || watermarks->dcn4x.a.temp_read_or_ppt
+			> hubbub2->watermarks.dcn4x.a.temp_read_or_ppt) {
+		hubbub2->watermarks.dcn4x.a.temp_read_or_ppt =
+				watermarks->dcn4x.a.temp_read_or_ppt;
 		REG_SET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK1_A, 0,
-				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK1_A, watermarks->dcn4.a.temp_read_or_ppt);
+				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK1_A, watermarks->dcn4x.a.temp_read_or_ppt);
 		DC_LOG_BANDWIDTH_CALCS("FCLK_CHANGE_WATERMARK1_A calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.a.temp_read_or_ppt, watermarks->dcn4.a.temp_read_or_ppt);
-	} else if (watermarks->dcn4.a.temp_read_or_ppt
-			< hubbub2->watermarks.dcn4.a.temp_read_or_ppt)
+			watermarks->dcn4x.a.temp_read_or_ppt, watermarks->dcn4x.a.temp_read_or_ppt);
+	} else if (watermarks->dcn4x.a.temp_read_or_ppt
+			< hubbub2->watermarks.dcn4x.a.temp_read_or_ppt)
 		wm_pending = true;
 
 	/* clock state B */
-	if (safe_to_lower || watermarks->dcn4.b.temp_read_or_ppt
-			> hubbub2->watermarks.dcn4.b.temp_read_or_ppt) {
-		hubbub2->watermarks.dcn4.b.temp_read_or_ppt =
-				watermarks->dcn4.b.temp_read_or_ppt;
+	if (safe_to_lower || watermarks->dcn4x.b.temp_read_or_ppt
+			> hubbub2->watermarks.dcn4x.b.temp_read_or_ppt) {
+		hubbub2->watermarks.dcn4x.b.temp_read_or_ppt =
+				watermarks->dcn4x.b.temp_read_or_ppt;
 		REG_SET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK1_B, 0,
-				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK1_B, watermarks->dcn4.b.temp_read_or_ppt);
+				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK1_B, watermarks->dcn4x.b.temp_read_or_ppt);
 		DC_LOG_BANDWIDTH_CALCS("FCLK_CHANGE_WATERMARK1_B calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.b.temp_read_or_ppt, watermarks->dcn4.b.temp_read_or_ppt);
-	} else if (watermarks->dcn4.b.temp_read_or_ppt
-			< hubbub2->watermarks.dcn4.b.temp_read_or_ppt)
+			watermarks->dcn4x.b.temp_read_or_ppt, watermarks->dcn4x.b.temp_read_or_ppt);
+	} else if (watermarks->dcn4x.b.temp_read_or_ppt
+			< hubbub2->watermarks.dcn4x.b.temp_read_or_ppt)
 		wm_pending = true;
 
 	return wm_pending;
@@ -418,29 +418,29 @@ bool hubbub401_program_usr_watermarks(
 	bool wm_pending = false;
 
 	/* clock state A */
-	if (safe_to_lower || watermarks->dcn4.a.usr
-			> hubbub2->watermarks.dcn4.a.usr) {
-		hubbub2->watermarks.dcn4.a.usr = watermarks->dcn4.a.usr;
+	if (safe_to_lower || watermarks->dcn4x.a.usr
+			> hubbub2->watermarks.dcn4x.a.usr) {
+		hubbub2->watermarks.dcn4x.a.usr = watermarks->dcn4x.a.usr;
 		REG_SET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A, 0,
-				DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A, watermarks->dcn4.a.usr);
+				DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A, watermarks->dcn4x.a.usr);
 		DC_LOG_BANDWIDTH_CALCS("USR_RETRAINING_WATERMARK_A calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.a.usr, watermarks->dcn4.a.usr);
-	} else if (watermarks->dcn4.a.usr
-			< hubbub2->watermarks.dcn4.a.usr)
+			watermarks->dcn4x.a.usr, watermarks->dcn4x.a.usr);
+	} else if (watermarks->dcn4x.a.usr
+			< hubbub2->watermarks.dcn4x.a.usr)
 		wm_pending = true;
 
 	/* clock state B */
-	if (safe_to_lower || watermarks->dcn4.b.usr
-			> hubbub2->watermarks.dcn4.b.usr) {
-		hubbub2->watermarks.dcn4.b.usr = watermarks->dcn4.b.usr;
+	if (safe_to_lower || watermarks->dcn4x.b.usr
+			> hubbub2->watermarks.dcn4x.b.usr) {
+		hubbub2->watermarks.dcn4x.b.usr = watermarks->dcn4x.b.usr;
 		REG_SET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, 0,
-				DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, watermarks->dcn4.b.usr);
+				DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, watermarks->dcn4x.b.usr);
 		DC_LOG_BANDWIDTH_CALCS("USR_RETRAINING_WATERMARK_B calculated =%d\n"
 			"HW register value = 0x%x\n\n",
-			watermarks->dcn4.b.usr, watermarks->dcn4.b.usr);
-	} else if (watermarks->dcn4.b.usr
-			< hubbub2->watermarks.dcn4.b.usr)
+			watermarks->dcn4x.b.usr, watermarks->dcn4x.b.usr);
+	} else if (watermarks->dcn4x.b.usr
+			< hubbub2->watermarks.dcn4x.b.usr)
 		wm_pending = true;
 
 	return wm_pending;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
index 5f6c7daa14d9..a8b44f398ce6 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
@@ -63,7 +63,7 @@ union dcn_watermark_set {
 		struct dml2_dchub_watermark_regs b;
 		struct dml2_dchub_watermark_regs c;
 		struct dml2_dchub_watermark_regs d;
-	} dcn4; //dcn4+
+	} dcn4x; //dcn4+
 };
 
 struct dce_watermarks {
-- 
2.39.2


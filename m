Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BAFA044F9
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Jan 2025 16:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648E410E328;
	Tue,  7 Jan 2025 15:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uTx/iJnc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC3810E328
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jan 2025 15:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMhVcZeBRrFt8ARHjkDBDhAnh5zVtwbROgKfnAod5JpGa5mJTc3bjKywhuBv0KAxforFV+Pv2sudkP7Obh4dWld45rCli3+LZzOoCi1SkON3KP85VpEYH8ZU/y4pUygJV0Y7A4UVQAtyPXhfHVBYwAwZT5x8fWyQ0oD27Vb3LkVxObylMc0CamhCK9gC6pp8KJdq9S1dM3Z5g7PefBuDD/Mlpdtn+m4FzVjjRDFPf1IjD6HaPtOw5BDZz2krpeunKwNOSPo8E9Ns1KdRTxdLxMdzKZrSBiOzH8qa1SYg9anKPRqpO0PJJVFQipAQH18Eyi1P0fVfY+3EIG9Vm71w6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9UroFm7MWaDO4LLKWkplz86B3hNf9TAciD5nGd0op0=;
 b=RJHA0fRMuvAFph1OAgw4Cy4ZteNRwLU1hFF3tneThA4BZrk/KL6BCVgd1oqElAo47wudNiKr4OEeJReaeT74cojIAVz2jbRf3Q1B4Pg9vq2aP0FKIhecvRPqbvhlmuJta3vMq4M+hwi5HGk0oYU/QiEN2XI6UhcD76vA5HCJD3dE0PhZBNkL5czrlgVKTpj+V3VffzP20Bh80S3aYcJ6F/auW95xMmGOSJyiMbuG1ifHtGdAqf6B6BKh5YPQSRuUJwB2WPZMaBaoArb8mMIfxnEu8Lxds2RKNql2biE8sCJSE6T4D456ST/2rl8Wn/SnGIsudzplrTwlbQPT1PeYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9UroFm7MWaDO4LLKWkplz86B3hNf9TAciD5nGd0op0=;
 b=uTx/iJnciHz8cleXLyzJcFoH58Nnn0m4AUFuXkpPCHYrHNMTJYh/+Ur7RSY29dpYjxT/6hzKhyz5wF1e6vUbk73K6KtrKlvBgJwSTNOHNCGbng7hVB8bGXcFm3wNYlIyXQcaD642898nTcy9HjZySWi1n8J9/WQZ7Y71LVIdxX8=
Received: from SJ0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:33b::12)
 by MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Tue, 7 Jan
 2025 15:29:29 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::6a) by SJ0PR05CA0007.outlook.office365.com
 (2603:10b6:a03:33b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Tue,
 7 Jan 2025 15:29:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 15:29:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 09:29:27 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 09:29:25 -0600
Received: from tom-r5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 09:29:22 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>, Wayne Lin
 <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, Fangzhi Zuo
 <jerry.zuo@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>, Solomon Chiu
 <solomon.chiu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, "Rafal
 Ostrowski" <rostrows@amd.com>, Austin Zheng <austin.zheng@amd.com>, "Dillon
 Varone" <dillon.varone@amd.com>
Subject: [PATCH 06/24] drm/amd/display: DML2.1 Post-Si Cleanup
Date: Tue, 7 Jan 2025 23:28:37 +0800
Message-ID: <20250107152855.2953302-7-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107152855.2953302-1-chiahsuan.chung@amd.com>
References: <20250107152855.2953302-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|MN6PR12MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a806375-c687-4b65-3033-08dd2f301305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fzfgJY7qqCoPF913DRmNKFQ9YFkEti+iKbWxd5qz+2phtgyd60jieFmUupXa?=
 =?us-ascii?Q?Q/FmcTA6PxEYEigLWUn0mihBrHAkRX5HVhzitz/En5weNezKOxzaRPqTrcVZ?=
 =?us-ascii?Q?T+ktOKiNRI9Cj35RPNEoLrzUp6paQFh0c3HF6Bv0KvBRrHHX1yNWcpvfZYwe?=
 =?us-ascii?Q?f7FHA0n/oLXQhoDC9HPsbRqp8FSIbre/3motiegD9DUH4qkyLqGop0IvFndl?=
 =?us-ascii?Q?n1C3S8CfdH0szf6gHokVsX8JV6NS8STIWMCznm3QPbqSRf1fogSX1QiUHCN1?=
 =?us-ascii?Q?8xt18ABMdfNZC1xo43we/7Ch2l1WPpxq6ufkXa+Q3NM8SUk5ug2IsLPfPBkr?=
 =?us-ascii?Q?dQAXOwAWsda8rdWClif1cEl7ynmpWbx0d3Z3rPs7RHPnzhDvvLPneK5gSd5z?=
 =?us-ascii?Q?Pw0JSZz912Qfsqnt0eHjo+0IE8MkHu4MBboO1BuKGrdZ8KPnsk4bBtDpIa6u?=
 =?us-ascii?Q?gnm0R11uVq1o6moo7Zhhb/P63IztPEsGo19WBt+vADV8ZoSAs3IlmEd1LOle?=
 =?us-ascii?Q?u4svTsFXD0pq2AERgz7ks9AsUAnAlvWBvktglHAL1KZ4wPZY34N9H5Kh8t5X?=
 =?us-ascii?Q?j+FyW2g3ei+fiive9uoUnRra43gTMZsIOXpW3OP/h0VqXoMdYk8wygvVAdza?=
 =?us-ascii?Q?/XCiquAhsjQndofA/6auBm5bJjkmpL9wEOFultfW08+y7INoQ2sNR4W3E36R?=
 =?us-ascii?Q?nvIKy2DK99zcxR9d8U1bvCw2sHkIIn1JXQr/vxKR+w/RO4XR189ULHM6O6e5?=
 =?us-ascii?Q?mGOEiRczow/wvck37W7/QUiMsSt0SwYuhZwbo75luMdhShNDUDipAzuHRFjc?=
 =?us-ascii?Q?vASjAxe3LAYSpsAlkl2rcCJLB7x5xLBNnVE7HMo5E2bUGVsH3PLnWmmZgNyY?=
 =?us-ascii?Q?P7Bt7xegacFt2DhVDdvjlSpg2z6s/4WMOyY+j9Hz/1v/0Ym3tRV8cUaue3N1?=
 =?us-ascii?Q?K8m254Df/j4hqd8Nz7ARXQnAFW4kw3nrD3Bax6eDv0BGHogh8ZqBuYNmGPF0?=
 =?us-ascii?Q?A1gwhzAdPFY+Jw7h30J244f6s6Z/zqNof7pz/5rqEwx4KjTOpdf6rY4/hINj?=
 =?us-ascii?Q?PXLyIblFpuk0jYqkxLi1Z2NUT0dg7nA1YIOpkIq4o9t3ArC30usSilel0CNE?=
 =?us-ascii?Q?BRije1A5qMIGRSjDxl571xBp8gfFcK+W2AoOFrLZhKG9T2m9ctRzINUjajji?=
 =?us-ascii?Q?NCB/PId4SnW4OYEhL5aplNh2iE0ep75P2CyqHqjbW3gYlNIsLF+meJGvC4tW?=
 =?us-ascii?Q?sZ3+WUzf5md2zxpYyhj4UF6nwcB+pm9SRPpELVEFqA6Cvw7hh9Hzslb3yXSf?=
 =?us-ascii?Q?+KqOcSiPY26JP565x7H3kbF/xqsYOAtAn79lvECpF2vTzbbpR8EtROZ9ym0m?=
 =?us-ascii?Q?+XGlZY/5tdqXSrSW0w5uXuWHhQVkRUDNY5zCIBa29ZCeWOrK0Ar++hoeVeiY?=
 =?us-ascii?Q?8gQVt9xpUGYTCFG6cKv+Q6RPYU1S4tNtuHKifvdA5Gyb03aKTEmxFuZ/4WUa?=
 =?us-ascii?Q?jccCpLvko1Ipp2U=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 15:29:27.8646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a806375-c687-4b65-3033-08dd2f301305
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8568
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

From: Rafal Ostrowski <rostrows@amd.com>

[Why]
There are a few cleanup and refactoring tasks that need to be done
with the DML2.1 wrapper and DC interface to remove dependencies on
legacy structures and N-1 prototypes.

[How]
Implemented pipe_ctx->global_sync.
Implemented new functions to use pipe_ctx->hubp_regs and
pipe_ctx->global_sync:
- hubp_setup2
- hubp_setup_interdependent2
- Several other new functions for DCN 4.01 to support newer structures

Removed dml21_update_pipe_ctx_dchub_regs
Removed dml21_extract_legacy_watermark_set
Removed dml21_populate_pipe_ctx_dlg_param
Removed outdated dcn references in DML2.1 wrapper.

Reviewed-by: Austin Zheng <austin.zheng@amd.com>
Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Rafal Ostrowski <rostrows@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  16 +-
 .../dc/dml2/dml21/dml21_translation_helper.c  |  77 --
 .../dc/dml2/dml21/dml21_translation_helper.h  |   2 -
 .../amd/display/dc/dml2/dml21/dml21_utils.c   | 129 +--
 .../amd/display/dc/dml2/dml21/dml21_utils.h   |   8 +-
 .../amd/display/dc/dml2/dml21/dml21_wrapper.c |   8 -
 .../dml21/inc/bounding_boxes/dcn3_soc_bb.h    | 401 ----------
 .../drm/amd/display/dc/dml2/dml2_wrapper.c    |  14 +-
 .../amd/display/dc/hubp/dcn401/dcn401_hubp.c  |  92 ++-
 .../amd/display/dc/hubp/dcn401/dcn401_hubp.h  |  35 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 257 +++---
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.h   |  17 +-
 .../amd/display/dc/hwss/dcn35/dcn35_init.c    |   4 +
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 746 +++++++++++++++++-
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |   9 +-
 .../amd/display/dc/hwss/dcn401/dcn401_init.c  |  10 +-
 .../drm/amd/display/dc/hwss/hw_sequencer.h    |  12 +
 .../gpu/drm/amd/display/dc/inc/core_types.h   |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |  11 +
 .../amd/display/dc/optc/dcn10/dcn10_optc.c    |   1 -
 .../dc/resource/dcn10/dcn10_resource.c        |   8 +-
 .../dc/resource/dcn10/dcn10_resource.h        |   1 +
 .../dc/resource/dcn20/dcn20_resource.c        |   3 +-
 .../dc/resource/dcn201/dcn201_resource.c      |   3 +-
 .../dc/resource/dcn21/dcn21_resource.c        |   1 +
 .../dc/resource/dcn30/dcn30_resource.c        |   1 +
 .../dc/resource/dcn301/dcn301_resource.c      |   3 +-
 .../dc/resource/dcn302/dcn302_resource.c      |   1 +
 .../dc/resource/dcn303/dcn303_resource.c      |   1 +
 .../dc/resource/dcn31/dcn31_resource.c        |   1 +
 .../dc/resource/dcn314/dcn314_resource.c      |   1 +
 .../dc/resource/dcn315/dcn315_resource.c      |   1 +
 .../dc/resource/dcn316/dcn316_resource.c      |   1 +
 .../dc/resource/dcn32/dcn32_resource.c        |   1 +
 .../dc/resource/dcn321/dcn321_resource.c      |   1 +
 .../dc/resource/dcn35/dcn35_resource.c        |   1 +
 .../dc/resource/dcn351/dcn351_resource.c      |   1 +
 .../dc/resource/dcn401/dcn401_resource.c      |   6 +
 38 files changed, 1077 insertions(+), 810 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 626f75b6ad00..520a34a42827 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -4478,7 +4478,7 @@ static void set_hfvs_info_packet(
 static void adaptive_sync_override_dp_info_packets_sdp_line_num(
 		const struct dc_crtc_timing *timing,
 		struct enc_sdp_line_num *sdp_line_num,
-		struct _vcs_dpi_display_pipe_dest_params_st *pipe_dlg_param)
+		unsigned int vstartup_start)
 {
 	uint32_t asic_blank_start = 0;
 	uint32_t asic_blank_end   = 0;
@@ -4493,8 +4493,8 @@ static void adaptive_sync_override_dp_info_packets_sdp_line_num(
 	asic_blank_end = (asic_blank_start - tg->v_border_bottom -
 						tg->v_addressable - tg->v_border_top);
 
-	if (pipe_dlg_param->vstartup_start > asic_blank_end) {
-		v_update = (tg->v_total - (pipe_dlg_param->vstartup_start - asic_blank_end));
+	if (vstartup_start > asic_blank_end) {
+		v_update = (tg->v_total - (vstartup_start - asic_blank_end));
 		sdp_line_num->adaptive_sync_line_num_valid = true;
 		sdp_line_num->adaptive_sync_line_num = (tg->v_total - v_update - 1);
 	} else {
@@ -4507,7 +4507,7 @@ static void set_adaptive_sync_info_packet(
 		struct dc_info_packet *info_packet,
 		const struct dc_stream_state *stream,
 		struct encoder_info_frame *info_frame,
-		struct _vcs_dpi_display_pipe_dest_params_st *pipe_dlg_param)
+		unsigned int vstartup_start)
 {
 	if (!stream->adaptive_sync_infopacket.valid)
 		return;
@@ -4515,7 +4515,7 @@ static void set_adaptive_sync_info_packet(
 	adaptive_sync_override_dp_info_packets_sdp_line_num(
 			&stream->timing,
 			&info_frame->sdp_line_num,
-			pipe_dlg_param);
+			vstartup_start);
 
 	*info_packet = stream->adaptive_sync_infopacket;
 }
@@ -4548,6 +4548,7 @@ void resource_build_info_frame(struct pipe_ctx *pipe_ctx)
 {
 	enum signal_type signal = SIGNAL_TYPE_NONE;
 	struct encoder_info_frame *info = &pipe_ctx->stream_res.encoder_info_frame;
+	unsigned int vstartup_start = 0;
 
 	/* default all packets to invalid */
 	info->avi.valid = false;
@@ -4561,6 +4562,9 @@ void resource_build_info_frame(struct pipe_ctx *pipe_ctx)
 	info->adaptive_sync.valid = false;
 	signal = pipe_ctx->stream->signal;
 
+	if (pipe_ctx->stream->ctx->dc->res_pool->funcs->get_vstartup_for_pipe)
+		vstartup_start = pipe_ctx->stream->ctx->dc->res_pool->funcs->get_vstartup_for_pipe(pipe_ctx);
+
 	/* HDMi and DP have different info packets*/
 	if (dc_is_hdmi_signal(signal)) {
 		set_avi_info_frame(&info->avi, pipe_ctx);
@@ -4582,7 +4586,7 @@ void resource_build_info_frame(struct pipe_ctx *pipe_ctx)
 		set_adaptive_sync_info_packet(&info->adaptive_sync,
 										pipe_ctx->stream,
 										info,
-										&pipe_ctx->pipe_dlg_param);
+										vstartup_start);
 	}
 
 	patch_gamut_packet_checksum(&info->gamut);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index 47a8c770794b..5d46f4e24f6b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -10,7 +10,6 @@
 #include "dml21_utils.h"
 #include "dml21_translation_helper.h"
 #include "bounding_boxes/dcn4_soc_bb.h"
-#include "bounding_boxes/dcn3_soc_bb.h"
 
 static void dml21_init_socbb_params(struct dml2_initialize_instance_in_out *dml_init,
 		const struct dml2_configuration_options *config,
@@ -20,10 +19,6 @@ static void dml21_init_socbb_params(struct dml2_initialize_instance_in_out *dml_
 	const struct dml2_soc_qos_parameters *qos_params;
 
 	switch (in_dc->ctx->dce_version) {
-	case DCN_VERSION_3_2:	// TODO : Temporary for N-1 validation. Remove this after N-1 validation phase is complete.
-		soc_bb = &dml2_socbb_dcn31;
-		qos_params = &dml_dcn31_soc_qos_params;
-		break;
 	case DCN_VERSION_4_01:
 	default:
 		if (config->bb_from_dmub)
@@ -60,9 +55,6 @@ static void dml21_init_ip_params(struct dml2_initialize_instance_in_out *dml_ini
 	const struct dml2_ip_capabilities *ip_caps;
 
 	switch (in_dc->ctx->dce_version) {
-	case DCN_VERSION_3_2:	// TODO : Temporary for N-1 validation. Remove this after N-1 validation phase is complete.
-		ip_caps = &dml2_dcn31_max_ip_caps;
-		break;
 	case DCN_VERSION_4_01:
 	default:
 		ip_caps = &dml2_dcn401_max_ip_caps;
@@ -1091,28 +1083,6 @@ void dml21_copy_clocks_to_dc_state(struct dml2_context *in_ctx, struct dc_state
 	context->bw_ctx.bw.dcn.clk.subvp_prefetch_fclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4x.svp_prefetch_no_throttle.fclk_khz;
 }
 
-void dml21_extract_legacy_watermark_set(const struct dc *in_dc, struct dcn_watermarks *watermark, enum dml2_dchub_watermark_reg_set_index reg_set_idx, struct dml2_context *in_ctx)
-{
-	struct dml2_core_internal_display_mode_lib *mode_lib = &in_ctx->v21.dml_init.dml2_instance->core_instance.clean_me_up.mode_lib;
-	double refclk_freq_in_mhz = (in_ctx->v21.display_config.overrides.hw.dlg_ref_clk_mhz > 0) ? (double)in_ctx->v21.display_config.overrides.hw.dlg_ref_clk_mhz : mode_lib->soc.dchub_refclk_mhz;
-
-	if (reg_set_idx >= DML2_DCHUB_WATERMARK_SET_NUM) {
-		/* invalid register set index */
-		return;
-	}
-
-	/* convert to legacy format (time in ns) */
-	watermark->urgent_ns = ((double)in_ctx->v21.mode_programming.programming->global_regs.wm_regs[reg_set_idx].urgent / refclk_freq_in_mhz) * 1000.0;
-	watermark->pte_meta_urgent_ns = ((double)in_ctx->v21.mode_programming.programming->global_regs.wm_regs[reg_set_idx].urgent / refclk_freq_in_mhz) * 1000.0;
-	watermark->cstate_pstate.cstate_enter_plus_exit_ns = ((double)in_ctx->v21.mode_programming.programming->global_regs.wm_regs[reg_set_idx].sr_enter / refclk_freq_in_mhz) * 1000.0;
-	watermark->cstate_pstate.cstate_exit_ns = ((double)in_ctx->v21.mode_programming.programming->global_regs.wm_regs[reg_set_idx].sr_exit / refclk_freq_in_mhz) * 1000.0;
-	watermark->cstate_pstate.pstate_change_ns = ((double)in_ctx->v21.mode_programming.programming->global_regs.wm_regs[reg_set_idx].uclk_pstate / refclk_freq_in_mhz) * 1000.0;
-	watermark->urgent_latency_ns = ((double)in_ctx->v21.mode_programming.programming->global_regs.wm_regs[reg_set_idx].urgent / refclk_freq_in_mhz) * 1000.0;
-	watermark->cstate_pstate.fclk_pstate_change_ns = ((double)in_ctx->v21.mode_programming.programming->global_regs.wm_regs[reg_set_idx].fclk_pstate / refclk_freq_in_mhz) * 1000.0;
-	watermark->frac_urg_bw_flip = in_ctx->v21.mode_programming.programming->global_regs.wm_regs[reg_set_idx].frac_urg_bw_flip;
-	watermark->frac_urg_bw_nom = in_ctx->v21.mode_programming.programming->global_regs.wm_regs[reg_set_idx].frac_urg_bw_nom;
-}
-
 static struct dml2_dchub_watermark_regs *wm_set_index_to_dc_wm_set(union dcn_watermark_set *watermarks, const enum dml2_dchub_watermark_reg_set_index wm_index)
 {
 	struct dml2_dchub_watermark_regs *wm_regs = NULL;
@@ -1156,53 +1126,6 @@ void dml21_extract_watermark_sets(const struct dc *in_dc, union dcn_watermark_se
 	}
 }
 
-
-void dml21_populate_pipe_ctx_dlg_params(struct dml2_context *dml_ctx, struct dc_state *context, struct pipe_ctx *pipe_ctx, struct dml2_per_stream_programming *stream_programming)
-{
-	unsigned int hactive, vactive, hblank_start, vblank_start, hblank_end, vblank_end;
-	struct dc_crtc_timing *timing = &pipe_ctx->stream->timing;
-	union dml2_global_sync_programming *global_sync = &stream_programming->global_sync;
-
-	hactive = timing->h_addressable + timing->h_border_left + timing->h_border_right + pipe_ctx->hblank_borrow;
-	vactive = timing->v_addressable + timing->v_border_bottom + timing->v_border_top;
-	hblank_start = pipe_ctx->stream->timing.h_total - pipe_ctx->stream->timing.h_front_porch;
-	vblank_start = pipe_ctx->stream->timing.v_total - pipe_ctx->stream->timing.v_front_porch;
-
-	hblank_end = hblank_start - timing->h_addressable - timing->h_border_left - timing->h_border_right - pipe_ctx->hblank_borrow;
-	vblank_end = vblank_start - timing->v_addressable - timing->v_border_top - timing->v_border_bottom;
-
-	if (dml_ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(context, pipe_ctx) == SUBVP_PHANTOM) {
-		/* phantom has its own global sync */
-		global_sync = &stream_programming->phantom_stream.global_sync;
-	}
-
-	pipe_ctx->pipe_dlg_param.vstartup_start = global_sync->dcn4x.vstartup_lines;
-	pipe_ctx->pipe_dlg_param.vupdate_offset = global_sync->dcn4x.vupdate_offset_pixels;
-	pipe_ctx->pipe_dlg_param.vupdate_width = global_sync->dcn4x.vupdate_vupdate_width_pixels;
-	pipe_ctx->pipe_dlg_param.vready_offset = global_sync->dcn4x.vready_offset_pixels;
-	pipe_ctx->pipe_dlg_param.pstate_keepout = global_sync->dcn4x.pstate_keepout_start_lines;
-
-	pipe_ctx->pipe_dlg_param.otg_inst = pipe_ctx->stream_res.tg->inst;
-
-	pipe_ctx->pipe_dlg_param.hactive = hactive;
-	pipe_ctx->pipe_dlg_param.vactive = vactive;
-	pipe_ctx->pipe_dlg_param.htotal = pipe_ctx->stream->timing.h_total;
-	pipe_ctx->pipe_dlg_param.vtotal = pipe_ctx->stream->timing.v_total;
-	pipe_ctx->pipe_dlg_param.hblank_end = hblank_end;
-	pipe_ctx->pipe_dlg_param.vblank_end = vblank_end;
-	pipe_ctx->pipe_dlg_param.hblank_start = hblank_start;
-	pipe_ctx->pipe_dlg_param.vblank_start = vblank_start;
-	pipe_ctx->pipe_dlg_param.vfront_porch = pipe_ctx->stream->timing.v_front_porch;
-	pipe_ctx->pipe_dlg_param.pixel_rate_mhz = pipe_ctx->stream->timing.pix_clk_100hz / 10000.00;
-	pipe_ctx->pipe_dlg_param.refresh_rate = ((timing->pix_clk_100hz * 100) / timing->h_total) / timing->v_total;
-	pipe_ctx->pipe_dlg_param.vtotal_max = pipe_ctx->stream->adjust.v_total_max;
-	pipe_ctx->pipe_dlg_param.vtotal_min = pipe_ctx->stream->adjust.v_total_min;
-	pipe_ctx->pipe_dlg_param.recout_height = pipe_ctx->plane_res.scl_data.recout.height;
-	pipe_ctx->pipe_dlg_param.recout_width = pipe_ctx->plane_res.scl_data.recout.width;
-	pipe_ctx->pipe_dlg_param.full_recout_height = pipe_ctx->plane_res.scl_data.recout.height;
-	pipe_ctx->pipe_dlg_param.full_recout_width = pipe_ctx->plane_res.scl_data.recout.width;
-}
-
 void dml21_map_hw_resources(struct dml2_context *dml_ctx)
 {
 	unsigned int i = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.h
index 476a7f6e4875..069b939c672a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.h
@@ -21,8 +21,6 @@ void dml21_initialize_soc_bb_params(struct dml2_initialize_instance_in_out *dml_
 void dml21_initialize_ip_params(struct dml2_initialize_instance_in_out *dml_init, const struct dml2_configuration_options *config, const struct dc *in_dc);
 bool dml21_map_dc_state_into_dml_display_cfg(const struct dc *in_dc, struct dc_state *context, struct dml2_context *dml_ctx);
 void dml21_copy_clocks_to_dc_state(struct dml2_context *in_ctx, struct dc_state *context);
-void dml21_populate_pipe_ctx_dlg_params(struct dml2_context *dml_ctx, struct dc_state *context, struct pipe_ctx *pipe_ctx, struct dml2_per_stream_programming *stream_programming);
-void dml21_extract_legacy_watermark_set(const struct dc *in_dc, struct dcn_watermarks *watermark, enum dml2_dchub_watermark_reg_set_index reg_set_idx, struct dml2_context *in_ctx);
 void dml21_extract_watermark_sets(const struct dc *in_dc, union dcn_watermark_set *watermarks, struct dml2_context *in_ctx);
 void dml21_map_hw_resources(struct dml2_context *dml_ctx);
 void dml21_get_pipe_mcache_config(struct dc_state *context, struct pipe_ctx *pipe_ctx, struct dml2_per_plane_programming *pln_prog, struct dml2_pipe_configuration_descriptor *mcache_pipe_config);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
index cb966f8d3216..1e56d995cd0e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
@@ -142,108 +142,21 @@ int dml21_find_dc_pipes_for_plane(const struct dc *in_dc,
 	return num_pipes;
 }
 
-
-void dml21_update_pipe_ctx_dchub_regs(struct dml2_display_rq_regs *rq_regs,
-	struct dml2_display_dlg_regs *disp_dlg_regs,
-	struct dml2_display_ttu_regs *disp_ttu_regs,
-	struct pipe_ctx *out)
+void dml21_pipe_populate_global_sync(struct dml2_context *dml_ctx,
+	struct dc_state *context,
+	struct pipe_ctx *pipe_ctx,
+	struct dml2_per_stream_programming *stream_programming)
 {
-	memset(&out->rq_regs, 0, sizeof(out->rq_regs));
-	out->rq_regs.rq_regs_l.chunk_size = rq_regs->rq_regs_l.chunk_size;
-	out->rq_regs.rq_regs_l.min_chunk_size = rq_regs->rq_regs_l.min_chunk_size;
-	//out->rq_regs.rq_regs_l.meta_chunk_size = rq_regs->rq_regs_l.meta_chunk_size;
-	//out->rq_regs.rq_regs_l.min_meta_chunk_size = rq_regs->rq_regs_l.min_meta_chunk_size;
-	out->rq_regs.rq_regs_l.dpte_group_size = rq_regs->rq_regs_l.dpte_group_size;
-	out->rq_regs.rq_regs_l.mpte_group_size = rq_regs->rq_regs_l.mpte_group_size;
-	out->rq_regs.rq_regs_l.swath_height = rq_regs->rq_regs_l.swath_height;
-	out->rq_regs.rq_regs_l.pte_row_height_linear = rq_regs->rq_regs_l.pte_row_height_linear;
-
-	out->rq_regs.rq_regs_c.chunk_size = rq_regs->rq_regs_c.chunk_size;
-	out->rq_regs.rq_regs_c.min_chunk_size = rq_regs->rq_regs_c.min_chunk_size;
-	//out->rq_regs.rq_regs_c.meta_chunk_size = rq_regs->rq_regs_c.meta_chunk_size;
-	//out->rq_regs.rq_regs_c.min_meta_chunk_size = rq_regs->rq_regs_c.min_meta_chunk_size;
-	out->rq_regs.rq_regs_c.dpte_group_size = rq_regs->rq_regs_c.dpte_group_size;
-	out->rq_regs.rq_regs_c.mpte_group_size = rq_regs->rq_regs_c.mpte_group_size;
-	out->rq_regs.rq_regs_c.swath_height = rq_regs->rq_regs_c.swath_height;
-	out->rq_regs.rq_regs_c.pte_row_height_linear = rq_regs->rq_regs_c.pte_row_height_linear;
-
-	out->rq_regs.drq_expansion_mode = rq_regs->drq_expansion_mode;
-	out->rq_regs.prq_expansion_mode = rq_regs->prq_expansion_mode;
-	//out->rq_regs.mrq_expansion_mode = rq_regs->mrq_expansion_mode;
-	out->rq_regs.crq_expansion_mode = rq_regs->crq_expansion_mode;
-	out->rq_regs.plane1_base_address = rq_regs->plane1_base_address;
-	out->unbounded_req = rq_regs->unbounded_request_enabled;
-
-	memset(&out->dlg_regs, 0, sizeof(out->dlg_regs));
-	out->dlg_regs.refcyc_h_blank_end = disp_dlg_regs->refcyc_h_blank_end;
-	out->dlg_regs.dlg_vblank_end = disp_dlg_regs->dlg_vblank_end;
-	out->dlg_regs.min_dst_y_next_start = disp_dlg_regs->min_dst_y_next_start;
-	out->dlg_regs.refcyc_per_htotal = disp_dlg_regs->refcyc_per_htotal;
-	out->dlg_regs.refcyc_x_after_scaler = disp_dlg_regs->refcyc_x_after_scaler;
-	out->dlg_regs.dst_y_after_scaler = disp_dlg_regs->dst_y_after_scaler;
-	out->dlg_regs.dst_y_prefetch = disp_dlg_regs->dst_y_prefetch;
-	out->dlg_regs.dst_y_per_vm_vblank = disp_dlg_regs->dst_y_per_vm_vblank;
-	out->dlg_regs.dst_y_per_row_vblank = disp_dlg_regs->dst_y_per_row_vblank;
-	out->dlg_regs.dst_y_per_vm_flip = disp_dlg_regs->dst_y_per_vm_flip;
-	out->dlg_regs.dst_y_per_row_flip = disp_dlg_regs->dst_y_per_row_flip;
-	out->dlg_regs.ref_freq_to_pix_freq = disp_dlg_regs->ref_freq_to_pix_freq;
-	out->dlg_regs.vratio_prefetch = disp_dlg_regs->vratio_prefetch;
-	out->dlg_regs.vratio_prefetch_c = disp_dlg_regs->vratio_prefetch_c;
-	out->dlg_regs.refcyc_per_tdlut_group = disp_dlg_regs->refcyc_per_tdlut_group;
-	out->dlg_regs.refcyc_per_pte_group_vblank_l = disp_dlg_regs->refcyc_per_pte_group_vblank_l;
-	out->dlg_regs.refcyc_per_pte_group_vblank_c = disp_dlg_regs->refcyc_per_pte_group_vblank_c;
-	//out->dlg_regs.refcyc_per_meta_chunk_vblank_l = disp_dlg_regs->refcyc_per_meta_chunk_vblank_l;
-	//out->dlg_regs.refcyc_per_meta_chunk_vblank_c = disp_dlg_regs->refcyc_per_meta_chunk_vblank_c;
-	out->dlg_regs.refcyc_per_pte_group_flip_l = disp_dlg_regs->refcyc_per_pte_group_flip_l;
-	out->dlg_regs.refcyc_per_pte_group_flip_c = disp_dlg_regs->refcyc_per_pte_group_flip_c;
-	//out->dlg_regs.refcyc_per_meta_chunk_flip_l = disp_dlg_regs->refcyc_per_meta_chunk_flip_l;
-	//out->dlg_regs.refcyc_per_meta_chunk_flip_c = disp_dlg_regs->refcyc_per_meta_chunk_flip_c;
-	out->dlg_regs.dst_y_per_pte_row_nom_l = disp_dlg_regs->dst_y_per_pte_row_nom_l;
-	out->dlg_regs.dst_y_per_pte_row_nom_c = disp_dlg_regs->dst_y_per_pte_row_nom_c;
-	out->dlg_regs.refcyc_per_pte_group_nom_l = disp_dlg_regs->refcyc_per_pte_group_nom_l;
-	out->dlg_regs.refcyc_per_pte_group_nom_c = disp_dlg_regs->refcyc_per_pte_group_nom_c;
-	//out->dlg_regs.dst_y_per_meta_row_nom_l = disp_dlg_regs->dst_y_per_meta_row_nom_l;
-	//out->dlg_regs.dst_y_per_meta_row_nom_c = disp_dlg_regs->dst_y_per_meta_row_nom_c;
-	//out->dlg_regs.refcyc_per_meta_chunk_nom_l = disp_dlg_regs->refcyc_per_meta_chunk_nom_l;
-	//out->dlg_regs.refcyc_per_meta_chunk_nom_c = disp_dlg_regs->refcyc_per_meta_chunk_nom_c;
-	out->dlg_regs.refcyc_per_line_delivery_pre_l = disp_dlg_regs->refcyc_per_line_delivery_pre_l;
-	out->dlg_regs.refcyc_per_line_delivery_pre_c = disp_dlg_regs->refcyc_per_line_delivery_pre_c;
-	out->dlg_regs.refcyc_per_line_delivery_l = disp_dlg_regs->refcyc_per_line_delivery_l;
-	out->dlg_regs.refcyc_per_line_delivery_c = disp_dlg_regs->refcyc_per_line_delivery_c;
-	out->dlg_regs.refcyc_per_vm_group_vblank = disp_dlg_regs->refcyc_per_vm_group_vblank;
-	out->dlg_regs.refcyc_per_vm_group_flip = disp_dlg_regs->refcyc_per_vm_group_flip;
-	out->dlg_regs.refcyc_per_vm_req_vblank = disp_dlg_regs->refcyc_per_vm_req_vblank;
-	out->dlg_regs.refcyc_per_vm_req_flip = disp_dlg_regs->refcyc_per_vm_req_flip;
-	out->dlg_regs.dst_y_offset_cur0 = disp_dlg_regs->dst_y_offset_cur0;
-	out->dlg_regs.chunk_hdl_adjust_cur0 = disp_dlg_regs->chunk_hdl_adjust_cur0;
-	//out->dlg_regs.dst_y_offset_cur1 = disp_dlg_regs->dst_y_offset_cur1;
-	//out->dlg_regs.chunk_hdl_adjust_cur1 = disp_dlg_regs->chunk_hdl_adjust_cur1;
-	out->dlg_regs.vready_after_vcount0 = disp_dlg_regs->vready_after_vcount0;
-	out->dlg_regs.dst_y_delta_drq_limit = disp_dlg_regs->dst_y_delta_drq_limit;
-	out->dlg_regs.refcyc_per_vm_dmdata = disp_dlg_regs->refcyc_per_vm_dmdata;
-	out->dlg_regs.dmdata_dl_delta = disp_dlg_regs->dmdata_dl_delta;
-
-	memset(&out->ttu_regs, 0, sizeof(out->ttu_regs));
-	out->ttu_regs.qos_level_low_wm = disp_ttu_regs->qos_level_low_wm;
-	out->ttu_regs.qos_level_high_wm = disp_ttu_regs->qos_level_high_wm;
-	out->ttu_regs.min_ttu_vblank = disp_ttu_regs->min_ttu_vblank;
-	out->ttu_regs.qos_level_flip = disp_ttu_regs->qos_level_flip;
-	out->ttu_regs.refcyc_per_req_delivery_l = disp_ttu_regs->refcyc_per_req_delivery_l;
-	out->ttu_regs.refcyc_per_req_delivery_c = disp_ttu_regs->refcyc_per_req_delivery_c;
-	out->ttu_regs.refcyc_per_req_delivery_cur0 = disp_ttu_regs->refcyc_per_req_delivery_cur0;
-	//out->ttu_regs.refcyc_per_req_delivery_cur1 = disp_ttu_regs->refcyc_per_req_delivery_cur1;
-	out->ttu_regs.refcyc_per_req_delivery_pre_l = disp_ttu_regs->refcyc_per_req_delivery_pre_l;
-	out->ttu_regs.refcyc_per_req_delivery_pre_c = disp_ttu_regs->refcyc_per_req_delivery_pre_c;
-	out->ttu_regs.refcyc_per_req_delivery_pre_cur0 = disp_ttu_regs->refcyc_per_req_delivery_pre_cur0;
-	//out->ttu_regs.refcyc_per_req_delivery_pre_cur1 = disp_ttu_regs->refcyc_per_req_delivery_pre_cur1;
-	out->ttu_regs.qos_level_fixed_l = disp_ttu_regs->qos_level_fixed_l;
-	out->ttu_regs.qos_level_fixed_c = disp_ttu_regs->qos_level_fixed_c;
-	out->ttu_regs.qos_level_fixed_cur0 = disp_ttu_regs->qos_level_fixed_cur0;
-	//out->ttu_regs.qos_level_fixed_cur1 = disp_ttu_regs->qos_level_fixed_cur1;
-	out->ttu_regs.qos_ramp_disable_l = disp_ttu_regs->qos_ramp_disable_l;
-	out->ttu_regs.qos_ramp_disable_c = disp_ttu_regs->qos_ramp_disable_c;
-	out->ttu_regs.qos_ramp_disable_cur0 = disp_ttu_regs->qos_ramp_disable_cur0;
-	//out->ttu_regs.qos_ramp_disable_cur1 = disp_ttu_regs->qos_ramp_disable_cur1;
+	union dml2_global_sync_programming *global_sync = &stream_programming->global_sync;
+
+	if (dml_ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(context, pipe_ctx) == SUBVP_PHANTOM) {
+		/* phantom has its own global sync */
+		global_sync = &stream_programming->phantom_stream.global_sync;
+	}
+
+	memcpy(&pipe_ctx->global_sync,
+		global_sync,
+		sizeof(union dml2_global_sync_programming));
 }
 
 void dml21_populate_mall_allocation_size(struct dc_state *context,
@@ -301,28 +214,16 @@ void dml21_program_dc_pipe(struct dml2_context *dml_ctx, struct dc_state *contex
 {
 	unsigned int pipe_reg_index = 0;
 
-	dml21_populate_pipe_ctx_dlg_params(dml_ctx, context, pipe_ctx, stream_prog);
+	dml21_pipe_populate_global_sync(dml_ctx, context, pipe_ctx, stream_prog);
 	find_pipe_regs_idx(dml_ctx, pipe_ctx, &pipe_reg_index);
 
 	if (dml_ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(context, pipe_ctx) == SUBVP_PHANTOM) {
 		memcpy(&pipe_ctx->hubp_regs, pln_prog->phantom_plane.pipe_regs[pipe_reg_index], sizeof(struct dml2_dchub_per_pipe_register_set));
 		pipe_ctx->unbounded_req = false;
-
-		/* legacy only, should be removed later */
-		dml21_update_pipe_ctx_dchub_regs(&pln_prog->phantom_plane.pipe_regs[pipe_reg_index]->rq_regs,
-				&pln_prog->phantom_plane.pipe_regs[pipe_reg_index]->dlg_regs,
-				&pln_prog->phantom_plane.pipe_regs[pipe_reg_index]->ttu_regs, pipe_ctx);
-
 		pipe_ctx->det_buffer_size_kb = 0;
 	} else {
 		memcpy(&pipe_ctx->hubp_regs, pln_prog->pipe_regs[pipe_reg_index], sizeof(struct dml2_dchub_per_pipe_register_set));
 		pipe_ctx->unbounded_req = pln_prog->pipe_regs[pipe_reg_index]->rq_regs.unbounded_request_enabled;
-
-		/* legacy only, should be removed later */
-		dml21_update_pipe_ctx_dchub_regs(&pln_prog->pipe_regs[pipe_reg_index]->rq_regs,
-				&pln_prog->pipe_regs[pipe_reg_index]->dlg_regs,
-				&pln_prog->pipe_regs[pipe_reg_index]->ttu_regs, pipe_ctx);
-
 		pipe_ctx->det_buffer_size_kb = pln_prog->pipe_regs[pipe_reg_index]->det_size * 64;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.h
index d5153fbac921..4bff52eaaef8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.h
@@ -18,10 +18,10 @@ struct dml2_display_ttu_regs;
 int dml21_helper_find_dml_pipe_idx_by_stream_id(struct dml2_context *ctx, unsigned int stream_id);
 int dml21_find_dml_pipe_idx_by_plane_id(struct dml2_context *ctx, unsigned int plane_id);
 bool dml21_get_plane_id(const struct dc_state *state, const struct dc_plane_state *plane, unsigned int *plane_id);
-void dml21_update_pipe_ctx_dchub_regs(struct dml2_display_rq_regs *rq_regs,
-	struct dml2_display_dlg_regs *disp_dlg_regs,
-	struct dml2_display_ttu_regs *disp_ttu_regs,
-	struct pipe_ctx *out);
+void dml21_pipe_populate_global_sync(struct dml2_context *dml_ctx,
+		struct dc_state *context,
+		struct pipe_ctx *pipe_ctx,
+		struct dml2_per_stream_programming *stream_programming);
 void dml21_populate_mall_allocation_size(struct dc_state *context,
 		struct dml2_context *in_ctx,
 		struct dml2_per_plane_programming *pln_prog,
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index bbc28b9a15a3..fb80ba9287b6 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -75,7 +75,6 @@ static void dml21_init(const struct dc *in_dc, struct dml2_context **dml_ctx, co
 {
 	switch (in_dc->ctx->dce_version) {
 	case DCN_VERSION_4_01:
-	case DCN_VERSION_3_2:	// TODO : Temporary for N-1 validation. Remove this after N-1 validation phase is complete.
 		(*dml_ctx)->v21.dml_init.options.project_id = dml2_project_dcn4x_stage2_auto_drr_svp;
 		break;
 	default:
@@ -233,13 +232,6 @@ static bool dml21_mode_check_and_programming(const struct dc *in_dc, struct dc_s
 		dml21_calculate_rq_and_dlg_params(in_dc, context, &context->res_ctx, dml_ctx, in_dc->res_pool->pipe_count);
 		dml21_copy_clocks_to_dc_state(dml_ctx, context);
 		dml21_extract_watermark_sets(in_dc, &context->bw_ctx.bw.dcn.watermarks, dml_ctx);
-		if (in_dc->ctx->dce_version == DCN_VERSION_3_2) {
-			dml21_extract_legacy_watermark_set(in_dc, &context->bw_ctx.bw.dcn.watermarks.a, DML2_DCHUB_WATERMARK_SET_A, dml_ctx);
-			dml21_extract_legacy_watermark_set(in_dc, &context->bw_ctx.bw.dcn.watermarks.b, DML2_DCHUB_WATERMARK_SET_A, dml_ctx);
-			dml21_extract_legacy_watermark_set(in_dc, &context->bw_ctx.bw.dcn.watermarks.c, DML2_DCHUB_WATERMARK_SET_A, dml_ctx);
-			dml21_extract_legacy_watermark_set(in_dc, &context->bw_ctx.bw.dcn.watermarks.d, DML2_DCHUB_WATERMARK_SET_A, dml_ctx);
-		}
-
 		dml21_build_fams2_programming(in_dc, context, dml_ctx);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h
deleted file mode 100644
index d82c681a5402..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h
+++ /dev/null
@@ -1,401 +0,0 @@
-/*
- * Copyright 2022 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: AMD
- *
- */
-
-#ifndef __DML_DML_DCN3_SOC_BB__
-#define __DML_DML_DCN3_SOC_BB__
-
-#include "dml_top_soc_parameter_types.h"
-
-static const struct dml2_soc_qos_parameters dml_dcn31_soc_qos_params = {
-	.derate_table = {
-		.system_active_urgent = {
-			.dram_derate_percent_pixel = 22,
-			.dram_derate_percent_vm = 0,
-			.dram_derate_percent_pixel_and_vm = 0,
-			.fclk_derate_percent = 76,
-			.dcfclk_derate_percent = 100,
-		},
-		.system_active_average = {
-			.dram_derate_percent_pixel = 17,
-			.dram_derate_percent_vm = 0,
-			.dram_derate_percent_pixel_and_vm = 0,
-			.fclk_derate_percent = 57,
-			.dcfclk_derate_percent = 75,
-		},
-		.dcn_mall_prefetch_urgent = {
-			.dram_derate_percent_pixel = 22,
-			.dram_derate_percent_vm = 0,
-			.dram_derate_percent_pixel_and_vm = 0,
-			.fclk_derate_percent = 76,
-			.dcfclk_derate_percent = 100,
-		},
-		.dcn_mall_prefetch_average = {
-			.dram_derate_percent_pixel = 17,
-			.dram_derate_percent_vm = 0,
-			.dram_derate_percent_pixel_and_vm = 0,
-			.fclk_derate_percent = 57,
-			.dcfclk_derate_percent = 75,
-		},
-		.system_idle_average = {
-			.dram_derate_percent_pixel = 17,
-			.dram_derate_percent_vm = 0,
-			.dram_derate_percent_pixel_and_vm = 0,
-			.fclk_derate_percent = 57,
-			.dcfclk_derate_percent = 100,
-		},
-	},
-	.writeback = {
-		.base_latency_us = 12,
-		.scaling_factor_us = 0,
-		.scaling_factor_mhz = 0,
-	},
-	.qos_params = {
-		.dcn4x = {
-			.df_qos_response_time_fclk_cycles = 300,
-			.max_round_trip_to_furthest_cs_fclk_cycles = 350,
-			.mall_overhead_fclk_cycles = 50,
-			.meta_trip_adder_fclk_cycles = 36,
-			.average_transport_distance_fclk_cycles = 257,
-			.umc_urgent_ramp_latency_margin = 50,
-			.umc_max_latency_margin = 30,
-			.umc_average_latency_margin = 20,
-			.fabric_max_transport_latency_margin = 20,
-			.fabric_average_transport_latency_margin = 10,
-
-			.per_uclk_dpm_params = {
-				{
-					.minimum_uclk_khz = 97,
-					.urgent_ramp_uclk_cycles = 472,
-					.trip_to_memory_uclk_cycles = 827,
-					.meta_trip_to_memory_uclk_cycles = 827,
-					.maximum_latency_when_urgent_uclk_cycles = 72,
-					.average_latency_when_urgent_uclk_cycles = 61,
-					.maximum_latency_when_non_urgent_uclk_cycles = 827,
-					.average_latency_when_non_urgent_uclk_cycles = 118,
-				},
-				{
-					.minimum_uclk_khz = 435,
-					.urgent_ramp_uclk_cycles = 546,
-					.trip_to_memory_uclk_cycles = 848,
-					.meta_trip_to_memory_uclk_cycles = 848,
-					.maximum_latency_when_urgent_uclk_cycles = 146,
-					.average_latency_when_urgent_uclk_cycles = 90,
-					.maximum_latency_when_non_urgent_uclk_cycles = 848,
-					.average_latency_when_non_urgent_uclk_cycles = 135,
-				},
-				{
-					.minimum_uclk_khz = 731,
-					.urgent_ramp_uclk_cycles = 632,
-					.trip_to_memory_uclk_cycles = 874,
-					.meta_trip_to_memory_uclk_cycles = 874,
-					.maximum_latency_when_urgent_uclk_cycles = 232,
-					.average_latency_when_urgent_uclk_cycles = 124,
-					.maximum_latency_when_non_urgent_uclk_cycles = 874,
-					.average_latency_when_non_urgent_uclk_cycles = 155,
-				},
-				{
-					.minimum_uclk_khz = 1187,
-					.urgent_ramp_uclk_cycles = 716,
-					.trip_to_memory_uclk_cycles = 902,
-					.meta_trip_to_memory_uclk_cycles = 902,
-					.maximum_latency_when_urgent_uclk_cycles = 316,
-					.average_latency_when_urgent_uclk_cycles = 160,
-					.maximum_latency_when_non_urgent_uclk_cycles = 902,
-					.average_latency_when_non_urgent_uclk_cycles = 177,
-				},
-			},
-		},
-	},
-	.qos_type = dml2_qos_param_type_dcn4x,
-};
-
-static const struct dml2_soc_bb dml2_socbb_dcn31 = {
-	.clk_table = {
-		.uclk = {
-				.clk_values_khz = {97000, 435000, 731000, 1187000},
-				.num_clk_values = 4,
-		},
-		.fclk = {
-				.clk_values_khz = {300000, 2500000},
-				.num_clk_values = 2,
-		},
-		.dcfclk = {
-				.clk_values_khz = {200000, 1800000},
-				.num_clk_values = 2,
-		},
-		.dispclk = {
-				.clk_values_khz = {100000, 2000000},
-				.num_clk_values = 2,
-		},
-		.dppclk = {
-				.clk_values_khz = {100000, 2000000},
-				.num_clk_values = 2,
-		},
-		.dtbclk = {
-				.clk_values_khz = {100000, 2000000},
-				.num_clk_values = 2,
-		},
-		.phyclk = {
-				.clk_values_khz = {810000, 810000},
-				.num_clk_values = 2,
-		},
-		.socclk = {
-				.clk_values_khz = {300000, 1600000},
-				.num_clk_values = 2,
-		},
-		.dscclk = {
-				.clk_values_khz = {666667, 666667},
-				.num_clk_values = 2,
-		},
-		.phyclk_d18 = {
-				.clk_values_khz = {625000, 625000},
-				.num_clk_values = 2,
-		},
-		.phyclk_d32 = {
-				.clk_values_khz = {2000000, 2000000},
-				.num_clk_values = 2,
-		},
-		.dram_config = {
-			.channel_width_bytes = 2,
-			.channel_count = 16,
-			.transactions_per_clock = 16,
-		},
-	},
-
-	.qos_parameters = {
-		.derate_table = {
-			.system_active_urgent = {
-				.dram_derate_percent_pixel = 22,
-				.dram_derate_percent_vm = 0,
-				.dram_derate_percent_pixel_and_vm = 0,
-				.fclk_derate_percent = 76,
-				.dcfclk_derate_percent = 100,
-			},
-			.system_active_average = {
-				.dram_derate_percent_pixel = 17,
-				.dram_derate_percent_vm = 0,
-				.dram_derate_percent_pixel_and_vm = 0,
-				.fclk_derate_percent = 57,
-				.dcfclk_derate_percent = 75,
-			},
-			.dcn_mall_prefetch_urgent = {
-				.dram_derate_percent_pixel = 22,
-				.dram_derate_percent_vm = 0,
-				.dram_derate_percent_pixel_and_vm = 0,
-				.fclk_derate_percent = 76,
-				.dcfclk_derate_percent = 100,
-			},
-			.dcn_mall_prefetch_average = {
-				.dram_derate_percent_pixel = 17,
-				.dram_derate_percent_vm = 0,
-				.dram_derate_percent_pixel_and_vm = 0,
-				.fclk_derate_percent = 57,
-				.dcfclk_derate_percent = 75,
-			},
-			.system_idle_average = {
-				.dram_derate_percent_pixel = 17,
-				.dram_derate_percent_vm = 0,
-				.dram_derate_percent_pixel_and_vm = 0,
-				.fclk_derate_percent = 57,
-				.dcfclk_derate_percent = 100,
-			},
-		},
-		.writeback = {
-			.base_latency_us = 0,
-			.scaling_factor_us = 0,
-			.scaling_factor_mhz = 0,
-		},
-		.qos_params = {
-			.dcn4x = {
-				.df_qos_response_time_fclk_cycles = 300,
-				.max_round_trip_to_furthest_cs_fclk_cycles = 350,
-				.mall_overhead_fclk_cycles = 50,
-				.meta_trip_adder_fclk_cycles = 36,
-				.average_transport_distance_fclk_cycles = 260,
-				.umc_urgent_ramp_latency_margin = 50,
-				.umc_max_latency_margin = 30,
-				.umc_average_latency_margin = 20,
-				.fabric_max_transport_latency_margin = 20,
-				.fabric_average_transport_latency_margin = 10,
-
-				.per_uclk_dpm_params = {
-					{
-						// State 1
-						.minimum_uclk_khz = 0,
-						.urgent_ramp_uclk_cycles = 472,
-						.trip_to_memory_uclk_cycles = 827,
-						.meta_trip_to_memory_uclk_cycles = 827,
-						.maximum_latency_when_urgent_uclk_cycles = 72,
-						.average_latency_when_urgent_uclk_cycles = 72,
-						.maximum_latency_when_non_urgent_uclk_cycles = 827,
-						.average_latency_when_non_urgent_uclk_cycles = 117,
-					},
-					{
-						// State 2
-						.minimum_uclk_khz = 0,
-						.urgent_ramp_uclk_cycles = 546,
-						.trip_to_memory_uclk_cycles = 848,
-						.meta_trip_to_memory_uclk_cycles = 848,
-						.maximum_latency_when_urgent_uclk_cycles = 146,
-						.average_latency_when_urgent_uclk_cycles = 146,
-						.maximum_latency_when_non_urgent_uclk_cycles = 848,
-						.average_latency_when_non_urgent_uclk_cycles = 133,
-					},
-					{
-						// State 3
-						.minimum_uclk_khz = 0,
-						.urgent_ramp_uclk_cycles = 564,
-						.trip_to_memory_uclk_cycles = 853,
-						.meta_trip_to_memory_uclk_cycles = 853,
-						.maximum_latency_when_urgent_uclk_cycles = 164,
-						.average_latency_when_urgent_uclk_cycles = 164,
-						.maximum_latency_when_non_urgent_uclk_cycles = 853,
-						.average_latency_when_non_urgent_uclk_cycles = 136,
-					},
-					{
-						// State 4
-						.minimum_uclk_khz = 0,
-						.urgent_ramp_uclk_cycles = 613,
-						.trip_to_memory_uclk_cycles = 869,
-						.meta_trip_to_memory_uclk_cycles = 869,
-						.maximum_latency_when_urgent_uclk_cycles = 213,
-						.average_latency_when_urgent_uclk_cycles = 213,
-						.maximum_latency_when_non_urgent_uclk_cycles = 869,
-						.average_latency_when_non_urgent_uclk_cycles = 149,
-					},
-					{
-						// State 5
-						.minimum_uclk_khz = 0,
-						.urgent_ramp_uclk_cycles = 632,
-						.trip_to_memory_uclk_cycles = 874,
-						.meta_trip_to_memory_uclk_cycles = 874,
-						.maximum_latency_when_urgent_uclk_cycles = 232,
-						.average_latency_when_urgent_uclk_cycles = 232,
-						.maximum_latency_when_non_urgent_uclk_cycles = 874,
-						.average_latency_when_non_urgent_uclk_cycles = 153,
-					},
-					{
-						// State 6
-						.minimum_uclk_khz = 0,
-						.urgent_ramp_uclk_cycles = 665,
-						.trip_to_memory_uclk_cycles = 885,
-						.meta_trip_to_memory_uclk_cycles = 885,
-						.maximum_latency_when_urgent_uclk_cycles = 265,
-						.average_latency_when_urgent_uclk_cycles = 265,
-						.maximum_latency_when_non_urgent_uclk_cycles = 885,
-						.average_latency_when_non_urgent_uclk_cycles = 161,
-					},
-					{
-						// State 7
-						.minimum_uclk_khz = 0,
-						.urgent_ramp_uclk_cycles = 689,
-						.trip_to_memory_uclk_cycles = 895,
-						.meta_trip_to_memory_uclk_cycles = 895,
-						.maximum_latency_when_urgent_uclk_cycles = 289,
-						.average_latency_when_urgent_uclk_cycles = 289,
-						.maximum_latency_when_non_urgent_uclk_cycles = 895,
-						.average_latency_when_non_urgent_uclk_cycles = 167,
-					},
-					{
-						// State 8
-						.minimum_uclk_khz = 0,
-						.urgent_ramp_uclk_cycles = 716,
-						.trip_to_memory_uclk_cycles = 902,
-						.meta_trip_to_memory_uclk_cycles = 902,
-						.maximum_latency_when_urgent_uclk_cycles = 316,
-						.average_latency_when_urgent_uclk_cycles = 316,
-						.maximum_latency_when_non_urgent_uclk_cycles = 902,
-						.average_latency_when_non_urgent_uclk_cycles = 174,
-					},
-				},
-			},
-		},
-		.qos_type = dml2_qos_param_type_dcn4x,
-	},
-
-	.power_management_parameters = {
-		.dram_clk_change_blackout_us = 400,
-		.fclk_change_blackout_us = 0,
-		.g7_ppt_blackout_us = 0,
-		.stutter_enter_plus_exit_latency_us = 50,
-		.stutter_exit_latency_us = 43,
-		.z8_stutter_enter_plus_exit_latency_us = 0,
-		.z8_stutter_exit_latency_us = 0,
-	},
-
-	 .vmin_limit = {
-		.dispclk_khz = 600 * 1000,
-	 },
-
-	.dprefclk_mhz = 700,
-	.xtalclk_mhz = 100,
-	.pcie_refclk_mhz = 100,
-	.dchub_refclk_mhz = 50,
-	.mall_allocated_for_dcn_mbytes = 64,
-	.max_outstanding_reqs = 512,
-	.fabric_datapath_to_dcn_data_return_bytes = 64,
-	.return_bus_width_bytes = 64,
-	.hostvm_min_page_size_kbytes = 0,
-	.gpuvm_min_page_size_kbytes = 256,
-	.phy_downspread_percent = 0,
-	.dcn_downspread_percent = 0,
-	.dispclk_dppclk_vco_speed_mhz = 4500,
-	.do_urgent_latency_adjustment = 0,
-	.mem_word_bytes = 32,
-	.num_dcc_mcaches = 8,
-	.mcache_size_bytes = 2048,
-	.mcache_line_size_bytes = 32,
-	.max_fclk_for_uclk_dpm_khz = 1250 * 1000,
-};
-
-static const struct dml2_ip_capabilities dml2_dcn31_max_ip_caps = {
-	.pipe_count = 4,
-	.otg_count = 4,
-	.num_dsc = 4,
-	.max_num_dp2p0_streams = 4,
-	.max_num_hdmi_frl_outputs = 1,
-	.max_num_dp2p0_outputs = 4,
-	.rob_buffer_size_kbytes = 192,
-	.config_return_buffer_size_in_kbytes = 1152,
-	.meta_fifo_size_in_kentries = 22,
-	.compressed_buffer_segment_size_in_kbytes = 64,
-	.subvp_drr_scheduling_margin_us = 100,
-	.subvp_prefetch_end_to_mall_start_us = 15,
-	.subvp_fw_processing_delay = 15,
-
-	.fams2 = {
-		.max_allow_delay_us = 100 * 1000,
-		.scheduling_delay_us = 50,
-		.vertical_interrupt_ack_delay_us = 18,
-		.allow_programming_delay_us = 18,
-		.min_allow_width_us = 20,
-		.subvp_df_throttle_delay_us = 100,
-		.subvp_programming_delay_us = 18,
-		.subvp_prefetch_to_mall_delay_us = 18,
-		.drr_programming_delay_us = 18,
-	},
-};
-
-#endif /* __DML_DML_DCN3_SOC_BB__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
index 340791d40ecb..68b882d28195 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
@@ -747,11 +747,10 @@ static inline struct dml2_context *dml2_allocate_memory(void)
 
 static void dml2_init(const struct dc *in_dc, const struct dml2_configuration_options *config, struct dml2_context **dml2)
 {
-	// TODO : Temporarily add DCN_VERSION_3_2 for N-1 validation. Remove DCN_VERSION_3_2 after N-1 validation phase is complete.
-        if ((in_dc->debug.using_dml21) && (in_dc->ctx->dce_version == DCN_VERSION_4_01 || in_dc->ctx->dce_version == DCN_VERSION_3_2)) {
-                dml21_reinit(in_dc, dml2, config);
+	if ((in_dc->debug.using_dml21) && (in_dc->ctx->dce_version == DCN_VERSION_4_01)) {
+		dml21_reinit(in_dc, dml2, config);
 		return;
-        }
+	}
 
 	// Store config options
 	(*dml2)->config = *config;
@@ -786,10 +785,8 @@ static void dml2_init(const struct dc *in_dc, const struct dml2_configuration_op
 
 bool dml2_create(const struct dc *in_dc, const struct dml2_configuration_options *config, struct dml2_context **dml2)
 {
-	// TODO : Temporarily add DCN_VERSION_3_2 for N-1 validation. Remove DCN_VERSION_3_2 after N-1 validation phase is complete.
-	if ((in_dc->debug.using_dml21) && (in_dc->ctx->dce_version == DCN_VERSION_4_01 || in_dc->ctx->dce_version == DCN_VERSION_3_2)) {
+	if ((in_dc->debug.using_dml21) && (in_dc->ctx->dce_version == DCN_VERSION_4_01))
 		return dml21_create(in_dc, dml2, config);
-	}
 
 	// Allocate Mode Lib Ctx
 	*dml2 = dml2_allocate_memory();
@@ -857,8 +854,7 @@ void dml2_reinit(const struct dc *in_dc,
 				 const struct dml2_configuration_options *config,
 				 struct dml2_context **dml2)
 {
-	// TODO : Temporarily add DCN_VERSION_3_2 for N-1 validation. Remove DCN_VERSION_3_2 after N-1 validation phase is complete.
-	if ((in_dc->debug.using_dml21) && (in_dc->ctx->dce_version == DCN_VERSION_4_01 || in_dc->ctx->dce_version == DCN_VERSION_3_2)) {
+	if ((in_dc->debug.using_dml21) && (in_dc->ctx->dce_version == DCN_VERSION_4_01)) {
 		dml21_reinit(in_dc, dml2, config);
 		return;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
index d38e3f3a1107..28ceceaf9e31 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
@@ -145,30 +145,44 @@ void hubp401_init(struct hubp *hubp)
 }
 
 void hubp401_vready_at_or_After_vsync(struct hubp *hubp,
-		struct _vcs_dpi_display_pipe_dest_params_st *pipe_dest)
+	union dml2_global_sync_programming *pipe_global_sync,
+	struct dc_crtc_timing *timing)
 {
-	uint32_t value = 0;
+	unsigned int vstartup_lines = pipe_global_sync->dcn4x.vstartup_lines;
+	unsigned int vupdate_offset_pixels = pipe_global_sync->dcn4x.vupdate_offset_pixels;
+	unsigned int vupdate_width_pixels = pipe_global_sync->dcn4x.vupdate_vupdate_width_pixels;
+	unsigned int vready_offset_pixels = pipe_global_sync->dcn4x.vready_offset_pixels;
+	unsigned int htotal = timing->h_total;
+	unsigned int vblank_start = 0;
+	unsigned int vblank_end = 0;
+	unsigned int pixel_width = 0;
+	uint32_t reg_value = 0;
+	bool is_vready_at_or_after_vsync = false;
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
 	/*
 	 * if (VSTARTUP_START - (VREADY_OFFSET+VUPDATE_WIDTH+VUPDATE_OFFSET)/htotal) <= OTG_V_BLANK_END
 	 *	Set HUBP_VREADY_AT_OR_AFTER_VSYNC = 1
 	 * else
 	 *	Set HUBP_VREADY_AT_OR_AFTER_VSYNC = 0
 	 */
-	if (pipe_dest->htotal != 0) {
-		if ((pipe_dest->vstartup_start - (pipe_dest->vready_offset+pipe_dest->vupdate_width
-			+ pipe_dest->vupdate_offset) / pipe_dest->htotal) <= pipe_dest->vblank_end) {
-			value = 1;
-		} else
-			value = 0;
+	if (htotal != 0) {
+		vblank_start = timing->v_total - timing->v_front_porch;
+		vblank_end = vblank_start - timing->v_addressable - timing->v_border_top - timing->v_border_bottom;
+		pixel_width = vready_offset_pixels + vupdate_width_pixels + vupdate_offset_pixels;
+
+		is_vready_at_or_after_vsync = (vstartup_lines - pixel_width / htotal) <= vblank_end;
+
+		if (is_vready_at_or_after_vsync)
+			reg_value = 1;
 	}
 
-	REG_UPDATE(DCHUBP_CNTL, HUBP_VREADY_AT_OR_AFTER_VSYNC, value);
+	REG_UPDATE(DCHUBP_CNTL, HUBP_VREADY_AT_OR_AFTER_VSYNC, reg_value);
 }
 
 void hubp401_program_requestor(
 		struct hubp *hubp,
-		struct _vcs_dpi_display_rq_regs_st *rq_regs)
+		struct dml2_display_rq_regs *rq_regs)
 {
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
 
@@ -196,8 +210,8 @@ void hubp401_program_requestor(
 
 void hubp401_program_deadline(
 		struct hubp *hubp,
-		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
-		struct _vcs_dpi_display_ttu_regs_st *ttu_attr)
+		struct dml2_display_dlg_regs *dlg_attr,
+		struct dml2_display_ttu_regs *ttu_attr)
 {
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
 
@@ -294,66 +308,64 @@ void hubp401_program_deadline(
 
 void hubp401_setup(
 		struct hubp *hubp,
-		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
-		struct _vcs_dpi_display_ttu_regs_st *ttu_attr,
-		struct _vcs_dpi_display_rq_regs_st *rq_regs,
-		struct _vcs_dpi_display_pipe_dest_params_st *pipe_dest)
+	    struct dml2_dchub_per_pipe_register_set *pipe_regs,
+		union dml2_global_sync_programming *pipe_global_sync,
+		struct dc_crtc_timing *timing)
 {
 	/* otg is locked when this func is called. Register are double buffered.
 	 * disable the requestors is not needed
 	 */
-	hubp401_vready_at_or_After_vsync(hubp, pipe_dest);
-	hubp401_program_requestor(hubp, rq_regs);
-	hubp401_program_deadline(hubp, dlg_attr, ttu_attr);
+	hubp401_vready_at_or_After_vsync(hubp, pipe_global_sync, timing);
+	hubp401_program_requestor(hubp, &pipe_regs->rq_regs);
+	hubp401_program_deadline(hubp, &pipe_regs->dlg_regs, &pipe_regs->ttu_regs);
 }
 
 void hubp401_setup_interdependent(
 		struct hubp *hubp,
-		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
-		struct _vcs_dpi_display_ttu_regs_st *ttu_attr)
+		struct dml2_dchub_per_pipe_register_set *pipe_regs)
 {
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
 
 	REG_SET_2(PREFETCH_SETTINGS, 0,
-			DST_Y_PREFETCH, dlg_attr->dst_y_prefetch,
-			VRATIO_PREFETCH, dlg_attr->vratio_prefetch);
+			DST_Y_PREFETCH, pipe_regs->dlg_regs.dst_y_prefetch,
+			VRATIO_PREFETCH, pipe_regs->dlg_regs.vratio_prefetch);
 
 	REG_SET(PREFETCH_SETTINGS_C, 0,
-			VRATIO_PREFETCH_C, dlg_attr->vratio_prefetch_c);
+			VRATIO_PREFETCH_C, pipe_regs->dlg_regs.vratio_prefetch_c);
 
 	REG_SET_2(VBLANK_PARAMETERS_0, 0,
-		DST_Y_PER_VM_VBLANK, dlg_attr->dst_y_per_vm_vblank,
-		DST_Y_PER_ROW_VBLANK, dlg_attr->dst_y_per_row_vblank);
+		DST_Y_PER_VM_VBLANK, pipe_regs->dlg_regs.dst_y_per_vm_vblank,
+		DST_Y_PER_ROW_VBLANK, pipe_regs->dlg_regs.dst_y_per_row_vblank);
 
 	REG_SET_2(FLIP_PARAMETERS_0, 0,
-		DST_Y_PER_VM_FLIP, dlg_attr->dst_y_per_vm_flip,
-		DST_Y_PER_ROW_FLIP, dlg_attr->dst_y_per_row_flip);
+		DST_Y_PER_VM_FLIP, pipe_regs->dlg_regs.dst_y_per_vm_flip,
+		DST_Y_PER_ROW_FLIP, pipe_regs->dlg_regs.dst_y_per_row_flip);
 
 	REG_SET(VBLANK_PARAMETERS_3, 0,
-		REFCYC_PER_META_CHUNK_VBLANK_L, dlg_attr->refcyc_per_meta_chunk_vblank_l);
+		REFCYC_PER_META_CHUNK_VBLANK_L, pipe_regs->dlg_regs.refcyc_per_meta_chunk_vblank_l);
 
 	REG_SET(VBLANK_PARAMETERS_4, 0,
-		REFCYC_PER_META_CHUNK_VBLANK_C, dlg_attr->refcyc_per_meta_chunk_vblank_c);
+		REFCYC_PER_META_CHUNK_VBLANK_C, pipe_regs->dlg_regs.refcyc_per_meta_chunk_vblank_c);
 
 	REG_SET(FLIP_PARAMETERS_2, 0,
-		REFCYC_PER_META_CHUNK_FLIP_L, dlg_attr->refcyc_per_meta_chunk_flip_l);
+		REFCYC_PER_META_CHUNK_FLIP_L, pipe_regs->dlg_regs.refcyc_per_meta_chunk_flip_l);
 
 	REG_SET_2(PER_LINE_DELIVERY_PRE, 0,
-		REFCYC_PER_LINE_DELIVERY_PRE_L, dlg_attr->refcyc_per_line_delivery_pre_l,
-		REFCYC_PER_LINE_DELIVERY_PRE_C, dlg_attr->refcyc_per_line_delivery_pre_c);
+		REFCYC_PER_LINE_DELIVERY_PRE_L, pipe_regs->dlg_regs.refcyc_per_line_delivery_pre_l,
+		REFCYC_PER_LINE_DELIVERY_PRE_C, pipe_regs->dlg_regs.refcyc_per_line_delivery_pre_c);
 
 	REG_SET(DCN_SURF0_TTU_CNTL1, 0,
 		REFCYC_PER_REQ_DELIVERY_PRE,
-		ttu_attr->refcyc_per_req_delivery_pre_l);
+		pipe_regs->ttu_regs.refcyc_per_req_delivery_pre_l);
 	REG_SET(DCN_SURF1_TTU_CNTL1, 0,
 		REFCYC_PER_REQ_DELIVERY_PRE,
-		ttu_attr->refcyc_per_req_delivery_pre_c);
+		pipe_regs->ttu_regs.refcyc_per_req_delivery_pre_c);
 	REG_SET(DCN_CUR0_TTU_CNTL1, 0,
-		REFCYC_PER_REQ_DELIVERY_PRE, ttu_attr->refcyc_per_req_delivery_pre_cur0);
+		REFCYC_PER_REQ_DELIVERY_PRE, pipe_regs->ttu_regs.refcyc_per_req_delivery_pre_cur0);
 
 	REG_SET_2(DCN_GLOBAL_TTU_CNTL, 0,
-		MIN_TTU_VBLANK, ttu_attr->min_ttu_vblank,
-		QoS_LEVEL_FLIP, ttu_attr->qos_level_flip);
+		MIN_TTU_VBLANK, pipe_regs->ttu_regs.min_ttu_vblank,
+		QoS_LEVEL_FLIP, pipe_regs->ttu_regs.qos_level_flip);
 }
 
 
@@ -981,8 +993,8 @@ static struct hubp_funcs dcn401_hubp_funcs = {
 	.hubp_program_surface_flip_and_addr = hubp401_program_surface_flip_and_addr,
 	.hubp_program_surface_config = hubp401_program_surface_config,
 	.hubp_is_flip_pending = hubp2_is_flip_pending,
-	.hubp_setup = hubp401_setup,
-	.hubp_setup_interdependent = hubp401_setup_interdependent,
+	.hubp_setup2 = hubp401_setup,
+	.hubp_setup_interdependent2 = hubp401_setup_interdependent,
 	.hubp_set_vm_system_aperture_settings = hubp3_set_vm_system_aperture_settings,
 	.set_blank = hubp2_set_blank,
 	.set_blank_regs = hubp2_set_blank_regs,
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h
index 9e2cf8b5e344..6e1d4c90ddd4 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h
@@ -256,29 +256,15 @@
 
 void hubp401_update_mall_sel(struct hubp *hubp, uint32_t mall_sel, bool c_cursor);
 
-void hubp401_vready_at_or_After_vsync(struct hubp *hubp,
-		struct _vcs_dpi_display_pipe_dest_params_st *pipe_dest);
-
-void hubp401_program_requestor(
-		struct hubp *hubp,
-		struct _vcs_dpi_display_rq_regs_st *rq_regs);
-
-void hubp401_program_deadline(
-		struct hubp *hubp,
-		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
-		struct _vcs_dpi_display_ttu_regs_st *ttu_attr);
-
 void hubp401_setup(
 		struct hubp *hubp,
-		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
-		struct _vcs_dpi_display_ttu_regs_st *ttu_attr,
-		struct _vcs_dpi_display_rq_regs_st *rq_regs,
-		struct _vcs_dpi_display_pipe_dest_params_st *pipe_dest);
+	    struct dml2_dchub_per_pipe_register_set *pipe_regs,
+		union dml2_global_sync_programming *pipe_global_sync,
+		struct dc_crtc_timing *timing);
 
 void hubp401_setup_interdependent(
 		struct hubp *hubp,
-		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
-		struct _vcs_dpi_display_ttu_regs_st *ttu_attr);
+		struct dml2_dchub_per_pipe_register_set *pipe_regs);
 
 bool hubp401_program_surface_flip_and_addr(
 	struct hubp *hubp,
@@ -365,4 +351,17 @@ void hubp401_program_3dlut_fl_mode(struct hubp *hubp, enum hubp_3dlut_fl_mode mo
 
 void hubp401_clear_tiling(struct hubp *hubp);
 
+void hubp401_vready_at_or_After_vsync(struct hubp *hubp,
+	union dml2_global_sync_programming *pipe_global_sync,
+	struct dc_crtc_timing *timing);
+
+void hubp401_program_requestor(
+	struct hubp *hubp,
+	struct dml2_display_rq_regs *rq_regs);
+
+void hubp401_program_deadline(
+	struct hubp *hubp,
+	struct dml2_display_dlg_regs *dlg_attr,
+	struct dml2_display_ttu_regs *ttu_attr);
+
 #endif /* __DC_HUBP_DCN401_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index b029ec1b26d3..a5e18ab72394 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1288,7 +1288,7 @@ static void dcn20_power_on_plane_resources(
 	}
 }
 
-static void dcn20_enable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx,
+void dcn20_enable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx,
 			       struct dc_state *context)
 {
 	//if (dc->debug.sanity_checks) {
@@ -1467,7 +1467,7 @@ void dcn20_pipe_control_lock(
 	}
 }
 
-static void dcn20_detect_pipe_changes(struct dc_state *old_state,
+void dcn20_detect_pipe_changes(struct dc_state *old_state,
 		struct dc_state *new_state,
 		struct pipe_ctx *old_pipe,
 		struct pipe_ctx *new_pipe)
@@ -1655,7 +1655,7 @@ static void dcn20_detect_pipe_changes(struct dc_state *old_state,
 	}
 }
 
-static void dcn20_update_dchubp_dpp(
+void dcn20_update_dchubp_dpp(
 	struct dc *dc,
 	struct pipe_ctx *pipe_ctx,
 	struct dc_state *context)
@@ -1678,25 +1678,41 @@ static void dcn20_update_dchubp_dpp(
 	 * VTG is within DCHUBBUB which is commond block share by each pipe HUBP.
 	 * VTG is 1:1 mapping with OTG. Each pipe HUBP will select which VTG
 	 */
+
 	if (pipe_ctx->update_flags.bits.hubp_rq_dlg_ttu) {
 		hubp->funcs->hubp_vtg_sel(hubp, pipe_ctx->stream_res.tg->inst);
 
-		hubp->funcs->hubp_setup(
-			hubp,
-			&pipe_ctx->dlg_regs,
-			&pipe_ctx->ttu_regs,
-			&pipe_ctx->rq_regs,
-			&pipe_ctx->pipe_dlg_param);
+		if (hubp->funcs->hubp_setup2) {
+			hubp->funcs->hubp_setup2(
+				hubp,
+				&pipe_ctx->hubp_regs,
+				&pipe_ctx->global_sync,
+				&pipe_ctx->stream->timing);
+		} else {
+			hubp->funcs->hubp_setup(
+				hubp,
+				&pipe_ctx->dlg_regs,
+				&pipe_ctx->ttu_regs,
+				&pipe_ctx->rq_regs,
+				&pipe_ctx->pipe_dlg_param);
+		}
 	}
 
 	if (pipe_ctx->update_flags.bits.unbounded_req && hubp->funcs->set_unbounded_requesting)
 		hubp->funcs->set_unbounded_requesting(hubp, pipe_ctx->unbounded_req);
 
-	if (pipe_ctx->update_flags.bits.hubp_interdependent)
-		hubp->funcs->hubp_setup_interdependent(
-			hubp,
-			&pipe_ctx->dlg_regs,
-			&pipe_ctx->ttu_regs);
+	if (pipe_ctx->update_flags.bits.hubp_interdependent) {
+		if (hubp->funcs->hubp_setup_interdependent2) {
+			hubp->funcs->hubp_setup_interdependent2(
+				hubp,
+				&pipe_ctx->hubp_regs);
+		} else {
+			hubp->funcs->hubp_setup_interdependent(
+				hubp,
+				&pipe_ctx->dlg_regs,
+				&pipe_ctx->ttu_regs);
+		}
+	}
 
 	if (pipe_ctx->update_flags.bits.enable ||
 			pipe_ctx->update_flags.bits.plane_changed ||
@@ -1756,10 +1772,9 @@ static void dcn20_update_dchubp_dpp(
 			&pipe_ctx->plane_res.scl_data.viewport_c);
 		viewport_changed = true;
 	}
-		if (hubp->funcs->hubp_program_mcache_id_and_split_coordinate)
-			hubp->funcs->hubp_program_mcache_id_and_split_coordinate(
-				hubp,
-				&pipe_ctx->mcache_regs);
+
+	if (hubp->funcs->hubp_program_mcache_id_and_split_coordinate)
+		hubp->funcs->hubp_program_mcache_id_and_split_coordinate(hubp, &pipe_ctx->mcache_regs);
 
 	/* Any updates are handled in dc interface, just need to apply existing for plane enable */
 	if ((pipe_ctx->update_flags.bits.enable || pipe_ctx->update_flags.bits.opp_changed ||
@@ -1838,7 +1853,7 @@ static void dcn20_update_dchubp_dpp(
 		hubp->funcs->phantom_hubp_post_enable(hubp);
 }
 
-static int calculate_vready_offset_for_group(struct pipe_ctx *pipe)
+static int dcn20_calculate_vready_offset_for_group(struct pipe_ctx *pipe)
 {
 	struct pipe_ctx *other_pipe;
 	int vready_offset = pipe->pipe_dlg_param.vready_offset;
@@ -1864,6 +1879,30 @@ static int calculate_vready_offset_for_group(struct pipe_ctx *pipe)
 	return vready_offset;
 }
 
+static void dcn20_program_tg(
+	struct dc *dc,
+	struct pipe_ctx *pipe_ctx,
+	struct dc_state *context,
+	struct dce_hwseq *hws)
+{
+	pipe_ctx->stream_res.tg->funcs->program_global_sync(
+		pipe_ctx->stream_res.tg,
+		dcn20_calculate_vready_offset_for_group(pipe_ctx),
+		pipe_ctx->pipe_dlg_param.vstartup_start,
+		pipe_ctx->pipe_dlg_param.vupdate_offset,
+		pipe_ctx->pipe_dlg_param.vupdate_width,
+		pipe_ctx->pipe_dlg_param.pstate_keepout);
+
+	if (dc_state_get_pipe_subvp_type(context, pipe_ctx) != SUBVP_PHANTOM)
+		pipe_ctx->stream_res.tg->funcs->wait_for_state(pipe_ctx->stream_res.tg, CRTC_STATE_VACTIVE);
+
+	pipe_ctx->stream_res.tg->funcs->set_vtg_params(
+		pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing, true);
+
+	if (hws->funcs.setup_vupdate_interrupt)
+		hws->funcs.setup_vupdate_interrupt(dc, pipe_ctx);
+}
+
 static void dcn20_program_pipe(
 		struct dc *dc,
 		struct pipe_ctx *pipe_ctx,
@@ -1874,33 +1913,17 @@ static void dcn20_program_pipe(
 	/* Only need to unblank on top pipe */
 	if (resource_is_pipe_type(pipe_ctx, OTG_MASTER)) {
 		if (pipe_ctx->update_flags.bits.enable ||
-				pipe_ctx->update_flags.bits.odm ||
-				pipe_ctx->stream->update_flags.bits.abm_level)
+			pipe_ctx->update_flags.bits.odm ||
+			pipe_ctx->stream->update_flags.bits.abm_level)
 			hws->funcs.blank_pixel_data(dc, pipe_ctx,
-					!pipe_ctx->plane_state ||
-					!pipe_ctx->plane_state->visible);
+				!pipe_ctx->plane_state ||
+				!pipe_ctx->plane_state->visible);
 	}
 
 	/* Only update TG on top pipe */
 	if (pipe_ctx->update_flags.bits.global_sync && !pipe_ctx->top_pipe
-			&& !pipe_ctx->prev_odm_pipe) {
-		pipe_ctx->stream_res.tg->funcs->program_global_sync(
-				pipe_ctx->stream_res.tg,
-				calculate_vready_offset_for_group(pipe_ctx),
-				pipe_ctx->pipe_dlg_param.vstartup_start,
-				pipe_ctx->pipe_dlg_param.vupdate_offset,
-				pipe_ctx->pipe_dlg_param.vupdate_width,
-				pipe_ctx->pipe_dlg_param.pstate_keepout);
-
-		if (dc_state_get_pipe_subvp_type(context, pipe_ctx) != SUBVP_PHANTOM)
-			pipe_ctx->stream_res.tg->funcs->wait_for_state(pipe_ctx->stream_res.tg, CRTC_STATE_VACTIVE);
-
-		pipe_ctx->stream_res.tg->funcs->set_vtg_params(
-				pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing, true);
-
-		if (hws->funcs.setup_vupdate_interrupt)
-			hws->funcs.setup_vupdate_interrupt(dc, pipe_ctx);
-	}
+		&& !pipe_ctx->prev_odm_pipe)
+		dcn20_program_tg(dc, pipe_ctx, context, hws);
 
 	if (pipe_ctx->update_flags.bits.odm)
 		hws->funcs.update_odm(dc, context, pipe_ctx);
@@ -1931,22 +1954,22 @@ static void dcn20_program_pipe(
 		dcn20_update_dchubp_dpp(dc, pipe_ctx, context);
 
 	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.bits.enable ||
-	    pipe_ctx->plane_state->update_flags.bits.hdr_mult))
+		pipe_ctx->plane_state->update_flags.bits.hdr_mult))
 		hws->funcs.set_hdr_multiplier(pipe_ctx);
 
 	if (hws->funcs.populate_mcm_luts) {
 		if (pipe_ctx->plane_state) {
 			hws->funcs.populate_mcm_luts(dc, pipe_ctx, pipe_ctx->plane_state->mcm_luts,
-						     pipe_ctx->plane_state->lut_bank_a);
+				pipe_ctx->plane_state->lut_bank_a);
 			pipe_ctx->plane_state->lut_bank_a = !pipe_ctx->plane_state->lut_bank_a;
 		}
 	}
 
 	if (pipe_ctx->plane_state &&
-	    (pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
-	    pipe_ctx->plane_state->update_flags.bits.gamma_change ||
-	    pipe_ctx->plane_state->update_flags.bits.lut_3d ||
-	    pipe_ctx->update_flags.bits.enable))
+		(pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
+			pipe_ctx->plane_state->update_flags.bits.gamma_change ||
+			pipe_ctx->plane_state->update_flags.bits.lut_3d ||
+			pipe_ctx->update_flags.bits.enable))
 		hws->funcs.set_input_transfer_func(dc, pipe_ctx, pipe_ctx->plane_state);
 
 	/* dcn10_translate_regamma_to_hw_format takes 750us to finish
@@ -1954,10 +1977,10 @@ static void dcn20_program_pipe(
 	 * updating on slave planes
 	 */
 	if (pipe_ctx->update_flags.bits.enable ||
-			pipe_ctx->update_flags.bits.plane_changed ||
-			pipe_ctx->stream->update_flags.bits.out_tf ||
-			(pipe_ctx->plane_state &&
-			 pipe_ctx->plane_state->update_flags.bits.output_tf_change))
+		pipe_ctx->update_flags.bits.plane_changed ||
+		pipe_ctx->stream->update_flags.bits.out_tf ||
+		(pipe_ctx->plane_state &&
+			pipe_ctx->plane_state->update_flags.bits.output_tf_change))
 		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
 
 	/* If the pipe has been enabled or has a different opp, we
@@ -1966,7 +1989,7 @@ static void dcn20_program_pipe(
 	 * causes a different pipe to be chosen to odm combine with.
 	 */
 	if (pipe_ctx->update_flags.bits.enable
-	    || pipe_ctx->update_flags.bits.opp_changed) {
+		|| pipe_ctx->update_flags.bits.opp_changed) {
 
 		pipe_ctx->stream_res.opp->funcs->opp_set_dyn_expansion(
 			pipe_ctx->stream_res.opp,
@@ -1996,14 +2019,14 @@ static void dcn20_program_pipe(
 		memset(&params, 0, sizeof(params));
 		odm_opp->funcs->opp_program_bit_depth_reduction(odm_opp, &params);
 		dc->hwss.set_disp_pattern_generator(dc,
-				pipe_ctx,
-				pipe_ctx->stream_res.test_pattern_params.test_pattern,
-				pipe_ctx->stream_res.test_pattern_params.color_space,
-				pipe_ctx->stream_res.test_pattern_params.color_depth,
-				NULL,
-				pipe_ctx->stream_res.test_pattern_params.width,
-				pipe_ctx->stream_res.test_pattern_params.height,
-				pipe_ctx->stream_res.test_pattern_params.offset);
+			pipe_ctx,
+			pipe_ctx->stream_res.test_pattern_params.test_pattern,
+			pipe_ctx->stream_res.test_pattern_params.color_space,
+			pipe_ctx->stream_res.test_pattern_params.color_depth,
+			NULL,
+			pipe_ctx->stream_res.test_pattern_params.width,
+			pipe_ctx->stream_res.test_pattern_params.height,
+			pipe_ctx->stream_res.test_pattern_params.offset);
 	}
 }
 
@@ -2012,11 +2035,12 @@ void dcn20_program_front_end_for_ctx(
 		struct dc_state *context)
 {
 	int i;
-	struct dce_hwseq *hws = dc->hwseq;
-	DC_LOGGER_INIT(dc->ctx->logger);
 	unsigned int prev_hubp_count = 0;
 	unsigned int hubp_count = 0;
-	struct pipe_ctx *pipe;
+	struct dce_hwseq *hws = dc->hwseq;
+	struct pipe_ctx *pipe = NULL;
+
+	DC_LOGGER_INIT(dc->ctx->logger);
 
 	if (resource_is_pipe_topology_changed(dc->current_state, context))
 		resource_log_pipe_topology_update(dc, context);
@@ -2029,7 +2053,7 @@ void dcn20_program_front_end_for_ctx(
 				ASSERT(!pipe->plane_state->triplebuffer_flips);
 				/*turn off triple buffer for full update*/
 				dc->hwss.program_triplebuffer(
-						dc, pipe, pipe->plane_state->triplebuffer_flips);
+					dc, pipe, pipe->plane_state->triplebuffer_flips);
 			}
 		}
 	}
@@ -2044,30 +2068,31 @@ void dcn20_program_front_end_for_ctx(
 	if (prev_hubp_count == 0 && hubp_count > 0) {
 		if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
 			dc->res_pool->hubbub->funcs->force_pstate_change_control(
-					dc->res_pool->hubbub, true, false);
+				dc->res_pool->hubbub, true, false);
 		udelay(500);
 	}
 
 	/* Set pipe update flags and lock pipes */
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		dcn20_detect_pipe_changes(dc->current_state, context, &dc->current_state->res_ctx.pipe_ctx[i],
-				&context->res_ctx.pipe_ctx[i]);
+			&context->res_ctx.pipe_ctx[i]);
 
 	/* When disabling phantom pipes, turn on phantom OTG first (so we can get double
 	 * buffer updates properly)
 	 */
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct dc_stream_state *stream = dc->current_state->res_ctx.pipe_ctx[i].stream;
+
 		pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable && stream &&
-				dc_state_get_pipe_subvp_type(dc->current_state, pipe) == SUBVP_PHANTOM) {
+			dc_state_get_pipe_subvp_type(dc->current_state, pipe) == SUBVP_PHANTOM) {
 			struct timing_generator *tg = dc->current_state->res_ctx.pipe_ctx[i].stream_res.tg;
 
 			if (tg->funcs->enable_crtc) {
-				if (dc->hwseq->funcs.blank_pixel_data) {
+				if (dc->hwseq->funcs.blank_pixel_data)
 					dc->hwseq->funcs.blank_pixel_data(dc, pipe, true);
-				}
+
 				tg->funcs->enable_crtc(tg);
 			}
 		}
@@ -2075,15 +2100,15 @@ void dcn20_program_front_end_for_ctx(
 	/* OTG blank before disabling all front ends */
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable
-				&& !context->res_ctx.pipe_ctx[i].top_pipe
-				&& !context->res_ctx.pipe_ctx[i].prev_odm_pipe
-				&& context->res_ctx.pipe_ctx[i].stream)
+			&& !context->res_ctx.pipe_ctx[i].top_pipe
+			&& !context->res_ctx.pipe_ctx[i].prev_odm_pipe
+			&& context->res_ctx.pipe_ctx[i].stream)
 			hws->funcs.blank_pixel_data(dc, &context->res_ctx.pipe_ctx[i], true);
 
 	/* Disconnect mpcc */
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable
-				|| context->res_ctx.pipe_ctx[i].update_flags.bits.opp_changed) {
+			|| context->res_ctx.pipe_ctx[i].update_flags.bits.opp_changed) {
 			struct hubbub *hubbub = dc->res_pool->hubbub;
 
 			/* Phantom pipe DET should be 0, but if a pipe in use is being transitioned to phantom
@@ -2093,13 +2118,18 @@ void dcn20_program_front_end_for_ctx(
 			 * DET allocation.
 			 */
 			if ((context->res_ctx.pipe_ctx[i].update_flags.bits.disable ||
-					(context->res_ctx.pipe_ctx[i].plane_state && dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[i]) == SUBVP_PHANTOM))) {
+				(context->res_ctx.pipe_ctx[i].plane_state &&
+				dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[i])
+				== SUBVP_PHANTOM))) {
 				if (hubbub->funcs->program_det_size)
-					hubbub->funcs->program_det_size(hubbub, dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
+					hubbub->funcs->program_det_size(hubbub,
+						dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
 				if (dc->res_pool->hubbub->funcs->program_det_segments)
-					dc->res_pool->hubbub->funcs->program_det_segments(hubbub, dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
+					dc->res_pool->hubbub->funcs->program_det_segments(
+						hubbub, dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
 			}
-			hws->funcs.plane_atomic_disconnect(dc, dc->current_state, &dc->current_state->res_ctx.pipe_ctx[i]);
+			hws->funcs.plane_atomic_disconnect(dc, dc->current_state,
+				&dc->current_state->res_ctx.pipe_ctx[i]);
 			DC_LOG_DC("Reset mpcc for pipe %d\n", dc->current_state->res_ctx.pipe_ctx[i].pipe_idx);
 		}
 
@@ -2107,9 +2137,9 @@ void dcn20_program_front_end_for_ctx(
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		pipe = &context->res_ctx.pipe_ctx[i];
 		if (resource_is_pipe_type(pipe, OTG_MASTER) &&
-				!resource_is_pipe_type(pipe, DPP_PIPE) &&
-				pipe->update_flags.bits.odm &&
-				hws->funcs.update_odm)
+			!resource_is_pipe_type(pipe, DPP_PIPE) &&
+			pipe->update_flags.bits.odm &&
+			hws->funcs.update_odm)
 			hws->funcs.update_odm(dc, context, pipe);
 	}
 
@@ -2127,25 +2157,28 @@ void dcn20_program_front_end_for_ctx(
 				else {
 					/* Don't program phantom pipes in the regular front end programming sequence.
 					 * There is an MPO transition case where a pipe being used by a video plane is
-					 * transitioned directly to be a phantom pipe when closing the MPO video. However
-					 * the phantom pipe will program a new HUBP_VTG_SEL (update takes place right away),
-					 * but the MPO still exists until the double buffered update of the main pipe so we
-					 * will get a frame of underflow if the phantom pipe is programmed here.
+					 * transitioned directly to be a phantom pipe when closing the MPO video.
+					 * However the phantom pipe will program a new HUBP_VTG_SEL (update takes place
+					 * right away) but the MPO still exists until the double buffered update of the
+					 * main pipe so we will get a frame of underflow if the phantom pipe is
+					 * programmed here.
 					 */
-					if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM)
+					if (pipe->stream &&
+						dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM)
 						dcn20_program_pipe(dc, pipe, context);
 				}
 
 				pipe = pipe->bottom_pipe;
 			}
 		}
+
 		/* Program secondary blending tree and writeback pipes */
 		pipe = &context->res_ctx.pipe_ctx[i];
 		if (!pipe->top_pipe && !pipe->prev_odm_pipe
-				&& pipe->stream && pipe->stream->num_wb_info > 0
-				&& (pipe->update_flags.raw || (pipe->plane_state && pipe->plane_state->update_flags.raw)
-					|| pipe->stream->update_flags.raw)
-				&& hws->funcs.program_all_writeback_pipes_in_tree)
+			&& pipe->stream && pipe->stream->num_wb_info > 0
+			&& (pipe->update_flags.raw || (pipe->plane_state && pipe->plane_state->update_flags.raw)
+				|| pipe->stream->update_flags.raw)
+			&& hws->funcs.program_all_writeback_pipes_in_tree)
 			hws->funcs.program_all_writeback_pipes_in_tree(dc, pipe->stream, context);
 
 		/* Avoid underflow by check of pipe line read when adding 2nd plane. */
@@ -2164,7 +2197,7 @@ void dcn20_program_front_end_for_ctx(
  * buffered pending status clear and reset opp head pipe's none double buffered
  * registers to their initial state.
  */
-static void post_unlock_reset_opp(struct dc *dc,
+void dcn20_post_unlock_reset_opp(struct dc *dc,
 		struct pipe_ctx *opp_head)
 {
 	struct display_stream_compressor *dsc = opp_head->stream_res.dsc;
@@ -2201,16 +2234,17 @@ void dcn20_post_unlock_program_front_end(
 		struct dc *dc,
 		struct dc_state *context)
 {
-	int i;
-	const unsigned int TIMEOUT_FOR_PIPE_ENABLE_US = 100000;
+	// Timeout for pipe enable
+	unsigned int timeout_us = 100000;
 	unsigned int polling_interval_us = 1;
 	struct dce_hwseq *hwseq = dc->hwseq;
+	int i;
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (resource_is_pipe_type(&dc->current_state->res_ctx.pipe_ctx[i], OPP_HEAD) &&
-				!resource_is_pipe_type(&context->res_ctx.pipe_ctx[i], OPP_HEAD))
-			post_unlock_reset_opp(dc,
-					&dc->current_state->res_ctx.pipe_ctx[i]);
+			!resource_is_pipe_type(&context->res_ctx.pipe_ctx[i], OPP_HEAD))
+			dcn20_post_unlock_reset_opp(dc,
+				&dc->current_state->res_ctx.pipe_ctx[i]);
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable)
@@ -2226,11 +2260,12 @@ void dcn20_post_unlock_program_front_end(
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 		// Don't check flip pending on phantom pipes
 		if (pipe->plane_state && !pipe->top_pipe && pipe->update_flags.bits.enable &&
-				dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM) {
+			dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM) {
 			struct hubp *hubp = pipe->plane_res.hubp;
 			int j = 0;
-			for (j = 0; j < TIMEOUT_FOR_PIPE_ENABLE_US / polling_interval_us
-					&& hubp->funcs->hubp_is_flip_pending(hubp); j++)
+
+			for (j = 0; j < timeout_us / polling_interval_us
+				&& hubp->funcs->hubp_is_flip_pending(hubp); j++)
 				udelay(polling_interval_us);
 		}
 	}
@@ -2244,15 +2279,14 @@ void dcn20_post_unlock_program_front_end(
 		 * before we've transitioned to 2:1 or 4:1
 		 */
 		if (resource_is_pipe_type(old_pipe, OTG_MASTER) && resource_is_pipe_type(pipe, OTG_MASTER) &&
-				resource_get_odm_slice_count(old_pipe) < resource_get_odm_slice_count(pipe) &&
-				dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM) {
+			resource_get_odm_slice_count(old_pipe) < resource_get_odm_slice_count(pipe) &&
+			dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM) {
 			int j = 0;
 			struct timing_generator *tg = pipe->stream_res.tg;
 
-
 			if (tg->funcs->get_optc_double_buffer_pending) {
-				for (j = 0; j < TIMEOUT_FOR_PIPE_ENABLE_US / polling_interval_us
-				&& tg->funcs->get_optc_double_buffer_pending(tg); j++)
+				for (j = 0; j < timeout_us / polling_interval_us
+					&& tg->funcs->get_optc_double_buffer_pending(tg); j++)
 					udelay(polling_interval_us);
 			}
 		}
@@ -2260,7 +2294,7 @@ void dcn20_post_unlock_program_front_end(
 
 	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
 		dc->res_pool->hubbub->funcs->force_pstate_change_control(
-				dc->res_pool->hubbub, false, false);
+			dc->res_pool->hubbub, false, false);
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
@@ -2291,11 +2325,11 @@ void dcn20_post_unlock_program_front_end(
 		return;
 
 	/* P-State support transitions:
-	 * Natural -> FPO: 		P-State disabled in prepare, force disallow anytime is safe
-	 * FPO -> Natural: 		Unforce anytime after FW disable is safe (P-State will assert naturally)
-	 * Unsupported -> FPO:	P-State enabled in optimize, force disallow anytime is safe
-	 * FPO -> Unsupported:	P-State disabled in prepare, unforce disallow anytime is safe
-	 * FPO <-> SubVP:		Force disallow is maintained on the FPO / SubVP pipes
+	 * Natural -> FPO:      P-State disabled in prepare, force disallow anytime is safe
+	 * FPO -> Natural:      Unforce anytime after FW disable is safe (P-State will assert naturally)
+	 * Unsupported -> FPO:  P-State enabled in optimize, force disallow anytime is safe
+	 * FPO -> Unsupported:  P-State disabled in prepare, unforce disallow anytime is safe
+	 * FPO <-> SubVP:       Force disallow is maintained on the FPO / SubVP pipes
 	 */
 	if (hwseq->funcs.update_force_pstate)
 		dc->hwseq->funcs.update_force_pstate(dc, context);
@@ -2310,12 +2344,11 @@ void dcn20_post_unlock_program_front_end(
 	if (hwseq->wa.DEGVIDCN21)
 		dc->res_pool->hubbub->funcs->apply_DEDCN21_147_wa(dc->res_pool->hubbub);
 
-
 	/* WA for stutter underflow during MPO transitions when adding 2nd plane */
 	if (hwseq->wa.disallow_self_refresh_during_multi_plane_transition) {
 
 		if (dc->current_state->stream_status[0].plane_count == 1 &&
-				context->stream_status[0].plane_count > 1) {
+			context->stream_status[0].plane_count > 1) {
 
 			struct timing_generator *tg = dc->res_pool->timing_generators[0];
 
@@ -2463,7 +2496,7 @@ bool dcn20_update_bandwidth(
 
 			pipe_ctx->stream_res.tg->funcs->program_global_sync(
 					pipe_ctx->stream_res.tg,
-					calculate_vready_offset_for_group(pipe_ctx),
+					dcn20_calculate_vready_offset_for_group(pipe_ctx),
 					pipe_ctx->pipe_dlg_param.vstartup_start,
 					pipe_ctx->pipe_dlg_param.vupdate_offset,
 					pipe_ctx->pipe_dlg_param.vupdate_width,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h
index 5c874f7b0683..9d1ad3b29ca5 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h
@@ -154,6 +154,21 @@ void dcn20_setup_gsl_group_as_lock(
 		const struct dc *dc,
 		struct pipe_ctx *pipe_ctx,
 		bool enable);
-
+void dcn20_detect_pipe_changes(
+		struct dc_state *old_state,
+		struct dc_state *new_state,
+		struct pipe_ctx *old_pipe,
+		struct pipe_ctx *new_pipe);
+void dcn20_enable_plane(
+		struct dc *dc,
+		struct pipe_ctx *pipe_ctx,
+		struct dc_state *context);
+void dcn20_update_dchubp_dpp(
+		struct dc *dc,
+		struct pipe_ctx *pipe_ctx,
+		struct dc_state *context);
+void dcn20_post_unlock_reset_opp(
+		struct dc *dc,
+		struct pipe_ctx *opp_head);
 #endif /* __DC_HWSS_DCN20_H__ */
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
index 1e2cf8a391c8..c7acaf97974c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
@@ -123,6 +123,10 @@ static const struct hw_sequencer_funcs dcn35_funcs = {
 	.set_long_vtotal = dcn35_set_long_vblank,
 	.calculate_pix_rate_divider = dcn32_calculate_pix_rate_divider,
 	.hardware_release = dcn35_hardware_release,
+	.detect_pipe_changes = dcn20_detect_pipe_changes,
+	.enable_plane = dcn20_enable_plane,
+	.update_dchubp_dpp = dcn20_update_dchubp_dpp,
+	.post_unlock_reset_opp = dcn20_post_unlock_reset_opp,
 };
 
 static const struct hwseq_private_funcs dcn35_private_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 8cb0fbd301d8..d5bbd3531c61 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -3,6 +3,7 @@
 // Copyright 2024 Advanced Micro Devices, Inc.
 
 #include "dm_services.h"
+#include "basics/dc_common.h"
 #include "dm_helpers.h"
 #include "core_types.h"
 #include "resource.h"
@@ -881,15 +882,15 @@ enum dc_status dcn401_enable_stream_timing(
 		patched_crtc_timing.h_addressable = patched_crtc_timing.h_addressable + pipe_ctx->hblank_borrow;
 
 	pipe_ctx->stream_res.tg->funcs->program_timing(
-			pipe_ctx->stream_res.tg,
-			&patched_crtc_timing,
-			pipe_ctx->pipe_dlg_param.vready_offset,
-			pipe_ctx->pipe_dlg_param.vstartup_start,
-			pipe_ctx->pipe_dlg_param.vupdate_offset,
-			pipe_ctx->pipe_dlg_param.vupdate_width,
-			pipe_ctx->pipe_dlg_param.pstate_keepout,
-			pipe_ctx->stream->signal,
-			true);
+		pipe_ctx->stream_res.tg,
+		&patched_crtc_timing,
+		(unsigned int)pipe_ctx->global_sync.dcn4x.vready_offset_pixels,
+		(unsigned int)pipe_ctx->global_sync.dcn4x.vstartup_lines,
+		(unsigned int)pipe_ctx->global_sync.dcn4x.vupdate_offset_pixels,
+		(unsigned int)pipe_ctx->global_sync.dcn4x.vupdate_vupdate_width_pixels,
+		(unsigned int)pipe_ctx->global_sync.dcn4x.pstate_keepout_start_lines,
+		pipe_ctx->stream->signal,
+		true);
 
 	for (i = 0; i < opp_cnt; i++) {
 		opp_heads[i]->stream_res.opp->funcs->opp_pipe_clock_control(
@@ -2013,3 +2014,730 @@ void dcn401_reset_hw_ctx_wrap(
 		}
 	}
 }
+
+static unsigned int dcn401_calculate_vready_offset_for_group(struct pipe_ctx *pipe)
+{
+	struct pipe_ctx *other_pipe;
+	unsigned int vready_offset = pipe->global_sync.dcn4x.vready_offset_pixels;
+
+	/* Always use the largest vready_offset of all connected pipes */
+	for (other_pipe = pipe->bottom_pipe; other_pipe != NULL; other_pipe = other_pipe->bottom_pipe) {
+		if (other_pipe->global_sync.dcn4x.vready_offset_pixels > vready_offset)
+			vready_offset = other_pipe->global_sync.dcn4x.vready_offset_pixels;
+	}
+	for (other_pipe = pipe->top_pipe; other_pipe != NULL; other_pipe = other_pipe->top_pipe) {
+		if (other_pipe->global_sync.dcn4x.vready_offset_pixels > vready_offset)
+			vready_offset = other_pipe->global_sync.dcn4x.vready_offset_pixels;
+	}
+	for (other_pipe = pipe->next_odm_pipe; other_pipe != NULL; other_pipe = other_pipe->next_odm_pipe) {
+		if (other_pipe->global_sync.dcn4x.vready_offset_pixels > vready_offset)
+			vready_offset = other_pipe->global_sync.dcn4x.vready_offset_pixels;
+	}
+	for (other_pipe = pipe->prev_odm_pipe; other_pipe != NULL; other_pipe = other_pipe->prev_odm_pipe) {
+		if (other_pipe->global_sync.dcn4x.vready_offset_pixels > vready_offset)
+			vready_offset = other_pipe->global_sync.dcn4x.vready_offset_pixels;
+	}
+
+	return vready_offset;
+}
+
+static void dcn401_program_tg(
+	struct dc *dc,
+	struct pipe_ctx *pipe_ctx,
+	struct dc_state *context,
+	struct dce_hwseq *hws)
+{
+	pipe_ctx->stream_res.tg->funcs->program_global_sync(
+		pipe_ctx->stream_res.tg,
+		dcn401_calculate_vready_offset_for_group(pipe_ctx),
+		(unsigned int)pipe_ctx->global_sync.dcn4x.vstartup_lines,
+		(unsigned int)pipe_ctx->global_sync.dcn4x.vupdate_offset_pixels,
+		(unsigned int)pipe_ctx->global_sync.dcn4x.vupdate_vupdate_width_pixels,
+		(unsigned int)pipe_ctx->global_sync.dcn4x.pstate_keepout_start_lines);
+
+	if (dc_state_get_pipe_subvp_type(context, pipe_ctx) != SUBVP_PHANTOM)
+		pipe_ctx->stream_res.tg->funcs->wait_for_state(pipe_ctx->stream_res.tg, CRTC_STATE_VACTIVE);
+
+	pipe_ctx->stream_res.tg->funcs->set_vtg_params(
+		pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing, true);
+
+	if (hws->funcs.setup_vupdate_interrupt)
+		hws->funcs.setup_vupdate_interrupt(dc, pipe_ctx);
+}
+
+static void dcn401_program_pipe(
+	struct dc *dc,
+	struct pipe_ctx *pipe_ctx,
+	struct dc_state *context)
+{
+	struct dce_hwseq *hws = dc->hwseq;
+
+	/* Only need to unblank on top pipe */
+	if (resource_is_pipe_type(pipe_ctx, OTG_MASTER)) {
+		if (pipe_ctx->update_flags.bits.enable ||
+			pipe_ctx->update_flags.bits.odm ||
+			pipe_ctx->stream->update_flags.bits.abm_level)
+			hws->funcs.blank_pixel_data(dc, pipe_ctx,
+				!pipe_ctx->plane_state ||
+				!pipe_ctx->plane_state->visible);
+	}
+
+	/* Only update TG on top pipe */
+	if (pipe_ctx->update_flags.bits.global_sync && !pipe_ctx->top_pipe
+		&& !pipe_ctx->prev_odm_pipe)
+		dcn401_program_tg(dc, pipe_ctx, context, hws);
+
+	if (pipe_ctx->update_flags.bits.odm)
+		hws->funcs.update_odm(dc, context, pipe_ctx);
+
+	if (pipe_ctx->update_flags.bits.enable) {
+		if (hws->funcs.enable_plane)
+			hws->funcs.enable_plane(dc, pipe_ctx, context);
+		else
+			dc->hwss.enable_plane(dc, pipe_ctx, context);
+
+		if (dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes)
+			dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes(dc->res_pool->hubbub);
+	}
+
+	if (pipe_ctx->update_flags.bits.det_size) {
+		if (dc->res_pool->hubbub->funcs->program_det_size)
+			dc->res_pool->hubbub->funcs->program_det_size(
+				dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->det_buffer_size_kb);
+		if (dc->res_pool->hubbub->funcs->program_det_segments)
+			dc->res_pool->hubbub->funcs->program_det_segments(
+				dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->hubp_regs.det_size);
+	}
+
+	if (pipe_ctx->update_flags.raw ||
+		(pipe_ctx->plane_state && pipe_ctx->plane_state->update_flags.raw) ||
+		pipe_ctx->stream->update_flags.raw)
+		dc->hwss.update_dchubp_dpp(dc, pipe_ctx, context);
+
+	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.bits.enable ||
+		pipe_ctx->plane_state->update_flags.bits.hdr_mult))
+		hws->funcs.set_hdr_multiplier(pipe_ctx);
+
+	if (hws->funcs.populate_mcm_luts) {
+		if (pipe_ctx->plane_state) {
+			hws->funcs.populate_mcm_luts(dc, pipe_ctx, pipe_ctx->plane_state->mcm_luts,
+				pipe_ctx->plane_state->lut_bank_a);
+			pipe_ctx->plane_state->lut_bank_a = !pipe_ctx->plane_state->lut_bank_a;
+		}
+	}
+
+	if (pipe_ctx->plane_state &&
+		(pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
+			pipe_ctx->plane_state->update_flags.bits.gamma_change ||
+			pipe_ctx->plane_state->update_flags.bits.lut_3d ||
+			pipe_ctx->update_flags.bits.enable))
+		hws->funcs.set_input_transfer_func(dc, pipe_ctx, pipe_ctx->plane_state);
+
+	/* dcn10_translate_regamma_to_hw_format takes 750us to finish
+	 * only do gamma programming for powering on, internal memcmp to avoid
+	 * updating on slave planes
+	 */
+	if (pipe_ctx->update_flags.bits.enable ||
+		pipe_ctx->update_flags.bits.plane_changed ||
+		pipe_ctx->stream->update_flags.bits.out_tf ||
+		(pipe_ctx->plane_state &&
+			pipe_ctx->plane_state->update_flags.bits.output_tf_change))
+		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
+
+	/* If the pipe has been enabled or has a different opp, we
+	 * should reprogram the fmt. This deals with cases where
+	 * interation between mpc and odm combine on different streams
+	 * causes a different pipe to be chosen to odm combine with.
+	 */
+	if (pipe_ctx->update_flags.bits.enable
+		|| pipe_ctx->update_flags.bits.opp_changed) {
+
+		pipe_ctx->stream_res.opp->funcs->opp_set_dyn_expansion(
+			pipe_ctx->stream_res.opp,
+			COLOR_SPACE_YCBCR601,
+			pipe_ctx->stream->timing.display_color_depth,
+			pipe_ctx->stream->signal);
+
+		pipe_ctx->stream_res.opp->funcs->opp_program_fmt(
+			pipe_ctx->stream_res.opp,
+			&pipe_ctx->stream->bit_depth_params,
+			&pipe_ctx->stream->clamping);
+	}
+
+	/* Set ABM pipe after other pipe configurations done */
+	if ((pipe_ctx->plane_state && pipe_ctx->plane_state->visible)) {
+		if (pipe_ctx->stream_res.abm) {
+			dc->hwss.set_pipe(pipe_ctx);
+			pipe_ctx->stream_res.abm->funcs->set_abm_level(pipe_ctx->stream_res.abm,
+				pipe_ctx->stream->abm_level);
+		}
+	}
+
+	if (pipe_ctx->update_flags.bits.test_pattern_changed) {
+		struct output_pixel_processor *odm_opp = pipe_ctx->stream_res.opp;
+		struct bit_depth_reduction_params params;
+
+		memset(&params, 0, sizeof(params));
+		odm_opp->funcs->opp_program_bit_depth_reduction(odm_opp, &params);
+		dc->hwss.set_disp_pattern_generator(dc,
+			pipe_ctx,
+			pipe_ctx->stream_res.test_pattern_params.test_pattern,
+			pipe_ctx->stream_res.test_pattern_params.color_space,
+			pipe_ctx->stream_res.test_pattern_params.color_depth,
+			NULL,
+			pipe_ctx->stream_res.test_pattern_params.width,
+			pipe_ctx->stream_res.test_pattern_params.height,
+			pipe_ctx->stream_res.test_pattern_params.offset);
+	}
+}
+
+void dcn401_program_front_end_for_ctx(
+	struct dc *dc,
+	struct dc_state *context)
+{
+	int i;
+	unsigned int prev_hubp_count = 0;
+	unsigned int hubp_count = 0;
+	struct dce_hwseq *hws = dc->hwseq;
+	struct pipe_ctx *pipe = NULL;
+
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	if (resource_is_pipe_topology_changed(dc->current_state, context))
+		resource_log_pipe_topology_update(dc, context);
+
+	if (dc->hwss.program_triplebuffer != NULL && dc->debug.enable_tri_buf) {
+		for (i = 0; i < dc->res_pool->pipe_count; i++) {
+			pipe = &context->res_ctx.pipe_ctx[i];
+
+			if (!pipe->top_pipe && !pipe->prev_odm_pipe && pipe->plane_state) {
+				if (pipe->plane_state->triplebuffer_flips)
+					BREAK_TO_DEBUGGER();
+
+				/*turn off triple buffer for full update*/
+				dc->hwss.program_triplebuffer(
+					dc, pipe, pipe->plane_state->triplebuffer_flips);
+			}
+		}
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (dc->current_state->res_ctx.pipe_ctx[i].plane_state)
+			prev_hubp_count++;
+		if (context->res_ctx.pipe_ctx[i].plane_state)
+			hubp_count++;
+	}
+
+	if (prev_hubp_count == 0 && hubp_count > 0) {
+		if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
+			dc->res_pool->hubbub->funcs->force_pstate_change_control(
+				dc->res_pool->hubbub, true, false);
+		udelay(500);
+	}
+
+	/* Set pipe update flags and lock pipes */
+	for (i = 0; i < dc->res_pool->pipe_count; i++)
+		dc->hwss.detect_pipe_changes(dc->current_state, context, &dc->current_state->res_ctx.pipe_ctx[i],
+			&context->res_ctx.pipe_ctx[i]);
+
+	/* When disabling phantom pipes, turn on phantom OTG first (so we can get double
+	 * buffer updates properly)
+	 */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct dc_stream_state *stream = dc->current_state->res_ctx.pipe_ctx[i].stream;
+
+		pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable && stream &&
+			dc_state_get_pipe_subvp_type(dc->current_state, pipe) == SUBVP_PHANTOM) {
+			struct timing_generator *tg = dc->current_state->res_ctx.pipe_ctx[i].stream_res.tg;
+
+			if (tg->funcs->enable_crtc) {
+				if (dc->hwseq->funcs.blank_pixel_data)
+					dc->hwseq->funcs.blank_pixel_data(dc, pipe, true);
+
+				tg->funcs->enable_crtc(tg);
+			}
+		}
+	}
+	/* OTG blank before disabling all front ends */
+	for (i = 0; i < dc->res_pool->pipe_count; i++)
+		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable
+			&& !context->res_ctx.pipe_ctx[i].top_pipe
+			&& !context->res_ctx.pipe_ctx[i].prev_odm_pipe
+			&& context->res_ctx.pipe_ctx[i].stream)
+			hws->funcs.blank_pixel_data(dc, &context->res_ctx.pipe_ctx[i], true);
+
+
+	/* Disconnect mpcc */
+	for (i = 0; i < dc->res_pool->pipe_count; i++)
+		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable
+			|| context->res_ctx.pipe_ctx[i].update_flags.bits.opp_changed) {
+			struct hubbub *hubbub = dc->res_pool->hubbub;
+
+			/* Phantom pipe DET should be 0, but if a pipe in use is being transitioned to phantom
+			 * then we want to do the programming here (effectively it's being disabled). If we do
+			 * the programming later the DET won't be updated until the OTG for the phantom pipe is
+			 * turned on (i.e. in an MCLK switch) which can come in too late and cause issues with
+			 * DET allocation.
+			 */
+			if ((context->res_ctx.pipe_ctx[i].update_flags.bits.disable ||
+				(context->res_ctx.pipe_ctx[i].plane_state &&
+				dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[i]) ==
+				SUBVP_PHANTOM))) {
+				if (hubbub->funcs->program_det_size)
+					hubbub->funcs->program_det_size(hubbub,
+						dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
+				if (dc->res_pool->hubbub->funcs->program_det_segments)
+					dc->res_pool->hubbub->funcs->program_det_segments(
+						hubbub,	dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
+			}
+			hws->funcs.plane_atomic_disconnect(dc, dc->current_state,
+				&dc->current_state->res_ctx.pipe_ctx[i]);
+			DC_LOG_DC("Reset mpcc for pipe %d\n", dc->current_state->res_ctx.pipe_ctx[i].pipe_idx);
+		}
+
+	/* update ODM for blanked OTG master pipes */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+		if (resource_is_pipe_type(pipe, OTG_MASTER) &&
+			!resource_is_pipe_type(pipe, DPP_PIPE) &&
+			pipe->update_flags.bits.odm &&
+			hws->funcs.update_odm)
+			hws->funcs.update_odm(dc, context, pipe);
+	}
+
+	/*
+	 * Program all updated pipes, order matters for mpcc setup. Start with
+	 * top pipe and program all pipes that follow in order
+	 */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe->plane_state && !pipe->top_pipe) {
+			while (pipe) {
+				if (hws->funcs.program_pipe)
+					hws->funcs.program_pipe(dc, pipe, context);
+				else {
+					/* Don't program phantom pipes in the regular front end programming sequence.
+					 * There is an MPO transition case where a pipe being used by a video plane is
+					 * transitioned directly to be a phantom pipe when closing the MPO video.
+					 * However the phantom pipe will program a new HUBP_VTG_SEL (update takes place
+					 * right away) but the MPO still exists until the double buffered update of the
+					 * main pipe so we will get a frame of underflow if the phantom pipe is
+					 * programmed here.
+					 */
+					if (pipe->stream &&
+						dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM)
+						dcn401_program_pipe(dc, pipe, context);
+				}
+
+				pipe = pipe->bottom_pipe;
+			}
+		}
+
+		/* Program secondary blending tree and writeback pipes */
+		pipe = &context->res_ctx.pipe_ctx[i];
+		if (!pipe->top_pipe && !pipe->prev_odm_pipe
+			&& pipe->stream && pipe->stream->num_wb_info > 0
+			&& (pipe->update_flags.raw || (pipe->plane_state && pipe->plane_state->update_flags.raw)
+				|| pipe->stream->update_flags.raw)
+			&& hws->funcs.program_all_writeback_pipes_in_tree)
+			hws->funcs.program_all_writeback_pipes_in_tree(dc, pipe->stream, context);
+
+		/* Avoid underflow by check of pipe line read when adding 2nd plane. */
+		if (hws->wa.wait_hubpret_read_start_during_mpo_transition &&
+			!pipe->top_pipe &&
+			pipe->stream &&
+			pipe->plane_res.hubp->funcs->hubp_wait_pipe_read_start &&
+			dc->current_state->stream_status[0].plane_count == 1 &&
+			context->stream_status[0].plane_count > 1) {
+			pipe->plane_res.hubp->funcs->hubp_wait_pipe_read_start(pipe->plane_res.hubp);
+		}
+	}
+}
+
+void dcn401_post_unlock_program_front_end(
+	struct dc *dc,
+	struct dc_state *context)
+{
+	// Timeout for pipe enable
+	unsigned int timeout_us = 100000;
+	unsigned int polling_interval_us = 1;
+	struct dce_hwseq *hwseq = dc->hwseq;
+	int i;
+
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++)
+		if (resource_is_pipe_type(&dc->current_state->res_ctx.pipe_ctx[i], OPP_HEAD) &&
+			!resource_is_pipe_type(&context->res_ctx.pipe_ctx[i], OPP_HEAD))
+			dc->hwss.post_unlock_reset_opp(dc,
+				&dc->current_state->res_ctx.pipe_ctx[i]);
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++)
+		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable)
+			dc->hwss.disable_plane(dc, dc->current_state, &dc->current_state->res_ctx.pipe_ctx[i]);
+
+	/*
+	 * If we are enabling a pipe, we need to wait for pending clear as this is a critical
+	 * part of the enable operation otherwise, DM may request an immediate flip which
+	 * will cause HW to perform an "immediate enable" (as opposed to "vsync enable") which
+	 * is unsupported on DCN.
+	 */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		// Don't check flip pending on phantom pipes
+		if (pipe->plane_state && !pipe->top_pipe && pipe->update_flags.bits.enable &&
+			dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM) {
+			struct hubp *hubp = pipe->plane_res.hubp;
+			int j = 0;
+
+			for (j = 0; j < timeout_us / polling_interval_us
+				&& hubp->funcs->hubp_is_flip_pending(hubp); j++)
+				udelay(polling_interval_us);
+		}
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		/* When going from a smaller ODM slice count to larger, we must ensure double
+		 * buffer update completes before we return to ensure we don't reduce DISPCLK
+		 * before we've transitioned to 2:1 or 4:1
+		 */
+		if (resource_is_pipe_type(old_pipe, OTG_MASTER) && resource_is_pipe_type(pipe, OTG_MASTER) &&
+			resource_get_odm_slice_count(old_pipe) < resource_get_odm_slice_count(pipe) &&
+			dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM) {
+			int j = 0;
+			struct timing_generator *tg = pipe->stream_res.tg;
+
+			if (tg->funcs->get_optc_double_buffer_pending) {
+				for (j = 0; j < timeout_us / polling_interval_us
+					&& tg->funcs->get_optc_double_buffer_pending(tg); j++)
+					udelay(polling_interval_us);
+			}
+		}
+	}
+
+	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
+		dc->res_pool->hubbub->funcs->force_pstate_change_control(
+			dc->res_pool->hubbub, false, false);
+
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe->plane_state && !pipe->top_pipe) {
+			/* Program phantom pipe here to prevent a frame of underflow in the MPO transition
+			 * case (if a pipe being used for a video plane transitions to a phantom pipe, it
+			 * can underflow due to HUBP_VTG_SEL programming if done in the regular front end
+			 * programming sequence).
+			 */
+			while (pipe) {
+				if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
+					/* When turning on the phantom pipe we want to run through the
+					 * entire enable sequence, so apply all the "enable" flags.
+					 */
+					if (dc->hwss.apply_update_flags_for_phantom)
+						dc->hwss.apply_update_flags_for_phantom(pipe);
+					if (dc->hwss.update_phantom_vp_position)
+						dc->hwss.update_phantom_vp_position(dc, context, pipe);
+					dcn401_program_pipe(dc, pipe, context);
+				}
+				pipe = pipe->bottom_pipe;
+			}
+		}
+	}
+
+	if (!hwseq)
+		return;
+
+	/* P-State support transitions:
+	 * Natural -> FPO:      P-State disabled in prepare, force disallow anytime is safe
+	 * FPO -> Natural:      Unforce anytime after FW disable is safe (P-State will assert naturally)
+	 * Unsupported -> FPO:  P-State enabled in optimize, force disallow anytime is safe
+	 * FPO -> Unsupported:  P-State disabled in prepare, unforce disallow anytime is safe
+	 * FPO <-> SubVP:       Force disallow is maintained on the FPO / SubVP pipes
+	 */
+	if (hwseq->funcs.update_force_pstate)
+		dc->hwseq->funcs.update_force_pstate(dc, context);
+
+	/* Only program the MALL registers after all the main and phantom pipes
+	 * are done programming.
+	 */
+	if (hwseq->funcs.program_mall_pipe_config)
+		hwseq->funcs.program_mall_pipe_config(dc, context);
+
+	/* WA to apply WM setting*/
+	if (hwseq->wa.DEGVIDCN21)
+		dc->res_pool->hubbub->funcs->apply_DEDCN21_147_wa(dc->res_pool->hubbub);
+
+
+	/* WA for stutter underflow during MPO transitions when adding 2nd plane */
+	if (hwseq->wa.disallow_self_refresh_during_multi_plane_transition) {
+
+		if (dc->current_state->stream_status[0].plane_count == 1 &&
+			context->stream_status[0].plane_count > 1) {
+
+			struct timing_generator *tg = dc->res_pool->timing_generators[0];
+
+			dc->res_pool->hubbub->funcs->allow_self_refresh_control(dc->res_pool->hubbub, false);
+
+			hwseq->wa_state.disallow_self_refresh_during_multi_plane_transition_applied = true;
+			hwseq->wa_state.disallow_self_refresh_during_multi_plane_transition_applied_on_frame =
+				tg->funcs->get_frame_count(tg);
+		}
+	}
+}
+
+bool dcn401_update_bandwidth(
+	struct dc *dc,
+	struct dc_state *context)
+{
+	int i;
+	struct dce_hwseq *hws = dc->hwseq;
+
+	/* recalculate DML parameters */
+	if (!dc->res_pool->funcs->validate_bandwidth(dc, context, false))
+		return false;
+
+	/* apply updated bandwidth parameters */
+	dc->hwss.prepare_bandwidth(dc, context);
+
+	/* update hubp configs for all pipes */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe_ctx->plane_state == NULL)
+			continue;
+
+		if (pipe_ctx->top_pipe == NULL) {
+			bool blank = !is_pipe_tree_visible(pipe_ctx);
+
+			pipe_ctx->stream_res.tg->funcs->program_global_sync(
+				pipe_ctx->stream_res.tg,
+				dcn401_calculate_vready_offset_for_group(pipe_ctx),
+				(unsigned int)pipe_ctx->global_sync.dcn4x.vstartup_lines,
+				(unsigned int)pipe_ctx->global_sync.dcn4x.vupdate_offset_pixels,
+				(unsigned int)pipe_ctx->global_sync.dcn4x.vupdate_vupdate_width_pixels,
+				(unsigned int)pipe_ctx->global_sync.dcn4x.pstate_keepout_start_lines);
+
+			pipe_ctx->stream_res.tg->funcs->set_vtg_params(
+				pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing, false);
+
+			if (pipe_ctx->prev_odm_pipe == NULL)
+				hws->funcs.blank_pixel_data(dc, pipe_ctx, blank);
+
+			if (hws->funcs.setup_vupdate_interrupt)
+				hws->funcs.setup_vupdate_interrupt(dc, pipe_ctx);
+		}
+
+		if (pipe_ctx->plane_res.hubp->funcs->hubp_setup2)
+			pipe_ctx->plane_res.hubp->funcs->hubp_setup2(
+				pipe_ctx->plane_res.hubp,
+				&pipe_ctx->hubp_regs,
+				&pipe_ctx->global_sync,
+				&pipe_ctx->stream->timing);
+	}
+
+	return true;
+}
+
+void dcn401_detect_pipe_changes(struct dc_state *old_state,
+	struct dc_state *new_state,
+	struct pipe_ctx *old_pipe,
+	struct pipe_ctx *new_pipe)
+{
+	bool old_is_phantom = dc_state_get_pipe_subvp_type(old_state, old_pipe) == SUBVP_PHANTOM;
+	bool new_is_phantom = dc_state_get_pipe_subvp_type(new_state, new_pipe) == SUBVP_PHANTOM;
+
+	unsigned int old_pipe_vready_offset_pixels = old_pipe->global_sync.dcn4x.vready_offset_pixels;
+	unsigned int new_pipe_vready_offset_pixels = new_pipe->global_sync.dcn4x.vready_offset_pixels;
+	unsigned int old_pipe_vstartup_lines = old_pipe->global_sync.dcn4x.vstartup_lines;
+	unsigned int new_pipe_vstartup_lines = new_pipe->global_sync.dcn4x.vstartup_lines;
+	unsigned int old_pipe_vupdate_offset_pixels = old_pipe->global_sync.dcn4x.vupdate_offset_pixels;
+	unsigned int new_pipe_vupdate_offset_pixels = new_pipe->global_sync.dcn4x.vupdate_offset_pixels;
+	unsigned int old_pipe_vupdate_width_pixels = old_pipe->global_sync.dcn4x.vupdate_vupdate_width_pixels;
+	unsigned int new_pipe_vupdate_width_pixels = new_pipe->global_sync.dcn4x.vupdate_vupdate_width_pixels;
+
+	new_pipe->update_flags.raw = 0;
+
+	/* If non-phantom pipe is being transitioned to a phantom pipe,
+	 * set disable and return immediately. This is because the pipe
+	 * that was previously in use must be fully disabled before we
+	 * can "enable" it as a phantom pipe (since the OTG will certainly
+	 * be different). The post_unlock sequence will set the correct
+	 * update flags to enable the phantom pipe.
+	 */
+	if (old_pipe->plane_state && !old_is_phantom &&
+		new_pipe->plane_state && new_is_phantom) {
+		new_pipe->update_flags.bits.disable = 1;
+		return;
+	}
+
+	if (resource_is_pipe_type(new_pipe, OTG_MASTER) &&
+		resource_is_odm_topology_changed(new_pipe, old_pipe))
+		/* Detect odm changes */
+		new_pipe->update_flags.bits.odm = 1;
+
+	/* Exit on unchanged, unused pipe */
+	if (!old_pipe->plane_state && !new_pipe->plane_state)
+		return;
+	/* Detect pipe enable/disable */
+	if (!old_pipe->plane_state && new_pipe->plane_state) {
+		new_pipe->update_flags.bits.enable = 1;
+		new_pipe->update_flags.bits.mpcc = 1;
+		new_pipe->update_flags.bits.dppclk = 1;
+		new_pipe->update_flags.bits.hubp_interdependent = 1;
+		new_pipe->update_flags.bits.hubp_rq_dlg_ttu = 1;
+		new_pipe->update_flags.bits.unbounded_req = 1;
+		new_pipe->update_flags.bits.gamut_remap = 1;
+		new_pipe->update_flags.bits.scaler = 1;
+		new_pipe->update_flags.bits.viewport = 1;
+		new_pipe->update_flags.bits.det_size = 1;
+		if (new_pipe->stream->test_pattern.type != DP_TEST_PATTERN_VIDEO_MODE &&
+			new_pipe->stream_res.test_pattern_params.width != 0 &&
+			new_pipe->stream_res.test_pattern_params.height != 0)
+			new_pipe->update_flags.bits.test_pattern_changed = 1;
+		if (!new_pipe->top_pipe && !new_pipe->prev_odm_pipe) {
+			new_pipe->update_flags.bits.odm = 1;
+			new_pipe->update_flags.bits.global_sync = 1;
+		}
+		return;
+	}
+
+	/* For SubVP we need to unconditionally enable because any phantom pipes are
+	 * always removed then newly added for every full updates whenever SubVP is in use.
+	 * The remove-add sequence of the phantom pipe always results in the pipe
+	 * being blanked in enable_stream_timing (DPG).
+	 */
+	if (new_pipe->stream && dc_state_get_pipe_subvp_type(new_state, new_pipe) == SUBVP_PHANTOM)
+		new_pipe->update_flags.bits.enable = 1;
+
+	/* Phantom pipes are effectively disabled, if the pipe was previously phantom
+	 * we have to enable
+	 */
+	if (old_pipe->plane_state && old_is_phantom &&
+		new_pipe->plane_state && !new_is_phantom)
+		new_pipe->update_flags.bits.enable = 1;
+
+	if (old_pipe->plane_state && !new_pipe->plane_state) {
+		new_pipe->update_flags.bits.disable = 1;
+		return;
+	}
+
+	/* Detect plane change */
+	if (old_pipe->plane_state != new_pipe->plane_state)
+		new_pipe->update_flags.bits.plane_changed = true;
+
+	/* Detect top pipe only changes */
+	if (resource_is_pipe_type(new_pipe, OTG_MASTER)) {
+		/* Detect global sync changes */
+		if ((old_pipe_vready_offset_pixels != new_pipe_vready_offset_pixels)
+			|| (old_pipe_vstartup_lines != new_pipe_vstartup_lines)
+			|| (old_pipe_vupdate_offset_pixels != new_pipe_vupdate_offset_pixels)
+			|| (old_pipe_vupdate_width_pixels != new_pipe_vupdate_width_pixels))
+			new_pipe->update_flags.bits.global_sync = 1;
+	}
+
+	if (old_pipe->det_buffer_size_kb != new_pipe->det_buffer_size_kb)
+		new_pipe->update_flags.bits.det_size = 1;
+
+	/*
+	 * Detect opp / tg change, only set on change, not on enable
+	 * Assume mpcc inst = pipe index, if not this code needs to be updated
+	 * since mpcc is what is affected by these. In fact all of our sequence
+	 * makes this assumption at the moment with how hubp reset is matched to
+	 * same index mpcc reset.
+	 */
+	if (old_pipe->stream_res.opp != new_pipe->stream_res.opp)
+		new_pipe->update_flags.bits.opp_changed = 1;
+	if (old_pipe->stream_res.tg != new_pipe->stream_res.tg)
+		new_pipe->update_flags.bits.tg_changed = 1;
+
+	/*
+	 * Detect mpcc blending changes, only dpp inst and opp matter here,
+	 * mpccs getting removed/inserted update connected ones during their own
+	 * programming
+	 */
+	if (old_pipe->plane_res.dpp != new_pipe->plane_res.dpp
+		|| old_pipe->stream_res.opp != new_pipe->stream_res.opp)
+		new_pipe->update_flags.bits.mpcc = 1;
+
+	/* Detect dppclk change */
+	if (old_pipe->plane_res.bw.dppclk_khz != new_pipe->plane_res.bw.dppclk_khz)
+		new_pipe->update_flags.bits.dppclk = 1;
+
+	/* Check for scl update */
+	if (memcmp(&old_pipe->plane_res.scl_data, &new_pipe->plane_res.scl_data, sizeof(struct scaler_data)))
+		new_pipe->update_flags.bits.scaler = 1;
+	/* Check for vp update */
+	if (memcmp(&old_pipe->plane_res.scl_data.viewport, &new_pipe->plane_res.scl_data.viewport, sizeof(struct rect))
+		|| memcmp(&old_pipe->plane_res.scl_data.viewport_c,
+			&new_pipe->plane_res.scl_data.viewport_c, sizeof(struct rect)))
+		new_pipe->update_flags.bits.viewport = 1;
+
+	/* Detect dlg/ttu/rq updates */
+	{
+		struct dml2_display_dlg_regs old_dlg_regs = old_pipe->hubp_regs.dlg_regs;
+		struct dml2_display_ttu_regs old_ttu_regs = old_pipe->hubp_regs.ttu_regs;
+		struct dml2_display_rq_regs	 old_rq_regs = old_pipe->hubp_regs.rq_regs;
+		struct dml2_display_dlg_regs *new_dlg_regs = &new_pipe->hubp_regs.dlg_regs;
+		struct dml2_display_ttu_regs *new_ttu_regs = &new_pipe->hubp_regs.ttu_regs;
+		struct dml2_display_rq_regs	 *new_rq_regs = &new_pipe->hubp_regs.rq_regs;
+
+		/* Detect pipe interdependent updates */
+		if ((old_dlg_regs.dst_y_prefetch != new_dlg_regs->dst_y_prefetch)
+			|| (old_dlg_regs.vratio_prefetch != new_dlg_regs->vratio_prefetch)
+			|| (old_dlg_regs.vratio_prefetch_c != new_dlg_regs->vratio_prefetch_c)
+			|| (old_dlg_regs.dst_y_per_vm_vblank != new_dlg_regs->dst_y_per_vm_vblank)
+			|| (old_dlg_regs.dst_y_per_row_vblank != new_dlg_regs->dst_y_per_row_vblank)
+			|| (old_dlg_regs.dst_y_per_vm_flip != new_dlg_regs->dst_y_per_vm_flip)
+			|| (old_dlg_regs.dst_y_per_row_flip != new_dlg_regs->dst_y_per_row_flip)
+			|| (old_dlg_regs.refcyc_per_meta_chunk_vblank_l != new_dlg_regs->refcyc_per_meta_chunk_vblank_l)
+			|| (old_dlg_regs.refcyc_per_meta_chunk_vblank_c != new_dlg_regs->refcyc_per_meta_chunk_vblank_c)
+			|| (old_dlg_regs.refcyc_per_meta_chunk_flip_l != new_dlg_regs->refcyc_per_meta_chunk_flip_l)
+			|| (old_dlg_regs.refcyc_per_line_delivery_pre_l != new_dlg_regs->refcyc_per_line_delivery_pre_l)
+			|| (old_dlg_regs.refcyc_per_line_delivery_pre_c != new_dlg_regs->refcyc_per_line_delivery_pre_c)
+			|| (old_ttu_regs.refcyc_per_req_delivery_pre_l != new_ttu_regs->refcyc_per_req_delivery_pre_l)
+			|| (old_ttu_regs.refcyc_per_req_delivery_pre_c != new_ttu_regs->refcyc_per_req_delivery_pre_c)
+			|| (old_ttu_regs.refcyc_per_req_delivery_pre_cur0 !=
+				new_ttu_regs->refcyc_per_req_delivery_pre_cur0)
+			|| (old_ttu_regs.min_ttu_vblank != new_ttu_regs->min_ttu_vblank)
+			|| (old_ttu_regs.qos_level_flip != new_ttu_regs->qos_level_flip)) {
+			old_dlg_regs.dst_y_prefetch = new_dlg_regs->dst_y_prefetch;
+			old_dlg_regs.vratio_prefetch = new_dlg_regs->vratio_prefetch;
+			old_dlg_regs.vratio_prefetch_c = new_dlg_regs->vratio_prefetch_c;
+			old_dlg_regs.dst_y_per_vm_vblank = new_dlg_regs->dst_y_per_vm_vblank;
+			old_dlg_regs.dst_y_per_row_vblank = new_dlg_regs->dst_y_per_row_vblank;
+			old_dlg_regs.dst_y_per_vm_flip = new_dlg_regs->dst_y_per_vm_flip;
+			old_dlg_regs.dst_y_per_row_flip = new_dlg_regs->dst_y_per_row_flip;
+			old_dlg_regs.refcyc_per_meta_chunk_vblank_l = new_dlg_regs->refcyc_per_meta_chunk_vblank_l;
+			old_dlg_regs.refcyc_per_meta_chunk_vblank_c = new_dlg_regs->refcyc_per_meta_chunk_vblank_c;
+			old_dlg_regs.refcyc_per_meta_chunk_flip_l = new_dlg_regs->refcyc_per_meta_chunk_flip_l;
+			old_dlg_regs.refcyc_per_line_delivery_pre_l = new_dlg_regs->refcyc_per_line_delivery_pre_l;
+			old_dlg_regs.refcyc_per_line_delivery_pre_c = new_dlg_regs->refcyc_per_line_delivery_pre_c;
+			old_ttu_regs.refcyc_per_req_delivery_pre_l = new_ttu_regs->refcyc_per_req_delivery_pre_l;
+			old_ttu_regs.refcyc_per_req_delivery_pre_c = new_ttu_regs->refcyc_per_req_delivery_pre_c;
+			old_ttu_regs.refcyc_per_req_delivery_pre_cur0 = new_ttu_regs->refcyc_per_req_delivery_pre_cur0;
+			old_ttu_regs.min_ttu_vblank = new_ttu_regs->min_ttu_vblank;
+			old_ttu_regs.qos_level_flip = new_ttu_regs->qos_level_flip;
+			new_pipe->update_flags.bits.hubp_interdependent = 1;
+		}
+		/* Detect any other updates to ttu/rq/dlg */
+		if (memcmp(&old_dlg_regs, new_dlg_regs, sizeof(old_dlg_regs)) ||
+			memcmp(&old_ttu_regs, new_ttu_regs, sizeof(old_ttu_regs)) ||
+			memcmp(&old_rq_regs, new_rq_regs, sizeof(old_rq_regs)))
+			new_pipe->update_flags.bits.hubp_rq_dlg_ttu = 1;
+	}
+
+	if (old_pipe->unbounded_req != new_pipe->unbounded_req)
+		new_pipe->update_flags.bits.unbounded_req = 1;
+
+	if (memcmp(&old_pipe->stream_res.test_pattern_params,
+		&new_pipe->stream_res.test_pattern_params, sizeof(struct test_pattern_params))) {
+		new_pipe->update_flags.bits.test_pattern_changed = 1;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
index 28a513dfc005..17a06f299b68 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
@@ -96,5 +96,12 @@ void dcn401_reset_hw_ctx_wrap(
 		struct dc *dc,
 		struct dc_state *context);
 void dcn401_perform_3dlut_wa_unlock(struct pipe_ctx *pipe_ctx);
-
+void dcn401_program_front_end_for_ctx(struct dc *dc, struct dc_state *context);
+void dcn401_post_unlock_program_front_end(struct dc *dc, struct dc_state *context);
+bool dcn401_update_bandwidth(struct dc *dc, struct dc_state *context);
+void dcn401_detect_pipe_changes(
+	struct dc_state *old_state,
+	struct dc_state *new_state,
+	struct pipe_ctx *old_pipe,
+	struct pipe_ctx *new_pipe);
 #endif /* __DC_HWSS_DCN401_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
index b30f665d98a6..44cb376f97c1 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
@@ -17,9 +17,9 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.init_hw = dcn401_init_hw,
 	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
 	.apply_ctx_for_surface = NULL,
-	.program_front_end_for_ctx = dcn20_program_front_end_for_ctx,
+	.program_front_end_for_ctx = dcn401_program_front_end_for_ctx,
 	.wait_for_pending_cleared = dcn10_wait_for_pending_cleared,
-	.post_unlock_program_front_end = dcn20_post_unlock_program_front_end,
+	.post_unlock_program_front_end = dcn401_post_unlock_program_front_end,
 	.update_plane_addr = dcn20_update_plane_addr,
 	.update_dchub = dcn10_update_dchub,
 	.update_pending_status = dcn10_update_pending_status,
@@ -42,7 +42,7 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.cursor_lock = dcn10_cursor_lock,
 	.prepare_bandwidth = dcn401_prepare_bandwidth,
 	.optimize_bandwidth = dcn401_optimize_bandwidth,
-	.update_bandwidth = dcn20_update_bandwidth,
+	.update_bandwidth = dcn401_update_bandwidth,
 	.set_drr = dcn10_set_drr,
 	.get_position = dcn10_get_position,
 	.set_static_screen_control = dcn31_set_static_screen_control,
@@ -99,6 +99,10 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.fams2_global_control_lock_fast = dcn401_fams2_global_control_lock_fast,
 	.program_outstanding_updates = dcn401_program_outstanding_updates,
 	.wait_for_all_pending_updates = dcn30_wait_for_all_pending_updates,
+	.detect_pipe_changes = dcn401_detect_pipe_changes,
+	.enable_plane = dcn20_enable_plane,
+	.update_dchubp_dpp = dcn20_update_dchubp_dpp,
+	.post_unlock_reset_opp = dcn20_post_unlock_reset_opp,
 };
 
 static const struct hwseq_private_funcs dcn401_private_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
index 98d85c7ab3fa..a7d66cfd93c9 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
@@ -457,6 +457,18 @@ struct hw_sequencer_funcs {
 			struct dc_state *context);
 	void (*setup_hpo_hw_control)(const struct dce_hwseq *hws, bool enable);
 	void (*wait_for_all_pending_updates)(const struct pipe_ctx *pipe_ctx);
+	void (*detect_pipe_changes)(struct dc_state *old_state,
+			struct dc_state *new_state,
+			struct pipe_ctx *old_pipe,
+			struct pipe_ctx *new_pipe);
+	void (*enable_plane)(struct dc *dc,
+			struct pipe_ctx *pipe_ctx,
+			struct dc_state *context);
+	void (*update_dchubp_dpp)(struct dc *dc,
+			struct pipe_ctx *pipe_ctx,
+			struct dc_state *context);
+	void (*post_unlock_reset_opp)(struct dc *dc,
+			struct pipe_ctx *opp_head);
 };
 
 void color_space_to_black_color(
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 06a420154888..d558efc6e12f 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -217,6 +217,7 @@ struct resource_funcs {
 	 */
 	int (*get_power_profile)(const struct dc_state *context);
 	unsigned int (*get_det_buffer_size)(const struct dc_state *context);
+	unsigned int (*get_vstartup_for_pipe)(struct pipe_ctx *pipe_ctx);
 };
 
 struct audio_support{
@@ -465,6 +466,7 @@ struct pipe_ctx {
 	unsigned int surface_size_in_mall_bytes;
 	struct dml2_dchub_per_pipe_register_set hubp_regs;
 	struct dml2_hubp_pipe_mcache_regs mcache_regs;
+	union dml2_global_sync_programming global_sync;
 
 	struct dwbc *dwbc;
 	struct mcif_wb *mcif_wb;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
index 93529dc196c0..2a530a4a39f7 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
@@ -42,6 +42,7 @@
 #include "cursor_reg_cache.h"
 
 #include "dml2/dml21/inc/dml_top_dchub_registers.h"
+#include "dml2/dml21/inc/dml_top_types.h"
 
 #define OPP_ID_INVALID 0xf
 #define MAX_TTU 0xffffff
@@ -144,11 +145,21 @@ struct hubp_funcs {
 			struct _vcs_dpi_display_rq_regs_st *rq_regs,
 			struct _vcs_dpi_display_pipe_dest_params_st *pipe_dest);
 
+	void (*hubp_setup2)(
+		struct hubp *hubp,
+		struct dml2_dchub_per_pipe_register_set *pipe_regs,
+		union dml2_global_sync_programming *pipe_global_sync,
+		struct dc_crtc_timing *timing);
+
 	void (*hubp_setup_interdependent)(
 			struct hubp *hubp,
 			struct _vcs_dpi_display_dlg_regs_st *dlg_regs,
 			struct _vcs_dpi_display_ttu_regs_st *ttu_regs);
 
+	void (*hubp_setup_interdependent2)(
+		struct hubp *hubp,
+		struct dml2_dchub_per_pipe_register_set *pipe_regs);
+
 	void (*dcc_control)(struct hubp *hubp, bool enable,
 			enum hubp_ind_block_size blk_size);
 
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
index d4ef874327ba..a296bb89b106 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
@@ -302,7 +302,6 @@ void optc1_program_timing(
 	/* Enable stereo - only when we need to pack 3D frame. Other types
 	 * of stereo handled in explicit call
 	 */
-
 	if (optc->funcs->is_two_pixels_per_container(&patched_crtc_timing) || optc1->opp_count == 2)
 		h_div = H_TIMING_DIV_BY2;
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
index 770a380cc03d..e92f14d50adb 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
@@ -1258,6 +1258,11 @@ struct stream_encoder *dcn10_find_first_free_match_stream_enc_for_link(
 	return NULL;
 }
 
+unsigned int dcn10_get_vstartup_for_pipe(struct pipe_ctx *pipe_ctx)
+{
+	return pipe_ctx->pipe_dlg_param.vstartup_start;
+}
+
 static const struct dc_cap_funcs cap_funcs = {
 	.get_dcc_compression_cap = dcn10_get_dcc_compression_cap
 };
@@ -1272,7 +1277,8 @@ static const struct resource_funcs dcn10_res_pool_funcs = {
 	.validate_global = dcn10_validate_global,
 	.add_stream_to_ctx = dcn10_add_stream_to_ctx,
 	.patch_unknown_plane_state = dcn10_patch_unknown_plane_state,
-	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link
+	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static uint32_t read_pipe_fuses(struct dc_context *ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.h
index bf8e33cd8147..7bc1be53e800 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.h
@@ -51,6 +51,7 @@ struct stream_encoder *dcn10_find_first_free_match_stream_enc_for_link(
 		const struct resource_pool *pool,
 		struct dc_stream_state *stream);
 
+unsigned int dcn10_get_vstartup_for_pipe(struct pipe_ctx *pipe_ctx);
 
 #endif /* __DC_RESOURCE_DCN10_H__ */
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
index 5c616b1f7bf7..5c6dc710e96c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
@@ -2229,7 +2229,8 @@ static const struct resource_funcs dcn20_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.set_mcif_arb_params = dcn20_set_mcif_arb_params,
 	.populate_dml_pipes = dcn20_populate_dml_pipes_from_context,
-	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link
+	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 bool dcn20_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
index 9f37f0097feb..43fa2cb117f3 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
@@ -1079,7 +1079,8 @@ static struct resource_funcs dcn201_res_pool_funcs = {
 	.populate_dml_writeback_from_context = dcn201_populate_dml_writeback_from_context,
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.set_mcif_arb_params = dcn20_set_mcif_arb_params,
-	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link
+	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static bool dcn201_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
index 021ba8ac5c8c..2615c36d5ffe 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
@@ -1378,6 +1378,7 @@ static const struct resource_funcs dcn21_res_pool_funcs = {
 	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
 	.update_bw_bounding_box = dcn21_update_bw_bounding_box,
 	.get_panel_config_defaults = dcn21_get_panel_config_defaults,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static bool dcn21_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
index bfd0eccbed28..13202ce30d66 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
@@ -2250,6 +2250,7 @@ static const struct resource_funcs dcn30_res_pool_funcs = {
 	.update_bw_bounding_box = dcn30_update_bw_bounding_box,
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.get_panel_config_defaults = dcn30_get_panel_config_defaults,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 #define CTX ctx
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
index 0cc8a27be593..121a86a59833 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
@@ -1400,7 +1400,8 @@ static struct resource_funcs dcn301_res_pool_funcs = {
 	.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
 	.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
 	.update_bw_bounding_box = dcn301_update_bw_bounding_box,
-	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state
+	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static bool dcn301_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
index 7baefc910a3d..012c5fd52cb1 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
@@ -1151,6 +1151,7 @@ static struct resource_funcs dcn302_res_pool_funcs = {
 		.update_bw_bounding_box = dcn302_update_bw_bounding_box,
 		.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 		.get_panel_config_defaults = dcn302_get_panel_config_defaults,
+		.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static struct dc_cap_funcs cap_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
index 8a57d46ad15f..a8d0b4686f9a 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
@@ -1096,6 +1096,7 @@ static struct resource_funcs dcn303_res_pool_funcs = {
 		.update_bw_bounding_box = dcn303_update_bw_bounding_box,
 		.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 		.get_panel_config_defaults = dcn303_get_panel_config_defaults,
+		.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static struct dc_cap_funcs cap_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index 54ec3d8e920c..911bd60d4fbc 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1849,6 +1849,7 @@ static struct resource_funcs dcn31_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.get_panel_config_defaults = dcn31_get_panel_config_defaults,
 	.get_det_buffer_size = dcn31_get_det_buffer_size,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static struct clock_source *dcn30_clock_source_create(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index 2794473f2aff..e3ba105034f8 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -1778,6 +1778,7 @@ static struct resource_funcs dcn314_res_pool_funcs = {
 	.get_panel_config_defaults = dcn314_get_panel_config_defaults,
 	.get_preferred_eng_id_dpia = dcn314_get_preferred_eng_id_dpia,
 	.get_det_buffer_size = dcn31_get_det_buffer_size,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static struct clock_source *dcn30_clock_source_create(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
index 4ee33eb3381d..14acef036b5a 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
@@ -1846,6 +1846,7 @@ static struct resource_funcs dcn315_res_pool_funcs = {
 	.get_panel_config_defaults = dcn315_get_panel_config_defaults,
 	.get_power_profile = dcn315_get_power_profile,
 	.get_det_buffer_size = dcn31_get_det_buffer_size,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static bool dcn315_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
index 79eddbafe3c2..568094827212 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
@@ -1720,6 +1720,7 @@ static struct resource_funcs dcn316_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.get_panel_config_defaults = dcn316_get_panel_config_defaults,
 	.get_det_buffer_size = dcn31_get_det_buffer_size,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static bool dcn316_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 12d247a7ec45..664302876019 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -2066,6 +2066,7 @@ static struct resource_funcs dcn32_res_pool_funcs = {
 	.add_phantom_pipes = dcn32_add_phantom_pipes,
 	.build_pipe_pix_clk_params = dcn20_build_pipe_pix_clk_params,
 	.calculate_mall_ways_from_bytes = dcn32_calculate_mall_ways_from_bytes,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static uint32_t read_pipe_fuses(struct dc_context *ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 06b9479c8bd3..38d76434683e 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1624,6 +1624,7 @@ static struct resource_funcs dcn321_res_pool_funcs = {
 	.add_phantom_pipes = dcn32_add_phantom_pipes,
 	.build_pipe_pix_clk_params = dcn20_build_pipe_pix_clk_params,
 	.calculate_mall_ways_from_bytes = dcn32_calculate_mall_ways_from_bytes,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static uint32_t read_pipe_fuses(struct dc_context *ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index b878b60feff9..8ee3d99ea2aa 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1786,6 +1786,7 @@ static struct resource_funcs dcn35_res_pool_funcs = {
 	.get_panel_config_defaults = dcn35_get_panel_config_defaults,
 	.get_preferred_eng_id_dpia = dcn35_get_preferred_eng_id_dpia,
 	.get_det_buffer_size = dcn31_get_det_buffer_size,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static bool dcn35_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 16abd3ae8684..14f7c3acdc96 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1758,6 +1758,7 @@ static struct resource_funcs dcn351_res_pool_funcs = {
 	.get_panel_config_defaults = dcn35_get_panel_config_defaults,
 	.get_preferred_eng_id_dpia = dcn351_get_preferred_eng_id_dpia,
 	.get_det_buffer_size = dcn31_get_det_buffer_size,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static bool dcn351_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index c6ed0b921523..0767adaa6389 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1709,6 +1709,11 @@ static int dcn401_get_power_profile(const struct dc_state *context)
 	return dpm_level;
 }
 
+static unsigned int dcn401_get_vstartup_for_pipe(struct pipe_ctx *pipe_ctx)
+{
+	return pipe_ctx->global_sync.dcn4x.vstartup_lines;
+}
+
 static unsigned int dcn401_calc_num_avail_chans_for_mall(struct dc *dc, unsigned int num_chans)
 {
 	unsigned int num_available_chans = 1;
@@ -1759,6 +1764,7 @@ static struct resource_funcs dcn401_res_pool_funcs = {
 	.build_pipe_pix_clk_params = dcn401_build_pipe_pix_clk_params,
 	.calculate_mall_ways_from_bytes = dcn32_calculate_mall_ways_from_bytes,
 	.get_power_profile = dcn401_get_power_profile,
+	.get_vstartup_for_pipe = dcn401_get_vstartup_for_pipe
 };
 
 static uint32_t read_pipe_fuses(struct dc_context *ctx)
-- 
2.34.1


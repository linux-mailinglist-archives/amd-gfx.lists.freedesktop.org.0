Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F8910C0F
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2024 18:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB14B10EB27;
	Thu, 20 Jun 2024 16:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aHC0FDLJ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD04E10EB27
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2024 16:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8iMZs4MtekOATyYIuKsJE/lRgObALZb6BE3HLpR91v6QoidwyUzE7pK5JHGKUo/Txzx2gu0WmD3FVkBVILB0LWqSUq9jBpcHt+vSeLfBZNzpyt3bp+tx0ocIjY4FUmzC7cOuepnVlvnDSq1xMsgKq+ElH+L1GQCKj73LD0Eeh9dlWCyqxi26bitv8ls2/59rWDhxUCVpOJ1y0r7+nckuE+ajYMtD3EkvgczUqdXYm3sz7W/+tIGC7elf1T+3uCvZ+qg4Mq5pEsOX8eHa6NOQ5TSGwzy2vrzeHGnmzVt9HSKjtVKA2Bi6bqwBqTmN+eqcagEiwKSgnKusB4Tjcn3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGPTepNtcY6fAO0Ql0qWqei1qUe5zXauTadkCprGSSo=;
 b=IiDBAAOUPgiepDrNMPI2aIYFd4KyF5MIxZhSsm4KkaUhVTkcwDGrNroq8Q9Xfcc/am5ao06c3V5wjVHnjmifplxP6PeRucW9t41Sjs5HYo/hSnjhQHL+WsBlBQ49cA2KrThabGoOwq6jAd7rhpZALHio9veDYKRtSrzzWD3FBUSx8Tdlp1K5EA568MgBNbNqBxJmJrbSi8O8uG1EAubFuQXiVhkKjqK8YYa9Wg+yUpzcXb/QynYQj3yGm91Q/Nwy/gDTY0GP82XgEoGz/fsLT/NeSXbrf0ypp18Awb+cj5BaVUDRFLktix2HNaKI+2VBA3N0e14xcAXQw67qEfVFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGPTepNtcY6fAO0Ql0qWqei1qUe5zXauTadkCprGSSo=;
 b=aHC0FDLJszLp63A0ZPhs169RwM92e8Ku9bG0kT+hNapYQpyuIDfU0JFK1pNi+oP69Z4tHex5mMWYqUO5gZfXBlA/GPjJTfn03wjaCUu/nXj7Alg6MaV9zjNH5QZKM/YFe71jdlL9UyOiKzKNQbQciuHSwx0lv8+cf0vcatfZBO8=
Received: from CH2PR14CA0052.namprd14.prod.outlook.com (2603:10b6:610:56::32)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 16:21:14 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::31) by CH2PR14CA0052.outlook.office365.com
 (2603:10b6:610:56::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Thu, 20 Jun 2024 16:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 16:21:13 +0000
Received: from 10.254.92.128.in-addr.arpa (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 11:21:11 -0500
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, "Rodrigo
 Siqueira" <rodrigo.siqueira@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 38/39] drm/amd/display: Enable DCC on DCN401
Date: Thu, 20 Jun 2024 10:11:44 -0600
Message-ID: <20240620161145.2489774-39-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620161145.2489774-1-alex.hung@amd.com>
References: <20240620161145.2489774-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|SJ1PR12MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: fe54ec65-3b18-42f6-86d7-08dc91450117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|82310400023|376011|1800799021; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?erqrZ6OBuxIi0PCALZjNHaZY8etGuI+UF/0ne5NmYj+zmA+ez/+N/g59evss?=
 =?us-ascii?Q?SgxFa6sgFuUmR3GFdGMiBaYykvCloRJxNqusLawhpBHIoaOwYG8ZHChtuoGw?=
 =?us-ascii?Q?g9ZmImvzqVAhSoyLa8jyM8mN5ibE71Gp8YhGl3YqrU05JK3/4NDWljAlKTMS?=
 =?us-ascii?Q?ZcIz6PZVQFJHHNVmlHiB2n0aTUOFo7FKFHDTWH3ozWjf1deQMGr8rG6dmtbt?=
 =?us-ascii?Q?FPG1UgkLgSD7l6X0Ac86YD0h+00Sx3bfw0MpB/18ZVGL62mX1GQJJL9tWNK6?=
 =?us-ascii?Q?kgwCb0OqS4igzyum60fPa9thAjoyTq948iE2y3lWTEwzG5AMge8VJaztT4hI?=
 =?us-ascii?Q?2oLWsSEq9pbHtjoBi0xxRRbbGs5SogrEeKxBEBnVTusucXLMIXM7ukRrpHe7?=
 =?us-ascii?Q?GtnhwEdDN1jBda7tG5hByrobejIqeaX/n6UUC4XJSWuurn+wDrbONHQz3upd?=
 =?us-ascii?Q?0SxpjNe3C4Npo8icwnTkZPFxwdLVNDIruz66leqrxgJS4pcoMOdtMzpn+W7B?=
 =?us-ascii?Q?Kzyyx4HfHNLQkOGKQ6cKDvVlPtWcWD58XvZBuqlVq9BCr2fh/L0Y2mEdRK+z?=
 =?us-ascii?Q?YMoZJYbumNZk+KCUdfdw7+Xsym/d8Iyn1AAJykLC0qrx0pzgH/3iW4clKLJK?=
 =?us-ascii?Q?BW31JQ5FaoQiAT7epbNbPvDxLczzNSQgf2+yW7vyvQzC2amXnCPQCntTIWw6?=
 =?us-ascii?Q?PpL4/Njiwmzak8RIT73BWVvkc2YJLSaBc3ikcFtzAzYOBCAcBWsT2qld53oh?=
 =?us-ascii?Q?S4B4v8ZhbZaRM9COA3pVfRE39XGOwipjQ49ONoTl7edT8FbnLmflZxRs7Po3?=
 =?us-ascii?Q?Rm+wLrbOlNPVr+oRw1yy3bKDXUR3smnNi68Zk3ThdEtI2Bb9YwtsOF+AIZJd?=
 =?us-ascii?Q?vplS18kzwAEgAKBGzDXDfx04kjnulcPeajMRUtEdOXyrR3cDE1oRALMl8UQL?=
 =?us-ascii?Q?xvEpGzMxKwYt3exZudsyKhh2Ma6sMpVIpNSVeVMlf1YulKAgY7VOU9SuzmHY?=
 =?us-ascii?Q?SZ6DUA8VPnrjAObEMqhXxJFg3RlCJelxwW16Xsq5ypTr4F2yNSUM475FxewF?=
 =?us-ascii?Q?YZNvbB1Uy7GcaJZ581Z6W2RbrUe0fYn21gZLzPpGm5Gc2hwahYrsZ3ZiYwLG?=
 =?us-ascii?Q?9mzSJFMN3xDlDSVmbbgoLnhjgWGP9eoZlQdrflaW17b1XfDCBfQvIUNfQCrs?=
 =?us-ascii?Q?Zz6nSPiBkq4QWCcc6lgNl7xJA83hpOZBl8wiW5PdZontcvcDU1FNr1wAvQNN?=
 =?us-ascii?Q?DFdndRbRKEILoWnj7ju6lIPjH4TWfJ0/V3jr3w00xIOMkJGNwTFd+lZQFt/j?=
 =?us-ascii?Q?DvIYlceCr9pHHXoI2zHm9na8nyyUvIAWNHEaULIp0ZcB83fotU24UII/KoFH?=
 =?us-ascii?Q?7kQq+1MO+vwo1vT/tDBthq/KJ1ERQPH/YuXSRZ3fMM32K0b7Zw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(82310400023)(376011)(1800799021); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 16:21:13.5920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe54ec65-3b18-42f6-86d7-08dc91450117
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049
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

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[WHAT]
Add registers and entry points to enable DCC on DCN4x

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  12 +
 .../drm/amd/display/dc/core/dc_hw_sequencer.c |  11 +
 drivers/gpu/drm/amd/display/dc/dc.h           |   4 +
 .../drm/amd/display/dc/dml2/dml2_wrapper.c    |   6 +
 .../drm/amd/display/dc/dml2/dml2_wrapper.h    |   2 +-
 .../display/dc/hubbub/dcn30/dcn30_hubbub.c    |   3 +
 .../display/dc/hubbub/dcn31/dcn31_hubbub.c    |   3 +
 .../display/dc/hubbub/dcn401/dcn401_hubbub.c  | 280 ++++++++++++++++++
 .../display/dc/hubbub/dcn401/dcn401_hubbub.h  |   5 +
 .../amd/display/dc/hubp/dcn20/dcn20_hubp.h    |  14 +
 .../amd/display/dc/hubp/dcn401/dcn401_hubp.c  |  21 ++
 .../amd/display/dc/hubp/dcn401/dcn401_hubp.h  |  14 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |   4 +
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c |  25 ++
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |   2 +
 .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   1 +
 .../drm/amd/display/dc/hwss/hw_sequencer.h    |   9 +
 .../gpu/drm/amd/display/dc/inc/core_types.h   |   3 +
 .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |   1 +
 .../dc/resource/dcn401/dcn401_resource.c      |   9 +
 .../dc/resource/dcn401/dcn401_resource.h      |   2 +
 22 files changed, 433 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index a4ba6f99cd34..85a2ef82afa5 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1264,6 +1264,9 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 				apply_ctx_interdependent_lock(dc, dc->current_state, old_stream, false);
 				dc->hwss.post_unlock_program_front_end(dc, dangling_context);
 			}
+
+			if (dc->res_pool->funcs->prepare_mcache_programming)
+				dc->res_pool->funcs->prepare_mcache_programming(dc, dangling_context);
 			if (dc->hwss.program_front_end_for_ctx) {
 				dc->hwss.interdependent_update_lock(dc, dc->current_state, true);
 				dc->hwss.program_front_end_for_ctx(dc, dangling_context);
@@ -2037,6 +2040,8 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 	}
 
 	/* Program all planes within new context*/
+	if (dc->res_pool->funcs->prepare_mcache_programming)
+		dc->res_pool->funcs->prepare_mcache_programming(dc, context);
 	if (dc->hwss.program_front_end_for_ctx) {
 		dc->hwss.interdependent_update_lock(dc, context, true);
 		dc->hwss.program_front_end_for_ctx(dc, context);
@@ -3884,6 +3889,9 @@ static void commit_planes_for_stream(struct dc *dc,
 				odm_pipe->ttu_regs.min_ttu_vblank = MAX_TTU;
 	}
 
+	if (update_type != UPDATE_TYPE_FAST && dc->res_pool->funcs->prepare_mcache_programming)
+		dc->res_pool->funcs->prepare_mcache_programming(dc, context);
+
 	if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
 		if (top_pipe_to_program &&
 			top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
@@ -3903,6 +3911,10 @@ static void commit_planes_for_stream(struct dc *dc,
 						top_pipe_to_program->stream_res.tg);
 		}
 
+	if (dc->hwss.wait_for_dcc_meta_propagation) {
+		dc->hwss.wait_for_dcc_meta_propagation(dc, top_pipe_to_program);
+	}
+
 	if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
 		if (dc->hwss.subvp_pipe_control_lock)
 			dc->hwss.subvp_pipe_control_lock(dc, context, true, should_lock_all_pipes, NULL, subvp_prev_use);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index 5037474bf95c..87e36d51c56d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -595,6 +595,12 @@ void hwss_build_fast_sequence(struct dc *dc,
 	if (!plane || !stream)
 		return;
 
+	if (dc->hwss.wait_for_dcc_meta_propagation) {
+		block_sequence[*num_steps].params.wait_for_dcc_meta_propagation_params.dc = dc;
+		block_sequence[*num_steps].params.wait_for_dcc_meta_propagation_params.top_pipe_to_program = pipe_ctx;
+		block_sequence[*num_steps].func = HUBP_WAIT_FOR_DCC_META_PROP;
+		(*num_steps)++;
+	}
 	if (dc->hwss.subvp_pipe_control_lock_fast) {
 		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.dc = dc;
 		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.lock = true;
@@ -835,6 +841,11 @@ void hwss_execute_sequence(struct dc *dc,
 		case DMUB_SUBVP_SAVE_SURF_ADDR:
 			hwss_subvp_save_surf_addr(params);
 			break;
+		case HUBP_WAIT_FOR_DCC_META_PROP:
+			dc->hwss.wait_for_dcc_meta_propagation(
+					params->wait_for_dcc_meta_propagation_params.dc,
+					params->wait_for_dcc_meta_propagation_params.top_pipe_to_program);
+			break;
 		case DMUB_FAMS2_GLOBAL_CONTROL_LOCK_FAST:
 			dc->hwss.fams2_global_control_lock_fast(params);
 			break;
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 64241de70f15..40f183816e31 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -333,6 +333,9 @@ struct dc_dcc_setting {
 		uint32_t dcc_128_128_uncontrained : 1;  //available in ASICs before DCN 3.0
 		uint32_t dcc_256_128_128 : 1;		//available starting with DCN 3.0
 		uint32_t dcc_256_256_unconstrained : 1;  //available in ASICs before DCN 3.0 (the best compression case)
+		uint32_t dcc_256_256 : 1;  //available in ASICs starting with DCN 4.0x (the best compression case)
+		uint32_t dcc_256_128 : 1;  //available in ASICs starting with DCN 4.0x
+		uint32_t dcc_256_64 : 1;   //available in ASICs starting with DCN 4.0x (the worst compression case)
 	} dcc_controls;
 };
 
@@ -1037,6 +1040,7 @@ struct dc_debug_options {
 	unsigned int static_screen_wait_frames;
 	uint32_t pwm_freq;
 	bool force_chroma_subsampling_1tap;
+	unsigned int dcc_meta_propagation_delay_us;
 	bool disable_422_left_edge_pixel;
 	bool dml21_force_pstate_method;
 	uint32_t dml21_force_pstate_method_values[MAX_PIPES];
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
index 60e2bf4ae6de..c58235121474 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
@@ -821,6 +821,12 @@ void dml2_extract_dram_and_fclk_change_support(struct dml2_context *dml2,
 	*dram_clk_change_support = (unsigned int) dml2->v20.dml_core_ctx.ms.support.DRAMClockChangeSupport[0];
 }
 
+void dml2_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context, struct dml2_context *dml2)
+{
+	if (dml2->architecture == dml2_architecture_21)
+		dml21_prepare_mcache_programming(in_dc, context, dml2);
+}
+
 void dml2_copy(struct dml2_context *dst_dml2,
 	struct dml2_context *src_dml2)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
index 1e891a3297c2..6e3d52eb45c7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
@@ -303,5 +303,5 @@ bool dml2_validate(const struct dc *in_dc,
  */
 void dml2_extract_dram_and_fclk_change_support(struct dml2_context *dml2,
 	unsigned int *fclk_change_support, unsigned int *dram_clk_change_support);
-
+void dml2_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context, struct dml2_context *dml2);
 #endif //_DML2_WRAPPER_H_
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c
index 6a5af3da4b45..fe741100c0f8 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c
@@ -339,6 +339,7 @@ bool hubbub3_get_dcc_compression_cap(struct hubbub *hubbub,
 		return false;
 
 	switch (dcc_control) {
+	case dcc_control__256_256:
 	case dcc_control__256_256_xxx:
 		output->grph.rgb.max_uncompressed_blk_size = 256;
 		output->grph.rgb.max_compressed_blk_size = 256;
@@ -346,6 +347,7 @@ bool hubbub3_get_dcc_compression_cap(struct hubbub *hubbub,
 		output->grph.rgb.dcc_controls.dcc_256_256_unconstrained = 1;
 		output->grph.rgb.dcc_controls.dcc_256_128_128 = 1;
 		break;
+	case dcc_control__256_128:
 	case dcc_control__128_128_xxx:
 		output->grph.rgb.max_uncompressed_blk_size = 128;
 		output->grph.rgb.max_compressed_blk_size = 128;
@@ -353,6 +355,7 @@ bool hubbub3_get_dcc_compression_cap(struct hubbub *hubbub,
 		output->grph.rgb.dcc_controls.dcc_128_128_uncontrained = 1;
 		output->grph.rgb.dcc_controls.dcc_256_128_128 = 1;
 		break;
+	case dcc_control__256_64:
 	case dcc_control__256_64_64:
 		output->grph.rgb.max_uncompressed_blk_size = 256;
 		output->grph.rgb.max_compressed_blk_size = 64;
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c
index b906db6e7355..7fb5523f9722 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c
@@ -866,6 +866,7 @@ static bool hubbub31_get_dcc_compression_cap(struct hubbub *hubbub,
 		return false;
 
 	switch (dcc_control) {
+	case dcc_control__256_256:
 	case dcc_control__256_256_xxx:
 		output->grph.rgb.max_uncompressed_blk_size = 256;
 		output->grph.rgb.max_compressed_blk_size = 256;
@@ -881,12 +882,14 @@ static bool hubbub31_get_dcc_compression_cap(struct hubbub *hubbub,
 		output->grph.rgb.dcc_controls.dcc_256_128_128 = 1;
 		break;
 	case dcc_control__256_64_64:
+	case dcc_control__256_64:
 		output->grph.rgb.max_uncompressed_blk_size = 256;
 		output->grph.rgb.max_compressed_blk_size = 64;
 		output->grph.rgb.independent_64b_blks = true;
 		output->grph.rgb.dcc_controls.dcc_256_64_64 = 1;
 		break;
 	case dcc_control__256_128_128:
+	case dcc_control__256_128:
 		output->grph.rgb.max_uncompressed_blk_size = 256;
 		output->grph.rgb.max_compressed_blk_size = 128;
 		output->grph.rgb.independent_64b_blks = false;
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
index 054607c944a3..5126d603f0b1 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
@@ -824,6 +824,285 @@ void hubbub401_det_request_size(
 		}
 	}
 }
+bool hubbub401_get_dcc_compression_cap(struct hubbub *hubbub,
+		const struct dc_dcc_surface_param *input,
+		struct dc_surface_dcc_cap *output)
+{
+	struct dc *dc = hubbub->ctx->dc;
+	/* DCN4_Programming_Guide_DCHUB.docx, Section 5.11.2.2 */
+	enum dcc_control dcc_control;
+	unsigned int plane0_bpe, plane1_bpe;
+	enum segment_order segment_order_horz, segment_order_vert;
+	enum segment_order p1_segment_order_horz, p1_segment_order_vert;
+	bool req128_horz_wc, req128_vert_wc;
+	unsigned int plane0_width = 0, plane0_height = 0, plane1_width = 0, plane1_height = 0;
+	bool p1_req128_horz_wc, p1_req128_vert_wc, is_dual_plane;
+
+	memset(output, 0, sizeof(*output));
+
+	if (dc->debug.disable_dcc == DCC_DISABLE)
+		return false;
+
+	switch (input->format) {
+	default:
+		is_dual_plane = false;
+
+		plane1_width = 0;
+		plane1_height = 0;
+
+		if (input->surface_size.width > 6144 + 16)
+			plane0_width = 6160;
+		else
+			plane0_width = input->surface_size.width;
+
+		if (input->surface_size.height > 6144 + 16)
+			plane0_height = 6160;
+		else
+			plane0_height = input->surface_size.height;
+
+		break;
+	case SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr:
+	case SURFACE_PIXEL_FORMAT_VIDEO_420_YCrCb:
+	case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCbCr:
+	case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCrCb:
+		is_dual_plane = true;
+
+		if (input->surface_size.width > 7680 + 16)
+			plane0_width = 7696;
+		else
+			plane0_width = input->surface_size.width;
+
+		if (input->surface_size.height > 4320 + 16)
+			plane0_height = 4336;
+		else
+			plane0_height = input->surface_size.height;
+
+		if (input->plane1_size.width > 7680 + 16)
+			plane1_width = 7696 / 2;
+		else
+			plane1_width = input->plane1_size.width;
+
+		if (input->plane1_size.height > 4320 + 16)
+			plane1_height = 4336 / 2;
+		else
+			plane1_height = input->plane1_size.height;
+
+		break;
+
+	case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
+		is_dual_plane = true;
+
+		if (input->surface_size.width > 5120 + 16)
+			plane0_width = 5136;
+		else
+			plane0_width = input->surface_size.width;
+
+		if (input->surface_size.height > 5120 + 16)
+			plane0_height = 5136;
+		else
+			plane0_height = input->surface_size.height;
+
+		if (input->plane1_size.width > 5120 + 16)
+			plane1_width = 5136;
+		else
+			plane1_width = input->plane1_size.width;
+
+		if (input->plane1_size.height > 5120 + 16)
+			plane1_height = 5136;
+		else
+			plane1_height = input->plane1_size.height;
+
+		break;
+	}
+
+	if (!hubbub->funcs->dcc_support_pixel_format_plane0_plane1(input->format,
+			&plane0_bpe, &plane1_bpe))
+		return false;
+
+	/* Find plane0 DCC Controls */
+	if (!is_dual_plane) {
+
+		if (!hubbub->funcs->dcc_support_swizzle_addr3(input->swizzle_mode_addr3,
+				input->plane0_pitch, plane0_bpe,
+				&segment_order_horz, &segment_order_vert))
+			return false;
+
+		hubbub401_det_request_size(TO_DCN20_HUBBUB(hubbub)->detile_buf_size, input->format,
+				plane0_height, plane0_width, plane0_bpe,
+				plane1_height, plane1_width, plane1_bpe,
+				&req128_horz_wc, &req128_vert_wc, &p1_req128_horz_wc, &p1_req128_vert_wc);
+
+		if (!req128_horz_wc && !req128_vert_wc) {
+			dcc_control = dcc_control__256_256;
+		} else if (input->scan == SCAN_DIRECTION_HORIZONTAL) {
+			if (!req128_horz_wc)
+				dcc_control = dcc_control__256_256;
+			else if (segment_order_horz == segment_order__contiguous)
+				dcc_control = dcc_control__256_128;
+			else
+				dcc_control = dcc_control__256_64;
+		} else if (input->scan == SCAN_DIRECTION_VERTICAL) {
+			if (!req128_vert_wc)
+				dcc_control = dcc_control__256_256;
+			else if (segment_order_vert == segment_order__contiguous)
+				dcc_control = dcc_control__256_128;
+			else
+				dcc_control = dcc_control__256_64;
+		} else {
+			if ((req128_horz_wc &&
+				segment_order_horz == segment_order__non_contiguous) ||
+				(req128_vert_wc &&
+				segment_order_vert == segment_order__non_contiguous))
+				/* access_dir not known, must use most constraining */
+				dcc_control = dcc_control__256_64;
+			else
+				/* req128 is true for either horz and vert
+				 * but segment_order is contiguous
+				 */
+				dcc_control = dcc_control__256_128;
+		}
+
+		if (dc->debug.disable_dcc == DCC_HALF_REQ_DISALBE &&
+			dcc_control != dcc_control__256_256)
+			return false;
+
+		switch (dcc_control) {
+		case dcc_control__256_256:
+			output->grph.rgb.dcc_controls.dcc_256_256 = 1;
+			output->grph.rgb.dcc_controls.dcc_256_128 = 1;
+			output->grph.rgb.dcc_controls.dcc_256_64 = 1;
+			break;
+		case dcc_control__256_128:
+			output->grph.rgb.dcc_controls.dcc_256_128 = 1;
+			output->grph.rgb.dcc_controls.dcc_256_64 = 1;
+			break;
+		case dcc_control__256_64:
+			output->grph.rgb.dcc_controls.dcc_256_64 = 1;
+			break;
+		default:
+			/* Shouldn't get here */
+			ASSERT(0);
+			break;
+		}
+	} else {
+		/* For dual plane cases, need to examine both planes together */
+		if (!hubbub->funcs->dcc_support_swizzle_addr3(input->swizzle_mode_addr3,
+				input->plane0_pitch, plane0_bpe,
+				&segment_order_horz, &segment_order_vert))
+			return false;
+
+		if (!hubbub->funcs->dcc_support_swizzle_addr3(input->swizzle_mode_addr3,
+			input->plane1_pitch, plane1_bpe,
+			&p1_segment_order_horz, &p1_segment_order_vert))
+			return false;
+
+		hubbub401_det_request_size(TO_DCN20_HUBBUB(hubbub)->detile_buf_size, input->format,
+				plane0_height, plane0_width, plane0_bpe,
+				plane1_height, plane1_width, plane1_bpe,
+				&req128_horz_wc, &req128_vert_wc, &p1_req128_horz_wc, &p1_req128_vert_wc);
+
+		/* Determine Plane 0 DCC Controls */
+		if (!req128_horz_wc && !req128_vert_wc) {
+			dcc_control = dcc_control__256_256;
+		} else if (input->scan == SCAN_DIRECTION_HORIZONTAL) {
+			if (!req128_horz_wc)
+				dcc_control = dcc_control__256_256;
+			else if (segment_order_horz == segment_order__contiguous)
+				dcc_control = dcc_control__256_128;
+			else
+				dcc_control = dcc_control__256_64;
+		} else if (input->scan == SCAN_DIRECTION_VERTICAL) {
+			if (!req128_vert_wc)
+				dcc_control = dcc_control__256_256;
+			else if (segment_order_vert == segment_order__contiguous)
+				dcc_control = dcc_control__256_128;
+			else
+				dcc_control = dcc_control__256_64;
+		} else {
+			if ((req128_horz_wc &&
+				segment_order_horz == segment_order__non_contiguous) ||
+				(req128_vert_wc &&
+				segment_order_vert == segment_order__non_contiguous))
+				/* access_dir not known, must use most constraining */
+				dcc_control = dcc_control__256_64;
+			else
+				/* req128 is true for either horz and vert
+				 * but segment_order is contiguous
+				 */
+				dcc_control = dcc_control__256_128;
+		}
+
+		switch (dcc_control) {
+		case dcc_control__256_256:
+			output->video.luma.dcc_controls.dcc_256_256 = 1;
+			output->video.luma.dcc_controls.dcc_256_128 = 1;
+			output->video.luma.dcc_controls.dcc_256_64 = 1;
+			break;
+		case dcc_control__256_128:
+			output->video.luma.dcc_controls.dcc_256_128 = 1;
+			output->video.luma.dcc_controls.dcc_256_64 = 1;
+			break;
+		case dcc_control__256_64:
+			output->video.luma.dcc_controls.dcc_256_64 = 1;
+			break;
+		default:
+			ASSERT(0);
+			break;
+		}
+
+		/* Determine Plane 1 DCC Controls */
+		if (!p1_req128_horz_wc && !p1_req128_vert_wc) {
+			dcc_control = dcc_control__256_256;
+		} else if (input->scan == SCAN_DIRECTION_HORIZONTAL) {
+			if (!p1_req128_horz_wc)
+				dcc_control = dcc_control__256_256;
+			else if (p1_segment_order_horz == segment_order__contiguous)
+				dcc_control = dcc_control__256_128;
+			else
+				dcc_control = dcc_control__256_64;
+		} else if (input->scan == SCAN_DIRECTION_VERTICAL) {
+			if (!p1_req128_vert_wc)
+				dcc_control = dcc_control__256_256;
+			else if (p1_segment_order_vert == segment_order__contiguous)
+				dcc_control = dcc_control__256_128;
+			else
+				dcc_control = dcc_control__256_64;
+		} else {
+			if ((p1_req128_horz_wc &&
+				p1_segment_order_horz == segment_order__non_contiguous) ||
+				(p1_req128_vert_wc &&
+				p1_segment_order_vert == segment_order__non_contiguous))
+				/* access_dir not known, must use most constraining */
+				dcc_control = dcc_control__256_64;
+			else
+				/* req128 is true for either horz and vert
+				 * but segment_order is contiguous
+				 */
+				dcc_control = dcc_control__256_128;
+		}
+
+		switch (dcc_control) {
+		case dcc_control__256_256:
+			output->video.chroma.dcc_controls.dcc_256_256 = 1;
+			output->video.chroma.dcc_controls.dcc_256_128 = 1;
+			output->video.chroma.dcc_controls.dcc_256_64 = 1;
+			break;
+		case dcc_control__256_128:
+			output->video.chroma.dcc_controls.dcc_256_128 = 1;
+			output->video.chroma.dcc_controls.dcc_256_64 = 1;
+			break;
+		case dcc_control__256_64:
+			output->video.chroma.dcc_controls.dcc_256_64 = 1;
+			break;
+		default:
+			ASSERT(0);
+			break;
+		}
+	}
+
+	output->capable = true;
+	return true;
+}
 
 static void dcn401_program_det_segments(struct hubbub *hubbub, int hubp_inst, unsigned det_buffer_size_seg)
 {
@@ -891,6 +1170,7 @@ static const struct hubbub_funcs hubbub4_01_funcs = {
 	.init_vm_ctx = hubbub2_init_vm_ctx,
 	.dcc_support_swizzle_addr3 = hubbub401_dcc_support_swizzle,
 	.dcc_support_pixel_format_plane0_plane1 = hubbub401_dcc_support_pixel_format,
+	.get_dcc_compression_cap = hubbub401_get_dcc_compression_cap,
 	.wm_read_state = hubbub401_wm_read_state,
 	.get_dchub_ref_freq = hubbub2_get_dchub_ref_freq,
 	.program_watermarks = hubbub401_program_watermarks,
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.h b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.h
index d8a57f64a70c..f35f19ba3e18 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.h
@@ -180,6 +180,11 @@ void hubbub401_det_request_size(
 		bool *p0_req128_vert_wc,
 		bool *p1_req128_horz_wc,
 		bool *p1_req128_vert_wc);
+bool hubbub401_get_dcc_compression_cap(
+		struct hubbub *hubbub,
+		const struct dc_dcc_surface_param *input,
+		struct dc_surface_dcc_cap *output);
+
 void hubbub401_construct(struct dcn20_hubbub *hubbub2,
 	struct dc_context *ctx,
 	const struct dcn_hubbub_registers *hubbub_regs,
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h b/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h
index ecc0a2f37938..18e194507e36 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h
@@ -175,6 +175,8 @@
 	uint32_t HUBP_3DLUT_ADDRESS_LOW;\
 	uint32_t HUBP_3DLUT_CONTROL;\
 	uint32_t HUBP_3DLUT_DLG_PARAM;\
+	uint32_t DCSURF_VIEWPORT_MCACHE_SPLIT_COORDINATE;\
+	uint32_t DCHUBP_MCACHEID_CONFIG
 
 #define DCN2_HUBP_REG_FIELD_VARIABLE_LIST(type) \
 	DCN_HUBP_REG_FIELD_BASE_LIST(type); \
@@ -269,6 +271,18 @@
 	type HUBP_3DLUT_ADDRESS_HIGH;\
 	type HUBP_3DLUT_ADDRESS_LOW;\
 	type REFCYC_PER_3DLUT_GROUP;\
+	type VIEWPORT_MCACHE_SPLIT_COORDINATE;\
+	type VIEWPORT_MCACHE_SPLIT_COORDINATE_C;\
+	type MCACHEID_REG_READ_1H_P0;\
+	type MCACHEID_REG_READ_2H_P0;\
+	type MCACHEID_REG_READ_1H_P1;\
+	type MCACHEID_REG_READ_2H_P1;\
+	type MCACHEID_MALL_PREF_1H_P0;\
+	type MCACHEID_MALL_PREF_2H_P0;\
+	type MCACHEID_MALL_PREF_1H_P1;\
+	type MCACHEID_MALL_PREF_2H_P1
+
+
 
 struct dcn_hubp2_registers {
 	DCN401_HUBP_REG_COMMON_VARIABLE_LIST;
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
index 3f9ca9b40949..f0c45a74c2e5 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
@@ -626,6 +626,26 @@ void hubp401_set_viewport(
 		  SEC_VIEWPORT_Y_START_C, viewport_c->y);
 }
 
+void hubp401_program_mcache_id_and_split_coordinate(
+	struct hubp *hubp,
+	struct dml2_hubp_pipe_mcache_regs *mcache_regs)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	REG_SET_8(DCHUBP_MCACHEID_CONFIG, 0,
+		MCACHEID_REG_READ_1H_P0, mcache_regs->main.p0.mcache_id_first,
+		MCACHEID_REG_READ_2H_P0, mcache_regs->main.p0.mcache_id_second,
+		MCACHEID_REG_READ_1H_P1, mcache_regs->main.p1.mcache_id_first,
+		MCACHEID_REG_READ_2H_P1, mcache_regs->main.p1.mcache_id_second,
+		MCACHEID_MALL_PREF_1H_P0, mcache_regs->mall.p0.mcache_id_first,
+		MCACHEID_MALL_PREF_2H_P0, mcache_regs->mall.p0.mcache_id_second,
+		MCACHEID_MALL_PREF_1H_P1, mcache_regs->mall.p1.mcache_id_first,
+		MCACHEID_MALL_PREF_2H_P1, mcache_regs->mall.p1.mcache_id_second);
+
+	REG_SET_2(DCSURF_VIEWPORT_MCACHE_SPLIT_COORDINATE, 0,
+		VIEWPORT_MCACHE_SPLIT_COORDINATE, mcache_regs->main.p0.split_location,
+		VIEWPORT_MCACHE_SPLIT_COORDINATE_C, mcache_regs->main.p1.split_location);
+}
 void hubp401_set_flip_int(struct hubp *hubp)
 {
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
@@ -963,6 +983,7 @@ static struct hubp_funcs dcn401_hubp_funcs = {
 	.phantom_hubp_post_enable = hubp32_phantom_hubp_post_enable,
 	.hubp_update_mall_sel = hubp401_update_mall_sel,
 	.hubp_prepare_subvp_buffering = hubp32_prepare_subvp_buffering,
+	.hubp_program_mcache_id_and_split_coordinate = hubp401_program_mcache_id_and_split_coordinate,
 	.hubp_update_3dlut_fl_bias_scale = hubp401_update_3dlut_fl_bias_scale,
 	.hubp_program_3dlut_fl_mode = hubp401_program_3dlut_fl_mode,
 	.hubp_program_3dlut_fl_format = hubp401_program_3dlut_fl_format,
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h
index e0cec898a2c0..e52fdb5b0cd0 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h
@@ -243,6 +243,16 @@
 	HUBP_SF(CURSOR0_0_HUBP_3DLUT_ADDRESS_HIGH, HUBP_3DLUT_ADDRESS_HIGH, mask_sh),\
 	HUBP_SF(CURSOR0_0_HUBP_3DLUT_ADDRESS_LOW, HUBP_3DLUT_ADDRESS_LOW, mask_sh),\
 	HUBP_SF(CURSOR0_0_HUBP_3DLUT_DLG_PARAM, REFCYC_PER_3DLUT_GROUP, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_VIEWPORT_MCACHE_SPLIT_COORDINATE, VIEWPORT_MCACHE_SPLIT_COORDINATE, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_VIEWPORT_MCACHE_SPLIT_COORDINATE, VIEWPORT_MCACHE_SPLIT_COORDINATE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MCACHEID_CONFIG, MCACHEID_REG_READ_1H_P0, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MCACHEID_CONFIG, MCACHEID_REG_READ_2H_P0, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MCACHEID_CONFIG, MCACHEID_REG_READ_1H_P1, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MCACHEID_CONFIG, MCACHEID_REG_READ_2H_P1, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MCACHEID_CONFIG, MCACHEID_MALL_PREF_1H_P0, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MCACHEID_CONFIG, MCACHEID_MALL_PREF_2H_P0, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MCACHEID_CONFIG, MCACHEID_MALL_PREF_1H_P1, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MCACHEID_CONFIG, MCACHEID_MALL_PREF_2H_P1, mask_sh)
 
 void hubp401_update_mall_sel(struct hubp *hubp, uint32_t mall_sel, bool c_cursor);
 
@@ -302,7 +312,9 @@ void hubp401_program_surface_config(
 void hubp401_set_viewport(struct hubp *hubp,
 		const struct rect *viewport,
 		const struct rect *viewport_c);
-
+void hubp401_program_mcache_id_and_split_coordinate(
+	struct hubp *hubp,
+	struct dml2_hubp_pipe_mcache_regs *mcache_regs);
 void hubp401_set_flip_int(struct hubp *hubp);
 
 bool hubp401_in_blank(struct hubp *hubp);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 36797ed7ad8c..2532ad410cb5 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1753,6 +1753,10 @@ static void dcn20_update_dchubp_dpp(
 			&pipe_ctx->plane_res.scl_data.viewport_c);
 		viewport_changed = true;
 	}
+		if (hubp->funcs->hubp_program_mcache_id_and_split_coordinate)
+			hubp->funcs->hubp_program_mcache_id_and_split_coordinate(
+				hubp,
+				&pipe_ctx->mcache_regs);
 
 	/* Any updates are handled in dc interface, just need to apply existing for plane enable */
 	if ((pipe_ctx->update_flags.bits.enable || pipe_ctx->update_flags.bits.opp_changed ||
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index b5a02a8fc9d8..11570ef06086 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -1336,6 +1336,31 @@ bool dcn401_apply_idle_power_optimizations(struct dc *dc, bool enable)
 	return true;
 }
 
+void dcn401_wait_for_dcc_meta_propagation(const struct dc *dc,
+		const struct pipe_ctx *top_pipe)
+{
+	bool is_wait_needed = false;
+	const struct pipe_ctx *pipe_ctx = top_pipe;
+
+	/* check if any surfaces are updating address while using flip immediate and dcc */
+	while (pipe_ctx != NULL) {
+		if (pipe_ctx->plane_state &&
+				pipe_ctx->plane_state->dcc.enable &&
+				pipe_ctx->plane_state->flip_immediate &&
+				pipe_ctx->plane_state->update_flags.bits.addr_update) {
+			is_wait_needed = true;
+			break;
+		}
+
+		/* check next pipe */
+		pipe_ctx = pipe_ctx->bottom_pipe;
+	}
+
+	if (is_wait_needed && dc->debug.dcc_meta_propagation_delay_us > 0) {
+		udelay(dc->debug.dcc_meta_propagation_delay_us);
+	}
+}
+
 void dcn401_prepare_bandwidth(struct dc *dc,
 	struct dc_state *context)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
index bada43d4b2eb..c1d4287d5a0d 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
@@ -61,6 +61,8 @@ bool dcn401_apply_idle_power_optimizations(struct dc *dc, bool enable);
 
 struct ips_ono_region_state dcn401_read_ono_state(struct dc *dc,
 						  uint8_t region);
+void dcn401_wait_for_dcc_meta_propagation(const struct dc *dc,
+		const struct pipe_ctx *top_pipe_to_program);
 
 void dcn401_prepare_bandwidth(struct dc *dc,
 		struct dc_state *context);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
index 8159fd838dc3..6a768702c7bd 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
@@ -94,6 +94,7 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.update_dsc_pg = dcn32_update_dsc_pg,
 	.apply_update_flags_for_phantom = dcn32_apply_update_flags_for_phantom,
 	.blank_phantom = dcn32_blank_phantom,
+	.wait_for_dcc_meta_propagation = dcn401_wait_for_dcc_meta_propagation,
 	.is_pipe_topology_transition_seamless = dcn32_is_pipe_topology_transition_seamless,
 	.fams2_global_control_lock = dcn401_fams2_global_control_lock,
 	.fams2_update_config = dcn401_fams2_update_config,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
index e9b85884edce..d05be65a2256 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
@@ -141,6 +141,11 @@ struct subvp_save_surf_addr {
 	uint8_t subvp_index;
 };
 
+struct wait_for_dcc_meta_propagation_params {
+	const struct dc *dc;
+	const struct pipe_ctx *top_pipe_to_program;
+};
+
 struct fams2_global_control_lock_fast_params {
 	struct dc *dc;
 	bool is_required;
@@ -165,6 +170,7 @@ union block_sequence_params {
 	struct set_output_csc_params set_output_csc_params;
 	struct set_ocsc_default_params set_ocsc_default_params;
 	struct subvp_save_surf_addr subvp_save_surf_addr;
+	struct wait_for_dcc_meta_propagation_params wait_for_dcc_meta_propagation_params;
 	struct fams2_global_control_lock_fast_params fams2_global_control_lock_fast_params;
 };
 
@@ -186,6 +192,7 @@ enum block_sequence_func {
 	MPC_SET_OUTPUT_CSC,
 	MPC_SET_OCSC_DEFAULT,
 	DMUB_SUBVP_SAVE_SURF_ADDR,
+	HUBP_WAIT_FOR_DCC_META_PROP,
 	DMUB_FAMS2_GLOBAL_CONTROL_LOCK_FAST,
 
 };
@@ -443,6 +450,8 @@ struct hw_sequencer_funcs {
 	bool (*is_pipe_topology_transition_seamless)(struct dc *dc,
 			const struct dc_state *cur_ctx,
 			const struct dc_state *new_ctx);
+	void (*wait_for_dcc_meta_propagation)(const struct dc *dc,
+		const struct pipe_ctx *top_pipe_to_program);
 	void (*fams2_global_control_lock)(struct dc *dc,
 			struct dc_state *context,
 			bool lock);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index f58c27ad8b3e..4c8e6436c7e1 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -97,6 +97,9 @@ struct resource_funcs {
 	unsigned int (*calculate_mall_ways_from_bytes)(
 				const struct dc *dc,
 				unsigned int total_size_in_mall_bytes);
+	void (*prepare_mcache_programming)(
+					struct dc *dc,
+					struct dc_state *context);
 	/**
 	 * @populate_dml_pipes - Populate pipe data struct
 	 *
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
index a73cb8f731b3..dd2b2864876c 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
@@ -40,6 +40,10 @@ enum dcc_control {
 	dcc_control__128_128_xxx,
 	dcc_control__256_64_64,
 	dcc_control__256_128_128,
+	dcc_control__256_256,
+	dcc_control__256_128,
+	dcc_control__256_64,
+
 };
 
 enum segment_order {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
index bcd7b22a1627..16580d624278 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
@@ -257,6 +257,7 @@ struct hubp_funcs {
 			unsigned int min_dst_y_next_start_optimized);
 
 	void (*hubp_wait_pipe_read_start)(struct hubp *hubp);
+	void (*hubp_program_mcache_id_and_split_coordinate)(struct hubp *hubp, struct dml2_hubp_pipe_mcache_regs *mcache_regs);
 	void (*hubp_update_3dlut_fl_bias_scale)(struct hubp *hubp, uint16_t bias, uint16_t scale);
 	void (*hubp_program_3dlut_fl_mode)(struct hubp *hubp,
 			enum hubp_3dlut_fl_mode mode);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 74fb21b88f12..4e27d2cee9fb 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1617,6 +1617,14 @@ bool dcn401_validate_bandwidth(struct dc *dc,
 	return out;
 }
 
+void dcn401_prepare_mcache_programming(struct dc *dc,
+		struct dc_state *context)
+{
+	if (dc->debug.using_dml21)
+		dml2_prepare_mcache_programming(dc, context,
+				context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2);
+}
+
 static void dcn401_build_pipe_pix_clk_params(struct pipe_ctx *pipe_ctx)
 {
 	const struct dc_stream_state *stream = pipe_ctx->stream;
@@ -1699,6 +1707,7 @@ static struct resource_funcs dcn401_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn401_patch_unknown_plane_state,
 	.update_soc_for_wm_a = dcn30_update_soc_for_wm_a,
 	.add_phantom_pipes = dcn32_add_phantom_pipes,
+	.prepare_mcache_programming = dcn401_prepare_mcache_programming,
 	.build_pipe_pix_clk_params = dcn401_build_pipe_pix_clk_params,
 	.calculate_mall_ways_from_bytes = dcn32_calculate_mall_ways_from_bytes,
 };
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
index c04c8b8f2114..26efeada4f41 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
@@ -26,6 +26,8 @@ bool dcn401_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate);
 
+void dcn401_prepare_mcache_programming(struct dc *dc, struct dc_state *context);
+
 /* Following are definitions for run time init of reg offsets */
 
 /* HUBP */
-- 
2.34.1


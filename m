Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660CD810A14
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Dec 2023 07:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B5410E6FE;
	Wed, 13 Dec 2023 06:15:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B90C10E6FE
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Dec 2023 06:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M08KMUkhcY/QHOkHI1xld17SCPqcJpb/SK3Xfx+R14Ed60cUyBGFNBrnDT6+3AjeA/E9L8a4v5HAUt8H/8DCDCxL6KmsEZcspedDWev01x8DalrxIhE6U4N21/eqYWeiL2iiON1Z0Dd452enC01jE1Yko23bopziOaPd3J4ZWPzVQZ+C9joC35oVckIBD4II8O9DM+fyWj6C5hqPAQh9A7w17v2le1JJS0liOobVBwEcWCqLytseZsb2tI/IAu5sxyswpdIAL9glMtssgOs12vPt71yi0l5Aqy4FpXfzkJ9DQ50RcwEXuQvRrROCucmI3SXkVAck8zxwBtZ5GdGFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXWtGso9FnkPRdsYFidzT3YSUaDeN31egESeY58S778=;
 b=fsAu6GYlS9EtleJ7FAVxgJRzcQ4uVdO4mxrGm8phZXV/cGC6Ji/jNzq9NSbaJFHsGISdwi8g32un1DBOmBm5u/JcmP/Z7eWrfn0P4PuDHLxbs8a8lHVmCzb7vGcsNKs9haP5G5tCuOb6zR4+8kcWtXAGW+ivYOkTAWi4p/pWRztIdmG3m4/HuoreboGCHy7p7rAj07dg2tzElPLaYGPdHZkiJxgTySgoIOwASZpWZDQTDFrAAv+wuYDQmu0M21g+JgDhoYVKYnSYrkC8ITO4Rv9hABTjqV8iD46kh3zkTkVwNotxOR2TGAuN6d81db8pBkrN3BsW43s2nvd/lPdVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXWtGso9FnkPRdsYFidzT3YSUaDeN31egESeY58S778=;
 b=d1RfkmvyMU4oC+QpqOsxfEUKN4BACiqM87DkdQNxjjCeR3p4DBbiZ4oI2oi14LC9acnjfOEo6ZRubKatAM6V0iU6szC1Jwv04WBH9POw7WTSobu4smIGW6fzN4cpKtqfSWhkhGeHbVWTd08FJsZHhTqEqoL4Lr0VSdpT/aspSiM=
Received: from CH0PR03CA0351.namprd03.prod.outlook.com (2603:10b6:610:11a::13)
 by DS0PR12MB9322.namprd12.prod.outlook.com (2603:10b6:8:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 06:14:55 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:610:11a:cafe::84) by CH0PR03CA0351.outlook.office365.com
 (2603:10b6:610:11a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 06:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 06:14:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 13 Dec
 2023 00:14:51 -0600
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 13 Dec 2023 00:14:46 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/25] drm/amd/display: Refactor phantom resource allocation
Date: Wed, 13 Dec 2023 14:12:21 +0800
Message-ID: <20231213061227.1750663-20-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231213061227.1750663-1-Wayne.Lin@amd.com>
References: <20231213061227.1750663-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DS0PR12MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: 0deca9ed-e879-478f-401c-08dbfba2d337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ykqMJWY4Mbh/jqCr78ZlEgphflDf357gaH8ZXo5nBHbaBBDVmIIdmuZrPJyXG6u+rLjtQI5vRqV5EHaaB/sjpR93N9A1cvunnzYLfgp32IlOJ9xo9VklMrmJlQuEcl6zKkrYBqEb6GSkGbuHsRvO6JrHGXDpD/DUJd1fWghOpl1Y2AKFie3xfhiYB0bvFztz3qngZG1RQVM/hgOC7I6f/759dNil4kpMT8598HNt91bnsr6PAGH3Zw12QhuNVKVbfd/hq2TZEFk8D+AYO/3HLzHKnMrvlg9Y/ydHPWV3iCQ4o/H7hFW0yKq+o3TxDSGjowupDQL3Y/Uva3mVO9rHod8xRuqoe0ai1nna3/KRDeAtb3dXKo8biPd/FHPY8B0sF/FMzMMO+5p4l0HdVGX3WB/WuWTsgyzM1W9EZ/yxMwTH9NpVfUQ6KALF6PRFigEvx9kkZxDlGD+XYoIEp/OY5nGUNrrllV7ifKqoFT3Bp4ogHWR540MIYgaSBqh3FNuVCXgaMymeJJqHSqhqawB0cRFCS59dsTDTYM9MAinuVlsabaFdUmNApteu1EdTmNLB3JZwBdZYbznYyc9kJbVtkgWasdMCbF0BppMbPgm3fnx00mTqyg/L3NEXPrUo3qLFx+WpNUk9sf4CYgs0dEIRAHb2O42diTzzBly4QxhNUFnky4AIgYOFefn0/hBspPQ2YtwdAQlVPoA08zhcaSBQqXBFB0RF1EKdlSjs4hEK/WjiWoQhSI4POtvP52NqUX8tt7NkN0iIUBGIAB+kTk16tQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(46966006)(36840700001)(40470700004)(40480700001)(36756003)(40460700003)(26005)(2616005)(1076003)(30864003)(6666004)(2906002)(7696005)(478600001)(8936002)(70206006)(70586007)(4326008)(8676002)(6916009)(316002)(54906003)(36860700001)(426003)(336012)(47076005)(5660300002)(356005)(81166007)(83380400001)(41300700001)(86362001)(82740400003)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 06:14:54.8538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0deca9ed-e879-478f-401c-08dbfba2d337
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9322
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
Cc: stylon.wang@amd.com, Dillon Varone <dillon.varone@amd.com>,
 chiahsuan.chung@amd.com, Sunpeng.Li@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 hersenxs.wu@amd.com, wayne.lin@amd.com, Jun Lei <jun.lei@amd.com>,
 Harry.Wentland@amd.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 agustin.gutierrez@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dillon Varone <dillon.varone@amd.com>

[WHY?]
Phantom streams and planes were previously not referenced explcitly on creation.

[HOW?]
To reduce memory management complexity, add an additional phantom streams and planes
reference into dc_state, and move mall_stream_config to stream_status inside
the state to make it safe to modify in shallow copies. Also consildates any logic
that is affected by this change to dc_state.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Jun Lei <jun.lei@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  91 +---
 .../drm/amd/display/dc/core/dc_hw_sequencer.c |  11 +-
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 128 +-----
 .../gpu/drm/amd/display/dc/core/dc_state.c    | 428 ++++++++++++++++--
 .../gpu/drm/amd/display/dc/core/dc_stream.c   |  13 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |  18 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/dc_state.h     |   6 +-
 .../gpu/drm/amd/display/dc/dc_state_priv.h    |  15 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  30 +-
 .../gpu/drm/amd/display/dc/dc_stream_priv.h   |   2 +
 .../display/dc/dcn32/dcn32_resource_helpers.c |  65 ---
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  |   6 +-
 .../amd/display/dc/dml2/dml2_mall_phantom.c   |  30 +-
 .../drm/amd/display/dc/dml2/dml2_wrapper.h    |   5 +-
 .../amd/display/dc/hwss/dce110/dce110_hwseq.c |   7 +-
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   |  25 +-
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.h   |   7 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  27 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.h   |   2 +-
 .../amd/display/dc/hwss/dcn201/dcn201_hwseq.c |   8 +-
 .../amd/display/dc/hwss/dcn201/dcn201_hwseq.h |   2 +-
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   |  42 +-
 .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   |   8 +-
 .../amd/display/dc/hwss/dcn35/dcn35_hwseq.h   |   2 +-
 .../drm/amd/display/dc/hwss/hw_sequencer.h    |   8 +-
 .../display/dc/hwss/hw_sequencer_private.h    |   1 +
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  20 +-
 .../gpu/drm/amd/display/dc/inc/hw/hw_shared.h |   1 +
 .../dc/resource/dcn32/dcn32_resource.c        |  85 ----
 .../dc/resource/dcn32/dcn32_resource.h        |  14 -
 .../dc/resource/dcn321/dcn321_resource.c      |   4 -
 33 files changed, 578 insertions(+), 549 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 186f3e3eb6c8..d60a751ff1d1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2606,12 +2606,10 @@ static enum dc_status amdgpu_dm_commit_zero_streams(struct dc *dc)
 
 	memset(del_streams, 0, sizeof(del_streams));
 
-	context = dc_state_create(dc);
+	context = dc_state_create_current_copy(dc);
 	if (context == NULL)
 		goto context_alloc_fail;
 
-	dc_resource_state_copy_construct_current(dc, context);
-
 	/* First remove from context all streams */
 	for (i = 0; i < context->stream_count; i++) {
 		struct dc_stream_state *stream = context->streams[i];
@@ -2921,7 +2919,6 @@ static int dm_resume(void *handle)
 	dc_state_release(dm_state->context);
 	dm_state->context = dc_state_create(dm->dc);
 	/* TODO: Remove dc_state->dccg, use dc->dccg directly. */
-	dc_resource_state_construct(dm->dc, dm_state->context);
 
 	/* Before powering on DC we need to re-initialize DMUB. */
 	dm_dmub_hw_resume(adev);
@@ -4049,14 +4046,12 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 	if (!state)
 		return -ENOMEM;
 
-	state->context = dc_state_create(adev->dm.dc);
+	state->context = dc_state_create_current_copy(adev->dm.dc);
 	if (!state->context) {
 		kfree(state);
 		return -ENOMEM;
 	}
 
-	dc_resource_state_copy_construct_current(adev->dm.dc, state->context);
-
 	drm_atomic_private_obj_init(adev_to_drm(adev),
 				    &adev->dm.atomic_obj,
 				    &state->base,
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index f5250022b98e..630a55b2c1d4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1046,8 +1046,6 @@ static bool dc_construct(struct dc *dc,
 	if (!create_link_encoders(dc))
 		goto fail;
 
-	dc_resource_state_construct(dc, dc->current_state);
-
 	return true;
 
 fail:
@@ -1120,7 +1118,7 @@ static void dc_update_viusal_confirm_color(struct dc *dc, struct dc_state *conte
 static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 {
 	int i, j;
-	struct dc_state *dangling_context = dc_state_create(dc);
+	struct dc_state *dangling_context = dc_state_create_current_copy(dc);
 	struct dc_state *current_ctx;
 	struct pipe_ctx *pipe;
 	struct timing_generator *tg;
@@ -1128,8 +1126,6 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 	if (dangling_context == NULL)
 		return;
 
-	dc_resource_state_copy_construct(dc->current_state, dangling_context);
-
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct dc_stream_state *old_stream =
 				dc->current_state->res_ctx.pipe_ctx[i].stream;
@@ -1187,7 +1183,11 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 					tg->funcs->enable_crtc(tg);
 				}
 			}
-			dc_state_rem_all_planes_for_stream(dc, old_stream, dangling_context);
+
+			if (is_phantom)
+				dc_state_rem_all_phantom_planes_for_stream(dc, old_stream, dangling_context, true);
+			else
+				dc_state_rem_all_planes_for_stream(dc, old_stream, dangling_context);
 			disable_all_writeback_pipes_for_stream(dc, old_stream, dangling_context);
 
 			if (pipe->stream && pipe->plane_state)
@@ -1562,7 +1562,7 @@ static void program_timing_sync(
 		if (group_size > 1) {
 			if (sync_type == TIMING_SYNCHRONIZABLE) {
 				dc->hwss.enable_timing_synchronization(
-					dc, group_index, group_size, pipe_set);
+					dc, ctx, group_index, group_size, pipe_set);
 			} else
 				if (sync_type == VBLANK_SYNCHRONIZABLE) {
 				dc->hwss.enable_vblanks_synchronization(
@@ -2075,12 +2075,10 @@ enum dc_status dc_commit_streams(struct dc *dc,
 	if (handle_exit_odm2to1)
 		res = commit_minimal_transition_state(dc, dc->current_state);
 
-	context = dc_state_create(dc);
+	context = dc_state_create_current_copy(dc);
 	if (!context)
 		goto context_alloc_fail;
 
-	dc_resource_state_copy_construct_current(dc, context);
-
 	res = dc_validate_with_context(dc, set, stream_count, context, false);
 	if (res != DC_OK) {
 		BREAK_TO_DEBUGGER();
@@ -2218,7 +2216,7 @@ void dc_post_update_surfaces_to_stream(struct dc *dc)
 			if (context->res_ctx.pipe_ctx[i].stream == NULL ||
 					context->res_ctx.pipe_ctx[i].plane_state == NULL) {
 				context->res_ctx.pipe_ctx[i].pipe_idx = i;
-				dc->hwss.disable_plane(dc, &context->res_ctx.pipe_ctx[i]);
+				dc->hwss.disable_plane(dc, context, &context->res_ctx.pipe_ctx[i]);
 			}
 
 		process_deferred_updates(dc);
@@ -2899,11 +2897,9 @@ static void copy_stream_update_to_stream(struct dc *dc,
 				       update->dsc_config->num_slices_v != 0);
 
 		/* Use temporarry context for validating new DSC config */
-		struct dc_state *dsc_validate_context = dc_state_create(dc);
+		struct dc_state *dsc_validate_context = dc_state_create_copy(dc->current_state);
 
 		if (dsc_validate_context) {
-			dc_resource_state_copy_construct(dc->current_state, dsc_validate_context);
-
 			stream->timing.dsc_cfg = *update->dsc_config;
 			stream->timing.flags.DSC = enable_dsc;
 			if (!dc->res_pool->funcs->validate_bandwidth(dc, dsc_validate_context, true)) {
@@ -3011,20 +3007,17 @@ static bool update_planes_and_stream_state(struct dc *dc,
 			new_planes[i] = srf_updates[i].surface;
 
 		/* initialize scratch memory for building context */
-		context = dc_state_create(dc);
+		context = dc_state_create_copy(dc->current_state);
 		if (context == NULL) {
 			DC_ERROR("Failed to allocate new validate context!\n");
 			return false;
 		}
 
-		dc_resource_state_copy_construct(
-				dc->current_state, context);
-
 		/* For each full update, remove all existing phantom pipes first.
 		 * Ensures that we have enough pipes for newly added MPO planes
 		 */
-		if (dc->res_pool->funcs->remove_phantom_pipes)
-			dc->res_pool->funcs->remove_phantom_pipes(dc, context, false);
+		dc_state_remove_phantom_streams_and_planes(dc, context);
+		dc_state_release_phantom_streams_and_planes(dc, context);
 
 		/*remove old surfaces from context */
 		if (!dc_state_rem_all_planes_for_stream(dc, stream, context)) {
@@ -3059,19 +3052,6 @@ static bool update_planes_and_stream_state(struct dc *dc,
 
 	if (update_type == UPDATE_TYPE_FULL) {
 		if (!dc->res_pool->funcs->validate_bandwidth(dc, context, false)) {
-			/* For phantom pipes we remove and create a new set of phantom pipes
-			 * for each full update (because we don't know if we'll need phantom
-			 * pipes until after the first round of validation). However, if validation
-			 * fails we need to keep the existing phantom pipes (because we don't update
-			 * the dc->current_state).
-			 *
-			 * The phantom stream/plane refcount is decremented for validation because
-			 * we assume it'll be removed (the free comes when the dc_state is freed),
-			 * but if validation fails we have to increment back the refcount so it's
-			 * consistent.
-			 */
-			if (dc->res_pool->funcs->retain_phantom_pipes)
-				dc->res_pool->funcs->retain_phantom_pipes(dc, dc->current_state);
 			BREAK_TO_DEBUGGER();
 			goto fail;
 		}
@@ -3390,6 +3370,7 @@ static void commit_planes_for_stream_fast(struct dc *dc,
 {
 	int i, j;
 	struct pipe_ctx *top_pipe_to_program = NULL;
+	struct dc_stream_status *stream_status = NULL;
 	dc_z10_restore(dc);
 
 	top_pipe_to_program = resource_get_otg_master_for_stream(
@@ -3425,6 +3406,8 @@ static void commit_planes_for_stream_fast(struct dc *dc,
 		}
 	}
 
+	stream_status = dc_state_get_stream_status(context, stream);
+
 	build_dmub_cmd_list(dc,
 			srf_updates,
 			surface_count,
@@ -3437,7 +3420,8 @@ static void commit_planes_for_stream_fast(struct dc *dc,
 			context->dmub_cmd_count,
 			context->block_sequence,
 			&(context->block_sequence_steps),
-			top_pipe_to_program);
+			top_pipe_to_program,
+			stream_status);
 	hwss_execute_sequence(dc,
 			context->block_sequence,
 			context->block_sequence_steps);
@@ -3974,7 +3958,7 @@ static void release_minimal_transition_state(struct dc *dc,
 static struct dc_state *create_minimal_transition_state(struct dc *dc,
 		struct dc_state *base_context, struct pipe_split_policy_backup *policy)
 {
-	struct dc_state *minimal_transition_context = dc_state_create(dc);
+	struct dc_state *minimal_transition_context = NULL;
 	unsigned int i, j;
 
 	if (!dc->config.is_vmin_only_asic) {
@@ -3986,7 +3970,7 @@ static struct dc_state *create_minimal_transition_state(struct dc *dc,
 	policy->subvp_policy = dc->debug.force_disable_subvp;
 	dc->debug.force_disable_subvp = true;
 
-	dc_resource_state_copy_construct(base_context, minimal_transition_context);
+	minimal_transition_context = dc_state_create_copy(base_context);
 
 	/* commit minimal state */
 	if (dc->res_pool->funcs->validate_bandwidth(dc, minimal_transition_context, false)) {
@@ -4018,7 +4002,6 @@ static bool commit_minimal_transition_state_for_windowed_mpo_odm(struct dc *dc,
 	bool success = false;
 	struct dc_state *minimal_transition_context;
 	struct pipe_split_policy_backup policy;
-	struct mall_temp_config mall_temp_config;
 
 	/* commit based on new context */
 	/* Since all phantom pipes are removed in full validation,
@@ -4027,8 +4010,6 @@ static bool commit_minimal_transition_state_for_windowed_mpo_odm(struct dc *dc,
 	 * pipe as subvp/phantom will be cleared (dc copy constructor
 	 * creates a shallow copy).
 	 */
-	if (dc->res_pool->funcs->save_mall_state)
-		dc->res_pool->funcs->save_mall_state(dc, context, &mall_temp_config);
 	minimal_transition_context = create_minimal_transition_state(dc,
 			context, &policy);
 	if (minimal_transition_context) {
@@ -4041,16 +4022,6 @@ static bool commit_minimal_transition_state_for_windowed_mpo_odm(struct dc *dc,
 			success = dc_commit_state_no_check(dc, minimal_transition_context) == DC_OK;
 		}
 		release_minimal_transition_state(dc, minimal_transition_context, &policy);
-		if (dc->res_pool->funcs->restore_mall_state)
-			dc->res_pool->funcs->restore_mall_state(dc, context, &mall_temp_config);
-		/* If we do a minimal transition with plane removal and the context
-		 * has subvp we also have to retain back the phantom stream / planes
-		 * since the refcount is decremented as part of the min transition
-		 * (we commit a state with no subvp, so the phantom streams / planes
-		 * had to be removed).
-		 */
-		if (dc->res_pool->funcs->retain_phantom_pipes)
-			dc->res_pool->funcs->retain_phantom_pipes(dc, context);
 	}
 
 	if (!success) {
@@ -4383,7 +4354,6 @@ bool dc_update_planes_and_stream(struct dc *dc,
 	struct dc_state *context;
 	enum surface_update_type update_type;
 	int i;
-	struct mall_temp_config mall_temp_config;
 	struct dc_fast_update fast_update[MAX_SURFACES] = {0};
 
 	/* In cases where MPO and split or ODM are used transitions can
@@ -4427,23 +4397,10 @@ bool dc_update_planes_and_stream(struct dc *dc,
 		 * pipe as subvp/phantom will be cleared (dc copy constructor
 		 * creates a shallow copy).
 		 */
-		if (dc->res_pool->funcs->save_mall_state)
-			dc->res_pool->funcs->save_mall_state(dc, context, &mall_temp_config);
 		if (!commit_minimal_transition_state(dc, context)) {
 			dc_state_release(context);
 			return false;
 		}
-		if (dc->res_pool->funcs->restore_mall_state)
-			dc->res_pool->funcs->restore_mall_state(dc, context, &mall_temp_config);
-
-		/* If we do a minimal transition with plane removal and the context
-		 * has subvp we also have to retain back the phantom stream / planes
-		 * since the refcount is decremented as part of the min transition
-		 * (we commit a state with no subvp, so the phantom streams / planes
-		 * had to be removed).
-		 */
-		if (dc->res_pool->funcs->retain_phantom_pipes)
-			dc->res_pool->funcs->retain_phantom_pipes(dc, context);
 		update_type = UPDATE_TYPE_FULL;
 	}
 
@@ -4559,14 +4516,12 @@ void dc_commit_updates_for_stream(struct dc *dc,
 	if (update_type >= UPDATE_TYPE_FULL) {
 
 		/* initialize scratch memory for building context */
-		context = dc_state_create(dc);
+		context = dc_state_create_copy(state);
 		if (context == NULL) {
 			DC_ERROR("Failed to allocate new validate context!\n");
 			return;
 		}
 
-		dc_resource_state_copy_construct(state, context);
-
 		for (i = 0; i < dc->res_pool->pipe_count; i++) {
 			struct pipe_ctx *new_pipe = &context->res_ctx.pipe_ctx[i];
 			struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
@@ -4711,7 +4666,7 @@ void dc_set_power_state(
 
 	switch (power_state) {
 	case DC_ACPI_CM_POWER_STATE_D0:
-		dc_resource_state_construct(dc, dc->current_state);
+		dc_state_construct(dc, dc->current_state);
 
 		dc_z10_restore(dc);
 
@@ -4726,7 +4681,7 @@ void dc_set_power_state(
 	default:
 		ASSERT(dc->current_state->stream_count == 0);
 
-		dc_resource_state_destruct(dc->current_state);
+		dc_state_destruct(dc->current_state);
 
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index 170bad6f33c7..48fdfacc413a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -473,7 +473,8 @@ void hwss_build_fast_sequence(struct dc *dc,
 		unsigned int dmub_cmd_count,
 		struct block_sequence block_sequence[],
 		int *num_steps,
-		struct pipe_ctx *pipe_ctx)
+		struct pipe_ctx *pipe_ctx,
+		struct dc_stream_status *stream_status)
 {
 	struct dc_plane_state *plane = pipe_ctx->plane_state;
 	struct dc_stream_state *stream = pipe_ctx->stream;
@@ -490,7 +491,8 @@ void hwss_build_fast_sequence(struct dc *dc,
 	if (dc->hwss.subvp_pipe_control_lock_fast) {
 		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.dc = dc;
 		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.lock = true;
-		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.pipe_ctx = pipe_ctx;
+		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.subvp_immediate_flip =
+				plane->flip_immediate && stream_status->mall_stream_config.type == SUBVP_MAIN;
 		block_sequence[*num_steps].func = DMUB_SUBVP_PIPE_CONTROL_LOCK_FAST;
 		(*num_steps)++;
 	}
@@ -529,7 +531,7 @@ void hwss_build_fast_sequence(struct dc *dc,
 			}
 			if (dc->hwss.update_plane_addr && current_mpc_pipe->plane_state->update_flags.bits.addr_update) {
 				if (resource_is_pipe_type(current_mpc_pipe, OTG_MASTER) &&
-						dc_state_get_pipe_subvp_type(NULL, pipe_ctx) == SUBVP_MAIN) {
+						stream_status->mall_stream_config.type == SUBVP_MAIN) {
 					block_sequence[*num_steps].params.subvp_save_surf_addr.dc_dmub_srv = dc->ctx->dmub_srv;
 					block_sequence[*num_steps].params.subvp_save_surf_addr.addr = &current_mpc_pipe->plane_state->address;
 					block_sequence[*num_steps].params.subvp_save_surf_addr.subvp_index = current_mpc_pipe->subvp_index;
@@ -612,7 +614,8 @@ void hwss_build_fast_sequence(struct dc *dc,
 	if (dc->hwss.subvp_pipe_control_lock_fast) {
 		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.dc = dc;
 		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.lock = false;
-		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.pipe_ctx = pipe_ctx;
+		block_sequence[*num_steps].params.subvp_pipe_control_lock_fast_params.subvp_immediate_flip =
+				plane->flip_immediate && stream_status->mall_stream_config.type == SUBVP_MAIN;
 		block_sequence[*num_steps].func = DMUB_SUBVP_PIPE_CONTROL_LOCK_FAST;
 		(*num_steps)++;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 4a6a7d7557e0..716b59bd03b6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -42,6 +42,7 @@
 #include "link_enc_cfg.h"
 #include "link.h"
 #include "clk_mgr.h"
+#include "dc_state_priv.h"
 #include "virtual/virtual_link_hwss.h"
 #include "link/hwss/link_hwss_dio.h"
 #include "link/hwss/link_hwss_dpia.h"
@@ -3523,34 +3524,6 @@ enum dc_status resource_map_pool_resources(
 	return DC_ERROR_UNEXPECTED;
 }
 
-/**
- * dc_resource_state_copy_construct_current() - Creates a new dc_state from existing state
- *
- * @dc: copy out of dc->current_state
- * @dst_ctx: copy into this
- *
- * This function makes a shallow copy of the current DC state and increments
- * refcounts on existing streams and planes.
- */
-void dc_resource_state_copy_construct_current(
-		const struct dc *dc,
-		struct dc_state *dst_ctx)
-{
-	dc_resource_state_copy_construct(dc->current_state, dst_ctx);
-}
-
-
-void dc_resource_state_construct(
-		const struct dc *dc,
-		struct dc_state *dst_ctx)
-{
-	dst_ctx->clk_mgr = dc->clk_mgr;
-
-	/* Initialise DIG link encoder resource tracking variables. */
-	link_enc_cfg_init(dc, dst_ctx);
-}
-
-
 bool dc_resource_is_dsc_encoding_supported(const struct dc *dc)
 {
 	if (dc->res_pool == NULL)
@@ -3724,6 +3697,7 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 						       unchanged_streams[i],
 						       set,
 						       set_count)) {
+
 			if (!dc_state_rem_all_planes_for_stream(dc,
 							  unchanged_streams[i],
 							  context)) {
@@ -3746,12 +3720,24 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 			}
 		}
 
-		if (!dc_state_rem_all_planes_for_stream(dc, del_streams[i], context)) {
-			res = DC_FAIL_DETACH_SURFACES;
-			goto fail;
+		if (dc_state_get_stream_subvp_type(context, del_streams[i]) == SUBVP_PHANTOM) {
+			/* remove phantoms specifically */
+			if (!dc_state_rem_all_phantom_planes_for_stream(dc, del_streams[i], context, true)) {
+				res = DC_FAIL_DETACH_SURFACES;
+				goto fail;
+			}
+
+			res = dc_state_remove_phantom_stream(dc, context, del_streams[i]);
+			dc_state_release_phantom_stream(dc, context, del_streams[i]);
+		} else {
+			if (!dc_state_rem_all_planes_for_stream(dc, del_streams[i], context)) {
+				res = DC_FAIL_DETACH_SURFACES;
+				goto fail;
+			}
+
+			res = dc_state_remove_stream(dc, context, del_streams[i]);
 		}
 
-		res = dc_state_remove_stream(dc, context, del_streams[i]);
 		if (res != DC_OK)
 			goto fail;
 	}
@@ -4280,84 +4266,6 @@ static void set_vtem_info_packet(
 	*info_packet = stream->vtem_infopacket;
 }
 
-void dc_resource_state_destruct(struct dc_state *context)
-{
-	int i, j;
-
-	for (i = 0; i < context->stream_count; i++) {
-		for (j = 0; j < context->stream_status[i].plane_count; j++)
-			dc_plane_state_release(
-				context->stream_status[i].plane_states[j]);
-
-		context->stream_status[i].plane_count = 0;
-		dc_stream_release(context->streams[i]);
-		context->streams[i] = NULL;
-	}
-	context->stream_count = 0;
-	context->stream_mask = 0;
-	memset(&context->res_ctx, 0, sizeof(context->res_ctx));
-	memset(&context->pp_display_cfg, 0, sizeof(context->pp_display_cfg));
-	memset(&context->dcn_bw_vars, 0, sizeof(context->dcn_bw_vars));
-	context->clk_mgr = NULL;
-	memset(&context->bw_ctx.bw, 0, sizeof(context->bw_ctx.bw));
-	memset(context->block_sequence, 0, sizeof(context->block_sequence));
-	context->block_sequence_steps = 0;
-	memset(context->dc_dmub_cmd, 0, sizeof(context->dc_dmub_cmd));
-	context->dmub_cmd_count = 0;
-	memset(&context->perf_params, 0, sizeof(context->perf_params));
-	memset(&context->scratch, 0, sizeof(context->scratch));
-}
-
-void dc_resource_state_copy_construct(
-		const struct dc_state *src_ctx,
-		struct dc_state *dst_ctx)
-{
-	int i, j;
-	struct kref refcount = dst_ctx->refcount;
-#ifdef CONFIG_DRM_AMD_DC_FP
-	struct dml2_context *dml2 = NULL;
-
-	// Need to preserve allocated dml2 context
-	if (src_ctx->clk_mgr && src_ctx->clk_mgr->ctx->dc->debug.using_dml2)
-		dml2 = dst_ctx->bw_ctx.dml2;
-#endif
-
-	*dst_ctx = *src_ctx;
-
-#ifdef CONFIG_DRM_AMD_DC_FP
-	// Preserve allocated dml2 context
-	if (src_ctx->clk_mgr && src_ctx->clk_mgr->ctx->dc->debug.using_dml2)
-		dst_ctx->bw_ctx.dml2 = dml2;
-#endif
-
-	for (i = 0; i < MAX_PIPES; i++) {
-		struct pipe_ctx *cur_pipe = &dst_ctx->res_ctx.pipe_ctx[i];
-
-		if (cur_pipe->top_pipe)
-			cur_pipe->top_pipe =  &dst_ctx->res_ctx.pipe_ctx[cur_pipe->top_pipe->pipe_idx];
-
-		if (cur_pipe->bottom_pipe)
-			cur_pipe->bottom_pipe = &dst_ctx->res_ctx.pipe_ctx[cur_pipe->bottom_pipe->pipe_idx];
-
-		if (cur_pipe->next_odm_pipe)
-			cur_pipe->next_odm_pipe =  &dst_ctx->res_ctx.pipe_ctx[cur_pipe->next_odm_pipe->pipe_idx];
-
-		if (cur_pipe->prev_odm_pipe)
-			cur_pipe->prev_odm_pipe = &dst_ctx->res_ctx.pipe_ctx[cur_pipe->prev_odm_pipe->pipe_idx];
-	}
-
-	for (i = 0; i < dst_ctx->stream_count; i++) {
-		dc_stream_retain(dst_ctx->streams[i]);
-		for (j = 0; j < dst_ctx->stream_status[i].plane_count; j++)
-			dc_plane_state_retain(
-				dst_ctx->stream_status[i].plane_states[j]);
-	}
-
-	/* context refcount should not be overridden */
-	dst_ctx->refcount = refcount;
-
-}
-
 struct clock_source *dc_resource_find_first_free_pll(
 		struct resource_context *res_ctx,
 		const struct resource_pool *pool)
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index ec5b0d114c7c..66a70a60c479 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -31,6 +31,7 @@
 
 #include "dm_services.h"
 #include "resource.h"
+#include "link_enc_cfg.h"
 
 #include "dml2/dml2_wrapper.h"
 #include "dml2/dml2_internal_types.h"
@@ -39,7 +40,144 @@
 	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
-/* Public dc_state functions */
+/* Private dc_state helper functions */
+static bool dc_state_track_phantom_stream(struct dc_state *state,
+		struct dc_stream_state *phantom_stream)
+{
+	if (state->phantom_stream_count >= MAX_PHANTOM_PIPES)
+		return false;
+
+	state->phantom_streams[state->phantom_stream_count++] = phantom_stream;
+
+	return true;
+}
+
+static bool dc_state_untrack_phantom_stream(struct dc_state *state, struct dc_stream_state *phantom_stream)
+{
+	bool res = false;
+	int i;
+
+	/* first find phantom stream in the dc_state */
+	for (i = 0; i < state->phantom_stream_count; i++) {
+		if (state->phantom_streams[i] == phantom_stream) {
+			state->phantom_streams[i] = NULL;
+			res = true;
+			break;
+		}
+	}
+
+	/* failed to find stream in state */
+	if (!res)
+		return res;
+
+	/* trim back phantom streams */
+	state->phantom_stream_count--;
+	for (; i < state->phantom_stream_count; i++)
+		state->phantom_streams[i] = state->phantom_streams[i + 1];
+
+	return res;
+}
+
+static bool dc_state_is_phantom_stream_tracked(struct dc_state *state, struct dc_stream_state *phantom_stream)
+{
+	int i;
+
+	for (i = 0; i < state->phantom_stream_count; i++) {
+		if (state->phantom_streams[i] == phantom_stream)
+			return true;
+	}
+
+	return false;
+}
+
+static bool dc_state_track_phantom_plane(struct dc_state *state,
+		struct dc_plane_state *phantom_plane)
+{
+	if (state->phantom_plane_count >= MAX_PHANTOM_PIPES)
+		return false;
+
+	state->phantom_planes[state->phantom_plane_count++] = phantom_plane;
+
+	return true;
+}
+
+static bool dc_state_untrack_phantom_plane(struct dc_state *state, struct dc_plane_state *phantom_plane)
+{
+	bool res = false;
+	int i;
+
+	/* first find phantom plane in the dc_state */
+	for (i = 0; i < state->phantom_plane_count; i++) {
+		if (state->phantom_planes[i] == phantom_plane) {
+			state->phantom_planes[i] = NULL;
+			res = true;
+			break;
+		}
+	}
+
+	/* failed to find plane in state */
+	if (!res)
+		return res;
+
+	/* trim back phantom planes */
+	state->phantom_plane_count--;
+	for (; i < state->phantom_plane_count; i++)
+		state->phantom_planes[i] = state->phantom_planes[i + 1];
+
+	return res;
+}
+
+static bool dc_state_is_phantom_plane_tracked(struct dc_state *state, struct dc_plane_state *phantom_plane)
+{
+	int i;
+
+	for (i = 0; i < state->phantom_plane_count; i++) {
+		if (state->phantom_planes[i] == phantom_plane)
+			return true;
+	}
+
+	return false;
+}
+
+static void dc_state_copy_internal(struct dc_state *dst_state, struct dc_state *src_state)
+{
+	int i, j;
+
+	memcpy(dst_state, src_state, sizeof(struct dc_state));
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		struct pipe_ctx *cur_pipe = &dst_state->res_ctx.pipe_ctx[i];
+
+		if (cur_pipe->top_pipe)
+			cur_pipe->top_pipe =  &dst_state->res_ctx.pipe_ctx[cur_pipe->top_pipe->pipe_idx];
+
+		if (cur_pipe->bottom_pipe)
+			cur_pipe->bottom_pipe = &dst_state->res_ctx.pipe_ctx[cur_pipe->bottom_pipe->pipe_idx];
+
+		if (cur_pipe->prev_odm_pipe)
+			cur_pipe->prev_odm_pipe =  &dst_state->res_ctx.pipe_ctx[cur_pipe->prev_odm_pipe->pipe_idx];
+
+		if (cur_pipe->next_odm_pipe)
+			cur_pipe->next_odm_pipe = &dst_state->res_ctx.pipe_ctx[cur_pipe->next_odm_pipe->pipe_idx];
+	}
+
+	/* retain phantoms */
+	for (i = 0; i < dst_state->phantom_stream_count; i++)
+		dc_stream_retain(dst_state->phantom_streams[i]);
+
+	for (i = 0; i < dst_state->phantom_plane_count; i++)
+		dc_plane_state_retain(dst_state->phantom_planes[i]);
+
+	/* retain streams and planes */
+	for (i = 0; i < dst_state->stream_count; i++) {
+		dc_stream_retain(dst_state->streams[i]);
+		for (j = 0; j < dst_state->stream_status[i].plane_count; j++)
+			dc_plane_state_retain(
+					dst_state->stream_status[i].plane_states[j]);
+	}
+
+}
+
 static void init_state(struct dc *dc, struct dc_state *state)
 {
 	/* Each context must have their own instance of VBA and in order to
@@ -49,6 +187,7 @@ static void init_state(struct dc *dc, struct dc_state *state)
 	memcpy(&state->bw_ctx.dml, &dc->dml, sizeof(struct display_mode_lib));
 }
 
+/* Public dc_state functions */
 struct dc_state *dc_state_create(struct dc *dc)
 {
 	struct dc_state *state = kvzalloc(sizeof(struct dc_state),
@@ -58,6 +197,7 @@ struct dc_state *dc_state_create(struct dc *dc)
 		return NULL;
 
 	init_state(dc, state);
+	dc_state_construct(dc, state);
 
 #ifdef CONFIG_DRM_AMD_DC_FP
 	if (dc->debug.using_dml2)
@@ -69,61 +209,112 @@ struct dc_state *dc_state_create(struct dc *dc)
 	return state;
 }
 
+void dc_state_copy(struct dc_state *dst_state, struct dc_state *src_state)
+{
+	struct kref refcount = dst_state->refcount;
+
+	dc_state_copy_internal(dst_state, src_state);
+
+#ifdef CONFIG_DRM_AMD_DC_FP
+	if (src_state->bw_ctx.dml2)
+		dml2_copy(dst_state->bw_ctx.dml2, src_state->bw_ctx.dml2);
+#endif
+
+	/* context refcount should not be overridden */
+	dst_state->refcount = refcount;
+}
+
 struct dc_state *dc_state_create_copy(struct dc_state *src_state)
 {
-	int i, j;
-	struct dc_state *new_state = kvmalloc(sizeof(struct dc_state), GFP_KERNEL);
+	struct dc_state *new_state;
 
+	new_state = kvmalloc(sizeof(struct dc_state),
+			GFP_KERNEL);
 	if (!new_state)
 		return NULL;
 
-	memcpy(new_state, src_state, sizeof(struct dc_state));
+	dc_state_copy_internal(new_state, src_state);
 
 #ifdef CONFIG_DRM_AMD_DC_FP
-	if (new_state->bw_ctx.dml2 && !dml2_create_copy(&new_state->bw_ctx.dml2, src_state->bw_ctx.dml2)) {
+	if (src_state->bw_ctx.dml2 &&
+			!dml2_create_copy(&new_state->bw_ctx.dml2, src_state->bw_ctx.dml2)) {
 		dc_state_release(new_state);
 		return NULL;
 	}
 #endif
 
-	for (i = 0; i < MAX_PIPES; i++) {
-		struct pipe_ctx *cur_pipe = &new_state->res_ctx.pipe_ctx[i];
+	kref_init(&new_state->refcount);
 
-		if (cur_pipe->top_pipe)
-			cur_pipe->top_pipe =  &new_state->res_ctx.pipe_ctx[cur_pipe->top_pipe->pipe_idx];
+	return new_state;
+}
 
-		if (cur_pipe->bottom_pipe)
-			cur_pipe->bottom_pipe = &new_state->res_ctx.pipe_ctx[cur_pipe->bottom_pipe->pipe_idx];
+void dc_state_copy_current(struct dc *dc, struct dc_state *dst_state)
+{
+	dc_state_copy(dst_state, dc->current_state);
+}
 
-		if (cur_pipe->prev_odm_pipe)
-			cur_pipe->prev_odm_pipe =  &new_state->res_ctx.pipe_ctx[cur_pipe->prev_odm_pipe->pipe_idx];
+struct dc_state *dc_state_create_current_copy(struct dc *dc)
+{
+	return dc_state_create_copy(dc->current_state);
+}
 
-		if (cur_pipe->next_odm_pipe)
-			cur_pipe->next_odm_pipe = &new_state->res_ctx.pipe_ctx[cur_pipe->next_odm_pipe->pipe_idx];
-	}
+void dc_state_construct(struct dc *dc, struct dc_state *state)
+{
+	state->clk_mgr = dc->clk_mgr;
 
-	for (i = 0; i < new_state->stream_count; i++) {
-		dc_stream_retain(new_state->streams[i]);
-		for (j = 0; j < new_state->stream_status[i].plane_count; j++)
-			dc_plane_state_retain(
-					new_state->stream_status[i].plane_states[j]);
+	/* Initialise DIG link encoder resource tracking variables. */
+	link_enc_cfg_init(dc, state);
+}
+
+void dc_state_destruct(struct dc_state *state)
+{
+	int i, j;
+
+	for (i = 0; i < state->stream_count; i++) {
+		for (j = 0; j < state->stream_status[i].plane_count; j++)
+			dc_plane_state_release(
+					state->stream_status[i].plane_states[j]);
+
+		state->stream_status[i].plane_count = 0;
+		dc_stream_release(state->streams[i]);
+		state->streams[i] = NULL;
 	}
+	state->stream_count = 0;
 
-	kref_init(&new_state->refcount);
+	/* release tracked phantoms */
+	for (i = 0; i < state->phantom_stream_count; i++) {
+		dc_stream_release(state->phantom_streams[i]);
+		state->phantom_streams[i] = NULL;
+	}
 
-	return new_state;
+	for (i = 0; i < state->phantom_plane_count; i++) {
+		dc_plane_state_release(state->phantom_planes[i]);
+		state->phantom_planes[i] = NULL;
+	}
+	state->stream_mask = 0;
+	memset(&state->res_ctx, 0, sizeof(state->res_ctx));
+	memset(&state->pp_display_cfg, 0, sizeof(state->pp_display_cfg));
+	memset(&state->dcn_bw_vars, 0, sizeof(state->dcn_bw_vars));
+	state->clk_mgr = NULL;
+	memset(&state->bw_ctx.bw, 0, sizeof(state->bw_ctx.bw));
+	memset(state->block_sequence, 0, sizeof(state->block_sequence));
+	state->block_sequence_steps = 0;
+	memset(state->dc_dmub_cmd, 0, sizeof(state->dc_dmub_cmd));
+	state->dmub_cmd_count = 0;
+	memset(&state->perf_params, 0, sizeof(state->perf_params));
+	memset(&state->scratch, 0, sizeof(state->scratch));
 }
 
-void dc_state_retain(struct dc_state *context)
+void dc_state_retain(struct dc_state *state)
 {
-	kref_get(&context->refcount);
+	kref_get(&state->refcount);
 }
 
 static void dc_state_free(struct kref *kref)
 {
 	struct dc_state *state = container_of(kref, struct dc_state, refcount);
 
-	dc_resource_state_destruct(state);
+	dc_state_destruct(state);
 
 #ifdef CONFIG_DRM_AMD_DC_FP
 	dml2_destroy(state->bw_ctx.dml2);
@@ -403,35 +594,65 @@ struct dc_stream_status *dc_state_get_stream_status(
 enum mall_stream_type dc_state_get_pipe_subvp_type(const struct dc_state *state,
 		const struct pipe_ctx *pipe_ctx)
 {
-	if (pipe_ctx->stream == NULL)
-		return SUBVP_NONE;
-
-	return pipe_ctx->stream->mall_stream_config.type;
+	return dc_state_get_stream_subvp_type(state, pipe_ctx->stream);
 }
 
 enum mall_stream_type dc_state_get_stream_subvp_type(const struct dc_state *state,
 		const struct dc_stream_state *stream)
 {
-	return stream->mall_stream_config.type;
+	int i;
+
+	enum mall_stream_type type = SUBVP_NONE;
+
+	for (i = 0; i < state->stream_count; i++) {
+		if (state->streams[i] == stream) {
+			type = state->stream_status[i].mall_stream_config.type;
+			break;
+		}
+	}
+
+	return type;
 }
 
 struct dc_stream_state *dc_state_get_paired_subvp_stream(const struct dc_state *state,
 		const struct dc_stream_state *stream)
 {
-	return stream->mall_stream_config.paired_stream;
+	int i;
+
+	struct dc_stream_state *paired_stream = NULL;
+
+	for (i = 0; i < state->stream_count; i++) {
+		if (state->streams[i] == stream) {
+			paired_stream = state->stream_status[i].mall_stream_config.paired_stream;
+			break;
+		}
+	}
+
+	return paired_stream;
 }
 
 struct dc_stream_state *dc_state_create_phantom_stream(const struct dc *dc,
 		struct dc_state *state,
 		struct dc_stream_state *main_stream)
 {
-	struct dc_stream_state *phantom_stream = dc_create_stream_for_sink(main_stream->sink);
+	struct dc_stream_state *phantom_stream;
 
-	if (phantom_stream != NULL) {
-		phantom_stream->signal = SIGNAL_TYPE_VIRTUAL;
-		phantom_stream->dpms_off = true;
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	phantom_stream = dc_create_stream_for_sink(main_stream->sink);
+
+	if (!phantom_stream) {
+		DC_LOG_ERROR("Failed to allocate phantom stream.\n");
+		return NULL;
 	}
 
+	/* track phantom stream in dc_state */
+	dc_state_track_phantom_stream(state, phantom_stream);
+
+	phantom_stream->is_phantom = true;
+	phantom_stream->signal = SIGNAL_TYPE_VIRTUAL;
+	phantom_stream->dpms_off = true;
+
 	return phantom_stream;
 }
 
@@ -439,6 +660,13 @@ void dc_state_release_phantom_stream(const struct dc *dc,
 		struct dc_state *state,
 		struct dc_stream_state *phantom_stream)
 {
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	if (!dc_state_untrack_phantom_stream(state, phantom_stream)) {
+		DC_LOG_ERROR("Failed to free phantom stream %p in dc state %p.\n", phantom_stream, state);
+		return;
+	}
+
 	dc_stream_release(phantom_stream);
 }
 
@@ -448,8 +676,17 @@ struct dc_plane_state *dc_state_create_phantom_plane(struct dc *dc,
 {
 	struct dc_plane_state *phantom_plane = dc_create_plane_state(dc);
 
-	if (phantom_plane != NULL)
-		phantom_plane->is_phantom = true;
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	if (!phantom_plane) {
+		DC_LOG_ERROR("Failed to allocate phantom plane.\n");
+		return NULL;
+	}
+
+	/* track phantom inside dc_state */
+	dc_state_track_phantom_plane(state, phantom_plane);
+
+	phantom_plane->is_phantom = true;
 
 	return phantom_plane;
 }
@@ -458,6 +695,13 @@ void dc_state_release_phantom_plane(const struct dc *dc,
 		struct dc_state *state,
 		struct dc_plane_state *phantom_plane)
 {
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	if (!dc_state_untrack_phantom_plane(state, phantom_plane)) {
+		DC_LOG_ERROR("Failed to free phantom plane %p in dc state %p.\n", phantom_plane, state);
+		return;
+	}
+
 	dc_plane_state_release(phantom_plane);
 }
 
@@ -467,13 +711,23 @@ enum dc_status dc_state_add_phantom_stream(struct dc *dc,
 		struct dc_stream_state *phantom_stream,
 		struct dc_stream_state *main_stream)
 {
+	struct dc_stream_status *main_stream_status;
+	struct dc_stream_status *phantom_stream_status;
 	enum dc_status res = dc_state_add_stream(dc, state, phantom_stream);
 
+	/* check if stream is tracked */
+	if (res == DC_OK && !dc_state_is_phantom_stream_tracked(state, phantom_stream)) {
+		/* stream must be tracked if added to state */
+		dc_state_track_phantom_stream(state, phantom_stream);
+	}
+
 	/* setup subvp meta */
-	phantom_stream->mall_stream_config.type = SUBVP_PHANTOM;
-	phantom_stream->mall_stream_config.paired_stream = main_stream;
-	main_stream->mall_stream_config.type = SUBVP_MAIN;
-	main_stream->mall_stream_config.paired_stream = phantom_stream;
+	main_stream_status = dc_state_get_stream_status(state, main_stream);
+	phantom_stream_status = dc_state_get_stream_status(state, phantom_stream);
+	phantom_stream_status->mall_stream_config.type = SUBVP_PHANTOM;
+	phantom_stream_status->mall_stream_config.paired_stream = main_stream;
+	main_stream_status->mall_stream_config.type = SUBVP_MAIN;
+	main_stream_status->mall_stream_config.paired_stream = phantom_stream;
 
 	return res;
 }
@@ -482,9 +736,18 @@ enum dc_status dc_state_remove_phantom_stream(struct dc *dc,
 		struct dc_state *state,
 		struct dc_stream_state *phantom_stream)
 {
+	struct dc_stream_status *main_stream_status;
+	struct dc_stream_status *phantom_stream_status;
+
 	/* reset subvp meta */
-	phantom_stream->mall_stream_config.paired_stream->mall_stream_config.type = SUBVP_NONE;
-	phantom_stream->mall_stream_config.paired_stream->mall_stream_config.paired_stream = NULL;
+	phantom_stream_status = dc_state_get_stream_status(state, phantom_stream);
+	main_stream_status = dc_state_get_stream_status(state, phantom_stream_status->mall_stream_config.paired_stream);
+	phantom_stream_status->mall_stream_config.type = SUBVP_NONE;
+	phantom_stream_status->mall_stream_config.paired_stream = NULL;
+	if (main_stream_status) {
+		main_stream_status->mall_stream_config.type = SUBVP_NONE;
+		main_stream_status->mall_stream_config.paired_stream = NULL;
+	}
 
 	/* remove stream from state */
 	return dc_state_remove_stream(dc, state, phantom_stream);
@@ -496,7 +759,15 @@ bool dc_state_add_phantom_plane(
 		struct dc_plane_state *phantom_plane,
 		struct dc_state *state)
 {
-	return dc_state_add_plane(dc, phantom_stream, phantom_plane, state);
+	bool res = dc_state_add_plane(dc, phantom_stream, phantom_plane, state);
+
+	/* check if stream is tracked */
+	if (res && !dc_state_is_phantom_plane_tracked(state, phantom_plane)) {
+		/* stream must be tracked if added to state */
+		dc_state_track_phantom_plane(state, phantom_plane);
+	}
+
+	return res;
 }
 
 bool dc_state_remove_phantom_plane(
@@ -511,9 +782,37 @@ bool dc_state_remove_phantom_plane(
 bool dc_state_rem_all_phantom_planes_for_stream(
 		const struct dc *dc,
 		struct dc_stream_state *phantom_stream,
-		struct dc_state *state)
+		struct dc_state *state,
+		bool should_release_planes)
 {
-	return dc_state_rem_all_planes_for_stream(dc, phantom_stream, state);
+	int i, old_plane_count;
+	struct dc_stream_status *stream_status = NULL;
+	struct dc_plane_state *del_planes[MAX_SURFACE_NUM] = { 0 };
+
+	for (i = 0; i < state->stream_count; i++)
+		if (state->streams[i] == phantom_stream) {
+			stream_status = &state->stream_status[i];
+			break;
+		}
+
+	if (stream_status == NULL) {
+		dm_error("Existing stream %p not found!\n", phantom_stream);
+		return false;
+	}
+
+	old_plane_count = stream_status->plane_count;
+
+	for (i = 0; i < old_plane_count; i++)
+		del_planes[i] = stream_status->plane_states[i];
+
+	for (i = 0; i < old_plane_count; i++) {
+		if (!dc_state_remove_plane(dc, phantom_stream, del_planes[i], state))
+			return false;
+		if (should_release_planes)
+			dc_state_release_phantom_plane(dc, state, del_planes[i]);
+	}
+
+	return true;
 }
 
 bool dc_state_add_all_phantom_planes_for_stream(
@@ -525,3 +824,38 @@ bool dc_state_add_all_phantom_planes_for_stream(
 {
 	return dc_state_add_all_planes_for_stream(dc, phantom_stream, phantom_planes, plane_count, state);
 }
+
+bool dc_state_remove_phantom_streams_and_planes(
+	struct dc *dc,
+	struct dc_state *state)
+{
+	int i;
+	bool removed_phantom = false;
+	struct dc_stream_state *phantom_stream = NULL;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &state->res_ctx.pipe_ctx[i];
+
+		if (pipe->plane_state && pipe->stream && dc_state_get_pipe_subvp_type(state, pipe) == SUBVP_PHANTOM) {
+			phantom_stream = pipe->stream;
+
+			dc_state_rem_all_phantom_planes_for_stream(dc, phantom_stream, state, false);
+			dc_state_remove_phantom_stream(dc, state, phantom_stream);
+			removed_phantom = true;
+		}
+	}
+	return removed_phantom;
+}
+
+void dc_state_release_phantom_streams_and_planes(
+		struct dc *dc,
+		struct dc_state *state)
+{
+	int i;
+
+	for (i = 0; i < state->phantom_stream_count; i++)
+		dc_state_release_phantom_stream(dc, state, state->phantom_streams[i]);
+
+	for (i = 0; i < state->phantom_plane_count; i++)
+		dc_state_release_phantom_plane(dc, state, state->phantom_planes[i]);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 86de4bf2ce13..f2b265ed7fc2 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -123,8 +123,7 @@ bool dc_stream_construct(struct dc_stream_state *stream,
 	}
 	stream->out_transfer_func->type = TF_TYPE_BYPASS;
 
-	stream->stream_id = stream->ctx->dc_stream_id_count;
-	stream->ctx->dc_stream_id_count++;
+	dc_stream_assign_stream_id(stream);
 
 	return true;
 }
@@ -138,6 +137,13 @@ void dc_stream_destruct(struct dc_stream_state *stream)
 	}
 }
 
+void dc_stream_assign_stream_id(struct dc_stream_state *stream)
+{
+	/* MSB is reserved to indicate phantoms */
+	stream->stream_id = stream->ctx->dc_stream_id_count;
+	stream->ctx->dc_stream_id_count++;
+}
+
 void dc_stream_retain(struct dc_stream_state *stream)
 {
 	kref_get(&stream->refcount);
@@ -198,8 +204,7 @@ struct dc_stream_state *dc_copy_stream(const struct dc_stream_state *stream)
 	if (new_stream->out_transfer_func)
 		dc_transfer_func_retain(new_stream->out_transfer_func);
 
-	new_stream->stream_id = new_stream->ctx->dc_stream_id_count;
-	new_stream->ctx->dc_stream_id_count++;
+	dc_stream_assign_stream_id(new_stream);
 
 	/* If using dynamic encoder assignment, wait till stream committed to assign encoder. */
 	if (new_stream->ctx->dc->res_pool->funcs->link_encs_assign)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d638679cf31a..a270b4bf7b95 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1388,6 +1388,9 @@ struct dc_surface_update {
 	const struct colorspace_transform *gamut_remap_matrix;
 };
 
+/*
+ * Create a new surface with default parameters;
+ */
 void dc_gamma_retain(struct dc_gamma *dc_gamma);
 void dc_gamma_release(struct dc_gamma **dc_gamma);
 struct dc_gamma *dc_create_gamma(void);
@@ -1451,27 +1454,12 @@ enum dc_status dc_validate_global_state(
 		struct dc_state *new_ctx,
 		bool fast_validate);
 
-
-void dc_resource_state_construct(
-		const struct dc *dc,
-		struct dc_state *dst_ctx);
-
 bool dc_acquire_release_mpc_3dlut(
 		struct dc *dc, bool acquire,
 		struct dc_stream_state *stream,
 		struct dc_3dlut **lut,
 		struct dc_transfer_func **shaper);
 
-void dc_resource_state_copy_construct(
-		const struct dc_state *src_ctx,
-		struct dc_state *dst_ctx);
-
-void dc_resource_state_copy_construct_current(
-		const struct dc *dc,
-		struct dc_state *dst_ctx);
-
-void dc_resource_state_destruct(struct dc_state *context);
-
 bool dc_resource_is_dsc_encoding_supported(const struct dc *dc);
 
 enum dc_status dc_commit_streams(struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 704d4ff722f0..1d315f7cdce3 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -672,12 +672,14 @@ static void update_subvp_prefetch_end_to_mall_start(struct dc *dc,
 	uint32_t prefetch_delta_us = 0;
 	struct dc_stream_state *phantom_stream0 = NULL;
 	struct dc_stream_state *phantom_stream1 = NULL;
-	struct dc_crtc_timing *phantom_timing0 = &phantom_stream0->timing;
-	struct dc_crtc_timing *phantom_timing1 = &phantom_stream1->timing;
+	struct dc_crtc_timing *phantom_timing0 = NULL;
+	struct dc_crtc_timing *phantom_timing1 = NULL;
 	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data = NULL;
 
 	phantom_stream0 = dc_state_get_paired_subvp_stream(context, subvp_pipes[0]->stream);
 	phantom_stream1 = dc_state_get_paired_subvp_stream(context, subvp_pipes[1]->stream);
+	phantom_timing0 = &phantom_stream0->timing;
+	phantom_timing1 = &phantom_stream1->timing;
 
 	subvp0_prefetch_us = div64_u64(((uint64_t)(phantom_timing0->v_total - phantom_timing0->v_front_porch) *
 			(uint64_t)phantom_timing0->h_total * 1000000),
@@ -853,7 +855,6 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
 			 */
 			if (resource_is_pipe_type(pipe, OTG_MASTER) &&
 					resource_is_pipe_type(pipe, DPP_PIPE) &&
-					pipe->stream->mall_stream_config.paired_stream &&
 					pipe_mall_type == SUBVP_MAIN) {
 				populate_subvp_cmd_pipe_info(dc, context, &cmd, pipe, cmd_pipe_index++);
 			} else if (resource_is_pipe_type(pipe, OTG_MASTER) &&
diff --git a/drivers/gpu/drm/amd/display/dc/dc_state.h b/drivers/gpu/drm/amd/display/dc/dc_state.h
index df1a8b85a652..d167fdbfa8a9 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_state.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_state.h
@@ -29,9 +29,13 @@
 #include "dc.h"
 #include "inc/core_status.h"
 
-
 struct dc_state *dc_state_create(struct dc *dc);
+void dc_state_copy(struct dc_state *dst_state, struct dc_state *src_state);
 struct dc_state *dc_state_create_copy(struct dc_state *src_state);
+void dc_state_copy_current(struct dc *dc, struct dc_state *dst_state);
+struct dc_state *dc_state_create_current_copy(struct dc *dc);
+void dc_state_construct(struct dc *dc, struct dc_state *state);
+void dc_state_destruct(struct dc_state *state);
 void dc_state_retain(struct dc_state *state);
 void dc_state_release(struct dc_state *state);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_state_priv.h b/drivers/gpu/drm/amd/display/dc/dc_state_priv.h
index 16c09caa1317..c1f44e09a6c1 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_state_priv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_state_priv.h
@@ -29,10 +29,6 @@
 #include "dc_state.h"
 #include "dc_stream.h"
 
-struct dc_stream_status *dc_state_get_stream_status(
-	struct dc_state *state,
-	struct dc_stream_state *stream);
-
 /* Get the type of the provided resource (none, phantom, main) based on the provided
  * context. If the context is unavailable, determine only if phantom or not.
  */
@@ -85,7 +81,8 @@ bool dc_state_remove_phantom_plane(
 bool dc_state_rem_all_phantom_planes_for_stream(
 		const struct dc *dc,
 		struct dc_stream_state *phantom_stream,
-		struct dc_state *state);
+		struct dc_state *state,
+		bool should_release_planes);
 
 bool dc_state_add_all_phantom_planes_for_stream(
 		const struct dc *dc,
@@ -94,4 +91,12 @@ bool dc_state_add_all_phantom_planes_for_stream(
 		int plane_count,
 		struct dc_state *state);
 
+bool dc_state_remove_phantom_streams_and_planes(
+		struct dc *dc,
+		struct dc_state *state);
+
+void dc_state_release_phantom_streams_and_planes(
+		struct dc *dc,
+		struct dc_state *state);
+
 #endif /* _DC_STATE_PRIV_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index f617428c6a57..a23eebd9933b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -38,6 +38,14 @@ struct timing_sync_info {
 	bool master;
 };
 
+struct mall_stream_config {
+	/* MALL stream config to indicate if the stream is phantom or not.
+	 * We will use a phantom stream to indicate that the pipe is phantom.
+	 */
+	enum mall_stream_type type;
+	struct dc_stream_state *paired_stream;	// master / slave stream
+};
+
 struct dc_stream_status {
 	int primary_otg_inst;
 	int stream_enc_inst;
@@ -50,6 +58,7 @@ struct dc_stream_status {
 	struct timing_sync_info timing_sync_info;
 	struct dc_plane_state *plane_states[MAX_SURFACE_NUM];
 	bool is_abm_supported;
+	struct mall_stream_config mall_stream_config;
 };
 
 enum hubp_dmdata_mode {
@@ -146,25 +155,6 @@ struct test_pattern {
 
 #define SUBVP_DRR_MARGIN_US 100 // 100us for DRR margin (SubVP + DRR)
 
-struct mall_stream_config {
-	/* MALL stream config to indicate if the stream is phantom or not.
-	 * We will use a phantom stream to indicate that the pipe is phantom.
-	 */
-	enum mall_stream_type type;
-	struct dc_stream_state *paired_stream;	// master / slave stream
-};
-
-/* Temp struct used to save and restore MALL config
- * during validation.
- *
- * TODO: Move MALL config into dc_state instead of stream struct
- * to avoid needing to save/restore.
- */
-struct mall_temp_config {
-	struct mall_stream_config mall_stream_config[MAX_PIPES];
-	bool is_phantom_plane[MAX_PIPES];
-};
-
 struct dc_stream_debug_options {
 	char force_odm_combine_segments;
 };
@@ -294,7 +284,7 @@ struct dc_stream_state {
 	bool has_non_synchronizable_pclk;
 	bool vblank_synchronized;
 	bool fpo_in_use;
-	struct mall_stream_config mall_stream_config;
+	bool is_phantom;
 };
 
 #define ABM_LEVEL_IMMEDIATE_DISABLE 255
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream_priv.h b/drivers/gpu/drm/amd/display/dc/dc_stream_priv.h
index 710d3b04c7e8..7476fd52ce2b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream_priv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream_priv.h
@@ -32,4 +32,6 @@ bool dc_stream_construct(struct dc_stream_state *stream,
 	struct dc_sink *dc_sink_data);
 void dc_stream_destruct(struct dc_stream_state *stream);
 
+void dc_stream_assign_stream_id(struct dc_stream_state *stream);
+
 #endif // _DC_STREAM_PRIV_H_
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index b3d360741175..1743ebcd6b2e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -430,71 +430,6 @@ void dcn32_set_det_allocations(struct dc *dc, struct dc_state *context,
 		dcn32_determine_det_override(dc, context, pipes);
 }
 
-/**
- * dcn32_save_mall_state(): Save MALL (SubVP) state for fast validation cases
- *
- * This function saves the MALL (SubVP) case for fast validation cases. For fast validation,
- * there are situations where a shallow copy of the dc->current_state is created for the
- * validation. In this case we want to save and restore the mall config because we always
- * teardown subvp at the beginning of validation (and don't attempt to add it back if it's
- * fast validation). If we don't restore the subvp config in cases of fast validation +
- * shallow copy of the dc->current_state, the dc->current_state will have a partially
- * removed subvp state when we did not intend to remove it.
- *
- * NOTE: This function ONLY works if the streams are not moved to a different pipe in the
- *       validation. We don't expect this to happen in fast_validation=1 cases.
- *
- * @dc: Current DC state
- * @context: New DC state to be programmed
- * @temp_config: struct used to cache the existing MALL state
- *
- * Return: void
- */
-void dcn32_save_mall_state(struct dc *dc,
-		struct dc_state *context,
-		struct mall_temp_config *temp_config)
-{
-	uint32_t i;
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-
-		if (pipe->stream)
-			temp_config->mall_stream_config[i] = pipe->stream->mall_stream_config;
-
-		if (pipe->plane_state)
-			temp_config->is_phantom_plane[i] = pipe->plane_state->is_phantom;
-	}
-}
-
-/**
- * dcn32_restore_mall_state(): Restore MALL (SubVP) state for fast validation cases
- *
- * Restore the MALL state based on the previously saved state from dcn32_save_mall_state
- *
- * @dc: Current DC state
- * @context: New DC state to be programmed, restore MALL state into here
- * @temp_config: struct that has the cached MALL state
- *
- * Return: void
- */
-void dcn32_restore_mall_state(struct dc *dc,
-		struct dc_state *context,
-		struct mall_temp_config *temp_config)
-{
-	uint32_t i;
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-
-		if (pipe->stream)
-			pipe->stream->mall_stream_config = temp_config->mall_stream_config[i];
-
-		if (pipe->plane_state)
-			pipe->plane_state->is_phantom = temp_config->is_phantom_plane[i];
-	}
-}
-
 #define MAX_STRETCHED_V_BLANK 1000 // in micro-seconds (must ensure to match value in FW)
 /*
  * Scaling factor for v_blank stretch calculations considering timing in
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 50d223fa1e49..10c890a9cb7c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -1539,7 +1539,8 @@ static void dcn32_full_validate_bw_helper(struct dc *dc,
 		// If SubVP pipe config is unsupported (or cannot be used for UCLK switching)
 		// remove phantom pipes and repopulate dml pipes
 		if (!found_supported_config) {
-			dc->res_pool->funcs->remove_phantom_pipes(dc, context, false);
+			dc_state_remove_phantom_streams_and_planes(dc, context);
+			dc_state_release_phantom_streams_and_planes(dc, context);
 			vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] = dm_dram_clock_change_unsupported;
 			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
 
@@ -1937,7 +1938,8 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 		return false;
 
 	// For each full update, remove all existing phantom pipes first
-	dc->res_pool->funcs->remove_phantom_pipes(dc, context, fast_validate);
+	dc_state_remove_phantom_streams_and_planes(dc, context);
+	dc_state_release_phantom_streams_and_planes(dc, context);
 
 	dc->res_pool->funcs->update_soc_for_wm_a(dc, context);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
index 0c146af34d82..282d70e2b18a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
@@ -807,7 +807,7 @@ static void add_phantom_pipes_for_main_pipe(struct dml2_context *ctx, struct dc_
 	}
 }
 
-static bool remove_all_planes_for_stream(struct dml2_context *ctx, struct dc_stream_state *stream, struct dc_state *context)
+static bool remove_all_phantom_planes_for_stream(struct dml2_context *ctx, struct dc_stream_state *stream, struct dc_state *context)
 {
 	int i, old_plane_count;
 	struct dc_stream_status *stream_status = NULL;
@@ -828,9 +828,11 @@ static bool remove_all_planes_for_stream(struct dml2_context *ctx, struct dc_str
 	for (i = 0; i < old_plane_count; i++)
 		del_planes[i] = stream_status->plane_states[i];
 
-	for (i = 0; i < old_plane_count; i++)
+	for (i = 0; i < old_plane_count; i++) {
 		if (!ctx->config.svp_pstate.callbacks.remove_phantom_plane(ctx->config.svp_pstate.callbacks.dc, stream, del_planes[i], context))
 			return false;
+		ctx->config.svp_pstate.callbacks.release_phantom_plane(ctx->config.svp_pstate.callbacks.dc, context, del_planes[i]);
+	}
 
 	return true;
 }
@@ -839,39 +841,21 @@ bool dml2_svp_remove_all_phantom_pipes(struct dml2_context *ctx, struct dc_state
 {
 	int i;
 	bool removed_pipe = false;
-	struct dc_plane_state *phantom_plane = NULL;
 	struct dc_stream_state *phantom_stream = NULL;
 
 	for (i = 0; i < ctx->config.dcn_pipe_count; i++) {
 		struct pipe_ctx *pipe = &state->res_ctx.pipe_ctx[i];
 		// build scaling params for phantom pipes
 		if (pipe->plane_state && pipe->stream && ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(state, pipe) == SUBVP_PHANTOM) {
-			phantom_plane = pipe->plane_state;
 			phantom_stream = pipe->stream;
 
-			remove_all_planes_for_stream(ctx, pipe->stream, state);
-			ctx->config.svp_pstate.callbacks.remove_phantom_stream(ctx->config.svp_pstate.callbacks.dc, state, pipe->stream);
-
-			/* Ref count is incremented on allocation and also when added to the context.
-			 * Therefore we must call release for the the phantom plane and stream once
-			 * they are removed from the ctx to finally decrement the refcount to 0 to free.
-			 */
-			ctx->config.svp_pstate.callbacks.release_phantom_plane(ctx->config.svp_pstate.callbacks.dc,
-					state,
-					phantom_plane);
-			ctx->config.svp_pstate.callbacks.release_phantom_stream(ctx->config.svp_pstate.callbacks.dc,
-					state,
-					phantom_stream);
+			remove_all_phantom_planes_for_stream(ctx, phantom_stream, state);
+			ctx->config.svp_pstate.callbacks.remove_phantom_stream(ctx->config.svp_pstate.callbacks.dc, state, phantom_stream);
+			ctx->config.svp_pstate.callbacks.release_phantom_stream(ctx->config.svp_pstate.callbacks.dc, state, phantom_stream);
 
 			removed_pipe = true;
 		}
 
-		// Clear all phantom stream info
-		if (pipe->stream) {
-			pipe->stream->mall_stream_config.type = SUBVP_NONE;
-			pipe->stream->mall_stream_config.paired_stream = NULL;
-		}
-
 		if (pipe->plane_state) {
 			pipe->plane_state->is_phantom = false;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
index 505a5d7ae20d..ee0eb184eb6d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
@@ -104,7 +104,10 @@ struct dml2_dc_svp_callbacks {
 			struct dc_stream_state *phantom_stream,
 			struct dc_stream_state *main_stream);
 	bool (*add_phantom_plane)(const struct dc *dc, struct dc_stream_state *stream, struct dc_plane_state *plane_state, struct dc_state *context);
-	bool (*remove_phantom_plane)(const struct dc *dc, struct dc_stream_state *stream, struct dc_plane_state *plane_state, struct dc_state *context);
+	bool (*remove_phantom_plane)(const struct dc *dc,
+			struct dc_stream_state *stream,
+			struct dc_plane_state *plane_state,
+			struct dc_state *context);
 	enum dc_status (*remove_phantom_stream)(struct dc *dc,
 			struct dc_state *state,
 			struct dc_stream_state *stream);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index b0906105529b..05d0e218bfb2 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1684,7 +1684,7 @@ static void disable_vga_and_power_gate_all_controllers(
 				true);
 
 		dc->current_state->res_ctx.pipe_ctx[i].pipe_idx = i;
-		dc->hwss.disable_plane(dc,
+		dc->hwss.disable_plane(dc, dc->current_state,
 			&dc->current_state->res_ctx.pipe_ctx[i]);
 	}
 }
@@ -2133,7 +2133,7 @@ static void dce110_reset_hw_ctx_wrap(
 										old_clk))
 				old_clk->funcs->cs_power_down(old_clk);
 
-			dc->hwss.disable_plane(dc, pipe_ctx_old);
+			dc->hwss.disable_plane(dc, dc->current_state, pipe_ctx_old);
 
 			pipe_ctx_old->stream = NULL;
 		}
@@ -2497,6 +2497,7 @@ static bool wait_for_reset_trigger_to_occur(
 /* Enable timing synchronization for a group of Timing Generators. */
 static void dce110_enable_timing_synchronization(
 		struct dc *dc,
+		struct dc_state *state,
 		int group_index,
 		int group_size,
 		struct pipe_ctx *grouped_pipes[])
@@ -2842,7 +2843,7 @@ static void dce110_post_unlock_program_front_end(
 {
 }
 
-static void dce110_power_down_fe(struct dc *dc, struct pipe_ctx *pipe_ctx)
+static void dce110_power_down_fe(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx)
 {
 	struct dce_hwseq *hws = dc->hwseq;
 	int fe_idx = pipe_ctx->plane_res.mi ?
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 7ed5b5d714e1..632aa091b6b6 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -1181,7 +1181,9 @@ void dcn10_verify_allow_pstate_change_high(struct dc *dc)
 }
 
 /* trigger HW to start disconnect plane from stream on the next vsync */
-void dcn10_plane_atomic_disconnect(struct dc *dc, struct pipe_ctx *pipe_ctx)
+void dcn10_plane_atomic_disconnect(struct dc *dc,
+		struct dc_state *state,
+		struct pipe_ctx *pipe_ctx)
 {
 	struct dce_hwseq *hws = dc->hwseq;
 	struct hubp *hubp = pipe_ctx->plane_res.hubp;
@@ -1201,7 +1203,7 @@ void dcn10_plane_atomic_disconnect(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	mpc->funcs->remove_mpcc(mpc, mpc_tree_params, mpcc_to_remove);
 	// Phantom pipes have OTG disabled by default, so MPCC_STATUS will never assert idle,
 	// so don't wait for MPCC_IDLE in the programming sequence
-	if (opp != NULL && dc_state_get_pipe_subvp_type(NULL, pipe_ctx) != SUBVP_PHANTOM)
+	if (opp != NULL && dc_state_get_pipe_subvp_type(state, pipe_ctx) != SUBVP_PHANTOM)
 		opp->mpcc_disconnect_pending[pipe_ctx->plane_res.mpcc_inst] = true;
 
 	dc->optimized_required = true;
@@ -1291,7 +1293,7 @@ void dcn10_plane_atomic_disable(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	pipe_ctx->plane_state = NULL;
 }
 
-void dcn10_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx)
+void dcn10_disable_plane(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx)
 {
 	struct dce_hwseq *hws = dc->hwseq;
 	DC_LOGGER_INIT(dc->ctx->logger);
@@ -1417,12 +1419,12 @@ void dcn10_init_pipes(struct dc *dc, struct dc_state *context)
 		dc->res_pool->opps[i]->mpcc_disconnect_pending[pipe_ctx->plane_res.mpcc_inst] = true;
 		pipe_ctx->stream_res.opp = dc->res_pool->opps[i];
 
-		hws->funcs.plane_atomic_disconnect(dc, pipe_ctx);
+		hws->funcs.plane_atomic_disconnect(dc, context, pipe_ctx);
 
 		if (tg->funcs->is_tg_enabled(tg))
 			tg->funcs->unlock(tg);
 
-		dc->hwss.disable_plane(dc, pipe_ctx);
+		dc->hwss.disable_plane(dc, context, pipe_ctx);
 
 		pipe_ctx->stream_res.tg = NULL;
 		pipe_ctx->plane_res.hubp = NULL;
@@ -2263,6 +2265,7 @@ void dcn10_enable_vblanks_synchronization(
 
 void dcn10_enable_timing_synchronization(
 	struct dc *dc,
+	struct dc_state *state,
 	int group_index,
 	int group_size,
 	struct pipe_ctx *grouped_pipes[])
@@ -2277,7 +2280,7 @@ void dcn10_enable_timing_synchronization(
 	DC_SYNC_INFO("Setting up OTG reset trigger\n");
 
 	for (i = 1; i < group_size; i++) {
-		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[i]) == SUBVP_PHANTOM)
+		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(state, grouped_pipes[i]) == SUBVP_PHANTOM)
 			continue;
 
 		opp = grouped_pipes[i]->stream_res.opp;
@@ -2297,14 +2300,14 @@ void dcn10_enable_timing_synchronization(
 		if (grouped_pipes[i]->stream == NULL)
 			continue;
 
-		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[i]) == SUBVP_PHANTOM)
+		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(state, grouped_pipes[i]) == SUBVP_PHANTOM)
 			continue;
 
 		grouped_pipes[i]->stream->vblank_synchronized = false;
 	}
 
 	for (i = 1; i < group_size; i++) {
-		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[i]) == SUBVP_PHANTOM)
+		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(state, grouped_pipes[i]) == SUBVP_PHANTOM)
 			continue;
 
 		grouped_pipes[i]->stream_res.tg->funcs->enable_reset_trigger(
@@ -2318,11 +2321,11 @@ void dcn10_enable_timing_synchronization(
 	 * synchronized. Look at last pipe programmed to reset.
 	 */
 
-	if (grouped_pipes[1]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[1]) != SUBVP_PHANTOM)
+	if (grouped_pipes[1]->stream && dc_state_get_pipe_subvp_type(state, grouped_pipes[1]) != SUBVP_PHANTOM)
 		wait_for_reset_trigger_to_occur(dc_ctx, grouped_pipes[1]->stream_res.tg);
 
 	for (i = 1; i < group_size; i++) {
-		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[i]) == SUBVP_PHANTOM)
+		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(state, grouped_pipes[i]) == SUBVP_PHANTOM)
 			continue;
 
 		grouped_pipes[i]->stream_res.tg->funcs->disable_reset_trigger(
@@ -3022,7 +3025,7 @@ void dcn10_post_unlock_program_front_end(
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable)
-			dc->hwss.disable_plane(dc, &dc->current_state->res_ctx.pipe_ctx[i]);
+			dc->hwss.disable_plane(dc, dc->current_state, &dc->current_state->res_ctx.pipe_ctx[i]);
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable) {
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h
index ef6d56da417c..bc5dd68a2408 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h
@@ -75,7 +75,7 @@ void dcn10_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx);
 void dcn10_reset_hw_ctx_wrap(
 		struct dc *dc,
 		struct dc_state *context);
-void dcn10_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx);
+void dcn10_disable_plane(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx);
 void dcn10_lock_all_pipes(
 		struct dc *dc,
 		struct dc_state *context,
@@ -108,13 +108,16 @@ void dcn10_power_down_on_boot(struct dc *dc);
 enum dc_status dce110_apply_ctx_to_hw(
 		struct dc *dc,
 		struct dc_state *context);
-void dcn10_plane_atomic_disconnect(struct dc *dc, struct pipe_ctx *pipe_ctx);
+void dcn10_plane_atomic_disconnect(struct dc *dc,
+		struct dc_state *state,
+		struct pipe_ctx *pipe_ctx);
 void dcn10_update_dchub(struct dce_hwseq *hws, struct dchub_init_data *dh_data);
 void dcn10_update_pending_status(struct pipe_ctx *pipe_ctx);
 void dce110_power_down(struct dc *dc);
 void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context);
 void dcn10_enable_timing_synchronization(
 		struct dc *dc,
+		struct dc_state *state,
 		int group_index,
 		int group_size,
 		struct pipe_ctx *grouped_pipes[]);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 0c9f4ea109cb..88fe102f8288 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -624,9 +624,9 @@ void dcn20_plane_atomic_disable(struct dc *dc, struct pipe_ctx *pipe_ctx)
 }
 
 
-void dcn20_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx)
+void dcn20_disable_plane(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx)
 {
-	bool is_phantom = dc_state_get_pipe_subvp_type(NULL, pipe_ctx) == SUBVP_PHANTOM;
+	bool is_phantom = dc_state_get_pipe_subvp_type(state, pipe_ctx) == SUBVP_PHANTOM;
 	struct timing_generator *tg = is_phantom ? pipe_ctx->stream_res.tg : NULL;
 
 	DC_LOGGER_INIT(dc->ctx->logger);
@@ -1369,10 +1369,13 @@ void dcn20_pipe_control_lock(
 	}
 }
 
-static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx *new_pipe)
+static void dcn20_detect_pipe_changes(struct dc_state *old_state,
+		struct dc_state *new_state,
+		struct pipe_ctx *old_pipe,
+		struct pipe_ctx *new_pipe)
 {
-	bool old_is_phantom = dc_state_get_pipe_subvp_type(NULL, old_pipe) == SUBVP_PHANTOM;
-	bool new_is_phantom = dc_state_get_pipe_subvp_type(NULL, new_pipe) == SUBVP_PHANTOM;
+	bool old_is_phantom = dc_state_get_pipe_subvp_type(old_state, old_pipe) == SUBVP_PHANTOM;
+	bool new_is_phantom = dc_state_get_pipe_subvp_type(new_state, new_pipe) == SUBVP_PHANTOM;
 
 	new_pipe->update_flags.raw = 0;
 
@@ -1420,7 +1423,7 @@ static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx
 	 * The remove-add sequence of the phantom pipe always results in the pipe
 	 * being blanked in enable_stream_timing (DPG).
 	 */
-	if (new_pipe->stream && dc_state_get_pipe_subvp_type(NULL, new_pipe) == SUBVP_PHANTOM)
+	if (new_pipe->stream && dc_state_get_pipe_subvp_type(new_state, new_pipe) == SUBVP_PHANTOM)
 		new_pipe->update_flags.bits.enable = 1;
 
 	/* Phantom pipes are effectively disabled, if the pipe was previously phantom
@@ -1782,7 +1785,7 @@ static void dcn20_program_pipe(
 				pipe_ctx->pipe_dlg_param.vupdate_offset,
 				pipe_ctx->pipe_dlg_param.vupdate_width);
 
-		if (pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM)
+		if (dc_state_get_pipe_subvp_type(context, pipe_ctx) != SUBVP_PHANTOM)
 			pipe_ctx->stream_res.tg->funcs->wait_for_state(pipe_ctx->stream_res.tg, CRTC_STATE_VACTIVE);
 
 		pipe_ctx->stream_res.tg->funcs->set_vtg_params(
@@ -1921,7 +1924,7 @@ void dcn20_program_front_end_for_ctx(
 
 	/* Set pipe update flags and lock pipes */
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
-		dcn20_detect_pipe_changes(&dc->current_state->res_ctx.pipe_ctx[i],
+		dcn20_detect_pipe_changes(dc->current_state, context, &dc->current_state->res_ctx.pipe_ctx[i],
 				&context->res_ctx.pipe_ctx[i]);
 
 	/* When disabling phantom pipes, turn on phantom OTG first (so we can get double
@@ -1971,7 +1974,7 @@ void dcn20_program_front_end_for_ctx(
 			if (hubbub->funcs->program_det_size && (context->res_ctx.pipe_ctx[i].update_flags.bits.disable ||
 					(context->res_ctx.pipe_ctx[i].plane_state && dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[i]) == SUBVP_PHANTOM)))
 				hubbub->funcs->program_det_size(hubbub, dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
-			hws->funcs.plane_atomic_disconnect(dc, &dc->current_state->res_ctx.pipe_ctx[i]);
+			hws->funcs.plane_atomic_disconnect(dc, dc->current_state, &dc->current_state->res_ctx.pipe_ctx[i]);
 			DC_LOG_DC("Reset mpcc for pipe %d\n", dc->current_state->res_ctx.pipe_ctx[i].pipe_idx);
 		}
 
@@ -2044,7 +2047,7 @@ void dcn20_post_unlock_program_front_end(
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable)
-			dc->hwss.disable_plane(dc, &dc->current_state->res_ctx.pipe_ctx[i]);
+			dc->hwss.disable_plane(dc, dc->current_state, &dc->current_state->res_ctx.pipe_ctx[i]);
 
 	/*
 	 * If we are enabling a pipe, we need to wait for pending clear as this is a critical
@@ -2954,7 +2957,7 @@ void dcn20_fpga_init_hw(struct dc *dc)
 		dc->res_pool->opps[i]->mpcc_disconnect_pending[pipe_ctx->plane_res.mpcc_inst] = true;
 		pipe_ctx->stream_res.opp = dc->res_pool->opps[i];
 		/*to do*/
-		hws->funcs.plane_atomic_disconnect(dc, pipe_ctx);
+		hws->funcs.plane_atomic_disconnect(dc, context, pipe_ctx);
 	}
 
 	/* initialize DWB pointer to MCIF_WB */
@@ -2971,7 +2974,7 @@ void dcn20_fpga_init_hw(struct dc *dc)
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
-		dc->hwss.disable_plane(dc, pipe_ctx);
+		dc->hwss.disable_plane(dc, context, pipe_ctx);
 
 		pipe_ctx->stream_res.tg = NULL;
 		pipe_ctx->plane_res.hubp = NULL;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h
index ab02e4e9c8c2..b94c85340abf 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h
@@ -52,7 +52,7 @@ void dcn20_program_output_csc(struct dc *dc,
 void dcn20_enable_stream(struct pipe_ctx *pipe_ctx);
 void dcn20_unblank_stream(struct pipe_ctx *pipe_ctx,
 		struct dc_link_settings *link_settings);
-void dcn20_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx);
+void dcn20_disable_plane(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx);
 void dcn20_disable_pixel_data(
 		struct dc *dc,
 		struct pipe_ctx *pipe_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c
index d3fe6092f50e..d5769f38874f 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c
@@ -320,7 +320,7 @@ void dcn201_init_hw(struct dc *dc)
 		res_pool->opps[i]->mpcc_disconnect_pending[pipe_ctx->plane_res.mpcc_inst] = true;
 		pipe_ctx->stream_res.opp = res_pool->opps[i];
 		/*To do: number of MPCC != number of opp*/
-		hws->funcs.plane_atomic_disconnect(dc, pipe_ctx);
+		hws->funcs.plane_atomic_disconnect(dc, context, pipe_ctx);
 	}
 
 	/* initialize DWB pointer to MCIF_WB */
@@ -337,7 +337,7 @@ void dcn201_init_hw(struct dc *dc)
 	for (i = 0; i < res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
-		dc->hwss.disable_plane(dc, pipe_ctx);
+		dc->hwss.disable_plane(dc, context, pipe_ctx);
 
 		pipe_ctx->stream_res.tg = NULL;
 		pipe_ctx->plane_res.hubp = NULL;
@@ -369,7 +369,9 @@ void dcn201_init_hw(struct dc *dc)
 }
 
 /* trigger HW to start disconnect plane from stream on the next vsync */
-void dcn201_plane_atomic_disconnect(struct dc *dc, struct pipe_ctx *pipe_ctx)
+void dcn201_plane_atomic_disconnect(struct dc *dc,
+		struct dc_state *state,
+		struct pipe_ctx *pipe_ctx)
 {
 	struct dce_hwseq *hws = dc->hwseq;
 	struct hubp *hubp = pipe_ctx->plane_res.hubp;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.h
index 26cd62be6418..6a50a9894be6 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.h
@@ -33,7 +33,7 @@ void dcn201_init_hw(struct dc *dc);
 void dcn201_unblank_stream(struct pipe_ctx *pipe_ctx,
 		struct dc_link_settings *link_settings);
 void dcn201_update_plane_addr(const struct dc *dc, struct pipe_ctx *pipe_ctx);
-void dcn201_plane_atomic_disconnect(struct dc *dc, struct pipe_ctx *pipe_ctx);
+void dcn201_plane_atomic_disconnect(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx);
 void dcn201_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx);
 void dcn201_set_cursor_attribute(struct pipe_ctx *pipe_ctx);
 void dcn201_pipe_control_lock(
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index a6214b5b6d63..410e0a965abc 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -349,8 +349,7 @@ void dcn32_commit_subvp_config(struct dc *dc, struct dc_state *context)
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
-		if (pipe_ctx->stream && pipe_ctx->stream->mall_stream_config.paired_stream &&
-				dc_state_get_pipe_subvp_type(context, pipe_ctx) == SUBVP_MAIN) {
+		if (pipe_ctx->stream && dc_state_get_pipe_subvp_type(context, pipe_ctx) == SUBVP_MAIN) {
 			// There is at least 1 SubVP pipe, so enable SubVP
 			enable_subvp = true;
 			break;
@@ -419,14 +418,7 @@ void dcn32_subvp_pipe_control_lock_fast(union block_sequence_params *params)
 {
 	struct dc *dc = params->subvp_pipe_control_lock_fast_params.dc;
 	bool lock = params->subvp_pipe_control_lock_fast_params.lock;
-	struct pipe_ctx *pipe_ctx = params->subvp_pipe_control_lock_fast_params.pipe_ctx;
-	bool subvp_immediate_flip = false;
-
-	if (pipe_ctx && pipe_ctx->stream && pipe_ctx->plane_state) {
-		if (dc_state_get_pipe_subvp_type(NULL, pipe_ctx) == SUBVP_MAIN &&
-				pipe_ctx->plane_state->flip_immediate)
-			subvp_immediate_flip = true;
-	}
+	bool subvp_immediate_flip = params->subvp_pipe_control_lock_fast_params.subvp_immediate_flip;
 
 	// Don't need to lock for DRR VSYNC flips -- FW will wait for DRR pending update cleared.
 	if (subvp_immediate_flip) {
@@ -1376,7 +1368,7 @@ void dcn32_update_phantom_vp_position(struct dc *dc,
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
 		if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN &&
-				pipe->stream->mall_stream_config.paired_stream == phantom_pipe->stream) {
+				dc_state_get_paired_subvp_stream(context, pipe->stream) == phantom_pipe->stream) {
 			if (pipe->plane_state && pipe->plane_state->update_flags.bits.position_change) {
 
 				phantom_plane->src_rect.x = pipe->plane_state->src_rect.x;
@@ -1401,21 +1393,19 @@ void dcn32_update_phantom_vp_position(struct dc *dc,
 void dcn32_apply_update_flags_for_phantom(struct pipe_ctx *phantom_pipe)
 {
 	phantom_pipe->update_flags.raw = 0;
-	if (dc_state_get_pipe_subvp_type(NULL, phantom_pipe) == SUBVP_PHANTOM) {
-		if (resource_is_pipe_type(phantom_pipe, DPP_PIPE)) {
-			phantom_pipe->update_flags.bits.enable = 1;
-			phantom_pipe->update_flags.bits.mpcc = 1;
-			phantom_pipe->update_flags.bits.dppclk = 1;
-			phantom_pipe->update_flags.bits.hubp_interdependent = 1;
-			phantom_pipe->update_flags.bits.hubp_rq_dlg_ttu = 1;
-			phantom_pipe->update_flags.bits.gamut_remap = 1;
-			phantom_pipe->update_flags.bits.scaler = 1;
-			phantom_pipe->update_flags.bits.viewport = 1;
-			phantom_pipe->update_flags.bits.det_size = 1;
-			if (resource_is_pipe_type(phantom_pipe, OTG_MASTER)) {
-				phantom_pipe->update_flags.bits.odm = 1;
-				phantom_pipe->update_flags.bits.global_sync = 1;
-			}
+	if (resource_is_pipe_type(phantom_pipe, DPP_PIPE)) {
+		phantom_pipe->update_flags.bits.enable = 1;
+		phantom_pipe->update_flags.bits.mpcc = 1;
+		phantom_pipe->update_flags.bits.dppclk = 1;
+		phantom_pipe->update_flags.bits.hubp_interdependent = 1;
+		phantom_pipe->update_flags.bits.hubp_rq_dlg_ttu = 1;
+		phantom_pipe->update_flags.bits.gamut_remap = 1;
+		phantom_pipe->update_flags.bits.scaler = 1;
+		phantom_pipe->update_flags.bits.viewport = 1;
+		phantom_pipe->update_flags.bits.det_size = 1;
+		if (resource_is_pipe_type(phantom_pipe, OTG_MASTER)) {
+			phantom_pipe->update_flags.bits.odm = 1;
+			phantom_pipe->update_flags.bits.global_sync = 1;
 		}
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index 56a4bc476684..582852ed21fb 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -814,12 +814,12 @@ void dcn35_init_pipes(struct dc *dc, struct dc_state *context)
 		dc->res_pool->opps[i]->mpcc_disconnect_pending[pipe_ctx->plane_res.mpcc_inst] = true;
 		pipe_ctx->stream_res.opp = dc->res_pool->opps[i];
 
-		hws->funcs.plane_atomic_disconnect(dc, pipe_ctx);
+		hws->funcs.plane_atomic_disconnect(dc, context, pipe_ctx);
 
 		if (tg->funcs->is_tg_enabled(tg))
 			tg->funcs->unlock(tg);
 
-		dc->hwss.disable_plane(dc, pipe_ctx);
+		dc->hwss.disable_plane(dc, context, pipe_ctx);
 
 		pipe_ctx->stream_res.tg = NULL;
 		pipe_ctx->plane_res.hubp = NULL;
@@ -946,10 +946,10 @@ void dcn35_plane_atomic_disable(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	pipe_ctx->plane_state = NULL;
 }
 
-void dcn35_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx)
+void dcn35_disable_plane(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx)
 {
 	struct dce_hwseq *hws = dc->hwseq;
-	bool is_phantom = dc_state_get_pipe_subvp_type(NULL, pipe_ctx) == SUBVP_PHANTOM;
+	bool is_phantom = dc_state_get_pipe_subvp_type(state, pipe_ctx) == SUBVP_PHANTOM;
 	struct timing_generator *tg = is_phantom ? pipe_ctx->stream_res.tg : NULL;
 
 	DC_LOGGER_INIT(dc->ctx->logger);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h
index 3837038dc4a8..b7bafe7fe2fd 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h
@@ -57,7 +57,7 @@ void dcn35_init_pipes(struct dc *dc, struct dc_state *context);
 void dcn35_plane_atomic_disable(struct dc *dc, struct pipe_ctx *pipe_ctx);
 void dcn35_enable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx,
 			       struct dc_state *context);
-void dcn35_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx);
+void dcn35_disable_plane(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx);
 
 void dcn35_calc_blocks_to_gate(struct dc *dc, struct dc_state *context,
 	struct pg_block_update *update_state);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
index 45dc6d4e9562..6ca8c5488d50 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
@@ -50,7 +50,7 @@ struct pg_block_update;
 struct subvp_pipe_control_lock_fast_params {
 	struct dc *dc;
 	bool lock;
-	struct pipe_ctx *pipe_ctx;
+	bool subvp_immediate_flip;
 };
 
 struct pipe_control_lock_params {
@@ -200,7 +200,7 @@ struct hw_sequencer_funcs {
 			struct dc_state *context);
 	enum dc_status (*apply_ctx_to_hw)(struct dc *dc,
 			struct dc_state *context);
-	void (*disable_plane)(struct dc *dc, struct pipe_ctx *pipe_ctx);
+	void (*disable_plane)(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx);
 	void (*disable_pixel_data)(struct dc *dc, struct pipe_ctx *pipe_ctx, bool blank);
 	void (*apply_ctx_for_surface)(struct dc *dc,
 			const struct dc_stream_state *stream,
@@ -248,6 +248,7 @@ struct hw_sequencer_funcs {
 	void (*enable_per_frame_crtc_position_reset)(struct dc *dc,
 			int group_size, struct pipe_ctx *grouped_pipes[]);
 	void (*enable_timing_synchronization)(struct dc *dc,
+			struct dc_state *state,
 			int group_index, int group_size,
 			struct pipe_ctx *grouped_pipes[]);
 	void (*enable_vblanks_synchronization)(struct dc *dc,
@@ -474,7 +475,8 @@ void hwss_build_fast_sequence(struct dc *dc,
 		unsigned int dmub_cmd_count,
 		struct block_sequence block_sequence[],
 		int *num_steps,
-		struct pipe_ctx *pipe_ctx);
+		struct pipe_ctx *pipe_ctx,
+		struct dc_stream_status *stream_status);
 
 void hwss_send_dmcub_cmd(union block_sequence_params *params);
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer_private.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer_private.h
index 82c592166875..6137cf09aa54 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer_private.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer_private.h
@@ -79,6 +79,7 @@ struct hwseq_private_funcs {
 	void (*update_plane_addr)(const struct dc *dc,
 			struct pipe_ctx *pipe_ctx);
 	void (*plane_atomic_disconnect)(struct dc *dc,
+			struct dc_state *state,
 			struct pipe_ctx *pipe_ctx);
 	void (*update_mpcc)(struct dc *dc, struct pipe_ctx *pipe_ctx);
 	bool (*set_input_transfer_func)(struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 10397d4dfb07..c3b973abb89a 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -200,11 +200,7 @@ struct resource_funcs {
 			unsigned int pipe_cnt,
             unsigned int index);
 
-	bool (*remove_phantom_pipes)(struct dc *dc, struct dc_state *context, bool fast_update);
-	void (*retain_phantom_pipes)(struct dc *dc, struct dc_state *context);
 	void (*get_panel_config_defaults)(struct dc_panel_config *panel_config);
-	void (*save_mall_state)(struct dc *dc, struct dc_state *context, struct mall_temp_config *temp_config);
-	void (*restore_mall_state)(struct dc *dc, struct dc_state *context, struct mall_temp_config *temp_config);
 	void (*build_pipe_pix_clk_params)(struct pipe_ctx *pipe_ctx);
 };
 
@@ -526,6 +522,14 @@ struct dc_state {
 	 * @stream_status: Planes status on a given stream
 	 */
 	struct dc_stream_status stream_status[MAX_PIPES];
+	/**
+	 * @phantom_streams: Stream state properties for phantoms
+	 */
+	struct dc_stream_state *phantom_streams[MAX_PHANTOM_PIPES];
+	/**
+	 * @phantom_planes: Planes state properties for phantoms
+	 */
+	struct dc_plane_state *phantom_planes[MAX_PHANTOM_PIPES];
 
 	/**
 	 * @stream_count: Total of streams in use
@@ -533,6 +537,14 @@ struct dc_state {
 	uint8_t stream_count;
 	uint8_t stream_mask;
 
+	/**
+	 * @stream_count: Total phantom streams in use
+	 */
+	uint8_t phantom_stream_count;
+	/**
+	 * @stream_count: Total phantom planes in use
+	 */
+	uint8_t phantom_plane_count;
 	/**
 	 * @res_ctx: Persistent state of resources
 	 */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
index b95ae9596c3b..dcae23faeee3 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
@@ -43,6 +43,7 @@
  * to be used inside loops and for determining array sizes.
  */
 #define MAX_PIPES 6
+#define MAX_PHANTOM_PIPES (MAX_PIPES / 2)
 #define MAX_DIG_LINK_ENCODERS 7
 #define MAX_DWB_PIPES	1
 #define MAX_HPO_DP2_ENCODERS	4
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index dbcb9c5ea9af..c4d71e7f18af 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1697,69 +1697,6 @@ static struct dc_stream_state *dcn32_enable_phantom_stream(struct dc *dc,
 	return phantom_stream;
 }
 
-void dcn32_retain_phantom_pipes(struct dc *dc, struct dc_state *context)
-{
-	int i;
-	struct dc_plane_state *phantom_plane = NULL;
-	struct dc_stream_state *phantom_stream = NULL;
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-
-		if (resource_is_pipe_type(pipe, OTG_MASTER) &&
-				resource_is_pipe_type(pipe, DPP_PIPE) &&
-				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
-			phantom_plane = pipe->plane_state;
-			phantom_stream = pipe->stream;
-
-			dc_plane_state_retain(phantom_plane);
-			dc_stream_retain(phantom_stream);
-		}
-	}
-}
-
-// return true if removed piped from ctx, false otherwise
-bool dcn32_remove_phantom_pipes(struct dc *dc, struct dc_state *context, bool fast_update)
-{
-	int i;
-	bool removed_pipe = false;
-	struct dc_plane_state *phantom_plane = NULL;
-	struct dc_stream_state *phantom_stream = NULL;
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-		// build scaling params for phantom pipes
-		if (pipe->plane_state && pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
-			phantom_plane = pipe->plane_state;
-			phantom_stream = pipe->stream;
-
-			dc_state_rem_all_planes_for_stream(dc, pipe->stream, context);
-
-			/* For non-full updates, a shallow copy of the current state
-			 * is created. In this case we don't want to erase the current
-			 * state (there can be 2 HIRQL threads, one in flip, and one in
-			 * checkMPO) that can cause a race condition.
-			 *
-			 * This is just a workaround, needs a proper fix.
-			 */
-			if (!fast_update)
-				dc_state_remove_phantom_stream(dc, context, pipe->stream);
-			else
-				dc_state_remove_stream(dc, context, pipe->stream);
-
-			/* Ref count is incremented on allocation and also when added to the context.
-			 * Therefore we must call release for the the phantom plane and stream once
-			 * they are removed from the ctx to finally decrement the refcount to 0 to free.
-			 */
-			dc_state_release_phantom_plane(dc, context, phantom_plane);
-			dc_state_release_phantom_stream(dc, context, phantom_stream);
-
-			removed_pipe = true;
-		}
-	}
-	return removed_pipe;
-}
-
 /* TODO: Input to this function should indicate which pipe indexes (or streams)
  * require a phantom pipe / stream
  */
@@ -1803,7 +1740,6 @@ static bool dml1_validate(struct dc *dc, struct dc_state *context, bool fast_val
 	int vlevel = 0;
 	int pipe_cnt = 0;
 	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_KERNEL);
-	struct mall_temp_config mall_temp_config;
 
 	/* To handle Freesync properly, setting FreeSync DML parameters
 	 * to its default state for the first stage of validation
@@ -1813,29 +1749,12 @@ static bool dml1_validate(struct dc *dc, struct dc_state *context, bool fast_val
 
 	DC_LOGGER_INIT(dc->ctx->logger);
 
-	/* For fast validation, there are situations where a shallow copy of
-	 * of the dc->current_state is created for the validation. In this case
-	 * we want to save and restore the mall config because we always
-	 * teardown subvp at the beginning of validation (and don't attempt
-	 * to add it back if it's fast validation). If we don't restore the
-	 * subvp config in cases of fast validation + shallow copy of the
-	 * dc->current_state, the dc->current_state will have a partially
-	 * removed subvp state when we did not intend to remove it.
-	 */
-	if (fast_validate) {
-		memset(&mall_temp_config, 0, sizeof(mall_temp_config));
-		dcn32_save_mall_state(dc, context, &mall_temp_config);
-	}
-
 	BW_VAL_TRACE_COUNT();
 
 	DC_FP_START();
 	out = dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, fast_validate);
 	DC_FP_END();
 
-	if (fast_validate)
-		dcn32_restore_mall_state(dc, context, &mall_temp_config);
-
 	if (pipe_cnt == 0)
 		goto validate_out;
 
@@ -2023,10 +1942,6 @@ static struct resource_funcs dcn32_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.update_soc_for_wm_a = dcn30_update_soc_for_wm_a,
 	.add_phantom_pipes = dcn32_add_phantom_pipes,
-	.remove_phantom_pipes = dcn32_remove_phantom_pipes,
-	.retain_phantom_pipes = dcn32_retain_phantom_pipes,
-	.save_mall_state = dcn32_save_mall_state,
-	.restore_mall_state = dcn32_restore_mall_state,
 	.build_pipe_pix_clk_params = dcn20_build_pipe_pix_clk_params,
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
index 9ca799da1a56..b27fadd452bb 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
@@ -91,12 +91,6 @@ bool dcn32_release_post_bldn_3dlut(
 		struct dc_3dlut **lut,
 		struct dc_transfer_func **shaper);
 
-bool dcn32_remove_phantom_pipes(struct dc *dc,
-		struct dc_state *context, bool fast_update);
-
-void dcn32_retain_phantom_pipes(struct dc *dc,
-		struct dc_state *context);
-
 void dcn32_add_phantom_pipes(struct dc *dc,
 		struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
@@ -169,14 +163,6 @@ void dcn32_determine_det_override(struct dc *dc,
 void dcn32_set_det_allocations(struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes);
 
-void dcn32_save_mall_state(struct dc *dc,
-		struct dc_state *context,
-		struct mall_temp_config *temp_config);
-
-void dcn32_restore_mall_state(struct dc *dc,
-		struct dc_state *context,
-		struct mall_temp_config *temp_config);
-
 struct dc_stream_state *dcn32_can_support_mclk_switch_using_fw_based_vblank_stretch(struct dc *dc, const struct dc_state *context);
 
 bool dcn32_allow_subvp_with_active_margin(struct pipe_ctx *pipe);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 8c278c2fd287..74412e5f03fe 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1607,10 +1607,6 @@ static struct resource_funcs dcn321_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.update_soc_for_wm_a = dcn30_update_soc_for_wm_a,
 	.add_phantom_pipes = dcn32_add_phantom_pipes,
-	.remove_phantom_pipes = dcn32_remove_phantom_pipes,
-	.retain_phantom_pipes = dcn32_retain_phantom_pipes,
-	.save_mall_state = dcn32_save_mall_state,
-	.restore_mall_state = dcn32_restore_mall_state,
 	.build_pipe_pix_clk_params = dcn20_build_pipe_pix_clk_params,
 };
 
-- 
2.37.3


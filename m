Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30E136FD0
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jan 2020 15:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E36EA40;
	Fri, 10 Jan 2020 14:47:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E776EA40
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jan 2020 14:47:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/M8nEJ5C7xqK6m2jkhL9LXfFa9080prE4ILlrf9h9A12j4MVSFtvWN71oLZXyiwrqDEEu9d6loz34IbrmWn+eqAvSIKkCrqRSdwPuK47QEPTHqb/ZT/Jyb3xxEKsfFoKTvXcZ56oy555y7ZhJjqkkF+ftOXMBtY9JVlfYmJBv2wkwEiN40fVJqDFKtiK/Yw7RGsnOY6YHsl6I3H+V2bq1N3glZobHGylnPaqdiSLP7yQlDIGmsvCrwjiGRlZlCpLTC5+hlIWTbxoWPAssvycVr4gWZ/hnhKt2SJsqrUjlWkWVauq+igd125I0T7LhypLRF9H7ohZE0D/+nSnw9f2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6h250b4aY8tXgr/HgrfkIiWqPjXve+mXgkmnuNdQAM=;
 b=eKLkb/dSRXNnAA5gN1Y9VYJm18lXdLcGtiAxkkzafQ6SKZMDadWwArGaaCvbbfiz6v58D5wrqlwQ46EIM/0LH19L1NWFQcnDdo6O7BgqOapNLOuWvYOAOOqUBdqykfkAXQBEol+bCsu/Uzb9LRv4Do1K0MRQSIl2EGwLzQAxzMGMi8J8h+9y54TYrgcZO5ibYF9SLy+aiQBZNH8Z+7aQBgJ55/JzRHp/PeAxl/1NuvgquDxMa1KmWVqSmSIJ8TtrvLxoBZAoNbfTo+6iTy4d7Klf5eDUBffBiceGT74t7KUBqV6LU13wMFez0VFY6lSE3uywgagrjvZf8YUiiM565Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6h250b4aY8tXgr/HgrfkIiWqPjXve+mXgkmnuNdQAM=;
 b=XAfDCoYluo5qMpRBH2T+eE3O8BALSaJJ2qkhYKw3xNpHiR4HQXyLb0oJY6Qr4MXvjz6pA/AoAACQUHsuTHm3W2940hSF8SgY0TrWrhVHM1BWOAaFdu6wBYhUfNXPaVykix3OcY5J8XudC3d2E0Vk11GbMDjD8GO1TiGpU2UXYCM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (52.132.180.155) by
 MW2PR12MB2524.namprd12.prod.outlook.com (52.132.180.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.11; Fri, 10 Jan 2020 14:47:36 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::699c:a877:13ef:6ae2]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::699c:a877:13ef:6ae2%6]) with mapi id 15.20.2623.011; Fri, 10 Jan 2020
 14:47:35 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 17/43] drm/amd/display: expand dml structs
Date: Fri, 10 Jan 2020 09:46:29 -0500
Message-Id: <20200110144655.55845-18-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110144655.55845-1-Rodrigo.Siqueira@amd.com>
References: <20200110144655.55845-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22)
 To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
Received: from atma2.amd.com (165.204.55.250) by
 YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.8 via Frontend Transport; Fri, 10 Jan 2020 14:47:34 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b2207f6-9486-4f4b-a2bf-08d795dc07f7
X-MS-TrafficTypeDiagnostic: MW2PR12MB2524:|MW2PR12MB2524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2524678AE5668E0ED4609BDE98380@MW2PR12MB2524.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 02788FF38E
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(8936002)(30864003)(5660300002)(6916009)(54906003)(81156014)(6486002)(81166006)(36756003)(316002)(1076003)(45954011)(2906002)(6666004)(956004)(7696005)(52116002)(478600001)(186003)(2616005)(86362001)(26005)(16526019)(66556008)(8676002)(66476007)(4326008)(66946007)(559001)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2524;
 H:MW2PR12MB2524.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4FkOu18kuz88nykmJExl6jQ1ErHen5hX8afBlCSDAjwJFeyjx6jHS3GfQ3TF+18KbG5UqgCWbv7c3yvZd8DrZ2Uz7gqmKvLkoHW8r0Fl3eMtssyRILFlwbIk2SeK9bsRZnkgwPaNtt5LKwcMhJLPkrXumV2EEh1EIh4E7wqKJP6RtrfYwzV8BcgK8OPzdBWWYxYfpyA2BzlS8ERg750vEbGBREzhbWoAqDWS2VftwJQf4e7pbpnjCSZ1SR5H7+3VG51+Jt60rx+h5RBnKMYc4uSZ8xtYYeYNKK0J/DVR+pr3GMsAHoLo3SJQgUwMjwhY2hxdwHxIQR6rtuWCI3Gi3iG5tDpMoU8/oua784Oukn4B5aHtC2t8PCp0d25nRkj/a1QudfPbgSdKYUjQcxsLhpgKXJAkwacbx+aVeuqzv1aslFumOW3fqQRVYrCUZITcNHTecDVx/5ubdTjhkFYYSdhuMK1laktHTB896ydHUU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2207f6-9486-4f4b-a2bf-08d795dc07f7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2020 14:47:35.8086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytk+edqK4JcPHPVccJVD4CDM7PGh8LzhBo15qvlZorqW4m9f7jNTjX5p6CzjiMVWHg3DsKAkm5c+IxLf0Sla0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2524
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
Cc: Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

Add more fields to support upcoming dml versions

Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  35 +++-
 .../dc/dml/dcn20/display_mode_vba_20.c        | 165 +++++++++--------
 .../dc/dml/dcn20/display_mode_vba_20v2.c      | 167 +++++++++---------
 .../dc/dml/dcn21/display_mode_vba_21.c        | 157 ++++++++--------
 .../amd/display/dc/dml/display_mode_enums.h   |  16 ++
 .../amd/display/dc/dml/display_mode_structs.h |   7 +-
 .../drm/amd/display/dc/dml/display_mode_vba.c |  22 ++-
 .../drm/amd/display/dc/dml/display_mode_vba.h | 128 ++++++++++----
 8 files changed, 402 insertions(+), 295 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index eac4c3cecadf..9233144ae74e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -1858,6 +1858,22 @@ void dcn20_populate_dml_writeback_from_context(
 
 }
 
+static int get_num_odm_heads(struct pipe_ctx *pipe)
+{
+	int odm_head_count = 0;
+	struct pipe_ctx *next_pipe = pipe->next_odm_pipe;
+	while (next_pipe) {
+		odm_head_count++;
+		next_pipe = next_pipe->next_odm_pipe;
+	}
+	pipe = pipe->prev_odm_pipe;
+	while (pipe) {
+		odm_head_count++;
+		pipe = pipe->prev_odm_pipe;
+	}
+	return odm_head_count ? odm_head_count + 1 : 0;
+}
+
 int dcn20_populate_dml_pipes_from_context(
 		struct dc *dc, struct dc_state *context, display_e2e_pipe_params_st *pipes)
 {
@@ -1897,6 +1913,8 @@ int dcn20_populate_dml_pipes_from_context(
 		pipes[pipe_cnt].pipe.src.dcc = 0;
 		pipes[pipe_cnt].pipe.src.vm = 0;*/
 
+		pipes[pipe_cnt].clks_cfg.refclk_mhz = dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000.0;
+
 		pipes[pipe_cnt].dout.dsc_enable = res_ctx->pipe_ctx[i].stream->timing.flags.DSC;
 		/* todo: rotation?*/
 		pipes[pipe_cnt].dout.dsc_slices = res_ctx->pipe_ctx[i].stream->timing.dsc_cfg.num_slices_h;
@@ -1935,8 +1953,13 @@ int dcn20_populate_dml_pipes_from_context(
 		pipes[pipe_cnt].dout.dp_lanes = 4;
 		pipes[pipe_cnt].pipe.dest.vtotal_min = res_ctx->pipe_ctx[i].stream->adjust.v_total_min;
 		pipes[pipe_cnt].pipe.dest.vtotal_max = res_ctx->pipe_ctx[i].stream->adjust.v_total_max;
-		pipes[pipe_cnt].pipe.dest.odm_combine = res_ctx->pipe_ctx[i].prev_odm_pipe
-							|| res_ctx->pipe_ctx[i].next_odm_pipe;
+		switch (get_num_odm_heads(&res_ctx->pipe_ctx[i])) {
+		case 2:
+			pipes[pipe_cnt].pipe.dest.odm_combine = dm_odm_combine_mode_2to1;
+			break;
+		default:
+			pipes[pipe_cnt].pipe.dest.odm_combine = dm_odm_combine_mode_disabled;
+		}
 		pipes[pipe_cnt].pipe.src.hsplit_grp = res_ctx->pipe_ctx[i].pipe_idx;
 		if (res_ctx->pipe_ctx[i].top_pipe && res_ctx->pipe_ctx[i].top_pipe->plane_state
 				== res_ctx->pipe_ctx[i].plane_state)
@@ -2046,6 +2069,9 @@ int dcn20_populate_dml_pipes_from_context(
 			if (pipes[pipe_cnt].pipe.src.viewport_height > 1080)
 				pipes[pipe_cnt].pipe.src.viewport_height = 1080;
 			pipes[pipe_cnt].pipe.src.surface_height_y = pipes[pipe_cnt].pipe.src.viewport_height;
+			pipes[pipe_cnt].pipe.src.surface_width_y = pipes[pipe_cnt].pipe.src.viewport_width;
+			pipes[pipe_cnt].pipe.src.surface_height_c = pipes[pipe_cnt].pipe.src.viewport_height;
+			pipes[pipe_cnt].pipe.src.surface_width_c = pipes[pipe_cnt].pipe.src.viewport_width;
 			pipes[pipe_cnt].pipe.src.data_pitch = ((pipes[pipe_cnt].pipe.src.viewport_width + 63) / 64) * 64; /* linear sw only */
 			pipes[pipe_cnt].pipe.src.source_format = dm_444_32;
 			pipes[pipe_cnt].pipe.dest.recout_width = pipes[pipe_cnt].pipe.src.viewport_width; /*vp_width/hratio*/
@@ -2079,7 +2105,10 @@ int dcn20_populate_dml_pipes_from_context(
 			pipes[pipe_cnt].pipe.src.viewport_width_c = scl->viewport_c.width;
 			pipes[pipe_cnt].pipe.src.viewport_height = scl->viewport.height;
 			pipes[pipe_cnt].pipe.src.viewport_height_c = scl->viewport_c.height;
+			pipes[pipe_cnt].pipe.src.surface_width_y = pln->plane_size.surface_size.width;
 			pipes[pipe_cnt].pipe.src.surface_height_y = pln->plane_size.surface_size.height;
+			pipes[pipe_cnt].pipe.src.surface_width_c = pln->plane_size.chroma_size.width;
+			pipes[pipe_cnt].pipe.src.surface_height_c = pln->plane_size.chroma_size.height;
 			if (pln->format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {
 				pipes[pipe_cnt].pipe.src.data_pitch = pln->plane_size.surface_pitch;
 				pipes[pipe_cnt].pipe.src.data_pitch_c = pln->plane_size.chroma_pitch;
@@ -2493,7 +2522,7 @@ int dcn20_validate_apply_pipe_split_flags(
 			split[i] = true;
 		if (dc->debug.force_odm_combine & (1 << pipe->stream_res.tg->inst)) {
 			split[i] = true;
-			context->bw_ctx.dml.vba.ODMCombineEnablePerState[vlevel][pipe_idx] = true;
+			context->bw_ctx.dml.vba.ODMCombineEnablePerState[vlevel][pipe_idx] = dm_odm_combine_mode_2to1;
 		}
 		context->bw_ctx.dml.vba.ODMCombineEnabled[pipe_idx] =
 			context->bw_ctx.dml.vba.ODMCombineEnablePerState[vlevel][pipe_idx];
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index 3b224b155e8c..16559f7fb952 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -1335,11 +1335,11 @@ static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer
 		else
 			mode_lib->vba.SwathWidthSingleDPPY[k] = mode_lib->vba.ViewportHeight[k];
 
-		if (mode_lib->vba.ODMCombineEnabled[k] == true)
+		if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
 			MainPlaneDoesODMCombine = true;
 		for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j)
 			if (mode_lib->vba.BlendingAndTiming[k] == j
-					&& mode_lib->vba.ODMCombineEnabled[j] == true)
+					&& mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
 				MainPlaneDoesODMCombine = true;
 
 		if (MainPlaneDoesODMCombine == true)
@@ -2848,12 +2848,12 @@ static void dml20_DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 			SwathWidth = mode_lib->vba.ViewportHeight[k];
 		}
 
-		if (mode_lib->vba.ODMCombineEnabled[k] == true) {
+		if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1) {
 			MainPlaneDoesODMCombine = true;
 		}
 		for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j) {
 			if (mode_lib->vba.BlendingAndTiming[k] == j
-					&& mode_lib->vba.ODMCombineEnabled[j] == true) {
+					&& mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1) {
 				MainPlaneDoesODMCombine = true;
 			}
 		}
@@ -3446,10 +3446,10 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				locals->FabricAndDRAMBandwidthPerState[i] * 1000)
 				* locals->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly / 100;
 
-		locals->ReturnBWPerState[i] = locals->ReturnBWToDCNPerState;
+		locals->ReturnBWPerState[i][0] = locals->ReturnBWToDCNPerState;
 
 		if (locals->DCCEnabledInAnyPlane == true && locals->ReturnBWToDCNPerState > locals->DCFCLKPerState[i] * locals->ReturnBusWidth / 4) {
-			locals->ReturnBWPerState[i] = dml_min(locals->ReturnBWPerState[i],
+			locals->ReturnBWPerState[i][0] = dml_min(locals->ReturnBWPerState[i][0],
 					locals->ReturnBWToDCNPerState * 4 * (1 - locals->UrgentLatency /
 					((locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024
 					/ (locals->ReturnBWToDCNPerState - locals->DCFCLKPerState[i]
@@ -3460,7 +3460,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				+ (locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024);
 
 		if (locals->DCCEnabledInAnyPlane && locals->CriticalPoint > 1 && locals->CriticalPoint < 4) {
-			locals->ReturnBWPerState[i] = dml_min(locals->ReturnBWPerState[i],
+			locals->ReturnBWPerState[i][0] = dml_min(locals->ReturnBWPerState[i][0],
 				4 * locals->ReturnBWToDCNPerState *
 				(locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024
 				* locals->ReturnBusWidth * locals->DCFCLKPerState[i] * locals->UrgentLatency /
@@ -3472,7 +3472,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				locals->DCFCLKPerState[i], locals->FabricAndDRAMBandwidthPerState[i] * 1000);
 
 		if (locals->DCCEnabledInAnyPlane == true && locals->ReturnBWToDCNPerState > locals->DCFCLKPerState[i] * locals->ReturnBusWidth / 4) {
-			locals->ReturnBWPerState[i] = dml_min(locals->ReturnBWPerState[i],
+			locals->ReturnBWPerState[i][0] = dml_min(locals->ReturnBWPerState[i][0],
 					locals->ReturnBWToDCNPerState * 4 * (1 - locals->UrgentLatency /
 					((locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024
 					/ (locals->ReturnBWToDCNPerState - locals->DCFCLKPerState[i]
@@ -3483,7 +3483,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				+ (locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024);
 
 		if (locals->DCCEnabledInAnyPlane && locals->CriticalPoint > 1 && locals->CriticalPoint < 4) {
-			locals->ReturnBWPerState[i] = dml_min(locals->ReturnBWPerState[i],
+			locals->ReturnBWPerState[i][0] = dml_min(locals->ReturnBWPerState[i][0],
 				4 * locals->ReturnBWToDCNPerState *
 				(locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024
 				* locals->ReturnBusWidth * locals->DCFCLKPerState[i] * locals->UrgentLatency /
@@ -3521,12 +3521,12 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
 		locals->UrgentRoundTripAndOutOfOrderLatencyPerState[i] =
 				(mode_lib->vba.RoundTripPingLatencyCycles + 32.0) / mode_lib->vba.DCFCLKPerState[i]
-				+ locals->UrgentOutOfOrderReturnPerChannel * mode_lib->vba.NumberOfChannels / locals->ReturnBWPerState[i];
-		if ((mode_lib->vba.ROBBufferSizeInKByte - mode_lib->vba.PixelChunkSizeInKByte) * 1024.0 / locals->ReturnBWPerState[i]
+				+ locals->UrgentOutOfOrderReturnPerChannel * mode_lib->vba.NumberOfChannels / locals->ReturnBWPerState[i][0];
+		if ((mode_lib->vba.ROBBufferSizeInKByte - mode_lib->vba.PixelChunkSizeInKByte) * 1024.0 / locals->ReturnBWPerState[i][0]
 				> locals->UrgentRoundTripAndOutOfOrderLatencyPerState[i]) {
-			locals->ROBSupport[i] = true;
+			locals->ROBSupport[i][0] = true;
 		} else {
-			locals->ROBSupport[i] = false;
+			locals->ROBSupport[i][0] = false;
 		}
 	}
 	/*Writeback Mode Support Check*/
@@ -3903,7 +3903,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				}
 				if (locals->MinDPPCLKUsingSingleDPP[k] * (1.0 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) <= mode_lib->vba.MaxDppclkRoundedDownToDFSGranularity
 						&& locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]
-						&& locals->ODMCombineEnablePerState[i][k] == false) {
+						&& locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_disabled) {
 					locals->NoOfDPP[i][j][k] = 1;
 					locals->RequiredDPPCLK[i][j][k] =
 						locals->MinDPPCLKUsingSingleDPP[k] * (1.0 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
@@ -3992,16 +3992,16 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	/*Viewport Size Check*/
 
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
-		locals->ViewportSizeSupport[i] = true;
+		locals->ViewportSizeSupport[i][0] = true;
 		for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-			if (locals->ODMCombineEnablePerState[i][k] == true) {
+			if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 				if (dml_min(locals->SwathWidthYSingleDPP[k], dml_round(mode_lib->vba.HActive[k] / 2.0 * mode_lib->vba.HRatio[k]))
 						> locals->MaximumSwathWidth[k]) {
-					locals->ViewportSizeSupport[i] = false;
+					locals->ViewportSizeSupport[i][0] = false;
 				}
 			} else {
 				if (locals->SwathWidthYSingleDPP[k] / 2.0 > locals->MaximumSwathWidth[k]) {
-					locals->ViewportSizeSupport[i] = false;
+					locals->ViewportSizeSupport[i][0] = false;
 				}
 			}
 		}
@@ -4183,8 +4183,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						mode_lib->vba.DSCFormatFactor = 1;
 					}
 					if (locals->RequiresDSC[i][k] == true) {
-						if (locals->ODMCombineEnablePerState[i][k]
-								== true) {
+						if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 							if (mode_lib->vba.PixelClockBackEnd[k] / 6.0 / mode_lib->vba.DSCFormatFactor
 									> (1.0 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * mode_lib->vba.MaxDSCCLK[i]) {
 								locals->DSCCLKRequiredMoreThanSupported[i] =
@@ -4207,7 +4206,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 		mode_lib->vba.TotalDSCUnitsRequired = 0.0;
 		for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 			if (locals->RequiresDSC[i][k] == true) {
-				if (locals->ODMCombineEnablePerState[i][k] == true) {
+				if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 					mode_lib->vba.TotalDSCUnitsRequired =
 							mode_lib->vba.TotalDSCUnitsRequired + 2.0;
 				} else {
@@ -4249,7 +4248,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				mode_lib->vba.bpp = locals->OutputBppPerState[i][k];
 			}
 			if (locals->RequiresDSC[i][k] == true && mode_lib->vba.bpp != 0.0) {
-				if (locals->ODMCombineEnablePerState[i][k] == false) {
+				if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_disabled) {
 					locals->DSCDelayPerState[i][k] =
 							dscceComputeDelay(
 									mode_lib->vba.DSCInputBitPerComponent[k],
@@ -4292,7 +4291,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
 		for (j = 0; j < 2; j++) {
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-				if (locals->ODMCombineEnablePerState[i][k] == true)
+				if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1)
 					locals->SwathWidthYPerState[i][j][k] = dml_min(locals->SwathWidthYSingleDPP[k], dml_round(locals->HActive[k] / 2 * locals->HRatio[k]));
 				else
 					locals->SwathWidthYPerState[i][j][k] = locals->SwathWidthYSingleDPP[k] / locals->NoOfDPP[i][j][k];
@@ -4345,28 +4344,28 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 				locals->EffectiveDETLBLinesLuma = dml_floor(locals->LinesInDETLuma +  dml_min(
 						locals->LinesInDETLuma * locals->RequiredDISPCLK[i][j] * locals->BytePerPixelInDETY[k] *
-						locals->PSCL_FACTOR[k] / locals->ReturnBWPerState[i],
+						locals->PSCL_FACTOR[k] / locals->ReturnBWPerState[i][0],
 						locals->EffectiveLBLatencyHidingSourceLinesLuma),
 						locals->SwathHeightYPerState[i][j][k]);
 
 				locals->EffectiveDETLBLinesChroma = dml_floor(locals->LinesInDETChroma + dml_min(
 						locals->LinesInDETChroma * locals->RequiredDISPCLK[i][j] * locals->BytePerPixelInDETC[k] *
-						locals->PSCL_FACTOR_CHROMA[k] / locals->ReturnBWPerState[i],
+						locals->PSCL_FACTOR_CHROMA[k] / locals->ReturnBWPerState[i][0],
 						locals->EffectiveLBLatencyHidingSourceLinesChroma),
 						locals->SwathHeightCPerState[i][j][k]);
 
 				if (locals->BytePerPixelInDETC[k] == 0) {
 					locals->UrgentLatencySupportUsPerState[i][j][k] = locals->EffectiveDETLBLinesLuma * (locals->HTotal[k] / locals->PixelClock[k])
 							/ locals->VRatio[k] - locals->EffectiveDETLBLinesLuma * locals->SwathWidthYPerState[i][j][k] *
-								dml_ceil(locals->BytePerPixelInDETY[k], 1) / (locals->ReturnBWPerState[i] / locals->NoOfDPP[i][j][k]);
+								dml_ceil(locals->BytePerPixelInDETY[k], 1) / (locals->ReturnBWPerState[i][0] / locals->NoOfDPP[i][j][k]);
 				} else {
 					locals->UrgentLatencySupportUsPerState[i][j][k] = dml_min(
 						locals->EffectiveDETLBLinesLuma * (locals->HTotal[k] / locals->PixelClock[k])
 						/ locals->VRatio[k] - locals->EffectiveDETLBLinesLuma * locals->SwathWidthYPerState[i][j][k] *
-						dml_ceil(locals->BytePerPixelInDETY[k], 1) / (locals->ReturnBWPerState[i] / locals->NoOfDPP[i][j][k]),
+						dml_ceil(locals->BytePerPixelInDETY[k], 1) / (locals->ReturnBWPerState[i][0] / locals->NoOfDPP[i][j][k]),
 							locals->EffectiveDETLBLinesChroma * (locals->HTotal[k] / locals->PixelClock[k]) / (locals->VRatio[k] / 2) -
 							locals->EffectiveDETLBLinesChroma * locals->SwathWidthYPerState[i][j][k] / 2 *
-							dml_ceil(locals->BytePerPixelInDETC[k], 2) / (locals->ReturnBWPerState[i] / locals->NoOfDPP[i][j][k]));
+							dml_ceil(locals->BytePerPixelInDETC[k], 2) / (locals->ReturnBWPerState[i][0] / locals->NoOfDPP[i][j][k]));
 				}
 			}
 		}
@@ -4406,14 +4405,14 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				locals->SwathHeightYThisState[k] = locals->SwathHeightYPerState[i][j][k];
 				locals->SwathHeightCThisState[k] = locals->SwathHeightCPerState[i][j][k];
 				locals->SwathWidthYThisState[k] = locals->SwathWidthYPerState[i][j][k];
-				mode_lib->vba.ProjectedDCFCLKDeepSleep = dml_max(
-						mode_lib->vba.ProjectedDCFCLKDeepSleep,
+				mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] = dml_max(
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 						mode_lib->vba.PixelClock[k] / 16.0);
 				if (mode_lib->vba.BytePerPixelInDETC[k] == 0.0) {
 					if (mode_lib->vba.VRatio[k] <= 1.0) {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETY[k],
@@ -4423,9 +4422,9 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 												* mode_lib->vba.PixelClock[k]
 												/ mode_lib->vba.NoOfDPP[i][j][k]);
 					} else {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETY[k],
@@ -4436,9 +4435,9 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					}
 				} else {
 					if (mode_lib->vba.VRatio[k] <= 1.0) {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETY[k],
@@ -4448,9 +4447,9 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 												* mode_lib->vba.PixelClock[k]
 												/ mode_lib->vba.NoOfDPP[i][j][k]);
 					} else {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETY[k],
@@ -4460,9 +4459,9 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 												* mode_lib->vba.RequiredDPPCLK[i][j][k]);
 					}
 					if (mode_lib->vba.VRatio[k] / 2.0 <= 1.0) {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETC[k],
@@ -4473,9 +4472,9 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 												* mode_lib->vba.PixelClock[k]
 												/ mode_lib->vba.NoOfDPP[i][j][k]);
 					} else {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETC[k],
@@ -4511,7 +4510,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						&mode_lib->vba.PTEBufferSizeNotExceededY[i][j][k],
 						&mode_lib->vba.dpte_row_height[k],
 						&mode_lib->vba.meta_row_height[k]);
-				mode_lib->vba.PrefetchLinesY[k] = CalculatePrefetchSourceLines(
+				mode_lib->vba.PrefetchLinesY[0][0][k] = CalculatePrefetchSourceLines(
 						mode_lib,
 						mode_lib->vba.VRatio[k],
 						mode_lib->vba.vtaps[k],
@@ -4550,7 +4549,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							&mode_lib->vba.PTEBufferSizeNotExceededC[i][j][k],
 							&mode_lib->vba.dpte_row_height_chroma[k],
 							&mode_lib->vba.meta_row_height_chroma[k]);
-					mode_lib->vba.PrefetchLinesC[k] = CalculatePrefetchSourceLines(
+					mode_lib->vba.PrefetchLinesC[0][0][k] = CalculatePrefetchSourceLines(
 							mode_lib,
 							mode_lib->vba.VRatio[k] / 2.0,
 							mode_lib->vba.VTAPsChroma[k],
@@ -4564,14 +4563,14 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					mode_lib->vba.PDEAndMetaPTEBytesPerFrameC = 0.0;
 					mode_lib->vba.MetaRowBytesC = 0.0;
 					mode_lib->vba.DPTEBytesPerRowC = 0.0;
-					locals->PrefetchLinesC[k] = 0.0;
+					locals->PrefetchLinesC[0][0][k] = 0.0;
 					locals->PTEBufferSizeNotExceededC[i][j][k] = true;
 					locals->PTEBufferSizeInRequestsForLuma = mode_lib->vba.PTEBufferSizeInRequestsLuma + mode_lib->vba.PTEBufferSizeInRequestsChroma;
 				}
-				locals->PDEAndMetaPTEBytesPerFrame[k] =
+				locals->PDEAndMetaPTEBytesPerFrame[0][0][k] =
 						mode_lib->vba.PDEAndMetaPTEBytesPerFrameY + mode_lib->vba.PDEAndMetaPTEBytesPerFrameC;
-				locals->MetaRowBytes[k] = mode_lib->vba.MetaRowBytesY + mode_lib->vba.MetaRowBytesC;
-				locals->DPTEBytesPerRow[k] = mode_lib->vba.DPTEBytesPerRowY + mode_lib->vba.DPTEBytesPerRowC;
+				locals->MetaRowBytes[0][0][k] = mode_lib->vba.MetaRowBytesY + mode_lib->vba.MetaRowBytesC;
+				locals->DPTEBytesPerRow[0][0][k] = mode_lib->vba.DPTEBytesPerRowY + mode_lib->vba.DPTEBytesPerRowC;
 
 				CalculateActiveRowBandwidth(
 						mode_lib->vba.GPUVMEnable,
@@ -4598,14 +4597,14 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 									+ mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j]
 											* mode_lib->vba.MetaChunkSize)
 									* 1024.0
-									/ mode_lib->vba.ReturnBWPerState[i];
+									/ mode_lib->vba.ReturnBWPerState[i][0];
 			if (mode_lib->vba.GPUVMEnable == true) {
 				mode_lib->vba.ExtraLatency = mode_lib->vba.ExtraLatency
 						+ mode_lib->vba.TotalNumberOfActiveDPP[i][j]
 								* mode_lib->vba.PTEGroupSize
-								/ mode_lib->vba.ReturnBWPerState[i];
+								/ mode_lib->vba.ReturnBWPerState[i][0];
 			}
-			mode_lib->vba.TimeCalc = 24.0 / mode_lib->vba.ProjectedDCFCLKDeepSleep;
+			mode_lib->vba.TimeCalc = 24.0 / mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0];
 
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 				if (mode_lib->vba.BlendingAndTiming[k] == k) {
@@ -4655,7 +4654,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			}
 
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-				locals->MaximumVStartup[k] = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k]
+				locals->MaximumVStartup[0][0][k] = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k]
 					- dml_max(1.0, dml_ceil(locals->WritebackDelay[i][k] / (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]), 1.0));
 			}
 
@@ -4700,7 +4699,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 									mode_lib->vba.RequiredDPPCLK[i][j][k],
 									mode_lib->vba.RequiredDISPCLK[i][j],
 									mode_lib->vba.PixelClock[k],
-									mode_lib->vba.ProjectedDCFCLKDeepSleep,
+									mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 									mode_lib->vba.DSCDelayPerState[i][k],
 									mode_lib->vba.NoOfDPP[i][j][k],
 									mode_lib->vba.ScalerEnabled[k],
@@ -4718,7 +4717,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 											- mode_lib->vba.VActive[k],
 									mode_lib->vba.HTotal[k],
 									mode_lib->vba.MaxInterDCNTileRepeaters,
-									mode_lib->vba.MaximumVStartup[k],
+									mode_lib->vba.MaximumVStartup[0][0][k],
 									mode_lib->vba.GPUVMMaxPageTableLevels,
 									mode_lib->vba.GPUVMEnable,
 									mode_lib->vba.DynamicMetadataEnable[k],
@@ -4728,15 +4727,15 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 									mode_lib->vba.UrgentLatencyPixelDataOnly,
 									mode_lib->vba.ExtraLatency,
 									mode_lib->vba.TimeCalc,
-									mode_lib->vba.PDEAndMetaPTEBytesPerFrame[k],
-									mode_lib->vba.MetaRowBytes[k],
-									mode_lib->vba.DPTEBytesPerRow[k],
-									mode_lib->vba.PrefetchLinesY[k],
+									mode_lib->vba.PDEAndMetaPTEBytesPerFrame[0][0][k],
+									mode_lib->vba.MetaRowBytes[0][0][k],
+									mode_lib->vba.DPTEBytesPerRow[0][0][k],
+									mode_lib->vba.PrefetchLinesY[0][0][k],
 									mode_lib->vba.SwathWidthYPerState[i][j][k],
 									mode_lib->vba.BytePerPixelInDETY[k],
 									mode_lib->vba.PrefillY[k],
 									mode_lib->vba.MaxNumSwY[k],
-									mode_lib->vba.PrefetchLinesC[k],
+									mode_lib->vba.PrefetchLinesC[0][0][k],
 									mode_lib->vba.BytePerPixelInDETC[k],
 									mode_lib->vba.PrefillC[k],
 									mode_lib->vba.MaxNumSwC[k],
@@ -4767,19 +4766,19 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				locals->prefetch_vm_bw_valid = true;
 				locals->prefetch_row_bw_valid = true;
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-					if (locals->PDEAndMetaPTEBytesPerFrame[k] == 0)
+					if (locals->PDEAndMetaPTEBytesPerFrame[0][0][k] == 0)
 						locals->prefetch_vm_bw[k] = 0;
 					else if (locals->LinesForMetaPTE[k] > 0)
-						locals->prefetch_vm_bw[k] = locals->PDEAndMetaPTEBytesPerFrame[k]
+						locals->prefetch_vm_bw[k] = locals->PDEAndMetaPTEBytesPerFrame[0][0][k]
 							/ (locals->LinesForMetaPTE[k] * locals->HTotal[k] / locals->PixelClock[k]);
 					else {
 						locals->prefetch_vm_bw[k] = 0;
 						locals->prefetch_vm_bw_valid = false;
 					}
-					if (locals->MetaRowBytes[k] + locals->DPTEBytesPerRow[k] == 0)
+					if (locals->MetaRowBytes[0][0][k] + locals->DPTEBytesPerRow[0][0][k] == 0)
 						locals->prefetch_row_bw[k] = 0;
 					else if (locals->LinesForMetaAndDPTERow[k] > 0)
-						locals->prefetch_row_bw[k] = (locals->MetaRowBytes[k] + locals->DPTEBytesPerRow[k])
+						locals->prefetch_row_bw[k] = (locals->MetaRowBytes[0][0][k] + locals->DPTEBytesPerRow[0][0][k])
 							/ (locals->LinesForMetaAndDPTERow[k] * locals->HTotal[k] / locals->PixelClock[k]);
 					else {
 						locals->prefetch_row_bw[k] = 0;
@@ -4798,13 +4797,13 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 											mode_lib->vba.RequiredPrefetchPixelDataBWLuma[i][j][k])
 											+ mode_lib->vba.meta_row_bw[k] + mode_lib->vba.dpte_row_bw[k]);
 				}
-				locals->BandwidthWithoutPrefetchSupported[i] = true;
-				if (mode_lib->vba.MaximumReadBandwidthWithoutPrefetch > locals->ReturnBWPerState[i]) {
-					locals->BandwidthWithoutPrefetchSupported[i] = false;
+				locals->BandwidthWithoutPrefetchSupported[i][0] = true;
+				if (mode_lib->vba.MaximumReadBandwidthWithoutPrefetch > locals->ReturnBWPerState[i][0]) {
+					locals->BandwidthWithoutPrefetchSupported[i][0] = false;
 				}
 
 				locals->PrefetchSupported[i][j] = true;
-				if (mode_lib->vba.MaximumReadBandwidthWithPrefetch > locals->ReturnBWPerState[i]) {
+				if (mode_lib->vba.MaximumReadBandwidthWithPrefetch > locals->ReturnBWPerState[i][0]) {
 					locals->PrefetchSupported[i][j] = false;
 				}
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
@@ -4829,7 +4828,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			if (mode_lib->vba.PrefetchSupported[i][j] == true
 					&& mode_lib->vba.VRatioInPrefetchSupported[i][j] == true) {
 				mode_lib->vba.BandwidthAvailableForImmediateFlip =
-						mode_lib->vba.ReturnBWPerState[i];
+						mode_lib->vba.ReturnBWPerState[i][0];
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 					mode_lib->vba.BandwidthAvailableForImmediateFlip =
 							mode_lib->vba.BandwidthAvailableForImmediateFlip
@@ -4843,9 +4842,9 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					if ((mode_lib->vba.SourcePixelFormat[k] != dm_420_8
 							&& mode_lib->vba.SourcePixelFormat[k] != dm_420_10)) {
 						mode_lib->vba.ImmediateFlipBytes[k] =
-								mode_lib->vba.PDEAndMetaPTEBytesPerFrame[k]
-										+ mode_lib->vba.MetaRowBytes[k]
-										+ mode_lib->vba.DPTEBytesPerRow[k];
+								mode_lib->vba.PDEAndMetaPTEBytesPerFrame[0][0][k]
+										+ mode_lib->vba.MetaRowBytes[0][0][k]
+										+ mode_lib->vba.DPTEBytesPerRow[0][0][k];
 					}
 				}
 				mode_lib->vba.TotImmediateFlipBytes = 0.0;
@@ -4873,9 +4872,9 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 									/ mode_lib->vba.PixelClock[k],
 							mode_lib->vba.VRatio[k],
 							mode_lib->vba.Tno_bw[k],
-							mode_lib->vba.PDEAndMetaPTEBytesPerFrame[k],
-							mode_lib->vba.MetaRowBytes[k],
-							mode_lib->vba.DPTEBytesPerRow[k],
+							mode_lib->vba.PDEAndMetaPTEBytesPerFrame[0][0][k],
+							mode_lib->vba.MetaRowBytes[0][0][k],
+							mode_lib->vba.DPTEBytesPerRow[0][0][k],
 							mode_lib->vba.DCCEnable[k],
 							mode_lib->vba.dpte_row_height[k],
 							mode_lib->vba.meta_row_height[k],
@@ -4900,7 +4899,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				}
 				mode_lib->vba.ImmediateFlipSupportedForState[i][j] = true;
 				if (mode_lib->vba.total_dcn_read_bw_with_flip
-						> mode_lib->vba.ReturnBWPerState[i]) {
+						> mode_lib->vba.ReturnBWPerState[i][0]) {
 					mode_lib->vba.ImmediateFlipSupportedForState[i][j] = false;
 				}
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
@@ -4919,13 +4918,13 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; k++)
 		mode_lib->vba.MaxTotalVActiveRDBandwidth = mode_lib->vba.MaxTotalVActiveRDBandwidth + mode_lib->vba.ReadBandwidth[k];
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
-		mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i] = dml_min(mode_lib->vba.ReturnBusWidth *
+		mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i][0] = dml_min(mode_lib->vba.ReturnBusWidth *
 				mode_lib->vba.DCFCLKPerState[i], mode_lib->vba.FabricAndDRAMBandwidthPerState[i] * 1000) *
 				mode_lib->vba.MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperation / 100;
-		if (mode_lib->vba.MaxTotalVActiveRDBandwidth <= mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i])
-			mode_lib->vba.TotalVerticalActiveBandwidthSupport[i] = true;
+		if (mode_lib->vba.MaxTotalVActiveRDBandwidth <= mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i][0])
+			mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][0] = true;
 		else
-			mode_lib->vba.TotalVerticalActiveBandwidthSupport[i] = false;
+			mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][0] = false;
 	}
 
 	/*PTE Buffer Size Check*/
@@ -5013,7 +5012,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				status = DML_FAIL_SCALE_RATIO_TAP;
 			} else if (mode_lib->vba.SourceFormatPixelAndScanSupport != true) {
 				status = DML_FAIL_SOURCE_PIXEL_FORMAT;
-			} else if (locals->ViewportSizeSupport[i] != true) {
+			} else if (locals->ViewportSizeSupport[i][0] != true) {
 				status = DML_FAIL_VIEWPORT_SIZE;
 			} else if (locals->DIOSupport[i] != true) {
 				status = DML_FAIL_DIO_SUPPORT;
@@ -5023,7 +5022,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				status = DML_FAIL_DSC_CLK_REQUIRED;
 			} else if (locals->UrgentLatencySupport[i][j] != true) {
 				status = DML_FAIL_URGENT_LATENCY;
-			} else if (locals->ROBSupport[i] != true) {
+			} else if (locals->ROBSupport[i][0] != true) {
 				status = DML_FAIL_REORDERING_BUFFER;
 			} else if (locals->DISPCLK_DPPCLK_Support[i][j] != true) {
 				status = DML_FAIL_DISPCLK_DPPCLK;
@@ -5043,7 +5042,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				status = DML_FAIL_PITCH_SUPPORT;
 			} else if (locals->PrefetchSupported[i][j] != true) {
 				status = DML_FAIL_PREFETCH_SUPPORT;
-			} else if (locals->TotalVerticalActiveBandwidthSupport[i] != true) {
+			} else if (locals->TotalVerticalActiveBandwidthSupport[i][0] != true) {
 				status = DML_FAIL_TOTAL_V_ACTIVE_BW;
 			} else if (locals->VRatioInPrefetchSupported[i][j] != true) {
 				status = DML_FAIL_V_RATIO_PREFETCH;
@@ -5089,7 +5088,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	mode_lib->vba.DRAMSpeed = mode_lib->vba.DRAMSpeedPerState[mode_lib->vba.VoltageLevel];
 	mode_lib->vba.FabricClock = mode_lib->vba.FabricClockPerState[mode_lib->vba.VoltageLevel];
 	mode_lib->vba.SOCCLK = mode_lib->vba.SOCCLKPerState[mode_lib->vba.VoltageLevel];
-	mode_lib->vba.ReturnBW = locals->ReturnBWPerState[mode_lib->vba.VoltageLevel];
+	mode_lib->vba.ReturnBW = locals->ReturnBWPerState[mode_lib->vba.VoltageLevel][0];
 	mode_lib->vba.FabricAndDRAMBandwidth = locals->FabricAndDRAMBandwidthPerState[mode_lib->vba.VoltageLevel];
 	for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 		if (mode_lib->vba.BlendingAndTiming[k] == k) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index 6482d7b99bae..d6fedae03dc8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -1395,11 +1395,11 @@ static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP
 		else
 			mode_lib->vba.SwathWidthSingleDPPY[k] = mode_lib->vba.ViewportHeight[k];
 
-		if (mode_lib->vba.ODMCombineEnabled[k] == true)
+		if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
 			MainPlaneDoesODMCombine = true;
 		for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j)
 			if (mode_lib->vba.BlendingAndTiming[k] == j
-					&& mode_lib->vba.ODMCombineEnabled[j] == true)
+					&& mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
 				MainPlaneDoesODMCombine = true;
 
 		if (MainPlaneDoesODMCombine == true)
@@ -2885,12 +2885,12 @@ static void dml20v2_DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 			SwathWidth = mode_lib->vba.ViewportHeight[k];
 		}
 
-		if (mode_lib->vba.ODMCombineEnabled[k] == true) {
+		if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1) {
 			MainPlaneDoesODMCombine = true;
 		}
 		for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j) {
 			if (mode_lib->vba.BlendingAndTiming[k] == j
-					&& mode_lib->vba.ODMCombineEnabled[j] == true) {
+					&& mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1) {
 				MainPlaneDoesODMCombine = true;
 			}
 		}
@@ -3483,10 +3483,10 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				locals->FabricAndDRAMBandwidthPerState[i] * 1000)
 				* locals->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly / 100;
 
-		locals->ReturnBWPerState[i] = locals->ReturnBWToDCNPerState;
+		locals->ReturnBWPerState[i][0] = locals->ReturnBWToDCNPerState;
 
 		if (locals->DCCEnabledInAnyPlane == true && locals->ReturnBWToDCNPerState > locals->DCFCLKPerState[i] * locals->ReturnBusWidth / 4) {
-			locals->ReturnBWPerState[i] = dml_min(locals->ReturnBWPerState[i],
+			locals->ReturnBWPerState[i][0] = dml_min(locals->ReturnBWPerState[i][0],
 					locals->ReturnBWToDCNPerState * 4 * (1 - locals->UrgentLatency /
 					((locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024
 					/ (locals->ReturnBWToDCNPerState - locals->DCFCLKPerState[i]
@@ -3497,7 +3497,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				+ (locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024);
 
 		if (locals->DCCEnabledInAnyPlane && locals->CriticalPoint > 1 && locals->CriticalPoint < 4) {
-			locals->ReturnBWPerState[i] = dml_min(locals->ReturnBWPerState[i],
+			locals->ReturnBWPerState[i][0] = dml_min(locals->ReturnBWPerState[i][0],
 				4 * locals->ReturnBWToDCNPerState *
 				(locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024
 				* locals->ReturnBusWidth * locals->DCFCLKPerState[i] * locals->UrgentLatency /
@@ -3509,7 +3509,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				locals->DCFCLKPerState[i], locals->FabricAndDRAMBandwidthPerState[i] * 1000);
 
 		if (locals->DCCEnabledInAnyPlane == true && locals->ReturnBWToDCNPerState > locals->DCFCLKPerState[i] * locals->ReturnBusWidth / 4) {
-			locals->ReturnBWPerState[i] = dml_min(locals->ReturnBWPerState[i],
+			locals->ReturnBWPerState[i][0] = dml_min(locals->ReturnBWPerState[i][0],
 					locals->ReturnBWToDCNPerState * 4 * (1 - locals->UrgentLatency /
 					((locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024
 					/ (locals->ReturnBWToDCNPerState - locals->DCFCLKPerState[i]
@@ -3520,7 +3520,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				+ (locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024);
 
 		if (locals->DCCEnabledInAnyPlane && locals->CriticalPoint > 1 && locals->CriticalPoint < 4) {
-			locals->ReturnBWPerState[i] = dml_min(locals->ReturnBWPerState[i],
+			locals->ReturnBWPerState[i][0] = dml_min(locals->ReturnBWPerState[i][0],
 				4 * locals->ReturnBWToDCNPerState *
 				(locals->ROBBufferSizeInKByte - locals->PixelChunkSizeInKByte) * 1024
 				* locals->ReturnBusWidth * locals->DCFCLKPerState[i] * locals->UrgentLatency /
@@ -3558,12 +3558,12 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
 		locals->UrgentRoundTripAndOutOfOrderLatencyPerState[i] =
 				(mode_lib->vba.RoundTripPingLatencyCycles + 32.0) / mode_lib->vba.DCFCLKPerState[i]
-				+ locals->UrgentOutOfOrderReturnPerChannel * mode_lib->vba.NumberOfChannels / locals->ReturnBWPerState[i];
-		if ((mode_lib->vba.ROBBufferSizeInKByte - mode_lib->vba.PixelChunkSizeInKByte) * 1024.0 / locals->ReturnBWPerState[i]
+				+ locals->UrgentOutOfOrderReturnPerChannel * mode_lib->vba.NumberOfChannels / locals->ReturnBWPerState[i][0];
+		if ((mode_lib->vba.ROBBufferSizeInKByte - mode_lib->vba.PixelChunkSizeInKByte) * 1024.0 / locals->ReturnBWPerState[i][0]
 				> locals->UrgentRoundTripAndOutOfOrderLatencyPerState[i]) {
-			locals->ROBSupport[i] = true;
+			locals->ROBSupport[i][0] = true;
 		} else {
-			locals->ROBSupport[i] = false;
+			locals->ROBSupport[i][0] = false;
 		}
 	}
 	/*Writeback Mode Support Check*/
@@ -3946,7 +3946,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				}
 				if (locals->MinDPPCLKUsingSingleDPP[k] * (1.0 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) <= mode_lib->vba.MaxDppclkRoundedDownToDFSGranularity
 						&& locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]
-						&& locals->ODMCombineEnablePerState[i][k] == false) {
+						&& locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_disabled) {
 					locals->NoOfDPP[i][j][k] = 1;
 					locals->RequiredDPPCLK[i][j][k] =
 						locals->MinDPPCLKUsingSingleDPP[k] * (1.0 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
@@ -4035,16 +4035,16 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 	/*Viewport Size Check*/
 
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
-		locals->ViewportSizeSupport[i] = true;
+		locals->ViewportSizeSupport[i][0] = true;
 		for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-			if (locals->ODMCombineEnablePerState[i][k] == true) {
+			if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 				if (dml_min(locals->SwathWidthYSingleDPP[k], dml_round(mode_lib->vba.HActive[k] / 2.0 * mode_lib->vba.HRatio[k]))
 						> locals->MaximumSwathWidth[k]) {
-					locals->ViewportSizeSupport[i] = false;
+					locals->ViewportSizeSupport[i][0] = false;
 				}
 			} else {
 				if (locals->SwathWidthYSingleDPP[k] / 2.0 > locals->MaximumSwathWidth[k]) {
-					locals->ViewportSizeSupport[i] = false;
+					locals->ViewportSizeSupport[i][0] = false;
 				}
 			}
 		}
@@ -4226,8 +4226,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 						mode_lib->vba.DSCFormatFactor = 1;
 					}
 					if (locals->RequiresDSC[i][k] == true) {
-						if (locals->ODMCombineEnablePerState[i][k]
-								== true) {
+						if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 							if (mode_lib->vba.PixelClockBackEnd[k] / 6.0 / mode_lib->vba.DSCFormatFactor
 									> (1.0 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * mode_lib->vba.MaxDSCCLK[i]) {
 								locals->DSCCLKRequiredMoreThanSupported[i] =
@@ -4250,7 +4249,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 		mode_lib->vba.TotalDSCUnitsRequired = 0.0;
 		for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 			if (locals->RequiresDSC[i][k] == true) {
-				if (locals->ODMCombineEnablePerState[i][k] == true) {
+				if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 					mode_lib->vba.TotalDSCUnitsRequired =
 							mode_lib->vba.TotalDSCUnitsRequired + 2.0;
 				} else {
@@ -4292,7 +4291,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				mode_lib->vba.bpp = locals->OutputBppPerState[i][k];
 			}
 			if (locals->RequiresDSC[i][k] == true && mode_lib->vba.bpp != 0.0) {
-				if (locals->ODMCombineEnablePerState[i][k] == false) {
+				if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_disabled) {
 					locals->DSCDelayPerState[i][k] =
 							dscceComputeDelay(
 									mode_lib->vba.DSCInputBitPerComponent[k],
@@ -4335,7 +4334,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
 		for (j = 0; j < 2; j++) {
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-				if (locals->ODMCombineEnablePerState[i][k] == true)
+				if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1)
 					locals->SwathWidthYPerState[i][j][k] = dml_min(locals->SwathWidthYSingleDPP[k], dml_round(locals->HActive[k] / 2 * locals->HRatio[k]));
 				else
 					locals->SwathWidthYPerState[i][j][k] = locals->SwathWidthYSingleDPP[k] / locals->NoOfDPP[i][j][k];
@@ -4388,28 +4387,28 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 
 				locals->EffectiveDETLBLinesLuma = dml_floor(locals->LinesInDETLuma +  dml_min(
 						locals->LinesInDETLuma * locals->RequiredDISPCLK[i][j] * locals->BytePerPixelInDETY[k] *
-						locals->PSCL_FACTOR[k] / locals->ReturnBWPerState[i],
+						locals->PSCL_FACTOR[k] / locals->ReturnBWPerState[i][0],
 						locals->EffectiveLBLatencyHidingSourceLinesLuma),
 						locals->SwathHeightYPerState[i][j][k]);
 
 				locals->EffectiveDETLBLinesChroma = dml_floor(locals->LinesInDETChroma + dml_min(
 						locals->LinesInDETChroma * locals->RequiredDISPCLK[i][j] * locals->BytePerPixelInDETC[k] *
-						locals->PSCL_FACTOR_CHROMA[k] / locals->ReturnBWPerState[i],
+						locals->PSCL_FACTOR_CHROMA[k] / locals->ReturnBWPerState[i][0],
 						locals->EffectiveLBLatencyHidingSourceLinesChroma),
 						locals->SwathHeightCPerState[i][j][k]);
 
 				if (locals->BytePerPixelInDETC[k] == 0) {
 					locals->UrgentLatencySupportUsPerState[i][j][k] = locals->EffectiveDETLBLinesLuma * (locals->HTotal[k] / locals->PixelClock[k])
 							/ locals->VRatio[k] - locals->EffectiveDETLBLinesLuma * locals->SwathWidthYPerState[i][j][k] *
-								dml_ceil(locals->BytePerPixelInDETY[k], 1) / (locals->ReturnBWPerState[i] / locals->NoOfDPP[i][j][k]);
+								dml_ceil(locals->BytePerPixelInDETY[k], 1) / (locals->ReturnBWPerState[i][0] / locals->NoOfDPP[i][j][k]);
 				} else {
 					locals->UrgentLatencySupportUsPerState[i][j][k] = dml_min(
 						locals->EffectiveDETLBLinesLuma * (locals->HTotal[k] / locals->PixelClock[k])
 						/ locals->VRatio[k] - locals->EffectiveDETLBLinesLuma * locals->SwathWidthYPerState[i][j][k] *
-						dml_ceil(locals->BytePerPixelInDETY[k], 1) / (locals->ReturnBWPerState[i] / locals->NoOfDPP[i][j][k]),
+						dml_ceil(locals->BytePerPixelInDETY[k], 1) / (locals->ReturnBWPerState[i][0] / locals->NoOfDPP[i][j][k]),
 							locals->EffectiveDETLBLinesChroma * (locals->HTotal[k] / locals->PixelClock[k]) / (locals->VRatio[k] / 2) -
 							locals->EffectiveDETLBLinesChroma * locals->SwathWidthYPerState[i][j][k] / 2 *
-							dml_ceil(locals->BytePerPixelInDETC[k], 2) / (locals->ReturnBWPerState[i] / locals->NoOfDPP[i][j][k]));
+							dml_ceil(locals->BytePerPixelInDETC[k], 2) / (locals->ReturnBWPerState[i][0] / locals->NoOfDPP[i][j][k]));
 				}
 			}
 		}
@@ -4454,14 +4453,14 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				locals->SwathHeightYThisState[k] = locals->SwathHeightYPerState[i][j][k];
 				locals->SwathHeightCThisState[k] = locals->SwathHeightCPerState[i][j][k];
 				locals->SwathWidthYThisState[k] = locals->SwathWidthYPerState[i][j][k];
-				mode_lib->vba.ProjectedDCFCLKDeepSleep = dml_max(
-						mode_lib->vba.ProjectedDCFCLKDeepSleep,
+				mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] = dml_max(
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 						mode_lib->vba.PixelClock[k] / 16.0);
 				if (mode_lib->vba.BytePerPixelInDETC[k] == 0.0) {
 					if (mode_lib->vba.VRatio[k] <= 1.0) {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETY[k],
@@ -4471,9 +4470,9 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 												* mode_lib->vba.PixelClock[k]
 												/ mode_lib->vba.NoOfDPP[i][j][k]);
 					} else {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETY[k],
@@ -4484,9 +4483,9 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 					}
 				} else {
 					if (mode_lib->vba.VRatio[k] <= 1.0) {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETY[k],
@@ -4496,9 +4495,9 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 												* mode_lib->vba.PixelClock[k]
 												/ mode_lib->vba.NoOfDPP[i][j][k]);
 					} else {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETY[k],
@@ -4508,9 +4507,9 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 												* mode_lib->vba.RequiredDPPCLK[i][j][k]);
 					}
 					if (mode_lib->vba.VRatio[k] / 2.0 <= 1.0) {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETC[k],
@@ -4521,9 +4520,9 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 												* mode_lib->vba.PixelClock[k]
 												/ mode_lib->vba.NoOfDPP[i][j][k]);
 					} else {
-						mode_lib->vba.ProjectedDCFCLKDeepSleep =
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0] =
 								dml_max(
-										mode_lib->vba.ProjectedDCFCLKDeepSleep,
+										mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 										1.1
 												* dml_ceil(
 														mode_lib->vba.BytePerPixelInDETC[k],
@@ -4559,7 +4558,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 						&mode_lib->vba.PTEBufferSizeNotExceededY[i][j][k],
 						&mode_lib->vba.dpte_row_height[k],
 						&mode_lib->vba.meta_row_height[k]);
-				mode_lib->vba.PrefetchLinesY[k] = CalculatePrefetchSourceLines(
+				mode_lib->vba.PrefetchLinesY[0][0][k] = CalculatePrefetchSourceLines(
 						mode_lib,
 						mode_lib->vba.VRatio[k],
 						mode_lib->vba.vtaps[k],
@@ -4598,7 +4597,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 							&mode_lib->vba.PTEBufferSizeNotExceededC[i][j][k],
 							&mode_lib->vba.dpte_row_height_chroma[k],
 							&mode_lib->vba.meta_row_height_chroma[k]);
-					mode_lib->vba.PrefetchLinesC[k] = CalculatePrefetchSourceLines(
+					mode_lib->vba.PrefetchLinesC[0][0][k] = CalculatePrefetchSourceLines(
 							mode_lib,
 							mode_lib->vba.VRatio[k] / 2.0,
 							mode_lib->vba.VTAPsChroma[k],
@@ -4612,14 +4611,14 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 					mode_lib->vba.PDEAndMetaPTEBytesPerFrameC = 0.0;
 					mode_lib->vba.MetaRowBytesC = 0.0;
 					mode_lib->vba.DPTEBytesPerRowC = 0.0;
-					locals->PrefetchLinesC[k] = 0.0;
+					locals->PrefetchLinesC[0][0][k] = 0.0;
 					locals->PTEBufferSizeNotExceededC[i][j][k] = true;
 					locals->PTEBufferSizeInRequestsForLuma = mode_lib->vba.PTEBufferSizeInRequestsLuma + mode_lib->vba.PTEBufferSizeInRequestsChroma;
 				}
-				locals->PDEAndMetaPTEBytesPerFrame[k] =
+				locals->PDEAndMetaPTEBytesPerFrame[0][0][k] =
 						mode_lib->vba.PDEAndMetaPTEBytesPerFrameY + mode_lib->vba.PDEAndMetaPTEBytesPerFrameC;
-				locals->MetaRowBytes[k] = mode_lib->vba.MetaRowBytesY + mode_lib->vba.MetaRowBytesC;
-				locals->DPTEBytesPerRow[k] = mode_lib->vba.DPTEBytesPerRowY + mode_lib->vba.DPTEBytesPerRowC;
+				locals->MetaRowBytes[0][0][k] = mode_lib->vba.MetaRowBytesY + mode_lib->vba.MetaRowBytesC;
+				locals->DPTEBytesPerRow[0][0][k] = mode_lib->vba.DPTEBytesPerRowY + mode_lib->vba.DPTEBytesPerRowC;
 
 				CalculateActiveRowBandwidth(
 						mode_lib->vba.GPUVMEnable,
@@ -4646,14 +4645,14 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 									+ mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j]
 											* mode_lib->vba.MetaChunkSize)
 									* 1024.0
-									/ mode_lib->vba.ReturnBWPerState[i];
+									/ mode_lib->vba.ReturnBWPerState[i][0];
 			if (mode_lib->vba.GPUVMEnable == true) {
 				mode_lib->vba.ExtraLatency = mode_lib->vba.ExtraLatency
 						+ mode_lib->vba.TotalNumberOfActiveDPP[i][j]
 								* mode_lib->vba.PTEGroupSize
-								/ mode_lib->vba.ReturnBWPerState[i];
+								/ mode_lib->vba.ReturnBWPerState[i][0];
 			}
-			mode_lib->vba.TimeCalc = 24.0 / mode_lib->vba.ProjectedDCFCLKDeepSleep;
+			mode_lib->vba.TimeCalc = 24.0 / mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0];
 
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 				if (mode_lib->vba.BlendingAndTiming[k] == k) {
@@ -4703,7 +4702,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 			}
 
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-				locals->MaximumVStartup[k] = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k]
+				locals->MaximumVStartup[0][0][k] = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k]
 					- dml_max(1.0, dml_ceil(locals->WritebackDelay[i][k] / (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]), 1.0));
 			}
 
@@ -4743,7 +4742,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 						mode_lib->vba.XFCRemoteSurfaceFlipDelay = 0.0;
 					}
 
-					CalculateDelayAfterScaler(mode_lib, mode_lib->vba.ReturnBWPerState[i], mode_lib->vba.ReadBandwidthLuma[k], mode_lib->vba.ReadBandwidthChroma[k], mode_lib->vba.MaxTotalVActiveRDBandwidth,
+					CalculateDelayAfterScaler(mode_lib, mode_lib->vba.ReturnBWPerState[i][0], mode_lib->vba.ReadBandwidthLuma[k], mode_lib->vba.ReadBandwidthChroma[k], mode_lib->vba.MaxTotalVActiveRDBandwidth,
 						mode_lib->vba.DisplayPipeLineDeliveryTimeLuma[k], mode_lib->vba.DisplayPipeLineDeliveryTimeChroma[k],
 						mode_lib->vba.RequiredDPPCLK[i][j][k], mode_lib->vba.RequiredDISPCLK[i][j], mode_lib->vba.PixelClock[k], mode_lib->vba.DSCDelayPerState[i][k], mode_lib->vba.NoOfDPP[i][j][k], mode_lib->vba.ScalerEnabled[k], mode_lib->vba.NumberOfCursors[k],
 						mode_lib->vba.DPPCLKDelaySubtotal, mode_lib->vba.DPPCLKDelaySCL, mode_lib->vba.DPPCLKDelaySCLLBOnly, mode_lib->vba.DPPCLKDelayCNVCFormater, mode_lib->vba.DPPCLKDelayCNVCCursor, mode_lib->vba.DISPCLKDelaySubtotal,
@@ -4757,14 +4756,14 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 									mode_lib->vba.RequiredDPPCLK[i][j][k],
 									mode_lib->vba.RequiredDISPCLK[i][j],
 									mode_lib->vba.PixelClock[k],
-									mode_lib->vba.ProjectedDCFCLKDeepSleep,
+									mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 									mode_lib->vba.NoOfDPP[i][j][k],
 									mode_lib->vba.NumberOfCursors[k],
 									mode_lib->vba.VTotal[k]
 											- mode_lib->vba.VActive[k],
 									mode_lib->vba.HTotal[k],
 									mode_lib->vba.MaxInterDCNTileRepeaters,
-									mode_lib->vba.MaximumVStartup[k],
+									mode_lib->vba.MaximumVStartup[0][0][k],
 									mode_lib->vba.GPUVMMaxPageTableLevels,
 									mode_lib->vba.GPUVMEnable,
 									mode_lib->vba.DynamicMetadataEnable[k],
@@ -4774,15 +4773,15 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 									mode_lib->vba.UrgentLatencyPixelDataOnly,
 									mode_lib->vba.ExtraLatency,
 									mode_lib->vba.TimeCalc,
-									mode_lib->vba.PDEAndMetaPTEBytesPerFrame[k],
-									mode_lib->vba.MetaRowBytes[k],
-									mode_lib->vba.DPTEBytesPerRow[k],
-									mode_lib->vba.PrefetchLinesY[k],
+									mode_lib->vba.PDEAndMetaPTEBytesPerFrame[0][0][k],
+									mode_lib->vba.MetaRowBytes[0][0][k],
+									mode_lib->vba.DPTEBytesPerRow[0][0][k],
+									mode_lib->vba.PrefetchLinesY[0][0][k],
 									mode_lib->vba.SwathWidthYPerState[i][j][k],
 									mode_lib->vba.BytePerPixelInDETY[k],
 									mode_lib->vba.PrefillY[k],
 									mode_lib->vba.MaxNumSwY[k],
-									mode_lib->vba.PrefetchLinesC[k],
+									mode_lib->vba.PrefetchLinesC[0][0][k],
 									mode_lib->vba.BytePerPixelInDETC[k],
 									mode_lib->vba.PrefillC[k],
 									mode_lib->vba.MaxNumSwC[k],
@@ -4812,19 +4811,19 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				locals->prefetch_vm_bw_valid = true;
 				locals->prefetch_row_bw_valid = true;
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-					if (locals->PDEAndMetaPTEBytesPerFrame[k] == 0)
+					if (locals->PDEAndMetaPTEBytesPerFrame[0][0][k] == 0)
 						locals->prefetch_vm_bw[k] = 0;
 					else if (locals->LinesForMetaPTE[k] > 0)
-						locals->prefetch_vm_bw[k] = locals->PDEAndMetaPTEBytesPerFrame[k]
+						locals->prefetch_vm_bw[k] = locals->PDEAndMetaPTEBytesPerFrame[0][0][k]
 							/ (locals->LinesForMetaPTE[k] * locals->HTotal[k] / locals->PixelClock[k]);
 					else {
 						locals->prefetch_vm_bw[k] = 0;
 						locals->prefetch_vm_bw_valid = false;
 					}
-					if (locals->MetaRowBytes[k] + locals->DPTEBytesPerRow[k] == 0)
+					if (locals->MetaRowBytes[0][0][k] + locals->DPTEBytesPerRow[0][0][k] == 0)
 						locals->prefetch_row_bw[k] = 0;
 					else if (locals->LinesForMetaAndDPTERow[k] > 0)
-						locals->prefetch_row_bw[k] = (locals->MetaRowBytes[k] + locals->DPTEBytesPerRow[k])
+						locals->prefetch_row_bw[k] = (locals->MetaRowBytes[0][0][k] + locals->DPTEBytesPerRow[0][0][k])
 							/ (locals->LinesForMetaAndDPTERow[k] * locals->HTotal[k] / locals->PixelClock[k]);
 					else {
 						locals->prefetch_row_bw[k] = 0;
@@ -4843,13 +4842,13 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 											mode_lib->vba.RequiredPrefetchPixelDataBWLuma[i][j][k])
 											+ mode_lib->vba.meta_row_bw[k] + mode_lib->vba.dpte_row_bw[k]);
 				}
-				locals->BandwidthWithoutPrefetchSupported[i] = true;
-				if (mode_lib->vba.MaximumReadBandwidthWithoutPrefetch > locals->ReturnBWPerState[i]) {
-					locals->BandwidthWithoutPrefetchSupported[i] = false;
+				locals->BandwidthWithoutPrefetchSupported[i][0] = true;
+				if (mode_lib->vba.MaximumReadBandwidthWithoutPrefetch > locals->ReturnBWPerState[i][0]) {
+					locals->BandwidthWithoutPrefetchSupported[i][0] = false;
 				}
 
 				locals->PrefetchSupported[i][j] = true;
-				if (mode_lib->vba.MaximumReadBandwidthWithPrefetch > locals->ReturnBWPerState[i]) {
+				if (mode_lib->vba.MaximumReadBandwidthWithPrefetch > locals->ReturnBWPerState[i][0]) {
 					locals->PrefetchSupported[i][j] = false;
 				}
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
@@ -4874,7 +4873,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 			if (mode_lib->vba.PrefetchSupported[i][j] == true
 					&& mode_lib->vba.VRatioInPrefetchSupported[i][j] == true) {
 				mode_lib->vba.BandwidthAvailableForImmediateFlip =
-						mode_lib->vba.ReturnBWPerState[i];
+						mode_lib->vba.ReturnBWPerState[i][0];
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 					mode_lib->vba.BandwidthAvailableForImmediateFlip =
 							mode_lib->vba.BandwidthAvailableForImmediateFlip
@@ -4888,9 +4887,9 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 					if ((mode_lib->vba.SourcePixelFormat[k] != dm_420_8
 							&& mode_lib->vba.SourcePixelFormat[k] != dm_420_10)) {
 						mode_lib->vba.ImmediateFlipBytes[k] =
-								mode_lib->vba.PDEAndMetaPTEBytesPerFrame[k]
-										+ mode_lib->vba.MetaRowBytes[k]
-										+ mode_lib->vba.DPTEBytesPerRow[k];
+								mode_lib->vba.PDEAndMetaPTEBytesPerFrame[0][0][k]
+										+ mode_lib->vba.MetaRowBytes[0][0][k]
+										+ mode_lib->vba.DPTEBytesPerRow[0][0][k];
 					}
 				}
 				mode_lib->vba.TotImmediateFlipBytes = 0.0;
@@ -4918,9 +4917,9 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 									/ mode_lib->vba.PixelClock[k],
 							mode_lib->vba.VRatio[k],
 							mode_lib->vba.Tno_bw[k],
-							mode_lib->vba.PDEAndMetaPTEBytesPerFrame[k],
-							mode_lib->vba.MetaRowBytes[k],
-							mode_lib->vba.DPTEBytesPerRow[k],
+							mode_lib->vba.PDEAndMetaPTEBytesPerFrame[0][0][k],
+							mode_lib->vba.MetaRowBytes[0][0][k],
+							mode_lib->vba.DPTEBytesPerRow[0][0][k],
 							mode_lib->vba.DCCEnable[k],
 							mode_lib->vba.dpte_row_height[k],
 							mode_lib->vba.meta_row_height[k],
@@ -4945,7 +4944,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				}
 				mode_lib->vba.ImmediateFlipSupportedForState[i][j] = true;
 				if (mode_lib->vba.total_dcn_read_bw_with_flip
-						> mode_lib->vba.ReturnBWPerState[i]) {
+						> mode_lib->vba.ReturnBWPerState[i][0]) {
 					mode_lib->vba.ImmediateFlipSupportedForState[i][j] = false;
 				}
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
@@ -4961,13 +4960,13 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 
 	/*Vertical Active BW support*/
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
-		mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i] = dml_min(mode_lib->vba.ReturnBusWidth *
+		mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i][0] = dml_min(mode_lib->vba.ReturnBusWidth *
 				mode_lib->vba.DCFCLKPerState[i], mode_lib->vba.FabricAndDRAMBandwidthPerState[i] * 1000) *
 				mode_lib->vba.MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperation / 100;
-		if (mode_lib->vba.MaxTotalVActiveRDBandwidth <= mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i])
-			mode_lib->vba.TotalVerticalActiveBandwidthSupport[i] = true;
+		if (mode_lib->vba.MaxTotalVActiveRDBandwidth <= mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i][0])
+			mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][0] = true;
 		else
-			mode_lib->vba.TotalVerticalActiveBandwidthSupport[i] = false;
+			mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][0] = false;
 	}
 
 	/*PTE Buffer Size Check*/
@@ -5055,7 +5054,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				status = DML_FAIL_SCALE_RATIO_TAP;
 			} else if (mode_lib->vba.SourceFormatPixelAndScanSupport != true) {
 				status = DML_FAIL_SOURCE_PIXEL_FORMAT;
-			} else if (locals->ViewportSizeSupport[i] != true) {
+			} else if (locals->ViewportSizeSupport[i][0] != true) {
 				status = DML_FAIL_VIEWPORT_SIZE;
 			} else if (locals->DIOSupport[i] != true) {
 				status = DML_FAIL_DIO_SUPPORT;
@@ -5065,7 +5064,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				status = DML_FAIL_DSC_CLK_REQUIRED;
 			} else if (locals->UrgentLatencySupport[i][j] != true) {
 				status = DML_FAIL_URGENT_LATENCY;
-			} else if (locals->ROBSupport[i] != true) {
+			} else if (locals->ROBSupport[i][0] != true) {
 				status = DML_FAIL_REORDERING_BUFFER;
 			} else if (locals->DISPCLK_DPPCLK_Support[i][j] != true) {
 				status = DML_FAIL_DISPCLK_DPPCLK;
@@ -5085,7 +5084,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				status = DML_FAIL_PITCH_SUPPORT;
 			} else if (locals->PrefetchSupported[i][j] != true) {
 				status = DML_FAIL_PREFETCH_SUPPORT;
-			} else if (locals->TotalVerticalActiveBandwidthSupport[i] != true) {
+			} else if (locals->TotalVerticalActiveBandwidthSupport[i][0] != true) {
 				status = DML_FAIL_TOTAL_V_ACTIVE_BW;
 			} else if (locals->VRatioInPrefetchSupported[i][j] != true) {
 				status = DML_FAIL_V_RATIO_PREFETCH;
@@ -5131,7 +5130,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 	mode_lib->vba.DRAMSpeed = mode_lib->vba.DRAMSpeedPerState[mode_lib->vba.VoltageLevel];
 	mode_lib->vba.FabricClock = mode_lib->vba.FabricClockPerState[mode_lib->vba.VoltageLevel];
 	mode_lib->vba.SOCCLK = mode_lib->vba.SOCCLKPerState[mode_lib->vba.VoltageLevel];
-	mode_lib->vba.ReturnBW = locals->ReturnBWPerState[mode_lib->vba.VoltageLevel];
+	mode_lib->vba.ReturnBW = locals->ReturnBWPerState[mode_lib->vba.VoltageLevel][0];
 	mode_lib->vba.FabricAndDRAMBandwidth = locals->FabricAndDRAMBandwidthPerState[mode_lib->vba.VoltageLevel];
 	for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 		if (mode_lib->vba.BlendingAndTiming[k] == k) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index b6d34669cddf..5dcfbb0af825 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -197,7 +197,7 @@ static unsigned int CalculateVMAndRowBytes(
 		unsigned int *meta_row_width,
 		unsigned int *meta_row_height,
 		unsigned int *vm_group_bytes,
-		long         *dpte_group_bytes,
+		unsigned int *dpte_group_bytes,
 		unsigned int *PixelPTEReqWidth,
 		unsigned int *PixelPTEReqHeight,
 		unsigned int *PTERequestSize,
@@ -295,7 +295,7 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		double UrgentOutOfOrderReturn,
 		double ReturnBW,
 		bool GPUVMEnable,
-		long dpte_group_bytes[],
+		int dpte_group_bytes[],
 		unsigned int MetaChunkSize,
 		double UrgentLatency,
 		double ExtraLatency,
@@ -309,13 +309,13 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		int DPPPerPlane[],
 		bool DCCEnable[],
 		double DPPCLK[],
-		unsigned int SwathWidthSingleDPPY[],
+		double SwathWidthSingleDPPY[],
 		unsigned int SwathHeightY[],
 		double ReadBandwidthPlaneLuma[],
 		unsigned int SwathHeightC[],
 		double ReadBandwidthPlaneChroma[],
 		unsigned int LBBitPerPixel[],
-		unsigned int SwathWidthY[],
+		double SwathWidthY[],
 		double HRatio[],
 		unsigned int vtaps[],
 		unsigned int VTAPsChroma[],
@@ -344,7 +344,7 @@ static void CalculateDCFCLKDeepSleep(
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
 		double VRatio[],
-		unsigned int SwathWidthY[],
+		double SwathWidthY[],
 		int DPPPerPlane[],
 		double HRatio[],
 		double PixelClock[],
@@ -435,7 +435,7 @@ static void CalculateMetaAndPTETimes(
 		unsigned int           meta_row_height[],
 		unsigned int           meta_req_width[],
 		unsigned int           meta_req_height[],
-		long                   dpte_group_bytes[],
+		int                   dpte_group_bytes[],
 		unsigned int           PTERequestSizeY[],
 		unsigned int           PTERequestSizeC[],
 		unsigned int           PixelPTEReqWidthY[],
@@ -477,7 +477,7 @@ static double CalculateExtraLatency(
 		bool HostVMEnable,
 		int NumberOfActivePlanes,
 		int NumberOfDPP[],
-		long dpte_group_bytes[],
+		int dpte_group_bytes[],
 		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
 		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
 		int HostVMMaxPageTableLevels,
@@ -1280,7 +1280,7 @@ static unsigned int CalculateVMAndRowBytes(
 		unsigned int *meta_row_width,
 		unsigned int *meta_row_height,
 		unsigned int *vm_group_bytes,
-		long         *dpte_group_bytes,
+		unsigned int *dpte_group_bytes,
 		unsigned int *PixelPTEReqWidth,
 		unsigned int *PixelPTEReqHeight,
 		unsigned int *PTERequestSize,
@@ -1683,11 +1683,11 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		else
 			locals->SwathWidthSingleDPPY[k] = mode_lib->vba.ViewportHeight[k];
 
-		if (mode_lib->vba.ODMCombineEnabled[k] == true)
+		if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
 			MainPlaneDoesODMCombine = true;
 		for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j)
 			if (mode_lib->vba.BlendingAndTiming[k] == j
-					&& mode_lib->vba.ODMCombineEnabled[j] == true)
+					&& mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
 				MainPlaneDoesODMCombine = true;
 
 		if (MainPlaneDoesODMCombine == true)
@@ -2940,12 +2940,12 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 			SwathWidth = mode_lib->vba.ViewportHeight[k];
 		}
 
-		if (mode_lib->vba.ODMCombineEnabled[k] == true) {
+		if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1) {
 			MainPlaneDoesODMCombine = true;
 		}
 		for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j) {
 			if (mode_lib->vba.BlendingAndTiming[k] == j
-					&& mode_lib->vba.ODMCombineEnabled[j] == true) {
+					&& mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1) {
 				MainPlaneDoesODMCombine = true;
 			}
 		}
@@ -3542,17 +3542,17 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 		}
 	}
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
-		locals->IdealSDPPortBandwidthPerState[i] = dml_min3(
+		locals->IdealSDPPortBandwidthPerState[i][0] = dml_min3(
 				mode_lib->vba.ReturnBusWidth * mode_lib->vba.DCFCLKPerState[i],
 				mode_lib->vba.DRAMSpeedPerState[i] * mode_lib->vba.NumberOfChannels
 						* mode_lib->vba.DRAMChannelWidth,
 				mode_lib->vba.FabricClockPerState[i]
 						* mode_lib->vba.FabricDatapathToDCNDataReturn);
 		if (mode_lib->vba.HostVMEnable == false) {
-			locals->ReturnBWPerState[i] = locals->IdealSDPPortBandwidthPerState[i]
+			locals->ReturnBWPerState[i][0] = locals->IdealSDPPortBandwidthPerState[i][0]
 					* mode_lib->vba.PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly / 100.0;
 		} else {
-			locals->ReturnBWPerState[i] = locals->IdealSDPPortBandwidthPerState[i]
+			locals->ReturnBWPerState[i][0] = locals->IdealSDPPortBandwidthPerState[i][0]
 					* mode_lib->vba.PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData / 100.0;
 		}
 	}
@@ -3589,12 +3589,12 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				+ dml_max3(mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelDataOnly,
 						mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelMixedWithVMData,
 						mode_lib->vba.UrgentOutOfOrderReturnPerChannelVMDataOnly)
-					* mode_lib->vba.NumberOfChannels / locals->ReturnBWPerState[i];
-		if ((mode_lib->vba.ROBBufferSizeInKByte - mode_lib->vba.PixelChunkSizeInKByte) * 1024.0 / locals->ReturnBWPerState[i]
+					* mode_lib->vba.NumberOfChannels / locals->ReturnBWPerState[i][0];
+		if ((mode_lib->vba.ROBBufferSizeInKByte - mode_lib->vba.PixelChunkSizeInKByte) * 1024.0 / locals->ReturnBWPerState[i][0]
 				> locals->UrgentRoundTripAndOutOfOrderLatencyPerState[i]) {
-			locals->ROBSupport[i] = true;
+			locals->ROBSupport[i][0] = true;
 		} else {
-			locals->ROBSupport[i] = false;
+			locals->ROBSupport[i][0] = false;
 		}
 	}
 	/*Writeback Mode Support Check*/
@@ -3982,7 +3982,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				}
 				if (locals->MinDPPCLKUsingSingleDPP[k] * (1.0 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) <= mode_lib->vba.MaxDppclkRoundedDownToDFSGranularity
 						&& locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]
-						&& locals->ODMCombineEnablePerState[i][k] == false) {
+						&& locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_disabled) {
 					locals->NoOfDPP[i][j][k] = 1;
 					locals->RequiredDPPCLK[i][j][k] =
 						locals->MinDPPCLKUsingSingleDPP[k] * (1.0 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
@@ -4071,16 +4071,16 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	/*Viewport Size Check*/
 
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
-		locals->ViewportSizeSupport[i] = true;
+		locals->ViewportSizeSupport[i][0] = true;
 		for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-			if (locals->ODMCombineEnablePerState[i][k] == true) {
+			if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 				if (dml_min(locals->SwathWidthYSingleDPP[k], dml_round(mode_lib->vba.HActive[k] / 2.0 * mode_lib->vba.HRatio[k]))
 						> locals->MaximumSwathWidth[k]) {
-					locals->ViewportSizeSupport[i] = false;
+					locals->ViewportSizeSupport[i][0] = false;
 				}
 			} else {
 				if (locals->SwathWidthYSingleDPP[k] / 2.0 > locals->MaximumSwathWidth[k]) {
-					locals->ViewportSizeSupport[i] = false;
+					locals->ViewportSizeSupport[i][0] = false;
 				}
 			}
 		}
@@ -4269,8 +4269,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						mode_lib->vba.DSCFormatFactor = 1;
 					}
 					if (locals->RequiresDSC[i][k] == true) {
-						if (locals->ODMCombineEnablePerState[i][k]
-								== true) {
+						if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 							if (mode_lib->vba.PixelClockBackEnd[k] / 6.0 / mode_lib->vba.DSCFormatFactor
 									> (1.0 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * mode_lib->vba.MaxDSCCLK[i]) {
 								locals->DSCCLKRequiredMoreThanSupported[i] =
@@ -4293,7 +4292,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 		mode_lib->vba.TotalDSCUnitsRequired = 0.0;
 		for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 			if (locals->RequiresDSC[i][k] == true) {
-				if (locals->ODMCombineEnablePerState[i][k] == true) {
+				if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 					mode_lib->vba.TotalDSCUnitsRequired =
 							mode_lib->vba.TotalDSCUnitsRequired + 2.0;
 				} else {
@@ -4335,7 +4334,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				mode_lib->vba.bpp = locals->OutputBppPerState[i][k];
 			}
 			if (locals->RequiresDSC[i][k] == true && mode_lib->vba.bpp != 0.0) {
-				if (locals->ODMCombineEnablePerState[i][k] == false) {
+				if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_disabled) {
 					locals->DSCDelayPerState[i][k] =
 							dscceComputeDelay(
 									mode_lib->vba.DSCInputBitPerComponent[k],
@@ -4399,7 +4398,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 				locals->RequiredDPPCLKThisState[k] = locals->RequiredDPPCLK[i][j][k];
 				locals->NoOfDPPThisState[k]        = locals->NoOfDPP[i][j][k];
-				if (locals->ODMCombineEnablePerState[i][k] == true) {
+				if (locals->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 					locals->SwathWidthYThisState[k] =
 						dml_min(locals->SwathWidthYSingleDPP[k], dml_round(mode_lib->vba.HActive[k] / 2.0 * mode_lib->vba.HRatio[k]));
 				} else {
@@ -4451,7 +4450,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					locals->PSCL_FACTOR,
 					locals->PSCL_FACTOR_CHROMA,
 					locals->RequiredDPPCLKThisState,
-					&mode_lib->vba.ProjectedDCFCLKDeepSleep);
+					&mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0]);
 
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 				if ((mode_lib->vba.SourcePixelFormat[k] != dm_444_64
@@ -4496,7 +4495,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							locals->PTERequestSizeC,
 							locals->dpde0_bytes_per_frame_ub_c,
 							locals->meta_pte_bytes_per_frame_ub_c);
-					locals->PrefetchLinesC[k] = CalculatePrefetchSourceLines(
+					locals->PrefetchLinesC[0][0][k] = CalculatePrefetchSourceLines(
 							mode_lib,
 							mode_lib->vba.VRatio[k]/2,
 							mode_lib->vba.VTAPsChroma[k],
@@ -4511,7 +4510,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					mode_lib->vba.PDEAndMetaPTEBytesPerFrameC = 0.0;
 					mode_lib->vba.MetaRowBytesC = 0.0;
 					mode_lib->vba.DPTEBytesPerRowC = 0.0;
-					locals->PrefetchLinesC[k] = 0.0;
+					locals->PrefetchLinesC[0][0][k] = 0.0;
 					locals->PTEBufferSizeNotExceededC[i][j][k] = true;
 					locals->PTEBufferSizeInRequestsForLuma = mode_lib->vba.PTEBufferSizeInRequestsLuma + mode_lib->vba.PTEBufferSizeInRequestsChroma;
 				}
@@ -4552,7 +4551,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						locals->PTERequestSizeY,
 						locals->dpde0_bytes_per_frame_ub_l,
 						locals->meta_pte_bytes_per_frame_ub_l);
-				locals->PrefetchLinesY[k] = CalculatePrefetchSourceLines(
+				locals->PrefetchLinesY[0][0][k] = CalculatePrefetchSourceLines(
 						mode_lib,
 						mode_lib->vba.VRatio[k],
 						mode_lib->vba.vtaps[k],
@@ -4562,10 +4561,10 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						mode_lib->vba.ViewportYStartY[k],
 						&locals->PrefillY[k],
 						&locals->MaxNumSwY[k]);
-				locals->PDEAndMetaPTEBytesPerFrame[k] =
+				locals->PDEAndMetaPTEBytesPerFrame[0][0][k] =
 						mode_lib->vba.PDEAndMetaPTEBytesPerFrameY + mode_lib->vba.PDEAndMetaPTEBytesPerFrameC;
-				locals->MetaRowBytes[k] = mode_lib->vba.MetaRowBytesY + mode_lib->vba.MetaRowBytesC;
-				locals->DPTEBytesPerRow[k] = mode_lib->vba.DPTEBytesPerRowY + mode_lib->vba.DPTEBytesPerRowC;
+				locals->MetaRowBytes[0][0][k] = mode_lib->vba.MetaRowBytesY + mode_lib->vba.MetaRowBytesC;
+				locals->DPTEBytesPerRow[0][0][k] = mode_lib->vba.DPTEBytesPerRowY + mode_lib->vba.DPTEBytesPerRowC;
 
 				CalculateActiveRowBandwidth(
 						mode_lib->vba.GPUVMEnable,
@@ -4591,7 +4590,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					mode_lib->vba.PixelChunkSizeInKByte,
 					locals->TotalNumberOfDCCActiveDPP[i][j],
 					mode_lib->vba.MetaChunkSize,
-					locals->ReturnBWPerState[i],
+					locals->ReturnBWPerState[i][0],
 					mode_lib->vba.GPUVMEnable,
 					mode_lib->vba.HostVMEnable,
 					mode_lib->vba.NumberOfActivePlanes,
@@ -4602,7 +4601,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					mode_lib->vba.HostVMMaxPageTableLevels,
 					mode_lib->vba.HostVMCachedPageTableLevels);
 
-			mode_lib->vba.TimeCalc = 24.0 / mode_lib->vba.ProjectedDCFCLKDeepSleep;
+			mode_lib->vba.TimeCalc = 24.0 / mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0];
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 				if (mode_lib->vba.BlendingAndTiming[k] == k) {
 					if (mode_lib->vba.WritebackEnable[k] == true) {
@@ -4644,15 +4643,15 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					}
 				}
 			}
-			mode_lib->vba.MaxMaxVStartup = 0;
+			mode_lib->vba.MaxMaxVStartup[0][0] = 0;
 			for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-				locals->MaximumVStartup[k] = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k]
+				locals->MaximumVStartup[0][0][k] = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k]
 					- dml_max(1.0, dml_ceil(locals->WritebackDelay[i][k] / (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]), 1.0));
-				mode_lib->vba.MaxMaxVStartup = dml_max(mode_lib->vba.MaxMaxVStartup, locals->MaximumVStartup[k]);
+				mode_lib->vba.MaxMaxVStartup[0][0] = dml_max(mode_lib->vba.MaxMaxVStartup[0][0], locals->MaximumVStartup[0][0][k]);
 			}
 
 			mode_lib->vba.NextPrefetchMode = mode_lib->vba.MinPrefetchMode;
-			mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup;
+			mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[0][0];
 			do {
 				mode_lib->vba.PrefetchMode[i][j] = mode_lib->vba.NextPrefetchMode;
 				mode_lib->vba.MaxVStartup = mode_lib->vba.NextMaxVStartup;
@@ -4693,7 +4692,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					myPipe.DPPCLK = locals->RequiredDPPCLK[i][j][k];
 					myPipe.DISPCLK = locals->RequiredDISPCLK[i][j];
 					myPipe.PixelClock = mode_lib->vba.PixelClock[k];
-					myPipe.DCFCLKDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep;
+					myPipe.DCFCLKDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0];
 					myPipe.DPPPerPlane = locals->NoOfDPP[i][j][k];
 					myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
 					myPipe.SourceScan = mode_lib->vba.SourceScan[k];
@@ -4727,8 +4726,8 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							locals->SwathWidthYThisState[k] / mode_lib->vba.HRatio[k],
 							mode_lib->vba.OutputFormat[k],
 							mode_lib->vba.MaxInterDCNTileRepeaters,
-							dml_min(mode_lib->vba.MaxVStartup, locals->MaximumVStartup[k]),
-							locals->MaximumVStartup[k],
+							dml_min(mode_lib->vba.MaxVStartup, locals->MaximumVStartup[0][0][k]),
+							locals->MaximumVStartup[0][0][k],
 							mode_lib->vba.GPUVMMaxPageTableLevels,
 							mode_lib->vba.GPUVMEnable,
 							&myHostVM,
@@ -4739,15 +4738,15 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							mode_lib->vba.UrgentLatency,
 							mode_lib->vba.ExtraLatency,
 							mode_lib->vba.TimeCalc,
-							locals->PDEAndMetaPTEBytesPerFrame[k],
-							locals->MetaRowBytes[k],
-							locals->DPTEBytesPerRow[k],
-							locals->PrefetchLinesY[k],
+							locals->PDEAndMetaPTEBytesPerFrame[0][0][k],
+							locals->MetaRowBytes[0][0][k],
+							locals->DPTEBytesPerRow[0][0][k],
+							locals->PrefetchLinesY[0][0][k],
 							locals->SwathWidthYThisState[k],
 							locals->BytePerPixelInDETY[k],
 							locals->PrefillY[k],
 							locals->MaxNumSwY[k],
-							locals->PrefetchLinesC[k],
+							locals->PrefetchLinesC[0][0][k],
 							locals->BytePerPixelInDETC[k],
 							locals->PrefillC[k],
 							locals->MaxNumSwC[k],
@@ -4836,14 +4835,14 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						+ locals->RequiredPrefetchPixelDataBWChroma[i][j][k] * locals->UrgentBurstFactorChromaPre[k]
 						+ locals->cursor_bw_pre[k] * locals->UrgentBurstFactorCursorPre[k]);
 				}
-				locals->BandwidthWithoutPrefetchSupported[i] = true;
-				if (mode_lib->vba.MaximumReadBandwidthWithoutPrefetch > locals->ReturnBWPerState[i]
+				locals->BandwidthWithoutPrefetchSupported[i][0] = true;
+				if (mode_lib->vba.MaximumReadBandwidthWithoutPrefetch > locals->ReturnBWPerState[i][0]
 						|| locals->NotEnoughUrgentLatencyHiding == 1) {
-					locals->BandwidthWithoutPrefetchSupported[i] = false;
+					locals->BandwidthWithoutPrefetchSupported[i][0] = false;
 				}
 
 				locals->PrefetchSupported[i][j] = true;
-				if (mode_lib->vba.MaximumReadBandwidthWithPrefetch > locals->ReturnBWPerState[i]
+				if (mode_lib->vba.MaximumReadBandwidthWithPrefetch > locals->ReturnBWPerState[i][0]
 						|| locals->NotEnoughUrgentLatencyHiding == 1
 						|| locals->NotEnoughUrgentLatencyHidingPre == 1) {
 					locals->PrefetchSupported[i][j] = false;
@@ -4872,17 +4871,17 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				}
 
 				if (mode_lib->vba.MaxVStartup <= 13 || mode_lib->vba.AnyLinesForVMOrRowTooLarge == false) {
-					mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup;
+					mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[0][0];
 					mode_lib->vba.NextPrefetchMode = mode_lib->vba.NextPrefetchMode + 1;
 				} else {
 					mode_lib->vba.NextMaxVStartup = mode_lib->vba.NextMaxVStartup - 1;
 				}
 			} while ((locals->PrefetchSupported[i][j] != true || locals->VRatioInPrefetchSupported[i][j] != true)
-					&& (mode_lib->vba.NextMaxVStartup != mode_lib->vba.MaxMaxVStartup
+					&& (mode_lib->vba.NextMaxVStartup != mode_lib->vba.MaxMaxVStartup[0][0]
 						|| mode_lib->vba.NextPrefetchMode < mode_lib->vba.MaxPrefetchMode));
 
 			if (locals->PrefetchSupported[i][j] == true && locals->VRatioInPrefetchSupported[i][j] == true) {
-				mode_lib->vba.BandwidthAvailableForImmediateFlip = locals->ReturnBWPerState[i];
+				mode_lib->vba.BandwidthAvailableForImmediateFlip = locals->ReturnBWPerState[i][0];
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 					mode_lib->vba.BandwidthAvailableForImmediateFlip = mode_lib->vba.BandwidthAvailableForImmediateFlip
 						- dml_max(locals->ReadBandwidthLuma[k] * locals->UrgentBurstFactorLuma[k]
@@ -4895,7 +4894,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				mode_lib->vba.TotImmediateFlipBytes = 0.0;
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 					mode_lib->vba.TotImmediateFlipBytes = mode_lib->vba.TotImmediateFlipBytes
-						+ locals->PDEAndMetaPTEBytesPerFrame[k] + locals->MetaRowBytes[k] + locals->DPTEBytesPerRow[k];
+						+ locals->PDEAndMetaPTEBytesPerFrame[0][0][k] + locals->MetaRowBytes[0][0][k] + locals->DPTEBytesPerRow[0][0][k];
 				}
 
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
@@ -4910,9 +4909,9 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							mode_lib->vba.HostVMMaxPageTableLevels,
 							mode_lib->vba.HostVMCachedPageTableLevels,
 							mode_lib->vba.GPUVMEnable,
-							locals->PDEAndMetaPTEBytesPerFrame[k],
-							locals->MetaRowBytes[k],
-							locals->DPTEBytesPerRow[k],
+							locals->PDEAndMetaPTEBytesPerFrame[0][0][k],
+							locals->MetaRowBytes[0][0][k],
+							locals->DPTEBytesPerRow[0][0][k],
 							mode_lib->vba.BandwidthAvailableForImmediateFlip,
 							mode_lib->vba.TotImmediateFlipBytes,
 							mode_lib->vba.SourcePixelFormat[k],
@@ -4943,7 +4942,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				}
 				locals->ImmediateFlipSupportedForState[i][j] = true;
 				if (mode_lib->vba.total_dcn_read_bw_with_flip
-						> locals->ReturnBWPerState[i]) {
+						> locals->ReturnBWPerState[i][0]) {
 					locals->ImmediateFlipSupportedForState[i][j] = false;
 				}
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
@@ -4970,7 +4969,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					mode_lib->vba.WritebackInterfaceChromaBufferSize,
 					mode_lib->vba.DCFCLKPerState[i],
 					mode_lib->vba.UrgentOutOfOrderReturnPerChannel * mode_lib->vba.NumberOfChannels,
-					locals->ReturnBWPerState[i],
+					locals->ReturnBWPerState[i][0],
 					mode_lib->vba.GPUVMEnable,
 					locals->dpte_group_bytes,
 					mode_lib->vba.MetaChunkSize,
@@ -4982,7 +4981,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					mode_lib->vba.DRAMClockChangeLatency,
 					mode_lib->vba.SRExitTime,
 					mode_lib->vba.SREnterPlusExitTime,
-					mode_lib->vba.ProjectedDCFCLKDeepSleep,
+					mode_lib->vba.ProjectedDCFCLKDeepSleep[0][0],
 					locals->NoOfDPPThisState,
 					mode_lib->vba.DCCEnable,
 					locals->RequiredDPPCLKThisState,
@@ -5025,8 +5024,8 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				MaxTotalVActiveRDBandwidth = MaxTotalVActiveRDBandwidth + locals->ReadBandwidth[k];
 		}
 		for (i = 0; i <= mode_lib->vba.soc.num_states; ++i) {
-			locals->MaxTotalVerticalActiveAvailableBandwidth[i] = dml_min(
-				locals->IdealSDPPortBandwidthPerState[i] *
+			locals->MaxTotalVerticalActiveAvailableBandwidth[i][0] = dml_min(
+				locals->IdealSDPPortBandwidthPerState[i][0] *
 				mode_lib->vba.MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation
 				/ 100.0, mode_lib->vba.DRAMSpeedPerState[i] *
 				mode_lib->vba.NumberOfChannels *
@@ -5034,10 +5033,10 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				mode_lib->vba.MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperation
 				/ 100.0);
 
-			if (MaxTotalVActiveRDBandwidth <= locals->MaxTotalVerticalActiveAvailableBandwidth[i]) {
-				locals->TotalVerticalActiveBandwidthSupport[i] = true;
+			if (MaxTotalVActiveRDBandwidth <= locals->MaxTotalVerticalActiveAvailableBandwidth[i][0]) {
+				locals->TotalVerticalActiveBandwidthSupport[i][0] = true;
 			} else {
-				locals->TotalVerticalActiveBandwidthSupport[i] = false;
+				locals->TotalVerticalActiveBandwidthSupport[i][0] = false;
 			}
 		}
 	}
@@ -5116,7 +5115,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				status = DML_FAIL_SCALE_RATIO_TAP;
 			} else if (mode_lib->vba.SourceFormatPixelAndScanSupport != true) {
 				status = DML_FAIL_SOURCE_PIXEL_FORMAT;
-			} else if (locals->ViewportSizeSupport[i] != true) {
+			} else if (locals->ViewportSizeSupport[i][0] != true) {
 				status = DML_FAIL_VIEWPORT_SIZE;
 			} else if (locals->DIOSupport[i] != true) {
 				status = DML_FAIL_DIO_SUPPORT;
@@ -5124,7 +5123,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				status = DML_FAIL_NOT_ENOUGH_DSC;
 			} else if (locals->DSCCLKRequiredMoreThanSupported[i] != false) {
 				status = DML_FAIL_DSC_CLK_REQUIRED;
-			} else if (locals->ROBSupport[i] != true) {
+			} else if (locals->ROBSupport[i][0] != true) {
 				status = DML_FAIL_REORDERING_BUFFER;
 			} else if (locals->DISPCLK_DPPCLK_Support[i][j] != true) {
 				status = DML_FAIL_DISPCLK_DPPCLK;
@@ -5142,7 +5141,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				status = DML_FAIL_CURSOR_SUPPORT;
 			} else if (mode_lib->vba.PitchSupport != true) {
 				status = DML_FAIL_PITCH_SUPPORT;
-			} else if (locals->TotalVerticalActiveBandwidthSupport[i] != true) {
+			} else if (locals->TotalVerticalActiveBandwidthSupport[i][0] != true) {
 				status = DML_FAIL_TOTAL_V_ACTIVE_BW;
 			} else if (locals->PTEBufferSizeNotExceeded[i][j] != true) {
 				status = DML_FAIL_PTE_BUFFER_SIZE;
@@ -5198,7 +5197,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	mode_lib->vba.DRAMSpeed = mode_lib->vba.DRAMSpeedPerState[mode_lib->vba.VoltageLevel];
 	mode_lib->vba.FabricClock = mode_lib->vba.FabricClockPerState[mode_lib->vba.VoltageLevel];
 	mode_lib->vba.SOCCLK = mode_lib->vba.SOCCLKPerState[mode_lib->vba.VoltageLevel];
-	mode_lib->vba.ReturnBW = locals->ReturnBWPerState[mode_lib->vba.VoltageLevel];
+	mode_lib->vba.ReturnBW = locals->ReturnBWPerState[mode_lib->vba.VoltageLevel][0];
 	for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
 		if (mode_lib->vba.BlendingAndTiming[k] == k) {
 			mode_lib->vba.ODMCombineEnabled[k] =
@@ -5227,7 +5226,7 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		double UrgentOutOfOrderReturn,
 		double ReturnBW,
 		bool GPUVMEnable,
-		long dpte_group_bytes[],
+		int dpte_group_bytes[],
 		unsigned int MetaChunkSize,
 		double UrgentLatency,
 		double ExtraLatency,
@@ -5241,13 +5240,13 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		int DPPPerPlane[],
 		bool DCCEnable[],
 		double DPPCLK[],
-		unsigned int SwathWidthSingleDPPY[],
+		double SwathWidthSingleDPPY[],
 		unsigned int SwathHeightY[],
 		double ReadBandwidthPlaneLuma[],
 		unsigned int SwathHeightC[],
 		double ReadBandwidthPlaneChroma[],
 		unsigned int LBBitPerPixel[],
-		unsigned int SwathWidthY[],
+		double SwathWidthY[],
 		double HRatio[],
 		unsigned int vtaps[],
 		unsigned int VTAPsChroma[],
@@ -5503,7 +5502,7 @@ static void CalculateDCFCLKDeepSleep(
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
 		double VRatio[],
-		unsigned int SwathWidthY[],
+		double SwathWidthY[],
 		int DPPPerPlane[],
 		double HRatio[],
 		double PixelClock[],
@@ -5831,7 +5830,7 @@ static void CalculateMetaAndPTETimes(
 		unsigned int meta_row_height[],
 		unsigned int meta_req_width[],
 		unsigned int meta_req_height[],
-		long dpte_group_bytes[],
+		int dpte_group_bytes[],
 		unsigned int PTERequestSizeY[],
 		unsigned int PTERequestSizeC[],
 		unsigned int PixelPTEReqWidthY[],
@@ -6087,7 +6086,7 @@ static double CalculateExtraLatency(
 		bool HostVMEnable,
 		int NumberOfActivePlanes,
 		int NumberOfDPP[],
-		long dpte_group_bytes[],
+		int dpte_group_bytes[],
 		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
 		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
 		int HostVMMaxPageTableLevels,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h
index 55d4cb23a073..658e0733b99d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h
@@ -119,6 +119,10 @@ enum mpc_combine_affinity {
 	dm_mpc_never
 };
 
+enum RequestType {
+	REQ_256Bytes, REQ_128BytesNonContiguous, REQ_128BytesContiguous, REQ_NA
+};
+
 enum self_refresh_affinity {
 	dm_try_to_allow_self_refresh_and_mclk_switch,
 	dm_allow_self_refresh_and_mclk_switch,
@@ -165,4 +169,16 @@ enum odm_combine_mode {
 	dm_odm_combine_mode_4to1,
 };
 
+enum odm_combine_policy {
+	dm_odm_combine_policy_dal,
+	dm_odm_combine_policy_none,
+	dm_odm_combine_policy_2to1,
+	dm_odm_combine_policy_4to1,
+};
+
+enum immediate_flip_requirement {
+	dm_immediate_flip_not_required,
+	dm_immediate_flip_required,
+};
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
index dbf6a021d0d8..658f81e757e9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
@@ -63,6 +63,7 @@ struct _vcs_dpi_voltage_scaling_st {
 	double dispclk_mhz;
 	double phyclk_mhz;
 	double dppclk_mhz;
+	double dtbclk_mhz;
 };
 
 struct _vcs_dpi_soc_bounding_box_st {
@@ -214,6 +215,7 @@ struct _vcs_dpi_display_pipe_source_params_st {
 	int source_format;
 	unsigned char dcc;
 	unsigned int dcc_rate;
+	unsigned int dcc_rate_chroma;
 	unsigned char dcc_use_global;
 	unsigned char vm;
 	bool gpuvm;    // gpuvm enabled
@@ -225,7 +227,10 @@ struct _vcs_dpi_display_pipe_source_params_st {
 	int source_scan;
 	int sw_mode;
 	int macro_tile_size;
+	unsigned int surface_width_y;
 	unsigned int surface_height_y;
+	unsigned int surface_width_c;
+	unsigned int surface_height_c;
 	unsigned int viewport_width;
 	unsigned int viewport_height;
 	unsigned int viewport_y_y;
@@ -324,7 +329,7 @@ struct _vcs_dpi_display_pipe_dest_params_st {
 	double pixel_rate_mhz;
 	unsigned char synchronized_vblank_all_planes;
 	unsigned char otg_inst;
-	unsigned char odm_combine;
+	unsigned int odm_combine;
 	unsigned char use_maximum_vstartup;
 	unsigned int vtotal_max;
 	unsigned int vtotal_min;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index 66ca014a6b92..b3c96d9b472f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -264,7 +264,10 @@ static void fetch_socbb_params(struct display_mode_lib *mode_lib)
 		mode_lib->vba.DRAMSpeedPerState[i] = soc->clock_limits[i].dram_speed_mts;
 		//mode_lib->vba.DRAMSpeedPerState[i] = soc->clock_limits[i].dram_speed_mhz;
 		mode_lib->vba.MaxDispclk[i] = soc->clock_limits[i].dispclk_mhz;
+		mode_lib->vba.DTBCLKPerState[i] = soc->clock_limits[i].dtbclk_mhz;
 	}
+	mode_lib->vba.MinVoltageLevel = 0;
+	mode_lib->vba.MaxVoltageLevel = mode_lib->vba.soc.num_states;
 
 	mode_lib->vba.DoUrgentLatencyAdjustment =
 		soc->do_urgent_latency_adjustment;
@@ -306,8 +309,6 @@ static void fetch_ip_params(struct display_mode_lib *mode_lib)
 
 	mode_lib->vba.WritebackInterfaceBufferSize = ip->writeback_interface_buffer_size_kbytes;
 	mode_lib->vba.WritebackLineBufferSize = ip->writeback_line_buffer_buffer_size;
-	mode_lib->vba.MinVoltageLevel = 0;
-	mode_lib->vba.MaxVoltageLevel = 5;
 
 	mode_lib->vba.WritebackChromaLineBufferWidth =
 			ip->writeback_chroma_line_buffer_width_pixels;
@@ -423,8 +424,8 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 						ip->dcc_supported : src->dcc && ip->dcc_supported;
 		mode_lib->vba.DCCRate[mode_lib->vba.NumberOfActivePlanes] = src->dcc_rate;
 		/* TODO: Needs to be set based on src->dcc_rate_luma/chroma */
-		mode_lib->vba.DCCRateLuma[mode_lib->vba.NumberOfActivePlanes] = 0;
-		mode_lib->vba.DCCRateChroma[mode_lib->vba.NumberOfActivePlanes] = 0;
+		mode_lib->vba.DCCRateLuma[mode_lib->vba.NumberOfActivePlanes] = src->dcc_rate;
+		mode_lib->vba.DCCRateChroma[mode_lib->vba.NumberOfActivePlanes] = src->dcc_rate_chroma;
 
 		mode_lib->vba.SourcePixelFormat[mode_lib->vba.NumberOfActivePlanes] =
 				(enum source_format_class) (src->source_format);
@@ -436,8 +437,6 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 				dst->recout_width; // TODO: or should this be full_recout_width???...maybe only when in hsplit mode?
 		mode_lib->vba.ODMCombineEnabled[mode_lib->vba.NumberOfActivePlanes] =
 				dst->odm_combine;
-		mode_lib->vba.ODMCombineTypeEnabled[mode_lib->vba.NumberOfActivePlanes] =
-				dst->odm_combine;
 		mode_lib->vba.OutputFormat[mode_lib->vba.NumberOfActivePlanes] =
 				(enum output_format_class) (dout->output_format);
 		mode_lib->vba.OutputBpp[mode_lib->vba.NumberOfActivePlanes] =
@@ -590,6 +589,7 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 			for (k = j + 1; k < mode_lib->vba.cache_num_pipes; ++k) {
 				display_pipe_source_params_st *src_k = &pipes[k].pipe.src;
 				display_pipe_dest_params_st *dst_k = &pipes[k].pipe.dest;
+				display_output_params_st *dout_k = &pipes[j].dout;
 
 				if (src_k->is_hsplit && !visited[k]
 						&& src->hsplit_grp == src_k->hsplit_grp) {
@@ -600,12 +600,18 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 							== dm_horz) {
 						mode_lib->vba.ViewportWidth[mode_lib->vba.NumberOfActivePlanes] +=
 								src_k->viewport_width;
+						mode_lib->vba.ViewportWidthChroma[mode_lib->vba.NumberOfActivePlanes] +=
+								src_k->viewport_width;
 						mode_lib->vba.ScalerRecoutWidth[mode_lib->vba.NumberOfActivePlanes] +=
 								dst_k->recout_width;
 					} else {
 						mode_lib->vba.ViewportHeight[mode_lib->vba.NumberOfActivePlanes] +=
 								src_k->viewport_height;
+						mode_lib->vba.ViewportHeightChroma[mode_lib->vba.NumberOfActivePlanes] +=
+								src_k->viewport_height;
 					}
+					mode_lib->vba.NumberOfDSCSlices[mode_lib->vba.NumberOfActivePlanes] +=
+							dout_k->dsc_slices;
 
 					visited[k] = true;
 				}
@@ -811,7 +817,9 @@ void ModeSupportAndSystemConfiguration(struct display_mode_lib *mode_lib)
 	unsigned int total_pipes = 0;
 
 	mode_lib->vba.VoltageLevel = mode_lib->vba.cache_pipes[0].clks_cfg.voltage;
-	mode_lib->vba.ReturnBW = mode_lib->vba.ReturnBWPerState[mode_lib->vba.VoltageLevel];
+	mode_lib->vba.ReturnBW = mode_lib->vba.ReturnBWPerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb];
+	if (mode_lib->vba.ReturnBW == 0)
+		mode_lib->vba.ReturnBW = mode_lib->vba.ReturnBWPerState[mode_lib->vba.VoltageLevel][0];
 	mode_lib->vba.FabricAndDRAMBandwidth = mode_lib->vba.FabricAndDRAMBandwidthPerState[mode_lib->vba.VoltageLevel];
 
 	fetch_socbb_params(mode_lib);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index 3eb657ed5714..e7a44df676ca 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -157,6 +157,7 @@ struct vba_vars_st {
 	bool DummyPStateCheck;
 	bool DRAMClockChangeSupportsVActive;
 	bool PrefetchModeSupported;
+	bool PrefetchAndImmediateFlipSupported;
 	enum self_refresh_affinity AllowDRAMSelfRefreshOrDRAMClockChangeInVblank; // Mode Support only
 	double XFCRemoteSurfaceFlipDelay;
 	double TInitXFill;
@@ -318,8 +319,7 @@ struct vba_vars_st {
 	unsigned int DynamicMetadataTransmittedBytes[DC__NUM_DPP__MAX];
 	double DCCRate[DC__NUM_DPP__MAX];
 	double AverageDCCCompressionRate;
-	bool ODMCombineEnabled[DC__NUM_DPP__MAX];
-	enum odm_combine_mode ODMCombineTypeEnabled[DC__NUM_DPP__MAX];
+	enum odm_combine_mode ODMCombineEnabled[DC__NUM_DPP__MAX];
 	double OutputBpp[DC__NUM_DPP__MAX];
 	bool DSCEnabled[DC__NUM_DPP__MAX];
 	unsigned int DSCInputBitPerComponent[DC__NUM_DPP__MAX];
@@ -347,6 +347,7 @@ struct vba_vars_st {
 	unsigned int EffectiveLBLatencyHidingSourceLinesChroma;
 	double BandwidthAvailableForImmediateFlip;
 	unsigned int PrefetchMode[DC__VOLTAGE_STATES + 1][2];
+	unsigned int PrefetchModePerState[DC__VOLTAGE_STATES + 1][2];
 	unsigned int MinPrefetchMode;
 	unsigned int MaxPrefetchMode;
 	bool AnyLinesForVMOrRowTooLarge;
@@ -396,6 +397,7 @@ struct vba_vars_st {
 	bool WritebackLumaAndChromaScalingSupported;
 	bool Cursor64BppSupport;
 	double DCFCLKPerState[DC__VOLTAGE_STATES + 1];
+	double DCFCLKState[DC__VOLTAGE_STATES + 1][2];
 	double FabricClockPerState[DC__VOLTAGE_STATES + 1];
 	double SOCCLKPerState[DC__VOLTAGE_STATES + 1];
 	double PHYCLKPerState[DC__VOLTAGE_STATES + 1];
@@ -444,7 +446,7 @@ struct vba_vars_st {
 	double OutputLinkDPLanes[DC__NUM_DPP__MAX];
 	double ForcedOutputLinkBPP[DC__NUM_DPP__MAX]; // Mode Support only
 	double ImmediateFlipBW[DC__NUM_DPP__MAX];
-	double MaxMaxVStartup;
+	double MaxMaxVStartup[DC__VOLTAGE_STATES + 1][2];
 
 	double WritebackLumaVExtra;
 	double WritebackChromaVExtra;
@@ -471,7 +473,7 @@ struct vba_vars_st {
 	double RoundedUpMaxSwathSizeBytesC;
 	double EffectiveDETLBLinesLuma;
 	double EffectiveDETLBLinesChroma;
-	double ProjectedDCFCLKDeepSleep;
+	double ProjectedDCFCLKDeepSleep[DC__VOLTAGE_STATES + 1][2];
 	double PDEAndMetaPTEBytesPerFrameY;
 	double PDEAndMetaPTEBytesPerFrameC;
 	unsigned int MetaRowBytesY;
@@ -489,12 +491,11 @@ struct vba_vars_st {
 	double FractionOfUrgentBandwidthImmediateFlip; // Mode Support debugging output
 
 	/* ms locals */
-	double IdealSDPPortBandwidthPerState[DC__VOLTAGE_STATES + 1];
+	double IdealSDPPortBandwidthPerState[DC__VOLTAGE_STATES + 1][2];
 	unsigned int NoOfDPP[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
 	int NoOfDPPThisState[DC__NUM_DPP__MAX];
-	bool ODMCombineEnablePerState[DC__VOLTAGE_STATES + 1][DC__NUM_DPP__MAX];
-	enum odm_combine_mode ODMCombineTypeEnablePerState[DC__VOLTAGE_STATES + 1][DC__NUM_DPP__MAX];
-	unsigned int SwathWidthYThisState[DC__NUM_DPP__MAX];
+	enum odm_combine_mode ODMCombineEnablePerState[DC__VOLTAGE_STATES + 1][DC__NUM_DPP__MAX];
+	double SwathWidthYThisState[DC__NUM_DPP__MAX];
 	unsigned int SwathHeightCPerState[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
 	unsigned int SwathHeightYThisState[DC__NUM_DPP__MAX];
 	unsigned int SwathHeightCThisState[DC__NUM_DPP__MAX];
@@ -506,7 +507,7 @@ struct vba_vars_st {
 	double RequiredDPPCLKThisState[DC__NUM_DPP__MAX];
 	bool PTEBufferSizeNotExceededY[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
 	bool PTEBufferSizeNotExceededC[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
-	bool BandwidthWithoutPrefetchSupported[DC__VOLTAGE_STATES + 1];
+	bool BandwidthWithoutPrefetchSupported[DC__VOLTAGE_STATES + 1][2];
 	bool PrefetchSupported[DC__VOLTAGE_STATES + 1][2];
 	bool VRatioInPrefetchSupported[DC__VOLTAGE_STATES + 1][2];
 	double RequiredDISPCLK[DC__VOLTAGE_STATES + 1][2];
@@ -515,22 +516,22 @@ struct vba_vars_st {
 	unsigned int TotalNumberOfActiveDPP[DC__VOLTAGE_STATES + 1][2];
 	unsigned int TotalNumberOfDCCActiveDPP[DC__VOLTAGE_STATES + 1][2];
 	bool ModeSupport[DC__VOLTAGE_STATES + 1][2];
-	double ReturnBWPerState[DC__VOLTAGE_STATES + 1];
+	double ReturnBWPerState[DC__VOLTAGE_STATES + 1][2];
 	bool DIOSupport[DC__VOLTAGE_STATES + 1];
 	bool NotEnoughDSCUnits[DC__VOLTAGE_STATES + 1];
 	bool DSCCLKRequiredMoreThanSupported[DC__VOLTAGE_STATES + 1];
 	bool DTBCLKRequiredMoreThanSupported[DC__VOLTAGE_STATES + 1];
 	double UrgentRoundTripAndOutOfOrderLatencyPerState[DC__VOLTAGE_STATES + 1];
-	bool ROBSupport[DC__VOLTAGE_STATES + 1];
+	bool ROBSupport[DC__VOLTAGE_STATES + 1][2];
 	bool PTEBufferSizeNotExceeded[DC__VOLTAGE_STATES + 1][2];
-	bool TotalVerticalActiveBandwidthSupport[DC__VOLTAGE_STATES + 1];
-	double MaxTotalVerticalActiveAvailableBandwidth[DC__VOLTAGE_STATES + 1];
+	bool TotalVerticalActiveBandwidthSupport[DC__VOLTAGE_STATES + 1][2];
+	double MaxTotalVerticalActiveAvailableBandwidth[DC__VOLTAGE_STATES + 1][2];
 	double PrefetchBW[DC__NUM_DPP__MAX];
-	double PDEAndMetaPTEBytesPerFrame[DC__NUM_DPP__MAX];
-	double MetaRowBytes[DC__NUM_DPP__MAX];
-	double DPTEBytesPerRow[DC__NUM_DPP__MAX];
-	double PrefetchLinesY[DC__NUM_DPP__MAX];
-	double PrefetchLinesC[DC__NUM_DPP__MAX];
+	double PDEAndMetaPTEBytesPerFrame[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double MetaRowBytes[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double DPTEBytesPerRow[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double PrefetchLinesY[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double PrefetchLinesC[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
 	unsigned int MaxNumSwY[DC__NUM_DPP__MAX];
 	unsigned int MaxNumSwC[DC__NUM_DPP__MAX];
 	double PrefillY[DC__NUM_DPP__MAX];
@@ -539,7 +540,7 @@ struct vba_vars_st {
 	double LinesForMetaPTE[DC__NUM_DPP__MAX];
 	double LinesForMetaAndDPTERow[DC__NUM_DPP__MAX];
 	double MinDPPCLKUsingSingleDPP[DC__NUM_DPP__MAX];
-	unsigned int SwathWidthYSingleDPP[DC__NUM_DPP__MAX];
+	double SwathWidthYSingleDPP[DC__NUM_DPP__MAX];
 	double BytePerPixelInDETY[DC__NUM_DPP__MAX];
 	double BytePerPixelInDETC[DC__NUM_DPP__MAX];
 	bool RequiresDSC[DC__VOLTAGE_STATES + 1][DC__NUM_DPP__MAX];
@@ -547,7 +548,7 @@ struct vba_vars_st {
 	double RequiresFEC[DC__VOLTAGE_STATES + 1][DC__NUM_DPP__MAX];
 	double OutputBppPerState[DC__VOLTAGE_STATES + 1][DC__NUM_DPP__MAX];
 	double DSCDelayPerState[DC__VOLTAGE_STATES + 1][DC__NUM_DPP__MAX];
-	bool ViewportSizeSupport[DC__VOLTAGE_STATES + 1];
+	bool ViewportSizeSupport[DC__VOLTAGE_STATES + 1][2];
 	unsigned int Read256BlockHeightY[DC__NUM_DPP__MAX];
 	unsigned int Read256BlockWidthY[DC__NUM_DPP__MAX];
 	unsigned int Read256BlockHeightC[DC__NUM_DPP__MAX];
@@ -562,7 +563,7 @@ struct vba_vars_st {
 	double WriteBandwidth[DC__NUM_DPP__MAX];
 	double PSCL_FACTOR[DC__NUM_DPP__MAX];
 	double PSCL_FACTOR_CHROMA[DC__NUM_DPP__MAX];
-	double MaximumVStartup[DC__NUM_DPP__MAX];
+	double MaximumVStartup[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
 	unsigned int MacroTileWidthY[DC__NUM_DPP__MAX];
 	unsigned int MacroTileWidthC[DC__NUM_DPP__MAX];
 	double AlignedDCCMetaPitch[DC__NUM_DPP__MAX];
@@ -579,7 +580,7 @@ struct vba_vars_st {
 	bool ImmediateFlipSupportedForState[DC__VOLTAGE_STATES + 1][2];
 	double WritebackDelay[DC__VOLTAGE_STATES + 1][DC__NUM_DPP__MAX];
 	unsigned int vm_group_bytes[DC__NUM_DPP__MAX];
-	long dpte_group_bytes[DC__NUM_DPP__MAX];
+	unsigned int dpte_group_bytes[DC__NUM_DPP__MAX];
 	unsigned int dpte_row_height[DC__NUM_DPP__MAX];
 	unsigned int meta_req_height[DC__NUM_DPP__MAX];
 	unsigned int meta_req_width[DC__NUM_DPP__MAX];
@@ -605,14 +606,14 @@ struct vba_vars_st {
 	double UrgentBurstFactorChroma[DC__NUM_DPP__MAX];
 	double UrgentBurstFactorChromaPre[DC__NUM_DPP__MAX];
 
+
 	bool           MPCCombine[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
 	double         SwathWidthCSingleDPP[DC__NUM_DPP__MAX];
 	double         MaximumSwathWidthInLineBufferLuma;
 	double         MaximumSwathWidthInLineBufferChroma;
 	double         MaximumSwathWidthLuma[DC__NUM_DPP__MAX];
 	double         MaximumSwathWidthChroma[DC__NUM_DPP__MAX];
-	bool odm_combine_dummy[DC__NUM_DPP__MAX];
-	enum odm_combine_mode odm_combine_mode_dummy[DC__NUM_DPP__MAX];
+	enum odm_combine_mode odm_combine_dummy[DC__NUM_DPP__MAX];
 	double         dummy1[DC__NUM_DPP__MAX];
 	double         dummy2[DC__NUM_DPP__MAX];
 	double         dummy3[DC__NUM_DPP__MAX];
@@ -622,9 +623,9 @@ struct vba_vars_st {
 	double         dummy7[DC__NUM_DPP__MAX];
 	double         dummy8[DC__NUM_DPP__MAX];
 	unsigned int        dummyinteger1ms[DC__NUM_DPP__MAX];
-	unsigned int        dummyinteger2ms[DC__NUM_DPP__MAX];
+	double        dummyinteger2ms[DC__NUM_DPP__MAX];
 	unsigned int        dummyinteger3[DC__NUM_DPP__MAX];
-	unsigned int        dummyinteger4;
+	unsigned int        dummyinteger4[DC__NUM_DPP__MAX];
 	unsigned int        dummyinteger5;
 	unsigned int        dummyinteger6;
 	unsigned int        dummyinteger7;
@@ -637,7 +638,6 @@ struct vba_vars_st {
 	unsigned int        dummyintegerarr2[DC__NUM_DPP__MAX];
 	unsigned int        dummyintegerarr3[DC__NUM_DPP__MAX];
 	unsigned int        dummyintegerarr4[DC__NUM_DPP__MAX];
-	long                dummylongarr1[DC__NUM_DPP__MAX];
 	bool           dummysinglestring;
 	bool           SingleDPPViewportSizeSupportPerPlane[DC__NUM_DPP__MAX];
 	double         PlaneRequiredDISPCLKWithODMCombine2To1;
@@ -645,20 +645,19 @@ struct vba_vars_st {
 	unsigned int   TotalNumberOfSingleDPPPlanes[DC__VOLTAGE_STATES + 1][2];
 	bool           LinkDSCEnable;
 	bool           ODMCombine4To1SupportCheckOK[DC__VOLTAGE_STATES + 1];
-	bool ODMCombineEnableThisState[DC__NUM_DPP__MAX];
-	enum odm_combine_mode ODMCombineEnableTypeThisState[DC__NUM_DPP__MAX];
-	unsigned int   SwathWidthCThisState[DC__NUM_DPP__MAX];
+	enum odm_combine_mode ODMCombineEnableThisState[DC__NUM_DPP__MAX];
+	double   SwathWidthCThisState[DC__NUM_DPP__MAX];
 	bool           ViewportSizeSupportPerPlane[DC__NUM_DPP__MAX];
 	double         AlignedDCCMetaPitchY[DC__NUM_DPP__MAX];
 	double         AlignedDCCMetaPitchC[DC__NUM_DPP__MAX];
 
 	unsigned int NotEnoughUrgentLatencyHiding;
 	unsigned int NotEnoughUrgentLatencyHidingPre;
-	long PTEBufferSizeInRequestsForLuma;
-	long PTEBufferSizeInRequestsForChroma;
+	int PTEBufferSizeInRequestsForLuma;
+	int PTEBufferSizeInRequestsForChroma;
 
 	// Missing from VBA
-	long dpte_group_bytes_chroma;
+	int dpte_group_bytes_chroma;
 	unsigned int vm_group_bytes_chroma;
 	double dst_x_after_scaler;
 	double dst_y_after_scaler;
@@ -683,8 +682,8 @@ struct vba_vars_st {
 	double MinTTUVBlank[DC__NUM_DPP__MAX];
 	double BytePerPixelDETY[DC__NUM_DPP__MAX];
 	double BytePerPixelDETC[DC__NUM_DPP__MAX];
-	unsigned int SwathWidthY[DC__NUM_DPP__MAX];
-	unsigned int SwathWidthSingleDPPY[DC__NUM_DPP__MAX];
+	double SwathWidthY[DC__NUM_DPP__MAX];
+	double SwathWidthSingleDPPY[DC__NUM_DPP__MAX];
 	double CursorRequestDeliveryTime[DC__NUM_DPP__MAX];
 	double CursorRequestDeliveryTimePrefetch[DC__NUM_DPP__MAX];
 	double ReadBandwidthPlaneLuma[DC__NUM_DPP__MAX];
@@ -760,8 +759,8 @@ struct vba_vars_st {
 	double LinesInDETY[DC__NUM_DPP__MAX];
 	double LinesInDETYRoundedDownToSwath[DC__NUM_DPP__MAX];
 
-	unsigned int SwathWidthSingleDPPC[DC__NUM_DPP__MAX];
-	unsigned int SwathWidthC[DC__NUM_DPP__MAX];
+	double SwathWidthSingleDPPC[DC__NUM_DPP__MAX];
+	double SwathWidthC[DC__NUM_DPP__MAX];
 	unsigned int BytePerPixelY[DC__NUM_DPP__MAX];
 	unsigned int BytePerPixelC[DC__NUM_DPP__MAX];
 	long dummyinteger1;
@@ -779,6 +778,7 @@ struct vba_vars_st {
 	unsigned int DCCCMaxCompressedBlock[DC__NUM_DPP__MAX];
 	unsigned int DCCCIndependent64ByteBlock[DC__NUM_DPP__MAX];
 	double VStartupMargin;
+	bool NotEnoughTimeForDynamicMetadata;
 
 	/* Missing from VBA */
 	unsigned int MaximumMaxVStartupLines;
@@ -814,7 +814,7 @@ struct vba_vars_st {
 	unsigned int ViewportHeightChroma[DC__NUM_DPP__MAX];
 	double HRatioChroma[DC__NUM_DPP__MAX];
 	double VRatioChroma[DC__NUM_DPP__MAX];
-	long WritebackSourceWidth[DC__NUM_DPP__MAX];
+	int WritebackSourceWidth[DC__NUM_DPP__MAX];
 
 	bool ModeIsSupported;
 	bool ODMCombine4To1Supported;
@@ -850,6 +850,58 @@ struct vba_vars_st {
 	unsigned int MaxNumHDMIFRLOutputs;
 	int    AudioSampleRate[DC__NUM_DPP__MAX];
 	int    AudioSampleLayout[DC__NUM_DPP__MAX];
+
+	int PercentMarginOverMinimumRequiredDCFCLK;
+	bool DynamicMetadataSupported[DC__VOLTAGE_STATES + 1][2];
+	enum immediate_flip_requirement ImmediateFlipRequirement;
+	double DETBufferSizeYThisState[DC__NUM_DPP__MAX];
+	double DETBufferSizeCThisState[DC__NUM_DPP__MAX];
+	bool NoUrgentLatencyHiding[DC__NUM_DPP__MAX];
+	bool NoUrgentLatencyHidingPre[DC__NUM_DPP__MAX];
+	int swath_width_luma_ub_this_state[DC__NUM_DPP__MAX];
+	int swath_width_chroma_ub_this_state[DC__NUM_DPP__MAX];
+	double UrgLatency[DC__VOLTAGE_STATES + 1];
+	double VActiveCursorBandwidth[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double VActivePixelBandwidth[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	bool NoTimeForPrefetch[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	bool NoTimeForDynamicMetadata[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double dpte_row_bandwidth[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double meta_row_bandwidth[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double DETBufferSizeYAllStates[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double DETBufferSizeCAllStates[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	int swath_width_luma_ub_all_states[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	int swath_width_chroma_ub_all_states[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	bool NotUrgentLatencyHiding[DC__VOLTAGE_STATES + 1][2];
+	unsigned int SwathHeightYAllStates[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	unsigned int SwathHeightCAllStates[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	unsigned int SwathWidthYAllStates[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	unsigned int SwathWidthCAllStates[DC__VOLTAGE_STATES + 1][2][DC__NUM_DPP__MAX];
+	double TotalDPTERowBandwidth[DC__VOLTAGE_STATES + 1][2];
+	double TotalMetaRowBandwidth[DC__VOLTAGE_STATES + 1][2];
+	double TotalVActiveCursorBandwidth[DC__VOLTAGE_STATES + 1][2];
+	double TotalVActivePixelBandwidth[DC__VOLTAGE_STATES + 1][2];
+	bool UseMinimumRequiredDCFCLK;
+	double WritebackDelayTime[DC__NUM_DPP__MAX];
+	unsigned int DCCYIndependentBlock[DC__NUM_DPP__MAX];
+	unsigned int DCCCIndependentBlock[DC__NUM_DPP__MAX];
+	unsigned int dummyinteger15;
+	unsigned int dummyinteger16;
+	unsigned int dummyinteger17;
+	unsigned int dummyinteger18;
+	unsigned int dummyinteger19;
+	unsigned int dummyinteger20;
+	unsigned int dummyinteger21;
+	unsigned int dummyinteger22;
+	unsigned int dummyinteger23;
+	unsigned int dummyinteger24;
+	unsigned int dummyinteger25;
+	unsigned int dummyinteger26;
+	unsigned int dummyinteger27;
+	unsigned int dummyinteger28;
+	unsigned int dummyinteger29;
+	bool dummystring[DC__NUM_DPP__MAX];
+	double BPP;
+	enum odm_combine_policy ODMCombinePolicy;
 };
 
 bool CalculateMinAndMaxPrefetchMode(
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

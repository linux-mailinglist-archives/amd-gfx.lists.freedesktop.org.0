Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CEF576EEC
	for <lists+amd-gfx@lfdr.de>; Sat, 16 Jul 2022 16:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754F810FA74;
	Sat, 16 Jul 2022 14:36:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BC810E275
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Jul 2022 18:17:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNrlp8sj3IWHOKtveejsKFaxHtQrtMon+C4ujB8u2IPGe9dFtuSWaJS83jE2lV6FadMhK8beVJ3SaTt6RsPjb4G9AWfeOUBCm5o2cVfXlUUS+Zf6KJpsYUEhTL118SdivZREKsRejiJ9BFbIcMYY3XclfSBj6e4CjJ/I4v3PSW592oIrC/sAnPBRE5YBltGivN9TskRYft5r+6RzjuWJmPhFWNI+cfMjMsB8fmNMvM/mub+ccfdGAXWXZT7sHy/egAabVsombKl48m5W0YHi2/hUJ8/WWY8ZVhwjqeUbZk5obDxeTYwIS69ipffYGXnmVqnteHASFZ4iilDpd+Ez7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWes/BGGO+bFkxtM2HRddqCJ7mZN/a3+F+7AanOreAk=;
 b=HUwzx7KgM1omaZ2L17O4mY94SxFLeuYEf7F/XvGC9FFRRZofLizMcEBYDEv7gr8fv/O5RXhiozRHAip6OaR0oRZcPHIBcGZTNIgtYjQmO3u7bZrYpNZ9v5+yLxH0af4QbfnMEY+m47LIpviHHfbvYjyZNk15LqOQh6goBHWvJpDFWLwtc0BLKSrrN1u6g7lLhT/oaVYD3GwytueALzzBC2UQkxpbepQiQAsHuFxMra74jR71Kej4hYxWocBt9fJN3lEVfD9qONU+T6lao7Xvbqb/KJkqtV3nih7d6pJBHI52jMXoCBD+gVTBhmZ3LeCwjwF3H61syzVI0XhAZRhPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWes/BGGO+bFkxtM2HRddqCJ7mZN/a3+F+7AanOreAk=;
 b=mzoC6Zapb1zdlCpRUBBgZW2tiL89JonMzGyfGLTkU+6sgOmjoIrNaS2K1ocKoePh8A2gPlM8TeBpwhLystBbxWKABpyc4f/bACSmc2piKkfwLsoJLJzxAs3TMwe2R37hwVHclf1ydc8FALMeiRJmL0jEC1nmuO/hIlorcVhf3y8=
Received: from MWH0EPF00056D04.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:c) by DM6PR12MB4809.namprd12.prod.outlook.com
 (2603:10b6:5:1f9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Fri, 15 Jul
 2022 18:17:53 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::201) by MWH0EPF00056D04.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.5 via Frontend
 Transport; Fri, 15 Jul 2022 18:17:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 18:17:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 13:17:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 13:17:51 -0500
Received: from arch-sec.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Fri, 15 Jul 2022 13:17:51 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 23/31] drm/amd/display: Move SubVP functions to dcn32_fpu
Date: Fri, 15 Jul 2022 14:16:57 -0400
Message-ID: <20220715181705.1030401-24-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220715181705.1030401-1-Rodrigo.Siqueira@amd.com>
References: <20220715181705.1030401-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98f85f4b-d633-4c6d-a4e8-08da668e55a6
X-MS-TrafficTypeDiagnostic: DM6PR12MB4809:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+BAn1C9EjtWFr3xJB0Fbles1/JAXAS6FSWzjPb7ALzC//SKm0RrdMu69ub4CRXdg+sYVRBbJvOrigKI8MjjmZ8R9hr6gGb/Kg6W/ylZM3hANuOYFAGZ/W0QYLhluS50mw/6ZiVvsS6cFeysrLnE+UOwReqN658ebI3xUtxrKw3hcuUPgiXVLFSgyF2cDlSxf/3VQfk50AgOXuq3IQBUn0n2XzDBNdwxIs/l0eAIViuWcwuQ/Rtm8liWxrCx8/mq7Whjw5WAmwo08Hu/nafTCHQwyt1qREb76V6FF8fdTigiGLVshUBsDF0KQU9hUY/CIf7TgdG89RXfE11aOB86axzpU37EQ1sIneFP7XhLSfZQqf1WVWKZwUaeO+PSL6s6Hr3gr1MBHyiOMmuvFKCaMxJVJYCEup8PEIly2U0hyb/icm0alq1dyWByC9pWCurHMVFrzh3xzTM59EpLpP86sT/fvo2zMVDBHTTHZ/x7t6vXr89VFhjl7xuGhS9gjppYdFfIiAd1zULWDX2CM0GzhrFGycFfuh9/VeXHKeEkrMYTU0kLCe9X9cnCeQaUX6O4B1OtmenScTgxLMMLs/jFtUlI+srndUjrhFSMpAPcdQKkaVlJfFsd0KhH8AhZdcpnv95wk4x07ATAS4zBj/c7xlxklAG1Rz9MjLgGWQhryv/iS3Y/ZRZUQaBtD7YzEVbLGV+/NQto3xQ953vtkqKd8h0q1ztzYwlDZRNRt7QmUPg7T9BxVzKo9NrLBZz+WfGUTjXaeNlUXyo0xvoBoPplnnfSJnDS6tPXv5U+nrPIEuYeJl67QQCjWNl5Bl+L4NMZCQ0AANLwu8Byp+NrWOwyN2LlU93vx33WC2H0gs6xUbhy3kQ3OOifk8oJcPoR3/7n
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(40470700004)(36840700001)(46966006)(83380400001)(4326008)(336012)(70206006)(40480700001)(36756003)(47076005)(81166007)(6916009)(8676002)(316002)(36860700001)(356005)(186003)(82740400003)(70586007)(426003)(40460700003)(86362001)(54906003)(1076003)(478600001)(41300700001)(82310400005)(30864003)(26005)(2616005)(8936002)(5660300002)(2906002)(36900700001)(559001)(579004)(44824005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 18:17:53.2845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f85f4b-d633-4c6d-a4e8-08da668e55a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4809
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
Cc: stylon.wang@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, Aurabindo.Pillai@amd.com, wayne.lin@amd.com,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

It looks like many of the code related to SubVP uses FPU operation, and
we have many static functions that are part of this feature. This commit
is a little bit large, but it only moves SubVP operation from one file
to another, and I had to do it in a single change due to dependencies
between functions.

Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../drm/amd/display/dc/dcn32/dcn32_resource.c | 597 +-----------------
 .../drm/amd/display/dc/dcn32/dcn32_resource.h |   2 +
 .../display/dc/dcn32/dcn32_resource_helpers.c |  11 +
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  | 597 ++++++++++++++++++
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.h  |   8 +
 5 files changed, 620 insertions(+), 595 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index a1bf24ad0787..d508909ff7a9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -1625,171 +1625,6 @@ bool dcn32_release_post_bldn_3dlut(
 	return ret;
 }
 
-/**
- ********************************************************************************************
- * dcn32_get_num_free_pipes: Calculate number of free pipes
- *
- * This function assumes that a "used" pipe is a pipe that has
- * both a stream and a plane assigned to it.
- *
- * @param [in] dc: current dc state
- * @param [in] context: new dc state
- *
- * @return: Number of free pipes available in the context
- *
- ********************************************************************************************
- */
-static unsigned int dcn32_get_num_free_pipes(struct dc *dc, struct dc_state *context)
-{
-	unsigned int i;
-	unsigned int free_pipes = 0;
-	unsigned int num_pipes = 0;
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-
-		if (pipe->stream && !pipe->top_pipe) {
-			while (pipe) {
-				num_pipes++;
-				pipe = pipe->bottom_pipe;
-			}
-		}
-	}
-
-	free_pipes = dc->res_pool->pipe_count - num_pipes;
-	return free_pipes;
-}
-
-/**
- ********************************************************************************************
- * dcn32_assign_subvp_pipe: Function to decide which pipe will use Sub-VP.
- *
- * We enter this function if we are Sub-VP capable (i.e. enough pipes available)
- * and regular P-State switching (i.e. VACTIVE/VBLANK) is not supported, or if
- * we are forcing SubVP P-State switching on the current config.
- *
- * The number of pipes used for the chosen surface must be less than or equal to the
- * number of free pipes available.
- *
- * In general we choose surfaces with the longest frame time first (better for SubVP + VBLANK).
- * For multi-display cases the ActiveDRAMClockChangeMargin doesn't provide enough info on its own
- * for determining which should be the SubVP pipe (need a way to determine if a pipe / plane doesn't
- * support MCLK switching naturally [i.e. ACTIVE or VBLANK]).
- *
- * @param [in] dc: current dc state
- * @param [in] context: new dc state
- * @param [out] index: dc pipe index for the pipe chosen to have phantom pipes assigned
- *
- * @return: True if a valid pipe assignment was found for Sub-VP. Otherwise false.
- *
- ********************************************************************************************
- */
-
-static bool dcn32_assign_subvp_pipe(struct dc *dc,
-		struct dc_state *context,
-		unsigned int *index)
-{
-	unsigned int i, pipe_idx;
-	unsigned int max_frame_time = 0;
-	bool valid_assignment_found = false;
-	unsigned int free_pipes = dcn32_get_num_free_pipes(dc, context);
-	bool current_assignment_freesync = false;
-
-	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-		unsigned int num_pipes = 0;
-
-		if (!pipe->stream)
-			continue;
-
-		if (pipe->plane_state && !pipe->top_pipe &&
-				pipe->stream->mall_stream_config.type == SUBVP_NONE) {
-			while (pipe) {
-				num_pipes++;
-				pipe = pipe->bottom_pipe;
-			}
-
-			pipe = &context->res_ctx.pipe_ctx[i];
-			if (num_pipes <= free_pipes) {
-				struct dc_stream_state *stream = pipe->stream;
-				unsigned int frame_us = (stream->timing.v_total * stream->timing.h_total /
-						(double)(stream->timing.pix_clk_100hz * 100)) * 1000000;
-				if (frame_us > max_frame_time && !stream->ignore_msa_timing_param) {
-					*index = i;
-					max_frame_time = frame_us;
-					valid_assignment_found = true;
-					current_assignment_freesync = false;
-				/* For the 2-Freesync display case, still choose the one with the
-			     * longest frame time
-			     */
-				} else if (stream->ignore_msa_timing_param && (!valid_assignment_found ||
-						(current_assignment_freesync && frame_us > max_frame_time))) {
-					*index = i;
-					valid_assignment_found = true;
-					current_assignment_freesync = true;
-				}
-			}
-		}
-		pipe_idx++;
-	}
-	return valid_assignment_found;
-}
-
-/**
- * ***************************************************************************************
- * dcn32_enough_pipes_for_subvp: Function to check if there are "enough" pipes for SubVP.
- *
- * This function returns true if there are enough free pipes
- * to create the required phantom pipes for any given stream
- * (that does not already have phantom pipe assigned).
- *
- * e.g. For a 2 stream config where the first stream uses one
- * pipe and the second stream uses 2 pipes (i.e. pipe split),
- * this function will return true because there is 1 remaining
- * pipe which can be used as the phantom pipe for the non pipe
- * split pipe.
- *
- * @param [in] dc: current dc state
- * @param [in] context: new dc state
- *
- * @return: True if there are enough free pipes to assign phantom pipes to at least one
- *          stream that does not already have phantom pipes assigned. Otherwise false.
- *
- * ***************************************************************************************
- */
-static bool dcn32_enough_pipes_for_subvp(struct dc *dc, struct dc_state *context)
-{
-	unsigned int i, split_cnt, free_pipes;
-	unsigned int min_pipe_split = dc->res_pool->pipe_count + 1; // init as max number of pipes + 1
-	bool subvp_possible = false;
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-
-		// Find the minimum pipe split count for non SubVP pipes
-		if (pipe->stream && !pipe->top_pipe &&
-				pipe->stream->mall_stream_config.type == SUBVP_NONE) {
-			split_cnt = 0;
-			while (pipe) {
-				split_cnt++;
-				pipe = pipe->bottom_pipe;
-			}
-
-			if (split_cnt < min_pipe_split)
-				min_pipe_split = split_cnt;
-		}
-	}
-
-	free_pipes = dcn32_get_num_free_pipes(dc, context);
-
-	// SubVP only possible if at least one pipe is being used (i.e. free_pipes
-	// should not equal to the pipe_count)
-	if (free_pipes >= min_pipe_split && free_pipes < dc->res_pool->pipe_count)
-		subvp_possible = true;
-
-	return subvp_possible;
-}
-
 static void dcn32_enable_phantom_plane(struct dc *dc,
 		struct dc_state *context,
 		struct dc_stream_state *phantom_stream,
@@ -2034,436 +1869,6 @@ static struct pipe_ctx *dcn32_find_split_pipe(
 	return pipe;
 }
 
-
-/**
- * ***************************************************************************************
- * subvp_subvp_schedulable: Determine if SubVP + SubVP config is schedulable
- *
- * High level algorithm:
- * 1. Find longest microschedule length (in us) between the two SubVP pipes
- * 2. Check if the worst case overlap (VBLANK in middle of ACTIVE) for both
- * pipes still allows for the maximum microschedule to fit in the active
- * region for both pipes.
- *
- * @param [in] dc: current dc state
- * @param [in] context: new dc state
- *
- * @return: bool - True if the SubVP + SubVP config is schedulable, false otherwise
- *
- * ***************************************************************************************
- */
-static bool subvp_subvp_schedulable(struct dc *dc, struct dc_state *context)
-{
-	struct pipe_ctx *subvp_pipes[2];
-	struct dc_stream_state *phantom = NULL;
-	uint32_t microschedule_lines = 0;
-	uint32_t index = 0;
-	uint32_t i;
-	uint32_t max_microschedule_us = 0;
-	int32_t vactive1_us, vactive2_us, vblank1_us, vblank2_us;
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-		uint32_t time_us = 0;
-
-		/* Loop to calculate the maximum microschedule time between the two SubVP pipes,
-		 * and also to store the two main SubVP pipe pointers in subvp_pipes[2].
-		 */
-		if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
-				pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
-			phantom = pipe->stream->mall_stream_config.paired_stream;
-			microschedule_lines = (phantom->timing.v_total - phantom->timing.v_front_porch) +
-					phantom->timing.v_addressable;
-
-			// Round up when calculating microschedule time (+ 1 at the end)
-			time_us = (microschedule_lines * phantom->timing.h_total) /
-					(double)(phantom->timing.pix_clk_100hz * 100) * 1000000 +
-						dc->caps.subvp_prefetch_end_to_mall_start_us +
-						dc->caps.subvp_fw_processing_delay_us + 1;
-			if (time_us > max_microschedule_us)
-				max_microschedule_us = time_us;
-
-			subvp_pipes[index] = pipe;
-			index++;
-
-			// Maximum 2 SubVP pipes
-			if (index == 2)
-				break;
-		}
-	}
-	vactive1_us = ((subvp_pipes[0]->stream->timing.v_addressable * subvp_pipes[0]->stream->timing.h_total) /
-			(double)(subvp_pipes[0]->stream->timing.pix_clk_100hz * 100)) * 1000000;
-	vactive2_us = ((subvp_pipes[1]->stream->timing.v_addressable * subvp_pipes[1]->stream->timing.h_total) /
-				(double)(subvp_pipes[1]->stream->timing.pix_clk_100hz * 100)) * 1000000;
-	vblank1_us = (((subvp_pipes[0]->stream->timing.v_total - subvp_pipes[0]->stream->timing.v_addressable) *
-			subvp_pipes[0]->stream->timing.h_total) /
-			(double)(subvp_pipes[0]->stream->timing.pix_clk_100hz * 100)) * 1000000;
-	vblank2_us = (((subvp_pipes[1]->stream->timing.v_total - subvp_pipes[1]->stream->timing.v_addressable) *
-			subvp_pipes[1]->stream->timing.h_total) /
-			(double)(subvp_pipes[1]->stream->timing.pix_clk_100hz * 100)) * 1000000;
-
-	if ((vactive1_us - vblank2_us) / 2 > max_microschedule_us &&
-			(vactive2_us - vblank1_us) / 2 > max_microschedule_us)
-		return true;
-
-	return false;
-}
-
-/**
- * ***************************************************************************************
- * subvp_drr_schedulable: Determine if SubVP + DRR config is schedulable
- *
- * High level algorithm:
- * 1. Get timing for SubVP pipe, phantom pipe, and DRR pipe
- * 2. Determine the frame time for the DRR display when adding required margin for MCLK switching
- * (the margin is equal to the MALL region + DRR margin (500us))
- * 3.If (SubVP Active - Prefetch > Stretched DRR frame + max(MALL region, Stretched DRR frame))
- * then report the configuration as supported
- *
- * @param [in] dc: current dc state
- * @param [in] context: new dc state
- * @param [in] drr_pipe: DRR pipe_ctx for the SubVP + DRR config
- *
- * @return: bool - True if the SubVP + DRR config is schedulable, false otherwise
- *
- * ***************************************************************************************
- */
-static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context, struct pipe_ctx *drr_pipe)
-{
-	bool schedulable = false;
-	uint32_t i;
-	struct pipe_ctx *pipe = NULL;
-	struct dc_crtc_timing *main_timing = NULL;
-	struct dc_crtc_timing *phantom_timing = NULL;
-	struct dc_crtc_timing *drr_timing = NULL;
-	int16_t prefetch_us = 0;
-	int16_t mall_region_us = 0;
-	int16_t drr_frame_us = 0;	// nominal frame time
-	int16_t subvp_active_us = 0;
-	int16_t stretched_drr_us = 0;
-	int16_t drr_stretched_vblank_us = 0;
-	int16_t max_vblank_mallregion = 0;
-
-	// Find SubVP pipe
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		pipe = &context->res_ctx.pipe_ctx[i];
-
-		// We check for master pipe, but it shouldn't matter since we only need
-		// the pipe for timing info (stream should be same for any pipe splits)
-		if (!pipe->stream || !pipe->plane_state || pipe->top_pipe || pipe->prev_odm_pipe)
-			continue;
-
-		// Find the SubVP pipe
-		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN)
-			break;
-	}
-
-	main_timing = &pipe->stream->timing;
-	phantom_timing = &pipe->stream->mall_stream_config.paired_stream->timing;
-	drr_timing = &drr_pipe->stream->timing;
-	prefetch_us = (phantom_timing->v_total - phantom_timing->v_front_porch) * phantom_timing->h_total /
-			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000 +
-			dc->caps.subvp_prefetch_end_to_mall_start_us;
-	subvp_active_us = main_timing->v_addressable * main_timing->h_total /
-			(double)(main_timing->pix_clk_100hz * 100) * 1000000;
-	drr_frame_us = drr_timing->v_total * drr_timing->h_total /
-			(double)(drr_timing->pix_clk_100hz * 100) * 1000000;
-	// P-State allow width and FW delays already included phantom_timing->v_addressable
-	mall_region_us = phantom_timing->v_addressable * phantom_timing->h_total /
-			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000;
-	stretched_drr_us = drr_frame_us + mall_region_us + SUBVP_DRR_MARGIN_US;
-	drr_stretched_vblank_us = (drr_timing->v_total - drr_timing->v_addressable) * drr_timing->h_total /
-			(double)(drr_timing->pix_clk_100hz * 100) * 1000000 + (stretched_drr_us - drr_frame_us);
-	max_vblank_mallregion = drr_stretched_vblank_us > mall_region_us ? drr_stretched_vblank_us : mall_region_us;
-
-	/* We consider SubVP + DRR schedulable if the stretched frame duration of the DRR display (i.e. the
-	 * highest refresh rate + margin that can support UCLK P-State switch) passes the static analysis
-	 * for VBLANK: (VACTIVE region of the SubVP pipe can fit the MALL prefetch, VBLANK frame time,
-	 * and the max of (VBLANK blanking time, MALL region)).
-	 */
-	if (stretched_drr_us < (1 / (double)drr_timing->min_refresh_in_uhz) * 1000000 * 1000000 &&
-			subvp_active_us - prefetch_us - stretched_drr_us - max_vblank_mallregion > 0)
-		schedulable = true;
-
-	return schedulable;
-}
-
-/**
- * ***************************************************************************************
- * subvp_vblank_schedulable: Determine if SubVP + VBLANK config is schedulable
- *
- * High level algorithm:
- * 1. Get timing for SubVP pipe, phantom pipe, and VBLANK pipe
- * 2. If (SubVP Active - Prefetch > Vblank Frame Time + max(MALL region, Vblank blanking time))
- * then report the configuration as supported
- * 3. If the VBLANK display is DRR, then take the DRR static schedulability path
- *
- * @param [in] dc: current dc state
- * @param [in] context: new dc state
- *
- * @return: bool - True if the SubVP + VBLANK/DRR config is schedulable, false otherwise
- *
- * ***************************************************************************************
- */
-static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
-{
-	struct pipe_ctx *pipe = NULL;
-	struct pipe_ctx *subvp_pipe = NULL;
-	bool found = false;
-	bool schedulable = false;
-	uint32_t i = 0;
-	uint8_t vblank_index = 0;
-	uint16_t prefetch_us = 0;
-	uint16_t mall_region_us = 0;
-	uint16_t vblank_frame_us = 0;
-	uint16_t subvp_active_us = 0;
-	uint16_t vblank_blank_us = 0;
-	uint16_t max_vblank_mallregion = 0;
-	struct dc_crtc_timing *main_timing = NULL;
-	struct dc_crtc_timing *phantom_timing = NULL;
-	struct dc_crtc_timing *vblank_timing = NULL;
-
-	/* For SubVP + VBLANK/DRR cases, we assume there can only be
-	 * a single VBLANK/DRR display. If DML outputs SubVP + VBLANK
-	 * is supported, it is either a single VBLANK case or two VBLANK
-	 * displays which are synchronized (in which case they have identical
-	 * timings).
-	 */
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		pipe = &context->res_ctx.pipe_ctx[i];
-
-		// We check for master pipe, but it shouldn't matter since we only need
-		// the pipe for timing info (stream should be same for any pipe splits)
-		if (!pipe->stream || !pipe->plane_state || pipe->top_pipe || pipe->prev_odm_pipe)
-			continue;
-
-		if (!found && pipe->stream->mall_stream_config.type == SUBVP_NONE) {
-			// Found pipe which is not SubVP or Phantom (i.e. the VBLANK pipe).
-			vblank_index = i;
-			found = true;
-		}
-
-		if (!subvp_pipe && pipe->stream->mall_stream_config.type == SUBVP_MAIN)
-			subvp_pipe = pipe;
-	}
-	// Use ignore_msa_timing_param flag to identify as DRR
-	if (found && context->res_ctx.pipe_ctx[vblank_index].stream->ignore_msa_timing_param) {
-		// SUBVP + DRR case
-		schedulable = subvp_drr_schedulable(dc, context, &context->res_ctx.pipe_ctx[vblank_index]);
-	} else if (found) {
-		main_timing = &subvp_pipe->stream->timing;
-		phantom_timing = &subvp_pipe->stream->mall_stream_config.paired_stream->timing;
-		vblank_timing = &context->res_ctx.pipe_ctx[vblank_index].stream->timing;
-		// Prefetch time is equal to VACTIVE + BP + VSYNC of the phantom pipe
-		// Also include the prefetch end to mallstart delay time
-		prefetch_us = (phantom_timing->v_total - phantom_timing->v_front_porch) * phantom_timing->h_total /
-				(double)(phantom_timing->pix_clk_100hz * 100) * 1000000 +
-				dc->caps.subvp_prefetch_end_to_mall_start_us;
-		// P-State allow width and FW delays already included phantom_timing->v_addressable
-		mall_region_us = phantom_timing->v_addressable * phantom_timing->h_total /
-				(double)(phantom_timing->pix_clk_100hz * 100) * 1000000;
-		vblank_frame_us = vblank_timing->v_total * vblank_timing->h_total /
-				(double)(vblank_timing->pix_clk_100hz * 100) * 1000000;
-		vblank_blank_us =  (vblank_timing->v_total - vblank_timing->v_addressable) * vblank_timing->h_total /
-				(double)(vblank_timing->pix_clk_100hz * 100) * 1000000;
-		subvp_active_us = main_timing->v_addressable * main_timing->h_total /
-				(double)(main_timing->pix_clk_100hz * 100) * 1000000;
-		max_vblank_mallregion = vblank_blank_us > mall_region_us ? vblank_blank_us : mall_region_us;
-
-		// Schedulable if VACTIVE region of the SubVP pipe can fit the MALL prefetch, VBLANK frame time,
-		// and the max of (VBLANK blanking time, MALL region)
-		// TODO: Possibly add some margin (i.e. the below conditions should be [...] > X instead of [...] > 0)
-		if (subvp_active_us - prefetch_us - vblank_frame_us - max_vblank_mallregion > 0)
-			schedulable = true;
-	}
-	return schedulable;
-}
-
-/**
- * ********************************************************************************************
- * subvp_validate_static_schedulability: Check which SubVP case is calculated and handle
- * static analysis based on the case.
- *
- * Three cases:
- * 1. SubVP + SubVP
- * 2. SubVP + VBLANK (DRR checked internally)
- * 3. SubVP + VACTIVE (currently unsupported)
- *
- * @param [in] dc: current dc state
- * @param [in] context: new dc state
- * @param [in] vlevel: Voltage level calculated by DML
- *
- * @return: bool - True if statically schedulable, false otherwise
- *
- * ********************************************************************************************
- */
-static bool subvp_validate_static_schedulability(struct dc *dc,
-				struct dc_state *context,
-				int vlevel)
-{
-	bool schedulable = true;	// true by default for single display case
-	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
-	uint32_t i, pipe_idx;
-	uint8_t subvp_count = 0;
-	uint8_t vactive_count = 0;
-
-	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-
-		if (!pipe->stream)
-			continue;
-
-		if (pipe->plane_state && !pipe->top_pipe &&
-				pipe->stream->mall_stream_config.type == SUBVP_MAIN)
-			subvp_count++;
-
-		// Count how many planes are capable of VACTIVE switching (SubVP + VACTIVE unsupported)
-		if (vba->ActiveDRAMClockChangeLatencyMargin[vba->pipe_plane[pipe_idx]] > 0) {
-			vactive_count++;
-		}
-		pipe_idx++;
-	}
-
-	if (subvp_count == 2) {
-		// Static schedulability check for SubVP + SubVP case
-		schedulable = subvp_subvp_schedulable(dc, context);
-	} else if (vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_vblank_w_mall_sub_vp) {
-		// Static schedulability check for SubVP + VBLANK case. Also handle the case where
-		// DML outputs SubVP + VBLANK + VACTIVE (DML will report as SubVP + VBLANK)
-		if (vactive_count > 0)
-			schedulable = false;
-		else
-			schedulable = subvp_vblank_schedulable(dc, context);
-	} else if (vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_vactive_w_mall_sub_vp) {
-		// SubVP + VACTIVE currently unsupported
-		schedulable = false;
-	}
-	return schedulable;
-}
-
-static void dcn32_full_validate_bw_helper(struct dc *dc,
-		struct dc_state *context,
-		display_e2e_pipe_params_st *pipes,
-		int *vlevel,
-		int *split,
-		bool *merge,
-		int *pipe_cnt)
-{
-	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
-	unsigned int dc_pipe_idx = 0;
-	bool found_supported_config = false;
-	struct pipe_ctx *pipe = NULL;
-	uint32_t non_subvp_pipes = 0;
-	bool drr_pipe_found = false;
-	uint32_t drr_pipe_index = 0;
-	uint32_t i = 0;
-
-	/*
-	 * DML favors voltage over p-state, but we're more interested in
-	 * supporting p-state over voltage. We can't support p-state in
-	 * prefetch mode > 0 so try capping the prefetch mode to start.
-	 */
-	context->bw_ctx.dml.soc.allow_for_pstate_or_stutter_in_vblank_final =
-			dm_prefetch_support_uclk_fclk_and_stutter;
-	*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
-	/* This may adjust vlevel and maxMpcComb */
-	if (*vlevel < context->bw_ctx.dml.soc.num_states)
-		*vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, *vlevel, split, merge);
-
-	/* Conditions for setting up phantom pipes for SubVP:
-	 * 1. Not force disable SubVP
-	 * 2. Full update (i.e. !fast_validate)
-	 * 3. Enough pipes are available to support SubVP (TODO: Which pipes will use VACTIVE / VBLANK / SUBVP?)
-	 * 4. Display configuration passes validation
-	 * 5. (Config doesn't support MCLK in VACTIVE/VBLANK || dc->debug.force_subvp_mclk_switch)
-	 */
-	if (!dc->debug.force_disable_subvp && dcn32_all_pipes_have_stream_and_plane(dc, context) &&
-			(*vlevel == context->bw_ctx.dml.soc.num_states ||
-			vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported ||
-			dc->debug.force_subvp_mclk_switch)) {
-
-		dcn32_merge_pipes_for_subvp(dc, context);
-
-		while (!found_supported_config && dcn32_enough_pipes_for_subvp(dc, context) &&
-				dcn32_assign_subvp_pipe(dc, context, &dc_pipe_idx)) {
-
-			/* For the case where *vlevel = num_states, bandwidth validation has failed for this config.
-			 * Adding phantom pipes won't change the validation result, so change the DML input param
-			 * for P-State support before adding phantom pipes and recalculating the DML result.
-			 * However, this case is only applicable for SubVP + DRR cases because the prefetch mode
-			 * will not allow for switch in VBLANK. The DRR display must have it's VBLANK stretched
-			 * enough to support support MCLK switching.
-			 */
-			if (*vlevel == context->bw_ctx.dml.soc.num_states) {
-				context->bw_ctx.dml.soc.allow_for_pstate_or_stutter_in_vblank_final =
-								dm_prefetch_support_stutter;
-				/* There are params (such as FabricClock) that need to be recalculated
-				 * after validation fails (otherwise it will be 0). Calculation for
-				 * phantom vactive requires call into DML, so we must ensure all the
-				 * vba params are valid otherwise we'll get incorrect phantom vactive.
-				 */
-				*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
-			}
-
-			dc->res_pool->funcs->add_phantom_pipes(dc, context, pipes, *pipe_cnt, dc_pipe_idx);
-
-			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
-			*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
-
-			if (*vlevel < context->bw_ctx.dml.soc.num_states &&
-					vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] != dm_dram_clock_change_unsupported
-					&& subvp_validate_static_schedulability(dc, context, *vlevel)) {
-				found_supported_config = true;
-			} else if (*vlevel < context->bw_ctx.dml.soc.num_states &&
-					vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported) {
-				/* Case where 1 SubVP is added, and DML reports MCLK unsupported. This handles
-				 * the case for SubVP + DRR, where the DRR display does not support MCLK switch
-				 * at it's native refresh rate / timing.
-				 */
-				for (i = 0; i < dc->res_pool->pipe_count; i++) {
-					pipe = &context->res_ctx.pipe_ctx[i];
-					if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
-							pipe->stream->mall_stream_config.type == SUBVP_NONE) {
-						non_subvp_pipes++;
-						// Use ignore_msa_timing_param flag to identify as DRR
-						if (pipe->stream->ignore_msa_timing_param) {
-							drr_pipe_found = true;
-							drr_pipe_index = i;
-						}
-					}
-				}
-				// If there is only 1 remaining non SubVP pipe that is DRR, check static
-				// schedulability for SubVP + DRR.
-				if (non_subvp_pipes == 1 && drr_pipe_found) {
-					found_supported_config = subvp_drr_schedulable(dc,
-							context, &context->res_ctx.pipe_ctx[drr_pipe_index]);
-				}
-			}
-		}
-
-		// If SubVP pipe config is unsupported (or cannot be used for UCLK switching)
-		// remove phantom pipes and repopulate dml pipes
-		if (!found_supported_config) {
-			dc->res_pool->funcs->remove_phantom_pipes(dc, context);
-			vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] = dm_dram_clock_change_unsupported;
-			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
-		} else {
-			// only call dcn20_validate_apply_pipe_split_flags if we found a supported config
-			memset(split, 0, MAX_PIPES * sizeof(int));
-			memset(merge, 0, MAX_PIPES * sizeof(bool));
-			*vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, *vlevel, split, merge);
-
-			// Most populate phantom DLG params before programming hardware / timing for phantom pipe
-			DC_FP_START();
-			dcn32_helper_populate_phantom_dlg_params(dc, context, pipes, *pipe_cnt);
-			DC_FP_END();
-
-			// Note: We can't apply the phantom pipes to hardware at this time. We have to wait
-			// until driver has acquired the DMCUB lock to do it safely.
-		}
-	}
-}
-
 static bool dcn32_internal_validate_bw(
 		struct dc *dc,
 		struct dc_state *context,
@@ -2499,7 +1904,9 @@ static bool dcn32_internal_validate_bw(
 	dml_log_pipe_params(&context->bw_ctx.dml, pipes, pipe_cnt);
 
 	if (!fast_validate) {
+		DC_FP_START();
 		dcn32_full_validate_bw_helper(dc, context, pipes, &vlevel, split, merge, &pipe_cnt);
+		DC_FP_END();
 	}
 
 	if (fast_validate || vlevel == context->bw_ctx.dml.soc.num_states ||
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
index 7ccad84b1f16..37d37067e983 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
@@ -103,6 +103,8 @@ bool dcn32_all_pipes_have_stream_and_plane(struct dc *dc,
 bool dcn32_subvp_in_use(struct dc *dc,
 		struct dc_state *context);
 
+bool dcn32_mpo_in_use(struct dc_state *context);
+
 void dcn32_determine_det_override(struct dc_state *context, display_e2e_pipe_params_st *pipes,
 		bool *is_pipe_split_expected, int pipe_cnt);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index 796e3d966a76..47caa2c6d5b4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -153,6 +153,17 @@ bool dcn32_subvp_in_use(struct dc *dc,
 	return false;
 }
 
+bool dcn32_mpo_in_use(struct dc_state *context)
+{
+	uint32_t i;
+
+	for (i = 0; i < context->stream_count; i++) {
+		if (context->stream_status[i].plane_count > 1)
+			return true;
+	}
+	return false;
+}
+
 void dcn32_determine_det_override(struct dc_state *context, display_e2e_pipe_params_st *pipes,
 		bool *is_pipe_split_expected, int pipe_cnt)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 74ccf453349c..82d801933aec 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -24,6 +24,8 @@
  *
  */
 #include "dcn32_fpu.h"
+#include "dcn32/dcn32_resource.h"
+#include "dcn20/dcn20_resource.h"
 #include "display_mode_vba_util_32.h"
 // We need this includes for WATERMARKS_* defines
 #include "clk_mgr/dcn32/dcn32_smu13_driver_if.h"
@@ -461,3 +463,598 @@ void dcn32_set_phantom_stream_timing(struct dc *dc,
 						phantom_bp;
 }
 
+/**
+ * dcn32_get_num_free_pipes: Calculate number of free pipes
+ *
+ * This function assumes that a "used" pipe is a pipe that has
+ * both a stream and a plane assigned to it.
+ *
+ * @dc: current dc state
+ * @context: new dc state
+ *
+ * Return:
+ * Number of free pipes available in the context
+ */
+static unsigned int dcn32_get_num_free_pipes(struct dc *dc, struct dc_state *context)
+{
+	unsigned int i;
+	unsigned int free_pipes = 0;
+	unsigned int num_pipes = 0;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe->stream && !pipe->top_pipe) {
+			while (pipe) {
+				num_pipes++;
+				pipe = pipe->bottom_pipe;
+			}
+		}
+	}
+
+	free_pipes = dc->res_pool->pipe_count - num_pipes;
+	return free_pipes;
+}
+
+/**
+ * dcn32_assign_subvp_pipe: Function to decide which pipe will use Sub-VP.
+ *
+ * We enter this function if we are Sub-VP capable (i.e. enough pipes available)
+ * and regular P-State switching (i.e. VACTIVE/VBLANK) is not supported, or if
+ * we are forcing SubVP P-State switching on the current config.
+ *
+ * The number of pipes used for the chosen surface must be less than or equal to the
+ * number of free pipes available.
+ *
+ * In general we choose surfaces with the longest frame time first (better for SubVP + VBLANK).
+ * For multi-display cases the ActiveDRAMClockChangeMargin doesn't provide enough info on its own
+ * for determining which should be the SubVP pipe (need a way to determine if a pipe / plane doesn't
+ * support MCLK switching naturally [i.e. ACTIVE or VBLANK]).
+ *
+ * @param dc: current dc state
+ * @param context: new dc state
+ * @param index: [out] dc pipe index for the pipe chosen to have phantom pipes assigned
+ *
+ * Return:
+ * True if a valid pipe assignment was found for Sub-VP. Otherwise false.
+ */
+static bool dcn32_assign_subvp_pipe(struct dc *dc,
+				    struct dc_state *context,
+				    unsigned int *index)
+{
+	unsigned int i, pipe_idx;
+	unsigned int max_frame_time = 0;
+	bool valid_assignment_found = false;
+	unsigned int free_pipes = dcn32_get_num_free_pipes(dc, context);
+	bool current_assignment_freesync = false;
+
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		unsigned int num_pipes = 0;
+		unsigned int refresh_rate = 0;
+
+		if (!pipe->stream)
+			continue;
+
+		// Round up
+		refresh_rate = (pipe->stream->timing.pix_clk_100hz * 100 +
+				pipe->stream->timing.v_total * pipe->stream->timing.h_total - 1)
+				/ (double)(pipe->stream->timing.v_total * pipe->stream->timing.h_total);
+		if (pipe->plane_state && !pipe->top_pipe &&
+				pipe->stream->mall_stream_config.type == SUBVP_NONE && refresh_rate < 120) {
+			while (pipe) {
+				num_pipes++;
+				pipe = pipe->bottom_pipe;
+			}
+
+			pipe = &context->res_ctx.pipe_ctx[i];
+			if (num_pipes <= free_pipes) {
+				struct dc_stream_state *stream = pipe->stream;
+				unsigned int frame_us = (stream->timing.v_total * stream->timing.h_total /
+						(double)(stream->timing.pix_clk_100hz * 100)) * 1000000;
+				if (frame_us > max_frame_time && !stream->ignore_msa_timing_param) {
+					*index = i;
+					max_frame_time = frame_us;
+					valid_assignment_found = true;
+					current_assignment_freesync = false;
+				/* For the 2-Freesync display case, still choose the one with the
+			     * longest frame time
+			     */
+				} else if (stream->ignore_msa_timing_param && (!valid_assignment_found ||
+						(current_assignment_freesync && frame_us > max_frame_time))) {
+					*index = i;
+					valid_assignment_found = true;
+					current_assignment_freesync = true;
+				}
+			}
+		}
+		pipe_idx++;
+	}
+	return valid_assignment_found;
+}
+
+/**
+ * dcn32_enough_pipes_for_subvp: Function to check if there are "enough" pipes for SubVP.
+ *
+ * This function returns true if there are enough free pipes
+ * to create the required phantom pipes for any given stream
+ * (that does not already have phantom pipe assigned).
+ *
+ * e.g. For a 2 stream config where the first stream uses one
+ * pipe and the second stream uses 2 pipes (i.e. pipe split),
+ * this function will return true because there is 1 remaining
+ * pipe which can be used as the phantom pipe for the non pipe
+ * split pipe.
+ *
+ * @dc: current dc state
+ * @context: new dc state
+ *
+ * Return:
+ * True if there are enough free pipes to assign phantom pipes to at least one
+ * stream that does not already have phantom pipes assigned. Otherwise false.
+ */
+static bool dcn32_enough_pipes_for_subvp(struct dc *dc, struct dc_state *context)
+{
+	unsigned int i, split_cnt, free_pipes;
+	unsigned int min_pipe_split = dc->res_pool->pipe_count + 1; // init as max number of pipes + 1
+	bool subvp_possible = false;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		// Find the minimum pipe split count for non SubVP pipes
+		if (pipe->stream && !pipe->top_pipe &&
+		    pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			split_cnt = 0;
+			while (pipe) {
+				split_cnt++;
+				pipe = pipe->bottom_pipe;
+			}
+
+			if (split_cnt < min_pipe_split)
+				min_pipe_split = split_cnt;
+		}
+	}
+
+	free_pipes = dcn32_get_num_free_pipes(dc, context);
+
+	// SubVP only possible if at least one pipe is being used (i.e. free_pipes
+	// should not equal to the pipe_count)
+	if (free_pipes >= min_pipe_split && free_pipes < dc->res_pool->pipe_count)
+		subvp_possible = true;
+
+	return subvp_possible;
+}
+
+/**
+ * subvp_subvp_schedulable: Determine if SubVP + SubVP config is schedulable
+ *
+ * High level algorithm:
+ * 1. Find longest microschedule length (in us) between the two SubVP pipes
+ * 2. Check if the worst case overlap (VBLANK in middle of ACTIVE) for both
+ * pipes still allows for the maximum microschedule to fit in the active
+ * region for both pipes.
+ *
+ * @dc: current dc state
+ * @context: new dc state
+ *
+ * Return:
+ * bool - True if the SubVP + SubVP config is schedulable, false otherwise
+ */
+static bool subvp_subvp_schedulable(struct dc *dc, struct dc_state *context)
+{
+	struct pipe_ctx *subvp_pipes[2];
+	struct dc_stream_state *phantom = NULL;
+	uint32_t microschedule_lines = 0;
+	uint32_t index = 0;
+	uint32_t i;
+	uint32_t max_microschedule_us = 0;
+	int32_t vactive1_us, vactive2_us, vblank1_us, vblank2_us;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		uint32_t time_us = 0;
+
+		/* Loop to calculate the maximum microschedule time between the two SubVP pipes,
+		 * and also to store the two main SubVP pipe pointers in subvp_pipes[2].
+		 */
+		if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
+		    pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+			phantom = pipe->stream->mall_stream_config.paired_stream;
+			microschedule_lines = (phantom->timing.v_total - phantom->timing.v_front_porch) +
+					phantom->timing.v_addressable;
+
+			// Round up when calculating microschedule time (+ 1 at the end)
+			time_us = (microschedule_lines * phantom->timing.h_total) /
+					(double)(phantom->timing.pix_clk_100hz * 100) * 1000000 +
+						dc->caps.subvp_prefetch_end_to_mall_start_us +
+						dc->caps.subvp_fw_processing_delay_us + 1;
+			if (time_us > max_microschedule_us)
+				max_microschedule_us = time_us;
+
+			subvp_pipes[index] = pipe;
+			index++;
+
+			// Maximum 2 SubVP pipes
+			if (index == 2)
+				break;
+		}
+	}
+	vactive1_us = ((subvp_pipes[0]->stream->timing.v_addressable * subvp_pipes[0]->stream->timing.h_total) /
+			(double)(subvp_pipes[0]->stream->timing.pix_clk_100hz * 100)) * 1000000;
+	vactive2_us = ((subvp_pipes[1]->stream->timing.v_addressable * subvp_pipes[1]->stream->timing.h_total) /
+				(double)(subvp_pipes[1]->stream->timing.pix_clk_100hz * 100)) * 1000000;
+	vblank1_us = (((subvp_pipes[0]->stream->timing.v_total - subvp_pipes[0]->stream->timing.v_addressable) *
+			subvp_pipes[0]->stream->timing.h_total) /
+			(double)(subvp_pipes[0]->stream->timing.pix_clk_100hz * 100)) * 1000000;
+	vblank2_us = (((subvp_pipes[1]->stream->timing.v_total - subvp_pipes[1]->stream->timing.v_addressable) *
+			subvp_pipes[1]->stream->timing.h_total) /
+			(double)(subvp_pipes[1]->stream->timing.pix_clk_100hz * 100)) * 1000000;
+
+	if ((vactive1_us - vblank2_us) / 2 > max_microschedule_us &&
+	    (vactive2_us - vblank1_us) / 2 > max_microschedule_us)
+		return true;
+
+	return false;
+}
+
+/**
+ * subvp_drr_schedulable: Determine if SubVP + DRR config is schedulable
+ *
+ * High level algorithm:
+ * 1. Get timing for SubVP pipe, phantom pipe, and DRR pipe
+ * 2. Determine the frame time for the DRR display when adding required margin for MCLK switching
+ * (the margin is equal to the MALL region + DRR margin (500us))
+ * 3.If (SubVP Active - Prefetch > Stretched DRR frame + max(MALL region, Stretched DRR frame))
+ * then report the configuration as supported
+ *
+ * @dc: current dc state
+ * @context: new dc state
+ * @drr_pipe: DRR pipe_ctx for the SubVP + DRR config
+ *
+ * Return:
+ * bool - True if the SubVP + DRR config is schedulable, false otherwise
+ */
+static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context, struct pipe_ctx *drr_pipe)
+{
+	bool schedulable = false;
+	uint32_t i;
+	struct pipe_ctx *pipe = NULL;
+	struct dc_crtc_timing *main_timing = NULL;
+	struct dc_crtc_timing *phantom_timing = NULL;
+	struct dc_crtc_timing *drr_timing = NULL;
+	int16_t prefetch_us = 0;
+	int16_t mall_region_us = 0;
+	int16_t drr_frame_us = 0;	// nominal frame time
+	int16_t subvp_active_us = 0;
+	int16_t stretched_drr_us = 0;
+	int16_t drr_stretched_vblank_us = 0;
+	int16_t max_vblank_mallregion = 0;
+
+	// Find SubVP pipe
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+
+		// We check for master pipe, but it shouldn't matter since we only need
+		// the pipe for timing info (stream should be same for any pipe splits)
+		if (!pipe->stream || !pipe->plane_state || pipe->top_pipe || pipe->prev_odm_pipe)
+			continue;
+
+		// Find the SubVP pipe
+		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			break;
+	}
+
+	main_timing = &pipe->stream->timing;
+	phantom_timing = &pipe->stream->mall_stream_config.paired_stream->timing;
+	drr_timing = &drr_pipe->stream->timing;
+	prefetch_us = (phantom_timing->v_total - phantom_timing->v_front_porch) * phantom_timing->h_total /
+			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000 +
+			dc->caps.subvp_prefetch_end_to_mall_start_us;
+	subvp_active_us = main_timing->v_addressable * main_timing->h_total /
+			(double)(main_timing->pix_clk_100hz * 100) * 1000000;
+	drr_frame_us = drr_timing->v_total * drr_timing->h_total /
+			(double)(drr_timing->pix_clk_100hz * 100) * 1000000;
+	// P-State allow width and FW delays already included phantom_timing->v_addressable
+	mall_region_us = phantom_timing->v_addressable * phantom_timing->h_total /
+			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000;
+	stretched_drr_us = drr_frame_us + mall_region_us + SUBVP_DRR_MARGIN_US;
+	drr_stretched_vblank_us = (drr_timing->v_total - drr_timing->v_addressable) * drr_timing->h_total /
+			(double)(drr_timing->pix_clk_100hz * 100) * 1000000 + (stretched_drr_us - drr_frame_us);
+	max_vblank_mallregion = drr_stretched_vblank_us > mall_region_us ? drr_stretched_vblank_us : mall_region_us;
+
+	/* We consider SubVP + DRR schedulable if the stretched frame duration of the DRR display (i.e. the
+	 * highest refresh rate + margin that can support UCLK P-State switch) passes the static analysis
+	 * for VBLANK: (VACTIVE region of the SubVP pipe can fit the MALL prefetch, VBLANK frame time,
+	 * and the max of (VBLANK blanking time, MALL region)).
+	 */
+	if (stretched_drr_us < (1 / (double)drr_timing->min_refresh_in_uhz) * 1000000 * 1000000 &&
+			subvp_active_us - prefetch_us - stretched_drr_us - max_vblank_mallregion > 0)
+		schedulable = true;
+
+	return schedulable;
+}
+
+
+/**
+ * subvp_vblank_schedulable: Determine if SubVP + VBLANK config is schedulable
+ *
+ * High level algorithm:
+ * 1. Get timing for SubVP pipe, phantom pipe, and VBLANK pipe
+ * 2. If (SubVP Active - Prefetch > Vblank Frame Time + max(MALL region, Vblank blanking time))
+ * then report the configuration as supported
+ * 3. If the VBLANK display is DRR, then take the DRR static schedulability path
+ *
+ * @dc: current dc state
+ * @context: new dc state
+ *
+ * Return:
+ * bool - True if the SubVP + VBLANK/DRR config is schedulable, false otherwise
+ */
+static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
+{
+	struct pipe_ctx *pipe = NULL;
+	struct pipe_ctx *subvp_pipe = NULL;
+	bool found = false;
+	bool schedulable = false;
+	uint32_t i = 0;
+	uint8_t vblank_index = 0;
+	uint16_t prefetch_us = 0;
+	uint16_t mall_region_us = 0;
+	uint16_t vblank_frame_us = 0;
+	uint16_t subvp_active_us = 0;
+	uint16_t vblank_blank_us = 0;
+	uint16_t max_vblank_mallregion = 0;
+	struct dc_crtc_timing *main_timing = NULL;
+	struct dc_crtc_timing *phantom_timing = NULL;
+	struct dc_crtc_timing *vblank_timing = NULL;
+
+	/* For SubVP + VBLANK/DRR cases, we assume there can only be
+	 * a single VBLANK/DRR display. If DML outputs SubVP + VBLANK
+	 * is supported, it is either a single VBLANK case or two VBLANK
+	 * displays which are synchronized (in which case they have identical
+	 * timings).
+	 */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+
+		// We check for master pipe, but it shouldn't matter since we only need
+		// the pipe for timing info (stream should be same for any pipe splits)
+		if (!pipe->stream || !pipe->plane_state || pipe->top_pipe || pipe->prev_odm_pipe)
+			continue;
+
+		if (!found && pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			// Found pipe which is not SubVP or Phantom (i.e. the VBLANK pipe).
+			vblank_index = i;
+			found = true;
+		}
+
+		if (!subvp_pipe && pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			subvp_pipe = pipe;
+	}
+	// Use ignore_msa_timing_param flag to identify as DRR
+	if (found && context->res_ctx.pipe_ctx[vblank_index].stream->ignore_msa_timing_param) {
+		// SUBVP + DRR case
+		schedulable = subvp_drr_schedulable(dc, context, &context->res_ctx.pipe_ctx[vblank_index]);
+	} else if (found) {
+		main_timing = &subvp_pipe->stream->timing;
+		phantom_timing = &subvp_pipe->stream->mall_stream_config.paired_stream->timing;
+		vblank_timing = &context->res_ctx.pipe_ctx[vblank_index].stream->timing;
+		// Prefetch time is equal to VACTIVE + BP + VSYNC of the phantom pipe
+		// Also include the prefetch end to mallstart delay time
+		prefetch_us = (phantom_timing->v_total - phantom_timing->v_front_porch) * phantom_timing->h_total /
+				(double)(phantom_timing->pix_clk_100hz * 100) * 1000000 +
+				dc->caps.subvp_prefetch_end_to_mall_start_us;
+		// P-State allow width and FW delays already included phantom_timing->v_addressable
+		mall_region_us = phantom_timing->v_addressable * phantom_timing->h_total /
+				(double)(phantom_timing->pix_clk_100hz * 100) * 1000000;
+		vblank_frame_us = vblank_timing->v_total * vblank_timing->h_total /
+				(double)(vblank_timing->pix_clk_100hz * 100) * 1000000;
+		vblank_blank_us =  (vblank_timing->v_total - vblank_timing->v_addressable) * vblank_timing->h_total /
+				(double)(vblank_timing->pix_clk_100hz * 100) * 1000000;
+		subvp_active_us = main_timing->v_addressable * main_timing->h_total /
+				(double)(main_timing->pix_clk_100hz * 100) * 1000000;
+		max_vblank_mallregion = vblank_blank_us > mall_region_us ? vblank_blank_us : mall_region_us;
+
+		// Schedulable if VACTIVE region of the SubVP pipe can fit the MALL prefetch, VBLANK frame time,
+		// and the max of (VBLANK blanking time, MALL region)
+		// TODO: Possibly add some margin (i.e. the below conditions should be [...] > X instead of [...] > 0)
+		if (subvp_active_us - prefetch_us - vblank_frame_us - max_vblank_mallregion > 0)
+			schedulable = true;
+	}
+	return schedulable;
+}
+
+/**
+ * subvp_validate_static_schedulability: Check which SubVP case is calculated and handle
+ * static analysis based on the case.
+ *
+ * Three cases:
+ * 1. SubVP + SubVP
+ * 2. SubVP + VBLANK (DRR checked internally)
+ * 3. SubVP + VACTIVE (currently unsupported)
+ *
+ * @dc: current dc state
+ * @context: new dc state
+ * @vlevel: Voltage level calculated by DML
+ *
+ * Return:
+ * bool - True if statically schedulable, false otherwise
+ */
+static bool subvp_validate_static_schedulability(struct dc *dc,
+				struct dc_state *context,
+				int vlevel)
+{
+	bool schedulable = true;	// true by default for single display case
+	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
+	uint32_t i, pipe_idx;
+	uint8_t subvp_count = 0;
+	uint8_t vactive_count = 0;
+
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (!pipe->stream)
+			continue;
+
+		if (pipe->plane_state && !pipe->top_pipe &&
+				pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			subvp_count++;
+
+		// Count how many planes that aren't SubVP/phantom are capable of VACTIVE
+		// switching (SubVP + VACTIVE unsupported). In situations where we force
+		// SubVP for a VACTIVE plane, we don't want to increment the vactive_count.
+		if (vba->ActiveDRAMClockChangeLatencyMargin[vba->pipe_plane[pipe_idx]] > 0 &&
+		    pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			vactive_count++;
+		}
+		pipe_idx++;
+	}
+
+	if (subvp_count == 2) {
+		// Static schedulability check for SubVP + SubVP case
+		schedulable = subvp_subvp_schedulable(dc, context);
+	} else if (vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_vblank_w_mall_sub_vp) {
+		// Static schedulability check for SubVP + VBLANK case. Also handle the case where
+		// DML outputs SubVP + VBLANK + VACTIVE (DML will report as SubVP + VBLANK)
+		if (vactive_count > 0)
+			schedulable = false;
+		else
+			schedulable = subvp_vblank_schedulable(dc, context);
+	} else if (vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_vactive_w_mall_sub_vp &&
+			vactive_count > 0) {
+		// For single display SubVP cases, DML will output dm_dram_clock_change_vactive_w_mall_sub_vp by default.
+		// We tell the difference between SubVP vs. SubVP + VACTIVE by checking the vactive_count.
+		// SubVP + VACTIVE currently unsupported
+		schedulable = false;
+	}
+	return schedulable;
+}
+
+void dcn32_full_validate_bw_helper(struct dc *dc,
+				   struct dc_state *context,
+				   display_e2e_pipe_params_st *pipes,
+				   int *vlevel,
+				   int *split,
+				   bool *merge,
+				   int *pipe_cnt)
+{
+	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
+	unsigned int dc_pipe_idx = 0;
+	bool found_supported_config = false;
+	struct pipe_ctx *pipe = NULL;
+	uint32_t non_subvp_pipes = 0;
+	bool drr_pipe_found = false;
+	uint32_t drr_pipe_index = 0;
+	uint32_t i = 0;
+
+	dc_assert_fp_enabled();
+
+	/*
+	 * DML favors voltage over p-state, but we're more interested in
+	 * supporting p-state over voltage. We can't support p-state in
+	 * prefetch mode > 0 so try capping the prefetch mode to start.
+	 */
+	context->bw_ctx.dml.soc.allow_for_pstate_or_stutter_in_vblank_final =
+			dm_prefetch_support_uclk_fclk_and_stutter;
+	*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
+	/* This may adjust vlevel and maxMpcComb */
+	if (*vlevel < context->bw_ctx.dml.soc.num_states)
+		*vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, *vlevel, split, merge);
+
+	/* Conditions for setting up phantom pipes for SubVP:
+	 * 1. Not force disable SubVP
+	 * 2. Full update (i.e. !fast_validate)
+	 * 3. Enough pipes are available to support SubVP (TODO: Which pipes will use VACTIVE / VBLANK / SUBVP?)
+	 * 4. Display configuration passes validation
+	 * 5. (Config doesn't support MCLK in VACTIVE/VBLANK || dc->debug.force_subvp_mclk_switch)
+	 */
+	if (!dc->debug.force_disable_subvp && dcn32_all_pipes_have_stream_and_plane(dc, context) &&
+	    !dcn32_mpo_in_use(context) && (*vlevel == context->bw_ctx.dml.soc.num_states ||
+	    vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported ||
+	    dc->debug.force_subvp_mclk_switch)) {
+
+		dcn32_merge_pipes_for_subvp(dc, context);
+
+		while (!found_supported_config && dcn32_enough_pipes_for_subvp(dc, context) &&
+			dcn32_assign_subvp_pipe(dc, context, &dc_pipe_idx)) {
+			/* For the case where *vlevel = num_states, bandwidth validation has failed for this config.
+			 * Adding phantom pipes won't change the validation result, so change the DML input param
+			 * for P-State support before adding phantom pipes and recalculating the DML result.
+			 * However, this case is only applicable for SubVP + DRR cases because the prefetch mode
+			 * will not allow for switch in VBLANK. The DRR display must have it's VBLANK stretched
+			 * enough to support MCLK switching.
+			 */
+			if (*vlevel == context->bw_ctx.dml.soc.num_states) {
+				context->bw_ctx.dml.soc.allow_for_pstate_or_stutter_in_vblank_final =
+								dm_prefetch_support_stutter;
+				/* There are params (such as FabricClock) that need to be recalculated
+				 * after validation fails (otherwise it will be 0). Calculation for
+				 * phantom vactive requires call into DML, so we must ensure all the
+				 * vba params are valid otherwise we'll get incorrect phantom vactive.
+				 */
+				*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
+			}
+
+			dc->res_pool->funcs->add_phantom_pipes(dc, context, pipes, *pipe_cnt, dc_pipe_idx);
+
+			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
+			// Populate dppclk to trigger a recalculate in dml_get_voltage_level
+			// so the phantom pipe DLG params can be assigned correctly.
+			pipes[0].clks_cfg.dppclk_mhz = get_dppclk_calculated(&context->bw_ctx.dml, pipes, *pipe_cnt, 0);
+			*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
+
+			if (*vlevel < context->bw_ctx.dml.soc.num_states &&
+			    vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] != dm_dram_clock_change_unsupported
+			    && subvp_validate_static_schedulability(dc, context, *vlevel)) {
+				found_supported_config = true;
+			} else if (*vlevel < context->bw_ctx.dml.soc.num_states &&
+					vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported) {
+				/* Case where 1 SubVP is added, and DML reports MCLK unsupported. This handles
+				 * the case for SubVP + DRR, where the DRR display does not support MCLK switch
+				 * at it's native refresh rate / timing.
+				 */
+				for (i = 0; i < dc->res_pool->pipe_count; i++) {
+					pipe = &context->res_ctx.pipe_ctx[i];
+					if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
+					    pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+						non_subvp_pipes++;
+						// Use ignore_msa_timing_param flag to identify as DRR
+						if (pipe->stream->ignore_msa_timing_param) {
+							drr_pipe_found = true;
+							drr_pipe_index = i;
+						}
+					}
+				}
+				// If there is only 1 remaining non SubVP pipe that is DRR, check static
+				// schedulability for SubVP + DRR.
+				if (non_subvp_pipes == 1 && drr_pipe_found) {
+					found_supported_config = subvp_drr_schedulable(dc, context,
+										       &context->res_ctx.pipe_ctx[drr_pipe_index]);
+				}
+			}
+		}
+
+		// If SubVP pipe config is unsupported (or cannot be used for UCLK switching)
+		// remove phantom pipes and repopulate dml pipes
+		if (!found_supported_config) {
+			dc->res_pool->funcs->remove_phantom_pipes(dc, context);
+			vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] = dm_dram_clock_change_unsupported;
+			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
+		} else {
+			// only call dcn20_validate_apply_pipe_split_flags if we found a supported config
+			memset(split, 0, MAX_PIPES * sizeof(int));
+			memset(merge, 0, MAX_PIPES * sizeof(bool));
+			*vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, *vlevel, split, merge);
+
+			// Most populate phantom DLG params before programming hardware / timing for phantom pipe
+			DC_FP_START();
+			dcn32_helper_populate_phantom_dlg_params(dc, context, pipes, *pipe_cnt);
+			DC_FP_END();
+
+			// Note: We can't apply the phantom pipes to hardware at this time. We have to wait
+			// until driver has acquired the DMCUB lock to do it safely.
+		}
+	}
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h
index 4abef908dca9..29fb6b1bc17f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h
@@ -57,4 +57,12 @@ void dcn32_set_phantom_stream_timing(struct dc *dc,
 				     unsigned int pipe_cnt,
 				     unsigned int dc_pipe_idx);
 
+void dcn32_full_validate_bw_helper(struct dc *dc,
+				   struct dc_state *context,
+				   display_e2e_pipe_params_st *pipes,
+				   int *vlevel,
+				   int *split,
+				   bool *merge,
+				   int *pipe_cnt);
+
 #endif
-- 
2.37.0


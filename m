Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560168CDAC9
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2024 21:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CD410F2A7;
	Thu, 23 May 2024 19:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V23vdGuD";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494BB10F2A0
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2024 19:21:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5Sjkyjxcc8s5ZX4p9xjw4FvhVF5ToBAKH+obkbSDJ3Hbxvv6mRNOKTZ7XryNw21UU7zUoL7IWwfomjVC5tNt2SzJdAQJTTyCR62EC5mjhziI+tLf52Qk4s+/X9UWG5DQMQxANZxRI5AtleTvizPftWM2C4ef19pzSlF2ObnLccbb4n8TTsfZ3x6N04nJcx2tQIyiZjpNRAM5AC0WGMRSRgTTrLI6g0v12nlO7CO5qHjy/ZYLpWPzXumy5Bl1wJJ7lf3CgswDBnlsAkQ84OOm/AJ8Gq7CEkiZtT/WrDuBco7trfAyHvOwVuTHpqq8qk/R6tsfSylmalIy/zd0LLV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xctKztIc8xSobk5ZHZDDzSQa/qtJkiqZCRDn4t8Y/no=;
 b=S2SQGiaXSj7jKQ/TeSNE+1gCssDrAFaozDNwdUuORQQygfBQB89O+Q3cXJY6A/gPomwYKzbGt6/qr0MAEx/+Jrm8pUyaMFqlqUL9EvpiIylraHWXY6tVkInfIt84WN19kLIafZQTp9/9N5AVYpymZCFZVHLsFjR0w04EPNdjL+uokZ6oeLjD9jw4Dzgd8dpvVE0Ip1laHA2xPys89DuBWgDqz+o7yEV0HEKKbIVm8nT2YJcBM6AesXjJ+NJNtloPDxvDc+M16iFfcQcLtgke7sZ6xUi127cnm3P9DGEqXGB+fECNA6vn08tB1ZGdQiBahnh+MfPrRW/9H8Ya5wC4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xctKztIc8xSobk5ZHZDDzSQa/qtJkiqZCRDn4t8Y/no=;
 b=V23vdGuDlXQIcK/l1DVJIdG8X8ebwBFuHSiGprTCAwKLSOGExdtrfdqYF9dtxA/65VwVmC6C+9xepGQyGJbZC8xap9zovL2EkyQk10USKZhTOCTsAHVdpIsPrCYvBQ/ux/5Fw/6r4wrEzpj1c5OvbdPNs6N5tHzXYoKVR4mdGmI=
Received: from BN1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:408:e2::33)
 by DS7PR12MB8372.namprd12.prod.outlook.com (2603:10b6:8:eb::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.19; Thu, 23 May 2024 19:20:57 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::cc) by BN1PR13CA0028.outlook.office365.com
 (2603:10b6:408:e2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.5 via Frontend
 Transport; Thu, 23 May 2024 19:20:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 19:20:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 14:20:55 -0500
Received: from debian.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 14:20:50 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <rodrigo.siqueira@amd.com>, <aurabindo.pillai@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>
Subject: [PATCH 05/13] drm/amd/display: Update DML2.1 generated code
Date: Thu, 23 May 2024 19:20:19 +0000
Message-ID: <20240523192027.50630-5-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240523192027.50630-1-aurabindo.pillai@amd.com>
References: <20240523192027.50630-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|DS7PR12MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: a4895c1d-c9c6-465e-6cd5-08dc7b5d78ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rkHIbcX4Vbc4Gx1eH21v2+PKc8LsvgcUTM+FYml+Wqxvep9Tq8VuYWQQ/eLH?=
 =?us-ascii?Q?VsWYcPWyZRhd/ADwY5DGMlQIqAZ9/O4658PBxPHJ63swZJEpqk2IvcwlGVLV?=
 =?us-ascii?Q?Og00XZacoQXtrB39gsy+YLl7+HTDs4zdIU4/C/Tzwr1PlmuCJjnJsib8GAjL?=
 =?us-ascii?Q?iLHJ4MDI5ycWqPsOWIY1Mr3e+LdU7iAc+ZszO0PRowHUJVbfMXXDi1dOTC/x?=
 =?us-ascii?Q?wJtYNIIc2rdKgPdQXaEGbvTuJdBHGeWcNuMnogBSoqh5/nJzsctKYm+nfoLb?=
 =?us-ascii?Q?gGPZZO4QIraWlnfKz8uUitGojTG5P6aghHr+nlrvuEe8443LGVjJhqoFjMP6?=
 =?us-ascii?Q?mXeuuC5+SOZYXvDKktY1u5ttDX5Q1HHKHdIJ64Tlo+GEMAxTZGS4QxjhZECN?=
 =?us-ascii?Q?fYKTWmdXYfkvLzJhukONA58AEp+9i1OY114pQw5ObSg9mseV96ojBehv6rZB?=
 =?us-ascii?Q?5G/JCE73pm/MihjciQmPNFfAYxNwuuu+MM4LN33d4ksMF6LlNQMwULy3N7dz?=
 =?us-ascii?Q?Ay5s8RoeyJLeu05yFdoJ+8+LAux03atxPB5N1fGY7Eb7zbRHkPb1pAYHQPDu?=
 =?us-ascii?Q?xIX+3p4+ul6C46TurqgcFYmUY2aQvnORF8GO8JPKYJ5P/9i4yBbx6AgpoV67?=
 =?us-ascii?Q?f5tmCQLat+1hxq9Ntd8lKtraS4CjTBmf4GwaI/wSTkLGnLhDXNebBeHqUOZe?=
 =?us-ascii?Q?GR4WlOV0jvBwYlrXcPwwSurJU9jWEAsDiaaKs2axrw7SozG+Djkq8YjMkQmm?=
 =?us-ascii?Q?Is7uuJ36M2bIp+Tx6gtV5wkQYKzR4DhamiamryvDcOEFrgufPxKtk8od3cHw?=
 =?us-ascii?Q?sQTMyo1dbmFZUhnfMW7b5ULHuWvgLS5tZVTLoH7p8ISs6/hPGQW1pggSrnnt?=
 =?us-ascii?Q?wBGP0o+r3Cw4mglpuuPvIUXuxV4eTaKcSIpZsQJjhKp2q6co17IpW84MM6wo?=
 =?us-ascii?Q?TaPB7vBOJ7UT59m4GTVcXyYm1vM4kJrIVRaUVBKKDzwTvn5ZyahL4X0xlEl/?=
 =?us-ascii?Q?81zbiWUTGTteGNxWkQ6AJD9D+bqPtr3aDZJLM/k4YODtHDT4NFYqaysnWwO1?=
 =?us-ascii?Q?Ox7XVxIiohsbhpX2y/+BXYJkJ13lXI9wcjvPHZ1JPhZd9fKJlO0tJPX710GT?=
 =?us-ascii?Q?rDXo3ENStWvaj+0etqyUNJHwsZS8QR16MJ7eCjVayMr20d4YXIqNxojT/+vl?=
 =?us-ascii?Q?9/ohR0ZS8CVZ9f5XVaMoU4hDUVDhGMzJNnH5pGs34uku2KC6ePrwvVWzvLtw?=
 =?us-ascii?Q?LV1/sOlZ8xU3UvKKHaDyKqRhUSAuxny4Vnam9BbXWXhIjZGMxu0hs1nbcOeS?=
 =?us-ascii?Q?Kd1xiF79AjoFSPr17GS0X6V8SwAgUrBf+XUVGoKucyI5gxh0Ju8YDODEN5Tb?=
 =?us-ascii?Q?aUFBZH/PghU/UHZMrhNmOkoXXHYD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 19:20:57.0103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4895c1d-c9c6-465e-6cd5-08dc7b5d78ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8372
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

Most of the DML code is generated, and it is necessary to update some
parts of it from time to time. This commit brings the latest generated
code for DML 2.1.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../dc/dml2/dml21/dml21_translation_helper.c  |   19 +-
 .../amd/display/dc/dml2/dml21/dml21_wrapper.c |    2 +-
 .../dml21/inc/bounding_boxes/dcn4_soc_bb.h    |   27 +-
 .../dml21/inc/dml_top_display_cfg_types.h     |    9 +-
 .../dml21/inc/dml_top_soc_parameter_types.h   |    3 +
 .../display/dc/dml2/dml21/inc/dml_top_types.h |    6 +-
 .../dml2/dml21/src/dml2_core/dml2_core_dcn4.c |  110 +-
 .../src/dml2_core/dml2_core_dcn4_calcs.c      | 2265 ++++++++++-------
 .../dml21/src/dml2_core/dml2_core_shared.c    |  176 +-
 .../src/dml2_core/dml2_core_shared_types.h    |  109 +-
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c |   96 +-
 .../dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |    1 +
 .../dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c   |  101 +-
 .../dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h   |    2 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c   |   29 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c   |   38 +-
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  175 +-
 .../dml21/src/dml2_pmo/dml2_pmo_factory.h     |    2 +-
 .../lib_float_math.c                          |   16 +-
 .../lib_float_math.h                          |    3 +-
 .../dc/dml2/dml21/src/dml2_top/dml_top.c      |    3 +-
 .../dml2/dml21/src/dml2_top/dml_top_mcache.c  |   37 +-
 .../dml2/dml21/src/dml2_top/dml_top_mcache.h  |    2 +-
 .../dc/dml2/dml21/src/inc/dml2_debug.h        |    2 +-
 .../src/inc/dml2_internal_shared_types.h      |   15 +-
 25 files changed, 2069 insertions(+), 1179 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index e4c18417b6d7..37998f2c0b14 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -338,7 +338,8 @@ void dml21_apply_soc_bb_overrides(struct dml2_initialize_instance_in_out *dml_in
 }
 
 static void populate_dml21_timing_config_from_stream_state(struct dml2_timing_cfg *timing,
-		struct dc_stream_state *stream)
+		struct dc_stream_state *stream,
+		struct dml2_context *dml_ctx)
 {
 	unsigned int hblank_start, vblank_start;
 
@@ -372,7 +373,12 @@ static void populate_dml21_timing_config_from_stream_state(struct dml2_timing_cf
 	timing->drr_config.drr_active_variable = stream->vrr_active_variable;
 	timing->drr_config.drr_active_fixed = stream->vrr_active_fixed;
 	timing->drr_config.disallowed = !stream->allow_freesync;
-	//timing->drr_config.max_instant_vtotal_delta = timing-><drr no flicker delta lum>;
+
+	if (dml_ctx->config.callbacks.get_max_flickerless_instant_vtotal_increase &&
+			stream->ctx->dc->config.enable_fpo_flicker_detection == 1)
+		timing->drr_config.max_instant_vtotal_delta = dml_ctx->config.callbacks.get_max_flickerless_instant_vtotal_increase(stream, false);
+	else
+		timing->drr_config.max_instant_vtotal_delta = 0;
 
 	if (stream->timing.flags.DSC) {
 		timing->dsc.enable = dml2_dsc_enable;
@@ -505,7 +511,8 @@ static void populate_dml21_stream_overrides_from_stream_state(
 		stream_desc->overrides.odm_mode =  dml2_odm_mode_auto;
 		break;
 	}
-	if (!stream->ctx->dc->debug.enable_single_display_2to1_odm_policy)
+	if (!stream->ctx->dc->debug.enable_single_display_2to1_odm_policy ||
+			stream->debug.force_odm_combine_segments > 0)
 		stream_desc->overrides.disable_dynamic_odm = true;
 	stream_desc->overrides.disable_subvp = stream->ctx->dc->debug.force_disable_subvp;
 }
@@ -699,7 +706,7 @@ static const struct scaler_data *get_scaler_data_for_plane(
 			temp_pipe->stream = pipe->stream;
 			temp_pipe->plane_state = pipe->plane_state;
 			temp_pipe->plane_res.scl_data.taps = pipe->plane_res.scl_data.taps;
-
+			temp_pipe->stream_res = pipe->stream_res;
 			dml_ctx->config.callbacks.build_scaling_params(temp_pipe);
 			break;
 		}
@@ -956,7 +963,7 @@ bool dml21_map_dc_state_into_dml_display_cfg(const struct dc *in_dc, struct dc_s
 			disp_cfg_stream_location = dml_dispcfg->num_streams++;
 
 		ASSERT(disp_cfg_stream_location >= 0 && disp_cfg_stream_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
-		populate_dml21_timing_config_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location].timing, context->streams[stream_index]);
+		populate_dml21_timing_config_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location].timing, context->streams[stream_index], dml_ctx);
 		populate_dml21_output_config_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location].output, context->streams[stream_index], &context->res_ctx.pipe_ctx[stream_index]);
 		populate_dml21_stream_overrides_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location], context->streams[stream_index]);
 
@@ -1007,6 +1014,8 @@ void dml21_copy_clocks_to_dc_state(struct dml2_context *in_ctx, struct dc_state
 	context->bw_ctx.bw.dcn.clk.dcfclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.active.dcfclk_khz;
 	context->bw_ctx.bw.dcn.clk.dramclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.active.uclk_khz;
 	context->bw_ctx.bw.dcn.clk.fclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.active.fclk_khz;
+	context->bw_ctx.bw.dcn.clk.idle_dramclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.idle.uclk_khz;
+	context->bw_ctx.bw.dcn.clk.idle_fclk_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.idle.fclk_khz;
 	context->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz = in_ctx->v21.mode_programming.programming->min_clocks.dcn4.deepsleep_dcfclk_khz;
 	context->bw_ctx.bw.dcn.clk.fclk_p_state_change_support = in_ctx->v21.mode_programming.programming->fclk_pstate_supported;
 	context->bw_ctx.bw.dcn.clk.p_state_change_support = in_ctx->v21.mode_programming.programming->uclk_pstate_supported;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index 4e0b7d2d63b2..08f001cb61c5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -59,7 +59,7 @@ static void dml21_apply_debug_options(const struct dc *in_dc, struct dml2_contex
 	pmo_options->disable_svp = ((in_dc->debug.dml21_disable_pstate_method_mask >> 2) & 1) ||
 			in_dc->debug.force_disable_subvp ||
 			disable_fams2;
-	pmo_options->disable_drr_fixed = ((in_dc->debug.dml21_disable_pstate_method_mask >> 3) & 1) ||
+	pmo_options->disable_drr_clamped = ((in_dc->debug.dml21_disable_pstate_method_mask >> 3) & 1) ||
 			disable_fams2;
 	pmo_options->disable_drr_var = ((in_dc->debug.dml21_disable_pstate_method_mask >> 4) & 1) ||
 			disable_fams2;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
index cb7a210e435a..fe07fcc3d0d5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
@@ -120,11 +120,11 @@ static const struct dml2_soc_bb dml2_socbb_dcn401 = {
 				.num_clk_values = 2,
 		},
 		.phyclk_d18 = {
-				.clk_values_khz = {667000, 667000},
+				.clk_values_khz = {625000, 625000},
 				.num_clk_values = 2,
 		},
 		.phyclk_d32 = {
-				.clk_values_khz = {2000000, 2000000},
+				.clk_values_khz = {625000, 625000},
 				.num_clk_values = 2,
 		},
 		.dram_config = {
@@ -289,17 +289,29 @@ static const struct dml2_soc_bb dml2_socbb_dcn401 = {
 		.dram_clk_change_blackout_us = 400,
 		.fclk_change_blackout_us = 0,
 		.g7_ppt_blackout_us = 0,
-		.stutter_enter_plus_exit_latency_us = 21,
-		.stutter_exit_latency_us = 16,
+		.stutter_enter_plus_exit_latency_us = 54,
+		.stutter_exit_latency_us = 41,
 		.z8_stutter_enter_plus_exit_latency_us = 0,
 		.z8_stutter_exit_latency_us = 0,
+		/*
+		.g6_temp_read_blackout_us = {
+			23.00,
+			10.00,
+			10.00,
+			8.00,
+			8.00,
+			5.00,
+			5.00,
+			5.00,
+		},
+		*/
 	},
 
 	 .vmin_limit = {
 		.dispclk_khz = 600 * 1000,
 	 },
 
-	.dprefclk_mhz = 700,
+	.dprefclk_mhz = 720,
 	.xtalclk_mhz = 100,
 	.pcie_refclk_mhz = 100,
 	.dchub_refclk_mhz = 50,
@@ -309,8 +321,8 @@ static const struct dml2_soc_bb dml2_socbb_dcn401 = {
 	.return_bus_width_bytes = 64,
 	.hostvm_min_page_size_kbytes = 0,
 	.gpuvm_min_page_size_kbytes = 256,
-	.phy_downspread_percent = 0,
-	.dcn_downspread_percent = 0,
+	.phy_downspread_percent = 0.38,
+	.dcn_downspread_percent = 0.38,
 	.dispclk_dppclk_vco_speed_mhz = 4500,
 	.do_urgent_latency_adjustment = 0,
 	.mem_word_bytes = 32,
@@ -329,6 +341,7 @@ static const struct dml2_ip_capabilities dml2_dcn401_max_ip_caps = {
 	.max_num_dp2p0_outputs = 4,
 	.rob_buffer_size_kbytes = 192,
 	.config_return_buffer_size_in_kbytes = 1344,
+	.config_return_buffer_segment_size_in_kbytes = 64,
 	.meta_fifo_size_in_kentries = 22,
 	.compressed_buffer_segment_size_in_kbytes = 64,
 	.subvp_drr_scheduling_margin_us = 100,
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
index fbf3e77f3d38..daae77f2672b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
@@ -380,7 +380,11 @@ struct dml2_plane_parameters {
 		enum dml2_refresh_from_mall_mode_override refresh_from_mall;
 		unsigned int det_size_override_kb;
 		unsigned int mpcc_combine_factor;
-		long reserved_vblank_time_ns; // 0 = no override, -ve = no reserved time, +ve = explicit reserved time
+
+		// reserved_vblank_time_ns is the minimum time to reserve in vblank for Twait
+		// The actual reserved vblank time used for the corresponding stream in mode_programming would be at least as much as this per-plane override.
+		long reserved_vblank_time_ns;
+		unsigned int max_vactive_det_fill_delay_us; // 0 = no reserved time, +ve = explicit max delay
 		unsigned int gpuvm_min_page_size_kbytes;
 
 		enum dml2_svp_mode_override legacy_svp_config; //TODO remove in favor of svp_config
@@ -407,6 +411,7 @@ struct dml2_stream_parameters {
 		enum dml2_odm_mode odm_mode;
 		bool disable_dynamic_odm;
 		bool disable_subvp;
+		bool disable_fams2_drr;
 		int minimum_vblank_idle_requirement_us;
 		bool minimize_active_latency_hiding;
 
@@ -429,7 +434,7 @@ struct dml2_display_cfg {
 	bool minimize_det_reallocation;
 
 	unsigned int gpuvm_max_page_table_levels;
-	unsigned int hostvm_max_page_table_levels;
+	unsigned int hostvm_max_non_cached_page_table_levels;
 
 	struct dml2_plane_parameters plane_descriptors[DML2_MAX_PLANES];
 	struct dml2_stream_parameters stream_descriptors[DML2_MAX_PLANES];
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
index 7d6461ca09bf..065b2afab6fb 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
@@ -169,8 +169,11 @@ struct dml2_ip_capabilities {
 	unsigned int max_num_dp2p0_outputs;
 	unsigned int rob_buffer_size_kbytes;
 	unsigned int config_return_buffer_size_in_kbytes;
+	unsigned int config_return_buffer_segment_size_in_kbytes;
 	unsigned int meta_fifo_size_in_kentries;
 	unsigned int compressed_buffer_segment_size_in_kbytes;
+	unsigned int max_flip_time_us;
+	unsigned int hostvm_mode;
 	unsigned int subvp_drr_scheduling_margin_us;
 	unsigned int subvp_prefetch_end_to_mall_start_us;
 	unsigned int subvp_fw_processing_delay;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
index 7dcc9cef2b58..8aa77bb190ea 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
@@ -72,9 +72,10 @@ struct dml2_pmo_options {
 	bool disable_vblank;
 	bool disable_svp;
 	bool disable_drr_var;
-	bool disable_drr_fixed;
+	bool disable_drr_clamped;
 	bool disable_drr_var_when_var_active;
 	bool disable_fams2;
+	bool disable_vactive_det_fill_bw_pad; /* dml2_project_dcn4x_stage2_auto_drr_svp and above only */
 	bool disable_dyn_odm;
 	bool disable_dyn_odm_for_multi_stream;
 	bool disable_dyn_odm_for_stream_with_svp;
@@ -331,7 +332,6 @@ struct dml2_mode_support_info {
 	bool DTBCLKRequiredMoreThanSupported;
 	bool LinkCapacitySupport;
 	bool ROBSupport;
-	bool ROBUrgencyAvoidance;
 	bool OutstandingRequestsSupport;
 	bool OutstandingRequestsUrgencyAvoidance;
 	bool PTEBufferSizeNotExceeded;
@@ -659,6 +659,7 @@ struct dml2_display_cfg_programming {
 			double DSCDelay[DML2_MAX_PLANES];
 			double MaxActiveDRAMClockChangeLatencySupported[DML2_MAX_PLANES];
 			unsigned int PrefetchMode[DML2_MAX_PLANES]; // LEGACY_ONLY
+			bool ROBUrgencyAvoidance;
 		} misc;
 
 		struct dml2_mode_support_info mode_support_info;
@@ -715,4 +716,5 @@ struct dml2_unit_test_in_out {
 	struct dml2_instance *dml2_instance;
 };
 
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
index 0bbd2f47cb79..4b8691c43523 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
@@ -66,6 +66,73 @@ struct dml2_core_ip_params core_dcn4_ip_caps_base = {
 	.cursor_64bpp_support = true,
 	.dynamic_metadata_vm_enabled = false,
 
+	.max_num_dp2p0_outputs = 4,
+	.max_num_dp2p0_streams = 4,
+	.imall_supported = 1,
+	.max_flip_time_us = 80,
+	.words_per_channel = 16,
+
+	.subvp_fw_processing_delay_us = 15,
+	.subvp_pstate_allow_width_us = 20,
+	.subvp_swath_height_margin_lines = 16,
+};
+
+struct dml2_core_ip_params core_dcn4sw_ip_caps_base = {
+	.vblank_nom_default_us = 668,
+	.remote_iommu_outstanding_translations = 256,
+	.rob_buffer_size_kbytes = 192,
+	.config_return_buffer_size_in_kbytes = 1280,
+	.config_return_buffer_segment_size_in_kbytes = 64,
+	.compressed_buffer_segment_size_in_kbytes = 64,
+	.dpte_buffer_size_in_pte_reqs_luma = 68,
+	.dpte_buffer_size_in_pte_reqs_chroma = 36,
+	.pixel_chunk_size_kbytes = 8,
+	.alpha_pixel_chunk_size_kbytes = 4,
+	.min_pixel_chunk_size_bytes = 1024,
+	.writeback_chunk_size_kbytes = 8,
+	.line_buffer_size_bits = 1171920,
+	.max_line_buffer_lines = 32,
+	.writeback_interface_buffer_size_kbytes = 90,
+
+	//Number of pipes after DCN Pipe harvesting
+	.max_num_dpp = 4,
+	.max_num_otg = 4,
+	.max_num_wb = 1,
+	.max_dchub_pscl_bw_pix_per_clk = 4,
+	.max_pscl_lb_bw_pix_per_clk = 2,
+	.max_lb_vscl_bw_pix_per_clk = 4,
+	.max_vscl_hscl_bw_pix_per_clk = 4,
+	.max_hscl_ratio = 6,
+	.max_vscl_ratio = 6,
+	.max_hscl_taps = 8,
+	.max_vscl_taps = 8,
+	.dispclk_ramp_margin_percent = 1,
+	.dppclk_delay_subtotal = 47,
+	.dppclk_delay_scl = 50,
+	.dppclk_delay_scl_lb_only = 16,
+	.dppclk_delay_cnvc_formatter = 28,
+	.dppclk_delay_cnvc_cursor = 6,
+	.cursor_buffer_size = 24,
+	.cursor_chunk_size = 2,
+	.dispclk_delay_subtotal = 125,
+	.max_inter_dcn_tile_repeaters = 8,
+	.writeback_max_hscl_ratio = 1,
+	.writeback_max_vscl_ratio = 1,
+	.writeback_min_hscl_ratio = 1,
+	.writeback_min_vscl_ratio = 1,
+	.writeback_max_hscl_taps = 1,
+	.writeback_max_vscl_taps = 1,
+	.writeback_line_buffer_buffer_size = 0,
+	.num_dsc = 4,
+	.maximum_dsc_bits_per_component = 12,
+	.maximum_pixels_per_line_per_dsc_unit = 5760,
+	.dsc422_native_support = true,
+	.dcc_supported = true,
+	.ptoi_supported = false,
+
+	.cursor_64bpp_support = true,
+	.dynamic_metadata_vm_enabled = false,
+
 	.max_num_hdmi_frl_outputs = 1,
 	.max_num_dp2p0_outputs = 4,
 	.max_num_dp2p0_streams = 4,
@@ -76,6 +143,16 @@ struct dml2_core_ip_params core_dcn4_ip_caps_base = {
 	.subvp_fw_processing_delay_us = 15,
 	.subvp_pstate_allow_width_us = 20,
 	.subvp_swath_height_margin_lines = 16,
+
+	.dcn_mrq_present = 1,
+	.zero_size_buffer_entries = 512,
+	.compbuf_reserved_space_zs = 64,
+	.dcc_meta_buffer_size_bytes = 6272,
+	.meta_chunk_size_kbytes = 2,
+	.min_meta_chunk_size_bytes = 256,
+
+	.dchub_arb_to_ret_delay = 102,
+	.hostvm_mode = 1,
 };
 
 static void patch_ip_caps_with_explicit_ip_params(struct dml2_ip_capabilities *ip_caps, const struct dml2_core_ip_params *ip_params)
@@ -85,10 +162,14 @@ static void patch_ip_caps_with_explicit_ip_params(struct dml2_ip_capabilities *i
 	ip_caps->num_dsc = ip_params->num_dsc;
 	ip_caps->max_num_dp2p0_streams = ip_params->max_num_dp2p0_streams;
 	ip_caps->max_num_dp2p0_outputs = ip_params->max_num_dp2p0_outputs;
+	ip_caps->max_num_hdmi_frl_outputs = ip_params->max_num_hdmi_frl_outputs;
 	ip_caps->rob_buffer_size_kbytes = ip_params->rob_buffer_size_kbytes;
 	ip_caps->config_return_buffer_size_in_kbytes = ip_params->config_return_buffer_size_in_kbytes;
+	ip_caps->config_return_buffer_segment_size_in_kbytes = ip_params->config_return_buffer_segment_size_in_kbytes;
 	ip_caps->meta_fifo_size_in_kentries = ip_params->meta_fifo_size_in_kentries;
 	ip_caps->compressed_buffer_segment_size_in_kbytes = ip_params->compressed_buffer_segment_size_in_kbytes;
+	ip_caps->max_flip_time_us = ip_params->max_flip_time_us;
+	ip_caps->hostvm_mode = ip_params->hostvm_mode;
 
 	// FIXME_STAGE2: cleanup after adding all dv override to ip_caps
 	ip_caps->subvp_drr_scheduling_margin_us = 100;
@@ -104,10 +185,14 @@ static void patch_ip_params_with_ip_caps(struct dml2_core_ip_params *ip_params,
 	ip_params->num_dsc = ip_caps->num_dsc;
 	ip_params->max_num_dp2p0_streams = ip_caps->max_num_dp2p0_streams;
 	ip_params->max_num_dp2p0_outputs = ip_caps->max_num_dp2p0_outputs;
+	ip_params->max_num_hdmi_frl_outputs = ip_caps->max_num_hdmi_frl_outputs;
 	ip_params->rob_buffer_size_kbytes = ip_caps->rob_buffer_size_kbytes;
 	ip_params->config_return_buffer_size_in_kbytes = ip_caps->config_return_buffer_size_in_kbytes;
+	ip_params->config_return_buffer_segment_size_in_kbytes = ip_caps->config_return_buffer_segment_size_in_kbytes;
 	ip_params->meta_fifo_size_in_kentries = ip_caps->meta_fifo_size_in_kentries;
 	ip_params->compressed_buffer_segment_size_in_kbytes = ip_caps->compressed_buffer_segment_size_in_kbytes;
+	ip_params->max_flip_time_us = ip_caps->max_flip_time_us;
+	ip_params->hostvm_mode = ip_caps->hostvm_mode;
 }
 
 bool core_dcn4_initialize(struct dml2_core_initialize_in_out *in_out)
@@ -343,14 +428,12 @@ static void pack_mode_programming_params_with_implicit_subvp(struct dml2_core_in
 
 				programming->stream_programming[main_plane->stream_index].uclk_pstate_method = programming->plane_programming[plane_index].uclk_pstate_support_method;
 
-				// If FAMS2 is required, populate stream params
-				if (programming->fams2_required) {
-					dml2_core_calcs_get_stream_fams2_programming(&core->clean_me_up.mode_lib,
-						display_cfg,
-						&programming->stream_programming[main_plane->stream_index].fams2_params,
-						programming->stream_programming[main_plane->stream_index].uclk_pstate_method,
-						plane_index);
-				}
+				/* unconditionally populate fams2 params */
+				dml2_core_calcs_get_stream_fams2_programming(&core->clean_me_up.mode_lib,
+					display_cfg,
+					&programming->stream_programming[main_plane->stream_index].fams2_params,
+					programming->stream_programming[main_plane->stream_index].uclk_pstate_method,
+					plane_index);
 
 				stream_already_populated_mask |= (0x1 << main_plane->stream_index);
 			}
@@ -394,7 +477,7 @@ bool core_dcn4_mode_support(struct dml2_core_mode_support_in_out *in_out)
 
 	bool result;
 	unsigned int i, stream_index, stream_bitmask;
-	int unsigned odm_count, dpp_count;
+	int unsigned odm_count, num_odm_output_segments, dpp_count;
 
 	expand_implict_subvp(in_out->display_cfg, &l->svp_expanded_display_cfg, &core->scratch);
 
@@ -448,6 +531,10 @@ bool core_dcn4_mode_support(struct dml2_core_mode_support_in_out *in_out)
 
 		stream_bitmask = 0;
 		for (i = 0; i < l->svp_expanded_display_cfg.num_planes; i++) {
+			odm_count = 1;
+			dpp_count = l->mode_support_ex_params.out_evaluation_info->DPPPerSurface[i];
+			num_odm_output_segments = 1;
+
 			switch (l->mode_support_ex_params.out_evaluation_info->ODMMode[i]) {
 			case dml2_odm_mode_bypass:
 				odm_count = 1;
@@ -467,7 +554,11 @@ bool core_dcn4_mode_support(struct dml2_core_mode_support_in_out *in_out)
 				break;
 			case dml2_odm_mode_split_1to2:
 			case dml2_odm_mode_mso_1to2:
+				num_odm_output_segments = 2;
+				break;
 			case dml2_odm_mode_mso_1to4:
+				num_odm_output_segments = 4;
+				break;
 			case dml2_odm_mode_auto:
 			default:
 				odm_count = 1;
@@ -486,6 +577,7 @@ bool core_dcn4_mode_support(struct dml2_core_mode_support_in_out *in_out)
 
 			if (!((stream_bitmask >> stream_index) & 0x1)) {
 				in_out->mode_support_result.cfg_support_info.stream_support_info[stream_index].odms_used = odm_count;
+				in_out->mode_support_result.cfg_support_info.stream_support_info[stream_index].num_odm_output_segments = num_odm_output_segments;
 				in_out->mode_support_result.cfg_support_info.stream_support_info[stream_index].dsc_enable = l->mode_support_ex_params.out_evaluation_info->DSCEnabled[i];
 				in_out->mode_support_result.cfg_support_info.stream_support_info[stream_index].num_dsc_slices = l->mode_support_ex_params.out_evaluation_info->NumberOfDSCSlices[i];
 				dml2_core_calcs_get_stream_support_info(&l->svp_expanded_display_cfg, &core->clean_me_up.mode_lib, &in_out->mode_support_result.cfg_support_info.stream_support_info[stream_index], i);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index b921ad857916..8062144a5a6d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -15,79 +15,80 @@
 #define DML_TDLUT_ROW_BYTES_FIX_EN
 #define DML_REG_LIMIT_CLAMP_EN
 #define DML2_MAX_FMT_420_BUFFER_WIDTH 4096
+#define DML_MAX_NUM_OF_SLICES_PER_DSC 4
 
 static void dml2_print_dml_mode_support_info(const struct dml2_core_internal_mode_support_info *support, bool fail_only)
 {
 	dml2_printf("DML: ===================================== \n");
 	dml2_printf("DML: DML_MODE_SUPPORT_INFO_ST\n");
 	if (!fail_only || support->ImmediateFlipSupport == 0)
-		dml2_printf("DML: support: ImmediateFlipSupport = 0x%x\n", support->ImmediateFlipSupport);
+		dml2_printf("DML: support: ImmediateFlipSupport = %d\n", support->ImmediateFlipSupport);
 	if (!fail_only || support->WritebackLatencySupport == 0)
-		dml2_printf("DML: support: WritebackLatencySupport = 0x%x\n", support->WritebackLatencySupport);
+		dml2_printf("DML: support: WritebackLatencySupport = %d\n", support->WritebackLatencySupport);
 	if (!fail_only || support->ScaleRatioAndTapsSupport == 0)
-		dml2_printf("DML: support: ScaleRatioAndTapsSupport = 0x%x\n", support->ScaleRatioAndTapsSupport);
+		dml2_printf("DML: support: ScaleRatioAndTapsSupport = %d\n", support->ScaleRatioAndTapsSupport);
 	if (!fail_only || support->SourceFormatPixelAndScanSupport == 0)
-		dml2_printf("DML: support: SourceFormatPixelAndScanSupport = 0x%x\n", support->SourceFormatPixelAndScanSupport);
+		dml2_printf("DML: support: SourceFormatPixelAndScanSupport = %d\n", support->SourceFormatPixelAndScanSupport);
 	if (!fail_only || support->P2IWith420 == 1)
-		dml2_printf("DML: support: P2IWith420 = 0x%x\n", support->P2IWith420);
+		dml2_printf("DML: support: P2IWith420 = %d\n", support->P2IWith420);
 	if (!fail_only || support->DSCOnlyIfNecessaryWithBPP == 1)
-		dml2_printf("DML: support: DSCOnlyIfNecessaryWithBPP = 0x%x\n", support->DSCOnlyIfNecessaryWithBPP);
+		dml2_printf("DML: support: DSCOnlyIfNecessaryWithBPP = %d\n", support->DSCOnlyIfNecessaryWithBPP);
 	if (!fail_only || support->DSC422NativeNotSupported == 1)
-		dml2_printf("DML: support: DSC422NativeNotSupported = 0x%x\n", support->DSC422NativeNotSupported);
+		dml2_printf("DML: support: DSC422NativeNotSupported = %d\n", support->DSC422NativeNotSupported);
+	if (!fail_only || support->DSCSlicesODMModeSupported == 0)
+		dml2_printf("DML: support: DSCSlicesODMModeSupported = %d\n", support->DSCSlicesODMModeSupported);
 	if (!fail_only || support->LinkRateDoesNotMatchDPVersion == 1)
-		dml2_printf("DML: support: LinkRateDoesNotMatchDPVersion = 0x%x\n", support->LinkRateDoesNotMatchDPVersion);
+		dml2_printf("DML: support: LinkRateDoesNotMatchDPVersion = %d\n", support->LinkRateDoesNotMatchDPVersion);
 	if (!fail_only || support->LinkRateForMultistreamNotIndicated == 1)
-		dml2_printf("DML: support: LinkRateForMultistreamNotIndicated = 0x%x\n", support->LinkRateForMultistreamNotIndicated);
+		dml2_printf("DML: support: LinkRateForMultistreamNotIndicated = %d\n", support->LinkRateForMultistreamNotIndicated);
 	if (!fail_only || support->BPPForMultistreamNotIndicated == 1)
-		dml2_printf("DML: support: BPPForMultistreamNotIndicated = 0x%x\n", support->BPPForMultistreamNotIndicated);
+		dml2_printf("DML: support: BPPForMultistreamNotIndicated = %d\n", support->BPPForMultistreamNotIndicated);
 	if (!fail_only || support->MultistreamWithHDMIOreDP == 1)
-		dml2_printf("DML: support: MultistreamWithHDMIOreDP = 0x%x\n", support->MultistreamWithHDMIOreDP);
+		dml2_printf("DML: support: MultistreamWithHDMIOreDP = %d\n", support->MultistreamWithHDMIOreDP);
 	if (!fail_only || support->MSOOrODMSplitWithNonDPLink == 1)
-		dml2_printf("DML: support: MSOOrODMSplitWithNonDPLink = 0x%x\n", support->MSOOrODMSplitWithNonDPLink);
+		dml2_printf("DML: support: MSOOrODMSplitWithNonDPLink = %d\n", support->MSOOrODMSplitWithNonDPLink);
 	if (!fail_only || support->NotEnoughLanesForMSO == 1)
-		dml2_printf("DML: support: NotEnoughLanesForMSO = 0x%x\n", support->NotEnoughLanesForMSO);
+		dml2_printf("DML: support: NotEnoughLanesForMSO = %d\n", support->NotEnoughLanesForMSO);
 	if (!fail_only || support->NumberOfOTGSupport == 0)
-		dml2_printf("DML: support: NumberOfOTGSupport = 0x%x\n", support->NumberOfOTGSupport);
+		dml2_printf("DML: support: NumberOfOTGSupport = %d\n", support->NumberOfOTGSupport);
 	if (!fail_only || support->NumberOfHDMIFRLSupport == 0)
-		dml2_printf("DML: support: NumberOfHDMIFRLSupport = 0x%x\n", support->NumberOfHDMIFRLSupport);
+		dml2_printf("DML: support: NumberOfHDMIFRLSupport = %d\n", support->NumberOfHDMIFRLSupport);
 	if (!fail_only || support->NumberOfDP2p0Support == 0)
-		dml2_printf("DML: support: NumberOfDP2p0Support = 0x%x\n", support->NumberOfDP2p0Support);
+		dml2_printf("DML: support: NumberOfDP2p0Support = %d\n", support->NumberOfDP2p0Support);
 	if (!fail_only || support->WritebackScaleRatioAndTapsSupport == 0)
-		dml2_printf("DML: support: WritebackScaleRatioAndTapsSupport = 0x%x\n", support->WritebackScaleRatioAndTapsSupport);
+		dml2_printf("DML: support: WritebackScaleRatioAndTapsSupport = %d\n", support->WritebackScaleRatioAndTapsSupport);
 	if (!fail_only || support->CursorSupport == 0)
-		dml2_printf("DML: support: CursorSupport = 0x%x\n", support->CursorSupport);
+		dml2_printf("DML: support: CursorSupport = %d\n", support->CursorSupport);
 	if (!fail_only || support->PitchSupport == 0)
-		dml2_printf("DML: support: PitchSupport = 0x%x\n", support->PitchSupport);
+		dml2_printf("DML: support: PitchSupport = %d\n", support->PitchSupport);
 	if (!fail_only || support->ViewportExceedsSurface == 1)
-		dml2_printf("DML: support: ViewportExceedsSurface = 0x%x\n", support->ViewportExceedsSurface);
+		dml2_printf("DML: support: ViewportExceedsSurface = %d\n", support->ViewportExceedsSurface);
 	if (!fail_only || support->ExceededMALLSize == 1)
-		dml2_printf("DML: support: ExceededMALLSize = 0x%x\n", support->ExceededMALLSize);
+		dml2_printf("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
 	if (!fail_only || support->EnoughWritebackUnits == 0)
-		dml2_printf("DML: support: EnoughWritebackUnits = 0x%x\n", support->EnoughWritebackUnits);
+		dml2_printf("DML: support: EnoughWritebackUnits = %d\n", support->EnoughWritebackUnits);
 	if (!fail_only || support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe == 1)
-		dml2_printf("DML: support: ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = 0x%x\n", support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe);
+		dml2_printf("DML: support: ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = %d\n", support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe);
 	if (!fail_only || support->InvalidCombinationOfMALLUseForPStateAndStaticScreen == 1)
-		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPStateAndStaticScreen = 0x%x\n", support->InvalidCombinationOfMALLUseForPStateAndStaticScreen);
+		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPStateAndStaticScreen = %d\n", support->InvalidCombinationOfMALLUseForPStateAndStaticScreen);
 	if (!fail_only || support->InvalidCombinationOfMALLUseForPState == 1)
-		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPState = 0x%x\n", support->InvalidCombinationOfMALLUseForPState);
+		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPState = %d\n", support->InvalidCombinationOfMALLUseForPState);
 	if (!fail_only || support->ExceededMultistreamSlots == 1)
-		dml2_printf("DML: support: ExceededMultistreamSlots = 0x%x\n", support->ExceededMultistreamSlots);
+		dml2_printf("DML: support: ExceededMultistreamSlots = %d\n", support->ExceededMultistreamSlots);
 	if (!fail_only || support->NotEnoughDSCUnits == 1)
-		dml2_printf("DML: support: NotEnoughDSCUnits = 0x%x\n", support->NotEnoughDSCUnits);
+		dml2_printf("DML: support: NotEnoughDSCUnits = %d\n", support->NotEnoughDSCUnits);
 	if (!fail_only || support->NotEnoughDSCSlices == 1)
-		dml2_printf("DML: support: NotEnoughDSCSlices = 0x%x\n", support->NotEnoughDSCSlices);
+		dml2_printf("DML: support: NotEnoughDSCSlices = %d\n", support->NotEnoughDSCSlices);
 	if (!fail_only || support->PixelsPerLinePerDSCUnitSupport == 0)
-		dml2_printf("DML: support: PixelsPerLinePerDSCUnitSupport = 0x%x\n", support->PixelsPerLinePerDSCUnitSupport);
+		dml2_printf("DML: support: PixelsPerLinePerDSCUnitSupport = %d\n", support->PixelsPerLinePerDSCUnitSupport);
 	if (!fail_only || support->DSCCLKRequiredMoreThanSupported == 1)
-		dml2_printf("DML: support: DSCCLKRequiredMoreThanSupported = 0x%x\n", support->DSCCLKRequiredMoreThanSupported);
+		dml2_printf("DML: support: DSCCLKRequiredMoreThanSupported = %d\n", support->DSCCLKRequiredMoreThanSupported);
 	if (!fail_only || support->DTBCLKRequiredMoreThanSupported == 1)
-		dml2_printf("DML: support: DTBCLKRequiredMoreThanSupported = 0x%x\n", support->DTBCLKRequiredMoreThanSupported);
+		dml2_printf("DML: support: DTBCLKRequiredMoreThanSupported = %d\n", support->DTBCLKRequiredMoreThanSupported);
 	if (!fail_only || support->LinkCapacitySupport == 0)
-		dml2_printf("DML: support: LinkCapacitySupport = 0x%x\n", support->LinkCapacitySupport);
+		dml2_printf("DML: support: LinkCapacitySupport = %d\n", support->LinkCapacitySupport);
 	if (!fail_only || support->ROBSupport == 0)
 		dml2_printf("DML: support: ROBSupport = %d\n", support->ROBSupport);
-	if (!fail_only || support->ROBUrgencyAvoidance == 0)
-		dml2_printf("DML: support: ROBUrgencyAvoidance = %d\n", support->ROBUrgencyAvoidance);
 	if (!fail_only || support->OutstandingRequestsSupport == 0)
 		dml2_printf("DML: support: OutstandingRequestsSupport = %d\n", support->OutstandingRequestsSupport);
 	if (!fail_only || support->OutstandingRequestsUrgencyAvoidance == 0)
@@ -319,7 +320,6 @@ dml_get_var_func(svp_prefetch_urg_bw_available_sdp, double, mode_lib->mp.urg_ban
 dml_get_var_func(svp_prefetch_urg_bw_available_dram, double, mode_lib->mp.urg_bandwidth_available[dml2_core_internal_soc_state_svp_prefetch][dml2_core_internal_bw_dram]);
 dml_get_var_func(svp_prefetch_urg_bw_available_dram_vm_only, double, mode_lib->mp.urg_bandwidth_available_vm_only[dml2_core_internal_soc_state_svp_prefetch]);
 
-dml_get_var_func(max_non_urgent_latency_us, double, mode_lib->ms.support.max_non_urgent_latency_us);
 dml_get_var_func(max_urgent_latency_us, double, mode_lib->ms.support.max_urgent_latency_us);
 dml_get_var_func(avg_non_urgent_latency_us, double, mode_lib->ms.support.avg_non_urgent_latency_us);
 dml_get_var_func(avg_urgent_latency_us, double, mode_lib->ms.support.avg_urgent_latency_us);
@@ -348,7 +348,6 @@ dml_get_var_func(comp_buffer_size_kbytes, unsigned int, mode_lib->mp.CompressedB
 
 dml_get_var_func(unbounded_request_enabled, bool, mode_lib->mp.UnboundedRequestEnabled);
 dml_get_var_func(wm_writeback_urgent, double, mode_lib->mp.Watermark.WritebackUrgentWatermark);
-
 dml_get_var_func(cstate_max_cap_mode, bool, mode_lib->mp.DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE);
 dml_get_var_func(compbuf_reserved_space_64b, unsigned int, mode_lib->mp.compbuf_reserved_space_64b);
 dml_get_var_func(hw_debug5, bool, mode_lib->mp.hw_debug5);
@@ -823,11 +822,6 @@ static void CalculateSwathWidth(
 #endif
 
 		MainSurfaceODMMode = ODMMode[k];
-		for (unsigned int j = 0; j < NumberOfActiveSurfaces; ++j) {
-			if (display_cfg->plane_descriptors[k].stream_index == j) {
-				MainSurfaceODMMode = ODMMode[j];
-			}
-		}
 
 		if (ForceSingleDPP) {
 			SwathWidthY[k] = SwathWidthSingleDPPY[k];
@@ -1098,8 +1092,8 @@ static void CalculateDETBufferSize(
 					l->TotalBandwidthPerStream[display_cfg->plane_descriptors[k].stream_index] += (unsigned int)(ReadBandwidthLuma[k] + ReadBandwidthChroma[k]);
 
 					// Check the minimum can be satisfied by budget
-					if (l->RemainingDETBudgetPerStream[display_cfg->plane_descriptors[k].stream_index] >= DETBufferSizeInKByte[k]) {
-						l->RemainingDETBudgetPerStream[display_cfg->plane_descriptors[k].stream_index] -= DETBufferSizeInKByte[k];
+					if (l->RemainingDETBudgetPerStream[display_cfg->plane_descriptors[k].stream_index] >= DETBufferSizeInKByte[k] * (ForceSingleDPP ? 1 : DPPPerSurface[k])) {
+						l->RemainingDETBudgetPerStream[display_cfg->plane_descriptors[k].stream_index] -= DETBufferSizeInKByte[k] * (ForceSingleDPP ? 1 : DPPPerSurface[k]);
 					} else {
 						MinimizeReallocationSuccess = false;
 						break;
@@ -1122,17 +1116,15 @@ static void CalculateDETBufferSize(
 							if (l->DeltaDETBudget > l->RemainingDETBudgetPerStream[display_cfg->plane_descriptors[k].stream_index])
 								l->DeltaDETBudget = l->RemainingDETBudgetPerStream[display_cfg->plane_descriptors[k].stream_index];
 
-							DETBufferSizeInKByte[k] += l->DeltaDETBudget;
+							/* split the additional budgeted DET among the pipes per plane */
+							DETBufferSizeInKByte[k] += (unsigned int)((double)l->DeltaDETBudget / (ForceSingleDPP ? 1 : DPPPerSurface[k]));
 							l->RemainingDETBudgetPerStream[display_cfg->plane_descriptors[k].stream_index] -= l->DeltaDETBudget;
 						}
 
-						// Split among the pipes per the plane
-						DETBufferSizeInKByte[k] = (unsigned int)((double)DETBufferSizeInKByte[k] / (ForceSingleDPP ? 1 : DPPPerSurface[k]));
-
 						// Round down to segment size
-						DETBufferSizeInKByte[k] = (DETBufferSizeInKByte[k] / CompressedBufferSegmentSizeInkByte) * CompressedBufferSegmentSizeInkByte;
+						DETBufferSizeInKByte[k] = (DETBufferSizeInKByte[k] / ConfigReturnBufferSegmentSizeInkByte) * ConfigReturnBufferSegmentSizeInkByte;
 
-						l->ResidualDETAfterRounding -= DETBufferSizeInKByte[k];
+						l->ResidualDETAfterRounding -= DETBufferSizeInKByte[k] * (ForceSingleDPP ? 1 : DPPPerSurface[k]);
 					}
 				}
 			}
@@ -2856,7 +2848,7 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 {
 	struct dml2_core_calcs_CalculateVMRowAndSwath_locals *s = &scratch->CalculateVMRowAndSwath_locals;
 
-	s->HostVMDynamicLevels = CalculateHostVMDynamicLevels(p->display_cfg->gpuvm_enable, p->display_cfg->hostvm_enable, p->HostVMMinPageSize, p->display_cfg->hostvm_max_page_table_levels);
+	s->HostVMDynamicLevels = CalculateHostVMDynamicLevels(p->display_cfg->gpuvm_enable, p->display_cfg->hostvm_enable, p->HostVMMinPageSize, p->display_cfg->hostvm_max_non_cached_page_table_levels);
 
 	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
 		if (p->display_cfg->hostvm_enable == true) {
@@ -3035,6 +3027,8 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 #endif
 		p->vm_bytes[k] = (s->vm_bytes_l + s->vm_bytes_c) * (1 + 8 * s->HostVMDynamicLevels);
 		p->meta_row_bytes[k] = s->meta_row_bytes_per_row_ub_l[k] + s->meta_row_bytes_per_row_ub_c[k];
+		p->meta_row_bytes_per_row_ub_l[k] = s->meta_row_bytes_per_row_ub_l[k];
+		p->meta_row_bytes_per_row_ub_c[k] = s->meta_row_bytes_per_row_ub_c[k];
 
 #ifdef __DML_VBA_DEBUG__
 		dml2_printf("DML::%s: k=%u, meta_row_bytes = %u\n", __func__, k, p->meta_row_bytes[k]);
@@ -3125,6 +3119,8 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 		s->PixelPTEBytesPerRowY[k] = s->PixelPTEBytesPerRowY[k] * (1 + 8 * s->HostVMDynamicLevels);
 		s->PixelPTEBytesPerRowC[k] = s->PixelPTEBytesPerRowC[k] * (1 + 8 * s->HostVMDynamicLevels);
 		p->PixelPTEBytesPerRow[k] = s->PixelPTEBytesPerRowY[k] + s->PixelPTEBytesPerRowC[k];
+		p->dpte_row_bytes_per_row_l[k] = s->PixelPTEBytesPerRowY[k];
+		p->dpte_row_bytes_per_row_c[k] = s->PixelPTEBytesPerRowC[k];
 
 		// if one row of dPTEs is meant to span the entire frame, then for these calculations, we will pretend like that one big row is fetched in two halfs
 		if (p->use_one_row_for_frame[k])
@@ -3144,8 +3140,8 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 			p->dpte_row_height_chroma[k],
 
 			p->mrq_present,
-			s->meta_row_bytes_per_row_ub_l[k],
-			s->meta_row_bytes_per_row_ub_c[k],
+			p->meta_row_bytes_per_row_ub_l[k],
+			p->meta_row_bytes_per_row_ub_c[k],
 			p->meta_row_height_luma[k],
 			p->meta_row_height_chroma[k],
 
@@ -3375,9 +3371,6 @@ static void calculate_cursor_req_attributes(
 	dml2_printf("DML::%s: cursor_bytes = %d\n", __func__, *cursor_bytes);
 	dml2_printf("DML::%s: cursor_pitch = %d\n", __func__, cursor_pitch);
 #endif
-
-	// register CURSOR_PITCH = math_log2(cursor_pitch) - 6;
-	// register CURSOR_LINES_PER_CHUNK = math_log2(*cursor_lines_per_chunk);
 }
 
 static void calculate_cursor_urgent_burst_factor(
@@ -3743,8 +3736,23 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 #ifdef __DML_VBA_DEBUG__
 		dml2_printf("DML::%s: k=%u DETBufferSizeInKByteForSwathCalculation = %u\n", __func__, k, DETBufferSizeInKByteForSwathCalculation);
 #endif
+		if (p->display_cfg->plane_descriptors[k].surface.tiling == dml2_sw_linear) {
+			p->SwathHeightY[k] = MaximumSwathHeightY[k];
+			p->SwathHeightC[k] = MaximumSwathHeightC[k];
+			RoundedUpSwathSizeBytesY[k] = p->full_swath_bytes_l[k];
+			RoundedUpSwathSizeBytesC[k] = p->full_swath_bytes_c[k];
+
+			if (p->surf_linear128_l[k])
+				p->request_size_bytes_luma[k] = 128;
+			else
+				p->request_size_bytes_luma[k] = 256;
+
+			if (p->surf_linear128_c[k])
+				p->request_size_bytes_chroma[k] = 128;
+			else
+				p->request_size_bytes_chroma[k] = 256;
 
-		if (p->full_swath_bytes_l[k] + p->full_swath_bytes_c[k] <= DETBufferSizeInKByteForSwathCalculation * 1024 / 2) {
+		} else if (p->full_swath_bytes_l[k] + p->full_swath_bytes_c[k] <= DETBufferSizeInKByteForSwathCalculation * 1024 / 2) {
 			p->SwathHeightY[k] = MaximumSwathHeightY[k];
 			p->SwathHeightC[k] = MaximumSwathHeightC[k];
 			RoundedUpSwathSizeBytesY[k] = p->full_swath_bytes_l[k];
@@ -3783,6 +3791,13 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 		if ((p->full_swath_bytes_l[k] / 2 + p->full_swath_bytes_c[k] / 2 > DETBufferSizeInKByteForSwathCalculation * 1024 / 2) ||
 			p->SwathWidth[k] > p->MaximumSwathWidthLuma[k] || (p->SwathHeightC[k] > 0 && p->SwathWidthChroma[k] > p->MaximumSwathWidthChroma[k])) {
 			*p->ViewportSizeSupport = false;
+			dml2_printf("DML::%s: k=%u full_swath_bytes_l=%u\n", __func__, k, p->full_swath_bytes_l[k]);
+			dml2_printf("DML::%s: k=%u full_swath_bytes_c=%u\n", __func__, k, p->full_swath_bytes_c[k]);
+			dml2_printf("DML::%s: k=%u DETBufferSizeInKByteForSwathCalculation=%u\n", __func__, k, DETBufferSizeInKByteForSwathCalculation);
+			dml2_printf("DML::%s: k=%u SwathWidth=%u\n", __func__, k, p->SwathWidth[k]);
+			dml2_printf("DML::%s: k=%u MaximumSwathWidthLuma=%f\n", __func__, k, p->MaximumSwathWidthLuma[k]);
+			dml2_printf("DML::%s: k=%u SwathWidthChroma=%d\n", __func__, k, p->SwathWidthChroma[k]);
+			dml2_printf("DML::%s: k=%u MaximumSwathWidthChroma=%f\n", __func__, k, p->MaximumSwathWidthChroma[k]);
 			p->ViewportSizeSupportPerSurface[k] = false;
 		} else {
 			p->ViewportSizeSupportPerSurface[k] = true;
@@ -3855,6 +3870,161 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 	}
 }
 
+static enum dml2_odm_mode DecideODMMode(unsigned int HActive,
+	double MaxDispclk,
+	unsigned int MaximumPixelsPerLinePerDSCUnit,
+	enum dml2_output_format_class OutFormat,
+	bool UseDSC,
+	unsigned int NumberOfDSCSlices,
+	double SurfaceRequiredDISPCLKWithoutODMCombine,
+	double SurfaceRequiredDISPCLKWithODMCombineTwoToOne,
+	double SurfaceRequiredDISPCLKWithODMCombineThreeToOne,
+	double SurfaceRequiredDISPCLKWithODMCombineFourToOne)
+{
+	enum dml2_odm_mode MinimumRequiredODMModeForMaxDispClock;
+	enum dml2_odm_mode MinimumRequiredODMModeForMaxDSCHActive;
+	enum dml2_odm_mode MinimumRequiredODMModeForMax420HActive;
+	enum dml2_odm_mode ODMMode = dml2_odm_mode_bypass;
+
+	MinimumRequiredODMModeForMaxDispClock =
+			(SurfaceRequiredDISPCLKWithoutODMCombine <= MaxDispclk) ? dml2_odm_mode_bypass :
+			(SurfaceRequiredDISPCLKWithODMCombineTwoToOne <= MaxDispclk) ? dml2_odm_mode_combine_2to1 :
+			(SurfaceRequiredDISPCLKWithODMCombineThreeToOne <= MaxDispclk) ? dml2_odm_mode_combine_3to1 : dml2_odm_mode_combine_4to1;
+	if (ODMMode < MinimumRequiredODMModeForMaxDispClock)
+		ODMMode = MinimumRequiredODMModeForMaxDispClock;
+
+	if (UseDSC) {
+		MinimumRequiredODMModeForMaxDSCHActive =
+				(HActive <= 1 * MaximumPixelsPerLinePerDSCUnit) ? dml2_odm_mode_bypass :
+				(HActive <= 2 * MaximumPixelsPerLinePerDSCUnit) ? dml2_odm_mode_combine_2to1 :
+				(HActive <= 3 * MaximumPixelsPerLinePerDSCUnit) ? dml2_odm_mode_combine_3to1 : dml2_odm_mode_combine_4to1;
+		if (ODMMode < MinimumRequiredODMModeForMaxDSCHActive)
+			ODMMode = MinimumRequiredODMModeForMaxDSCHActive;
+	}
+
+	if (OutFormat == dml2_420) {
+		MinimumRequiredODMModeForMax420HActive =
+				(HActive <= 1 * DML2_MAX_FMT_420_BUFFER_WIDTH) ? dml2_odm_mode_bypass :
+				(HActive <= 2 * DML2_MAX_FMT_420_BUFFER_WIDTH) ? dml2_odm_mode_combine_2to1 :
+				(HActive <= 3 * DML2_MAX_FMT_420_BUFFER_WIDTH) ? dml2_odm_mode_combine_3to1 : dml2_odm_mode_combine_4to1;
+		if (ODMMode < MinimumRequiredODMModeForMax420HActive)
+			ODMMode = MinimumRequiredODMModeForMax420HActive;
+	}
+
+	if (UseDSC) {
+		if (ODMMode == dml2_odm_mode_bypass && NumberOfDSCSlices > 4)
+			ODMMode = dml2_odm_mode_combine_2to1;
+		if (ODMMode == dml2_odm_mode_combine_2to1 && NumberOfDSCSlices > 8)
+			ODMMode = dml2_odm_mode_combine_3to1;
+		if (ODMMode == dml2_odm_mode_combine_3to1 && NumberOfDSCSlices != 12)
+			ODMMode = dml2_odm_mode_combine_4to1;
+	}
+
+	return ODMMode;
+}
+
+static void CalculateODMConstraints(
+	enum dml2_odm_mode ODMUse,
+	double SurfaceRequiredDISPCLKWithoutODMCombine,
+	double SurfaceRequiredDISPCLKWithODMCombineTwoToOne,
+	double SurfaceRequiredDISPCLKWithODMCombineThreeToOne,
+	double SurfaceRequiredDISPCLKWithODMCombineFourToOne,
+	unsigned int MaximumPixelsPerLinePerDSCUnit,
+	/* Output */
+	double *DISPCLKRequired,
+	unsigned int *NumberOfDPPRequired,
+	unsigned int *MaxHActiveForDSC,
+	unsigned int *MaxDSCSlices,
+	unsigned int *MaxHActiveFor420)
+{
+	switch (ODMUse) {
+	case dml2_odm_mode_combine_2to1:
+		*DISPCLKRequired = SurfaceRequiredDISPCLKWithODMCombineTwoToOne;
+		*NumberOfDPPRequired = 2;
+		break;
+	case dml2_odm_mode_combine_3to1:
+		*DISPCLKRequired = SurfaceRequiredDISPCLKWithODMCombineThreeToOne;
+		*NumberOfDPPRequired = 3;
+		break;
+	case dml2_odm_mode_combine_4to1:
+		*DISPCLKRequired = SurfaceRequiredDISPCLKWithODMCombineFourToOne;
+		*NumberOfDPPRequired = 4;
+		break;
+	case dml2_odm_mode_auto:
+	case dml2_odm_mode_split_1to2:
+	case dml2_odm_mode_mso_1to2:
+	case dml2_odm_mode_mso_1to4:
+	case dml2_odm_mode_bypass:
+	default:
+		*DISPCLKRequired = SurfaceRequiredDISPCLKWithoutODMCombine;
+		*NumberOfDPPRequired = 1;
+		break;
+	}
+	*MaxHActiveForDSC = *NumberOfDPPRequired * MaximumPixelsPerLinePerDSCUnit;
+	*MaxDSCSlices = *NumberOfDPPRequired * DML_MAX_NUM_OF_SLICES_PER_DSC;
+	*MaxHActiveFor420 = *NumberOfDPPRequired * DML2_MAX_FMT_420_BUFFER_WIDTH;
+}
+
+static bool ValidateODMMode(enum dml2_odm_mode ODMMode,
+	double MaxDispclk,
+	unsigned int HActive,
+	enum dml2_output_format_class OutFormat,
+	bool UseDSC,
+	unsigned int NumberOfDSCSlices,
+	unsigned int TotalNumberOfActiveDPP,
+	unsigned int MaxNumDPP,
+	double DISPCLKRequired,
+	unsigned int NumberOfDPPRequired,
+	unsigned int MaxHActiveForDSC,
+	unsigned int MaxDSCSlices,
+	unsigned int MaxHActiveFor420)
+{
+	bool are_odm_segments_symmetrical = (ODMMode == dml2_odm_mode_combine_3to1) ? UseDSC : true;
+	bool is_max_dsc_slice_required = (ODMMode == dml2_odm_mode_combine_3to1);
+	unsigned int pixels_per_clock_cycle = (OutFormat == dml2_420 || OutFormat == dml2_n422) ? 2 : 1;
+	unsigned int h_timing_div_mode =
+			(ODMMode == dml2_odm_mode_combine_4to1 || ODMMode == dml2_odm_mode_combine_3to1) ? 4 :
+			(ODMMode == dml2_odm_mode_combine_2to1) ? 2 : pixels_per_clock_cycle;
+
+	if (DISPCLKRequired > MaxDispclk)
+		return false;
+	if ((TotalNumberOfActiveDPP + NumberOfDPPRequired) > MaxNumDPP)
+		return false;
+	if (are_odm_segments_symmetrical) {
+		if (HActive % (NumberOfDPPRequired * pixels_per_clock_cycle))
+			return false;
+	}
+	if (HActive % h_timing_div_mode)
+		/*
+		 * TODO - OTG_H_TOTAL, OTG_H_BLANK_START/END and
+		 * OTG_H_SYNC_A_START/END all need to be visible by h timing div
+		 * mode. This logic only checks H active.
+		 */
+		return false;
+
+	if (UseDSC) {
+		if (HActive > MaxHActiveForDSC)
+			return false;
+		if (NumberOfDSCSlices > MaxDSCSlices)
+			return false;
+		if (HActive % NumberOfDSCSlices)
+			return false;
+		if (NumberOfDSCSlices % NumberOfDPPRequired)
+			return false;
+		if (is_max_dsc_slice_required) {
+			if (NumberOfDSCSlices != MaxDSCSlices)
+				return false;
+		}
+	}
+
+	if (OutFormat == dml2_420) {
+		if (HActive > MaxHActiveFor420)
+			return false;
+	}
+
+	return true;
+}
+
 static void CalculateODMMode(
 	unsigned int MaximumPixelsPerLinePerDSCUnit,
 	unsigned int HActive,
@@ -3878,48 +4048,19 @@ static void CalculateODMMode(
 	double SurfaceRequiredDISPCLKWithODMCombineTwoToOne;
 	double SurfaceRequiredDISPCLKWithODMCombineThreeToOne;
 	double SurfaceRequiredDISPCLKWithODMCombineFourToOne;
+	double DISPCLKRequired;
+	unsigned int NumberOfDPPRequired;
+	unsigned int MaxHActiveForDSC;
+	unsigned int MaxDSCSlices;
+	unsigned int MaxHActiveFor420;
+	bool success;
+	bool UseDSC = DSCEnable && (NumberOfDSCSlices > 0);
+	enum dml2_odm_mode DecidedODMMode;
 
 	SurfaceRequiredDISPCLKWithoutODMCombine = CalculateRequiredDispclk(dml2_odm_mode_bypass, PixelClock);
 	SurfaceRequiredDISPCLKWithODMCombineTwoToOne = CalculateRequiredDispclk(dml2_odm_mode_combine_2to1, PixelClock);
 	SurfaceRequiredDISPCLKWithODMCombineThreeToOne = CalculateRequiredDispclk(dml2_odm_mode_combine_3to1, PixelClock);
 	SurfaceRequiredDISPCLKWithODMCombineFourToOne = CalculateRequiredDispclk(dml2_odm_mode_combine_4to1, PixelClock);
-	*TotalAvailablePipesSupport = true;
-
-	if (OutFormat == dml2_420) {
-		if (HActive > 4 * DML2_MAX_FMT_420_BUFFER_WIDTH)
-			*TotalAvailablePipesSupport = false;
-		else if (HActive > 3 * DML2_MAX_FMT_420_BUFFER_WIDTH)
-			ODMUse = dml2_odm_mode_combine_4to1;
-		else if (HActive > 2 * DML2_MAX_FMT_420_BUFFER_WIDTH)
-			ODMUse = dml2_odm_mode_combine_3to1;
-		else if (HActive > DML2_MAX_FMT_420_BUFFER_WIDTH)
-			ODMUse = dml2_odm_mode_combine_2to1;
-		if (Output == dml2_hdmi && ODMUse == dml2_odm_mode_combine_2to1)
-			*TotalAvailablePipesSupport = false;
-		if (Output == dml2_hdmi && ODMUse == dml2_odm_mode_combine_3to1)
-			*TotalAvailablePipesSupport = false;
-		if (Output == dml2_hdmi && ODMUse == dml2_odm_mode_combine_4to1)
-			*TotalAvailablePipesSupport = false;
-	}
-
-	if (ODMUse == dml2_odm_mode_bypass || ODMUse == dml2_odm_mode_auto)
-		*ODMMode = dml2_odm_mode_bypass;
-	else if (ODMUse == dml2_odm_mode_combine_2to1)
-		*ODMMode = dml2_odm_mode_combine_2to1;
-	else if (ODMUse == dml2_odm_mode_combine_3to1)
-		*ODMMode = dml2_odm_mode_combine_3to1;
-	else if (ODMUse == dml2_odm_mode_combine_4to1)
-		*ODMMode = dml2_odm_mode_combine_4to1;
-	else if (ODMUse == dml2_odm_mode_split_1to2)
-		*ODMMode = dml2_odm_mode_split_1to2;
-	else if (ODMUse == dml2_odm_mode_mso_1to2)
-		*ODMMode = dml2_odm_mode_mso_1to2;
-	else if (ODMUse == dml2_odm_mode_mso_1to4)
-		*ODMMode = dml2_odm_mode_mso_1to4;
-
-	*RequiredDISPCLKPerSurface = SurfaceRequiredDISPCLKWithoutODMCombine;
-	*NumberOfDPP = 0;
-
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: ODMUse = %d\n", __func__, ODMUse);
 	dml2_printf("DML::%s: Output = %d\n", __func__, Output);
@@ -3931,53 +4072,54 @@ static void CalculateODMMode(
 	dml2_printf("DML::%s: SurfaceRequiredDISPCLKWithODMCombineThreeToOne = %f\n", __func__, SurfaceRequiredDISPCLKWithODMCombineThreeToOne);
 	dml2_printf("DML::%s: SurfaceRequiredDISPCLKWithODMCombineFourToOne = %f\n", __func__, SurfaceRequiredDISPCLKWithODMCombineFourToOne);
 #endif
-
-	if (ODMUse == dml2_odm_mode_combine_4to1 || (ODMUse == dml2_odm_mode_auto &&
-		(SurfaceRequiredDISPCLKWithODMCombineThreeToOne > MaxDispclk ||
-			(DSCEnable && ((NumberOfDSCSlices % 4 == 0) && ((HActive > 3 * MaximumPixelsPerLinePerDSCUnit) || NumberOfDSCSlices > 8)))))) {
-		if (TotalNumberOfActiveDPP + 4 <= MaxNumDPP) {
-			*ODMMode = dml2_odm_mode_combine_4to1;
-			*RequiredDISPCLKPerSurface = SurfaceRequiredDISPCLKWithODMCombineFourToOne;
-			*NumberOfDPP = 4;
-		} else {
-			*TotalAvailablePipesSupport = false;
-		}
-	} else if (ODMUse == dml2_odm_mode_combine_3to1 || (ODMUse == dml2_odm_mode_auto &&
-		((SurfaceRequiredDISPCLKWithODMCombineTwoToOne > MaxDispclk && SurfaceRequiredDISPCLKWithODMCombineThreeToOne <= MaxDispclk) ||
-			(DSCEnable && ((NumberOfDSCSlices % 3 == 0) && (HActive > 2 * MaximumPixelsPerLinePerDSCUnit)))))) {
-		if (TotalNumberOfActiveDPP + 3 <= MaxNumDPP) {
-			*ODMMode = dml2_odm_mode_combine_3to1;
-			*RequiredDISPCLKPerSurface = SurfaceRequiredDISPCLKWithODMCombineThreeToOne;
-			*NumberOfDPP = 3;
-		} else {
-			*TotalAvailablePipesSupport = false;
-		}
-
-	} else if (ODMUse == dml2_odm_mode_combine_2to1 || (ODMUse == dml2_odm_mode_auto &&
-		((SurfaceRequiredDISPCLKWithoutODMCombine > MaxDispclk && SurfaceRequiredDISPCLKWithODMCombineTwoToOne <= MaxDispclk) ||
-			(DSCEnable && ((NumberOfDSCSlices % 2 == 0) && ((HActive > MaximumPixelsPerLinePerDSCUnit) || (NumberOfDSCSlices > 4 && NumberOfDSCSlices <= 8))))))) {
-		if (TotalNumberOfActiveDPP + 2 <= MaxNumDPP) {
-			*ODMMode = dml2_odm_mode_combine_2to1;
-			*RequiredDISPCLKPerSurface = SurfaceRequiredDISPCLKWithODMCombineTwoToOne;
-			*NumberOfDPP = 2;
-		} else {
-			*TotalAvailablePipesSupport = false;
-		}
-
-	} else {
-		if (TotalNumberOfActiveDPP + 1 <= MaxNumDPP) {
-			*NumberOfDPP = 1;
-		} else {
-			*TotalAvailablePipesSupport = false;
-		}
-	}
+	if (ODMUse == dml2_odm_mode_auto)
+		DecidedODMMode = DecideODMMode(HActive,
+				MaxDispclk,
+				MaximumPixelsPerLinePerDSCUnit,
+				OutFormat,
+				UseDSC,
+				NumberOfDSCSlices,
+				SurfaceRequiredDISPCLKWithoutODMCombine,
+				SurfaceRequiredDISPCLKWithODMCombineTwoToOne,
+				SurfaceRequiredDISPCLKWithODMCombineThreeToOne,
+				SurfaceRequiredDISPCLKWithODMCombineFourToOne);
+	else
+		DecidedODMMode = ODMUse;
+	CalculateODMConstraints(DecidedODMMode,
+			SurfaceRequiredDISPCLKWithoutODMCombine,
+			SurfaceRequiredDISPCLKWithODMCombineTwoToOne,
+			SurfaceRequiredDISPCLKWithODMCombineThreeToOne,
+			SurfaceRequiredDISPCLKWithODMCombineFourToOne,
+			MaximumPixelsPerLinePerDSCUnit,
+			&DISPCLKRequired,
+			&NumberOfDPPRequired,
+			&MaxHActiveForDSC,
+			&MaxDSCSlices,
+			&MaxHActiveFor420);
+	success = ValidateODMMode(DecidedODMMode,
+			MaxDispclk,
+			HActive,
+			OutFormat,
+			UseDSC,
+			NumberOfDSCSlices,
+			TotalNumberOfActiveDPP,
+			MaxNumDPP,
+			DISPCLKRequired,
+			NumberOfDPPRequired,
+			MaxHActiveForDSC,
+			MaxDSCSlices,
+			MaxHActiveFor420);
+
+	*ODMMode = DecidedODMMode;
+	*TotalAvailablePipesSupport = success;
+	*NumberOfDPP = NumberOfDPPRequired;
+	*RequiredDISPCLKPerSurface = success ? DISPCLKRequired : 0;
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: ODMMode = %d\n", __func__, *ODMMode);
 	dml2_printf("DML::%s: NumberOfDPP = %d\n", __func__, *NumberOfDPP);
 	dml2_printf("DML::%s: TotalAvailablePipesSupport = %d\n", __func__, *TotalAvailablePipesSupport);
 	dml2_printf("DML::%s: RequiredDISPCLKPerSurface = %f\n", __func__, *RequiredDISPCLKPerSurface);
 #endif
-
 }
 
 static void CalculateOutputLink(
@@ -3986,7 +4128,6 @@ static void CalculateOutputLink(
 	double PHYCLKD18,
 	double PHYCLKD32,
 	double Downspreading,
-	bool IsMainSurfaceUsingTheIndicatedTiming,
 	enum dml2_output_encoder_class Output,
 	enum dml2_output_format_class OutputFormat,
 	unsigned int HTotal,
@@ -4022,7 +4163,6 @@ static void CalculateOutputLink(
 
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: DSCEnable = %u (dis, en, en_if_necessary)\n", __func__, DSCEnable);
-	dml2_printf("DML::%s: IsMainSurfaceUsingTheIndicatedTiming = %u\n", __func__, IsMainSurfaceUsingTheIndicatedTiming);
 	dml2_printf("DML::%s: PHYCLK = %f\n", __func__, PHYCLK);
 	dml2_printf("DML::%s: PixelClockBackEnd = %f\n", __func__, PixelClockBackEnd);
 	dml2_printf("DML::%s: AudioSampleRate = %f\n", __func__, AudioSampleRate);
@@ -4034,7 +4174,7 @@ static void CalculateOutputLink(
 	dml2_printf("DML::%s: Output (encoder) = %u\n", __func__, Output);
 	dml2_printf("DML::%s: OutputLinkDPRate = %u\n", __func__, OutputLinkDPRate);
 #endif
-	if (IsMainSurfaceUsingTheIndicatedTiming) {
+	{
 		if (Output == dml2_hdmi) {
 			*RequiresDSC = false;
 			*RequiresFEC = false;
@@ -4469,9 +4609,9 @@ static void calculate_tdlut_setting(
 
 	if (p->tdlut_addressing_mode == dml2_tdlut_simple_linear) {
 		if (p->tdlut_width_mode == dml2_tdlut_width_17_cube)
-		    tdlut_width = 4916;
+			tdlut_width = 4916;
 		else
-		    tdlut_width = 35940;
+			tdlut_width = 35940;
 	} else {
 		if (p->tdlut_width_mode == dml2_tdlut_width_17_cube)
 			tdlut_width = 17;
@@ -4562,7 +4702,7 @@ static void CalculateTarb(
 {
 	double extra_bytes = 0;
 	double extra_bytes_prefetch = 0;
-	double HostVMDynamicLevels = CalculateHostVMDynamicLevels(display_cfg->gpuvm_enable, display_cfg->hostvm_enable, HostVMMinPageSize, display_cfg->hostvm_max_page_table_levels);
+	double HostVMDynamicLevels = CalculateHostVMDynamicLevels(display_cfg->gpuvm_enable, display_cfg->hostvm_enable, HostVMMinPageSize, display_cfg->hostvm_max_non_cached_page_table_levels);
 
 	for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
 		extra_bytes = extra_bytes + (NumberOfDPP[k] * PixelChunkSizeInKByte * 1024);
@@ -4674,6 +4814,7 @@ static double get_urgent_bandwidth_required(
 	enum dml2_core_internal_soc_state_type state_type,
 	enum dml2_core_internal_bw_type bw_type,
 	bool inc_flip_bw, // including flip bw
+	bool use_qual_row_bw,
 	unsigned int NumberOfActiveSurfaces,
 	unsigned int NumberOfDPP[],
 	double dcc_dram_bw_nom_overhead_factor_p0[],
@@ -4686,6 +4827,8 @@ static double get_urgent_bandwidth_required(
 	double ReadBandwidthChroma[],
 	double PrefetchBandwidthLuma[],
 	double PrefetchBandwidthChroma[],
+	double excess_vactive_fill_bw_l[],
+	double excess_vactive_fill_bw_c[],
 	double cursor_bw[],
 	double dpte_row_bw[],
 	double meta_row_bw[],
@@ -4697,8 +4840,14 @@ static double get_urgent_bandwidth_required(
 	double UrgentBurstFactorCursor[],
 	double UrgentBurstFactorLumaPre[],
 	double UrgentBurstFactorChromaPre[],
-	double UrgentBurstFactorCursorPre[])
+	double UrgentBurstFactorCursorPre[],
+	/* outputs */
+	double surface_required_bw[],
+	double surface_peak_required_bw[])
 {
+	// set inc_flip_bw = 0 for total_dchub_urgent_read_bw_noflip calculation, 1 for total_dchub_urgent_read_bw as described in the MAS
+	// set use_qual_row_bw = 1 to calculate using qualified row bandwidth, used for total_flip_bw calculation
+
 	memset(l, 0, sizeof(struct dml2_core_shared_get_urgent_bandwidth_required_locals));
 
 	for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
@@ -4722,19 +4871,35 @@ static double get_urgent_bandwidth_required(
 		if (state_type != dml2_core_internal_soc_state_svp_prefetch && is_phantom)
 			exclude_this_plane = 1;
 
-		if (display_cfg->plane_descriptors[k].immediate_flip == false || !inc_flip_bw)
-			l->per_plane_flip_bw[k] = NumberOfDPP[k] * (dpte_row_bw[k] + meta_row_bw[k]);
-		else
-			l->per_plane_flip_bw[k] = NumberOfDPP[k] * flip_bw[k];
-
+		// The qualified row bandwidth, qual_row_bw, accounts for the regular non-flip row bandwidth when there is no possible immediate flip or HostVM invalidation flip.
+		// The qual_row_bw is zero if HostVM is possible and only non-zero and equal to row_bw(i) if immediate flip is not allowed for that pipe.
+		if (use_qual_row_bw) {
+			if (display_cfg->hostvm_enable)
+				l->per_plane_flip_bw[k] = 0; // qual_row_bw
+			else if (!display_cfg->plane_descriptors[k].immediate_flip)
+				l->per_plane_flip_bw[k] = NumberOfDPP[k] * (dpte_row_bw[k] + meta_row_bw[k]);
+		} else {
+			// the final_flip_bw includes the regular row_bw when immediate flip is disallowed (and no HostVM)
+			if ((!display_cfg->plane_descriptors[k].immediate_flip && !display_cfg->hostvm_enable) || !inc_flip_bw)
+				l->per_plane_flip_bw[k] = NumberOfDPP[k] * (dpte_row_bw[k] + meta_row_bw[k]);
+			else
+				l->per_plane_flip_bw[k] = NumberOfDPP[k] * flip_bw[k];
+		}
 
 		if (!exclude_this_plane) {
-			l->required_bandwidth_mbps = l->required_bandwidth_mbps +
-				math_max3(NumberOfDPP[k] * prefetch_vmrow_bw[k],
+			surface_required_bw[k] = math_max4(NumberOfDPP[k] * prefetch_vmrow_bw[k],
 					l->per_plane_flip_bw[k] + ReadBandwidthLuma[k] * l->adj_factor_p0 + ReadBandwidthChroma[k] * l->adj_factor_p1 + cursor_bw[k] * l->adj_factor_cur,
-					l->per_plane_flip_bw[k] + NumberOfDPP[k] * (PrefetchBandwidthLuma[k] * l->adj_factor_p0_pre + PrefetchBandwidthChroma[k] * l->adj_factor_p1_pre) + prefetch_cursor_bw[k] * l->adj_factor_cur_pre);
+					l->per_plane_flip_bw[k] + NumberOfDPP[k] * (PrefetchBandwidthLuma[k] * l->adj_factor_p0_pre + PrefetchBandwidthChroma[k] * l->adj_factor_p1_pre) + prefetch_cursor_bw[k] * l->adj_factor_cur_pre,
+					(ReadBandwidthLuma[k] + excess_vactive_fill_bw_l[k]) * l->tmp_nom_adj_factor_p0 + (ReadBandwidthChroma[k] + excess_vactive_fill_bw_c[k]) * l->tmp_nom_adj_factor_p1 + dpte_row_bw[k] + meta_row_bw[k]);
+
+			/* export peak required bandwidth for the surface */
+			surface_peak_required_bw[k] = math_max2(surface_required_bw[k], surface_peak_required_bw[k]);
+		} else {
+			surface_required_bw[k] = 0.0;
 		}
 
+		l->required_bandwidth_mbps += surface_required_bw[k];
+
 #ifdef __DML_VBA_DEBUG__
 		dml2_printf("DML::%s: k=%d, NumberOfDPP=%d\n", __func__, k, NumberOfDPP[k]);
 		dml2_printf("DML::%s: k=%d, mall_svp_prefetch_factor=%f\n", __func__, k, l->mall_svp_prefetch_factor);
@@ -4911,7 +5076,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->TWait_p = p->TWait - p->Ttrip; // TWait includes max(Turg, Ttrip) and Ttrip here is already max(Turg, Ttrip)
 
 	if (p->display_cfg->gpuvm_enable == true && p->display_cfg->hostvm_enable == true) {
-		s->HostVMDynamicLevelsTrips = p->display_cfg->hostvm_max_page_table_levels;
+		s->HostVMDynamicLevelsTrips = p->display_cfg->hostvm_max_non_cached_page_table_levels;
 	} else {
 		s->HostVMDynamicLevelsTrips = 0;
 	}
@@ -5566,7 +5731,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
 		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
 		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
-		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
+		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
 		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
 		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
 		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
@@ -5647,39 +5812,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 
 static void calculate_peak_bandwidth_required(
 	struct dml2_core_internal_scratch *s,
-
-	// output
-	double urg_vactive_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max],
-	double urg_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max],
-	double non_urg_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max],
-
-	// input
-	const struct dml2_display_cfg *display_cfg,
-	bool inc_flip_bw,
-	unsigned int NumberOfActiveSurfaces,
-	unsigned int NumberOfDPP[],
-	double dcc_dram_bw_nom_overhead_factor_p0[],
-	double dcc_dram_bw_nom_overhead_factor_p1[],
-	double dcc_dram_bw_pref_overhead_factor_p0[],
-	double dcc_dram_bw_pref_overhead_factor_p1[],
-	double mall_prefetch_sdp_overhead_factor[],
-	double mall_prefetch_dram_overhead_factor[],
-	double ReadBandwidthLuma[],
-	double ReadBandwidthChroma[],
-	double PrefetchBandwidthLuma[],
-	double PrefetchBandwidthChroma[],
-	double cursor_bw[],
-	double dpte_row_bw[],
-	double meta_row_bw[],
-	double prefetch_cursor_bw[],
-	double prefetch_vmrow_bw[],
-	double flip_bw[],
-	double UrgentBurstFactorLuma[],
-	double UrgentBurstFactorChroma[],
-	double UrgentBurstFactorCursor[],
-	double UrgentBurstFactorLumaPre[],
-	double UrgentBurstFactorChromaPre[],
-	double UrgentBurstFactorCursorPre[])
+	struct dml2_core_calcs_calculate_peak_bandwidth_required_params *p)
 {
 	unsigned int n;
 	unsigned int m;
@@ -5689,117 +5822,204 @@ static void calculate_peak_bandwidth_required(
 	memset(l, 0, sizeof(struct dml2_core_shared_calculate_peak_bandwidth_required_locals));
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: inc_flip_bw = %d\n", __func__, inc_flip_bw);
-	dml2_printf("DML::%s: NumberOfActiveSurfaces = %d\n", __func__, NumberOfActiveSurfaces);
+	dml2_printf("DML::%s: inc_flip_bw = %d\n", __func__, p->inc_flip_bw);
+	dml2_printf("DML::%s: NumberOfActiveSurfaces = %d\n", __func__, p->num_active_planes);
 #endif
 
-	for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
+	for (unsigned int k = 0; k < p->num_active_planes; ++k) {
 		l->unity_array[k] = 1.0;
 		l->zero_array[k] = 0.0;
 	}
 
 	for (m = 0; m < dml2_core_internal_soc_state_max; m++) {
 		for (n = 0; n < dml2_core_internal_bw_max; n++) {
-			urg_vactive_bandwidth_required[m][n] = get_urgent_bandwidth_required(
+			get_urgent_bandwidth_required(
 				&s->get_urgent_bandwidth_required_locals,
-				display_cfg,
+				p->display_cfg,
 				m,
 				n,
 				0, //inc_flip_bw,
-				NumberOfActiveSurfaces,
-				NumberOfDPP,
-				dcc_dram_bw_nom_overhead_factor_p0,
-				dcc_dram_bw_nom_overhead_factor_p1,
-				dcc_dram_bw_pref_overhead_factor_p0,
-				dcc_dram_bw_pref_overhead_factor_p1,
-				mall_prefetch_sdp_overhead_factor,
-				mall_prefetch_dram_overhead_factor,
-				ReadBandwidthLuma,
-				ReadBandwidthChroma,
+				0, //use_qual_row_bw
+				p->num_active_planes,
+				p->num_of_dpp,
+				p->dcc_dram_bw_nom_overhead_factor_p0,
+				p->dcc_dram_bw_nom_overhead_factor_p1,
+				p->dcc_dram_bw_pref_overhead_factor_p0,
+				p->dcc_dram_bw_pref_overhead_factor_p1,
+				p->mall_prefetch_sdp_overhead_factor,
+				p->mall_prefetch_dram_overhead_factor,
+				p->surface_read_bandwidth_l,
+				p->surface_read_bandwidth_c,
 				l->zero_array, //PrefetchBandwidthLuma,
 				l->zero_array, //PrefetchBandwidthChroma,
-				cursor_bw,
-				dpte_row_bw,
-				meta_row_bw,
+				l->zero_array,
+				l->zero_array,
+				l->zero_array,
+				p->dpte_row_bw,
+				p->meta_row_bw,
 				l->zero_array, //prefetch_cursor_bw,
 				l->zero_array, //prefetch_vmrow_bw,
 				l->zero_array, //flip_bw,
-				UrgentBurstFactorLuma,
-				UrgentBurstFactorChroma,
-				UrgentBurstFactorCursor,
-				UrgentBurstFactorLumaPre,
-				UrgentBurstFactorChromaPre,
-				UrgentBurstFactorCursorPre);
-
-
-			urg_bandwidth_required[m][n] = get_urgent_bandwidth_required(
+				l->zero_array,
+				l->zero_array,
+				l->zero_array,
+				l->zero_array,
+				l->zero_array,
+				l->zero_array,
+				p->surface_avg_vactive_required_bw[m][n],
+				p->surface_peak_required_bw[m][n]);
+
+			p->urg_vactive_bandwidth_required[m][n] = get_urgent_bandwidth_required(
 				&s->get_urgent_bandwidth_required_locals,
-				display_cfg,
+				p->display_cfg,
+				m,
+				n,
+				0, //inc_flip_bw,
+				0, //use_qual_row_bw
+				p->num_active_planes,
+				p->num_of_dpp,
+				p->dcc_dram_bw_nom_overhead_factor_p0,
+				p->dcc_dram_bw_nom_overhead_factor_p1,
+				p->dcc_dram_bw_pref_overhead_factor_p0,
+				p->dcc_dram_bw_pref_overhead_factor_p1,
+				p->mall_prefetch_sdp_overhead_factor,
+				p->mall_prefetch_dram_overhead_factor,
+				p->surface_read_bandwidth_l,
+				p->surface_read_bandwidth_c,
+				l->zero_array, //PrefetchBandwidthLuma,
+				l->zero_array, //PrefetchBandwidthChroma,
+				p->excess_vactive_fill_bw_l,
+				p->excess_vactive_fill_bw_c,
+				p->cursor_bw,
+				p->dpte_row_bw,
+				p->meta_row_bw,
+				l->zero_array, //prefetch_cursor_bw,
+				l->zero_array, //prefetch_vmrow_bw,
+				l->zero_array, //flip_bw,
+				p->urgent_burst_factor_l,
+				p->urgent_burst_factor_c,
+				p->urgent_burst_factor_cursor,
+				p->urgent_burst_factor_prefetch_l,
+				p->urgent_burst_factor_prefetch_c,
+				p->urgent_burst_factor_prefetch_cursor,
+				l->surface_dummy_bw,
+				p->surface_peak_required_bw[m][n]);
+
+			p->urg_bandwidth_required[m][n] = get_urgent_bandwidth_required(
+				&s->get_urgent_bandwidth_required_locals,
+				p->display_cfg,
 				m,
 				n,
-				inc_flip_bw,
-				NumberOfActiveSurfaces,
-				NumberOfDPP,
-				dcc_dram_bw_nom_overhead_factor_p0,
-				dcc_dram_bw_nom_overhead_factor_p1,
-				dcc_dram_bw_pref_overhead_factor_p0,
-				dcc_dram_bw_pref_overhead_factor_p1,
-				mall_prefetch_sdp_overhead_factor,
-				mall_prefetch_dram_overhead_factor,
-				ReadBandwidthLuma,
-				ReadBandwidthChroma,
-				PrefetchBandwidthLuma,
-				PrefetchBandwidthChroma,
-				cursor_bw,
-				dpte_row_bw,
-				meta_row_bw,
-				prefetch_cursor_bw,
-				prefetch_vmrow_bw,
-				flip_bw,
-				UrgentBurstFactorLuma,
-				UrgentBurstFactorChroma,
-				UrgentBurstFactorCursor,
-				UrgentBurstFactorLumaPre,
-				UrgentBurstFactorChromaPre,
-				UrgentBurstFactorCursorPre);
-
-			non_urg_bandwidth_required[m][n] = get_urgent_bandwidth_required(
+				p->inc_flip_bw,
+				0, //use_qual_row_bw
+				p->num_active_planes,
+				p->num_of_dpp,
+				p->dcc_dram_bw_nom_overhead_factor_p0,
+				p->dcc_dram_bw_nom_overhead_factor_p1,
+				p->dcc_dram_bw_pref_overhead_factor_p0,
+				p->dcc_dram_bw_pref_overhead_factor_p1,
+				p->mall_prefetch_sdp_overhead_factor,
+				p->mall_prefetch_dram_overhead_factor,
+				p->surface_read_bandwidth_l,
+				p->surface_read_bandwidth_c,
+				p->prefetch_bandwidth_l,
+				p->prefetch_bandwidth_c,
+				p->excess_vactive_fill_bw_l,
+				p->excess_vactive_fill_bw_c,
+				p->cursor_bw,
+				p->dpte_row_bw,
+				p->meta_row_bw,
+				p->prefetch_cursor_bw,
+				p->prefetch_vmrow_bw,
+				p->flip_bw,
+				p->urgent_burst_factor_l,
+				p->urgent_burst_factor_c,
+				p->urgent_burst_factor_cursor,
+				p->urgent_burst_factor_prefetch_l,
+				p->urgent_burst_factor_prefetch_c,
+				p->urgent_burst_factor_prefetch_cursor,
+				l->surface_dummy_bw,
+				p->surface_peak_required_bw[m][n]);
+
+			p->urg_bandwidth_required_qual[m][n] = get_urgent_bandwidth_required(
 				&s->get_urgent_bandwidth_required_locals,
-				display_cfg,
+				p->display_cfg,
+				m,
+				n,
+				0, //inc_flip_bw
+				1, //use_qual_row_bw
+				p->num_active_planes,
+				p->num_of_dpp,
+				p->dcc_dram_bw_nom_overhead_factor_p0,
+				p->dcc_dram_bw_nom_overhead_factor_p1,
+				p->dcc_dram_bw_pref_overhead_factor_p0,
+				p->dcc_dram_bw_pref_overhead_factor_p1,
+				p->mall_prefetch_sdp_overhead_factor,
+				p->mall_prefetch_dram_overhead_factor,
+				p->surface_read_bandwidth_l,
+				p->surface_read_bandwidth_c,
+				p->prefetch_bandwidth_l,
+				p->prefetch_bandwidth_c,
+				p->excess_vactive_fill_bw_l,
+				p->excess_vactive_fill_bw_c,
+				p->cursor_bw,
+				p->dpte_row_bw,
+				p->meta_row_bw,
+				p->prefetch_cursor_bw,
+				p->prefetch_vmrow_bw,
+				p->flip_bw,
+				p->urgent_burst_factor_l,
+				p->urgent_burst_factor_c,
+				p->urgent_burst_factor_cursor,
+				p->urgent_burst_factor_prefetch_l,
+				p->urgent_burst_factor_prefetch_c,
+				p->urgent_burst_factor_prefetch_cursor,
+				l->surface_dummy_bw,
+				p->surface_peak_required_bw[m][n]);
+
+			p->non_urg_bandwidth_required[m][n] = get_urgent_bandwidth_required(
+				&s->get_urgent_bandwidth_required_locals,
+				p->display_cfg,
 				m,
 				n,
-				inc_flip_bw,
-				NumberOfActiveSurfaces,
-				NumberOfDPP,
-				dcc_dram_bw_nom_overhead_factor_p0,
-				dcc_dram_bw_nom_overhead_factor_p1,
-				dcc_dram_bw_pref_overhead_factor_p0,
-				dcc_dram_bw_pref_overhead_factor_p1,
-				mall_prefetch_sdp_overhead_factor,
-				mall_prefetch_dram_overhead_factor,
-				ReadBandwidthLuma,
-				ReadBandwidthChroma,
-				PrefetchBandwidthLuma,
-				PrefetchBandwidthChroma,
-				cursor_bw,
-				dpte_row_bw,
-				meta_row_bw,
-				prefetch_cursor_bw,
-				prefetch_vmrow_bw,
-				flip_bw,
+				p->inc_flip_bw,
+				0, //use_qual_row_bw
+				p->num_active_planes,
+				p->num_of_dpp,
+				p->dcc_dram_bw_nom_overhead_factor_p0,
+				p->dcc_dram_bw_nom_overhead_factor_p1,
+				p->dcc_dram_bw_pref_overhead_factor_p0,
+				p->dcc_dram_bw_pref_overhead_factor_p1,
+				p->mall_prefetch_sdp_overhead_factor,
+				p->mall_prefetch_dram_overhead_factor,
+				p->surface_read_bandwidth_l,
+				p->surface_read_bandwidth_c,
+				p->prefetch_bandwidth_l,
+				p->prefetch_bandwidth_c,
+				p->excess_vactive_fill_bw_l,
+				p->excess_vactive_fill_bw_c,
+				p->cursor_bw,
+				p->dpte_row_bw,
+				p->meta_row_bw,
+				p->prefetch_cursor_bw,
+				p->prefetch_vmrow_bw,
+				p->flip_bw,
+				l->unity_array,
 				l->unity_array,
 				l->unity_array,
 				l->unity_array,
 				l->unity_array,
 				l->unity_array,
-				l->unity_array);
+				l->surface_dummy_bw,
+				p->surface_peak_required_bw[m][n]);
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: urg_vactive_bandwidth_required%s[%s][%s]=%f\n", __func__, (inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), urg_vactive_bandwidth_required[m][n]);
-			dml2_printf("DML::%s: urg_bandwidth_required%s[%s][%s]=%f\n", __func__, (inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), urg_bandwidth_required[m][n]);
-			dml2_printf("DML::%s: non_urg_bandwidth_required%s[%s][%s]=%f\n", __func__, (inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), non_urg_bandwidth_required[m][n]);
+			dml2_printf("DML::%s: urg_vactive_bandwidth_required%s[%s][%s]=%f\n", __func__, (p->inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->urg_vactive_bandwidth_required[m][n]);
+			dml2_printf("DML::%s: urg_bandwidth_required%s[%s][%s]=%f\n", __func__, (p->inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->urg_bandwidth_required[m][n]);
+			dml2_printf("DML::%s: urg_bandwidth_required_qual[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->urg_bandwidth_required[m][n]);
+			dml2_printf("DML::%s: non_urg_bandwidth_required%s[%s][%s]=%f\n", __func__, (p->inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->non_urg_bandwidth_required[m][n]);
 #endif
-			dml2_assert(urg_bandwidth_required[m][n] >= non_urg_bandwidth_required[m][n]);
+			dml2_assert(p->urg_bandwidth_required[m][n] >= p->non_urg_bandwidth_required[m][n]);
 		}
 	}
 }
@@ -6251,7 +6471,6 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		double pixel_clock_mhz = p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000.0;
 		double v_ratio = p->display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
 		double v_ratio_c = p->display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio;
-
 		s->TotalPixelBW = s->TotalPixelBW + p->DPPPerSurface[k]
 			* (p->SwathWidthY[k] * p->BytePerPixelDETY[k] * v_ratio + p->SwathWidthC[k] * p->BytePerPixelDETC[k] * v_ratio_c) / (h_total / pixel_clock_mhz);
 	}
@@ -6433,6 +6652,125 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 #endif
 }
 
+static void calculate_bytes_to_fetch_required_to_hide_latency(
+		struct dml2_core_calcs_calculate_bytes_to_fetch_required_to_hide_latency_params *p)
+{
+	unsigned int dst_lines_to_hide;
+	unsigned int src_lines_to_hide_l;
+	unsigned int src_lines_to_hide_c;
+	unsigned int plane_index;
+	unsigned int stream_index;
+
+	for (plane_index = 0; plane_index < p->num_active_planes; plane_index++) {
+		if (dml_is_phantom_pipe(&p->display_cfg->plane_descriptors[plane_index]))
+			continue;
+
+		stream_index = p->display_cfg->plane_descriptors[plane_index].stream_index;
+
+		dst_lines_to_hide = (unsigned int)math_ceil(p->latency_to_hide_us /
+			((double)p->display_cfg->stream_descriptors[stream_index].timing.h_total /
+				(double)p->display_cfg->stream_descriptors[stream_index].timing.pixel_clock_khz * 1000.0));
+
+		src_lines_to_hide_l = (unsigned int)math_ceil2(p->display_cfg->plane_descriptors[plane_index].composition.scaler_info.plane0.v_ratio * dst_lines_to_hide,
+			p->swath_height_l[plane_index]);
+		p->bytes_required_l[plane_index] = src_lines_to_hide_l * p->num_of_dpp[plane_index] * p->swath_width_l[plane_index] * p->byte_per_pix_l[plane_index];
+
+		src_lines_to_hide_c = (unsigned int)math_ceil2(p->display_cfg->plane_descriptors[plane_index].composition.scaler_info.plane1.v_ratio * dst_lines_to_hide,
+			p->swath_height_c[plane_index]);
+		p->bytes_required_c[plane_index] = src_lines_to_hide_c * p->num_of_dpp[plane_index] * p->swath_width_c[plane_index] * p->byte_per_pix_c[plane_index];
+
+		if (p->display_cfg->plane_descriptors[plane_index].surface.dcc.enable && p->mrq_present) {
+			p->bytes_required_l[plane_index] += (unsigned int)math_ceil((double)src_lines_to_hide_l / p->meta_row_height_l[plane_index]) * p->meta_row_bytes_per_row_ub_l[plane_index];
+			if (p->meta_row_height_c[plane_index]) {
+				p->bytes_required_c[plane_index] += (unsigned int)math_ceil((double)src_lines_to_hide_c / p->meta_row_height_c[plane_index]) * p->meta_row_bytes_per_row_ub_c[plane_index];
+			}
+		}
+
+		if (p->display_cfg->gpuvm_enable == true) {
+			p->bytes_required_l[plane_index] += (unsigned int)math_ceil((double)src_lines_to_hide_l / p->dpte_row_height_l[plane_index]) * p->dpte_bytes_per_row_l[plane_index];
+			if (p->dpte_row_height_c[plane_index]) {
+				p->bytes_required_c[plane_index] += (unsigned int)math_ceil((double)src_lines_to_hide_c / p->dpte_row_height_c[plane_index]) * p->dpte_bytes_per_row_c[plane_index];
+			}
+		}
+	}
+}
+
+static void calculate_vactive_det_fill_latency(
+		const struct dml2_display_cfg *display_cfg,
+		unsigned int num_active_planes,
+		unsigned int bytes_required_l[],
+		unsigned int bytes_required_c[],
+		double dcc_dram_bw_nom_overhead_factor_p0[],
+		double dcc_dram_bw_nom_overhead_factor_p1[],
+		double surface_read_bw_l[],
+		double surface_read_bw_c[],
+		double (*surface_avg_vactive_required_bw)[dml2_core_internal_bw_max][DML2_MAX_PLANES],
+		double (*surface_peak_required_bw)[dml2_core_internal_bw_max][DML2_MAX_PLANES],
+		/* output */
+		double vactive_det_fill_delay_us[])
+{
+	double effective_excess_bandwidth;
+	double effective_excess_bandwidth_l;
+	double effective_excess_bandwidth_c;
+	double adj_factor;
+	unsigned int plane_index;
+	unsigned int soc_state;
+	unsigned int bw_type;
+
+	for (plane_index = 0; plane_index < num_active_planes; plane_index++) {
+		if (dml_is_phantom_pipe(&display_cfg->plane_descriptors[plane_index]))
+			continue;
+
+		vactive_det_fill_delay_us[plane_index] = 0.0;
+		for (soc_state = 0; soc_state < dml2_core_internal_soc_state_max; soc_state++) {
+			for (bw_type = 0; bw_type < dml2_core_internal_bw_max; bw_type++) {
+				effective_excess_bandwidth = (surface_peak_required_bw[soc_state][bw_type][plane_index] - surface_avg_vactive_required_bw[soc_state][bw_type][plane_index]);
+
+				/* luma */
+				adj_factor = bw_type == dml2_core_internal_bw_dram ? dcc_dram_bw_nom_overhead_factor_p0[plane_index] : 1.0;
+
+				effective_excess_bandwidth_l = effective_excess_bandwidth * surface_read_bw_l[plane_index] / (surface_read_bw_l[plane_index] + surface_read_bw_c[plane_index]) / adj_factor;
+				if (effective_excess_bandwidth_l > 0.0) {
+					vactive_det_fill_delay_us[plane_index] = math_max2(vactive_det_fill_delay_us[plane_index], bytes_required_l[plane_index] / effective_excess_bandwidth_l);
+				}
+
+				/* chroma */
+				adj_factor = bw_type == dml2_core_internal_bw_dram ? dcc_dram_bw_nom_overhead_factor_p1[plane_index] : 1.0;
+
+				effective_excess_bandwidth_c = effective_excess_bandwidth * surface_read_bw_c[plane_index] / (surface_read_bw_l[plane_index] + surface_read_bw_c[plane_index]) / adj_factor;
+				if (effective_excess_bandwidth_c > 0.0) {
+					vactive_det_fill_delay_us[plane_index] = math_max2(vactive_det_fill_delay_us[plane_index], bytes_required_c[plane_index] / effective_excess_bandwidth_c);
+				}
+			}
+		}
+	}
+}
+
+static void calculate_excess_vactive_bandwidth_required(
+	const struct dml2_display_cfg *display_cfg,
+	unsigned int num_active_planes,
+	unsigned int bytes_required_l[],
+	unsigned int bytes_required_c[],
+	/* outputs */
+	double excess_vactive_fill_bw_l[],
+	double excess_vactive_fill_bw_c[])
+{
+	unsigned int plane_index;
+
+	for (plane_index = 0; plane_index < num_active_planes; plane_index++) {
+		if (dml_is_phantom_pipe(&display_cfg->plane_descriptors[plane_index]))
+			continue;
+
+		excess_vactive_fill_bw_l[plane_index] = 0.0;
+		excess_vactive_fill_bw_c[plane_index] = 0.0;
+
+		if (display_cfg->plane_descriptors[plane_index].overrides.max_vactive_det_fill_delay_us > 0) {
+			excess_vactive_fill_bw_l[plane_index] = (double)bytes_required_l[plane_index] / (double)display_cfg->plane_descriptors[plane_index].overrides.max_vactive_det_fill_delay_us;
+			excess_vactive_fill_bw_c[plane_index] = (double)bytes_required_c[plane_index] / (double)display_cfg->plane_descriptors[plane_index].overrides.max_vactive_det_fill_delay_us;
+		}
+	}
+}
+
 static double uclk_khz_to_dram_bw_mbps(unsigned long uclk_khz, const struct dml2_dram_params *dram_config)
 {
 	double bw_mbps = 0;
@@ -6540,6 +6878,78 @@ static void calculate_hostvm_inefficiency_factor(
 		}
 }
 
+struct dml2_core_internal_g6_temp_read_blackouts_table {
+	struct {
+		unsigned int uclk_khz;
+		unsigned int blackout_us;
+	} entries[DML_MAX_CLK_TABLE_SIZE];
+};
+
+struct dml2_core_internal_g6_temp_read_blackouts_table core_dcn4_g6_temp_read_blackout_table = {
+	.entries = {
+		{
+			.uclk_khz = 96000,
+			.blackout_us = 23,
+		},
+		{
+			.uclk_khz = 435000,
+			.blackout_us = 10,
+		},
+		{
+			.uclk_khz = 521000,
+			.blackout_us = 10,
+		},
+		{
+			.uclk_khz = 731000,
+			.blackout_us = 8,
+		},
+		{
+			.uclk_khz = 822000,
+			.blackout_us = 8,
+		},
+		{
+			.uclk_khz = 962000,
+			.blackout_us = 5,
+		},
+		{
+			.uclk_khz = 1069000,
+			.blackout_us = 5,
+		},
+		{
+			.uclk_khz = 1187000,
+			.blackout_us = 5,
+		},
+	},
+};
+
+static double get_g6_temp_read_blackout_us(
+	struct dml2_soc_bb *soc,
+	unsigned int uclk_freq_khz,
+	unsigned int min_clk_index)
+{
+	unsigned int i;
+	unsigned int blackout_us = core_dcn4_g6_temp_read_blackout_table.entries[0].blackout_us;
+
+	if (soc->power_management_parameters.g6_temp_read_blackout_us[0] > 0.0) {
+		/* overrides are present in the SoC BB */
+		return soc->power_management_parameters.g6_temp_read_blackout_us[min_clk_index];
+	}
+
+	/* use internal table */
+	blackout_us = core_dcn4_g6_temp_read_blackout_table.entries[0].blackout_us;
+
+	for (i = 0; i < DML_MAX_CLK_TABLE_SIZE; i++) {
+		if (uclk_freq_khz < core_dcn4_g6_temp_read_blackout_table.entries[i].uclk_khz ||
+			core_dcn4_g6_temp_read_blackout_table.entries[i].uclk_khz == 0) {
+			break;
+		}
+
+		blackout_us = core_dcn4_g6_temp_read_blackout_table.entries[i].blackout_us;
+	}
+
+	return (double)blackout_us;
+}
+
 static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out_params)
 {
 	struct dml2_core_internal_display_mode_lib *mode_lib = in_out_params->mode_lib;
@@ -6560,6 +6970,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	struct dml2_core_calcs_CalculatePrefetchSchedule_params *CalculatePrefetchSchedule_params = &mode_lib->scratch.CalculatePrefetchSchedule_params;
 	struct dml2_core_calcs_calculate_tdlut_setting_params *calculate_tdlut_setting_params = &mode_lib->scratch.calculate_tdlut_setting_params;
 	struct dml2_core_calcs_calculate_mcache_setting_params *calculate_mcache_setting_params = &mode_lib->scratch.calculate_mcache_setting_params;
+	struct dml2_core_calcs_calculate_peak_bandwidth_required_params *calculate_peak_bandwidth_params = &mode_lib->scratch.calculate_peak_bandwidth_params;
+	struct dml2_core_calcs_calculate_bytes_to_fetch_required_to_hide_latency_params *calculate_bytes_to_fetch_required_to_hide_latency_params = &mode_lib->scratch.calculate_bytes_to_fetch_required_to_hide_latency_params;
 	unsigned int k, m, n;
 
 	memset(&mode_lib->scratch, 0, sizeof(struct dml2_core_internal_scratch));
@@ -6659,6 +7071,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			mode_lib->ms.support.ScaleRatioAndTapsSupport = false;
 		}
 	}
+
 	/*Source Format, Pixel Format and Scan Support Check*/
 	mode_lib->ms.support.SourceFormatPixelAndScanSupport = true;
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
@@ -6720,7 +7133,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	}
 
 	// Writeback bandwidth
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+	for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format == dml2_444_64) {
 			mode_lib->ms.WriteBandwidth[k] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height
 				* display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width
@@ -6747,19 +7160,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		}
 	}
 
-	/* Writeback Mode Support Check */
-	s->TotalNumberOfActiveWriteback = 0;
-	for (k = 0; k <= (unsigned int)mode_lib->ms.num_active_planes - 1; k++) {
-		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true
-			&& (display_cfg->plane_descriptors[k].stream_index == k)) {
-			s->TotalNumberOfActiveWriteback = s->TotalNumberOfActiveWriteback + 1;
-		}
-	}
-
-	mode_lib->ms.support.EnoughWritebackUnits = 1;
-	if (s->TotalNumberOfActiveWriteback > (unsigned int)mode_lib->ip.max_num_wb) {
-		mode_lib->ms.support.EnoughWritebackUnits = false;
-	}
 
 	/* Writeback Scale Ratio and Taps Support Check */
 	mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = true;
@@ -6823,16 +7223,38 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		} else {
 			s->MaximumSwathWidthSupportChroma = s->MaximumSwathWidthSupportLuma;
 		}
-		mode_lib->ms.MaximumSwathWidthInLineBufferLuma = mode_lib->ip.line_buffer_size_bits * math_max2(display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio, 1.0) / 57 /*FIXME_STAGE2 was: LBBitPerPixel*/ /
+
+		unsigned lb_buffer_size_bits_luma = mode_lib->ip.line_buffer_size_bits;
+		unsigned lb_buffer_size_bits_chroma = mode_lib->ip.line_buffer_size_bits;
+
+/*
+#if defined(DV_BUILD)
+		// Assume a memory config setting of 3 in 420 mode or get a new ip parameter that reflects the programming.
+		if (mode_lib->ms.BytePerPixelC[k] != 0.0 && display_cfg->plane_descriptors[k].pixel_format != dml2_rgbe_alpha) {
+			lb_buffer_size_bits_luma = 34620 * 57;;
+			lb_buffer_size_bits_chroma = 13560 * 57;
+		}
+#endif
+*/
+		mode_lib->ms.MaximumSwathWidthInLineBufferLuma = lb_buffer_size_bits_luma * math_max2(display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio, 1.0) / 57 /*FIXME_STAGE2 was: LBBitPerPixel*/ /
 			(display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_taps + math_max2(math_ceil2(display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio, 1.0) - 2, 0.0));
 		if (mode_lib->ms.BytePerPixelC[k] == 0.0) {
 			mode_lib->ms.MaximumSwathWidthInLineBufferChroma = 0;
 		} else {
-			mode_lib->ms.MaximumSwathWidthInLineBufferChroma = mode_lib->ip.line_buffer_size_bits * math_max2(display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio, 1.0) / 57 /*FIXME_STAGE2 was: LBBitPerPixel*/ /
+			mode_lib->ms.MaximumSwathWidthInLineBufferChroma = lb_buffer_size_bits_chroma * math_max2(display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio, 1.0) / 57 /*FIXME_STAGE2 was: LBBitPerPixel*/ /
 				(display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_taps + math_max2(math_ceil2(display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio, 1.0) - 2, 0.0));
 		}
+
 		mode_lib->ms.MaximumSwathWidthLuma[k] = math_min2(s->MaximumSwathWidthSupportLuma, mode_lib->ms.MaximumSwathWidthInLineBufferLuma);
 		mode_lib->ms.MaximumSwathWidthChroma[k] = math_min2(s->MaximumSwathWidthSupportChroma, mode_lib->ms.MaximumSwathWidthInLineBufferChroma);
+
+		dml2_printf("DML::%s: k=%u MaximumSwathWidthLuma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthLuma[k]);
+		dml2_printf("DML::%s: k=%u MaximumSwathWidthSupportLuma=%u\n", __func__, k, s->MaximumSwathWidthSupportLuma);
+		dml2_printf("DML::%s: k=%u MaximumSwathWidthInLineBufferLuma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthInLineBufferLuma);
+
+		dml2_printf("DML::%s: k=%u MaximumSwathWidthChroma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthChroma[k]);
+		dml2_printf("DML::%s: k=%u MaximumSwathWidthSupportChroma=%u\n", __func__, k, s->MaximumSwathWidthSupportChroma);
+		dml2_printf("DML::%s: k=%u MaximumSwathWidthInLineBufferChroma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthInLineBufferChroma);
 	}
 
 	/* Cursor Support Check */
@@ -6978,243 +7400,279 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	// This calls is just to find out if there is enough DET space to support full vp in 1 pipe.
 	CalculateSwathAndDETConfiguration(&mode_lib->scratch, CalculateSwathAndDETConfiguration_params);
 
-	{
-		mode_lib->ms.TotalNumberOfActiveDPP = 0;
-		mode_lib->ms.support.TotalAvailablePipesSupport = true;
-
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			CalculateODMMode(
-				mode_lib->ip.maximum_pixels_per_line_per_dsc_unit,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].overrides.odm_mode,
-				mode_lib->ms.max_dispclk_freq_mhz,
-				false, // DSCEnable
-				mode_lib->ms.TotalNumberOfActiveDPP,
-				mode_lib->ip.max_num_dpp,
-				((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
-				mode_lib->ms.support.NumberOfDSCSlices[k],
-
-				/* Output */
-				&s->TotalAvailablePipesSupportNoDSC,
-				&s->NumberOfDPPNoDSC,
-				&s->ODMModeNoDSC,
-				&s->RequiredDISPCLKPerSurfaceNoDSC);
-
-			CalculateODMMode(
-				mode_lib->ip.maximum_pixels_per_line_per_dsc_unit,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].overrides.odm_mode,
-				mode_lib->ms.max_dispclk_freq_mhz,
-				true, // DSCEnable
-				mode_lib->ms.TotalNumberOfActiveDPP,
-				mode_lib->ip.max_num_dpp,
-				((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
-				mode_lib->ms.support.NumberOfDSCSlices[k],
+	mode_lib->ms.TotalNumberOfActiveDPP = 0;
+	mode_lib->ms.support.TotalAvailablePipesSupport = true;
 
-				/* Output */
-				&s->TotalAvailablePipesSupportDSC,
-				&s->NumberOfDPPDSC,
-				&s->ODMModeDSC,
-				&s->RequiredDISPCLKPerSurfaceDSC);
-
-			/*Number Of DSC Slices*/
-			if ((display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable == dml2_dsc_enable ||
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable == dml2_dsc_enable_if_necessary) && display_cfg->plane_descriptors[k].stream_index == k) {
-
-				if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.overrides.num_slices)
-					mode_lib->ms.support.NumberOfDSCSlices[k] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.overrides.num_slices;
-				else {
-					if (s->PixelClockBackEnd[k] > 4800) {
-						mode_lib->ms.support.NumberOfDSCSlices[k] = (unsigned int)(math_ceil2(s->PixelClockBackEnd[k] / 600, 4));
-					} else if (s->PixelClockBackEnd[k] > 2400) {
-						mode_lib->ms.support.NumberOfDSCSlices[k] = 8;
-					} else if (s->PixelClockBackEnd[k] > 1200) {
-						mode_lib->ms.support.NumberOfDSCSlices[k] = 4;
-					} else if (s->PixelClockBackEnd[k] > 340) {
-						mode_lib->ms.support.NumberOfDSCSlices[k] = 2;
-					} else {
-						mode_lib->ms.support.NumberOfDSCSlices[k] = 1;
-					}
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		/*Number Of DSC Slices*/
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable == dml2_dsc_enable ||
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable == dml2_dsc_enable_if_necessary) {
+
+			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.overrides.num_slices != 0)
+				mode_lib->ms.support.NumberOfDSCSlices[k] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.overrides.num_slices;
+			else {
+				if (s->PixelClockBackEnd[k] > 4800) {
+					mode_lib->ms.support.NumberOfDSCSlices[k] = (unsigned int)(math_ceil2(s->PixelClockBackEnd[k] / 600, 4));
+				} else if (s->PixelClockBackEnd[k] > 2400) {
+					mode_lib->ms.support.NumberOfDSCSlices[k] = 8;
+				} else if (s->PixelClockBackEnd[k] > 1200) {
+					mode_lib->ms.support.NumberOfDSCSlices[k] = 4;
+				} else if (s->PixelClockBackEnd[k] > 340) {
+					mode_lib->ms.support.NumberOfDSCSlices[k] = 2;
+				} else {
+					mode_lib->ms.support.NumberOfDSCSlices[k] = 1;
 				}
-			} else {
-				mode_lib->ms.support.NumberOfDSCSlices[k] = 0;
-			}
-
-			if (s->ODMModeDSC == dml2_odm_mode_combine_2to1)
-				mode_lib->ms.support.NumberOfDSCSlices[k] = 2 * (unsigned int)math_ceil2(mode_lib->ms.support.NumberOfDSCSlices[k] / 2.0, 1.0);
-			else if (s->ODMModeDSC == dml2_odm_mode_combine_3to1)
-				mode_lib->ms.support.NumberOfDSCSlices[k] = 12;
-			else if (s->ODMModeDSC == dml2_odm_mode_combine_4to1)
-				mode_lib->ms.support.NumberOfDSCSlices[k] = 4 * (unsigned int)math_ceil2(mode_lib->ms.support.NumberOfDSCSlices[k] / 4.0, 1.0);
-
-			CalculateOutputLink(
-				&mode_lib->scratch,
-				((double)mode_lib->soc.clk_table.phyclk.clk_values_khz[0] / 1000),
-				((double)mode_lib->soc.clk_table.phyclk_d18.clk_values_khz[0] / 1000),
-				((double)mode_lib->soc.clk_table.phyclk_d32.clk_values_khz[0] / 1000),
-				mode_lib->soc.phy_downspread_percent,
-				(display_cfg->plane_descriptors[k].stream_index == k),
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
-				s->PixelClockBackEnd[k],
-				s->OutputBpp[k],
-				mode_lib->ip.maximum_dsc_bits_per_component,
-				mode_lib->ms.support.NumberOfDSCSlices[k],
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.audio_sample_rate,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.audio_sample_layout,
-				s->ODMModeNoDSC,
-				s->ODMModeDSC,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_dp_lane_count,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_dp_link_rate,
-
-				/* Output */
-				&mode_lib->ms.RequiresDSC[k],
-				&mode_lib->ms.RequiresFEC[k],
-				&mode_lib->ms.OutputBpp[k],
-				&mode_lib->ms.OutputType[k], // VBA_DELTA, VBA uses a string to represent type and rate, but DML uses enum, don't want to rely on strng
-				&mode_lib->ms.OutputRate[k],
-				&mode_lib->ms.RequiredSlots[k]);
-
-			if (mode_lib->ms.RequiresDSC[k] == false) {
-				mode_lib->ms.ODMMode[k] = s->ODMModeNoDSC;
-				mode_lib->ms.RequiredDISPCLKPerSurface[k] = s->RequiredDISPCLKPerSurfaceNoDSC;
-				if (!s->TotalAvailablePipesSupportNoDSC)
-					mode_lib->ms.support.TotalAvailablePipesSupport = false;
-				mode_lib->ms.TotalNumberOfActiveDPP = mode_lib->ms.TotalNumberOfActiveDPP + s->NumberOfDPPNoDSC;
-			} else {
-				mode_lib->ms.ODMMode[k] = s->ODMModeDSC;
-				mode_lib->ms.RequiredDISPCLKPerSurface[k] = s->RequiredDISPCLKPerSurfaceDSC;
-				if (!s->TotalAvailablePipesSupportDSC)
-					mode_lib->ms.support.TotalAvailablePipesSupport = false;
-				mode_lib->ms.TotalNumberOfActiveDPP = mode_lib->ms.TotalNumberOfActiveDPP + s->NumberOfDPPDSC;
 			}
-			dml2_printf("DML::%s: k=%d RequiresDSC = %d\n", __func__, k, mode_lib->ms.RequiresDSC[k]);
-			dml2_printf("DML::%s: k=%d ODMMode = %d\n", __func__, k, mode_lib->ms.ODMMode[k]);
+		} else {
+			mode_lib->ms.support.NumberOfDSCSlices[k] = 0;
 		}
 
-		// FIXME_DCN4 - add odm vs mpc use check
+		CalculateODMMode(
+			mode_lib->ip.maximum_pixels_per_line_per_dsc_unit,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].overrides.odm_mode,
+			mode_lib->ms.max_dispclk_freq_mhz,
+			false, // DSCEnable
+			mode_lib->ms.TotalNumberOfActiveDPP,
+			mode_lib->ip.max_num_dpp,
+			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
+			mode_lib->ms.support.NumberOfDSCSlices[k],
 
-		// FIXME_DCN4 - add imall cap check
-		mode_lib->ms.support.incorrect_imall_usage = 0;
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			if (mode_lib->ip.imall_supported && display_cfg->plane_descriptors[k].overrides.legacy_svp_config == dml2_svp_mode_override_imall)
-				mode_lib->ms.support.incorrect_imall_usage = 1;
-		}
+			/* Output */
+			&s->TotalAvailablePipesSupportNoDSC,
+			&s->NumberOfDPPNoDSC,
+			&s->ODMModeNoDSC,
+			&s->RequiredDISPCLKPerSurfaceNoDSC);
 
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.MPCCombine[k] = false;
-			mode_lib->ms.NoOfDPP[k] = 1;
+		CalculateODMMode(
+			mode_lib->ip.maximum_pixels_per_line_per_dsc_unit,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].overrides.odm_mode,
+			mode_lib->ms.max_dispclk_freq_mhz,
+			true, // DSCEnable
+			mode_lib->ms.TotalNumberOfActiveDPP,
+			mode_lib->ip.max_num_dpp,
+			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
+			mode_lib->ms.support.NumberOfDSCSlices[k],
 
-			if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_4to1) {
-				mode_lib->ms.MPCCombine[k] = false;
-				mode_lib->ms.NoOfDPP[k] = 4;
-			} else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_3to1) {
-				mode_lib->ms.MPCCombine[k] = false;
-				mode_lib->ms.NoOfDPP[k] = 3;
-			} else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_2to1) {
-				mode_lib->ms.MPCCombine[k] = false;
-				mode_lib->ms.NoOfDPP[k] = 2;
-			} else if (display_cfg->plane_descriptors[k].overrides.mpcc_combine_factor == 2) {
-				mode_lib->ms.MPCCombine[k] = true;
-				mode_lib->ms.NoOfDPP[k] = 2;
-				mode_lib->ms.TotalNumberOfActiveDPP++;
-			} else if (display_cfg->plane_descriptors[k].overrides.mpcc_combine_factor == 1) {
-				mode_lib->ms.MPCCombine[k] = false;
-				mode_lib->ms.NoOfDPP[k] = 1;
-				if (!mode_lib->ms.SingleDPPViewportSizeSupportPerSurface[k]) {
-					dml2_printf("WARNING: DML::%s: MPCC is override to disable but viewport is too large to be supported with single pipe!\n", __func__);
-				}
-			} else {
-				if ((mode_lib->ms.MinDPPCLKUsingSingleDPP[k] > mode_lib->ms.max_dppclk_freq_mhz) || !mode_lib->ms.SingleDPPViewportSizeSupportPerSurface[k]) {
-					mode_lib->ms.MPCCombine[k] = true;
-					mode_lib->ms.NoOfDPP[k] = 2;
-					mode_lib->ms.TotalNumberOfActiveDPP++;
-				}
-			}
+			/* Output */
+			&s->TotalAvailablePipesSupportDSC,
+			&s->NumberOfDPPDSC,
+			&s->ODMModeDSC,
+			&s->RequiredDISPCLKPerSurfaceDSC);
+
+		CalculateOutputLink(
+			&mode_lib->scratch,
+			((double)mode_lib->soc.clk_table.phyclk.clk_values_khz[0] / 1000),
+			((double)mode_lib->soc.clk_table.phyclk_d18.clk_values_khz[0] / 1000),
+			((double)mode_lib->soc.clk_table.phyclk_d32.clk_values_khz[0] / 1000),
+			mode_lib->soc.phy_downspread_percent,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
+			s->PixelClockBackEnd[k],
+			s->OutputBpp[k],
+			mode_lib->ip.maximum_dsc_bits_per_component,
+			mode_lib->ms.support.NumberOfDSCSlices[k],
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.audio_sample_rate,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.audio_sample_layout,
+			s->ODMModeNoDSC,
+			s->ODMModeDSC,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_dp_lane_count,
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_dp_link_rate,
+
+			/* Output */
+			&mode_lib->ms.RequiresDSC[k],
+			&mode_lib->ms.RequiresFEC[k],
+			&mode_lib->ms.OutputBpp[k],
+			&mode_lib->ms.OutputType[k],
+			&mode_lib->ms.OutputRate[k],
+			&mode_lib->ms.RequiredSlots[k]);
+
+		if (mode_lib->ms.RequiresDSC[k] == false) {
+			mode_lib->ms.ODMMode[k] = s->ODMModeNoDSC;
+			mode_lib->ms.RequiredDISPCLKPerSurface[k] = s->RequiredDISPCLKPerSurfaceNoDSC;
+			if (!s->TotalAvailablePipesSupportNoDSC)
+				mode_lib->ms.support.TotalAvailablePipesSupport = false;
+			mode_lib->ms.TotalNumberOfActiveDPP = mode_lib->ms.TotalNumberOfActiveDPP + s->NumberOfDPPNoDSC;
+		} else {
+			mode_lib->ms.ODMMode[k] = s->ODMModeDSC;
+			mode_lib->ms.RequiredDISPCLKPerSurface[k] = s->RequiredDISPCLKPerSurfaceDSC;
+			if (!s->TotalAvailablePipesSupportDSC)
+				mode_lib->ms.support.TotalAvailablePipesSupport = false;
+			mode_lib->ms.TotalNumberOfActiveDPP = mode_lib->ms.TotalNumberOfActiveDPP + s->NumberOfDPPDSC;
+		}
+#if defined(__DML_VBA_DEBUG__)
+		dml2_printf("DML::%s: k=%d RequiresDSC = %d\n", __func__, k, mode_lib->ms.RequiresDSC[k]);
+		dml2_printf("DML::%s: k=%d ODMMode = %d\n", __func__, k, mode_lib->ms.ODMMode[k]);
+#endif
+
+		// ensure the number dsc slices is integer multiple based on ODM mode
+		mode_lib->ms.support.DSCSlicesODMModeSupported = true;
+		if (mode_lib->ms.RequiresDSC[k]) {
+			// fail a ms check if the override num_slices doesn't align with odm mode setting
+			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.overrides.num_slices != 0) {
+				if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_2to1)
+					mode_lib->ms.support.DSCSlicesODMModeSupported = ((mode_lib->ms.support.NumberOfDSCSlices[k] % 2) == 0);
+				else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_3to1)
+					mode_lib->ms.support.DSCSlicesODMModeSupported = (mode_lib->ms.support.NumberOfDSCSlices[k] == 12);
+				else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_4to1)
+					mode_lib->ms.support.DSCSlicesODMModeSupported = ((mode_lib->ms.support.NumberOfDSCSlices[k] % 4) == 0);
 #if defined(__DML_VBA_DEBUG__)
-			dml2_printf("DML::%s: k=%d, NoOfDPP = %d\n", __func__, k, mode_lib->ms.NoOfDPP[k]);
+				if (!mode_lib->ms.support.DSCSlicesODMModeSupported) {
+					dml2_printf("DML::%s: k=%d Invalid dsc num_slices and ODM mode setting\n", __func__, k);
+					dml2_printf("DML::%s: k=%d num_slices = %d\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.overrides.num_slices);
+					dml2_printf("DML::%s: k=%d ODMMode = %d\n", __func__, k, mode_lib->ms.ODMMode[k]);
+				}
 #endif
-		}
+			} else {
+				// safe guard to ensure the dml derived dsc slices and odm setting are compatible
+				if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_2to1)
+					mode_lib->ms.support.NumberOfDSCSlices[k] = 2 * (unsigned int)math_ceil2(mode_lib->ms.support.NumberOfDSCSlices[k] / 2.0, 1.0);
+				else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_3to1)
+					mode_lib->ms.support.NumberOfDSCSlices[k] = 12;
+				else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_4to1)
+					mode_lib->ms.support.NumberOfDSCSlices[k] = 4 * (unsigned int)math_ceil2(mode_lib->ms.support.NumberOfDSCSlices[k] / 4.0, 1.0);
+			}
 
-		if (mode_lib->ms.TotalNumberOfActiveDPP > (unsigned int)mode_lib->ip.max_num_dpp)
-			mode_lib->ms.support.TotalAvailablePipesSupport = false;
+		} else {
+			mode_lib->ms.support.NumberOfDSCSlices[k] = 0;
+		}
+	}
 
+	mode_lib->ms.support.incorrect_imall_usage = 0;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ip.imall_supported && display_cfg->plane_descriptors[k].overrides.legacy_svp_config == dml2_svp_mode_override_imall)
+			mode_lib->ms.support.incorrect_imall_usage = 1;
+	}
 
-		mode_lib->ms.TotalNumberOfSingleDPPSurfaces = 0;
-		for (k = 0; k < (unsigned int)mode_lib->ms.num_active_planes; ++k) {
-			if (mode_lib->ms.NoOfDPP[k] == 1)
-				mode_lib->ms.TotalNumberOfSingleDPPSurfaces = mode_lib->ms.TotalNumberOfSingleDPPSurfaces + 1;
-		}
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		mode_lib->ms.MPCCombine[k] = false;
+		mode_lib->ms.NoOfDPP[k] = 1;
 
-		//DISPCLK/DPPCLK
-		mode_lib->ms.WritebackRequiredDISPCLK = 0;
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable) {
-				mode_lib->ms.WritebackRequiredDISPCLK = math_max2(mode_lib->ms.WritebackRequiredDISPCLK,
-					CalculateWriteBackDISPCLK(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format,
-						((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_taps,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_width,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
-						mode_lib->ip.writeback_line_buffer_buffer_size));
+		if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_4to1) {
+			mode_lib->ms.MPCCombine[k] = false;
+			mode_lib->ms.NoOfDPP[k] = 4;
+		} else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_3to1) {
+			mode_lib->ms.MPCCombine[k] = false;
+			mode_lib->ms.NoOfDPP[k] = 3;
+		} else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_2to1) {
+			mode_lib->ms.MPCCombine[k] = false;
+			mode_lib->ms.NoOfDPP[k] = 2;
+		} else if (display_cfg->plane_descriptors[k].overrides.mpcc_combine_factor == 2) {
+			mode_lib->ms.MPCCombine[k] = true;
+			mode_lib->ms.NoOfDPP[k] = 2;
+			mode_lib->ms.TotalNumberOfActiveDPP++;
+		} else if (display_cfg->plane_descriptors[k].overrides.mpcc_combine_factor == 1) {
+			mode_lib->ms.MPCCombine[k] = false;
+			mode_lib->ms.NoOfDPP[k] = 1;
+			if (!mode_lib->ms.SingleDPPViewportSizeSupportPerSurface[k]) {
+				dml2_printf("WARNING: DML::%s: MPCC is override to disable but viewport is too large to be supported with single pipe!\n", __func__);
+			}
+		} else {
+			if ((mode_lib->ms.MinDPPCLKUsingSingleDPP[k] > mode_lib->ms.max_dppclk_freq_mhz) || !mode_lib->ms.SingleDPPViewportSizeSupportPerSurface[k]) {
+				mode_lib->ms.MPCCombine[k] = true;
+				mode_lib->ms.NoOfDPP[k] = 2;
+				mode_lib->ms.TotalNumberOfActiveDPP++;
 			}
 		}
+#if defined(__DML_VBA_DEBUG__)
+		dml2_printf("DML::%s: k=%d, NoOfDPP = %d\n", __func__, k, mode_lib->ms.NoOfDPP[k]);
+#endif
+	}
 
-		mode_lib->ms.RequiredDISPCLK = mode_lib->ms.WritebackRequiredDISPCLK;
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.RequiredDISPCLK = math_max2(mode_lib->ms.RequiredDISPCLK, mode_lib->ms.RequiredDISPCLKPerSurface[k]);
-		}
+	if (mode_lib->ms.TotalNumberOfActiveDPP > (unsigned int)mode_lib->ip.max_num_dpp)
+		mode_lib->ms.support.TotalAvailablePipesSupport = false;
 
-		mode_lib->ms.GlobalDPPCLK = 0;
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.RequiredDPPCLK[k] = mode_lib->ms.MinDPPCLKUsingSingleDPP[k] / mode_lib->ms.NoOfDPP[k];
-			mode_lib->ms.GlobalDPPCLK = math_max2(mode_lib->ms.GlobalDPPCLK, mode_lib->ms.RequiredDPPCLK[k]);
+
+	mode_lib->ms.TotalNumberOfSingleDPPSurfaces = 0;
+	for (k = 0; k < (unsigned int)mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.NoOfDPP[k] == 1)
+			mode_lib->ms.TotalNumberOfSingleDPPSurfaces = mode_lib->ms.TotalNumberOfSingleDPPSurfaces + 1;
+	}
+
+	//DISPCLK/DPPCLK
+	mode_lib->ms.WritebackRequiredDISPCLK = 0;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable) {
+			mode_lib->ms.WritebackRequiredDISPCLK = math_max2(mode_lib->ms.WritebackRequiredDISPCLK,
+				CalculateWriteBackDISPCLK(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format,
+					((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_taps,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_width,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
+					mode_lib->ip.writeback_line_buffer_buffer_size));
 		}
+	}
 
-		mode_lib->ms.support.DISPCLK_DPPCLK_Support = !((mode_lib->ms.RequiredDISPCLK > mode_lib->ms.max_dispclk_freq_mhz) || (mode_lib->ms.GlobalDPPCLK > mode_lib->ms.max_dppclk_freq_mhz));
+	mode_lib->ms.RequiredDISPCLK = mode_lib->ms.WritebackRequiredDISPCLK;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		mode_lib->ms.RequiredDISPCLK = math_max2(mode_lib->ms.RequiredDISPCLK, mode_lib->ms.RequiredDISPCLKPerSurface[k]);
 	}
 
-	/* Total Available OTG, HDMIFRL, DP Support Check */
+	mode_lib->ms.GlobalDPPCLK = 0;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		mode_lib->ms.RequiredDPPCLK[k] = mode_lib->ms.MinDPPCLKUsingSingleDPP[k] / mode_lib->ms.NoOfDPP[k];
+		mode_lib->ms.GlobalDPPCLK = math_max2(mode_lib->ms.GlobalDPPCLK, mode_lib->ms.RequiredDPPCLK[k]);
+	}
+
+	mode_lib->ms.support.DISPCLK_DPPCLK_Support = !((mode_lib->ms.RequiredDISPCLK > mode_lib->ms.max_dispclk_freq_mhz) || (mode_lib->ms.GlobalDPPCLK > mode_lib->ms.max_dppclk_freq_mhz));
+
+	/* Total Available OTG, Writeback, HDMIFRL, DP Support Check */
 	s->TotalNumberOfActiveOTG = 0;
 	s->TotalNumberOfActiveHDMIFRL = 0;
 	s->TotalNumberOfActiveDP2p0 = 0;
 	s->TotalNumberOfActiveDP2p0Outputs = 0;
+	s->TotalNumberOfActiveWriteback = 0;
+	memset(s->stream_visited, 0, DML2_MAX_PLANES * sizeof(bool));
 
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (display_cfg->plane_descriptors[k].stream_index == k) {
-			s->TotalNumberOfActiveOTG = s->TotalNumberOfActiveOTG + 1;
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl)
-				s->TotalNumberOfActiveHDMIFRL = s->TotalNumberOfActiveHDMIFRL + 1;
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp2p0) {
-				s->TotalNumberOfActiveDP2p0 = s->TotalNumberOfActiveDP2p0 + 1;
-				// FIXME_STAGE2: SW not using backend related stuff, need mapping for mst setup
-				//if (display_cfg->output.OutputMultistreamId[k] == k || display_cfg->output.OutputMultistreamEn[k] == false) {
-				s->TotalNumberOfActiveDP2p0Outputs = s->TotalNumberOfActiveDP2p0Outputs + 1;
-				//}
+		if (!dml_is_phantom_pipe(&display_cfg->plane_descriptors[k])) {
+			if (!s->stream_visited[display_cfg->plane_descriptors[k].stream_index]) {
+				s->stream_visited[display_cfg->plane_descriptors[k].stream_index] = 1;
+
+				if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true)
+					s->TotalNumberOfActiveWriteback = s->TotalNumberOfActiveWriteback + 1;
+
+				s->TotalNumberOfActiveOTG = s->TotalNumberOfActiveOTG + 1;
+				if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl)
+					s->TotalNumberOfActiveHDMIFRL = s->TotalNumberOfActiveHDMIFRL + 1;
+				if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp2p0) {
+					s->TotalNumberOfActiveDP2p0 = s->TotalNumberOfActiveDP2p0 + 1;
+					// FIXME_STAGE2: SW not using backend related stuff, need mapping for mst setup
+					//if (display_cfg->output.OutputMultistreamId[k] == k || display_cfg->output.OutputMultistreamEn[k] == false) {
+					s->TotalNumberOfActiveDP2p0Outputs = s->TotalNumberOfActiveDP2p0Outputs + 1;
+					//}
+				}
 			}
 		}
 	}
 
+	/* Writeback Mode Support Check */
+	mode_lib->ms.support.EnoughWritebackUnits = 1;
+	if (s->TotalNumberOfActiveWriteback > (unsigned int)mode_lib->ip.max_num_wb) {
+		mode_lib->ms.support.EnoughWritebackUnits = false;
+	}
 	mode_lib->ms.support.NumberOfOTGSupport = (s->TotalNumberOfActiveOTG <= (unsigned int)mode_lib->ip.max_num_otg);
 	mode_lib->ms.support.NumberOfHDMIFRLSupport = (s->TotalNumberOfActiveHDMIFRL <= (unsigned int)mode_lib->ip.max_num_hdmi_frl_outputs);
 	mode_lib->ms.support.NumberOfDP2p0Support = (s->TotalNumberOfActiveDP2p0 <= (unsigned int)mode_lib->ip.max_num_dp2p0_streams && s->TotalNumberOfActiveDP2p0Outputs <= (unsigned int)mode_lib->ip.max_num_dp2p0_outputs);
 
+
 	mode_lib->ms.support.ExceededMultistreamSlots = false;
 	mode_lib->ms.support.LinkCapacitySupport = true;
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
 		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_disabled == false &&
-			display_cfg->plane_descriptors[k].stream_index == k && (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp2p0 || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_edp ||
+				(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp2p0 || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_edp ||
 				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmi || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl) && mode_lib->ms.OutputBpp[k] == 0) {
 			mode_lib->ms.support.LinkCapacitySupport = false;
 		}
@@ -7231,8 +7689,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	mode_lib->ms.support.NotEnoughLanesForMSO = false;
 
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (display_cfg->plane_descriptors[k].stream_index == k && (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp2p0 || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_edp ||
-			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmi || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl)) {
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp2p0 || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_edp ||
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmi || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl) {
 			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_420 && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.interlaced == 1 && mode_lib->ip.ptoi_supported == true)
 				mode_lib->ms.support.P2IWith420 = true;
 
@@ -7284,18 +7742,17 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 	mode_lib->ms.support.DTBCLKRequiredMoreThanSupported = false;
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (display_cfg->plane_descriptors[k].stream_index == k &&
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl) {
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl) {
 			mode_lib->ms.RequiredDTBCLK[k] = RequiredDTBCLK(
-					mode_lib->ms.RequiresDSC[k],
-					s->PixelClockBackEnd[k],
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
-					mode_lib->ms.OutputBpp[k],
-					mode_lib->ms.support.NumberOfDSCSlices[k],
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.audio_sample_rate,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.audio_sample_layout);
+				mode_lib->ms.RequiresDSC[k],
+				s->PixelClockBackEnd[k],
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
+				mode_lib->ms.OutputBpp[k],
+				mode_lib->ms.support.NumberOfDSCSlices[k],
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.audio_sample_rate,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.audio_sample_layout);
 
 			if (mode_lib->ms.RequiredDTBCLK[k] > ((double)min_clk_table->max_clocks_khz.dtbclk / 1000)) {
 				mode_lib->ms.support.DTBCLKRequiredMoreThanSupported = true;
@@ -7305,45 +7762,43 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 	mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = false;
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (display_cfg->plane_descriptors[k].stream_index == k) {
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp ||
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp2p0 ||
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_edp ||
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl) {
-				if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_420) {
-					s->DSCFormatFactor = 2;
-				} else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_444) {
-					s->DSCFormatFactor = 1;
-				} else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_n422 || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl) {
-					s->DSCFormatFactor = 2;
-				} else {
-					s->DSCFormatFactor = 1;
-				}
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp ||
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp2p0 ||
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_edp ||
+			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl) {
+			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_420) {
+				s->DSCFormatFactor = 2;
+			} else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_444) {
+				s->DSCFormatFactor = 1;
+			} else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_n422 || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl) {
+				s->DSCFormatFactor = 2;
+			} else {
+				s->DSCFormatFactor = 1;
+			}
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: k=%u, RequiresDSC = %u\n", __func__, k, mode_lib->ms.RequiresDSC[k]);
+			dml2_printf("DML::%s: k=%u, RequiresDSC = %u\n", __func__, k, mode_lib->ms.RequiresDSC[k]);
 #endif
-				if (mode_lib->ms.RequiresDSC[k] == true) {
-					s->PixelClockBackEndFactor = 3.0;
+			if (mode_lib->ms.RequiresDSC[k] == true) {
+				s->PixelClockBackEndFactor = 3.0;
 
-					if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_4to1)
-						s->PixelClockBackEndFactor = 12.0;
-					else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_3to1)
-						s->PixelClockBackEndFactor = 9.0;
-					else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_2to1)
-						s->PixelClockBackEndFactor = 6.0;
+				if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_4to1)
+					s->PixelClockBackEndFactor = 12.0;
+				else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_3to1)
+					s->PixelClockBackEndFactor = 9.0;
+				else if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_2to1)
+					s->PixelClockBackEndFactor = 6.0;
 
-					mode_lib->ms.required_dscclk_freq_mhz[k] = s->PixelClockBackEnd[k] / s->PixelClockBackEndFactor / (double)s->DSCFormatFactor;
-					if (mode_lib->ms.required_dscclk_freq_mhz[k] > mode_lib->ms.max_dscclk_freq_mhz) {
-						mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = true;
-					}
+				mode_lib->ms.required_dscclk_freq_mhz[k] = s->PixelClockBackEnd[k] / s->PixelClockBackEndFactor / (double)s->DSCFormatFactor;
+				if (mode_lib->ms.required_dscclk_freq_mhz[k] > mode_lib->ms.max_dscclk_freq_mhz) {
+					mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = true;
+				}
 
 #ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: k=%u, PixelClockBackEnd = %f\n", __func__, k, s->PixelClockBackEnd[k]);
-					dml2_printf("DML::%s: k=%u, required_dscclk_freq_mhz = %f\n", __func__, k, mode_lib->ms.required_dscclk_freq_mhz[k]);
-					dml2_printf("DML::%s: k=%u, DSCFormatFactor = %u\n", __func__, k, s->DSCFormatFactor);
-					dml2_printf("DML::%s: k=%u, DSCCLKRequiredMoreThanSupported = %u\n", __func__, k, mode_lib->ms.support.DSCCLKRequiredMoreThanSupported);
+				dml2_printf("DML::%s: k=%u, PixelClockBackEnd = %f\n", __func__, k, s->PixelClockBackEnd[k]);
+				dml2_printf("DML::%s: k=%u, required_dscclk_freq_mhz = %f\n", __func__, k, mode_lib->ms.required_dscclk_freq_mhz[k]);
+				dml2_printf("DML::%s: k=%u, DSCFormatFactor = %u\n", __func__, k, s->DSCFormatFactor);
+				dml2_printf("DML::%s: k=%u, DSCCLKRequiredMoreThanSupported = %u\n", __func__, k, mode_lib->ms.support.DSCCLKRequiredMoreThanSupported);
 #endif
-				}
 			}
 		}
 	}
@@ -7352,8 +7807,10 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	mode_lib->ms.support.NotEnoughDSCSlices = false;
 	s->TotalDSCUnitsRequired = 0;
 	mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = true;
+	memset(s->stream_visited, 0, DML2_MAX_PLANES * sizeof(bool));
+
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.RequiresDSC[k] == true) {
+		if (mode_lib->ms.RequiresDSC[k] == true && !s->stream_visited[display_cfg->plane_descriptors[k].stream_index]) {
 			s->NumDSCUnitRequired = 1;
 
 			if (mode_lib->ms.ODMMode[k] == dml2_odm_mode_combine_4to1)
@@ -7366,9 +7823,11 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active > s->NumDSCUnitRequired * (unsigned int)mode_lib->ip.maximum_pixels_per_line_per_dsc_unit)
 				mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = false;
 			s->TotalDSCUnitsRequired = s->TotalDSCUnitsRequired + s->NumDSCUnitRequired;
+
 			if (mode_lib->ms.support.NumberOfDSCSlices[k] > 4 * s->NumDSCUnitRequired)
 				mode_lib->ms.support.NotEnoughDSCSlices = true;
 		}
+		s->stream_visited[display_cfg->plane_descriptors[k].stream_index] = 1;
 	}
 
 	mode_lib->ms.support.NotEnoughDSCUnits = false;
@@ -7536,6 +7995,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	CalculateVMRowAndSwath_params->MaxNumSwathC = mode_lib->ms.MaxNumSwathC;
 	CalculateVMRowAndSwath_params->dpte_row_bw = mode_lib->ms.dpte_row_bw;
 	CalculateVMRowAndSwath_params->PixelPTEBytesPerRow = mode_lib->ms.DPTEBytesPerRow;
+	CalculateVMRowAndSwath_params->dpte_row_bytes_per_row_l = s->dpte_row_bytes_per_row_l;
+	CalculateVMRowAndSwath_params->dpte_row_bytes_per_row_c = s->dpte_row_bytes_per_row_c;
 	CalculateVMRowAndSwath_params->vm_bytes = mode_lib->ms.vm_bytes;
 	CalculateVMRowAndSwath_params->use_one_row_for_frame = mode_lib->ms.use_one_row_for_frame;
 	CalculateVMRowAndSwath_params->use_one_row_for_frame_flip = mode_lib->ms.use_one_row_for_frame_flip;
@@ -7545,6 +8006,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	CalculateVMRowAndSwath_params->DCCMetaBufferSizeNotExceeded = mode_lib->ms.DCCMetaBufferSizeNotExceeded;
 	CalculateVMRowAndSwath_params->meta_row_bw = mode_lib->ms.meta_row_bw;
 	CalculateVMRowAndSwath_params->meta_row_bytes = mode_lib->ms.meta_row_bytes;
+	CalculateVMRowAndSwath_params->meta_row_bytes_per_row_ub_l = s->meta_row_bytes_per_row_ub_l;
+	CalculateVMRowAndSwath_params->meta_row_bytes_per_row_ub_c = s->meta_row_bytes_per_row_ub_c;
 	CalculateVMRowAndSwath_params->meta_req_width_luma = s->dummy_integer_array[26];
 	CalculateVMRowAndSwath_params->meta_req_height_luma = s->dummy_integer_array[27];
 	CalculateVMRowAndSwath_params->meta_row_width_luma = s->dummy_integer_array[28];
@@ -7578,6 +8041,44 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: DCCMetaBufferSizeNotExceeded = %u\n", __func__, mode_lib->ms.support.DCCMetaBufferSizeNotExceeded);
 #endif
 
+	/* VActive bytes to fetch for UCLK P-State */
+	calculate_bytes_to_fetch_required_to_hide_latency_params->display_cfg = display_cfg;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->mrq_present = mode_lib->ip.dcn_mrq_present;
+
+	calculate_bytes_to_fetch_required_to_hide_latency_params->num_active_planes = mode_lib->ms.num_active_planes;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->num_of_dpp = mode_lib->ms.NoOfDPP;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_height_l = s->meta_row_height_luma;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_height_c = s->meta_row_height_chroma;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_bytes_per_row_ub_l = s->meta_row_bytes_per_row_ub_l;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_bytes_per_row_ub_c = s->meta_row_bytes_per_row_ub_c;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_row_height_l = mode_lib->ms.dpte_row_height;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_row_height_c = mode_lib->ms.dpte_row_height_chroma;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_bytes_per_row_l = s->dpte_row_bytes_per_row_l;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_bytes_per_row_c = s->dpte_row_bytes_per_row_c;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->byte_per_pix_l = mode_lib->ms.BytePerPixelY;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->byte_per_pix_c = mode_lib->ms.BytePerPixelC;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_width_l = mode_lib->ms.SwathWidthY;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_width_c = mode_lib->ms.SwathWidthC;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_height_l = mode_lib->ms.SwathHeightY;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_height_c = mode_lib->ms.SwathHeightC;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->latency_to_hide_us = mode_lib->soc.power_management_parameters.dram_clk_change_blackout_us;
+
+	/* outputs */
+	calculate_bytes_to_fetch_required_to_hide_latency_params->bytes_required_l = s->pstate_bytes_required_l;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->bytes_required_c = s->pstate_bytes_required_c;
+
+	calculate_bytes_to_fetch_required_to_hide_latency(calculate_bytes_to_fetch_required_to_hide_latency_params);
+
+	/* Excess VActive bandwidth required to fill DET */
+	calculate_excess_vactive_bandwidth_required(
+			display_cfg,
+			mode_lib->ms.num_active_planes,
+			s->pstate_bytes_required_l,
+			s->pstate_bytes_required_c,
+			/* outputs */
+			mode_lib->ms.excess_vactive_fill_bw_l,
+			mode_lib->ms.excess_vactive_fill_bw_c);
+
 	mode_lib->ms.UrgLatency = CalculateUrgentLatency(
 		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_us,
 		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_pixel_vm_us,
@@ -7682,41 +8183,18 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		&mode_lib->ms.dcfclk_deepsleep);
 
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (display_cfg->plane_descriptors[k].stream_index == k) {
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
-				mode_lib->ms.WritebackDelayTime[k] = mode_lib->soc.qos_parameters.writeback.base_latency_us + CalculateWriteBackDelay(
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total) / mode_lib->ms.RequiredDISPCLK;
-			} else {
-				mode_lib->ms.WritebackDelayTime[k] = 0.0;
-			}
-			for (m = 0; m <= mode_lib->ms.num_active_planes - 1; m++) {
-				if (display_cfg->plane_descriptors[m].stream_index == k && display_cfg->stream_descriptors[display_cfg->plane_descriptors[m].stream_index].writeback.enable == true) {
-					mode_lib->ms.WritebackDelayTime[k] = math_max2(mode_lib->ms.WritebackDelayTime[k],
-						mode_lib->soc.qos_parameters.writeback.base_latency_us + CalculateWriteBackDelay(
-							display_cfg->stream_descriptors[display_cfg->plane_descriptors[m].stream_index].writeback.pixel_format,
-							display_cfg->stream_descriptors[display_cfg->plane_descriptors[m].stream_index].writeback.scaling_info.h_ratio,
-							display_cfg->stream_descriptors[display_cfg->plane_descriptors[m].stream_index].writeback.scaling_info.v_ratio,
-							display_cfg->stream_descriptors[display_cfg->plane_descriptors[m].stream_index].writeback.scaling_info.v_taps,
-							display_cfg->stream_descriptors[display_cfg->plane_descriptors[m].stream_index].writeback.scaling_info.output_width,
-							display_cfg->stream_descriptors[display_cfg->plane_descriptors[m].stream_index].writeback.scaling_info.output_height,
-							display_cfg->stream_descriptors[display_cfg->plane_descriptors[m].stream_index].writeback.scaling_info.input_height,
-							display_cfg->stream_descriptors[display_cfg->plane_descriptors[m].stream_index].timing.h_total) / mode_lib->ms.RequiredDISPCLK);
-				}
-			}
-		}
-	}
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		for (m = 0; m <= mode_lib->ms.num_active_planes - 1; m++) {
-			if (display_cfg->plane_descriptors[k].stream_index == m) {
-				mode_lib->ms.WritebackDelayTime[k] = mode_lib->ms.WritebackDelayTime[m];
-			}
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
+			mode_lib->ms.WritebackDelayTime[k] = mode_lib->soc.qos_parameters.writeback.base_latency_us + CalculateWriteBackDelay(
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total) / mode_lib->ms.RequiredDISPCLK;
+		} else {
+			mode_lib->ms.WritebackDelayTime[k] = 0.0;
 		}
 	}
 
@@ -7786,60 +8264,13 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: FullFrameMALLPStateMethod = %u\n", __func__, s->FullFrameMALLPStateMethod);
 	dml2_printf("DML::%s: SubViewportMALLRefreshGreaterThan120Hz = %u\n", __func__, s->SubViewportMALLRefreshGreaterThan120Hz);
 	dml2_printf("DML::%s: InvalidCombinationOfMALLUseForPState = %u\n", __func__, mode_lib->ms.support.InvalidCombinationOfMALLUseForPState);
-#endif
-
-	//Re-ordering Buffer Support Check
-
-	mode_lib->ms.support.max_non_urgent_latency_us
-		= mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
-
-	mode_lib->ms.support.max_urgent_latency_us
-		= mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
-
-	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
-	if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
-		/ (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)) >= mode_lib->ms.support.max_urgent_latency_us) {
-		mode_lib->ms.support.ROBSupport = true;
-		} else {
-			mode_lib->ms.support.ROBSupport = false;
-		}
-	} else {
-		if (mode_lib->ip.rob_buffer_size_kbytes * 1024 >= mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles * mode_lib->soc.fabric_datapath_to_dcn_data_return_bytes) {
-			mode_lib->ms.support.ROBSupport = true;
-		} else {
-			mode_lib->ms.support.ROBSupport = false;
-		}
-	}
-
-#ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: in_out_params->min_clk_index = %u\n", __func__, in_out_params->min_clk_index);
 	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
-	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
-	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
-	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
+	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 #endif
 
-	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
-		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
-			/ (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)) >= mode_lib->ms.support.max_non_urgent_latency_us) {
-			mode_lib->ms.support.ROBUrgencyAvoidance = true;
-		} else {
-			mode_lib->ms.support.ROBUrgencyAvoidance = false;
-		}
-	} else {
-		mode_lib->ms.support.ROBUrgencyAvoidance = true;
-	}
-
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
 	mode_lib->ms.support.OutstandingRequestsUrgencyAvoidance = true;
 
@@ -8322,39 +8753,46 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				for (k = 0; k < mode_lib->ms.num_active_planes; k++)
 					mode_lib->ms.final_flip_bw[k] = 0;
 
-				calculate_peak_bandwidth_required(
-					&mode_lib->scratch,
-					mode_lib->ms.support.urg_vactive_bandwidth_required,
-					mode_lib->ms.support.urg_bandwidth_required,
-					mode_lib->ms.support.non_urg_bandwidth_required,
+				calculate_peak_bandwidth_params->urg_vactive_bandwidth_required = mode_lib->ms.support.urg_vactive_bandwidth_required;
+				calculate_peak_bandwidth_params->urg_bandwidth_required = mode_lib->ms.support.urg_bandwidth_required;
+				calculate_peak_bandwidth_params->urg_bandwidth_required_qual = mode_lib->ms.support.urg_bandwidth_required_qual;
+				calculate_peak_bandwidth_params->non_urg_bandwidth_required = mode_lib->ms.support.non_urg_bandwidth_required;
+				calculate_peak_bandwidth_params->surface_avg_vactive_required_bw = mode_lib->ms.surface_avg_vactive_required_bw;
+				calculate_peak_bandwidth_params->surface_peak_required_bw = mode_lib->ms.surface_peak_required_bw;
+
+				calculate_peak_bandwidth_params->display_cfg = display_cfg;
+				calculate_peak_bandwidth_params->inc_flip_bw = 0;
+				calculate_peak_bandwidth_params->num_active_planes =  mode_lib->ms.num_active_planes;
+				calculate_peak_bandwidth_params->num_of_dpp = mode_lib->ms.NoOfDPP;
+				calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 = mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p0;
+				calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 = mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p1;
+				calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 = mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p0;
+				calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 = mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p1;
+				calculate_peak_bandwidth_params->mall_prefetch_sdp_overhead_factor = mode_lib->ms.mall_prefetch_sdp_overhead_factor;
+				calculate_peak_bandwidth_params->mall_prefetch_dram_overhead_factor = mode_lib->ms.mall_prefetch_dram_overhead_factor;
+
+				calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->ms.SurfaceReadBandwidthLuma;
+				calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->ms.SurfaceReadBandwidthChroma;
+				calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->ms.RequiredPrefetchPixelDataBWLuma;
+				calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->ms.RequiredPrefetchPixelDataBWChroma;
+				calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->ms.excess_vactive_fill_bw_l;
+				calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->ms.excess_vactive_fill_bw_c;
+				calculate_peak_bandwidth_params->cursor_bw = mode_lib->ms.cursor_bw;
+				calculate_peak_bandwidth_params->dpte_row_bw = mode_lib->ms.dpte_row_bw;
+				calculate_peak_bandwidth_params->meta_row_bw = mode_lib->ms.meta_row_bw;
+				calculate_peak_bandwidth_params->prefetch_cursor_bw = mode_lib->ms.prefetch_cursor_bw;
+				calculate_peak_bandwidth_params->prefetch_vmrow_bw = mode_lib->ms.prefetch_vmrow_bw;
+				calculate_peak_bandwidth_params->flip_bw = mode_lib->ms.final_flip_bw;
+				calculate_peak_bandwidth_params->urgent_burst_factor_l = mode_lib->ms.UrgentBurstFactorLuma;
+				calculate_peak_bandwidth_params->urgent_burst_factor_c = mode_lib->ms.UrgentBurstFactorChroma;
+				calculate_peak_bandwidth_params->urgent_burst_factor_cursor = mode_lib->ms.UrgentBurstFactorCursor;
+				calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_l = mode_lib->ms.UrgentBurstFactorLumaPre;
+				calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_c = mode_lib->ms.UrgentBurstFactorChromaPre;
+				calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor = mode_lib->ms.UrgentBurstFactorCursorPre;
 
-					display_cfg,
-					0, // inc_flip_bw
-					mode_lib->ms.num_active_planes,
-					mode_lib->ms.NoOfDPP,
-					mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p0,
-					mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p1,
-					mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p0,
-					mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p1,
-					mode_lib->ms.mall_prefetch_sdp_overhead_factor,
-					mode_lib->ms.mall_prefetch_dram_overhead_factor,
-
-					mode_lib->ms.SurfaceReadBandwidthLuma,
-					mode_lib->ms.SurfaceReadBandwidthChroma,
-					mode_lib->ms.RequiredPrefetchPixelDataBWLuma,
-					mode_lib->ms.RequiredPrefetchPixelDataBWChroma,
-					mode_lib->ms.cursor_bw,
-					mode_lib->ms.dpte_row_bw,
-					mode_lib->ms.meta_row_bw,
-					mode_lib->ms.prefetch_cursor_bw,
-					mode_lib->ms.prefetch_vmrow_bw,
-					mode_lib->ms.final_flip_bw,
-					mode_lib->ms.UrgentBurstFactorLuma,
-					mode_lib->ms.UrgentBurstFactorChroma,
-					mode_lib->ms.UrgentBurstFactorCursor,
-					mode_lib->ms.UrgentBurstFactorLumaPre,
-					mode_lib->ms.UrgentBurstFactorChromaPre,
-					mode_lib->ms.UrgentBurstFactorCursorPre);
+				calculate_peak_bandwidth_required(
+						&mode_lib->scratch,
+						calculate_peak_bandwidth_params);
 
 				// Check urg peak bandwidth against available urg bw
 				// check at SDP and DRAM, for all soc states (SVP prefetch an Sys Active)
@@ -8384,8 +8822,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				// Both prefetch schedule and BW okay
 				if (mode_lib->ms.support.PrefetchSupported == true && mode_lib->ms.support.VRatioInPrefetchSupported == true) {
 					mode_lib->ms.BandwidthAvailableForImmediateFlip =
-						get_bandwidth_available_for_immediate_flip(dml2_core_internal_soc_state_sys_active,
-							mode_lib->ms.support.urg_bandwidth_required, // no flip
+						get_bandwidth_available_for_immediate_flip(
+							dml2_core_internal_soc_state_sys_active,
+							mode_lib->ms.support.urg_bandwidth_required_qual, // no flip
 							mode_lib->ms.support.urg_bandwidth_available);
 
 					mode_lib->ms.TotImmediateFlipBytes = 0;
@@ -8440,41 +8879,46 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 							&mode_lib->ms.ImmediateFlipSupportedForPipe[k]);
 					}
 
-					calculate_peak_bandwidth_required(
-						&mode_lib->scratch,
-						s->dummy_bw,
-						mode_lib->ms.support.urg_bandwidth_required_flip,
-						mode_lib->ms.support.non_urg_bandwidth_required_flip,
+					calculate_peak_bandwidth_params->urg_vactive_bandwidth_required = s->dummy_bw;
+					calculate_peak_bandwidth_params->urg_bandwidth_required = mode_lib->ms.support.urg_bandwidth_required_flip;
+					calculate_peak_bandwidth_params->urg_bandwidth_required_qual = s->dummy_bw;
+					calculate_peak_bandwidth_params->non_urg_bandwidth_required = mode_lib->ms.support.non_urg_bandwidth_required_flip;
+					calculate_peak_bandwidth_params->surface_avg_vactive_required_bw = s->surface_dummy_bw;
+					calculate_peak_bandwidth_params->surface_peak_required_bw = mode_lib->ms.surface_peak_required_bw;
+
+					calculate_peak_bandwidth_params->display_cfg = display_cfg;
+					calculate_peak_bandwidth_params->inc_flip_bw = 1;
+					calculate_peak_bandwidth_params->num_active_planes = mode_lib->ms.num_active_planes;
+					calculate_peak_bandwidth_params->num_of_dpp = mode_lib->ms.NoOfDPP;
+					calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 = mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p0;
+					calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 = mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p1;
+					calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 = mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p0;
+					calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 = mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p1;
+					calculate_peak_bandwidth_params->mall_prefetch_sdp_overhead_factor = mode_lib->ms.mall_prefetch_sdp_overhead_factor;
+					calculate_peak_bandwidth_params->mall_prefetch_dram_overhead_factor = mode_lib->ms.mall_prefetch_dram_overhead_factor;
+
+					calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->ms.SurfaceReadBandwidthLuma;
+					calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->ms.SurfaceReadBandwidthChroma;
+					calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->ms.RequiredPrefetchPixelDataBWLuma;
+					calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->ms.RequiredPrefetchPixelDataBWChroma;
+					calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->ms.excess_vactive_fill_bw_l;
+					calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->ms.excess_vactive_fill_bw_c;
+					calculate_peak_bandwidth_params->cursor_bw = mode_lib->ms.cursor_bw;
+					calculate_peak_bandwidth_params->dpte_row_bw = mode_lib->ms.dpte_row_bw;
+					calculate_peak_bandwidth_params->meta_row_bw = mode_lib->ms.meta_row_bw;
+					calculate_peak_bandwidth_params->prefetch_cursor_bw = mode_lib->ms.prefetch_cursor_bw;
+					calculate_peak_bandwidth_params->prefetch_vmrow_bw = mode_lib->ms.prefetch_vmrow_bw;
+					calculate_peak_bandwidth_params->flip_bw = mode_lib->ms.final_flip_bw;
+					calculate_peak_bandwidth_params->urgent_burst_factor_l = mode_lib->ms.UrgentBurstFactorLuma;
+					calculate_peak_bandwidth_params->urgent_burst_factor_c = mode_lib->ms.UrgentBurstFactorChroma;
+					calculate_peak_bandwidth_params->urgent_burst_factor_cursor = mode_lib->ms.UrgentBurstFactorCursor;
+					calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_l = mode_lib->ms.UrgentBurstFactorLumaPre;
+					calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_c = mode_lib->ms.UrgentBurstFactorChromaPre;
+					calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor = mode_lib->ms.UrgentBurstFactorCursorPre;
 
-						// Input
-						display_cfg,
-						1, // inc_flip_bw
-						mode_lib->ms.num_active_planes,
-						mode_lib->ms.NoOfDPP,
-
-						mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p0,
-						mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p1,
-						mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p0,
-						mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p1,
-						mode_lib->ms.mall_prefetch_sdp_overhead_factor,
-						mode_lib->ms.mall_prefetch_dram_overhead_factor,
-
-						mode_lib->ms.SurfaceReadBandwidthLuma,
-						mode_lib->ms.SurfaceReadBandwidthChroma,
-						mode_lib->ms.RequiredPrefetchPixelDataBWLuma,
-						mode_lib->ms.RequiredPrefetchPixelDataBWChroma,
-						mode_lib->ms.cursor_bw,
-						mode_lib->ms.dpte_row_bw,
-						mode_lib->ms.meta_row_bw,
-						mode_lib->ms.prefetch_cursor_bw,
-						mode_lib->ms.prefetch_vmrow_bw,
-						mode_lib->ms.final_flip_bw,
-						mode_lib->ms.UrgentBurstFactorLuma,
-						mode_lib->ms.UrgentBurstFactorChroma,
-						mode_lib->ms.UrgentBurstFactorCursor,
-						mode_lib->ms.UrgentBurstFactorLumaPre,
-						mode_lib->ms.UrgentBurstFactorChromaPre,
-						mode_lib->ms.UrgentBurstFactorCursorPre);
+					calculate_peak_bandwidth_required(
+							&mode_lib->scratch,
+							calculate_peak_bandwidth_params);
 
 					calculate_immediate_flip_bandwidth_support(
 						&s->dummy_single[0], // double* frac_urg_bandwidth_flip
@@ -8510,12 +8954,12 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		s->mSOCParameters.SREnterPlusExitTime = mode_lib->soc.power_management_parameters.stutter_enter_plus_exit_latency_us;
 		s->mSOCParameters.SRExitZ8Time = mode_lib->soc.power_management_parameters.z8_stutter_exit_latency_us;
 		s->mSOCParameters.SREnterPlusExitZ8Time = mode_lib->soc.power_management_parameters.z8_stutter_enter_plus_exit_latency_us;
-		s->mSOCParameters.USRRetrainingLatency = 0; // FIXME_STAGE2: no USR related bbox value
-		s->mSOCParameters.SMNLatency = 0; // FIXME_STAGE2
-		s->mSOCParameters.g6_temp_read_blackout_us = mode_lib->soc.power_management_parameters.g6_temp_read_blackout_us[in_out_params->min_clk_index];
+		s->mSOCParameters.USRRetrainingLatency = 0;
+		s->mSOCParameters.SMNLatency = 0;
+		s->mSOCParameters.g6_temp_read_blackout_us = get_g6_temp_read_blackout_us(&mode_lib->soc, (unsigned int)(mode_lib->ms.uclk_freq_mhz * 1000), in_out_params->min_clk_index);
 
 		CalculateWatermarks_params->display_cfg = display_cfg;
-		CalculateWatermarks_params->USRRetrainingRequired = false /*FIXME_STAGE2 was: mode_lib->ms.policy.USRRetrainingRequired, no new dml2 replacement*/;
+		CalculateWatermarks_params->USRRetrainingRequired = false;
 		CalculateWatermarks_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
 		CalculateWatermarks_params->MaxLineBufferLines = mode_lib->ip.max_line_buffer_lines;
 		CalculateWatermarks_params->LineBufferSize = mode_lib->ip.line_buffer_size_bits;
@@ -8566,6 +9010,49 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 	dml2_printf("DML::%s: Done prefetch calculation\n", __func__);
 
+	//Re-ordering Buffer Support Check
+	mode_lib->ms.support.max_urgent_latency_us
+		= mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
+
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
+			/ mode_lib->ms.support.non_urg_bandwidth_required_flip[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= mode_lib->ms.support.max_urgent_latency_us) {
+			mode_lib->ms.support.ROBSupport = true;
+		} else {
+			mode_lib->ms.support.ROBSupport = false;
+		}
+	} else {
+		if (mode_lib->ip.rob_buffer_size_kbytes * 1024 >= mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles * mode_lib->soc.fabric_datapath_to_dcn_data_return_bytes) {
+			mode_lib->ms.support.ROBSupport = true;
+		} else {
+			mode_lib->ms.support.ROBSupport = false;
+		}
+	}
+
+	/* VActive fill time calculations (informative) */
+	calculate_vactive_det_fill_latency(
+			display_cfg,
+			mode_lib->ms.num_active_planes,
+			s->pstate_bytes_required_l,
+			s->pstate_bytes_required_c,
+			mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p0,
+			mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p1,
+			mode_lib->ms.SurfaceReadBandwidthLuma,
+			mode_lib->ms.SurfaceReadBandwidthChroma,
+			mode_lib->ms.surface_avg_vactive_required_bw,
+			mode_lib->ms.surface_peak_required_bw,
+			/* outputs */
+			mode_lib->ms.dram_change_vactive_det_fill_delay_us);
+
+#ifdef __DML_VBA_DEBUG__
+	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
+	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
+#endif
+
 	/*Mode Support, Voltage State and SOC Configuration*/
 	{
 		// s->dram_clock_change_support = 1;
@@ -8585,6 +9072,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			&& !mode_lib->ms.support.P2IWith420
 			&& !mode_lib->ms.support.DSCOnlyIfNecessaryWithBPP
 			&& !mode_lib->ms.support.DSC422NativeNotSupported
+			&& mode_lib->ms.support.DSCSlicesODMModeSupported
 			&& !mode_lib->ms.support.NotEnoughDSCUnits
 			&& !mode_lib->ms.support.NotEnoughDSCSlices
 			&& !mode_lib->ms.support.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe
@@ -8594,7 +9082,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			&& !mode_lib->ms.support.DTBCLKRequiredMoreThanSupported
 			&& !mode_lib->ms.support.InvalidCombinationOfMALLUseForPState
 			&& mode_lib->ms.support.ROBSupport
-			&& mode_lib->ms.support.ROBUrgencyAvoidance
 			&& mode_lib->ms.support.OutstandingRequestsSupport
 			&& mode_lib->ms.support.OutstandingRequestsUrgencyAvoidance
 			&& mode_lib->ms.support.DISPCLK_DPPCLK_Support
@@ -8618,9 +9105,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			&& !mode_lib->ms.support.ExceededMALLSize
 			&& mode_lib->ms.support.g6_temp_read_support
 			&& ((!display_cfg->hostvm_enable && !s->ImmediateFlipRequired) || mode_lib->ms.support.ImmediateFlipSupport)) {
-			// && s->dram_clock_change_support == true
-			// && s->f_clock_change_support == true
-			// && (/*FIXME_STAGE2 was: mode_lib->ms.policy.USRRetrainingRequired, no new dml2 replacement || */ mode_lib->ms.support.USRRetrainingSupport)) {
 			dml2_printf("DML::%s: mode is supported\n", __func__);
 			mode_lib->ms.support.ModeSupport = true;
 		} else {
@@ -8639,12 +9123,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	}
 
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (display_cfg->plane_descriptors[k].stream_index == k) {
-			mode_lib->ms.support.ODMMode[k] = mode_lib->ms.ODMMode[k];
-		} else {
-			mode_lib->ms.support.ODMMode[k] = dml2_odm_mode_bypass;
-		}
-
+		mode_lib->ms.support.ODMMode[k] = mode_lib->ms.ODMMode[k];
 		mode_lib->ms.support.DSCEnabled[k] = mode_lib->ms.RequiresDSC[k];
 		mode_lib->ms.support.FECEnabled[k] = mode_lib->ms.RequiresFEC[k];
 		mode_lib->ms.support.OutputBpp[k] = mode_lib->ms.OutputBpp[k];
@@ -9331,11 +9810,28 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	dml2_printf("DML::%s: Part 3 = %f\n", __func__, *p->StutterPeriod * l->TotalRowReadBandwidth / p->ReturnBW);
 	dml2_printf("DML::%s: StutterBurstTime = %f\n", __func__, l->StutterBurstTime);
 #endif
-
 	l->TotalActiveWriteback = 0;
+	memset(l->stream_visited, 0, DML2_MAX_PLANES * sizeof(bool));
+
 	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
-		if (p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.enable) {
-			l->TotalActiveWriteback = l->TotalActiveWriteback + 1;
+		if (!dml_is_phantom_pipe(&p->display_cfg->plane_descriptors[k])) {
+			if (!l->stream_visited[p->display_cfg->plane_descriptors[k].stream_index]) {
+
+				if (p->display_cfg->stream_descriptors[k].writeback.enable)
+					l->TotalActiveWriteback = l->TotalActiveWriteback + 1;
+
+				if (TotalNumberOfActiveOTG == 0) { // first otg
+					SinglePixelClock = ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
+					SingleHTotal = p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.h_total;
+					SingleVTotal = p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.v_total;
+				} else if (SinglePixelClock != ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000) ||
+							SingleHTotal != p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.h_total ||
+							SingleVTotal != p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.v_total) {
+					SameTiming = false;
+				}
+				TotalNumberOfActiveOTG = TotalNumberOfActiveOTG + 1;
+				l->stream_visited[p->display_cfg->plane_descriptors[k].stream_index] = 1;
+			}
 		}
 	}
 
@@ -9363,21 +9859,6 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	dml2_printf("DML::%s: Z8NumberOfStutterBurstsPerFrame = %u\n", __func__, *p->Z8NumberOfStutterBurstsPerFrame);
 #endif
 
-	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
-		if (!dml_is_phantom_pipe(&p->display_cfg->plane_descriptors[k])) {
-			if (p->display_cfg->plane_descriptors[k].stream_index == k) {
-				if (TotalNumberOfActiveOTG == 0) {
-					SinglePixelClock = ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
-					SingleHTotal = p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.h_total;
-					SingleVTotal = p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.v_total;
-				} else if (SinglePixelClock != ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000) || SingleHTotal != p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.h_total || SingleVTotal != p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.v_total) {
-					SameTiming = false;
-				}
-				TotalNumberOfActiveOTG = TotalNumberOfActiveOTG + 1;
-			}
-		}
-	}
-
 	if (*p->StutterEfficiencyNotIncludingVBlank > 0) {
 		if (!((p->SynchronizeTimings || TotalNumberOfActiveOTG == 1) && SameTiming)) {
 			*p->StutterEfficiency = *p->StutterEfficiencyNotIncludingVBlank;
@@ -9402,6 +9883,9 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	}
 
 #ifdef __DML_VBA_DEBUG__
+	dml2_printf("DML::%s: TotalNumberOfActiveOTG = %u\n", __func__, TotalNumberOfActiveOTG);
+	dml2_printf("DML::%s: SameTiming = %u\n", __func__, SameTiming);
+	dml2_printf("DML::%s: SynchronizeTimings = %u\n", __func__, p->SynchronizeTimings);
 	dml2_printf("DML::%s: LastZ8StutterPeriod = %f\n", __func__, LastZ8StutterPeriod);
 	dml2_printf("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n", __func__, p->Z8StutterEnterPlusExitWatermark);
 	dml2_printf("DML::%s: StutterBurstTime = %f\n", __func__, l->StutterBurstTime);
@@ -9446,10 +9930,11 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	struct dml2_core_calcs_calculate_mcache_setting_params *calculate_mcache_setting_params = &mode_lib->scratch.calculate_mcache_setting_params;
 	struct dml2_core_calcs_calculate_tdlut_setting_params *calculate_tdlut_setting_params = &mode_lib->scratch.calculate_tdlut_setting_params;
 	struct dml2_core_shared_CalculateMetaAndPTETimes_params *CalculateMetaAndPTETimes_params = &mode_lib->scratch.CalculateMetaAndPTETimes_params;
+	struct dml2_core_calcs_calculate_peak_bandwidth_required_params *calculate_peak_bandwidth_params = &mode_lib->scratch.calculate_peak_bandwidth_params;
+	struct dml2_core_calcs_calculate_bytes_to_fetch_required_to_hide_latency_params *calculate_bytes_to_fetch_required_to_hide_latency_params = &mode_lib->scratch.calculate_bytes_to_fetch_required_to_hide_latency_params;
 
-	unsigned int j, k;
+	unsigned int k;
 	bool must_support_iflip;
-
 	const long min_return_uclk_cycles = 83;
 	const long min_return_fclk_cycles = 75;
 	const double max_fclk_mhz = min_clk_table->max_clocks_khz.fclk / 1000.0;
@@ -9478,24 +9963,32 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	mode_lib->mp.active_min_uclk_dpm_index = get_active_min_uclk_dpm_index(programming->min_clocks.dcn4.active.uclk_khz, &mode_lib->soc.clk_table);
 
 	for (k = 0; k < s->num_active_planes; ++k) {
-		switch (cfg_support_info->stream_support_info[display_cfg->plane_descriptors[k].stream_index].odms_used) {
+		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
+		dml2_assert(cfg_support_info->stream_support_info[stream_index].odms_used <= 4);
+		dml2_assert(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 4 ||
+					cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 2 ||
+					cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 1);
+
+		if (cfg_support_info->stream_support_info[stream_index].odms_used > 1)
+			dml2_assert(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 1);
+
+		switch (cfg_support_info->stream_support_info[stream_index].odms_used) {
 		case (4):
-			if (cfg_support_info->plane_support_info[k].dpps_used == 1)
-				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to2; // FIXME_STAGE2: for mode programming same as dml2_odm_mode_split_1to2?
-			else
-				mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_4to1;
+			mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_4to1;
 			break;
 		case (3):
 			mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_3to1;
 			break;
 		case (2):
-			if (cfg_support_info->plane_support_info[k].dpps_used == 1)
-				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to4;
-			else
-				mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_2to1;
+			mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_2to1;
 			break;
 		default:
-			mode_lib->mp.ODMMode[k] = dml2_odm_mode_bypass;
+			if (cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 4)
+				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to4;
+			else if (cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 2)
+				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to2;
+			else
+				mode_lib->mp.ODMMode[k] = dml2_odm_mode_bypass;
 			break;
 		}
 	}
@@ -9708,47 +10201,9 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	CalculateSwathAndDETConfiguration_params->ViewportSizeSupportPerSurface = &s->dummy_boolean_array[0][0];
 	CalculateSwathAndDETConfiguration_params->ViewportSizeSupport = &s->dummy_boolean[0];
 
-	// VBA_DELTA
-	// Calculate DET size, swath height here. In VBA, they are calculated in mode check stage
+	// Calculate DET size, swath height here.
 	CalculateSwathAndDETConfiguration(&mode_lib->scratch, CalculateSwathAndDETConfiguration_params);
 
-	// DSCCLK
-	/*
-	s->DSCFormatFactor = 0;
-	for (k = 0; k < s->num_active_planes; ++k) {
-	if ((display_cfg->plane_descriptors[k].stream_index != k) || !cfg_support_info->stream_support_info[display_cfg->plane_descriptors[k].stream_index].dsc_enable) {
-	} else {
-	if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_420)
-	s->DSCFormatFactor = 2;
-	else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_444)
-	s->DSCFormatFactor = 1;
-	else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_n422 ||
-	display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl)
-	s->DSCFormatFactor = 2;
-	else
-	s->DSCFormatFactor = 1;
-
-	s->PixelClockBackEndFactor = 3.0;
-
-	if (mode_lib->mp.ODMMode[k] == dml2_odm_mode_combine_4to1)
-	s->PixelClockBackEndFactor = 12.0;
-	else if (mode_lib->mp.ODMMode[k] == dml2_odm_mode_combine_3to1)
-	s->PixelClockBackEndFactor = 9.0;
-	else if (mode_lib->mp.ODMMode[k] == dml2_odm_mode_combine_2to1)
-	s->PixelClockBackEndFactor = 6.0;
-
-	}
-	#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: k=%u, DSCEnabled = %u\n", __func__, k, cfg_support_info->stream_support_info[display_cfg->plane_descriptors[k].stream_index].dsc_enable);
-	dml2_printf("DML::%s: k=%u, BlendingAndTiming = %u\n", __func__, k, display_cfg->plane_descriptors[k].stream_index);
-	dml2_printf("DML::%s: k=%u, PixelClockBackEndFactor = %f\n", __func__, k, s->PixelClockBackEndFactor);
-	dml2_printf("DML::%s: k=%u, PixelClockBackEnd = %f\n", __func__, k, s->PixelClockBackEnd[k]);
-	dml2_printf("DML::%s: k=%u, DSCFormatFactor = %u\n", __func__, k, s->DSCFormatFactor);
-	dml2_printf("DML::%s: k=%u, DSCCLK = %f\n", __func__, k, mode_lib->mp.DSCCLK[k]);
-	#endif
-	}
-	*/
-
 	// DSC Delay
 	for (k = 0; k < s->num_active_planes; ++k) {
 		mode_lib->mp.DSCDelay[k] = DSCDelayRequirement(cfg_support_info->stream_support_info[display_cfg->plane_descriptors[k].stream_index].dsc_enable,
@@ -9872,6 +10327,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	CalculateVMRowAndSwath_params->MaxNumSwathC = mode_lib->mp.MaxNumSwathC;
 	CalculateVMRowAndSwath_params->dpte_row_bw = mode_lib->mp.dpte_row_bw;
 	CalculateVMRowAndSwath_params->PixelPTEBytesPerRow = mode_lib->mp.PixelPTEBytesPerRow;
+	CalculateVMRowAndSwath_params->dpte_row_bytes_per_row_l = s->dpte_row_bytes_per_row_l;
+	CalculateVMRowAndSwath_params->dpte_row_bytes_per_row_c = s->dpte_row_bytes_per_row_c;
 	CalculateVMRowAndSwath_params->vm_bytes = mode_lib->mp.vm_bytes;
 	CalculateVMRowAndSwath_params->use_one_row_for_frame = mode_lib->mp.use_one_row_for_frame;
 	CalculateVMRowAndSwath_params->use_one_row_for_frame_flip = mode_lib->mp.use_one_row_for_frame_flip;
@@ -9881,6 +10338,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	CalculateVMRowAndSwath_params->DCCMetaBufferSizeNotExceeded = s->dummy_boolean_array[1];
 	CalculateVMRowAndSwath_params->meta_row_bw = mode_lib->mp.meta_row_bw;
 	CalculateVMRowAndSwath_params->meta_row_bytes = mode_lib->mp.meta_row_bytes;
+	CalculateVMRowAndSwath_params->meta_row_bytes_per_row_ub_l = s->meta_row_bytes_per_row_ub_l;
+	CalculateVMRowAndSwath_params->meta_row_bytes_per_row_ub_c = s->meta_row_bytes_per_row_ub_c;
 	CalculateVMRowAndSwath_params->meta_req_width_luma = mode_lib->mp.meta_req_width;
 	CalculateVMRowAndSwath_params->meta_req_height_luma = mode_lib->mp.meta_req_height;
 	CalculateVMRowAndSwath_params->meta_row_width_luma = mode_lib->mp.meta_row_width;
@@ -10062,47 +10521,59 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	mode_lib->mp.TCalc = 24.0 / mode_lib->mp.DCFCLKDeepSleep;
 
 	for (k = 0; k < s->num_active_planes; ++k) {
-		if (display_cfg->plane_descriptors[k].stream_index == k) {
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
-				mode_lib->mp.WritebackDelay[k] =
-					mode_lib->soc.qos_parameters.writeback.base_latency_us
-					+ CalculateWriteBackDelay(
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height,
-						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total) / mode_lib->mp.Dispclk;
-			} else
-				mode_lib->mp.WritebackDelay[k] = 0;
-
-			for (j = 0; j < s->num_active_planes; ++j) {
-				if (display_cfg->plane_descriptors[j].stream_index == k
-					&& display_cfg->stream_descriptors[display_cfg->plane_descriptors[j].stream_index].writeback.enable == true) {
-					mode_lib->mp.WritebackDelay[k] =
-						math_max2(
-							mode_lib->mp.WritebackDelay[k],
-							mode_lib->soc.qos_parameters.writeback.base_latency_us
-							+ CalculateWriteBackDelay(
-								display_cfg->stream_descriptors[display_cfg->plane_descriptors[j].stream_index].writeback.pixel_format,
-								display_cfg->stream_descriptors[display_cfg->plane_descriptors[j].stream_index].writeback.scaling_info.h_ratio,
-								display_cfg->stream_descriptors[display_cfg->plane_descriptors[j].stream_index].writeback.scaling_info.v_ratio,
-								display_cfg->stream_descriptors[display_cfg->plane_descriptors[j].stream_index].writeback.scaling_info.v_taps,
-								display_cfg->stream_descriptors[display_cfg->plane_descriptors[j].stream_index].writeback.scaling_info.output_width,
-								display_cfg->stream_descriptors[display_cfg->plane_descriptors[j].stream_index].writeback.scaling_info.output_height,
-								display_cfg->stream_descriptors[display_cfg->plane_descriptors[j].stream_index].writeback.scaling_info.input_height,
-								display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total) / mode_lib->mp.Dispclk);
-				}
-			}
-		}
-	}
-
-	for (k = 0; k < s->num_active_planes; ++k)
-		for (j = 0; j < s->num_active_planes; ++j)
-			if (display_cfg->plane_descriptors[k].stream_index == j)
-				mode_lib->mp.WritebackDelay[k] = mode_lib->mp.WritebackDelay[j];
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
+			mode_lib->mp.WritebackDelay[k] =
+				mode_lib->soc.qos_parameters.writeback.base_latency_us
+				+ CalculateWriteBackDelay(
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total) / mode_lib->mp.Dispclk;
+		} else
+			mode_lib->mp.WritebackDelay[k] = 0;
+	}
+
+	/* VActive bytes to fetch for UCLK P-State */
+	calculate_bytes_to_fetch_required_to_hide_latency_params->display_cfg = display_cfg;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->mrq_present = mode_lib->ip.dcn_mrq_present;
+
+	calculate_bytes_to_fetch_required_to_hide_latency_params->num_active_planes = s->num_active_planes;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->num_of_dpp = mode_lib->mp.NoOfDPP;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_height_l = mode_lib->mp.meta_row_height;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_height_c = mode_lib->mp.meta_row_height_chroma;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_bytes_per_row_ub_l = s->meta_row_bytes_per_row_ub_l;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_bytes_per_row_ub_c = s->meta_row_bytes_per_row_ub_c;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_row_height_l = mode_lib->mp.dpte_row_height;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_row_height_c = mode_lib->mp.dpte_row_height_chroma;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_bytes_per_row_l = s->dpte_row_bytes_per_row_l;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_bytes_per_row_c = s->dpte_row_bytes_per_row_c;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->byte_per_pix_l = mode_lib->mp.BytePerPixelY;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->byte_per_pix_c = mode_lib->mp.BytePerPixelC;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_width_l = mode_lib->mp.SwathWidthY;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_width_c = mode_lib->mp.SwathWidthC;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_height_l = mode_lib->mp.SwathHeightY;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_height_c = mode_lib->mp.SwathHeightC;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->latency_to_hide_us = mode_lib->soc.power_management_parameters.dram_clk_change_blackout_us;
+
+	/* outputs */
+	calculate_bytes_to_fetch_required_to_hide_latency_params->bytes_required_l = s->pstate_bytes_required_l;
+	calculate_bytes_to_fetch_required_to_hide_latency_params->bytes_required_c = s->pstate_bytes_required_c;
+
+	calculate_bytes_to_fetch_required_to_hide_latency(calculate_bytes_to_fetch_required_to_hide_latency_params);
+
+	/* Excess VActive bandwidth required to fill DET */
+	calculate_excess_vactive_bandwidth_required(
+			display_cfg,
+			s->num_active_planes,
+			s->pstate_bytes_required_l,
+			s->pstate_bytes_required_c,
+			/* outputs */
+			mode_lib->mp.excess_vactive_fill_bw_l,
+			mode_lib->mp.excess_vactive_fill_bw_c);
 
 	mode_lib->mp.UrgentLatency = CalculateUrgentLatency(
 		mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_latency_us.base_latency_us,
@@ -10430,39 +10901,46 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			for (k = 0; k <= s->num_active_planes - 1; k++)
 				mode_lib->mp.final_flip_bw[k] = 0;
 
-			calculate_peak_bandwidth_required(
-				&mode_lib->scratch,
-				mode_lib->mp.urg_vactive_bandwidth_required,
-				mode_lib->mp.urg_bandwidth_required,
-				mode_lib->mp.non_urg_bandwidth_required,
+			calculate_peak_bandwidth_params->urg_vactive_bandwidth_required = mode_lib->mp.urg_vactive_bandwidth_required;
+			calculate_peak_bandwidth_params->urg_bandwidth_required = mode_lib->mp.urg_bandwidth_required;
+			calculate_peak_bandwidth_params->urg_bandwidth_required_qual = mode_lib->mp.urg_bandwidth_required_qual;
+			calculate_peak_bandwidth_params->non_urg_bandwidth_required = mode_lib->mp.non_urg_bandwidth_required;
+			calculate_peak_bandwidth_params->surface_avg_vactive_required_bw = s->surface_dummy_bw;
+			calculate_peak_bandwidth_params->surface_peak_required_bw = s->surface_dummy_bw0;
+
+			calculate_peak_bandwidth_params->display_cfg = display_cfg;
+			calculate_peak_bandwidth_params->inc_flip_bw = 0;
+			calculate_peak_bandwidth_params->num_active_planes = s->num_active_planes;
+			calculate_peak_bandwidth_params->num_of_dpp = mode_lib->mp.NoOfDPP;
+			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 = mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p0;
+			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 = mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p1;
+			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 = mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p0;
+			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 = mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p1;
+			calculate_peak_bandwidth_params->mall_prefetch_sdp_overhead_factor = mode_lib->mp.mall_prefetch_sdp_overhead_factor;
+			calculate_peak_bandwidth_params->mall_prefetch_dram_overhead_factor = mode_lib->mp.mall_prefetch_dram_overhead_factor;
+
+			calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->mp.SurfaceReadBandwidthLuma;
+			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.SurfaceReadBandwidthChroma;
+			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->mp.RequiredPrefetchPixelDataBWLuma;
+			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->mp.RequiredPrefetchPixelDataBWChroma;
+			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->mp.excess_vactive_fill_bw_l;
+			calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->mp.excess_vactive_fill_bw_c;
+			calculate_peak_bandwidth_params->cursor_bw = mode_lib->mp.cursor_bw;
+			calculate_peak_bandwidth_params->dpte_row_bw = mode_lib->mp.dpte_row_bw;
+			calculate_peak_bandwidth_params->meta_row_bw = mode_lib->mp.meta_row_bw;
+			calculate_peak_bandwidth_params->prefetch_cursor_bw = mode_lib->mp.prefetch_cursor_bw;
+			calculate_peak_bandwidth_params->prefetch_vmrow_bw = mode_lib->mp.prefetch_vmrow_bw;
+			calculate_peak_bandwidth_params->flip_bw = mode_lib->mp.final_flip_bw;
+			calculate_peak_bandwidth_params->urgent_burst_factor_l = mode_lib->mp.UrgentBurstFactorLuma;
+			calculate_peak_bandwidth_params->urgent_burst_factor_c = mode_lib->mp.UrgentBurstFactorChroma;
+			calculate_peak_bandwidth_params->urgent_burst_factor_cursor = mode_lib->mp.UrgentBurstFactorCursor;
+			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_l = mode_lib->mp.UrgentBurstFactorLumaPre;
+			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_c = mode_lib->mp.UrgentBurstFactorChromaPre;
+			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor = mode_lib->mp.UrgentBurstFactorCursorPre;
 
-				// Input
-				display_cfg,
-				0, // inc_flip_bw
-				s->num_active_planes,
-				mode_lib->mp.NoOfDPP,
-				mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p0,
-				mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p1,
-				mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p0,
-				mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p1,
-				mode_lib->mp.mall_prefetch_sdp_overhead_factor,
-				mode_lib->mp.mall_prefetch_dram_overhead_factor,
-				mode_lib->mp.SurfaceReadBandwidthLuma,
-				mode_lib->mp.SurfaceReadBandwidthChroma,
-				mode_lib->mp.RequiredPrefetchPixelDataBWLuma,
-				mode_lib->mp.RequiredPrefetchPixelDataBWChroma,
-				mode_lib->mp.cursor_bw,
-				mode_lib->mp.dpte_row_bw,
-				mode_lib->mp.meta_row_bw,
-				mode_lib->mp.prefetch_cursor_bw,
-				mode_lib->mp.prefetch_vmrow_bw,
-				mode_lib->mp.final_flip_bw,
-				mode_lib->mp.UrgentBurstFactorLuma,
-				mode_lib->mp.UrgentBurstFactorChroma,
-				mode_lib->mp.UrgentBurstFactorCursor,
-				mode_lib->mp.UrgentBurstFactorLumaPre,
-				mode_lib->mp.UrgentBurstFactorChromaPre,
-				mode_lib->mp.UrgentBurstFactorCursorPre);
+			calculate_peak_bandwidth_required(
+					&mode_lib->scratch,
+					calculate_peak_bandwidth_params);
 
 			// Check urg peak bandwidth against available urg bw
 			// check at SDP and DRAM, for all soc states (SVP prefetch an Sys Active)
@@ -10493,8 +10971,9 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		if (mode_lib->mp.PrefetchModeSupported == true) { // prefetch schedule and prefetch bw ok, now check flip bw
 
 			mode_lib->mp.BandwidthAvailableForImmediateFlip =
-				get_bandwidth_available_for_immediate_flip(dml2_core_internal_soc_state_sys_active,
-					mode_lib->mp.urg_bandwidth_required, // no flip
+				get_bandwidth_available_for_immediate_flip(
+					dml2_core_internal_soc_state_sys_active,
+					mode_lib->mp.urg_bandwidth_required_qual, // no flip
 					mode_lib->mp.urg_bandwidth_available);
 			mode_lib->mp.TotImmediateFlipBytes = 0;
 			for (k = 0; k < s->num_active_planes; ++k) {
@@ -10553,39 +11032,46 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 					&mode_lib->mp.ImmediateFlipSupportedForPipe[k]);
 			}
 
-			calculate_peak_bandwidth_required(
-				&mode_lib->scratch,
-				s->dummy_bw,
-				mode_lib->mp.urg_bandwidth_required_flip,
-				mode_lib->mp.non_urg_bandwidth_required_flip,
+			calculate_peak_bandwidth_params->urg_vactive_bandwidth_required = s->dummy_bw;
+			calculate_peak_bandwidth_params->urg_bandwidth_required = mode_lib->mp.urg_bandwidth_required_flip;
+			calculate_peak_bandwidth_params->urg_bandwidth_required_qual = s->dummy_bw;
+			calculate_peak_bandwidth_params->non_urg_bandwidth_required = mode_lib->mp.non_urg_bandwidth_required_flip;
+			calculate_peak_bandwidth_params->surface_avg_vactive_required_bw = s->surface_dummy_bw;
+			calculate_peak_bandwidth_params->surface_peak_required_bw = s->surface_dummy_bw0;
+
+			calculate_peak_bandwidth_params->display_cfg = display_cfg;
+			calculate_peak_bandwidth_params->inc_flip_bw = 1;
+			calculate_peak_bandwidth_params->num_active_planes = s->num_active_planes;
+			calculate_peak_bandwidth_params->num_of_dpp = mode_lib->mp.NoOfDPP;
+			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 = mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p0;
+			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 = mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p1;
+			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 = mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p0;
+			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 = mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p1;
+			calculate_peak_bandwidth_params->mall_prefetch_sdp_overhead_factor = mode_lib->mp.mall_prefetch_sdp_overhead_factor;
+			calculate_peak_bandwidth_params->mall_prefetch_dram_overhead_factor = mode_lib->mp.mall_prefetch_dram_overhead_factor;
+
+			calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->mp.SurfaceReadBandwidthLuma;
+			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.SurfaceReadBandwidthChroma;
+			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->mp.RequiredPrefetchPixelDataBWLuma;
+			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->mp.RequiredPrefetchPixelDataBWChroma;
+			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->mp.excess_vactive_fill_bw_l;
+			calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->mp.excess_vactive_fill_bw_c;
+			calculate_peak_bandwidth_params->cursor_bw = mode_lib->mp.cursor_bw;
+			calculate_peak_bandwidth_params->dpte_row_bw = mode_lib->mp.dpte_row_bw;
+			calculate_peak_bandwidth_params->meta_row_bw = mode_lib->mp.meta_row_bw;
+			calculate_peak_bandwidth_params->prefetch_cursor_bw = mode_lib->mp.prefetch_cursor_bw;
+			calculate_peak_bandwidth_params->prefetch_vmrow_bw = mode_lib->mp.prefetch_vmrow_bw;
+			calculate_peak_bandwidth_params->flip_bw = mode_lib->mp.final_flip_bw;
+			calculate_peak_bandwidth_params->urgent_burst_factor_l = mode_lib->mp.UrgentBurstFactorLuma;
+			calculate_peak_bandwidth_params->urgent_burst_factor_c = mode_lib->mp.UrgentBurstFactorChroma;
+			calculate_peak_bandwidth_params->urgent_burst_factor_cursor = mode_lib->mp.UrgentBurstFactorCursor;
+			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_l = mode_lib->mp.UrgentBurstFactorLumaPre;
+			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_c = mode_lib->mp.UrgentBurstFactorChromaPre;
+			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor = mode_lib->mp.UrgentBurstFactorCursorPre;
 
-				// Input
-				display_cfg,
-				1, // inc_flip_bw
-				s->num_active_planes,
-				mode_lib->mp.NoOfDPP,
-				mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p0,
-				mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p1,
-				mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p0,
-				mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p1,
-				mode_lib->mp.mall_prefetch_sdp_overhead_factor,
-				mode_lib->mp.mall_prefetch_dram_overhead_factor,
-				mode_lib->mp.SurfaceReadBandwidthLuma,
-				mode_lib->mp.SurfaceReadBandwidthChroma,
-				mode_lib->mp.RequiredPrefetchPixelDataBWLuma,
-				mode_lib->mp.RequiredPrefetchPixelDataBWChroma,
-				mode_lib->mp.cursor_bw,
-				mode_lib->mp.dpte_row_bw,
-				mode_lib->mp.meta_row_bw,
-				mode_lib->mp.prefetch_cursor_bw,
-				mode_lib->mp.prefetch_vmrow_bw,
-				mode_lib->mp.final_flip_bw,
-				mode_lib->mp.UrgentBurstFactorLuma,
-				mode_lib->mp.UrgentBurstFactorChroma,
-				mode_lib->mp.UrgentBurstFactorCursor,
-				mode_lib->mp.UrgentBurstFactorLumaPre,
-				mode_lib->mp.UrgentBurstFactorChromaPre,
-				mode_lib->mp.UrgentBurstFactorCursorPre);
+			calculate_peak_bandwidth_required(
+					&mode_lib->scratch,
+					calculate_peak_bandwidth_params);
 
 			calculate_immediate_flip_bandwidth_support(
 				&mode_lib->mp.FractionOfUrgentBandwidthImmediateFlip, // double* frac_urg_bandwidth_flip
@@ -10603,7 +11089,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
 					mode_lib->mp.ImmediateFlipSupported = false;
 #ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
+					dml2_printf("DML::%s: Pipe %0d not supporing iflip!\n", __func__, k);
 #endif
 				}
 			}
@@ -10679,12 +11165,12 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		s->mmSOCParameters.SREnterPlusExitTime = mode_lib->soc.power_management_parameters.stutter_enter_plus_exit_latency_us;
 		s->mmSOCParameters.SRExitZ8Time = mode_lib->soc.power_management_parameters.z8_stutter_exit_latency_us;
 		s->mmSOCParameters.SREnterPlusExitZ8Time = mode_lib->soc.power_management_parameters.z8_stutter_enter_plus_exit_latency_us;
-		s->mmSOCParameters.USRRetrainingLatency = 0; //0; //FIXME_STAGE2
-		s->mmSOCParameters.SMNLatency = 0; //mode_lib->soc.smn_latency_us; //FIXME_STAGE2
-		s->mmSOCParameters.g6_temp_read_blackout_us = mode_lib->soc.power_management_parameters.g6_temp_read_blackout_us[mode_lib->mp.active_min_uclk_dpm_index];
+		s->mmSOCParameters.USRRetrainingLatency = 0;
+		s->mmSOCParameters.SMNLatency = 0;
+		s->mmSOCParameters.g6_temp_read_blackout_us = get_g6_temp_read_blackout_us(&mode_lib->soc, (unsigned int)(mode_lib->mp.uclk_freq_mhz * 1000), in_out_params->min_clk_index);
 
 		CalculateWatermarks_params->display_cfg = display_cfg;
-		CalculateWatermarks_params->USRRetrainingRequired = false/*FIXME_STAGE2 was: mode_lib->ms.policy.USRRetrainingRequired, no new dml2 replacement*/;
+		CalculateWatermarks_params->USRRetrainingRequired = false;
 		CalculateWatermarks_params->NumberOfActiveSurfaces = s->num_active_planes;
 		CalculateWatermarks_params->MaxLineBufferLines = mode_lib->ip.max_line_buffer_lines;
 		CalculateWatermarks_params->LineBufferSize = mode_lib->ip.line_buffer_size_bits;
@@ -11039,7 +11525,7 @@ bool dml2_core_calcs_mode_programming_ex(struct dml2_core_calcs_mode_programming
 }
 
 void dml2_core_calcs_get_dpte_row_height(
-						unsigned int                               *dpte_row_height,
+						unsigned int							   *dpte_row_height,
 						struct dml2_core_internal_display_mode_lib *mode_lib,
 						bool										is_plane1,
 						enum dml2_source_format_class				SourcePixelFormat,
@@ -11060,8 +11546,8 @@ void dml2_core_calcs_get_dpte_row_height(
 	unsigned int MacroTileWidthC;
 	unsigned int MacroTileHeightY;
 	unsigned int MacroTileHeightC;
-	bool surf_linear_128_l = 0;
-	bool surf_linear_128_c = 0;
+	bool surf_linear_128_l;
+	bool surf_linear_128_c;
 
 	CalculateBytePerPixelAndBlockSizes(
 		SourcePixelFormat,
@@ -11198,7 +11684,7 @@ static unsigned int log_and_substract_if_non_zero(unsigned int a, unsigned int s
 	if (a == 0)
 		return 0;
 
-	return (unsigned int)(math_log2((float)a) - subtrahend);
+	return (math_log2_approx(a) - subtrahend);
 }
 
 void dml2_core_calcs_cursor_dlg_reg(struct dml2_cursor_dlg_regs *cursor_dlg_regs, const struct dml2_get_cursor_dlg_reg *p)
@@ -11295,7 +11781,7 @@ static void rq_dlg_get_rq_reg(struct dml2_display_rq_regs *rq_regs,
 #endif
 		DML2_ASSERT(p0_pte_row_height_linear >= 8);
 
-		rq_regs->rq_regs_l.pte_row_height_linear = (unsigned int)(math_floor2(math_log2((float)p0_pte_row_height_linear), 1) - 3);
+		rq_regs->rq_regs_l.pte_row_height_linear = math_log2_approx(p0_pte_row_height_linear) - 3;
 		if (dual_plane) {
 			unsigned int p1_pte_row_height_linear = (unsigned int)(dml_get_dpte_row_height_linear_c(mode_lib, pipe_idx));
 
@@ -11305,7 +11791,7 @@ static void rq_dlg_get_rq_reg(struct dml2_display_rq_regs *rq_regs,
 			if (sw_mode == dml2_sw_linear) {
 				DML2_ASSERT(p1_pte_row_height_linear >= 8);
 			}
-			rq_regs->rq_regs_c.pte_row_height_linear = (unsigned int)(math_floor2(math_log2((float)p1_pte_row_height_linear), 1) - 3);
+			rq_regs->rq_regs_c.pte_row_height_linear = math_log2_approx(p1_pte_row_height_linear) - 3;
 		}
 	} else {
 		rq_regs->rq_regs_l.pte_row_height_linear = 0;
@@ -11690,7 +12176,7 @@ static void rq_dlg_get_arb_params(const struct dml2_display_cfg *display_cfg, co
 	arb_param->hvm_max_qos_commit_threshold = 0xf;
 	arb_param->hvm_min_req_outstand_commit_threshold = 0xa;
 	arb_param->compbuf_reserved_space_kbytes = dml_get_compbuf_reserved_space_64b(mode_lib) * 64 / 1024;
-	arb_param->compbuf_size = mode_lib->mp.CompressedBufferSizeInkByte / mode_lib->ip.config_return_buffer_segment_size_in_kbytes;
+	arb_param->compbuf_size = mode_lib->mp.CompressedBufferSizeInkByte / mode_lib->ip.compressed_buffer_segment_size_in_kbytes;
 	arb_param->allow_sdpif_rate_limit_when_cstate_req = dml_get_hw_debug5(mode_lib);
 	arb_param->dcfclk_deep_sleep_hysteresis = dml_get_dcfclk_deep_sleep_hysteresis(mode_lib);
 
@@ -11733,10 +12219,6 @@ void dml2_core_calcs_get_global_sync_programming(const struct dml2_core_internal
 
 void dml2_core_calcs_get_stream_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_per_stream_programming *out, int pipe_index)
 {
-	// out->min_clocks.dcn4.dscclk_khz = (unsigned int)(dml_get_dscclk_calculated(mode_lib, pipe_index) * 1000); // FIXME_STAGE2
-	// out->min_clocks.dcn4.dtbclk_khz = (unsigned int)(dml_get_dscclk_calculated(mode_lib, pipe_index) * 1000);
-	// out->min_clocks.dcn4.phyclk_khz = (unsigned int)(dml_get_dscclk_calculated(mode_lib, pipe_index) * 1000);
-
 	dml2_core_calcs_get_global_sync_programming(mode_lib, &out->global_sync, pipe_index);
 }
 
@@ -11903,6 +12385,8 @@ void dml2_core_calcs_get_plane_support_info(const struct dml2_display_cfg *displ
 	out->dram_change_latency_hiding_margin_in_active = (int)mode_lib->ms.VActiveLatencyHidingMargin[plane_idx];
 
 	out->active_latency_hiding_us = (int)mode_lib->ms.VActiveLatencyHidingUs[plane_idx];
+
+	out->dram_change_vactive_det_fill_delay_us = (unsigned int)math_ceil(mode_lib->ms.dram_change_vactive_det_fill_delay_us[plane_idx]);
 }
 
 void dml2_core_calcs_get_stream_support_info(const struct dml2_display_cfg *display_cfg, const struct dml2_core_internal_display_mode_lib *mode_lib, struct core_stream_support_info *out, int plane_index)
@@ -11990,7 +12474,6 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 	out->informative.mode_support_info.LinkCapacitySupport = mode_lib->ms.support.LinkCapacitySupport;
 
 	out->informative.mode_support_info.ROBSupport = mode_lib->ms.support.ROBSupport;
-	out->informative.mode_support_info.ROBUrgencyAvoidance = mode_lib->ms.support.ROBUrgencyAvoidance;
 	out->informative.mode_support_info.OutstandingRequestsSupport = mode_lib->ms.support.OutstandingRequestsSupport;
 	out->informative.mode_support_info.OutstandingRequestsUrgencyAvoidance = mode_lib->ms.support.OutstandingRequestsUrgencyAvoidance;
 	out->informative.mode_support_info.PTEBufferSizeNotExceeded = mode_lib->ms.support.PTEBufferSizeNotExceeded;
@@ -12083,7 +12566,6 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 	out->informative.qos.min_return_latency_in_dcfclk = mode_lib->mp.min_return_latency_in_dcfclk;
 	out->informative.qos.urgent_latency_us = dml_get_urgent_latency(mode_lib);
 
-	out->informative.qos.max_non_urgent_latency_us = dml_get_max_non_urgent_latency_us(mode_lib);
 	out->informative.qos.max_urgent_latency_us = dml_get_max_urgent_latency_us(mode_lib);
 	out->informative.qos.avg_non_urgent_latency_us = dml_get_avg_non_urgent_latency_us(mode_lib);
 	out->informative.qos.avg_urgent_latency_us = dml_get_avg_urgent_latency_us(mode_lib);
@@ -12266,4 +12748,21 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 			out->informative.non_optimized_mcache_allocation[k].global_mcache_ids_plane1[n] = k;
 		}
 	}
+
+	out->informative.qos.max_non_urgent_latency_us = mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles
+		/ mode_lib->mp.uclk_freq_mhz * (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->mp.FabricClock
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->mp.FabricClock
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
+
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
+			/ mode_lib->mp.non_urg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= out->informative.qos.max_non_urgent_latency_us) {
+			out->informative.misc.ROBUrgencyAvoidance = true;
+		} else {
+			out->informative.misc.ROBUrgencyAvoidance = false;
+		}
+	} else {
+		out->informative.misc.ROBUrgencyAvoidance = true;
+	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
index d1d4fe062d4e..f2e2250d28d3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
@@ -8,8 +8,6 @@
 #include "dml2_debug.h"
 #include "lib_float_math.h"
 
-#define DML2_MAX_FMT_420_BUFFER_WIDTH 4096
-
 double dml2_core_shared_div_rem(double dividend, unsigned int divisor, unsigned int *remainder)
 {
 	*remainder = ((dividend / divisor) - (int)(dividend / divisor) > 0);
@@ -372,7 +370,6 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 static void CalculateODMMode(
 	unsigned int MaximumPixelsPerLinePerDSCUnit,
 	unsigned int HActive,
-	enum dml2_output_format_class OutFormat,
 	enum dml2_output_encoder_class Output,
 	enum dml2_odm_mode ODMUse,
 	double MaxDispclk,
@@ -861,6 +858,7 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 			mode_lib->ms.support.ScaleRatioAndTapsSupport = false;
 		}
 	}
+
 	/*Source Format, Pixel Format and Scan Support Check*/
 	mode_lib->ms.support.SourceFormatPixelAndScanSupport = true;
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
@@ -1189,7 +1187,6 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 			CalculateODMMode(
 				mode_lib->ip.maximum_pixels_per_line_per_dsc_unit,
 				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
 				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder,
 				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].overrides.odm_mode,
 				mode_lib->ms.max_dispclk_freq_mhz,
@@ -1207,7 +1204,6 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 			CalculateODMMode(
 				mode_lib->ip.maximum_pixels_per_line_per_dsc_unit,
 				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
 				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder,
 				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].overrides.odm_mode,
 				mode_lib->ms.max_dispclk_freq_mhz,
@@ -1389,6 +1385,8 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
 		if (display_cfg->plane_descriptors[k].stream_index == k) {
 			s->TotalNumberOfActiveOTG = s->TotalNumberOfActiveOTG + 1;
+			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_hdmifrl)
+				s->TotalNumberOfActiveHDMIFRL = s->TotalNumberOfActiveHDMIFRL + 1;
 			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder == dml2_dp2p0) {
 				s->TotalNumberOfActiveDP2p0 = s->TotalNumberOfActiveDP2p0 + 1;
 				// FIXME_STAGE2: SW not using backend related stuff, need mapping for mst setup
@@ -1400,6 +1398,7 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 	}
 
 	mode_lib->ms.support.NumberOfOTGSupport = (s->TotalNumberOfActiveOTG <= (unsigned int)mode_lib->ip.max_num_otg);
+	mode_lib->ms.support.NumberOfHDMIFRLSupport = (s->TotalNumberOfActiveHDMIFRL <= (unsigned int)mode_lib->ip.max_num_hdmi_frl_outputs);
 	mode_lib->ms.support.NumberOfDP2p0Support = (s->TotalNumberOfActiveDP2p0 <= (unsigned int)mode_lib->ip.max_num_dp2p0_streams && s->TotalNumberOfActiveDP2p0Outputs <= (unsigned int)mode_lib->ip.max_num_dp2p0_outputs);
 
 	mode_lib->ms.support.ExceededMultistreamSlots = false;
@@ -1984,60 +1983,14 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 	dml2_printf("DML::%s: FullFrameMALLPStateMethod = %u\n", __func__, s->FullFrameMALLPStateMethod);
 	dml2_printf("DML::%s: SubViewportMALLRefreshGreaterThan120Hz = %u\n", __func__, s->SubViewportMALLRefreshGreaterThan120Hz);
 	dml2_printf("DML::%s: InvalidCombinationOfMALLUseForPState = %u\n", __func__, mode_lib->ms.support.InvalidCombinationOfMALLUseForPState);
-#endif
-
-	//Re-ordering Buffer Support Check
-
-	mode_lib->ms.support.max_non_urgent_latency_us
-		= mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
-
-	mode_lib->ms.support.max_urgent_latency_us
-		= mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
-
-	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
-		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
-			/ (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)) >= mode_lib->ms.support.max_urgent_latency_us) {
-			mode_lib->ms.support.ROBSupport = true;
-		} else {
-			mode_lib->ms.support.ROBSupport = false;
-		}
-	} else {
-		if (mode_lib->ip.rob_buffer_size_kbytes * 1024 >= mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles * mode_lib->soc.fabric_datapath_to_dcn_data_return_bytes) {
-			mode_lib->ms.support.ROBSupport = true;
-		} else {
-			mode_lib->ms.support.ROBSupport = false;
-		}
-	}
-
-#ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: in_out_params->min_clk_index = %u\n", __func__, in_out_params->min_clk_index);
 	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
 	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
-	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
-	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
+	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 #endif
 
-	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
-		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
-			/ (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)) >= mode_lib->ms.support.max_non_urgent_latency_us) {
-			mode_lib->ms.support.ROBUrgencyAvoidance = true;
-		} else {
-			mode_lib->ms.support.ROBUrgencyAvoidance = false;
-		}
-	} else {
-		mode_lib->ms.support.ROBUrgencyAvoidance = true;
-	}
-
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
 	mode_lib->ms.support.OutstandingRequestsUrgencyAvoidance = true;
 
@@ -2762,6 +2715,34 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 
 	dml2_printf("DML::%s: Done prefetch calculation\n", __func__);
 
+	//Re-ordering Buffer Support Check
+	mode_lib->ms.support.max_urgent_latency_us
+		= mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
+
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
+			/ mode_lib->ms.support.non_urg_bandwidth_required_flip[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= mode_lib->ms.support.max_urgent_latency_us) {
+			mode_lib->ms.support.ROBSupport = true;
+		} else {
+			mode_lib->ms.support.ROBSupport = false;
+		}
+	} else {
+		if (mode_lib->ip.rob_buffer_size_kbytes * 1024 >= mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles * mode_lib->soc.fabric_datapath_to_dcn_data_return_bytes) {
+			mode_lib->ms.support.ROBSupport = true;
+		} else {
+			mode_lib->ms.support.ROBSupport = false;
+		}
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
+	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
+#endif
+
 	/*Mode Support, Voltage State and SOC Configuration*/
 	{
 		// s->dram_clock_change_support = 1;
@@ -2790,7 +2771,6 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 			&& !mode_lib->ms.support.DTBCLKRequiredMoreThanSupported
 			&& !mode_lib->ms.support.InvalidCombinationOfMALLUseForPState
 			&& mode_lib->ms.support.ROBSupport
-			&& mode_lib->ms.support.ROBUrgencyAvoidance
 			&& mode_lib->ms.support.OutstandingRequestsSupport
 			&& mode_lib->ms.support.OutstandingRequestsUrgencyAvoidance
 			&& mode_lib->ms.support.DISPCLK_DPPCLK_Support
@@ -2937,8 +2917,6 @@ static void dml2_print_dml_mode_support_info(const struct dml2_core_internal_mod
 		dml2_printf("DML: support: LinkCapacitySupport = 0x%x\n", support->LinkCapacitySupport);
 	if (!fail_only || support->ROBSupport == 0)
 		dml2_printf("DML: support: ROBSupport = %d\n", support->ROBSupport);
-	if (!fail_only || support->ROBUrgencyAvoidance == 0)
-		dml2_printf("DML: support: ROBUrgencyAvoidance = %d\n", support->ROBUrgencyAvoidance);
 	if (!fail_only || support->OutstandingRequestsSupport == 0)
 		dml2_printf("DML: support: OutstandingRequestsSupport = %d\n", support->OutstandingRequestsSupport);
 	if (!fail_only || support->OutstandingRequestsUrgencyAvoidance == 0)
@@ -5574,7 +5552,7 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 {
 	struct dml2_core_calcs_CalculateVMRowAndSwath_locals *s = &scratch->CalculateVMRowAndSwath_locals;
 
-	s->HostVMDynamicLevels = CalculateHostVMDynamicLevels(p->display_cfg->gpuvm_enable, p->display_cfg->hostvm_enable, p->HostVMMinPageSize, p->display_cfg->hostvm_max_page_table_levels);
+	s->HostVMDynamicLevels = CalculateHostVMDynamicLevels(p->display_cfg->gpuvm_enable, p->display_cfg->hostvm_enable, p->HostVMMinPageSize, p->display_cfg->hostvm_max_non_cached_page_table_levels);
 
 	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
 		if (p->display_cfg->hostvm_enable == true) {
@@ -6093,9 +6071,6 @@ static void calculate_cursor_req_attributes(
 	dml2_printf("DML::%s: cursor_bytes = %d\n", __func__, *cursor_bytes);
 	dml2_printf("DML::%s: cursor_pitch = %d\n", __func__, cursor_pitch);
 #endif
-
-	// register CURSOR_PITCH = math_log2(cursor_pitch) - 6;
-	// register CURSOR_LINES_PER_CHUNK = math_log2(*cursor_lines_per_chunk);
 }
 
 static void calculate_cursor_urgent_burst_factor(
@@ -6576,7 +6551,6 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 static void CalculateODMMode(
 	unsigned int MaximumPixelsPerLinePerDSCUnit,
 	unsigned int HActive,
-	enum dml2_output_format_class OutFormat,
 	enum dml2_output_encoder_class Output,
 	enum dml2_odm_mode ODMUse,
 	double MaxDispclk,
@@ -6602,23 +6576,6 @@ static void CalculateODMMode(
 	SurfaceRequiredDISPCLKWithODMCombineFourToOne = CalculateRequiredDispclk(dml2_odm_mode_combine_4to1, PixelClock);
 	*TotalAvailablePipesSupport = true;
 
-	if (OutFormat == dml2_420) {
-		if (HActive > 4 * DML2_MAX_FMT_420_BUFFER_WIDTH)
-			*TotalAvailablePipesSupport = false;
-		else if (HActive > 3 * DML2_MAX_FMT_420_BUFFER_WIDTH)
-			ODMUse = dml2_odm_mode_combine_4to1;
-		else if (HActive > 2 * DML2_MAX_FMT_420_BUFFER_WIDTH)
-			ODMUse = dml2_odm_mode_combine_3to1;
-		else if (HActive > DML2_MAX_FMT_420_BUFFER_WIDTH)
-			ODMUse = dml2_odm_mode_combine_2to1;
-		if (Output == dml2_hdmi && ODMUse == dml2_odm_mode_combine_2to1)
-			*TotalAvailablePipesSupport = false;
-		if (Output == dml2_hdmi && ODMUse == dml2_odm_mode_combine_3to1)
-			*TotalAvailablePipesSupport = false;
-		if (Output == dml2_hdmi && ODMUse == dml2_odm_mode_combine_4to1)
-			*TotalAvailablePipesSupport = false;
-	}
-
 	if (ODMUse == dml2_odm_mode_bypass || ODMUse == dml2_odm_mode_auto)
 		*ODMMode = dml2_odm_mode_bypass;
 	else if (ODMUse == dml2_odm_mode_combine_2to1)
@@ -7176,9 +7133,9 @@ static void calculate_tdlut_setting(
 
 	if (p->tdlut_addressing_mode == dml2_tdlut_simple_linear) {
 		if (p->tdlut_width_mode == dml2_tdlut_width_17_cube)
-		    tdlut_width = 4916;
+			tdlut_width = 4916;
 		else
-		    tdlut_width = 35940;
+			tdlut_width = 35940;
 	} else {
 		if (p->tdlut_width_mode == dml2_tdlut_width_17_cube)
 			tdlut_width = 17;
@@ -7268,7 +7225,7 @@ static void CalculateTarb(
 {
 	double extra_bytes = 0;
 	double extra_bytes_prefetch = 0;
-	double HostVMDynamicLevels = CalculateHostVMDynamicLevels(display_cfg->gpuvm_enable, display_cfg->hostvm_enable, HostVMMinPageSize, display_cfg->hostvm_max_page_table_levels);
+	double HostVMDynamicLevels = CalculateHostVMDynamicLevels(display_cfg->gpuvm_enable, display_cfg->hostvm_enable, HostVMMinPageSize, display_cfg->hostvm_max_non_cached_page_table_levels);
 
 	for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
 		extra_bytes = extra_bytes + (NumberOfDPP[k] * PixelChunkSizeInKByte * 1024);
@@ -7608,7 +7565,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->TWait_p = p->TWait - p->Ttrip; // TWait includes max(Turg, Ttrip)
 
 	if (p->display_cfg->gpuvm_enable == true && p->display_cfg->hostvm_enable == true) {
-		s->HostVMDynamicLevelsTrips = p->display_cfg->hostvm_max_page_table_levels;
+		s->HostVMDynamicLevelsTrips = p->display_cfg->hostvm_max_non_cached_page_table_levels;
 	} else {
 		s->HostVMDynamicLevelsTrips = 0;
 	}
@@ -8174,7 +8131,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
 		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
 		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
-		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
+		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
 		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
 		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
 		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
@@ -9871,24 +9828,32 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
 	mode_lib->mp.active_min_uclk_dpm_index = get_active_min_uclk_dpm_index(programming->min_clocks.dcn4.active.uclk_khz, &mode_lib->soc.clk_table);
 
 	for (k = 0; k < s->num_active_planes; ++k) {
-		switch (cfg_support_info->stream_support_info[display_cfg->plane_descriptors[k].stream_index].odms_used) {
+		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
+		dml2_assert(cfg_support_info->stream_support_info[stream_index].odms_used <= 4);
+		dml2_assert(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 4 ||
+					cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 2 ||
+					cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 1);
+
+		if (cfg_support_info->stream_support_info[stream_index].odms_used > 1)
+			dml2_assert(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 1);
+
+		switch (cfg_support_info->stream_support_info[stream_index].odms_used) {
 		case (4):
-			if (cfg_support_info->plane_support_info[k].dpps_used == 1)
-				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to2; // FIXME_STAGE2: for mode programming same as dml2_odm_mode_split_1to2?
-			else
-				mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_4to1;
+			mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_4to1;
 			break;
 		case (3):
 			mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_3to1;
 			break;
 		case (2):
-			if (cfg_support_info->plane_support_info[k].dpps_used == 1)
-				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to4;
-			else
-				mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_2to1;
+			mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_2to1;
 			break;
 		default:
-			mode_lib->mp.ODMMode[k] = dml2_odm_mode_bypass;
+			if (cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 4)
+				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to4;
+			else if (cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 2)
+				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to2;
+			else
+				mode_lib->mp.ODMMode[k] = dml2_odm_mode_bypass;
 			break;
 		}
 	}
@@ -10994,7 +10959,7 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
 				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
 					mode_lib->mp.ImmediateFlipSupported = false;
 #ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
+					dml2_printf("DML::%s: Pipe %0d not supporing iflip!\n", __func__, k);
 #endif
 				}
 			}
@@ -11453,7 +11418,7 @@ static unsigned int log_and_substract_if_non_zero(unsigned int a, unsigned int s
 	if (a == 0)
 		return 0;
 
-	return (unsigned int)(math_log2((float)a) - subtrahend);
+	return (math_log2_approx(a) - subtrahend);
 }
 
 void dml2_core_shared_cursor_dlg_reg(struct dml2_cursor_dlg_regs *cursor_dlg_regs, const struct dml2_get_cursor_dlg_reg *p)
@@ -11545,7 +11510,7 @@ static void rq_dlg_get_rq_reg(struct dml2_display_rq_regs *rq_regs,
 #endif
 		DML2_ASSERT(p0_pte_row_height_linear >= 8);
 
-		rq_regs->rq_regs_l.pte_row_height_linear = (unsigned int)(math_floor2(math_log2((float)p0_pte_row_height_linear), 1) - 3);
+		rq_regs->rq_regs_l.pte_row_height_linear = math_log2_approx(p0_pte_row_height_linear) - 3;
 		if (dual_plane) {
 			unsigned int p1_pte_row_height_linear = (unsigned int)(mode_lib->mp.dpte_row_height_linear_chroma[mode_lib->mp.pipe_plane[pipe_idx]]);
 #ifdef __DML_VBA_DEBUG__
@@ -11555,7 +11520,7 @@ static void rq_dlg_get_rq_reg(struct dml2_display_rq_regs *rq_regs,
 				DML2_ASSERT(p1_pte_row_height_linear >= 8);
 			}
 
-			rq_regs->rq_regs_c.pte_row_height_linear = (unsigned int)(math_floor2(math_log2((float)p1_pte_row_height_linear), 1) - 3);
+			rq_regs->rq_regs_c.pte_row_height_linear = math_log2_approx(p1_pte_row_height_linear) - 3;
 		}
 	} else {
 		rq_regs->rq_regs_l.pte_row_height_linear = 0;
@@ -12119,7 +12084,6 @@ void dml2_core_shared_get_informative(const struct dml2_core_internal_display_mo
 	out->informative.mode_support_info.LinkCapacitySupport = mode_lib->ms.support.LinkCapacitySupport;
 
 	out->informative.mode_support_info.ROBSupport = mode_lib->ms.support.ROBSupport;
-	out->informative.mode_support_info.ROBUrgencyAvoidance = mode_lib->ms.support.ROBUrgencyAvoidance;
 	out->informative.mode_support_info.OutstandingRequestsSupport = mode_lib->ms.support.OutstandingRequestsSupport;
 	out->informative.mode_support_info.OutstandingRequestsUrgencyAvoidance = mode_lib->ms.support.OutstandingRequestsUrgencyAvoidance;
 	out->informative.mode_support_info.PTEBufferSizeNotExceeded = mode_lib->ms.support.PTEBufferSizeNotExceeded;
@@ -12211,7 +12175,6 @@ void dml2_core_shared_get_informative(const struct dml2_core_internal_display_mo
 	out->informative.qos.min_return_latency_in_dcfclk = mode_lib->mp.min_return_latency_in_dcfclk;
 	out->informative.qos.urgent_latency_us = mode_lib->mp.UrgentLatency;
 
-	out->informative.qos.max_non_urgent_latency_us = mode_lib->ms.support.max_non_urgent_latency_us;
 	out->informative.qos.max_urgent_latency_us = mode_lib->ms.support.max_urgent_latency_us;
 	out->informative.qos.avg_non_urgent_latency_us = mode_lib->ms.support.avg_non_urgent_latency_us;
 	out->informative.qos.avg_urgent_latency_us = mode_lib->ms.support.avg_urgent_latency_us;
@@ -12408,4 +12371,21 @@ void dml2_core_shared_get_informative(const struct dml2_core_internal_display_mo
 			out->informative.non_optimized_mcache_allocation[k].global_mcache_ids_plane1[n] = k;
 		}
 	}
+
+	out->informative.qos.max_non_urgent_latency_us = mode_lib->soc.qos_parameters.qos_params.dcn4.per_uclk_dpm_params[mode_lib->mp.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles
+		/ mode_lib->mp.uclk_freq_mhz * (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.umc_max_latency_margin / 100.0)
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4.mall_overhead_fclk_cycles / mode_lib->mp.FabricClock
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->mp.FabricClock
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4.fabric_max_transport_latency_margin / 100.0);
+
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4) {
+		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
+			/ mode_lib->mp.non_urg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= out->informative.qos.max_non_urgent_latency_us) {
+			out->informative.misc.ROBUrgencyAvoidance = true;
+		} else {
+			out->informative.misc.ROBUrgencyAvoidance = false;
+		}
+	} else {
+		out->informative.misc.ROBUrgencyAvoidance = true;
+	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
index 240835159531..1343b744eeb3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
@@ -73,7 +73,6 @@ struct dml2_core_ip_params {
 	unsigned int subvp_swath_height_margin_lines;
 	unsigned int subvp_fw_processing_delay_us;
 	unsigned int subvp_pstate_allow_width_us;
-	double max_vactive_det_fill_delay_us;
 
 	// MRQ
 	bool dcn_mrq_present;
@@ -207,6 +206,7 @@ struct dml2_core_internal_mode_support_info {
 	bool ScaleRatioAndTapsSupport;
 	bool SourceFormatPixelAndScanSupport;
 	bool P2IWith420;
+	bool DSCSlicesODMModeSupported;
 	bool DSCOnlyIfNecessaryWithBPP;
 	bool DSC422NativeNotSupported;
 	bool LinkRateDoesNotMatchDPVersion;
@@ -238,7 +238,6 @@ struct dml2_core_internal_mode_support_info {
 	bool LinkCapacitySupport;
 
 	bool ROBSupport;
-	bool ROBUrgencyAvoidance;
 	bool OutstandingRequestsSupport;
 	bool OutstandingRequestsUrgencyAvoidance;
 
@@ -301,6 +300,7 @@ struct dml2_core_internal_mode_support_info {
 	double avg_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max];
 	double urg_vactive_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // active bandwidth, scaled by urg burst factor
 	double urg_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // include vm, prefetch, active bandwidth, scaled by urg burst factor
+	double urg_bandwidth_required_qual[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // include vm, prefetch, active bandwidth, scaled by urg burst factor, use qual_row_bw
 	double urg_bandwidth_required_flip[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // include vm, prefetch, active bandwidth + flip
 
 	double non_urg_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // same as urg_bandwidth, except not scaled by urg burst factor
@@ -308,7 +308,6 @@ struct dml2_core_internal_mode_support_info {
 
 	bool avg_bandwidth_support_ok[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max];
 
-	double max_non_urgent_latency_us;
 	double max_urgent_latency_us;
 	double avg_non_urgent_latency_us;
 	double avg_urgent_latency_us;
@@ -480,6 +479,10 @@ struct dml2_core_internal_mode_support {
 	double meta_row_bw[DML2_MAX_PLANES];
 	unsigned int meta_row_bytes[DML2_MAX_PLANES];
 	double dpte_row_bw[DML2_MAX_PLANES];
+	double excess_vactive_fill_bw_l[DML2_MAX_PLANES];
+	double excess_vactive_fill_bw_c[DML2_MAX_PLANES];
+	double surface_avg_vactive_required_bw[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max][DML2_MAX_PLANES];
+	double surface_peak_required_bw[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max][DML2_MAX_PLANES];
 
 	// Something that should be feedback to caller
 	enum dml2_odm_mode ODMMode[DML2_MAX_PLANES];
@@ -503,6 +506,7 @@ struct dml2_core_internal_mode_support {
 	double VActiveLatencyHidingMargin[DML2_MAX_PLANES];
 	double VActiveLatencyHidingUs[DML2_MAX_PLANES];
 	unsigned int MaxVStartupLines[DML2_MAX_PLANES];
+	double dram_change_vactive_det_fill_delay_us[DML2_MAX_PLANES];
 
 	unsigned int num_mcaches_l[DML2_MAX_PLANES];
 	unsigned int mcache_row_bytes_l[DML2_MAX_PLANES];
@@ -557,6 +561,8 @@ struct dml2_core_internal_mode_program {
 	unsigned int SwathWidthSingleDPPC[DML2_MAX_PLANES];
 	double SurfaceReadBandwidthLuma[DML2_MAX_PLANES];
 	double SurfaceReadBandwidthChroma[DML2_MAX_PLANES];
+	double excess_vactive_fill_bw_l[DML2_MAX_PLANES];
+	double excess_vactive_fill_bw_c[DML2_MAX_PLANES];
 
 	unsigned int PixelPTEBytesPerRow[DML2_MAX_PLANES];
 	unsigned int vm_bytes[DML2_MAX_PLANES];
@@ -798,6 +804,7 @@ struct dml2_core_internal_mode_program {
 
 	double urg_vactive_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // active bandwidth, scaled by urg burst factor
 	double urg_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // include vm, prefetch, active bandwidth, scaled by urg burst factor
+	double urg_bandwidth_required_qual[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // include vm, prefetch, active bandwidth, scaled by urg burst factor, use qual_row_bw
 	double urg_bandwidth_required_flip[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // include vm, prefetch, active bandwidth + flip
 	double non_urg_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max]; // same as urg_bandwidth, except not scaled by urg burst factor
 	double non_urg_bandwidth_required_flip[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max];
@@ -853,8 +860,12 @@ struct dml2_core_calcs_mode_support_locals {
 
 	unsigned int meta_row_height_luma[DML2_MAX_PLANES];
 	unsigned int meta_row_height_chroma[DML2_MAX_PLANES];
+	unsigned int meta_row_bytes_per_row_ub_l[DML2_MAX_PLANES];
+	unsigned int meta_row_bytes_per_row_ub_c[DML2_MAX_PLANES];
+	unsigned int dpte_row_bytes_per_row_l[DML2_MAX_PLANES];
+	unsigned int dpte_row_bytes_per_row_c[DML2_MAX_PLANES];
 
-	bool dummy_boolean[3];
+	bool dummy_boolean[2];
 	unsigned int dummy_integer[3];
 	unsigned int dummy_integer_array[36][DML2_MAX_PLANES];
 	enum dml2_odm_mode dummy_odm_mode[DML2_MAX_PLANES];
@@ -863,6 +874,7 @@ struct dml2_core_calcs_mode_support_locals {
 	double dummy_single_array[DML2_MAX_PLANES];
 	struct dml2_core_internal_watermarks dummy_watermark;
 	double dummy_bw[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max];
+	double surface_dummy_bw[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max][DML2_MAX_PLANES];
 
 	unsigned int MaximumVStartup[DML2_MAX_PLANES];
 	unsigned int DSTYAfterScaler[DML2_MAX_PLANES];
@@ -934,6 +946,10 @@ struct dml2_core_calcs_mode_support_locals {
 	unsigned int cursor_bytes_per_line[DML2_MAX_PLANES];
 	unsigned int cursor_lines_per_chunk[DML2_MAX_PLANES];
 	unsigned int cursor_bytes[DML2_MAX_PLANES];
+	bool stream_visited[DML2_MAX_PLANES];
+
+	unsigned int pstate_bytes_required_l[DML2_MAX_PLANES];
+	unsigned int pstate_bytes_required_c[DML2_MAX_PLANES];
 };
 
 struct dml2_core_calcs_mode_programming_locals {
@@ -946,6 +962,8 @@ struct dml2_core_calcs_mode_programming_locals {
 	double SOCCLK; /// <brief Basically just the clock freq at the min (or given) state
 
 	double dummy_bw[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max];
+	double surface_dummy_bw[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max][DML2_MAX_PLANES];
+	double surface_dummy_bw0[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max][DML2_MAX_PLANES];
 	unsigned int dummy_integer_array[2][DML2_MAX_PLANES];
 	enum dml2_output_encoder_class dummy_output_encoder_array[DML2_MAX_PLANES];
 	double dummy_single_array[2][DML2_MAX_PLANES];
@@ -984,6 +1002,11 @@ struct dml2_core_calcs_mode_programming_locals {
 	unsigned int full_swath_bytes_l[DML2_MAX_PLANES];
 	unsigned int full_swath_bytes_c[DML2_MAX_PLANES];
 
+	unsigned int meta_row_bytes_per_row_ub_l[DML2_MAX_PLANES];
+	unsigned int meta_row_bytes_per_row_ub_c[DML2_MAX_PLANES];
+	unsigned int dpte_row_bytes_per_row_l[DML2_MAX_PLANES];
+	unsigned int dpte_row_bytes_per_row_c[DML2_MAX_PLANES];
+
 	unsigned int tdlut_pte_bytes_per_frame[DML2_MAX_PLANES];
 	unsigned int tdlut_bytes_per_frame[DML2_MAX_PLANES];
 	unsigned int tdlut_row_bytes[DML2_MAX_PLANES];
@@ -1004,6 +1027,9 @@ struct dml2_core_calcs_mode_programming_locals {
 	double Tvm_trips_flip_rounded[DML2_MAX_PLANES];
 	double Tr0_trips_flip_rounded[DML2_MAX_PLANES];
 	unsigned int per_pipe_flip_bytes[DML2_MAX_PLANES];
+
+	unsigned int pstate_bytes_required_l[DML2_MAX_PLANES];
+	unsigned int pstate_bytes_required_c[DML2_MAX_PLANES];
 };
 
 struct dml2_core_calcs_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_locals {
@@ -1113,6 +1139,8 @@ struct dml2_core_calcs_CalculateVMRowAndSwath_params {
 	unsigned int *MaxNumSwathC;
 	double *dpte_row_bw;
 	unsigned int *PixelPTEBytesPerRow;
+	unsigned int *dpte_row_bytes_per_row_l;
+	unsigned int *dpte_row_bytes_per_row_c;
 	unsigned int *vm_bytes;
 	bool *use_one_row_for_frame;
 	bool *use_one_row_for_frame_flip;
@@ -1134,6 +1162,8 @@ struct dml2_core_calcs_CalculateVMRowAndSwath_params {
 	unsigned int *meta_pte_bytes_per_frame_ub_c;
 	double *meta_row_bw;
 	unsigned int *meta_row_bytes;
+	unsigned int *meta_row_bytes_per_row_ub_l;
+	unsigned int *meta_row_bytes_per_row_ub_c;
 };
 
 struct dml2_core_calcs_CalculatePrefetchSchedule_locals {
@@ -1307,6 +1337,7 @@ struct dml2_core_shared_get_urgent_bandwidth_required_locals {
 struct dml2_core_shared_calculate_peak_bandwidth_required_locals {
 	double unity_array[DML2_MAX_PLANES];
 	double zero_array[DML2_MAX_PLANES];
+	double surface_dummy_bw[DML2_MAX_PLANES];
 };
 
 struct dml2_core_shared_CalculateFlipSchedule_locals {
@@ -1588,6 +1619,7 @@ struct dml2_core_calcs_CalculateStutterEfficiency_locals {
 	double TotalZeroSizeCompressedReadBandwidth;
 	double AverageDCCZeroSizeFraction;
 	double AverageZeroSizeCompressionRate;
+	bool stream_visited[DML2_MAX_PLANES];
 };
 
 struct dml2_core_calcs_CalculateStutterEfficiency_params {
@@ -1870,6 +1902,73 @@ struct dml2_core_calcs_calculate_tdlut_setting_params {
 	unsigned int *tdlut_bytes_per_group;
 };
 
+struct dml2_core_calcs_calculate_peak_bandwidth_required_params {
+	// output
+	double (*urg_vactive_bandwidth_required)[dml2_core_internal_bw_max];
+	double (*urg_bandwidth_required)[dml2_core_internal_bw_max];
+	double (*urg_bandwidth_required_qual)[dml2_core_internal_bw_max];
+	double (*non_urg_bandwidth_required)[dml2_core_internal_bw_max];
+	double (*surface_avg_vactive_required_bw)[dml2_core_internal_bw_max][DML2_MAX_PLANES];
+	double (*surface_peak_required_bw)[dml2_core_internal_bw_max][DML2_MAX_PLANES];
+
+	// input
+	const struct dml2_display_cfg *display_cfg;
+	bool inc_flip_bw;
+	unsigned int num_active_planes;
+	unsigned int *num_of_dpp;
+	double *dcc_dram_bw_nom_overhead_factor_p0;
+	double *dcc_dram_bw_nom_overhead_factor_p1;
+	double *dcc_dram_bw_pref_overhead_factor_p0;
+	double *dcc_dram_bw_pref_overhead_factor_p1;
+	double *mall_prefetch_sdp_overhead_factor;
+	double *mall_prefetch_dram_overhead_factor;
+	double *surface_read_bandwidth_l;
+	double *surface_read_bandwidth_c;
+	double *prefetch_bandwidth_l;
+	double *prefetch_bandwidth_c;
+	double *excess_vactive_fill_bw_l;
+	double *excess_vactive_fill_bw_c;
+	double *cursor_bw;
+	double *dpte_row_bw;
+	double *meta_row_bw;
+	double *prefetch_cursor_bw;
+	double *prefetch_vmrow_bw;
+	double *flip_bw;
+	double *urgent_burst_factor_l;
+	double *urgent_burst_factor_c;
+	double *urgent_burst_factor_cursor;
+	double *urgent_burst_factor_prefetch_l;
+	double *urgent_burst_factor_prefetch_c;
+	double *urgent_burst_factor_prefetch_cursor;
+};
+
+struct dml2_core_calcs_calculate_bytes_to_fetch_required_to_hide_latency_params {
+	/* inputs */
+	const struct dml2_display_cfg *display_cfg;
+	bool mrq_present;
+	unsigned int num_active_planes;
+	unsigned int *num_of_dpp;
+	unsigned int *meta_row_height_l;
+	unsigned int *meta_row_height_c;
+	unsigned int *meta_row_bytes_per_row_ub_l;
+	unsigned int *meta_row_bytes_per_row_ub_c;
+	unsigned int *dpte_row_height_l;
+	unsigned int *dpte_row_height_c;
+	unsigned int *dpte_bytes_per_row_l;
+	unsigned int *dpte_bytes_per_row_c;
+	unsigned int *byte_per_pix_l;
+	unsigned int *byte_per_pix_c;
+	unsigned int *swath_width_l;
+	unsigned int *swath_width_c;
+	unsigned int *swath_height_l;
+	unsigned int *swath_height_c;
+	double latency_to_hide_us;
+
+	/* outputs */
+	unsigned int *bytes_required_l;
+	unsigned int *bytes_required_c;
+};
+
 // A list of overridable function pointers in the core
 // shared calculation library.
 struct dml2_core_shared_calculation_funcs {
@@ -1903,6 +2002,8 @@ struct dml2_core_internal_scratch {
 	struct dml2_core_shared_calculate_vm_and_row_bytes_params calculate_vm_and_row_bytes_params;
 	struct dml2_core_shared_calculate_mcache_setting_locals calculate_mcache_setting_locals;
 	struct dml2_core_shared_CalculateMetaAndPTETimes_params CalculateMetaAndPTETimes_params;
+	struct dml2_core_calcs_calculate_peak_bandwidth_required_params calculate_peak_bandwidth_params;
+	struct dml2_core_calcs_calculate_bytes_to_fetch_required_to_hide_latency_params calculate_bytes_to_fetch_required_to_hide_latency_params;
 };
 
 //struct dml2_svp_mode_override;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
index 65eb0187e965..c94c4f32c957 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
@@ -58,7 +58,10 @@ static void calculate_system_active_minimums(struct dml2_dpmm_map_mode_to_soc_dp
 	min_uclk_avg = (double)min_uclk_avg / ((double)in_out->soc_bb->qos_parameters.derate_table.system_active_average.dram_derate_percent_pixel / 100);
 
 	min_uclk_urgent = dram_bw_kbps_to_uclk_khz(mode_support_result->global.active.urgent_bw_dram_kbps, &in_out->soc_bb->clk_table.dram_config);
-	min_uclk_urgent = (double)min_uclk_urgent / ((double)in_out->soc_bb->qos_parameters.derate_table.system_active_urgent.dram_derate_percent_pixel / 100);
+	if (in_out->display_cfg->display_config.hostvm_enable)
+		min_uclk_urgent = (double)min_uclk_urgent / ((double)in_out->soc_bb->qos_parameters.derate_table.system_active_urgent.dram_derate_percent_pixel_and_vm / 100);
+	else
+		min_uclk_urgent = (double)min_uclk_urgent / ((double)in_out->soc_bb->qos_parameters.derate_table.system_active_urgent.dram_derate_percent_pixel / 100);
 
 	min_uclk_bw = min_uclk_urgent > min_uclk_avg ? min_uclk_urgent : min_uclk_avg;
 
@@ -226,13 +229,9 @@ static bool round_up_to_next_dpm(unsigned long *clock_value, const struct dml2_c
 	return round_up_and_copy_to_next_dpm(*clock_value, clock_value, clock_table);
 }
 
-static bool map_min_clocks_to_dpm(const struct dml2_core_mode_support_result *mode_support_result, struct dml2_display_cfg_programming *display_cfg, const struct dml2_soc_state_table *state_table)
+static bool map_soc_min_clocks_to_dpm_fine_grained(struct dml2_display_cfg_programming *display_cfg, const struct dml2_soc_state_table *state_table)
 {
 	bool result;
-	unsigned int i;
-
-	if (!state_table || !display_cfg)
-		return false;
 
 	result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.active.dcfclk_khz, &state_table->dcfclk);
 	if (result)
@@ -254,6 +253,77 @@ static bool map_min_clocks_to_dpm(const struct dml2_core_mode_support_result *mo
 	if (result)
 		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.idle.uclk_khz, &state_table->uclk);
 
+	return result;
+}
+
+static bool map_soc_min_clocks_to_dpm_coarse_grained(struct dml2_display_cfg_programming *display_cfg, const struct dml2_soc_state_table *state_table)
+{
+	bool result;
+	int index;
+
+	result = false;
+	for (index = 0; index < state_table->uclk.num_clk_values; index++) {
+		if (display_cfg->min_clocks.dcn4.active.dcfclk_khz <= state_table->dcfclk.clk_values_khz[index] &&
+			display_cfg->min_clocks.dcn4.active.fclk_khz <= state_table->fclk.clk_values_khz[index] &&
+			display_cfg->min_clocks.dcn4.active.uclk_khz <= state_table->uclk.clk_values_khz[index]) {
+			display_cfg->min_clocks.dcn4.active.dcfclk_khz = state_table->dcfclk.clk_values_khz[index];
+			display_cfg->min_clocks.dcn4.active.fclk_khz = state_table->fclk.clk_values_khz[index];
+			display_cfg->min_clocks.dcn4.active.uclk_khz = state_table->uclk.clk_values_khz[index];
+			result = true;
+			break;
+		}
+	}
+
+	if (result) {
+		result = false;
+		for (index = 0; index < state_table->uclk.num_clk_values; index++) {
+			if (display_cfg->min_clocks.dcn4.idle.dcfclk_khz <= state_table->dcfclk.clk_values_khz[index] &&
+				display_cfg->min_clocks.dcn4.idle.fclk_khz <= state_table->fclk.clk_values_khz[index] &&
+				display_cfg->min_clocks.dcn4.idle.uclk_khz <= state_table->uclk.clk_values_khz[index]) {
+				display_cfg->min_clocks.dcn4.idle.dcfclk_khz = state_table->dcfclk.clk_values_khz[index];
+				display_cfg->min_clocks.dcn4.idle.fclk_khz = state_table->fclk.clk_values_khz[index];
+				display_cfg->min_clocks.dcn4.idle.uclk_khz = state_table->uclk.clk_values_khz[index];
+				result = true;
+				break;
+			}
+		}
+	}
+
+	// SVP is not supported on any coarse grained SoCs
+	display_cfg->min_clocks.dcn4.svp_prefetch.dcfclk_khz = 0;
+	display_cfg->min_clocks.dcn4.svp_prefetch.fclk_khz = 0;
+	display_cfg->min_clocks.dcn4.svp_prefetch.uclk_khz = 0;
+
+	return result;
+}
+
+static bool map_min_clocks_to_dpm(const struct dml2_core_mode_support_result *mode_support_result, struct dml2_display_cfg_programming *display_cfg, const struct dml2_soc_state_table *state_table)
+{
+	bool result = false;
+	bool dcfclk_fine_grained = false, fclk_fine_grained = false, clock_state_count_identical = false;
+	unsigned int i;
+
+	if (!state_table || !display_cfg)
+		return false;
+
+	if (state_table->dcfclk.num_clk_values == 2) {
+		dcfclk_fine_grained = true;
+	}
+
+	if (state_table->fclk.num_clk_values == 2) {
+		fclk_fine_grained = true;
+	}
+
+	if (state_table->fclk.num_clk_values == state_table->dcfclk.num_clk_values &&
+		state_table->fclk.num_clk_values == state_table->uclk.num_clk_values) {
+		clock_state_count_identical = true;
+	}
+
+	if (dcfclk_fine_grained || fclk_fine_grained || !clock_state_count_identical)
+		result = map_soc_min_clocks_to_dpm_fine_grained(display_cfg, state_table);
+	else
+		result = map_soc_min_clocks_to_dpm_coarse_grained(display_cfg, state_table);
+
 	if (result)
 		result = round_up_to_next_dpm(&display_cfg->min_clocks.dcn4.dispclk_khz, &state_table->dispclk);
 
@@ -285,11 +355,11 @@ static bool map_min_clocks_to_dpm(const struct dml2_core_mode_support_result *mo
 
 static bool are_timings_trivially_synchronizable(struct dml2_display_cfg *display_config, int mask)
 {
-	unsigned int i;
+	unsigned char i;
 	bool identical = true;
 	bool contains_drr = false;
-	unsigned int remap_array[DML2_MAX_PLANES];
-	unsigned int remap_array_size = 0;
+	unsigned char remap_array[DML2_MAX_PLANES];
+	unsigned char remap_array_size = 0;
 
 	// Create a remap array to enable simple iteration through only masked stream indicies
 	for (i = 0; i < display_config->num_streams; i++) {
@@ -324,10 +394,10 @@ static bool are_timings_trivially_synchronizable(struct dml2_display_cfg *displa
 
 static int find_smallest_idle_time_in_vblank_us(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_out *in_out, int mask)
 {
-	unsigned int i;
+	unsigned char i;
 	int min_idle_us = 0;
-	unsigned int remap_array[DML2_MAX_PLANES];
-	unsigned int remap_array_size = 0;
+	unsigned char remap_array[DML2_MAX_PLANES];
+	unsigned char remap_array_size = 0;
 	const struct dml2_core_mode_support_result *mode_support_result = &in_out->display_cfg->mode_support_result;
 
 	// Create a remap array to enable simple iteration through only masked stream indicies
@@ -468,7 +538,7 @@ static bool map_mode_to_soc_dpm(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_o
 	calculate_svp_prefetch_minimums(in_out);
 	calculate_idle_minimums(in_out);
 
-	// In DCN4, there's no support for FCLK or DCFCLK DPM change before SVP prefetch starts, therefore
+	// In NV4, there's no support for FCLK or DCFCLK DPM change before SVP prefetch starts, therefore
 	// active minimums must be boosted to prefetch minimums
 	if (in_out->programming->min_clocks.dcn4.svp_prefetch.uclk_khz > in_out->programming->min_clocks.dcn4.active.uclk_khz)
 		in_out->programming->min_clocks.dcn4.active.uclk_khz = in_out->programming->min_clocks.dcn4.svp_prefetch.uclk_khz;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
index 0f67cf67e4db..657ec2e1b119 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
@@ -39,6 +39,7 @@ bool dml2_dpmm_create(enum dml2_project_id project_id, struct dml2_dpmm_instance
 		break;
 	case dml2_project_dcn4x_stage2_auto_drr_svp:
 		out->map_mode_to_soc_dpm = &dpmm_dcn4_map_mode_to_soc_dpm;
+		out->map_watermarks = &dpmm_dcn4_map_watermarks;
 		result = true;
 		break;
 	case dml2_project_invalid:
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c
index f544f8c460c8..5d8887ac766d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c
@@ -37,51 +37,27 @@ static unsigned long round_up_to_quantized_values(unsigned long value, const uns
 	return 0;
 }
 
-static bool build_min_clock_table(const struct dml2_soc_bb *soc_bb, struct dml2_mcg_min_clock_table *min_table)
+static bool build_min_clk_table_fine_grained(const struct dml2_soc_bb *soc_bb, struct dml2_mcg_min_clock_table *min_table)
 {
+	bool dcfclk_fine_grained = false, fclk_fine_grained = false;
+
 	int i;
 	unsigned int j;
 
-	bool dcfclk_fine_grained = false, fclk_fine_grained = false;
-	unsigned long min_dcfclk_khz = 0, max_dcfclk_khz = 0;
-	unsigned long min_fclk_khz = 0, max_fclk_khz = 0;
+	unsigned long min_dcfclk_khz = 0;
+	unsigned long min_fclk_khz = 0;
 	unsigned long prev_100, cur_50;
 
-	if (!soc_bb || !min_table)
-		return false;
-
-	if (soc_bb->clk_table.dcfclk.num_clk_values < 2 || soc_bb->clk_table.fclk.num_clk_values < 2)
-		return false;
-
-	if (soc_bb->clk_table.uclk.num_clk_values > DML_MCG_MAX_CLK_TABLE_SIZE)
-		return false;
-
-	min_table->fixed_clocks_khz.amclk = 0;
-	min_table->fixed_clocks_khz.dprefclk = soc_bb->dprefclk_mhz * 1000;
-	min_table->fixed_clocks_khz.pcierefclk = soc_bb->pcie_refclk_mhz * 1000;
-	min_table->fixed_clocks_khz.dchubrefclk = soc_bb->dchub_refclk_mhz * 1000;
-	min_table->fixed_clocks_khz.xtalclk = soc_bb->xtalclk_mhz * 1000;
-
 	if (soc_bb->clk_table.dcfclk.num_clk_values == 2) {
 		dcfclk_fine_grained = true;
 	}
-	max_dcfclk_khz = soc_bb->clk_table.dcfclk.clk_values_khz[soc_bb->clk_table.dcfclk.num_clk_values - 1];
-	min_dcfclk_khz = soc_bb->clk_table.dcfclk.clk_values_khz[0];
 
 	if (soc_bb->clk_table.fclk.num_clk_values == 2) {
 		fclk_fine_grained = true;
 	}
-	max_fclk_khz = soc_bb->clk_table.fclk.clk_values_khz[soc_bb->clk_table.fclk.num_clk_values - 1];
-	min_fclk_khz = soc_bb->clk_table.fclk.clk_values_khz[0];
-
-	min_table->max_clocks_khz.dispclk = soc_bb->clk_table.dispclk.clk_values_khz[soc_bb->clk_table.dispclk.num_clk_values - 1];
-	min_table->max_clocks_khz.dppclk = soc_bb->clk_table.dppclk.clk_values_khz[soc_bb->clk_table.dppclk.num_clk_values - 1];
-	min_table->max_clocks_khz.dscclk = soc_bb->clk_table.dscclk.clk_values_khz[soc_bb->clk_table.dscclk.num_clk_values - 1];
-	min_table->max_clocks_khz.dtbclk = soc_bb->clk_table.dtbclk.clk_values_khz[soc_bb->clk_table.dtbclk.num_clk_values - 1];
-	min_table->max_clocks_khz.phyclk = soc_bb->clk_table.phyclk.clk_values_khz[soc_bb->clk_table.phyclk.num_clk_values - 1];
 
-	min_table->max_clocks_khz.dcfclk = max_dcfclk_khz;
-	min_table->max_clocks_khz.fclk = max_fclk_khz;
+	min_dcfclk_khz = soc_bb->clk_table.dcfclk.clk_values_khz[0];
+	min_fclk_khz = soc_bb->clk_table.fclk.clk_values_khz[0];
 
 	// First calculate the table for "balanced" bandwidths across UCLK/FCLK
 	for (i = 0; i < soc_bb->clk_table.uclk.num_clk_values; i++) {
@@ -154,3 +130,66 @@ static bool build_min_clock_table(const struct dml2_soc_bb *soc_bb, struct dml2_
 
 	return true;
 }
+
+static bool build_min_clk_table_coarse_grained(const struct dml2_soc_bb *soc_bb, struct dml2_mcg_min_clock_table *min_table)
+{
+	int i;
+
+	for (i = 0; i < soc_bb->clk_table.uclk.num_clk_values; i++) {
+		min_table->dram_bw_table.entries[i].pre_derate_dram_bw_kbps = uclk_to_dram_bw_kbps(soc_bb->clk_table.uclk.clk_values_khz[i], &soc_bb->clk_table.dram_config);
+		min_table->dram_bw_table.entries[i].min_dcfclk_khz = soc_bb->clk_table.dcfclk.clk_values_khz[i];
+		min_table->dram_bw_table.entries[i].min_fclk_khz = soc_bb->clk_table.fclk.clk_values_khz[i];
+	}
+	min_table->dram_bw_table.num_entries = soc_bb->clk_table.uclk.num_clk_values;
+
+	return true;
+}
+
+static bool build_min_clock_table(const struct dml2_soc_bb *soc_bb, struct dml2_mcg_min_clock_table *min_table)
+{
+	bool result;
+	bool dcfclk_fine_grained = false, fclk_fine_grained = false, clock_state_count_equal = false;
+
+	if (!soc_bb || !min_table)
+		return false;
+
+	if (soc_bb->clk_table.dcfclk.num_clk_values < 2 || soc_bb->clk_table.fclk.num_clk_values < 2)
+		return false;
+
+	if (soc_bb->clk_table.uclk.num_clk_values > DML_MCG_MAX_CLK_TABLE_SIZE)
+		return false;
+
+	if (soc_bb->clk_table.dcfclk.num_clk_values == 2) {
+		dcfclk_fine_grained = true;
+	}
+
+	if (soc_bb->clk_table.fclk.num_clk_values == 2) {
+		fclk_fine_grained = true;
+	}
+
+	if (soc_bb->clk_table.fclk.num_clk_values == soc_bb->clk_table.dcfclk.num_clk_values &&
+		soc_bb->clk_table.fclk.num_clk_values == soc_bb->clk_table.uclk.num_clk_values)
+		clock_state_count_equal = true;
+
+	min_table->fixed_clocks_khz.amclk = 0;
+	min_table->fixed_clocks_khz.dprefclk = soc_bb->dprefclk_mhz * 1000;
+	min_table->fixed_clocks_khz.pcierefclk = soc_bb->pcie_refclk_mhz * 1000;
+	min_table->fixed_clocks_khz.dchubrefclk = soc_bb->dchub_refclk_mhz * 1000;
+	min_table->fixed_clocks_khz.xtalclk = soc_bb->xtalclk_mhz * 1000;
+
+	min_table->max_clocks_khz.dispclk = soc_bb->clk_table.dispclk.clk_values_khz[soc_bb->clk_table.dispclk.num_clk_values - 1];
+	min_table->max_clocks_khz.dppclk = soc_bb->clk_table.dppclk.clk_values_khz[soc_bb->clk_table.dppclk.num_clk_values - 1];
+	min_table->max_clocks_khz.dscclk = soc_bb->clk_table.dscclk.clk_values_khz[soc_bb->clk_table.dscclk.num_clk_values - 1];
+	min_table->max_clocks_khz.dtbclk = soc_bb->clk_table.dtbclk.clk_values_khz[soc_bb->clk_table.dtbclk.num_clk_values - 1];
+	min_table->max_clocks_khz.phyclk = soc_bb->clk_table.phyclk.clk_values_khz[soc_bb->clk_table.phyclk.num_clk_values - 1];
+
+	min_table->max_clocks_khz.dcfclk = soc_bb->clk_table.dcfclk.clk_values_khz[soc_bb->clk_table.dcfclk.num_clk_values - 1];
+	min_table->max_clocks_khz.fclk = soc_bb->clk_table.fclk.clk_values_khz[soc_bb->clk_table.fclk.num_clk_values - 1];
+
+	if (dcfclk_fine_grained || fclk_fine_grained || !clock_state_count_equal)
+		result = build_min_clk_table_fine_grained(soc_bb, min_table);
+	else
+		result = build_min_clk_table_coarse_grained(soc_bb, min_table);
+
+	return result;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h
index 2419d2dd6b3b..19d178651435 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h
@@ -11,4 +11,4 @@
 bool mcg_dcn4_build_min_clock_table(struct dml2_mcg_build_min_clock_table_params_in_out *in_out);
 bool mcg_dcn4_unit_test(void);
 
-#endif
\ No newline at end of file
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
index 7cedb191140e..671f9ac2627c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
@@ -22,6 +22,23 @@ static void sort(double *list_a, int list_a_size)
 	}
 }
 
+static double get_max_reserved_time_on_all_planes_with_stream_index(struct display_configuation_with_meta *config, unsigned int stream_index)
+{
+	struct dml2_plane_parameters *plane_descriptor;
+	long max_reserved_time_ns = 0;
+
+	for (unsigned int i = 0; i < config->display_config.num_planes; i++) {
+		plane_descriptor = &config->display_config.plane_descriptors[i];
+
+		if (plane_descriptor->stream_index == stream_index)
+			if (plane_descriptor->overrides.reserved_vblank_time_ns > max_reserved_time_ns)
+				max_reserved_time_ns = plane_descriptor->overrides.reserved_vblank_time_ns;
+	}
+
+	return (max_reserved_time_ns / 1000.0);
+}
+
+
 static void set_reserved_time_on_all_planes_with_stream_index(struct display_configuation_with_meta *config, unsigned int stream_index, double reserved_time_us)
 {
 	struct dml2_plane_parameters *plane_descriptor;
@@ -183,11 +200,11 @@ static int count_planes_with_stream_index(const struct dml2_display_cfg *display
 
 static bool are_timings_trivially_synchronizable(struct display_configuation_with_meta *display_config, int mask)
 {
-	unsigned int i;
+	unsigned char i;
 	bool identical = true;
 	bool contains_drr = false;
-	unsigned int remap_array[DML2_MAX_PLANES];
-	unsigned int remap_array_size = 0;
+	unsigned char remap_array[DML2_MAX_PLANES];
+	unsigned char remap_array_size = 0;
 
 	// Create a remap array to enable simple iteration through only masked stream indicies
 	for (i = 0; i < display_config->display_config.num_streams; i++) {
@@ -227,7 +244,7 @@ bool pmo_dcn3_initialize(struct dml2_pmo_initialize_in_out *in_out)
 	pmo->ip_caps = in_out->ip_caps;
 	pmo->mpc_combine_limit = 2;
 	pmo->odm_combine_limit = 4;
-	pmo->min_clock_table_size = in_out->min_clock_table_size;
+	pmo->mcg_clock_table_size = in_out->mcg_clock_table_size;
 
 	pmo->options = in_out->options;
 
@@ -520,7 +537,7 @@ bool pmo_dcn3_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in
 	state->performed = true;
 	state->min_clk_index_for_latency = in_out->base_display_config->stage1.min_clk_index_for_latency;
 	pmo->scratch.pmo_dcn3.min_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
-	pmo->scratch.pmo_dcn3.max_latency_index = pmo->min_clock_table_size;
+	pmo->scratch.pmo_dcn3.max_latency_index = pmo->mcg_clock_table_size - 1;
 	pmo->scratch.pmo_dcn3.cur_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
 
 	pmo->scratch.pmo_dcn3.stream_mask = 0xF;
@@ -578,6 +595,8 @@ bool pmo_dcn3_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in
 				in_out->instance->soc_bb->power_management_parameters.stutter_enter_plus_exit_latency_us);
 		*/
 
+		min_reserved_vblank_time = get_max_reserved_time_on_all_planes_with_stream_index(in_out->base_display_config, stream_index);
+
 		// Insert the absolute minimum into the array
 		candidate_count = 1;
 		pmo->scratch.pmo_dcn3.reserved_time_candidates[stream_index][0] = min_reserved_vblank_time;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
index 34d991d44e73..8952dd7e36cb 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
@@ -284,7 +284,7 @@ bool pmo_dcn4_initialize(struct dml2_pmo_initialize_in_out *in_out)
 	pmo->ip_caps = in_out->ip_caps;
 	pmo->mpc_combine_limit = 2;
 	pmo->odm_combine_limit = 4;
-	pmo->min_clock_table_size = in_out->min_clock_table_size;
+	pmo->mcg_clock_table_size = in_out->mcg_clock_table_size;
 
 	pmo->fams_params.v1.subvp.fw_processing_delay_us = 10;
 	pmo->fams_params.v1.subvp.prefetch_end_to_mall_start_us = 50;
@@ -499,11 +499,11 @@ bool pmo_dcn4_optimize_for_vmin(struct dml2_pmo_optimize_for_vmin_in_out *in_out
 
 static bool are_timings_trivially_synchronizable(const struct display_configuation_with_meta *display_config, int mask)
 {
-	unsigned int i;
+	unsigned char i;
 	bool identical = true;
 	bool contains_drr = false;
-	unsigned int remap_array[DML2_MAX_PLANES];
-	unsigned int remap_array_size = 0;
+	unsigned char remap_array[DML2_MAX_PLANES];
+	unsigned char remap_array_size = 0;
 
 	// Create a remap array to enable simple iteration through only masked stream indicies
 	for (i = 0; i < display_config->display_config.num_streams; i++) {
@@ -603,7 +603,7 @@ static bool all_planes_match_strategy(const struct display_configuation_with_met
 }
 
 static bool subvp_subvp_schedulable(struct dml2_pmo_instance *pmo, const struct display_configuation_with_meta *display_cfg,
-	unsigned int *svp_stream_indicies, int svp_stream_count)
+	unsigned char *svp_stream_indicies, char svp_stream_count)
 {
 	struct dml2_pmo_scratch *s = &pmo->scratch;
 	int i;
@@ -669,10 +669,10 @@ static bool validate_svp_cofunctionality(struct dml2_pmo_instance *pmo,
 	const struct display_configuation_with_meta *display_cfg, int svp_stream_mask)
 {
 	bool result = false;
-	unsigned int stream_index;
+	unsigned char stream_index;
 
-	unsigned int svp_stream_indicies[2] = { 0 };
-	unsigned int svp_stream_count = 0;
+	unsigned char svp_stream_indicies[2] = { 0 };
+	unsigned char svp_stream_count = 0;
 
 	// Find the SVP streams, store only the first 2, but count all of them
 	for (stream_index = 0; stream_index < display_cfg->display_config.num_streams; stream_index++) {
@@ -696,7 +696,7 @@ static bool validate_svp_cofunctionality(struct dml2_pmo_instance *pmo,
 static bool validate_drr_cofunctionality(struct dml2_pmo_instance *pmo,
 	const struct display_configuation_with_meta *display_cfg, int drr_stream_mask)
 {
-	unsigned int stream_index;
+	unsigned char stream_index;
 	int drr_stream_count = 0;
 
 	// Find the SVP streams and count all of them
@@ -712,7 +712,7 @@ static bool validate_drr_cofunctionality(struct dml2_pmo_instance *pmo,
 static bool validate_svp_drr_cofunctionality(struct dml2_pmo_instance *pmo,
 	const struct display_configuation_with_meta *display_cfg, int svp_stream_mask, int drr_stream_mask)
 {
-	unsigned int stream_index;
+	unsigned char stream_index;
 	int drr_stream_count = 0;
 	int svp_stream_count = 0;
 
@@ -781,7 +781,7 @@ static bool validate_svp_drr_cofunctionality(struct dml2_pmo_instance *pmo,
 static bool validate_svp_vblank_cofunctionality(struct dml2_pmo_instance *pmo,
 	const struct display_configuation_with_meta *display_cfg, int svp_stream_mask, int vblank_stream_mask)
 {
-	unsigned int stream_index;
+	unsigned char stream_index;
 	int vblank_stream_count = 0;
 	int svp_stream_count = 0;
 
@@ -853,7 +853,7 @@ static bool validate_pstate_support_strategy_cofunctionality(struct dml2_pmo_ins
 {
 	struct dml2_pmo_scratch *s = &pmo->scratch;
 
-	unsigned int stream_index = 0;
+	unsigned char stream_index = 0;
 
 	unsigned int svp_count = 0;
 	unsigned int svp_stream_mask = 0;
@@ -967,7 +967,7 @@ bool pmo_dcn4_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in
 	memset(s, 0, sizeof(struct dml2_pmo_scratch));
 
 	pmo->scratch.pmo_dcn4.min_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
-	pmo->scratch.pmo_dcn4.max_latency_index = pmo->min_clock_table_size;
+	pmo->scratch.pmo_dcn4.max_latency_index = pmo->mcg_clock_table_size - 1;
 	pmo->scratch.pmo_dcn4.cur_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
 
 	// First build the stream plane mask (array of bitfields indexed by stream, indicating plane mapping)
@@ -1071,7 +1071,7 @@ static void reset_display_configuration(struct display_configuation_with_meta *d
 
 static void setup_planes_for_drr_by_mask(struct display_configuation_with_meta *display_config, int plane_mask)
 {
-	unsigned int plane_index;
+	unsigned char plane_index;
 	struct dml2_plane_parameters *plane;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
@@ -1088,7 +1088,7 @@ static void setup_planes_for_drr_by_mask(struct display_configuation_with_meta *
 
 static void setup_planes_for_svp_by_mask(struct display_configuation_with_meta *display_config, int plane_mask)
 {
-	unsigned int plane_index;
+	unsigned char plane_index;
 	int stream_index = -1;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
@@ -1110,7 +1110,7 @@ static void setup_planes_for_svp_by_mask(struct display_configuation_with_meta *
 
 static void setup_planes_for_vblank_by_mask(struct display_configuation_with_meta *display_config, int plane_mask)
 {
-	unsigned int plane_index;
+	unsigned char plane_index;
 	struct dml2_plane_parameters *plane;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
@@ -1127,7 +1127,7 @@ static void setup_planes_for_vblank_by_mask(struct display_configuation_with_met
 
 static void setup_planes_for_vactive_by_mask(struct display_configuation_with_meta *display_config, int plane_mask)
 {
-	unsigned int plane_index;
+	unsigned char plane_index;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
@@ -1139,7 +1139,7 @@ static void setup_planes_for_vactive_by_mask(struct display_configuation_with_me
 static bool setup_display_config(struct display_configuation_with_meta *display_config, struct dml2_pmo_scratch *scratch, int strategy_index)
 {
 	bool success = true;
-	unsigned int stream_index;
+	unsigned char stream_index;
 
 	reset_display_configuration(display_config);
 
@@ -1164,7 +1164,7 @@ static bool setup_display_config(struct display_configuation_with_meta *display_
 static int get_minimum_reserved_time_us_for_planes(struct display_configuation_with_meta *display_config, int plane_mask)
 {
 	int min_time_us = 0xFFFFFF;
-	unsigned int plane_index = 0;
+	unsigned char plane_index = 0;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
index 214411ab46df..85c64dcefa82 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
@@ -29,8 +29,6 @@
 #include "lib_float_math.h"
 #include "dml2_pmo_dcn4_fams2.h"
 
-#define PMO_DCN4_MIN_TIME_TO_DISALLOW_MS 0.0
-
 static const double MIN_VACTIVE_MARGIN_PCT = 0.25; // We need more than non-zero margin because DET buffer granularity can alter vactive latency hiding
 
 static const enum dml2_pmo_pstate_strategy base_strategy_list_1_display[][PMO_DCN4_MAX_DISPLAYS] = {
@@ -318,7 +316,7 @@ static enum dml2_pmo_pstate_strategy convert_strategy_to_drr_variant(const enum
 	case dml2_pmo_pstate_strategy_fw_drr:
 	case dml2_pmo_pstate_strategy_reserved_hw:
 	case dml2_pmo_pstate_strategy_reserved_fw:
-	case dml2_pmo_pstate_strategy_reserved_fw_drr_fixed:
+	case dml2_pmo_pstate_strategy_reserved_fw_drr_clamped:
 	case dml2_pmo_pstate_strategy_reserved_fw_drr_var:
 	case dml2_pmo_pstate_strategy_na:
 	default:
@@ -492,13 +490,11 @@ static void expand_base_strategies(
 		expand_base_strategy(pmo, base_strategies_list[i], stream_count);
 	}
 
-	if (stream_count > 1) {
-		/* expand base strategies to DRR variants */
-		num_pre_variant_strategies = get_num_expanded_strategies(&pmo->init_data, stream_count);
-		expanded_strategy_list = get_expanded_strategy_list(&pmo->init_data, stream_count);
-		for (i = 0; i < num_pre_variant_strategies; i++) {
-			expand_variant_strategy(pmo, expanded_strategy_list[i], stream_count);
-		}
+	/* expand base strategies to DRR variants */
+	num_pre_variant_strategies = get_num_expanded_strategies(&pmo->init_data, stream_count);
+	expanded_strategy_list = get_expanded_strategy_list(&pmo->init_data, stream_count);
+	for (i = 0; i < num_pre_variant_strategies; i++) {
+		expand_variant_strategy(pmo, expanded_strategy_list[i], stream_count);
 	}
 
 	/* add back all DRR */
@@ -514,7 +510,7 @@ bool pmo_dcn4_fams2_initialize(struct dml2_pmo_initialize_in_out *in_out)
 	pmo->ip_caps = in_out->ip_caps;
 	pmo->mpc_combine_limit = 2;
 	pmo->odm_combine_limit = 4;
-	pmo->min_clock_table_size = in_out->min_clock_table_size;
+	pmo->mcg_clock_table_size = in_out->mcg_clock_table_size;
 
 	pmo->fams_params.v2.subvp.refresh_rate_limit_max = 175;
 	pmo->fams_params.v2.subvp.refresh_rate_limit_min = 0;
@@ -887,7 +883,7 @@ static bool all_timings_support_drr(const struct dml2_pmo_instance *pmo,
 			stream_descriptor = &display_config->display_config.stream_descriptors[i];
 			stream_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[i];
 
-			if (!stream_descriptor->timing.drr_config.enabled)
+			if (!stream_descriptor->timing.drr_config.enabled || stream_descriptor->overrides.disable_fams2_drr)
 				return false;
 
 			/* cannot support required vtotal */
@@ -920,7 +916,7 @@ static bool all_timings_support_svp(const struct dml2_pmo_instance *pmo,
 	const struct dml2_plane_parameters *plane_descriptor;
 	const struct dml2_fams2_meta *stream_fams2_meta;
 	unsigned int microschedule_vlines;
-	unsigned int i;
+	unsigned char i;
 
 	unsigned int num_planes_per_stream[DML2_MAX_PLANES] = { 0 };
 
@@ -1016,7 +1012,7 @@ static void build_method_scheduling_params(
 	struct dml2_fams2_meta *stream_fams2_meta)
 {
 	stream_method_fams2_meta->allow_time_us =
-			(double)(stream_method_fams2_meta->allow_end_otg_vline - stream_method_fams2_meta->allow_start_otg_vline) *
+			(double)((int)stream_method_fams2_meta->allow_end_otg_vline - (int)stream_method_fams2_meta->allow_start_otg_vline) *
 			stream_fams2_meta->otg_vline_time_us;
 	if (stream_method_fams2_meta->allow_time_us >= stream_method_fams2_meta->period_us) {
 		/* when allow wave overlaps an entire frame, it is always schedulable (DRR can do this)*/
@@ -1052,7 +1048,7 @@ static struct dml2_fams2_per_method_common_meta *get_per_method_common_meta(
 		break;
 	case dml2_pmo_pstate_strategy_reserved_hw:
 	case dml2_pmo_pstate_strategy_reserved_fw:
-	case dml2_pmo_pstate_strategy_reserved_fw_drr_fixed:
+	case dml2_pmo_pstate_strategy_reserved_fw_drr_clamped:
 	case dml2_pmo_pstate_strategy_reserved_fw_drr_var:
 	case dml2_pmo_pstate_strategy_na:
 	default:
@@ -1113,7 +1109,8 @@ static bool is_timing_group_schedulable(
 	/* calculate the rest of the meta */
 	build_method_scheduling_params(group_fams2_meta, &pmo->scratch.pmo_dcn4.stream_fams2_meta[base_stream_idx]);
 
-	return true;
+	return group_fams2_meta->allow_time_us > 0.0 &&
+			group_fams2_meta->disallow_time_us < pmo->ip_caps->fams2.max_allow_delay_us;
 }
 
 static bool is_config_schedulable(
@@ -1125,14 +1122,15 @@ static bool is_config_schedulable(
 	bool schedulable;
 	struct dml2_pmo_scratch *s = &pmo->scratch;
 
+	double max_allow_delay_us = 0.0;
+
 	memset(s->pmo_dcn4.group_common_fams2_meta, 0, sizeof(s->pmo_dcn4.group_common_fams2_meta));
 	memset(s->pmo_dcn4.sorted_group_gtl_disallow_index, 0, sizeof(unsigned int) * DML2_MAX_PLANES);
 
 	/* search for a general solution to the schedule */
 
 	/* STAGE 0: Early return for special cases */
-	if (display_cfg->display_config.num_streams <= 1) {
-		/* single stream is always schedulable */
+	if (display_cfg->display_config.num_streams == 0) {
 		return true;
 	}
 
@@ -1146,6 +1144,7 @@ static bool is_config_schedulable(
 			schedulable = false;
 			break;
 		}
+		max_allow_delay_us += s->pmo_dcn4.group_common_fams2_meta[i].disallow_time_us;
 	}
 
 	if ((schedulable && s->pmo_dcn4.num_timing_groups <= 1) || !schedulable) {
@@ -1211,7 +1210,7 @@ static bool is_config_schedulable(
 		}
 	}
 
-	if (schedulable) {
+	if (schedulable && max_allow_delay_us < pmo->ip_caps->fams2.max_allow_delay_us) {
 		return true;
 	}
 
@@ -1243,6 +1242,7 @@ static bool is_config_schedulable(
 	for (i = 0; i < s->pmo_dcn4.num_timing_groups - 1; i++) {
 		unsigned int sorted_i = s->pmo_dcn4.sorted_group_gtl_period_index[i];
 		unsigned int sorted_ip1 = s->pmo_dcn4.sorted_group_gtl_period_index[i + 1];
+
 		if (s->pmo_dcn4.group_common_fams2_meta[sorted_i].allow_time_us < s->pmo_dcn4.group_common_fams2_meta[sorted_ip1].period_us ||
 				s->pmo_dcn4.group_is_drr_enabled[sorted_ip1]) {
 			schedulable = false;
@@ -1250,38 +1250,34 @@ static bool is_config_schedulable(
 		}
 	}
 
-	/* STAGE 4: For similar frequencies, and when using HW exclusive modes, check disallow alignments are within allowed threshold */
+	if (schedulable && max_allow_delay_us < pmo->ip_caps->fams2.max_allow_delay_us) {
+		return true;
+	}
+
+	/* STAGE 4: When using HW exclusive modes, check disallow alignments are within allowed threshold */
 	if (s->pmo_dcn4.num_timing_groups == 2 &&
 			!is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, per_stream_pstate_strategy[0]) &&
 			!is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, per_stream_pstate_strategy[1])) {
-		double period_delta = s->pmo_dcn4.group_common_fams2_meta[0].period_us - s->pmo_dcn4.group_common_fams2_meta[1].period_us;
+		double period_ratio;
+		double max_shift_us;
+		double shift_per_period;
 
 		/* default period_0 > period_1 */
 		unsigned int lrg_idx = 0;
 		unsigned int sml_idx = 1;
-		if (period_delta < 0.0) {
+		if (s->pmo_dcn4.group_common_fams2_meta[0].period_us < s->pmo_dcn4.group_common_fams2_meta[1].period_us) {
 			/* period_0 < period_1 */
 			lrg_idx = 1;
 			sml_idx = 0;
-			period_delta = math_fabs(period_delta);
 		}
-
-		if (s->pmo_dcn4.group_common_fams2_meta[lrg_idx].disallow_time_us >= s->pmo_dcn4.group_common_fams2_meta[sml_idx].allow_time_us) {
-			double time_until_disallow_us = (s->pmo_dcn4.group_common_fams2_meta[lrg_idx].allow_time_us +
-				s->pmo_dcn4.group_common_fams2_meta[sml_idx].allow_time_us) /
-				period_delta *
-				s->pmo_dcn4.group_common_fams2_meta[sml_idx].period_us;
-			double time_until_allow_us = (s->pmo_dcn4.group_common_fams2_meta[lrg_idx].disallow_time_us -
-				s->pmo_dcn4.group_common_fams2_meta[sml_idx].allow_time_us) /
-				period_delta *
-				s->pmo_dcn4.group_common_fams2_meta[sml_idx].period_us;
-
-			if (time_until_disallow_us > PMO_DCN4_MIN_TIME_TO_DISALLOW_MS &&
-				time_until_allow_us < pmo->ip_caps->fams2.max_allow_delay_us) {
-				schedulable = true;
-			}
-		} else {
-			/* if the allow is not maskable, it is always schedulable within a frame */
+		period_ratio = s->pmo_dcn4.group_common_fams2_meta[lrg_idx].period_us / s->pmo_dcn4.group_common_fams2_meta[sml_idx].period_us;
+		shift_per_period = s->pmo_dcn4.group_common_fams2_meta[sml_idx].period_us * (period_ratio - math_floor(period_ratio));
+		max_shift_us = s->pmo_dcn4.group_common_fams2_meta[lrg_idx].disallow_time_us - s->pmo_dcn4.group_common_fams2_meta[sml_idx].allow_time_us;
+		max_allow_delay_us = max_shift_us / shift_per_period * s->pmo_dcn4.group_common_fams2_meta[lrg_idx].period_us;
+
+		if (shift_per_period > 0.0 &&
+			shift_per_period < s->pmo_dcn4.group_common_fams2_meta[lrg_idx].allow_time_us + s->pmo_dcn4.group_common_fams2_meta[sml_idx].allow_time_us &&
+			max_allow_delay_us < pmo->ip_caps->fams2.max_allow_delay_us) {
 			schedulable = true;
 		}
 	}
@@ -1308,7 +1304,7 @@ static bool stream_matches_drr_policy(struct dml2_pmo_instance *pmo,
 			is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, stream_pstate_strategy) &&
 			stream_descriptor->timing.drr_config.enabled &&
 			stream_descriptor->timing.drr_config.drr_active_variable) {
-		/* DRR is variable, fw exclusive methods require DRR to be fixed */
+		/* DRR is variable, fw exclusive methods require DRR to be clamped */
 		strategy_matches_drr_requirements = false;
 	} else if (is_bit_set_in_bitfield(PMO_DRR_VAR_STRATEGY_MASK, stream_pstate_strategy) &&
 			pmo->options->disable_drr_var_when_var_active &&
@@ -1322,10 +1318,9 @@ static bool stream_matches_drr_policy(struct dml2_pmo_instance *pmo,
 			stream_descriptor->timing.drr_config.disallowed)) {
 		/* DRR variable strategies are disallowed due to settings or policy */
 		strategy_matches_drr_requirements = false;
-	} else if (is_bit_set_in_bitfield(PMO_DRR_FIXED_STRATEGY_MASK, stream_pstate_strategy) &&
-			(pmo->options->disable_drr_fixed ||
-			(stream_descriptor->timing.drr_config.enabled &&
-			stream_descriptor->timing.drr_config.drr_active_variable))) {
+	} else if (is_bit_set_in_bitfield(PMO_DRR_CLAMPED_STRATEGY_MASK, stream_pstate_strategy) &&
+			(pmo->options->disable_drr_clamped ||
+			!stream_descriptor->timing.drr_config.enabled)) {
 		/* DRR fixed strategies are disallowed due to settings or policy */
 		strategy_matches_drr_requirements = false;
 	} else if (is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, stream_pstate_strategy) &&
@@ -1420,6 +1415,21 @@ static int get_vactive_pstate_margin(const struct display_configuation_with_meta
 	return min_vactive_margin_us;
 }
 
+static unsigned int get_vactive_det_fill_latency_delay_us(const struct display_configuation_with_meta *display_cfg, int plane_mask)
+{
+	unsigned char i;
+	unsigned int max_vactive_fill_us = 0;
+
+	for (i = 0; i < DML2_MAX_PLANES; i++) {
+		if (is_bit_set_in_bitfield(plane_mask, i)) {
+			if (display_cfg->mode_support_result.cfg_support_info.plane_support_info[i].dram_change_vactive_det_fill_delay_us > max_vactive_fill_us)
+				max_vactive_fill_us = display_cfg->mode_support_result.cfg_support_info.plane_support_info[i].dram_change_vactive_det_fill_delay_us;
+		}
+	}
+
+	return max_vactive_fill_us;
+}
+
 static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 	struct display_configuation_with_meta *display_config,
 	int stream_index)
@@ -1474,18 +1484,34 @@ static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 			(unsigned int)math_ceil(ip_caps->fams2.min_allow_width_us / stream_fams2_meta->otg_vline_time_us);
 	/* this value should account for urgent latency */
 	stream_fams2_meta->dram_clk_change_blackout_otg_vlines =
-			(unsigned int)math_ceil(display_config->mode_support_result.cfg_support_info.clean_me_up.support_info.watermarks.DRAMClockChangeWatermark /
+			(unsigned int)math_ceil(pmo->soc_bb->power_management_parameters.dram_clk_change_blackout_us /
 			stream_fams2_meta->otg_vline_time_us);
 
 	/* scheduling params should be built based on the worst case for allow_time:disallow_time */
 
 	/* vactive */
-	stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines =
-			(unsigned int)math_ceil(ip_caps->max_vactive_det_fill_delay_us / stream_fams2_meta->otg_vline_time_us);
-	stream_fams2_meta->method_vactive.common.allow_start_otg_vline =
+	if (display_config->display_config.num_streams == 1) {
+		/* for single stream, guarantee at least an instant of allow */
+		stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines = (unsigned int)math_floor(
+				math_max2(0.0,
+				timing->v_active - stream_fams2_meta->min_allow_width_otg_vlines - stream_fams2_meta->dram_clk_change_blackout_otg_vlines));
+	} else {
+		/* for multi stream, bound to a max fill time defined by IP caps */
+		stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines =
+				(unsigned int)math_floor((double)ip_caps->max_vactive_det_fill_delay_us / stream_fams2_meta->otg_vline_time_us);
+	}
+	stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_us = stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines * stream_fams2_meta->otg_vline_time_us;
+
+	if (stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_us > 0.0) {
+		stream_fams2_meta->method_vactive.common.allow_start_otg_vline =
 			timing->v_blank_end + stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines;
-	stream_fams2_meta->method_vactive.common.allow_end_otg_vline =
-			timing->v_blank_end + timing->v_active - stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
+		stream_fams2_meta->method_vactive.common.allow_end_otg_vline =
+			timing->v_blank_end + timing->v_active -
+			stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
+	} else {
+		stream_fams2_meta->method_vactive.common.allow_start_otg_vline = 0;
+		stream_fams2_meta->method_vactive.common.allow_end_otg_vline = 0;
+	}
 	stream_fams2_meta->method_vactive.common.period_us = stream_fams2_meta->nom_frame_time_us;
 	build_method_scheduling_params(&stream_fams2_meta->method_vactive.common, stream_fams2_meta);
 
@@ -1583,7 +1609,7 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 	const struct dml2_plane_parameters *plane_descriptor;
 	const enum dml2_pmo_pstate_strategy(*strategy_list)[PMO_DCN4_MAX_DISPLAYS] = NULL;
 	unsigned int strategy_list_size = 0;
-	unsigned int plane_index, stream_index, i;
+	unsigned char plane_index, stream_index, i;
 
 	state->performed = true;
 	in_out->base_display_config->stage3.min_clk_index_for_latency = in_out->base_display_config->stage1.min_clk_index_for_latency;
@@ -1594,7 +1620,7 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 	memset(s, 0, sizeof(struct dml2_pmo_scratch));
 
 	pmo->scratch.pmo_dcn4.min_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
-	pmo->scratch.pmo_dcn4.max_latency_index = pmo->min_clock_table_size;
+	pmo->scratch.pmo_dcn4.max_latency_index = pmo->mcg_clock_table_size;
 	pmo->scratch.pmo_dcn4.cur_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
 
 	// First build the stream plane mask (array of bitfields indexed by stream, indicating plane mapping)
@@ -1636,16 +1662,7 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 	}
 
 	if (s->pmo_dcn4.num_pstate_candidates > 0) {
-		// There's this funny case...
-		// If the first entry in the candidate list is all vactive, then we can consider it "tested", so the current index is 0
-		// Otherwise the current index should be -1 because we run the optimization at least once
-		s->pmo_dcn4.cur_pstate_candidate = 0;
-		for (i = 0; i < display_config->display_config.num_streams; i++) {
-			if (s->pmo_dcn4.per_stream_pstate_strategy[0][i] != dml2_pmo_pstate_strategy_vactive) {
-				s->pmo_dcn4.cur_pstate_candidate = -1;
-				break;
-			}
-		}
+		s->pmo_dcn4.cur_pstate_candidate = -1;
 		return true;
 	} else {
 		return false;
@@ -1685,7 +1702,7 @@ static void setup_planes_for_drr_by_mask(struct display_configuation_with_meta *
 	struct dml2_pmo_instance *pmo,
 	int plane_mask)
 {
-	unsigned int plane_index;
+	unsigned char plane_index;
 	struct dml2_plane_parameters *plane;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
@@ -1706,7 +1723,7 @@ static void setup_planes_for_svp_by_mask(struct display_configuation_with_meta *
 {
 	struct dml2_pmo_scratch *scratch = &pmo->scratch;
 
-	unsigned int plane_index;
+	unsigned char plane_index;
 	int stream_index = -1;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
@@ -1750,7 +1767,7 @@ static void setup_planes_for_vblank_by_mask(struct display_configuation_with_met
 	struct dml2_pmo_instance *pmo,
 	int plane_mask)
 {
-	unsigned int plane_index;
+	unsigned char plane_index;
 	struct dml2_plane_parameters *plane;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
@@ -1786,11 +1803,19 @@ static void setup_planes_for_vactive_by_mask(struct display_configuation_with_me
 	struct dml2_pmo_instance *pmo,
 	int plane_mask)
 {
-	unsigned int plane_index;
+	unsigned char plane_index;
+	unsigned int stream_index;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
+			stream_index = display_config->display_config.plane_descriptors[plane_index].stream_index;
+
 			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_vactive;
+
+			if (!pmo->options->disable_vactive_det_fill_bw_pad) {
+				display_config->display_config.plane_descriptors[plane_index].overrides.max_vactive_det_fill_delay_us =
+					(unsigned int)math_floor(pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_index].method_vactive.max_vactive_det_fill_delay_us);
+			}
 		}
 	}
 }
@@ -1800,10 +1825,18 @@ static void setup_planes_for_vactive_drr_by_mask(struct display_configuation_wit
 	int plane_mask)
 {
 	unsigned char plane_index;
+	unsigned int stream_index;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
+			stream_index = display_config->display_config.plane_descriptors[plane_index].stream_index;
+
 			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_fw_vactive_drr;
+
+			if (!pmo->options->disable_vactive_det_fill_bw_pad) {
+				display_config->display_config.plane_descriptors[plane_index].overrides.max_vactive_det_fill_delay_us =
+					(unsigned int)math_floor(pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_index].method_vactive.max_vactive_det_fill_delay_us);
+			}
 		}
 	}
 }
@@ -1846,7 +1879,7 @@ static bool setup_display_config(struct display_configuation_with_meta *display_
 	}
 
 	/* copy FAMS2 meta */
-	if (fams2_required) {
+	if (success) {
 		display_config->stage3.fams2_required = fams2_required;
 		memcpy(&display_config->stage3.stream_fams2_meta,
 			&scratch->pmo_dcn4.stream_fams2_meta,
@@ -1859,7 +1892,7 @@ static bool setup_display_config(struct display_configuation_with_meta *display_
 static int get_minimum_reserved_time_us_for_planes(struct display_configuation_with_meta *display_config, int plane_mask)
 {
 	int min_time_us = 0xFFFFFF;
-	unsigned int plane_index = 0;
+	unsigned char plane_index = 0;
 
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
@@ -1888,10 +1921,12 @@ bool pmo_dcn4_fams2_test_for_pstate_support(struct dml2_pmo_test_for_pstate_supp
 		return false;
 
 	for (stream_index = 0; stream_index < in_out->base_display_config->display_config.num_streams; stream_index++) {
+		struct dml2_fams2_meta *stream_fams2_meta = &s->pmo_dcn4.stream_fams2_meta[stream_index];
 
 		if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_vactive ||
 				s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
-			if (get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < (MIN_VACTIVE_MARGIN_PCT * in_out->instance->soc_bb->power_management_parameters.dram_clk_change_blackout_us)) {
+			if (get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < (MIN_VACTIVE_MARGIN_PCT * in_out->instance->soc_bb->power_management_parameters.dram_clk_change_blackout_us) ||
+					get_vactive_det_fill_latency_delay_us(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) > stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_us) {
 				p_state_supported = false;
 				break;
 			}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h
index 0cdf4f4ccfc0..9d3dc5e94be1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h
@@ -11,4 +11,4 @@
 
 bool dml2_pmo_create(enum dml2_project_id project_id, struct dml2_pmo_instance *out);
 
-#endif
\ No newline at end of file
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
index 178bb21bcdc0..defe13436a2c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
@@ -5,9 +5,7 @@
 
 #include "lib_float_math.h"
 
-#ifndef ASSERT
 #define ASSERT(condition)
-#endif
 
 #define isNaN(number) ((number) != (number))
 
@@ -132,9 +130,21 @@ float math_log2(float a)
 	return math_log(a, 2.0);
 }
 
+// approximate log2 value of a input
+//  - precise if the input pwr of 2, else the approximation will be an integer = floor(actual_log2)
+unsigned int math_log2_approx(unsigned int a)
+{
+	unsigned int log2_val = 0;
+	while (a > 1) {
+		a = a >> 1;
+		log2_val++;
+	}
+	return log2_val;
+}
+
 double math_round(double a)
 {
 	const double round_pt = 0.5;
 
 	return math_floor(a + round_pt);
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.h
index 8f595b441dd0..537cf6fd4c15 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.h
@@ -20,6 +20,7 @@ float math_pow(float a, float exp);
 double math_fabs(double a);
 float math_log(float a, float b);
 float math_log2(float a);
+unsigned int math_log2_approx(unsigned int a);
 double math_round(double a);
 
-#endif
\ No newline at end of file
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
index 5ba849aad9d0..1142fdade334 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
@@ -72,7 +72,7 @@ bool dml2_initialize_instance(struct dml2_initialize_instance_in_out *in_out)
 		pmo_init_params.instance = &dml->pmo_instance;
 		pmo_init_params.soc_bb = &dml->soc_bbox;
 		pmo_init_params.ip_caps = &dml->ip_caps;
-		pmo_init_params.min_clock_table_size = dml->min_clk_table.dram_bw_table.num_entries;
+		pmo_init_params.mcg_clock_table_size = dml->min_clk_table.dram_bw_table.num_entries;
 		pmo_init_params.options = &dml->pmo_options;
 		dml->pmo_instance.initialize(&pmo_init_params);
 	}
@@ -123,6 +123,7 @@ bool dml2_check_mode_supported(struct dml2_check_mode_supported_in_out *in_out)
 	}
 
 	in_out->is_supported = mcache_success;
+	result = result && in_out->is_supported;
 
 	return result;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
index 188e482d3396..7afd417071a5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
@@ -319,6 +319,26 @@ bool dml2_top_mcache_validate_admissability(struct top_mcache_validate_admissabi
 	return all_pass;
 }
 
+static void reset_mcache_allocations(struct dml2_hubp_pipe_mcache_regs *per_plane_pipe_mcache_regs)
+{
+	// Initialize all entries to special valid MCache ID and special valid split coordinate
+	per_plane_pipe_mcache_regs->main.p0.mcache_id_first = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->main.p0.mcache_id_second = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->main.p0.split_location = SPLIT_LOCATION_UNDEFINED;
+
+	per_plane_pipe_mcache_regs->mall.p0.mcache_id_first = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->mall.p0.mcache_id_second = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->mall.p0.split_location = SPLIT_LOCATION_UNDEFINED;
+
+	per_plane_pipe_mcache_regs->main.p1.mcache_id_first = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->main.p1.mcache_id_second = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->main.p1.split_location = SPLIT_LOCATION_UNDEFINED;
+
+	per_plane_pipe_mcache_regs->mall.p1.mcache_id_first = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->mall.p1.mcache_id_second = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->mall.p1.split_location = SPLIT_LOCATION_UNDEFINED;
+}
+
 bool dml2_top_mcache_build_mcache_programming(struct dml2_build_mcache_programming_in_out *params)
 {
 	bool success = true;
@@ -333,22 +353,7 @@ bool dml2_top_mcache_build_mcache_programming(struct dml2_build_mcache_programmi
 			// Allocate storage for the mcache regs
 			params->per_plane_pipe_mcache_regs[config_index][pipe_index] = &params->mcache_regs_set[free_per_plane_reg_index++];
 
-			// First initialize all entries to special valid MCache ID and special valid split coordinate
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p0.mcache_id_first = MCACHE_ID_UNASSIGNED;
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p0.mcache_id_second = MCACHE_ID_UNASSIGNED;
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p0.split_location = SPLIT_LOCATION_UNDEFINED;
-
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p0.mcache_id_first = MCACHE_ID_UNASSIGNED;
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p0.mcache_id_second = MCACHE_ID_UNASSIGNED;
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p0.split_location = SPLIT_LOCATION_UNDEFINED;
-
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p1.mcache_id_first = MCACHE_ID_UNASSIGNED;
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p1.mcache_id_second = MCACHE_ID_UNASSIGNED;
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p1.split_location = SPLIT_LOCATION_UNDEFINED;
-
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p1.mcache_id_first = MCACHE_ID_UNASSIGNED;
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p1.mcache_id_second = MCACHE_ID_UNASSIGNED;
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p1.split_location = SPLIT_LOCATION_UNDEFINED;
+			reset_mcache_allocations(params->per_plane_pipe_mcache_regs[config_index][pipe_index]);
 
 			if (params->mcache_configurations[config_index].plane_descriptor->surface.dcc.enable) {
 				// P0 always enabled
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
index 55a1ae4655ce..bb12e4c30690 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
@@ -21,4 +21,4 @@ bool dml2_top_mcache_build_mcache_programming(struct dml2_build_mcache_programmi
 
 bool dml2_top_mcache_unit_test(void);
 
-#endif
\ No newline at end of file
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
index f118b6911210..0403238df107 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
@@ -15,4 +15,4 @@
 int dml2_printf(const char *format, ...);
 void dml2_assert(int condition);
 
-#endif
\ No newline at end of file
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
index d873a6895a32..dd90c5df5a5a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
@@ -146,10 +146,13 @@ struct core_plane_support_info {
 	int active_latency_hiding_us;
 	int mall_svp_size_requirement_ways;
 	int nominal_vblank_pstate_latency_hiding_us;
+	unsigned int dram_change_vactive_det_fill_delay_us;
 };
 
 struct core_stream_support_info {
 	unsigned int odms_used;
+	unsigned int num_odm_output_segments; // for odm split mode (e.g. a value of 2 for odm_mode_mso_1to2)
+
 	/* FAMS2 SubVP support info */
 	unsigned int phantom_min_v_active;
 	unsigned int phantom_v_startup;
@@ -270,6 +273,7 @@ struct dml2_fams2_meta {
 	double max_frame_time_us;
 	unsigned int dram_clk_change_blackout_otg_vlines;
 	struct {
+		double max_vactive_det_fill_delay_us;
 		unsigned int max_vactive_det_fill_delay_otg_vlines;
 		struct dml2_fams2_per_method_common_meta common;
 	} method_vactive;
@@ -390,6 +394,7 @@ struct dml2_core_mode_programming_in_out {
 	* Outputs (also Input the clk freq are also from programming struct)
 	*/
 	struct dml2_display_cfg_programming *programming;
+
 };
 
 struct dml2_core_populate_informative_in_out {
@@ -481,7 +486,7 @@ struct dml2_pmo_initialize_in_out {
 	struct dml2_soc_bb *soc_bb;
 	struct dml2_ip_capabilities *ip_caps;
 	struct dml2_pmo_options *options;
-	int min_clock_table_size;
+	int mcg_clock_table_size;
 };
 
 struct dml2_pmo_optimize_dcc_mcache_in_out {
@@ -602,14 +607,14 @@ enum dml2_pmo_pstate_strategy {
 	dml2_pmo_pstate_strategy_fw_vactive_drr = 11,
 	dml2_pmo_pstate_strategy_fw_vblank_drr = 12,
 	dml2_pmo_pstate_strategy_fw_svp_drr = 13,
-	dml2_pmo_pstate_strategy_reserved_fw_drr_fixed = 20,
+	dml2_pmo_pstate_strategy_reserved_fw_drr_clamped = 20,
 	dml2_pmo_pstate_strategy_fw_drr = 21,
 	dml2_pmo_pstate_strategy_reserved_fw_drr_var = 22,
 };
 
 #define PMO_NO_DRR_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw - dml2_pmo_pstate_strategy_na + 1)) - 1) << dml2_pmo_pstate_strategy_na)
 #define PMO_DRR_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_var - dml2_pmo_pstate_strategy_fw_vactive_drr + 1)) - 1) << dml2_pmo_pstate_strategy_fw_vactive_drr)
-#define PMO_DRR_FIXED_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_fw_drr - dml2_pmo_pstate_strategy_fw_vactive_drr + 1)) - 1) << dml2_pmo_pstate_strategy_fw_vactive_drr)
+#define PMO_DRR_CLAMPED_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_clamped - dml2_pmo_pstate_strategy_fw_vactive_drr + 1)) - 1) << dml2_pmo_pstate_strategy_fw_vactive_drr)
 #define PMO_DRR_VAR_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_var - dml2_pmo_pstate_strategy_fw_drr + 1)) - 1) << dml2_pmo_pstate_strategy_fw_drr)
 #define PMO_FW_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_var - dml2_pmo_pstate_strategy_fw_svp + 1)) - 1) << dml2_pmo_pstate_strategy_fw_svp)
 
@@ -671,7 +676,7 @@ struct dml2_pmo_init_data {
 	union {
 		struct {
 			/* populated once during initialization */
-			enum dml2_pmo_pstate_strategy expanded_strategy_list_1_display[PMO_DCN4_MAX_BASE_STRATEGIES * 1][PMO_DCN4_MAX_DISPLAYS];
+			enum dml2_pmo_pstate_strategy expanded_strategy_list_1_display[PMO_DCN4_MAX_BASE_STRATEGIES * 2][PMO_DCN4_MAX_DISPLAYS];
 			enum dml2_pmo_pstate_strategy expanded_strategy_list_2_display[PMO_DCN4_MAX_BASE_STRATEGIES * 2 * 2][PMO_DCN4_MAX_DISPLAYS];
 			enum dml2_pmo_pstate_strategy expanded_strategy_list_3_display[PMO_DCN4_MAX_BASE_STRATEGIES * 6 * 2][PMO_DCN4_MAX_DISPLAYS];
 			enum dml2_pmo_pstate_strategy expanded_strategy_list_4_display[PMO_DCN4_MAX_BASE_STRATEGIES * 24 * 2][PMO_DCN4_MAX_DISPLAYS];
@@ -689,7 +694,7 @@ struct dml2_pmo_instance {
 	int disp_clk_vmin_threshold;
 	int mpc_combine_limit;
 	int odm_combine_limit;
-	int min_clock_table_size;
+	int mcg_clock_table_size;
 
 	union {
 		struct {
-- 
2.39.2


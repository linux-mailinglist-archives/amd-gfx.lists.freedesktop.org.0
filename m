Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF48C7D2B
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2024 21:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B1210EDA7;
	Thu, 16 May 2024 19:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G6u+z7Ty";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10DC10EDA6
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2024 19:27:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QquQvLY5rfogoPuyPu3e0hzetM748Nj9Gwtd8696wW8kEKCzjUpecwXPCTp+r7qOX33vi5JvuH4tmzJ/44ot4fhBwhf+CSbBAXxQf8C4Gh3ZJeUbdujUTkYHhL3jktGrv1VrXO3lvyAYmugUEMkT28ylDqIru5smLOUhsLLZsgOAK+5jTbK8YtxFi9FQi3jg+MAP3Lr3FvT0In+2A1fF2o580pyzddyBx5ngA8onLfL94AfAWh86sEy0T3Jgn4bVCHquQZA7q8TWFWaGbpJl0x4eD66vbQANx+XA44Pz7Cbo61ErZzD6JjpWAjBiLvUTpo1XAABNFbMSkFSYe3VT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jJYPww2GKyRtLoWj9vmYn96ObTpCsdqSJTJo219fg4=;
 b=V9FVhzm2zev/Bg9+LM+Vlk1u+eJ0Po32dhF3o3sC2CavdoacjiC0lXD6lSjCLGeWQ+hZv0GgbAW1LxIWUNfiDP5s9tsnfDDk+LKFL8B5Tw7TZ9IYA8Ux36SQq1BT7YCQNgbp80yYhJGe78eKue86yRVghQA/hTdZZ+hOMcRY3s3YPw8YHB4yzNM7NI5M4zSCCXA71pqXZZ3e1+l+ppLWnWUrv/SX7CtDaZW57sddnduHK4a0+Q8Sw1WXJTqSZx5LitEPXHuDscHS8xNTRGiA2calkY3UMVQhWcOx0buENAp1o7f/EVZf53QaIijt+iFo6W3k6mwF3FJQGw6791R3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jJYPww2GKyRtLoWj9vmYn96ObTpCsdqSJTJo219fg4=;
 b=G6u+z7TyEfjFJLC7BhLV9f/4H6ENz+y9+z64xe5Kw16U9Xs2fTJ3+Y7nPf7Jd+xmQn7uMaA6QrlEYk9KuEY67tClMJsR3nwBrYQEnzTnAjbZ/oqPvnv4fPLfC+NXUahfTJv7g2cowd2h1G5o6sJhrbCdyaPIx8ZM5lS892yqOC8=
Received: from BN9PR03CA0264.namprd03.prod.outlook.com (2603:10b6:408:ff::29)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 19:27:00 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::2a) by BN9PR03CA0264.outlook.office365.com
 (2603:10b6:408:ff::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 19:26:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 19:26:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 14:26:59 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 14:26:58 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, Samson Tam <Samson.Tam@amd.com>
Subject: [PATCH 07/24] drm/amd/display: enable EASF support for DCN40
Date: Thu, 16 May 2024 15:26:30 -0400
Message-ID: <20240516192647.1522729-8-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516192647.1522729-1-Roman.Li@amd.com>
References: <20240516192647.1522729-1-Roman.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Roman.Li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee92ba8-a9e8-4f96-b61c-08dc75de282a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hntF0lEbB/GjMa86Jw5XpYOQxt+MNyzoh87D+4YqrtXwScNuNyn5t5FoD8BO?=
 =?us-ascii?Q?P9KLY+6X/DUnnP5Rr2f4unM+VY2NE8IwZlSQKN3ER/KFH4aHfTs4Y3LW/Gte?=
 =?us-ascii?Q?4O+uPQxtL9Wt8WtaddoutVhxdklCOVuVss6OicXZnQ0/H3XuXkjHTp7nw+TS?=
 =?us-ascii?Q?lyH1359wW6uJfutwh78oUcKyE9SpxKlXLwAW0rT+fnNEmatU7HnMpaKI6SdM?=
 =?us-ascii?Q?BarPtSdqiFkSCNvk9KXZWhAnjn22N0OSq3HftJy9adtLPJHtVdZk5hqJS5OH?=
 =?us-ascii?Q?Y/YV9lSzEknUGriYE+GNGmPyltnJrjPVdSmDtovPHe5S4lfjBq/JVu/xa9aO?=
 =?us-ascii?Q?t47Q7dyWV722mf+UcE5U8p7QZPU1vUZFSuium2BfnU7u3dQ7Nez8EHibARQj?=
 =?us-ascii?Q?IEQwo/UnLSXK43DoH39mu8yj8CKG+DdpYlPv8YATB6P0crC/IXS09Os92Es/?=
 =?us-ascii?Q?5N984vD0O7goLuxd8jiHwQKTzI1+siH9msZ9BuQpAeS2gL9ypizco9WblhaM?=
 =?us-ascii?Q?4D5S3wkX3qHWKD4kYTPUEYd3ekcUalKrtgJWfD01+3n6Mrpp5x/ZEjaxnU+W?=
 =?us-ascii?Q?TfTN45i1cCMR0mb/Rwqlb4YrKCvTXmqNeAZ3pP7aeBu+KXHICeqX3AzYmY9X?=
 =?us-ascii?Q?1zrbsPATUT3xDMwkjjBcHgN5/d0aMCb3ghNjDXXbZbWYayo3VYaR+EuEReyd?=
 =?us-ascii?Q?2xCrsML+5BD9IVZfnljNDyD1FOEsv5ear/ki8cTn152lIEfRbybymm9SRlpq?=
 =?us-ascii?Q?lq9Dok8foz2v8p1gtg06YLP35sEtb0XusdPl212r/1uLPDgy3LE86M53O9bs?=
 =?us-ascii?Q?lbZplBmpdUrKIZ061XAxyiBBrWw45lKcZbWvsS2h4HqJUCRrIhN21Qltw+uQ?=
 =?us-ascii?Q?q4bjj2sX1a3RKtyKB49MZQ/WWCf6cRFBogRigswNilfuJQKMwRuKpf81q1w/?=
 =?us-ascii?Q?UnCOEWBtjEDPS7/MWA1x2iU1zuhCvTmZ/zqsIC+9D0Q8+ca7XuadVEKcxfhL?=
 =?us-ascii?Q?rIFbDwm1jP4PoOjnSOEhBnJwXTvWJQm7Gmp5YF7bxh9WelIz9m9PKjGGMLpB?=
 =?us-ascii?Q?6+e9zlmpEDtgbXQthlVm8tTMjqxwG40a1Wos9PIsJt2P3QC69hSklmiF/qNn?=
 =?us-ascii?Q?rw3ryO0xxpwyvl/xsPckM+TKbz7m0hwYIUBvDnp1OQh8OeNvpsmtvyUNoddc?=
 =?us-ascii?Q?9C+F2d7UHr5QG6rXNFfuIcdzGqHA5P/kxPB+Y7xVbiiz/wh8Z3GjWHfhq1XZ?=
 =?us-ascii?Q?IW6byqPKmL5wgXKhtujpeNjv194a/ymbxILe0Fj86VA28KjYP9Oq4++qZfli?=
 =?us-ascii?Q?Gq55iZxU+LYiMt3XMKl+QCLHaNS8hIWi0URgPuMpKXkKXxWF6BMvwgBmiWGm?=
 =?us-ascii?Q?61VLvYDlXz0nNkwsFV4L8lsETg75?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 19:26:59.6376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee92ba8-a9e8-4f96-b61c-08dc75de282a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
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

From: Samson Tam <Samson.Tam@amd.com>

[Why]
Enable adaptive scaler support for DCN401

[How]
- Enable build flag for SPL
- Set prefer_easf flag to true
- Apply light linear scaling policy based on transfer function and pixel
  format.  Choose between linear or non-linear scaling
- Set matrix_mode based on pixel format
- Disable ring estimator
- Add missing EASF register defines, masks, and writes
- Disable EASF if scale ratio or number of taps is unsupported and when
  bypassing the scaler
- Add debug flags and registry keys for debugging SPL and EASF
- Add support for Visual Confirm with EASF

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Samson Tam <Samson.Tam@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  11 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   3 +
 .../gpu/drm/amd/display/dc/dc_spl_translate.c |  15 +-
 .../amd/display/dc/dpp/dcn401/dcn401_dpp.h    |   6 +-
 .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   | 207 +++++++++++++++++-
 .../dc/resource/dcn401/dcn401_resource.c      |   1 +
 .../dc/resource/dcn401/dcn401_resource.h      |  48 +++-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c   |  95 ++++++--
 .../gpu/drm/amd/display/dc/spl/dc_spl_types.h |  30 ++-
 9 files changed, 382 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 70c39eef99e5..ce1991e06049 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1500,8 +1500,8 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 	pipe_ctx->plane_res.scl_data.format = convert_pixel_format_to_dalsurface(
 			pipe_ctx->plane_state->format);
 
-	if (pipe_ctx->stream->ctx->dc->config.use_spl)	{
 #if defined(CONFIG_DRM_AMD_DC_FP)
+	if ((pipe_ctx->stream->ctx->dc->config.use_spl)	&& (!pipe_ctx->stream->ctx->dc->debug.disable_spl)) {
 		struct spl_in *spl_in = &pipe_ctx->plane_res.spl_in;
 		struct spl_out *spl_out = &pipe_ctx->plane_res.spl_out;
 
@@ -1516,15 +1516,18 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 
 		// Convert pipe_ctx to respective input params for SPL
 		translate_SPL_in_params_from_pipe_ctx(pipe_ctx, spl_in);
+		/* Pass visual confirm debug information */
+		calculate_adjust_recout_for_visual_confirm(pipe_ctx,
+			&spl_in->debug.visual_confirm_base_offset,
+			&spl_in->debug.visual_confirm_dpp_offset);
 		// Set SPL output parameters to dscl_prog_data to be used for hw registers
 		spl_out->dscl_prog_data = resource_get_dscl_prog_data(pipe_ctx);
 		// Calculate scaler parameters from SPL
 		res = spl_calculate_scaler_params(spl_in, spl_out);
 		// Convert respective out params from SPL to scaler data
 		translate_SPL_out_params_to_pipe_ctx(pipe_ctx, spl_out);
-#endif
 	} else {
-
+#endif
 	/* depends on h_active */
 	calculate_recout(pipe_ctx);
 	/* depends on pixel format */
@@ -1604,7 +1607,9 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 		pipe_ctx->plane_res.scl_data.viewport.height = MIN_VIEWPORT_SIZE;
 	if (pipe_ctx->plane_res.scl_data.viewport.width < MIN_VIEWPORT_SIZE)
 		pipe_ctx->plane_res.scl_data.viewport.width = MIN_VIEWPORT_SIZE;
+#ifdef CONFIG_DRM_AMD_DC_FP
 	}
+#endif
 	DC_LOG_SCALER("%s pipe %d:\nViewport: height:%d width:%d x:%d y:%d  Recout: height:%d width:%d x:%d y:%d  HACTIVE:%d VACTIVE:%d\n"
 			"src_rect: height:%d width:%d x:%d y:%d  dst_rect: height:%d width:%d x:%d y:%d  clip_rect: height:%d width:%d x:%d y:%d\n",
 			__func__,
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index fd948e4cec0d..5ae74558632b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1038,6 +1038,9 @@ struct dc_debug_options {
 	union dmub_fams2_global_feature_config fams2_config;
 	bool enable_legacy_clock_update;
 	unsigned int force_cositing;
+	unsigned int disable_spl;
+	unsigned int force_easf;
+	unsigned int force_lls;
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
index daf97688e901..6e37b166802b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
@@ -129,6 +129,11 @@ void translate_SPL_in_params_from_pipe_ctx(struct pipe_ctx *pipe_ctx, struct spl
 	populate_spltaps_from_taps(&spl_in->scaling_quality, &plane_state->scaling_quality);
 	// Translate edge adaptive scaler preference
 	spl_in->prefer_easf = pipe_ctx->stream->ctx->dc->config.prefer_easf;
+	spl_in->disable_easf = false;
+	if (pipe_ctx->stream->ctx->dc->debug.force_easf == 1)
+		spl_in->prefer_easf = false;
+	else if (pipe_ctx->stream->ctx->dc->debug.force_easf == 2)
+		spl_in->disable_easf = true;
 	// Translate adaptive sharpening preference
 	spl_in->adaptive_sharpness.enable = plane_state->adaptive_sharpness_en;
 	if (plane_state->sharpnessX1000 == 0)	{
@@ -141,13 +146,19 @@ void translate_SPL_in_params_from_pipe_ctx(struct pipe_ctx *pipe_ctx, struct spl
 		spl_in->adaptive_sharpness.sharpness = SHARPNESS_HIGH;
 	}
 	// Translate linear light scaling preference
-	spl_in->lls_pref = plane_state->linear_light_scaling;
-
+	if (pipe_ctx->stream->ctx->dc->debug.force_lls > 0)
+		spl_in->lls_pref = pipe_ctx->stream->ctx->dc->debug.force_lls;
+	else
+		spl_in->lls_pref = plane_state->linear_light_scaling;
 	/* Translate chroma subsampling offset ( cositing ) */
 	if (pipe_ctx->stream->ctx->dc->debug.force_cositing)
 		spl_in->basic_in.cositing = pipe_ctx->stream->ctx->dc->debug.force_cositing - 1;
 	else
 		spl_in->basic_in.cositing = plane_state->cositing;
+	/* Translate transfer function */
+	spl_in->basic_in.tf_type = (enum spl_transfer_func_type) plane_state->in_transfer_func.type;
+	spl_in->basic_in.tf_predefined_type = (enum spl_transfer_func_predefined) plane_state->in_transfer_func.tf;
+
 }
 
 /// @brief Translate SPL output parameters to pipe context
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h
index 7ab657ad3a20..1aaae7a5bd41 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h
@@ -373,7 +373,11 @@
 	TF_SF(DSCL0_ISHARP_NLDELTA_SOFT_CLIP, ISHARP_NLDELTA_SCLIP_SLOPE_P, mask_sh), \
 	TF_SF(DSCL0_ISHARP_NLDELTA_SOFT_CLIP, ISHARP_NLDELTA_SCLIP_EN_N, mask_sh), \
 	TF_SF(DSCL0_ISHARP_NLDELTA_SOFT_CLIP, ISHARP_NLDELTA_SCLIP_PIVOT_N, mask_sh), \
-	TF_SF(DSCL0_ISHARP_NLDELTA_SOFT_CLIP, ISHARP_NLDELTA_SCLIP_SLOPE_N, mask_sh)
+	TF_SF(DSCL0_ISHARP_NLDELTA_SOFT_CLIP, ISHARP_NLDELTA_SCLIP_SLOPE_N, mask_sh), \
+	TF_SF(DSCL0_SCL_VERT_FILTER_INIT_BOT, SCL_V_INIT_FRAC_BOT, mask_sh),\
+	TF_SF(DSCL0_SCL_VERT_FILTER_INIT_BOT, SCL_V_INIT_INT_BOT, mask_sh),\
+	TF_SF(DSCL0_SCL_VERT_FILTER_INIT_BOT_C, SCL_V_INIT_FRAC_BOT_C, mask_sh),\
+	TF_SF(DSCL0_SCL_VERT_FILTER_INIT_BOT_C, SCL_V_INIT_INT_BOT_C, mask_sh)
 
 #define DPP_REG_FIELD_LIST_DCN401(type) \
 	DPP_REG_FIELD_LIST_DCN3(type); \
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
index d9a08cd160b3..4b1e52803c7a 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
@@ -294,7 +294,7 @@ static void dpp401_dscl_set_scl_filter(
 	const uint16_t *filter_h_c = NULL;
 	const uint16_t *filter_v_c = NULL;
 
-	if (dpp->base.ctx->dc->config.use_spl)  {
+	if ((dpp->base.ctx->dc->config.use_spl) && (!dpp->base.ctx->dc->debug.disable_spl)) {
 		filter_h = scl_data->dscl_prog_data.filter_h;
 		filter_v = scl_data->dscl_prog_data.filter_v;
 		filter_h_c = scl_data->dscl_prog_data.filter_h_c;
@@ -523,7 +523,7 @@ static void dpp401_dscl_set_manual_ratio_init(
 {
 	uint32_t init_frac = 0;
 	uint32_t init_int = 0;
-	if (dpp->base.ctx->dc->config.use_spl)  {
+	if ((dpp->base.ctx->dc->config.use_spl) && (!dpp->base.ctx->dc->debug.disable_spl)) {
 		REG_SET(SCL_HORZ_FILTER_SCALE_RATIO, 0,
 			SCL_H_SCALE_RATIO, data->dscl_prog_data.ratios.h_scale_ratio);
 
@@ -669,7 +669,7 @@ static void dpp401_dscl_program_easf(struct dpp *dpp_base, const struct scaler_d
 			SCL_SC_MATRIX_MODE, scl_data->dscl_prog_data.easf_matrix_mode);
 	REG_UPDATE(DSCL_SC_MODE,
 			SCL_SC_LTONL_EN, scl_data->dscl_prog_data.easf_ltonl_en);
-	// DSCL_EASF_V_MODE
+	/* DSCL_EASF_V_MODE */
 	REG_UPDATE(DSCL_EASF_V_MODE,
 			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en);
 	REG_UPDATE(DSCL_EASF_V_MODE,
@@ -716,7 +716,87 @@ static void dpp401_dscl_program_easf(struct dpp *dpp_base, const struct scaler_d
 			SCL_EASF_V_BF_MINA, scl_data->dscl_prog_data.easf_v_bf_mina);
 	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
 			SCL_EASF_V_BF_MINB, scl_data->dscl_prog_data.easf_v_bf_minb);
-	// DSCL_EASF_H_MODE
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
+			SCL_EASF_V_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg0);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
+			SCL_EASF_V_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg0);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
+			SCL_EASF_V_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg0);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
+			SCL_EASF_V_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg1);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
+			SCL_EASF_V_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg1);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
+			SCL_EASF_V_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg1);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
+			SCL_EASF_V_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg2);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
+			SCL_EASF_V_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg2);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
+			SCL_EASF_V_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg2);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
+			SCL_EASF_V_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg3);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
+			SCL_EASF_V_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg3);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
+			SCL_EASF_V_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg3);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
+			SCL_EASF_V_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg4);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
+			SCL_EASF_V_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg4);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
+			SCL_EASF_V_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg4);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
+			SCL_EASF_V_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg5);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
+			SCL_EASF_V_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg5);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
+			SCL_EASF_V_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg5);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
+			SCL_EASF_V_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg6);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
+			SCL_EASF_V_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg6);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
+			SCL_EASF_V_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg6);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG7,
+			SCL_EASF_V_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg7);
+	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG7,
+			SCL_EASF_V_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg7);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
+			SCL_EASF_V_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set0);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
+			SCL_EASF_V_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set0);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
+			SCL_EASF_V_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set0);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
+			SCL_EASF_V_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set1);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
+			SCL_EASF_V_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set1);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
+			SCL_EASF_V_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set1);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
+			SCL_EASF_V_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set2);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
+			SCL_EASF_V_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set2);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
+			SCL_EASF_V_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set2);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
+			SCL_EASF_V_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set3);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
+			SCL_EASF_V_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set3);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
+			SCL_EASF_V_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set3);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
+			SCL_EASF_V_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set4);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
+			SCL_EASF_V_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set4);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
+			SCL_EASF_V_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set4);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG5,
+			SCL_EASF_V_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set5);
+	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG5,
+			SCL_EASF_V_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set5);
+	/* DSCL_EASF_H_MODE */
 	REG_UPDATE(DSCL_EASF_H_MODE,
 			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en);
 	REG_UPDATE(DSCL_EASF_H_MODE,
@@ -751,6 +831,117 @@ static void dpp401_dscl_program_easf(struct dpp *dpp_base, const struct scaler_d
 			SCL_EASF_H_BF_MINA, scl_data->dscl_prog_data.easf_h_bf_mina);
 	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
 			SCL_EASF_H_BF_MINB, scl_data->dscl_prog_data.easf_h_bf_minb);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
+			SCL_EASF_H_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg0);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
+			SCL_EASF_H_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg0);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
+			SCL_EASF_H_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg0);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
+			SCL_EASF_H_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg1);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
+			SCL_EASF_H_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg1);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
+			SCL_EASF_H_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg1);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
+			SCL_EASF_H_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg2);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
+			SCL_EASF_H_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg2);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
+			SCL_EASF_H_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg2);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
+			SCL_EASF_H_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg3);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
+			SCL_EASF_H_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg3);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
+			SCL_EASF_H_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg3);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
+			SCL_EASF_H_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg4);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
+			SCL_EASF_H_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg4);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
+			SCL_EASF_H_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg4);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
+			SCL_EASF_H_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg5);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
+			SCL_EASF_H_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg5);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
+			SCL_EASF_H_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg5);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
+			SCL_EASF_H_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg6);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
+			SCL_EASF_H_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg6);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
+			SCL_EASF_H_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg6);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG7,
+			SCL_EASF_H_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg7);
+	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG7,
+			SCL_EASF_H_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg7);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
+			SCL_EASF_H_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set0);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
+			SCL_EASF_H_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set0);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
+			SCL_EASF_H_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set0);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
+			SCL_EASF_H_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set1);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
+			SCL_EASF_H_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set1);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
+			SCL_EASF_H_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set1);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
+			SCL_EASF_H_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set2);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
+			SCL_EASF_H_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set2);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
+			SCL_EASF_H_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set2);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
+			SCL_EASF_H_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set3);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
+			SCL_EASF_H_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set3);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
+			SCL_EASF_H_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set3);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
+			SCL_EASF_H_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set4);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
+			SCL_EASF_H_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set4);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
+			SCL_EASF_H_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set4);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG5,
+			SCL_EASF_H_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set5);
+	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG5,
+			SCL_EASF_H_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set5);
+	/* DSCL_EASF_SC_MATRIX_C0C1, DSCL_EASF_SC_MATRIX_C2C3 */
+	REG_UPDATE(DSCL_SC_MATRIX_C0C1,
+			SCL_SC_MATRIX_C0, scl_data->dscl_prog_data.easf_matrix_c0);
+	REG_UPDATE(DSCL_SC_MATRIX_C0C1,
+			SCL_SC_MATRIX_C1, scl_data->dscl_prog_data.easf_matrix_c1);
+	REG_UPDATE(DSCL_SC_MATRIX_C2C3,
+			SCL_SC_MATRIX_C2, scl_data->dscl_prog_data.easf_matrix_c2);
+	REG_UPDATE(DSCL_SC_MATRIX_C2C3,
+			SCL_SC_MATRIX_C3, scl_data->dscl_prog_data.easf_matrix_c3);
+	PERF_TRACE();
+}
+/**
+ * dpp401_dscl_disable_easf - Disable EASF when no scaling (1:1)
+ *
+ * @dpp_base: High level DPP struct
+ * @scl_data: scalaer_data info
+ *
+ * When we have 1:1 scaling, we need to disable EASF
+ *
+ */
+static void dpp401_dscl_disable_easf(struct dpp *dpp_base, const struct scaler_data *scl_data)
+{
+	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
+
+	PERF_TRACE();
+	/* DSCL_EASF_V_MODE */
+	REG_UPDATE(DSCL_EASF_V_MODE,
+			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en);
+	/* DSCL_EASF_H_MODE */
+	REG_UPDATE(DSCL_EASF_H_MODE,
+			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en);
 	PERF_TRACE();
 }
 static void dpp401_dscl_set_isharp_filter(
@@ -852,7 +1043,7 @@ void dpp401_dscl_set_scaler_manual_scale(struct dpp *dpp_base,
 
 	dpp->scl_data = *scl_data;
 
-	if (dpp->base.ctx->dc->config.use_spl)  {
+	if ((dpp->base.ctx->dc->config.use_spl) && (!dpp->base.ctx->dc->debug.disable_spl)) {
 		dscl_mode = (enum dscl_mode_sel) scl_data->dscl_prog_data.dscl_mode;
 		rect = (struct rect *)&scl_data->dscl_prog_data.recout;
 		mpc_width = scl_data->dscl_prog_data.mpc_size.width;
@@ -900,8 +1091,12 @@ void dpp401_dscl_set_scaler_manual_scale(struct dpp *dpp_base,
 	lb_config =  dpp401_dscl_find_lb_memory_config(dpp, scl_data);
 	dpp401_dscl_set_lb(dpp, &scl_data->lb_params, lb_config);
 
-	if (dscl_mode == DSCL_MODE_SCALING_444_BYPASS)
+	if (dscl_mode == DSCL_MODE_SCALING_444_BYPASS) {
+		if (dpp->base.ctx->dc->config.prefer_easf)
+			dpp401_dscl_disable_easf(dpp_base, scl_data);
+		dpp401_dscl_program_isharp(dpp_base, scl_data);
 		return;
+	}
 
 	/* Black offsets */
 	if (REG(SCL_BLACK_OFFSET)) {
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index a55421363772..fc43e7b5ec90 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1845,6 +1845,7 @@ static bool dcn401_resource_construct(
 	dc->caps.color.mpc.ogam_rom_caps.hlg = 0;
 	dc->caps.color.mpc.ocsc = 1;
 	dc->config.use_spl = true;
+	dc->config.prefer_easf = true;
 	dc->config.dc_mode_clk_limit_support = true;
 	dc->config.enable_windowed_mpo_odm = true;
 	/* read VBIOS LTTPR caps */
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
index 5d5e01903ca1..a638c410e32a 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
@@ -342,7 +342,53 @@ bool dcn401_validate_bandwidth(struct dc *dc,
 	SRI_ARR(OBUF_MEM_PWR_CTRL, DSCL, id),                                    \
 	SRI_ARR(DSCL_MEM_PWR_STATUS, DSCL, id),                                  \
 	SRI_ARR(DSCL_MEM_PWR_CTRL, DSCL, id),                                    \
-	SRI_ARR(DSCL_CONTROL, DSCL, id)
+	SRI_ARR(DSCL_CONTROL, DSCL, id),                                         \
+	SRI_ARR(DSCL_SC_MODE, DSCL, id),                                         \
+	SRI_ARR(DSCL_EASF_H_MODE, DSCL, id),                                     \
+	SRI_ARR(DSCL_EASF_H_BF_CNTL, DSCL, id),                                  \
+	SRI_ARR(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE, DSCL, id),                   \
+	SRI_ARR(DSCL_EASF_H_RINGEST_EVENTAP_GAIN, DSCL, id),                     \
+	SRI_ARR(DSCL_EASF_H_BF_FINAL_MAX_MIN, DSCL, id),                         \
+	SRI_ARR(DSCL_EASF_H_BF1_PWL_SEG0, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF1_PWL_SEG1, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF1_PWL_SEG2, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF1_PWL_SEG3, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF1_PWL_SEG4, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF1_PWL_SEG5, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF1_PWL_SEG6, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF1_PWL_SEG7, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF3_PWL_SEG0, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF3_PWL_SEG1, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF3_PWL_SEG2, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF3_PWL_SEG3, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF3_PWL_SEG4, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_H_BF3_PWL_SEG5, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_MODE, DSCL, id),                                     \
+	SRI_ARR(DSCL_EASF_V_BF_CNTL, DSCL, id),                                  \
+	SRI_ARR(DSCL_EASF_V_RINGEST_3TAP_CNTL1, DSCL, id),                       \
+	SRI_ARR(DSCL_EASF_V_RINGEST_3TAP_CNTL2, DSCL, id),                       \
+	SRI_ARR(DSCL_EASF_V_RINGEST_3TAP_CNTL3, DSCL, id),                       \
+	SRI_ARR(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE, DSCL, id),                   \
+	SRI_ARR(DSCL_EASF_V_RINGEST_EVENTAP_GAIN, DSCL, id),                     \
+	SRI_ARR(DSCL_EASF_V_BF_FINAL_MAX_MIN, DSCL, id),                         \
+	SRI_ARR(DSCL_EASF_V_BF1_PWL_SEG0, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF1_PWL_SEG1, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF1_PWL_SEG2, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF1_PWL_SEG3, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF1_PWL_SEG4, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF1_PWL_SEG5, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF1_PWL_SEG6, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF1_PWL_SEG7, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF3_PWL_SEG0, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF3_PWL_SEG1, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF3_PWL_SEG2, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF3_PWL_SEG3, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF3_PWL_SEG4, DSCL, id),                             \
+	SRI_ARR(DSCL_EASF_V_BF3_PWL_SEG5, DSCL, id),                             \
+	SRI_ARR(DSCL_SC_MATRIX_C0C1, DSCL, id),                                  \
+	SRI_ARR(DSCL_SC_MATRIX_C2C3, DSCL, id),                                  \
+	SRI_ARR(SCL_VERT_FILTER_INIT_BOT, DSCL, id),                             \
+	SRI_ARR(SCL_VERT_FILTER_INIT_BOT_C, DSCL, id)
 
 /* OPP */
 #define OPP_REG_LIST_DCN401_RI(id)                                              \
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index 542cd6cdef46..82fbd2b59c70 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -324,14 +324,18 @@ static void spl_calculate_recout(struct spl_in *spl_in, struct spl_out *spl_out)
 	overlapping_area = intersect_rec(&mpc_slice_of_plane_clip, &odm_slice);
 
 	if (overlapping_area.height > 0 &&
-			overlapping_area.width > 0)
+			overlapping_area.width > 0) {
 		/* shift the overlapping area so it is with respect to current
 		 * ODM slice's position
 		 */
 		spl_out->scl_data.recout = shift_rec(
 				&overlapping_area,
 				-odm_slice.x, -odm_slice.y);
-	else
+		spl_out->scl_data.recout.height -=
+			spl_in->debug.visual_confirm_base_offset;
+		spl_out->scl_data.recout.height -=
+			spl_in->debug.visual_confirm_dpp_offset;
+	} else
 		/* if there is no overlap, zero recout */
 		memset(&spl_out->scl_data.recout, 0,
 				sizeof(struct spl_rect));
@@ -493,13 +497,11 @@ static void spl_calculate_init_and_vp(bool flip_scan_dir,
 
 static bool spl_is_yuv420(enum spl_pixel_format format)
 {
-	switch (format) {
-	case SPL_PIXEL_FORMAT_420BPP8:
-	case SPL_PIXEL_FORMAT_420BPP10:
+	if ((format >= SPL_PIXEL_FORMAT_VIDEO_BEGIN) &&
+		(format <= SPL_PIXEL_FORMAT_VIDEO_END))
 		return true;
-	default:
-		return false;
-	}
+
+	return false;
 }
 
 /*Calculate inits and viewport */
@@ -969,12 +971,17 @@ static bool enable_easf(int scale_ratio, int taps,
 }
 /* Set EASF data */
 static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
-	bool enable_easf_v, bool enable_easf_h, enum linear_light_scaling lls_pref)
+	bool enable_easf_v, bool enable_easf_h, enum linear_light_scaling lls_pref,
+	enum spl_pixel_format format)
 {
-	dscl_prog_data->easf_matrix_mode = 0;
+	if (spl_is_yuv420(format)) /* TODO: 0 = RGB, 1 = YUV */
+		dscl_prog_data->easf_matrix_mode = 1;
+	else
+		dscl_prog_data->easf_matrix_mode = 0;
+
 	if (enable_easf_v) {
 		dscl_prog_data->easf_v_en = true;
-		dscl_prog_data->easf_v_ring = 1;
+		dscl_prog_data->easf_v_ring = 0;
 		dscl_prog_data->easf_v_sharp_factor = 1;
 		dscl_prog_data->easf_v_bf1_en = 1;	// 1-bit, BF1 calculation enable, 0=disable, 1=enable
 		dscl_prog_data->easf_v_bf2_mode = 0xF;	// 4-bit, BF2 calculation mode
@@ -1081,10 +1088,12 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 				0x0780;	// FP0.6.6, BF3 Input value PWL Segment 5 (0.5)
 			dscl_prog_data->easf_v_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
 		}
-	}
+	} else
+		dscl_prog_data->easf_v_en = false;
+
 	if (enable_easf_h) {
 		dscl_prog_data->easf_h_en = true;
-		dscl_prog_data->easf_h_ring = 1;
+		dscl_prog_data->easf_h_ring = 0;
 		dscl_prog_data->easf_h_sharp_factor = 1;
 		dscl_prog_data->easf_h_bf1_en =
 			1;	// 1-bit, BF1 calculation enable, 0=disable, 1=enable
@@ -1177,7 +1186,9 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 				0x0780;	// FP0.6.6, BF3 Input value PWL Segment 5 (0.5)
 			dscl_prog_data->easf_h_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
 		} // if (lls_pref == LLS_PREF_YES)
-	}
+	} else
+		dscl_prog_data->easf_h_en = false;
+
 	if (lls_pref == LLS_PREF_YES)	{
 		dscl_prog_data->easf_ltonl_en = 1;	// Linear input
 		dscl_prog_data->easf_matrix_c0 =
@@ -1304,12 +1315,40 @@ static bool spl_get_isharp_en(struct adaptive_sharpness adp_sharpness,
 	}
 	return enable_isharp;
 }
+
+static bool spl_choose_lls_policy(enum spl_pixel_format format,
+	enum spl_transfer_func_type tf_type,
+	enum spl_transfer_func_predefined tf_predefined_type,
+	enum linear_light_scaling *lls_pref)
+{
+	if (spl_is_yuv420(format)) {
+		*lls_pref = LLS_PREF_NO;
+		if ((tf_type == SPL_TF_TYPE_PREDEFINED) || (tf_type == SPL_TF_TYPE_DISTRIBUTED_POINTS))
+			return true;
+	} else { /* RGB or YUV444 */
+		if (tf_type == SPL_TF_TYPE_PREDEFINED) {
+			if ((tf_predefined_type == SPL_TRANSFER_FUNCTION_HLG) ||
+				(tf_predefined_type == SPL_TRANSFER_FUNCTION_HLG12))
+				*lls_pref = LLS_PREF_NO;
+			else
+				*lls_pref = LLS_PREF_YES;
+			return true;
+		} else if (tf_type == SPL_TF_TYPE_BYPASS) {
+			*lls_pref = LLS_PREF_YES;
+			return true;
+		}
+	}
+	*lls_pref = LLS_PREF_NO;
+	return false;
+}
+
 /* Caclulate scaler parameters */
 bool spl_calculate_scaler_params(struct spl_in *spl_in, struct spl_out *spl_out)
 {
 	bool res = false;
 	bool enable_easf_v = false;
 	bool enable_easf_h = false;
+	bool lls_enable_easf = true;
 	// All SPL calls
 	/* recout calculation */
 	/* depends on h_active */
@@ -1335,17 +1374,33 @@ bool spl_calculate_scaler_params(struct spl_in *spl_in, struct spl_out *spl_out)
 
 	if (!res)
 		return res;
+
+	/*
+	 * If lls_pref is LLS_PREF_DONT_CARE, then use pixel format and transfer
+	 *  function to determine whether to use LINEAR or NONLINEAR scaling
+	 */
+	if (spl_in->lls_pref == LLS_PREF_DONT_CARE)
+		lls_enable_easf = spl_choose_lls_policy(spl_in->basic_in.format,
+			spl_in->basic_in.tf_type, spl_in->basic_in.tf_predefined_type,
+			&spl_in->lls_pref);
+
 	// Save all calculated parameters in dscl_prog_data structure to program hw registers
 	spl_set_dscl_prog_data(spl_in, spl_out);
-	// Enable EASF on vertical?
+
 	int vratio = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
 	int hratio = dc_fixpt_ceil(spl_out->scl_data.ratios.horz);
-	enable_easf_v = enable_easf(vratio, spl_out->scl_data.taps.v_taps, spl_in->lls_pref, spl_in->prefer_easf);
-	// Enable EASF on horizontal?
-	enable_easf_h = enable_easf(hratio, spl_out->scl_data.taps.h_taps, spl_in->lls_pref, spl_in->prefer_easf);
+	if (!lls_enable_easf || spl_in->disable_easf) {
+		enable_easf_v = false;
+		enable_easf_h = false;
+	} else {
+		/* Enable EASF on vertical? */
+		enable_easf_v = enable_easf(vratio, spl_out->scl_data.taps.v_taps, spl_in->lls_pref, spl_in->prefer_easf);
+		/* Enable EASF on horizontal? */
+		enable_easf_h = enable_easf(hratio, spl_out->scl_data.taps.h_taps, spl_in->lls_pref, spl_in->prefer_easf);
+	}
 	// Set EASF
-	spl_set_easf_data(spl_out->dscl_prog_data, enable_easf_v, enable_easf_h, spl_in->lls_pref);
-	// Set iSHARP
+	spl_set_easf_data(spl_out->dscl_prog_data, enable_easf_v, enable_easf_h, spl_in->lls_pref,
+		spl_in->basic_in.format);	// Set iSHARP
 	bool enable_isharp = spl_get_isharp_en(spl_in->adaptive_sharpness, vratio, hratio,
 								spl_out->scl_data.taps);
 	if (enable_isharp)
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
index c5ef15f16c68..0c9edee0582e 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
@@ -132,6 +132,26 @@ struct spl_scaler_data {
 	struct spl_inits inits;
 };
 
+enum spl_transfer_func_type {
+	SPL_TF_TYPE_PREDEFINED,
+	SPL_TF_TYPE_DISTRIBUTED_POINTS,
+	SPL_TF_TYPE_BYPASS,
+	SPL_TF_TYPE_HWPWL
+};
+
+enum spl_transfer_func_predefined {
+	SPL_TRANSFER_FUNCTION_SRGB,
+	SPL_TRANSFER_FUNCTION_BT709,
+	SPL_TRANSFER_FUNCTION_PQ,
+	SPL_TRANSFER_FUNCTION_LINEAR,
+	SPL_TRANSFER_FUNCTION_UNITY,
+	SPL_TRANSFER_FUNCTION_HLG,
+	SPL_TRANSFER_FUNCTION_HLG12,
+	SPL_TRANSFER_FUNCTION_GAMMA22,
+	SPL_TRANSFER_FUNCTION_GAMMA24,
+	SPL_TRANSFER_FUNCTION_GAMMA26
+};
+
 /*==============================================================*/
 /* Below structs are defined to hold hw register data */
 
@@ -400,7 +420,8 @@ struct basic_in	{
 	int mpc_combine_h; // MPC Horizontal Combine Factor (split_count)
 	int mpc_combine_v; // MPC Vertical Combine Factor (split_idx)
 	// Inputs for adaptive scaler - TODO
-	// struct dc_transfer_func transfer_func;	//	Transfer function
+	enum spl_transfer_func_type tf_type; /* Transfer function type */
+	enum spl_transfer_func_predefined tf_predefined_type; /* Transfer function predefined type */
 	// enum dc_transfer_func_predefined tf;
 	enum spl_color_space color_space;	//	Color Space
 	unsigned int max_luminance;	//	Max Luminance TODO: Is determined in dc_hw_sequencer.c is_sdr
@@ -441,6 +462,11 @@ struct spl_funcs	{
 		int *num_part_c);
 };
 
+struct spl_debug {
+	int visual_confirm_base_offset;
+	int visual_confirm_dpp_offset;
+};
+
 struct spl_in	{
 	struct basic_out basic_out;
 	struct basic_in basic_in;
@@ -452,6 +478,8 @@ struct spl_in	{
 	struct adaptive_sharpness adaptive_sharpness;	//	Adaptive Sharpness
 	enum linear_light_scaling lls_pref;	//	Linear Light Scaling
 	bool prefer_easf;
+	bool disable_easf;
+	struct spl_debug debug;
 };
 // end of SPL inputs
 
-- 
2.34.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A195A796
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2024 00:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C3610E710;
	Wed, 21 Aug 2024 22:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R0NqqzIR";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B520510E70F
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2024 22:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmRfbzrXXn1X5vhC1o3R12QmuPMkfoWgfC1VNSoKlf2hyKMIY3X4jS/uQCBjF8AfbHgU966qisFzb9pw2qHgAC9LWBApYSDehP0JKE7ftN1qDmO4ShV/SJzeMdZ3SILbrP15QpDy+R4zB/Vv1Ib/cFvbceROR6v9Mso+ZlLsLjaaEM7a7olYj2NXpIYFy1em7gueTJCR4t0Vz7SM04Mbm8pz5mDsuSzurlgrjpY8hrsoIfYuiy2m3M1cje8IUcwbNL2RtaB1K1A+4/qWbe926/l36sE/pPsgVfLeTV3NF7EoNJYr9GmPbkHGzFDzJkLcPnk+VsAyp1LnICb683mHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf0CI2UCGf4KNIRTD2cUoKnIRLC/RNqGv7PFeERgzDE=;
 b=a77dSXdEG4SLVoLZySl6fXRkLaCBkrKnjITKeNKf7E9tMLSS4aYIn84dmhKmgUWUeGVtBa2Ybv3S3fQLeX/+zeJ24ttFGGgmKlKgO5aP+OdnLsBG06z0Cnvyd/9hT5CBgIaJaXhQk5RFA+oAPqChFyJeGSmsNwU3vGqRi7qp/f3SD4pYAhqo+sDlQ6CAPt4tvJxpHY4MQ7vEyiFOwup5CDoNqSO52XPRTZfl2EUqo84fjp5VhGSM/K8slmBl4/itz9vMEYOHd1OQPq69oJ5JknpRrlGDSK6HP31W7f2QoZgrjWlp/7dMvRDreXKUu1nDXC69uQfvcWj5rBXBVyg6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf0CI2UCGf4KNIRTD2cUoKnIRLC/RNqGv7PFeERgzDE=;
 b=R0NqqzIR2yk9ZKuDxQHE7pSCKPXpOz1uPbpAxgwOD44dnS92//+P/UzI8wCU9dkGZj89wo5QDKUrsTpo/kVzXHQGmDcaxnvzOoeGnNjURc3W/ul4hNVXTIkRa9rIPwY4UZvCTON1ncfkts/1Ezh6rSPwWIa/gcHyXYCRDhdSo+o=
Received: from BN9PR03CA0422.namprd03.prod.outlook.com (2603:10b6:408:113::7)
 by CH3PR12MB8753.namprd12.prod.outlook.com (2603:10b6:610:178::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 22:04:51 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::a4) by BN9PR03CA0422.outlook.office365.com
 (2603:10b6:408:113::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Wed, 21 Aug 2024 22:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 22:04:50 +0000
Received: from mkmmarleung05.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 17:04:46 -0500
From: Zaeem Mohamed <zaeem.mohamed@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, <zaeem.mohamed@amd.com>, Samson Tam
 <Samson.Tam@amd.com>, Jun Lei <jun.lei@amd.com>
Subject: [PATCH 11/16] drm/amd/display: add back quality EASF and ISHARP and
 dc dependency changes
Date: Wed, 21 Aug 2024 18:01:53 -0400
Message-ID: <20240821220156.1498549-12-zaeem.mohamed@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821220156.1498549-1-zaeem.mohamed@amd.com>
References: <20240821220156.1498549-1-zaeem.mohamed@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|CH3PR12MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c99caf-641f-4a8e-fc36-08dcc22d479e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hBwN2QXMd/nHUR52GoKxpgBhfT7OhzJnccMRkj8QabWZGFu3bvktmQMRzArz?=
 =?us-ascii?Q?5RMXoNbIrlA6MpMvfAse+14QVfO8TDLhRSYz3eU09WfZbdcxjzDHukc4W6Gg?=
 =?us-ascii?Q?K2+Rn0b9DuAXlwgE2my+5emKcxY+8VBIUm6YfHHGljV2xWVQcEmbpYD7RTS2?=
 =?us-ascii?Q?7f0hP6FmxqdbIUv3cYCKKq0NxQ2H4fIcGNXtEY7hBm0qmWr4TjUr5eRCMILo?=
 =?us-ascii?Q?g242JssJXiTDIjHE60wOVCRCRy8PxnEknzHrgL/DZauWjnkX69XxLbdjnVo/?=
 =?us-ascii?Q?4m32Egx+YIvWP0KYQr7o1AI6YiaihKpypsTBC8s5QbKS44gJTf98/fUq2GL9?=
 =?us-ascii?Q?7f2ro9TFlPYYl8eTVZ8Fuj9N1kf+Uio9OE9jZealjkoS8C9mJ6PLZ1lz1WGW?=
 =?us-ascii?Q?9B3BM1VzTCQlgblqwmvfI0cWx+Yocx00xFjXTptvbVlsrysB0upiRdWdCKV9?=
 =?us-ascii?Q?dJxAevein015TUaZTdvT8PdYpq4TH8ziCmxxX/rQH6yEtzsfJcGzfEVaxNTF?=
 =?us-ascii?Q?c9mv+zCMk+d/uZrTRPidGwIrgffE+PrD54JtvWyK7fkugzthIEQQxTloj/+m?=
 =?us-ascii?Q?nuzGf5W2OXk8fu9bsjWMKSCKF9ypf8mjYZlKfuzmY2WCVCkfVjiFdtkyzpkj?=
 =?us-ascii?Q?E8PGG3MWHifDelIMfepSJwPo0/HcSolWQqRvYUGeISNdIIDm29x/IqnEbK84?=
 =?us-ascii?Q?/yio2G2EQzo/dEiFJj3k/ayEIvDOj7Tm3fVokChzeBsCk/UH4iaBiB7JZXyV?=
 =?us-ascii?Q?H4CqCnelsIOOCQpNzjVbrBd8JklezbWZGwo0H4tJK76mpiEv4f6DeMv3KVBT?=
 =?us-ascii?Q?bubWzw1fcmkKdaqtza/XP6s7fbqjfu8/4uuL9zp5tZfIH1nZyC8V5swWPwFY?=
 =?us-ascii?Q?8WmQOrm+BOzTnXh1eDxYiKKQ/d1YgJdUR5INtmm+/wKN5D0cVdl2+PfQXZY0?=
 =?us-ascii?Q?AyuTuDvP8+7/iOQWM3ok453eq7eaT2pUqeEUVyA5JJGb4cJngWoSdgT0cB/S?=
 =?us-ascii?Q?ENAvC46n/6JZugJYqNkMN7qa680mKnkljtyu6jdouAEaBaXoR/w82lCV9rGe?=
 =?us-ascii?Q?q1H0y7pgRh1QBzbagguoLiUvlF8Oi0xCEKhOjgxNQqnebwYbC5Kjfdjsr1wB?=
 =?us-ascii?Q?J0QqIMKCAtx99QW4bRKiMmlyE0olke67+jYvWhbyfubp3Iz4ffrdGTH7eUFq?=
 =?us-ascii?Q?QDP3D1U1ySSFi9jBM3emdJfuoFKpN0dm1Ly9DFpX0Mt7ICC1JzwBLo9A5VQ1?=
 =?us-ascii?Q?y66/JneOORLkBm2vhdHTxKNcqyrrKgrLxyjuDHmwNRGGgd1YMh25v+EZZ/8o?=
 =?us-ascii?Q?/nyIOOvIoDE+3wTYsSNHLnl0jSA+6PUjI4IyCsUo1Sv7qNkF2roarsHGzx2P?=
 =?us-ascii?Q?an2nw5nRGl8YjXEEZiWR+u+2Z0TId7j0hXX1k6LlBawGCh5vK8MPXPgFX7OD?=
 =?us-ascii?Q?CTdt5cwUmxrIATUDv7CXsqHGzpgHXPz/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 22:04:50.9905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c99caf-641f-4a8e-fc36-08dcc22d479e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8753
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
Addressed previous issues with quality changes and new issues due to
 rolling back quality changes.

[How]
This reverts commit f4c206eb937e5acb12c295cb3895c112766202bc, fixes merge conflicts, and fixed some
 formatting errors.
Store current sharpness level for each pregen table to minimize
 calculating sharpness table every time.
Disable dynamic ODM when sharpness is enabled.

Reviewed-by: Jun Lei <jun.lei@amd.com>
Signed-off-by: Samson Tam <Samson.Tam@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c |    2 -
 .../gpu/drm/amd/display/dc/dc_spl_translate.c |   48 +-
 .../gpu/drm/amd/display/dc/dc_spl_translate.h |    1 +
 .../dc/dml2/dml21/dml21_translation_helper.c  |   11 +-
 .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   |  568 +++---
 .../dc/resource/dcn401/dcn401_resource.c      |    7 +
 drivers/gpu/drm/amd/display/dc/spl/Makefile   |    2 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c   | 1313 ++++++++-----
 .../drm/amd/display/dc/spl/dc_spl_filters.c   |   15 +
 .../drm/amd/display/dc/spl/dc_spl_filters.h   |   15 +
 .../display/dc/spl/dc_spl_isharp_filters.c    |  460 ++++-
 .../display/dc/spl/dc_spl_isharp_filters.h    |   35 +-
 .../display/dc/spl/dc_spl_scl_easf_filters.c  | 1726 +++++++++++++++++
 .../display/dc/spl/dc_spl_scl_easf_filters.h  |   38 +
 .../amd/display/dc/spl/dc_spl_scl_filters.c   |   91 +-
 .../amd/display/dc/spl/dc_spl_scl_filters.h   |   55 +-
 .../display/dc/spl/dc_spl_scl_filters_old.c   |   25 -
 .../gpu/drm/amd/display/dc/spl/dc_spl_types.h |   43 +-
 .../gpu/drm/amd/display/dc/spl/spl_debug.h    |   25 +
 .../drm/amd/display/dc/spl/spl_fixpt31_32.c   |  497 +++++
 .../drm/amd/display/dc/spl/spl_fixpt31_32.h   |  525 +++++
 21 files changed, 4507 insertions(+), 995 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters_old.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index ef585a89847b..c7599c40d4be 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1506,8 +1506,6 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
 
 		pipe_ctx->plane_res.scl_data.lb_params.alpha_en = plane_state->per_pixel_alpha;
-		spl_out->scl_data.h_active = pipe_ctx->plane_res.scl_data.h_active;
-		spl_out->scl_data.v_active = pipe_ctx->plane_res.scl_data.v_active;
 
 		// Convert pipe_ctx to respective input params for SPL
 		translate_SPL_in_params_from_pipe_ctx(pipe_ctx, spl_in);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
index 8f85a1db5eba..92ad0bac182c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
@@ -42,26 +42,26 @@ static void populate_spltaps_from_taps(struct spl_taps *spl_scaling_quality,
 static void populate_taps_from_spltaps(struct scaling_taps *scaling_quality,
 		const struct spl_taps *spl_scaling_quality)
 {
-	scaling_quality->h_taps_c = spl_scaling_quality->h_taps_c;
-	scaling_quality->h_taps = spl_scaling_quality->h_taps;
-	scaling_quality->v_taps_c = spl_scaling_quality->v_taps_c;
-	scaling_quality->v_taps = spl_scaling_quality->v_taps;
+	scaling_quality->h_taps_c = spl_scaling_quality->h_taps_c + 1;
+	scaling_quality->h_taps = spl_scaling_quality->h_taps + 1;
+	scaling_quality->v_taps_c = spl_scaling_quality->v_taps_c + 1;
+	scaling_quality->v_taps = spl_scaling_quality->v_taps + 1;
 }
 static void populate_ratios_from_splratios(struct scaling_ratios *ratios,
-		const struct spl_ratios *spl_ratios)
+		const struct ratio *spl_ratios)
 {
-	ratios->horz = spl_ratios->horz;
-	ratios->vert = spl_ratios->vert;
-	ratios->horz_c = spl_ratios->horz_c;
-	ratios->vert_c = spl_ratios->vert_c;
+	ratios->horz = dc_fixpt_from_ux_dy(spl_ratios->h_scale_ratio >> 5, 3, 19);
+	ratios->vert = dc_fixpt_from_ux_dy(spl_ratios->v_scale_ratio >> 5, 3, 19);
+	ratios->horz_c = dc_fixpt_from_ux_dy(spl_ratios->h_scale_ratio_c >> 5, 3, 19);
+	ratios->vert_c = dc_fixpt_from_ux_dy(spl_ratios->v_scale_ratio_c >> 5, 3, 19);
 }
 static void populate_inits_from_splinits(struct scl_inits *inits,
-		const struct spl_inits *spl_inits)
+		const struct init *spl_inits)
 {
-	inits->h = spl_inits->h;
-	inits->v = spl_inits->v;
-	inits->h_c = spl_inits->h_c;
-	inits->v_c = spl_inits->v_c;
+	inits->h = dc_fixpt_from_int_dy(spl_inits->h_filter_init_int, spl_inits->h_filter_init_frac >> 5, 0, 19);
+	inits->v = dc_fixpt_from_int_dy(spl_inits->v_filter_init_int, spl_inits->v_filter_init_frac >> 5, 0, 19);
+	inits->h_c = dc_fixpt_from_int_dy(spl_inits->h_filter_init_int_c, spl_inits->h_filter_init_frac_c >> 5, 0, 19);
+	inits->v_c = dc_fixpt_from_int_dy(spl_inits->v_filter_init_int_c, spl_inits->v_filter_init_frac_c >> 5, 0, 19);
 }
 /// @brief Translate SPL input parameters from pipe context
 /// @param pipe_ctx
@@ -171,6 +171,14 @@ void translate_SPL_in_params_from_pipe_ctx(struct pipe_ctx *pipe_ctx, struct spl
 	/* Translate transfer function */
 	spl_in->basic_in.tf_type = (enum spl_transfer_func_type) plane_state->in_transfer_func.type;
 	spl_in->basic_in.tf_predefined_type = (enum spl_transfer_func_predefined) plane_state->in_transfer_func.tf;
+
+	spl_in->h_active = pipe_ctx->plane_res.scl_data.h_active;
+	spl_in->v_active = pipe_ctx->plane_res.scl_data.v_active;
+	/* Check if it is stream is in fullscreen and if its HDR.
+	 * Use this to determine sharpness levels
+	 */
+	spl_in->is_fullscreen = dm_helpers_is_fullscreen(pipe_ctx->stream->ctx, pipe_ctx->stream);
+	spl_in->is_hdr_on = dm_helpers_is_hdr_on(pipe_ctx->stream->ctx, pipe_ctx->stream);
 }
 
 /// @brief Translate SPL output parameters to pipe context
@@ -179,15 +187,15 @@ void translate_SPL_in_params_from_pipe_ctx(struct pipe_ctx *pipe_ctx, struct spl
 void translate_SPL_out_params_to_pipe_ctx(struct pipe_ctx *pipe_ctx, struct spl_out *spl_out)
 {
 	// Make scaler data recout point to spl output field recout
-	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.recout, &spl_out->scl_data.recout);
+	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.recout, &spl_out->dscl_prog_data->recout);
 	// Make scaler data ratios point to spl output field ratios
-	populate_ratios_from_splratios(&pipe_ctx->plane_res.scl_data.ratios, &spl_out->scl_data.ratios);
+	populate_ratios_from_splratios(&pipe_ctx->plane_res.scl_data.ratios, &spl_out->dscl_prog_data->ratios);
 	// Make scaler data viewport point to spl output field viewport
-	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.viewport, &spl_out->scl_data.viewport);
+	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.viewport, &spl_out->dscl_prog_data->viewport);
 	// Make scaler data viewport_c point to spl output field viewport_c
-	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.viewport_c, &spl_out->scl_data.viewport_c);
+	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.viewport_c, &spl_out->dscl_prog_data->viewport_c);
 	// Make scaler data taps point to spl output field scaling taps
-	populate_taps_from_spltaps(&pipe_ctx->plane_res.scl_data.taps, &spl_out->scl_data.taps);
+	populate_taps_from_spltaps(&pipe_ctx->plane_res.scl_data.taps, &spl_out->dscl_prog_data->taps);
 	// Make scaler data init point to spl output field init
-	populate_inits_from_splinits(&pipe_ctx->plane_res.scl_data.inits, &spl_out->scl_data.inits);
+	populate_inits_from_splinits(&pipe_ctx->plane_res.scl_data.inits, &spl_out->dscl_prog_data->init);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.h b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.h
index c73d640c3632..eaa5c5373b28 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.h
@@ -6,6 +6,7 @@
 #define __DC_SPL_TRANSLATE_H__
 #include "dc.h"
 #include "resource.h"
+#include "dm_helpers.h"
 
 /* Map SPL input parameters to pipe context
  * @pipe_ctx: pipe context
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index 710a25dcfef0..86a877f9a2ec 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -514,7 +514,8 @@ static void populate_dml21_stream_overrides_from_stream_state(
 		break;
 	}
 	if (!stream->ctx->dc->debug.enable_single_display_2to1_odm_policy ||
-			stream->debug.force_odm_combine_segments > 0)
+			stream->debug.force_odm_combine_segments > 0 ||
+			stream->ctx->dc->debug.force_sharpness > 1)
 		stream_desc->overrides.disable_dynamic_odm = true;
 	stream_desc->overrides.disable_subvp = stream->ctx->dc->debug.force_disable_subvp || stream->hw_cursor_req;
 }
@@ -777,6 +778,14 @@ static void populate_dml21_plane_config_from_plane_state(struct dml2_context *dm
 		 * certain cases. Hence do corrective active and disable scaling.
 		 */
 		plane->composition.scaler_info.enabled = false;
+	} else if ((plane_state->ctx->dc->config.use_spl == true) &&
+		(plane->composition.scaler_info.enabled == false)) {
+		/* To enable sharpener for 1:1, scaler must be enabled.  If use_spl is set, then
+		 *  allow case where ratio is 1 but taps > 1
+		 */
+		if ((scaler_data->taps.h_taps > 1) || (scaler_data->taps.v_taps > 1) ||
+			(scaler_data->taps.h_taps_c > 1) || (scaler_data->taps.v_taps_c > 1))
+			plane->composition.scaler_info.enabled = true;
 	}
 
 	/* always_scale is only used for debug purposes not used in production but has to be
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
index 505929800426..703d7b51c6c2 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
@@ -280,7 +280,8 @@ static void dpp401_dscl_set_scaler_filter(
 static void dpp401_dscl_set_scl_filter(
 		struct dcn401_dpp *dpp,
 		const struct scaler_data *scl_data,
-		bool chroma_coef_mode)
+		bool chroma_coef_mode,
+		bool force_coeffs_update)
 {
 	bool h_2tap_hardcode_coef_en = false;
 	bool v_2tap_hardcode_coef_en = false;
@@ -343,7 +344,7 @@ static void dpp401_dscl_set_scl_filter(
 							|| (filter_v_c && (filter_v_c != dpp->filter_v_c));
 		}
 
-		if (filter_updated) {
+		if ((filter_updated) || (force_coeffs_update)) {
 			uint32_t scl_mode = REG_READ(SCL_MODE);
 
 			if (!h_2tap_hardcode_coef_en && filter_h) {
@@ -656,274 +657,252 @@ static void dpp401_dscl_set_recout(struct dcn401_dpp *dpp,
 		  RECOUT_HEIGHT, recout->height);
 }
 /**
- * dpp401_dscl_program_easf - Program EASF
+ * dpp401_dscl_program_easf_v - Program EASF_V
  *
  * @dpp_base: High level DPP struct
  * @scl_data: scalaer_data info
  *
- * This is the primary function to program EASF
+ * This is the primary function to program vertical EASF registers
  *
  */
-static void dpp401_dscl_program_easf(struct dpp *dpp_base, const struct scaler_data *scl_data)
+static void dpp401_dscl_program_easf_v(struct dpp *dpp_base, const struct scaler_data *scl_data)
 {
 	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
 
 	PERF_TRACE();
-	REG_UPDATE(DSCL_SC_MODE,
-			SCL_SC_MATRIX_MODE, scl_data->dscl_prog_data.easf_matrix_mode);
-	REG_UPDATE(DSCL_SC_MODE,
-			SCL_SC_LTONL_EN, scl_data->dscl_prog_data.easf_ltonl_en);
 	/* DSCL_EASF_V_MODE */
-	REG_UPDATE(DSCL_EASF_V_MODE,
-			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en);
-	REG_UPDATE(DSCL_EASF_V_MODE,
-			SCL_EASF_V_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_v_sharp_factor);
-	REG_UPDATE(DSCL_EASF_V_MODE,
+	REG_SET_3(DSCL_EASF_V_MODE, 0,
+			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en,
+			SCL_EASF_V_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_v_sharp_factor,
 			SCL_EASF_V_RINGEST_FORCE_EN, scl_data->dscl_prog_data.easf_v_ring);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF1_EN, scl_data->dscl_prog_data.easf_v_bf1_en);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF2_MODE, scl_data->dscl_prog_data.easf_v_bf2_mode);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF3_MODE, scl_data->dscl_prog_data.easf_v_bf3_mode);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat1_gain);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat2_gain);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
+
+	if (!scl_data->dscl_prog_data.easf_v_en) {
+		PERF_TRACE();
+		return;
+	}
+
+	/* DSCL_EASF_V_BF_CNTL */
+	REG_SET_6(DSCL_EASF_V_BF_CNTL, 0,
+			SCL_EASF_V_BF1_EN, scl_data->dscl_prog_data.easf_v_bf1_en,
+			SCL_EASF_V_BF2_MODE, scl_data->dscl_prog_data.easf_v_bf2_mode,
+			SCL_EASF_V_BF3_MODE, scl_data->dscl_prog_data.easf_v_bf3_mode,
+			SCL_EASF_V_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat1_gain,
+			SCL_EASF_V_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat2_gain,
 			SCL_EASF_V_BF2_ROC_GAIN, scl_data->dscl_prog_data.easf_v_bf2_roc_gain);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL1,
-		SCL_EASF_V_RINGEST_3TAP_DNTILT_UPTILT, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_uptilt);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL1,
+	/* DSCL_EASF_V_RINGEST_3TAP_CNTLn */
+	REG_SET_2(DSCL_EASF_V_RINGEST_3TAP_CNTL1, 0,
+		SCL_EASF_V_RINGEST_3TAP_DNTILT_UPTILT, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_uptilt,
 		SCL_EASF_V_RINGEST_3TAP_UPTILT_MAXVAL, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt_max);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL2,
-		SCL_EASF_V_RINGEST_3TAP_DNTILT_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_slope);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL2,
+	REG_SET_2(DSCL_EASF_V_RINGEST_3TAP_CNTL2, 0,
+		SCL_EASF_V_RINGEST_3TAP_DNTILT_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_slope,
 		SCL_EASF_V_RINGEST_3TAP_UPTILT1_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt1_slope);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL3,
-		SCL_EASF_V_RINGEST_3TAP_UPTILT2_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_slope);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL3,
+	REG_SET_2(DSCL_EASF_V_RINGEST_3TAP_CNTL3, 0,
+		SCL_EASF_V_RINGEST_3TAP_UPTILT2_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_slope,
 		SCL_EASF_V_RINGEST_3TAP_UPTILT2_OFFSET, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_offset);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE,
-		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg1);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE,
+	/* DSCL_EASF_V_RINGEST_EVENTAP_REDUCE */
+	REG_SET_2(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE, 0,
+		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg1,
 		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG2, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg2);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_GAIN,
-		SCL_EASF_V_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain1);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_GAIN,
+	/* DSCL_EASF_V_RINGEST_EVENTAP_GAIN */
+	REG_SET_2(DSCL_EASF_V_RINGEST_EVENTAP_GAIN, 0,
+		SCL_EASF_V_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain1,
 		SCL_EASF_V_RINGEST_EVENTAP_GAIN2, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain2);
-	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
-			SCL_EASF_V_BF_MAXA, scl_data->dscl_prog_data.easf_v_bf_maxa);
-	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
-			SCL_EASF_V_BF_MAXB, scl_data->dscl_prog_data.easf_v_bf_maxb);
-	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
-			SCL_EASF_V_BF_MINA, scl_data->dscl_prog_data.easf_v_bf_mina);
-	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
+	/* DSCL_EASF_V_BF_FINAL_MAX_MIN */
+	REG_SET_4(DSCL_EASF_V_BF_FINAL_MAX_MIN, 0,
+			SCL_EASF_V_BF_MAXA, scl_data->dscl_prog_data.easf_v_bf_maxa,
+			SCL_EASF_V_BF_MAXB, scl_data->dscl_prog_data.easf_v_bf_maxb,
+			SCL_EASF_V_BF_MINA, scl_data->dscl_prog_data.easf_v_bf_mina,
 			SCL_EASF_V_BF_MINB, scl_data->dscl_prog_data.easf_v_bf_minb);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
-			SCL_EASF_V_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg0);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
-			SCL_EASF_V_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg0);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
+	/* DSCL_EASF_V_BF1_PWL_SEGn */
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG0, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg0,
+			SCL_EASF_V_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg0,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg0);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
-			SCL_EASF_V_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg1);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
-			SCL_EASF_V_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg1);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG1, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg1,
+			SCL_EASF_V_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg1,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg1);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
-			SCL_EASF_V_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg2);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
-			SCL_EASF_V_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg2);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG2, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg2,
+			SCL_EASF_V_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg2,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg2);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
-			SCL_EASF_V_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg3);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
-			SCL_EASF_V_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg3);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG3, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg3,
+			SCL_EASF_V_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg3,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg3);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
-			SCL_EASF_V_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg4);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
-			SCL_EASF_V_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg4);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG4, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg4,
+			SCL_EASF_V_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg4,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg4);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
-			SCL_EASF_V_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg5);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
-			SCL_EASF_V_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg5);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG5, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg5,
+			SCL_EASF_V_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg5,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg5);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
-			SCL_EASF_V_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg6);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
-			SCL_EASF_V_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg6);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG6, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg6,
+			SCL_EASF_V_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg6,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg6);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG7,
-			SCL_EASF_V_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg7);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG7,
+	REG_SET_2(DSCL_EASF_V_BF1_PWL_SEG7, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg7,
 			SCL_EASF_V_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg7);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
-			SCL_EASF_V_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set0);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
-			SCL_EASF_V_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set0);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
+	/* DSCL_EASF_V_BF3_PWL_SEGn */
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG0, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set0,
+			SCL_EASF_V_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set0,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set0);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
-			SCL_EASF_V_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set1);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
-			SCL_EASF_V_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set1);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG1, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set1,
+			SCL_EASF_V_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set1,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set1);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
-			SCL_EASF_V_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set2);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
-			SCL_EASF_V_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set2);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG2, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set2,
+			SCL_EASF_V_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set2,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set2);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
-			SCL_EASF_V_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set3);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
-			SCL_EASF_V_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set3);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG3, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set3,
+			SCL_EASF_V_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set3,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set3);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
-			SCL_EASF_V_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set4);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
-			SCL_EASF_V_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set4);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG4, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set4,
+			SCL_EASF_V_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set4,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set4);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG5,
-			SCL_EASF_V_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set5);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG5,
+	REG_SET_2(DSCL_EASF_V_BF3_PWL_SEG5, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set5,
 			SCL_EASF_V_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set5);
+	PERF_TRACE();
+}
+/**
+ * dpp401_dscl_program_easf_h - Program EASF_H
+ *
+ * @dpp_base: High level DPP struct
+ * @scl_data: scalaer_data info
+ *
+ * This is the primary function to program horizontal EASF registers
+ *
+ */
+static void dpp401_dscl_program_easf_h(struct dpp *dpp_base, const struct scaler_data *scl_data)
+{
+	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
+
+	PERF_TRACE();
 	/* DSCL_EASF_H_MODE */
-	REG_UPDATE(DSCL_EASF_H_MODE,
-			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en);
-	REG_UPDATE(DSCL_EASF_H_MODE,
-			SCL_EASF_H_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_h_sharp_factor);
-	REG_UPDATE(DSCL_EASF_H_MODE,
+	REG_SET_3(DSCL_EASF_H_MODE, 0,
+			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en,
+			SCL_EASF_H_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_h_sharp_factor,
 			SCL_EASF_H_RINGEST_FORCE_EN, scl_data->dscl_prog_data.easf_h_ring);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF1_EN, scl_data->dscl_prog_data.easf_h_bf1_en);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF2_MODE, scl_data->dscl_prog_data.easf_h_bf2_mode);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF3_MODE, scl_data->dscl_prog_data.easf_h_bf3_mode);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat1_gain);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat2_gain);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
+
+	if (!scl_data->dscl_prog_data.easf_h_en) {
+		PERF_TRACE();
+		return;
+	}
+
+	/* DSCL_EASF_H_BF_CNTL */
+	REG_SET_6(DSCL_EASF_H_BF_CNTL, 0,
+			SCL_EASF_H_BF1_EN, scl_data->dscl_prog_data.easf_h_bf1_en,
+			SCL_EASF_H_BF2_MODE, scl_data->dscl_prog_data.easf_h_bf2_mode,
+			SCL_EASF_H_BF3_MODE, scl_data->dscl_prog_data.easf_h_bf3_mode,
+			SCL_EASF_H_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat1_gain,
+			SCL_EASF_H_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat2_gain,
 			SCL_EASF_H_BF2_ROC_GAIN, scl_data->dscl_prog_data.easf_h_bf2_roc_gain);
-	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE,
-			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg1);
-	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE,
+	/* DSCL_EASF_H_RINGEST_EVENTAP_REDUCE */
+	REG_SET_2(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE, 0,
+			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg1,
 			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG2, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg2);
-	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_GAIN,
-			SCL_EASF_H_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain1);
-	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_GAIN,
+	/* DSCL_EASF_H_RINGEST_EVENTAP_GAIN */
+	REG_SET_2(DSCL_EASF_H_RINGEST_EVENTAP_GAIN, 0,
+			SCL_EASF_H_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain1,
 			SCL_EASF_H_RINGEST_EVENTAP_GAIN2, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain2);
-	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
-			SCL_EASF_H_BF_MAXA, scl_data->dscl_prog_data.easf_h_bf_maxa);
-	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
-			SCL_EASF_H_BF_MAXB, scl_data->dscl_prog_data.easf_h_bf_maxb);
-	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
-			SCL_EASF_H_BF_MINA, scl_data->dscl_prog_data.easf_h_bf_mina);
-	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
+	/* DSCL_EASF_H_BF_FINAL_MAX_MIN */
+	REG_SET_4(DSCL_EASF_H_BF_FINAL_MAX_MIN, 0,
+			SCL_EASF_H_BF_MAXA, scl_data->dscl_prog_data.easf_h_bf_maxa,
+			SCL_EASF_H_BF_MAXB, scl_data->dscl_prog_data.easf_h_bf_maxb,
+			SCL_EASF_H_BF_MINA, scl_data->dscl_prog_data.easf_h_bf_mina,
 			SCL_EASF_H_BF_MINB, scl_data->dscl_prog_data.easf_h_bf_minb);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
-			SCL_EASF_H_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg0);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
-			SCL_EASF_H_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg0);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
+	/* DSCL_EASF_H_BF1_PWL_SEGn */
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG0, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg0,
+			SCL_EASF_H_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg0,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg0);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
-			SCL_EASF_H_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg1);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
-			SCL_EASF_H_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg1);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG1, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg1,
+			SCL_EASF_H_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg1,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg1);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
-			SCL_EASF_H_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg2);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
-			SCL_EASF_H_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg2);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG2, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg2,
+			SCL_EASF_H_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg2,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg2);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
-			SCL_EASF_H_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg3);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
-			SCL_EASF_H_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg3);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG3, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg3,
+			SCL_EASF_H_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg3,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg3);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
-			SCL_EASF_H_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg4);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
-			SCL_EASF_H_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg4);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG4, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg4,
+			SCL_EASF_H_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg4,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg4);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
-			SCL_EASF_H_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg5);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
-			SCL_EASF_H_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg5);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG5, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg5,
+			SCL_EASF_H_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg5,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg5);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
-			SCL_EASF_H_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg6);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
-			SCL_EASF_H_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg6);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG6, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg6,
+			SCL_EASF_H_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg6,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg6);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG7,
-			SCL_EASF_H_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg7);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG7,
+	REG_SET_2(DSCL_EASF_H_BF1_PWL_SEG7, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg7,
 			SCL_EASF_H_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg7);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
-			SCL_EASF_H_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set0);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
-			SCL_EASF_H_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set0);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
+	/* DSCL_EASF_H_BF3_PWL_SEGn */
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG0, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set0,
+			SCL_EASF_H_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set0,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set0);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
-			SCL_EASF_H_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set1);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
-			SCL_EASF_H_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set1);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG1, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set1,
+			SCL_EASF_H_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set1,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set1);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
-			SCL_EASF_H_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set2);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
-			SCL_EASF_H_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set2);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG2, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set2,
+			SCL_EASF_H_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set2,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set2);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
-			SCL_EASF_H_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set3);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
-			SCL_EASF_H_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set3);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG3, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set3,
+			SCL_EASF_H_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set3,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set3);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
-			SCL_EASF_H_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set4);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
-			SCL_EASF_H_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set4);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG4, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set4,
+			SCL_EASF_H_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set4,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set4);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG5,
-			SCL_EASF_H_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set5);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG5,
+	REG_SET_2(DSCL_EASF_H_BF3_PWL_SEG5, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set5,
 			SCL_EASF_H_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set5);
+	PERF_TRACE();
+}
+/**
+ * dpp401_dscl_program_easf - Program EASF
+ *
+ * @dpp_base: High level DPP struct
+ * @scl_data: scalaer_data info
+ *
+ * This is the primary function to program EASF
+ *
+ */
+static void dpp401_dscl_program_easf(struct dpp *dpp_base, const struct scaler_data *scl_data)
+{
+	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
+
+	PERF_TRACE();
+	/* DSCL_SC_MODE */
+	REG_SET_2(DSCL_SC_MODE, 0,
+			SCL_SC_MATRIX_MODE, scl_data->dscl_prog_data.easf_matrix_mode,
+			SCL_SC_LTONL_EN, scl_data->dscl_prog_data.easf_ltonl_en);
 	/* DSCL_EASF_SC_MATRIX_C0C1, DSCL_EASF_SC_MATRIX_C2C3 */
-	REG_UPDATE(DSCL_SC_MATRIX_C0C1,
-			SCL_SC_MATRIX_C0, scl_data->dscl_prog_data.easf_matrix_c0);
-	REG_UPDATE(DSCL_SC_MATRIX_C0C1,
+	REG_SET_2(DSCL_SC_MATRIX_C0C1, 0,
+			SCL_SC_MATRIX_C0, scl_data->dscl_prog_data.easf_matrix_c0,
 			SCL_SC_MATRIX_C1, scl_data->dscl_prog_data.easf_matrix_c1);
-	REG_UPDATE(DSCL_SC_MATRIX_C2C3,
-			SCL_SC_MATRIX_C2, scl_data->dscl_prog_data.easf_matrix_c2);
-	REG_UPDATE(DSCL_SC_MATRIX_C2C3,
+	REG_SET_2(DSCL_SC_MATRIX_C2C3, 0,
+			SCL_SC_MATRIX_C2, scl_data->dscl_prog_data.easf_matrix_c2,
 			SCL_SC_MATRIX_C3, scl_data->dscl_prog_data.easf_matrix_c3);
+	dpp401_dscl_program_easf_v(dpp_base, scl_data);
+	dpp401_dscl_program_easf_h(dpp_base, scl_data);
 	PERF_TRACE();
 }
 /**
@@ -958,10 +937,11 @@ static void dpp401_dscl_set_isharp_filter(
 
 	REG_UPDATE(ISHARP_DELTA_CTRL,
 		ISHARP_DELTA_LUT_HOST_SELECT, 0);
+	/* LUT data write is auto-indexed.  Write index once */
+	REG_SET(ISHARP_DELTA_INDEX, 0,
+			ISHARP_DELTA_INDEX, 0);
 	for (level = 0; level < NUM_LEVELS; level++)	{
 		filter_data = filter[level];
-		REG_SET(ISHARP_DELTA_INDEX, 0,
-				ISHARP_DELTA_INDEX, level);
 		REG_SET(ISHARP_DELTA_DATA, 0,
 				ISHARP_DELTA_DATA, filter_data);
 	}
@@ -976,107 +956,74 @@ static void dpp401_dscl_set_isharp_filter(
  *
  */
 static void dpp401_dscl_program_isharp(struct dpp *dpp_base,
-		const struct scaler_data *scl_data)
+		const struct scaler_data *scl_data,
+		bool *bs_coeffs_updated)
 {
 	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
+	*bs_coeffs_updated = false;
 
 	PERF_TRACE();
-	/* ISHARP_EN */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_EN, scl_data->dscl_prog_data.isharp_en);
-	/* ISHARP_NOISEDET_EN */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_NOISEDET_EN, scl_data->dscl_prog_data.isharp_noise_det.enable);
-	/* ISHARP_NOISEDET_MODE */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
-	/* ISHARP_NOISEDET_UTHRE */
-	REG_UPDATE(ISHARP_NOISEDET_THRESHOLD,
-		ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
-	/* ISHARP_NOISEDET_DTHRE */
-	REG_UPDATE(ISHARP_NOISEDET_THRESHOLD,
-		ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
-	/* ISHARP_NOISEDET_UTHRE */
-	REG_UPDATE(ISHARP_NOISEDET_THRESHOLD,
-		ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
-	/* ISHARP_NOISEDET_DTHRE */
-	REG_UPDATE(ISHARP_NOISEDET_THRESHOLD,
+	/* ISHARP_MODE */
+	REG_SET_6(ISHARP_MODE, 0,
+		ISHARP_EN, scl_data->dscl_prog_data.isharp_en,
+		ISHARP_NOISEDET_EN, scl_data->dscl_prog_data.isharp_noise_det.enable,
+		ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode,
+		ISHARP_LBA_MODE, scl_data->dscl_prog_data.isharp_lba.mode,
+		ISHARP_FMT_MODE, scl_data->dscl_prog_data.isharp_fmt.mode,
+		ISHARP_FMT_NORM, scl_data->dscl_prog_data.isharp_fmt.norm);
+
+	/* Skip remaining register programming if ISHARP is disabled */
+	if (!scl_data->dscl_prog_data.isharp_en) {
+		PERF_TRACE();
+		return;
+	}
+
+	/* ISHARP_NOISEDET_THRESHOLD */
+	REG_SET_2(ISHARP_NOISEDET_THRESHOLD, 0,
+		ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold,
 		ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
-	/* ISHARP_NOISEDET_PWL_START_IN */
-	REG_UPDATE(ISHARP_NOISE_GAIN_PWL,
-		ISHARP_NOISEDET_PWL_START_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_start_in);
-	/* ISHARP_NOISEDET_PWL_END_IN */
-	REG_UPDATE(ISHARP_NOISE_GAIN_PWL,
-		ISHARP_NOISEDET_PWL_END_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_end_in);
-	/* ISHARP_NOISEDET_PWL_SLOPE */
-	REG_UPDATE(ISHARP_NOISE_GAIN_PWL,
+
+	/* ISHARP_NOISE_GAIN_PWL */
+	REG_SET_3(ISHARP_NOISE_GAIN_PWL, 0,
+		ISHARP_NOISEDET_PWL_START_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_start_in,
+		ISHARP_NOISEDET_PWL_END_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_end_in,
 		ISHARP_NOISEDET_PWL_SLOPE, scl_data->dscl_prog_data.isharp_noise_det.pwl_slope);
-	/* ISHARP_LBA_MODE */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_LBA_MODE, scl_data->dscl_prog_data.isharp_lba.mode);
+
 	/* ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG */
-	REG_UPDATE(ISHARP_LBA_PWL_SEG0,
-		ISHARP_LBA_PWL_IN_SEG0, scl_data->dscl_prog_data.isharp_lba.in_seg[0]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG0,
-		ISHARP_LBA_PWL_BASE_SEG0, scl_data->dscl_prog_data.isharp_lba.base_seg[0]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG0,
+	REG_SET_3(ISHARP_LBA_PWL_SEG0, 0,
+		ISHARP_LBA_PWL_IN_SEG0, scl_data->dscl_prog_data.isharp_lba.in_seg[0],
+		ISHARP_LBA_PWL_BASE_SEG0, scl_data->dscl_prog_data.isharp_lba.base_seg[0],
 		ISHARP_LBA_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.isharp_lba.slope_seg[0]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG1,
-		ISHARP_LBA_PWL_IN_SEG1, scl_data->dscl_prog_data.isharp_lba.in_seg[1]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG1,
-		ISHARP_LBA_PWL_BASE_SEG1, scl_data->dscl_prog_data.isharp_lba.base_seg[1]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG1,
+	REG_SET_3(ISHARP_LBA_PWL_SEG1, 0,
+		ISHARP_LBA_PWL_IN_SEG1, scl_data->dscl_prog_data.isharp_lba.in_seg[1],
+		ISHARP_LBA_PWL_BASE_SEG1, scl_data->dscl_prog_data.isharp_lba.base_seg[1],
 		ISHARP_LBA_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.isharp_lba.slope_seg[1]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG2,
-		ISHARP_LBA_PWL_IN_SEG2, scl_data->dscl_prog_data.isharp_lba.in_seg[2]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG2,
-		ISHARP_LBA_PWL_BASE_SEG2, scl_data->dscl_prog_data.isharp_lba.base_seg[2]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG2,
+	REG_SET_3(ISHARP_LBA_PWL_SEG2, 0,
+		ISHARP_LBA_PWL_IN_SEG2, scl_data->dscl_prog_data.isharp_lba.in_seg[2],
+		ISHARP_LBA_PWL_BASE_SEG2, scl_data->dscl_prog_data.isharp_lba.base_seg[2],
 		ISHARP_LBA_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.isharp_lba.slope_seg[2]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG3,
-		ISHARP_LBA_PWL_IN_SEG3, scl_data->dscl_prog_data.isharp_lba.in_seg[3]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG3,
-		ISHARP_LBA_PWL_BASE_SEG3, scl_data->dscl_prog_data.isharp_lba.base_seg[3]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG3,
+	REG_SET_3(ISHARP_LBA_PWL_SEG3, 0,
+		ISHARP_LBA_PWL_IN_SEG3, scl_data->dscl_prog_data.isharp_lba.in_seg[3],
+		ISHARP_LBA_PWL_BASE_SEG3, scl_data->dscl_prog_data.isharp_lba.base_seg[3],
 		ISHARP_LBA_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.isharp_lba.slope_seg[3]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG4,
-		ISHARP_LBA_PWL_IN_SEG4, scl_data->dscl_prog_data.isharp_lba.in_seg[4]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG4,
-		ISHARP_LBA_PWL_BASE_SEG4, scl_data->dscl_prog_data.isharp_lba.base_seg[4]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG4,
+	REG_SET_3(ISHARP_LBA_PWL_SEG4, 0,
+		ISHARP_LBA_PWL_IN_SEG4, scl_data->dscl_prog_data.isharp_lba.in_seg[4],
+		ISHARP_LBA_PWL_BASE_SEG4, scl_data->dscl_prog_data.isharp_lba.base_seg[4],
 		ISHARP_LBA_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.isharp_lba.slope_seg[4]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG5,
-		ISHARP_LBA_PWL_IN_SEG5, scl_data->dscl_prog_data.isharp_lba.in_seg[5]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG5,
+	REG_SET_2(ISHARP_LBA_PWL_SEG5, 0,
+		ISHARP_LBA_PWL_IN_SEG5, scl_data->dscl_prog_data.isharp_lba.in_seg[5],
 		ISHARP_LBA_PWL_BASE_SEG5, scl_data->dscl_prog_data.isharp_lba.base_seg[5]);
 
-	/* ISHARP_FMT_MODE */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_FMT_MODE, scl_data->dscl_prog_data.isharp_fmt.mode);
-	/* ISHARP_FMT_NORM */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_FMT_NORM, scl_data->dscl_prog_data.isharp_fmt.norm);
 	/* ISHARP_DELTA_LUT */
 	dpp401_dscl_set_isharp_filter(dpp, scl_data->dscl_prog_data.isharp_delta);
-	/* ISHARP_NLDELTA_SCLIP_EN_P */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_EN_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_p);
-	/* ISHARP_NLDELTA_SCLIP_PIVOT_P */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_PIVOT_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_p);
-	/* ISHARP_NLDELTA_SCLIP_SLOPE_P */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_SLOPE_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_p);
-	/* ISHARP_NLDELTA_SCLIP_EN_N */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_EN_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_n);
-	/* ISHARP_NLDELTA_SCLIP_PIVOT_N */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_PIVOT_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_n);
-	/* ISHARP_NLDELTA_SCLIP_SLOPE_N */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
+
+	/* ISHARP_NLDELTA_SOFT_CLIP */
+	REG_SET_6(ISHARP_NLDELTA_SOFT_CLIP, 0,
+		ISHARP_NLDELTA_SCLIP_EN_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_p,
+		ISHARP_NLDELTA_SCLIP_PIVOT_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_p,
+		ISHARP_NLDELTA_SCLIP_SLOPE_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_p,
+		ISHARP_NLDELTA_SCLIP_EN_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_n,
+		ISHARP_NLDELTA_SCLIP_PIVOT_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_n,
 		ISHARP_NLDELTA_SCLIP_SLOPE_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_n);
 
 	/* Blur and Scale Coefficients - SCL_COEF_RAM_TAP_SELECT */
@@ -1086,12 +1033,14 @@ static void dpp401_dscl_program_isharp(struct dpp *dpp_base,
 				dpp, scl_data->taps.v_taps,
 				SCL_COEF_VERTICAL_BLUR_SCALE,
 				scl_data->dscl_prog_data.filter_blur_scale_v);
+			*bs_coeffs_updated = true;
 		}
 		if (scl_data->dscl_prog_data.filter_blur_scale_h) {
 			dpp401_dscl_set_scaler_filter(
 				dpp, scl_data->taps.h_taps,
 				SCL_COEF_HORIZONTAL_BLUR_SCALE,
 				scl_data->dscl_prog_data.filter_blur_scale_h);
+			*bs_coeffs_updated = true;
 		}
 	}
 	PERF_TRACE();
@@ -1122,6 +1071,7 @@ void dpp401_dscl_set_scaler_manual_scale(struct dpp *dpp_base,
 			dpp_base, scl_data, dpp_base->ctx->dc->debug.always_scale);
 	bool ycbcr = scl_data->format >= PIXEL_FORMAT_VIDEO_BEGIN
 				&& scl_data->format <= PIXEL_FORMAT_VIDEO_END;
+	bool bs_coeffs_updated = false;
 
 	if (memcmp(&dpp->scl_data, scl_data, sizeof(*scl_data)) == 0)
 		return;
@@ -1181,7 +1131,7 @@ void dpp401_dscl_set_scaler_manual_scale(struct dpp *dpp_base,
 	if (dscl_mode == DSCL_MODE_SCALING_444_BYPASS) {
 		if (dpp->base.ctx->dc->config.prefer_easf)
 			dpp401_dscl_disable_easf(dpp_base, scl_data);
-		dpp401_dscl_program_isharp(dpp_base, scl_data);
+		dpp401_dscl_program_isharp(dpp_base, scl_data, &bs_coeffs_updated);
 		return;
 	}
 
@@ -1208,12 +1158,18 @@ void dpp401_dscl_set_scaler_manual_scale(struct dpp *dpp_base,
 		SCL_V_NUM_TAPS_C, v_num_taps_c,
 		SCL_H_NUM_TAPS_C, h_num_taps_c);
 
-	dpp401_dscl_set_scl_filter(dpp, scl_data, ycbcr);
+	/* ISharp configuration
+	 * - B&S coeffs are written to same coeff RAM as WB scaler coeffs
+	 * - coeff RAM toggle is in EASF programming
+	 * - if we are only programming B&S coeffs, then need to reprogram
+	 *   WB scaler coeffs and toggle coeff RAM together
+	 */
+	//if (dpp->base.ctx->dc->config.prefer_easf)
+	dpp401_dscl_program_isharp(dpp_base, scl_data, &bs_coeffs_updated);
+
+	dpp401_dscl_set_scl_filter(dpp, scl_data, ycbcr, bs_coeffs_updated);
 	/* Edge adaptive scaler function configuration */
 	if (dpp->base.ctx->dc->config.prefer_easf)
 		dpp401_dscl_program_easf(dpp_base, scl_data);
-	/* isharp configuration */
-	//if (dpp->base.ctx->dc->config.prefer_easf)
-	dpp401_dscl_program_isharp(dpp_base, scl_data);
 	PERF_TRACE();
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 02e63b95c36d..9d56fbdcd06a 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -76,6 +76,9 @@
 
 #include "dml2/dml2_wrapper.h"
 
+#include "spl/dc_spl_scl_easf_filters.h"
+#include "spl/dc_spl_isharp_filters.h"
+
 #define DC_LOGGER_INIT(logger)
 
 enum dcn401_clk_src_array_id {
@@ -2126,6 +2129,10 @@ static bool dcn401_resource_construct(
 	dc->dml2_options.max_segments_per_hubp = 20;
 	dc->dml2_options.det_segment_size = DCN4_01_CRB_SEGMENT_SIZE_KB;
 
+	/* SPL */
+	spl_init_easf_filter_coeffs();
+	spl_init_blur_scale_coeffs();
+
 	return true;
 
 create_fail:
diff --git a/drivers/gpu/drm/amd/display/dc/spl/Makefile b/drivers/gpu/drm/amd/display/dc/spl/Makefile
index f8df85ea4d32..05764d4d4604 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/spl/Makefile
@@ -23,7 +23,7 @@
 # Makefile for the 'spl' sub-component of DAL.
 # It provides the scaling library interface.
 
-SPL = dc_spl.o dc_spl_scl_filters.o dc_spl_scl_filters_old.o dc_spl_isharp_filters.o
+SPL = dc_spl.o dc_spl_scl_filters.o dc_spl_scl_easf_filters.o dc_spl_isharp_filters.o dc_spl_filters.o spl_fixpt31_32.o
 
 AMD_DAL_SPL = $(addprefix $(AMDDALPATH)/dc/spl/,$(SPL))
 
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index 9eccdb38bed4..f00bb2004d53 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -4,9 +4,11 @@
 
 #include "dc_spl.h"
 #include "dc_spl_scl_filters.h"
+#include "dc_spl_scl_easf_filters.h"
 #include "dc_spl_isharp_filters.h"
+#include "spl_debug.h"
 
-#define IDENTITY_RATIO(ratio) (dc_fixpt_u2d19(ratio) == (1 << 19))
+#define IDENTITY_RATIO(ratio) (spl_fixpt_u2d19(ratio) == (1 << 19))
 #define MIN_VIEWPORT_SIZE 12
 
 static struct spl_rect intersect_rec(const struct spl_rect *r0, const struct spl_rect *r1)
@@ -107,26 +109,26 @@ static struct spl_rect calculate_plane_rec_in_timing_active(
 	const struct spl_rect *stream_src = &spl_in->basic_out.src_rect;
 	const struct spl_rect *stream_dst = &spl_in->basic_out.dst_rect;
 	struct spl_rect rec_out = {0};
-	struct fixed31_32 temp;
+	struct spl_fixed31_32 temp;
 
 
-	temp = dc_fixpt_from_fraction(rec_in->x * (long long)stream_dst->width,
+	temp = spl_fixpt_from_fraction(rec_in->x * (long long)stream_dst->width,
 			stream_src->width);
-	rec_out.x = stream_dst->x + dc_fixpt_round(temp);
+	rec_out.x = stream_dst->x + spl_fixpt_round(temp);
 
-	temp = dc_fixpt_from_fraction(
+	temp = spl_fixpt_from_fraction(
 			(rec_in->x + rec_in->width) * (long long)stream_dst->width,
 			stream_src->width);
-	rec_out.width = stream_dst->x + dc_fixpt_round(temp) - rec_out.x;
+	rec_out.width = stream_dst->x + spl_fixpt_round(temp) - rec_out.x;
 
-	temp = dc_fixpt_from_fraction(rec_in->y * (long long)stream_dst->height,
+	temp = spl_fixpt_from_fraction(rec_in->y * (long long)stream_dst->height,
 			stream_src->height);
-	rec_out.y = stream_dst->y + dc_fixpt_round(temp);
+	rec_out.y = stream_dst->y + spl_fixpt_round(temp);
 
-	temp = dc_fixpt_from_fraction(
+	temp = spl_fixpt_from_fraction(
 			(rec_in->y + rec_in->height) * (long long)stream_dst->height,
 			stream_src->height);
-	rec_out.height = stream_dst->y + dc_fixpt_round(temp) - rec_out.y;
+	rec_out.height = stream_dst->y + spl_fixpt_round(temp) - rec_out.y;
 
 	return rec_out;
 }
@@ -144,7 +146,7 @@ static struct spl_rect calculate_mpc_slice_in_timing_active(
 	mpc_rec.x = plane_clip_rec->x + mpc_rec.width * mpc_slice_idx;
 	mpc_rec.height = plane_clip_rec->height;
 	mpc_rec.y = plane_clip_rec->y;
-	ASSERT(mpc_slice_count == 1 ||
+	SPL_ASSERT(mpc_slice_count == 1 ||
 			spl_in->basic_out.view_format != SPL_VIEW_3D_SIDE_BY_SIDE ||
 			mpc_rec.width % 2 == 0);
 
@@ -157,7 +159,7 @@ static struct spl_rect calculate_mpc_slice_in_timing_active(
 	}
 
 	if (spl_in->basic_out.view_format == SPL_VIEW_3D_TOP_AND_BOTTOM) {
-		ASSERT(mpc_rec.height % 2 == 0);
+		SPL_ASSERT(mpc_rec.height % 2 == 0);
 		mpc_rec.height /= 2;
 	}
 	return mpc_rec;
@@ -197,7 +199,7 @@ static struct spl_rect calculate_odm_slice_in_timing_active(struct spl_in *spl_i
 	return spl_in->basic_out.odm_slice_rect;
 }
 
-static void spl_calculate_recout(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_calculate_recout(struct spl_in *spl_in, struct spl_scratch *spl_scratch, struct spl_out *spl_out)
 {
 	/*
 	 * A plane clip represents the desired plane size and position in Stream
@@ -340,20 +342,23 @@ static void spl_calculate_recout(struct spl_in *spl_in, struct spl_out *spl_out)
 		/* shift the overlapping area so it is with respect to current
 		 * ODM slice's position
 		 */
-		spl_out->scl_data.recout = shift_rec(
+		spl_scratch->scl_data.recout = shift_rec(
 				&overlapping_area,
 				-odm_slice.x, -odm_slice.y);
-		spl_out->scl_data.recout.height -=
+		spl_scratch->scl_data.recout.height -=
 			spl_in->debug.visual_confirm_base_offset;
-		spl_out->scl_data.recout.height -=
+		spl_scratch->scl_data.recout.height -=
 			spl_in->debug.visual_confirm_dpp_offset;
 	} else
 		/* if there is no overlap, zero recout */
-		memset(&spl_out->scl_data.recout, 0,
+		memset(&spl_scratch->scl_data.recout, 0,
 				sizeof(struct spl_rect));
 }
+
 /* Calculate scaling ratios */
-static void spl_calculate_scaling_ratios(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_calculate_scaling_ratios(struct spl_in *spl_in,
+		struct spl_scratch *spl_scratch,
+		struct spl_out *spl_out)
 {
 	const int in_w = spl_in->basic_out.src_rect.width;
 	const int in_h = spl_in->basic_out.src_rect.height;
@@ -364,59 +369,75 @@ static void spl_calculate_scaling_ratios(struct spl_in *spl_in, struct spl_out *
 	/*Swap surf_src height and width since scaling ratios are in recout rotation*/
 	if (spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_90 ||
 		spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_270)
-		swap(surf_src.height, surf_src.width);
+		spl_swap(surf_src.height, surf_src.width);
 
-	spl_out->scl_data.ratios.horz = dc_fixpt_from_fraction(
+	spl_scratch->scl_data.ratios.horz = spl_fixpt_from_fraction(
 					surf_src.width,
 					spl_in->basic_in.dst_rect.width);
-	spl_out->scl_data.ratios.vert = dc_fixpt_from_fraction(
+	spl_scratch->scl_data.ratios.vert = spl_fixpt_from_fraction(
 					surf_src.height,
 					spl_in->basic_in.dst_rect.height);
 
 	if (spl_in->basic_out.view_format == SPL_VIEW_3D_SIDE_BY_SIDE)
-		spl_out->scl_data.ratios.horz.value *= 2;
+		spl_scratch->scl_data.ratios.horz.value *= 2;
 	else if (spl_in->basic_out.view_format == SPL_VIEW_3D_TOP_AND_BOTTOM)
-		spl_out->scl_data.ratios.vert.value *= 2;
+		spl_scratch->scl_data.ratios.vert.value *= 2;
 
-	spl_out->scl_data.ratios.vert.value = div64_s64(
-		spl_out->scl_data.ratios.vert.value * in_h, out_h);
-	spl_out->scl_data.ratios.horz.value = div64_s64(
-		spl_out->scl_data.ratios.horz.value * in_w, out_w);
+	spl_scratch->scl_data.ratios.vert.value = spl_div64_s64(
+		spl_scratch->scl_data.ratios.vert.value * in_h, out_h);
+	spl_scratch->scl_data.ratios.horz.value = spl_div64_s64(
+		spl_scratch->scl_data.ratios.horz.value * in_w, out_w);
 
-	spl_out->scl_data.ratios.horz_c = spl_out->scl_data.ratios.horz;
-	spl_out->scl_data.ratios.vert_c = spl_out->scl_data.ratios.vert;
+	spl_scratch->scl_data.ratios.horz_c = spl_scratch->scl_data.ratios.horz;
+	spl_scratch->scl_data.ratios.vert_c = spl_scratch->scl_data.ratios.vert;
 
 	if (spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP8
 			|| spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP10) {
-		spl_out->scl_data.ratios.horz_c.value /= 2;
-		spl_out->scl_data.ratios.vert_c.value /= 2;
+		spl_scratch->scl_data.ratios.horz_c.value /= 2;
+		spl_scratch->scl_data.ratios.vert_c.value /= 2;
 	}
-	spl_out->scl_data.ratios.horz = dc_fixpt_truncate(
-			spl_out->scl_data.ratios.horz, 19);
-	spl_out->scl_data.ratios.vert = dc_fixpt_truncate(
-			spl_out->scl_data.ratios.vert, 19);
-	spl_out->scl_data.ratios.horz_c = dc_fixpt_truncate(
-			spl_out->scl_data.ratios.horz_c, 19);
-	spl_out->scl_data.ratios.vert_c = dc_fixpt_truncate(
-			spl_out->scl_data.ratios.vert_c, 19);
+	spl_scratch->scl_data.ratios.horz = spl_fixpt_truncate(
+			spl_scratch->scl_data.ratios.horz, 19);
+	spl_scratch->scl_data.ratios.vert = spl_fixpt_truncate(
+			spl_scratch->scl_data.ratios.vert, 19);
+	spl_scratch->scl_data.ratios.horz_c = spl_fixpt_truncate(
+			spl_scratch->scl_data.ratios.horz_c, 19);
+	spl_scratch->scl_data.ratios.vert_c = spl_fixpt_truncate(
+			spl_scratch->scl_data.ratios.vert_c, 19);
+
+	/*
+	 * Coefficient table and some registers are different based on ratio
+	 * that is output/input.  Currently we calculate input/output
+	 * Store 1/ratio in recip_ratio for those lookups
+	 */
+	spl_scratch->scl_data.recip_ratios.horz = spl_fixpt_recip(
+			spl_scratch->scl_data.ratios.horz);
+	spl_scratch->scl_data.recip_ratios.vert = spl_fixpt_recip(
+			spl_scratch->scl_data.ratios.vert);
+	spl_scratch->scl_data.recip_ratios.horz_c = spl_fixpt_recip(
+			spl_scratch->scl_data.ratios.horz_c);
+	spl_scratch->scl_data.recip_ratios.vert_c = spl_fixpt_recip(
+			spl_scratch->scl_data.ratios.vert_c);
 }
+
 /* Calculate Viewport size */
-static void spl_calculate_viewport_size(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_calculate_viewport_size(struct spl_in *spl_in, struct spl_scratch *spl_scratch)
 {
-	spl_out->scl_data.viewport.width = dc_fixpt_ceil(dc_fixpt_mul_int(spl_out->scl_data.ratios.horz,
-							spl_out->scl_data.recout.width));
-	spl_out->scl_data.viewport.height = dc_fixpt_ceil(dc_fixpt_mul_int(spl_out->scl_data.ratios.vert,
-							spl_out->scl_data.recout.height));
-	spl_out->scl_data.viewport_c.width = dc_fixpt_ceil(dc_fixpt_mul_int(spl_out->scl_data.ratios.horz_c,
-						spl_out->scl_data.recout.width));
-	spl_out->scl_data.viewport_c.height = dc_fixpt_ceil(dc_fixpt_mul_int(spl_out->scl_data.ratios.vert_c,
-						spl_out->scl_data.recout.height));
+	spl_scratch->scl_data.viewport.width = spl_fixpt_ceil(spl_fixpt_mul_int(spl_scratch->scl_data.ratios.horz,
+							spl_scratch->scl_data.recout.width));
+	spl_scratch->scl_data.viewport.height = spl_fixpt_ceil(spl_fixpt_mul_int(spl_scratch->scl_data.ratios.vert,
+							spl_scratch->scl_data.recout.height));
+	spl_scratch->scl_data.viewport_c.width = spl_fixpt_ceil(spl_fixpt_mul_int(spl_scratch->scl_data.ratios.horz_c,
+						spl_scratch->scl_data.recout.width));
+	spl_scratch->scl_data.viewport_c.height = spl_fixpt_ceil(spl_fixpt_mul_int(spl_scratch->scl_data.ratios.vert_c,
+						spl_scratch->scl_data.recout.height));
 	if (spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_90 ||
 			spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_270) {
-		swap(spl_out->scl_data.viewport.width, spl_out->scl_data.viewport.height);
-		swap(spl_out->scl_data.viewport_c.width, spl_out->scl_data.viewport_c.height);
+		spl_swap(spl_scratch->scl_data.viewport.width, spl_scratch->scl_data.viewport.height);
+		spl_swap(spl_scratch->scl_data.viewport_c.width, spl_scratch->scl_data.viewport_c.height);
 	}
 }
+
 static void spl_get_vp_scan_direction(enum spl_rotation_angle rotation,
 			   bool horizontal_mirror,
 			   bool *orthogonal_rotation,
@@ -440,6 +461,7 @@ static void spl_get_vp_scan_direction(enum spl_rotation_angle rotation,
 	if (horizontal_mirror)
 		*flip_horz_scan_dir = !*flip_horz_scan_dir;
 }
+
 /*
  * We completely calculate vp offset, size and inits here based entirely on scaling
  * ratios and recout for pixel perfect pipe combine.
@@ -449,13 +471,13 @@ static void spl_calculate_init_and_vp(bool flip_scan_dir,
 				int recout_size,
 				int src_size,
 				int taps,
-				struct fixed31_32 ratio,
-				struct fixed31_32 init_adj,
-				struct fixed31_32 *init,
+				struct spl_fixed31_32 ratio,
+				struct spl_fixed31_32 init_adj,
+				struct spl_fixed31_32 *init,
 				int *vp_offset,
 				int *vp_size)
 {
-	struct fixed31_32 temp;
+	struct spl_fixed31_32 temp;
 	int int_part;
 
 	/*
@@ -468,33 +490,33 @@ static void spl_calculate_init_and_vp(bool flip_scan_dir,
 	 * init_bot = init + scaling_ratio
 	 * to get pixel perfect combine add the fraction from calculating vp offset
 	 */
-	temp = dc_fixpt_mul_int(ratio, recout_offset_within_recout_full);
-	*vp_offset = dc_fixpt_floor(temp);
+	temp = spl_fixpt_mul_int(ratio, recout_offset_within_recout_full);
+	*vp_offset = spl_fixpt_floor(temp);
 	temp.value &= 0xffffffff;
-	*init = dc_fixpt_add(dc_fixpt_div_int(dc_fixpt_add_int(ratio, taps + 1), 2), temp);
-	*init = dc_fixpt_add(*init, init_adj);
-	*init = dc_fixpt_truncate(*init, 19);
+	*init = spl_fixpt_add(spl_fixpt_div_int(spl_fixpt_add_int(ratio, taps + 1), 2), temp);
+	*init = spl_fixpt_add(*init, init_adj);
+	*init = spl_fixpt_truncate(*init, 19);
 
 	/*
 	 * If viewport has non 0 offset and there are more taps than covered by init then
 	 * we should decrease the offset and increase init so we are never sampling
 	 * outside of viewport.
 	 */
-	int_part = dc_fixpt_floor(*init);
+	int_part = spl_fixpt_floor(*init);
 	if (int_part < taps) {
 		int_part = taps - int_part;
 		if (int_part > *vp_offset)
 			int_part = *vp_offset;
 		*vp_offset -= int_part;
-		*init = dc_fixpt_add_int(*init, int_part);
+		*init = spl_fixpt_add_int(*init, int_part);
 	}
 	/*
 	 * If taps are sampling outside of viewport at end of recout and there are more pixels
 	 * available in the surface we should increase the viewport size, regardless set vp to
 	 * only what is used.
 	 */
-	temp = dc_fixpt_add(*init, dc_fixpt_mul_int(ratio, recout_size - 1));
-	*vp_size = dc_fixpt_floor(temp);
+	temp = spl_fixpt_add(*init, spl_fixpt_mul_int(ratio, recout_size - 1));
+	*vp_size = spl_fixpt_floor(temp);
 	if (*vp_size + *vp_offset > src_size)
 		*vp_size = src_size - *vp_offset;
 
@@ -509,15 +531,16 @@ static void spl_calculate_init_and_vp(bool flip_scan_dir,
 
 static bool spl_is_yuv420(enum spl_pixel_format format)
 {
-	if ((format >= SPL_PIXEL_FORMAT_VIDEO_BEGIN) &&
-		(format <= SPL_PIXEL_FORMAT_VIDEO_END))
+	if ((format >= SPL_PIXEL_FORMAT_420BPP8) &&
+		(format <= SPL_PIXEL_FORMAT_420BPP10))
 		return true;
 
 	return false;
 }
 
 /*Calculate inits and viewport */
-static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_calculate_inits_and_viewports(struct spl_in *spl_in,
+		struct spl_scratch *spl_scratch)
 {
 	struct spl_rect src = spl_in->basic_in.src_rect;
 	struct spl_rect recout_dst_in_active_timing;
@@ -528,11 +551,11 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 	int vpc_div = (spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP8
 			|| spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP10) ? 2 : 1;
 	bool orthogonal_rotation, flip_vert_scan_dir, flip_horz_scan_dir;
-	struct fixed31_32 init_adj_h = dc_fixpt_zero;
-	struct fixed31_32 init_adj_v = dc_fixpt_zero;
+	struct spl_fixed31_32 init_adj_h = spl_fixpt_zero;
+	struct spl_fixed31_32 init_adj_v = spl_fixpt_zero;
 
 	recout_clip_in_active_timing = shift_rec(
-			&spl_out->scl_data.recout, odm_slice.x, odm_slice.y);
+			&spl_scratch->scl_data.recout, odm_slice.x, odm_slice.y);
 	recout_dst_in_active_timing = calculate_plane_rec_in_timing_active(
 			spl_in, &spl_in->basic_in.dst_rect);
 	overlap_in_active_timing = intersect_rec(&recout_clip_in_active_timing,
@@ -555,8 +578,8 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 			&flip_horz_scan_dir);
 
 	if (orthogonal_rotation) {
-		swap(src.width, src.height);
-		swap(flip_vert_scan_dir, flip_horz_scan_dir);
+		spl_swap(src.width, src.height);
+		spl_swap(flip_vert_scan_dir, flip_horz_scan_dir);
 	}
 
 	if (spl_is_yuv420(spl_in->basic_in.format)) {
@@ -568,17 +591,17 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 		switch (spl_in->basic_in.cositing) {
 
 		case CHROMA_COSITING_LEFT:
-			init_adj_h = dc_fixpt_zero;
-			init_adj_v = dc_fixpt_from_fraction(sign, 2);
+			init_adj_h = spl_fixpt_zero;
+			init_adj_v = spl_fixpt_from_fraction(sign, 4);
 			break;
 		case CHROMA_COSITING_NONE:
-			init_adj_h = dc_fixpt_from_fraction(sign, 2);
-			init_adj_v = dc_fixpt_from_fraction(sign, 2);
+			init_adj_h = spl_fixpt_from_fraction(sign, 4);
+			init_adj_v = spl_fixpt_from_fraction(sign, 4);
 			break;
 		case CHROMA_COSITING_TOPLEFT:
 		default:
-			init_adj_h = dc_fixpt_zero;
-			init_adj_v = dc_fixpt_zero;
+			init_adj_h = spl_fixpt_zero;
+			init_adj_v = spl_fixpt_zero;
 			break;
 		}
 	}
@@ -586,59 +609,60 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 	spl_calculate_init_and_vp(
 			flip_horz_scan_dir,
 			recout_clip_in_recout_dst.x,
-			spl_out->scl_data.recout.width,
+			spl_scratch->scl_data.recout.width,
 			src.width,
-			spl_out->scl_data.taps.h_taps,
-			spl_out->scl_data.ratios.horz,
-			dc_fixpt_zero,
-			&spl_out->scl_data.inits.h,
-			&spl_out->scl_data.viewport.x,
-			&spl_out->scl_data.viewport.width);
+			spl_scratch->scl_data.taps.h_taps,
+			spl_scratch->scl_data.ratios.horz,
+			spl_fixpt_zero,
+			&spl_scratch->scl_data.inits.h,
+			&spl_scratch->scl_data.viewport.x,
+			&spl_scratch->scl_data.viewport.width);
 	spl_calculate_init_and_vp(
 			flip_horz_scan_dir,
 			recout_clip_in_recout_dst.x,
-			spl_out->scl_data.recout.width,
+			spl_scratch->scl_data.recout.width,
 			src.width / vpc_div,
-			spl_out->scl_data.taps.h_taps_c,
-			spl_out->scl_data.ratios.horz_c,
+			spl_scratch->scl_data.taps.h_taps_c,
+			spl_scratch->scl_data.ratios.horz_c,
 			init_adj_h,
-			&spl_out->scl_data.inits.h_c,
-			&spl_out->scl_data.viewport_c.x,
-			&spl_out->scl_data.viewport_c.width);
+			&spl_scratch->scl_data.inits.h_c,
+			&spl_scratch->scl_data.viewport_c.x,
+			&spl_scratch->scl_data.viewport_c.width);
 	spl_calculate_init_and_vp(
 			flip_vert_scan_dir,
 			recout_clip_in_recout_dst.y,
-			spl_out->scl_data.recout.height,
+			spl_scratch->scl_data.recout.height,
 			src.height,
-			spl_out->scl_data.taps.v_taps,
-			spl_out->scl_data.ratios.vert,
-			dc_fixpt_zero,
-			&spl_out->scl_data.inits.v,
-			&spl_out->scl_data.viewport.y,
-			&spl_out->scl_data.viewport.height);
+			spl_scratch->scl_data.taps.v_taps,
+			spl_scratch->scl_data.ratios.vert,
+			spl_fixpt_zero,
+			&spl_scratch->scl_data.inits.v,
+			&spl_scratch->scl_data.viewport.y,
+			&spl_scratch->scl_data.viewport.height);
 	spl_calculate_init_and_vp(
 			flip_vert_scan_dir,
 			recout_clip_in_recout_dst.y,
-			spl_out->scl_data.recout.height,
+			spl_scratch->scl_data.recout.height,
 			src.height / vpc_div,
-			spl_out->scl_data.taps.v_taps_c,
-			spl_out->scl_data.ratios.vert_c,
+			spl_scratch->scl_data.taps.v_taps_c,
+			spl_scratch->scl_data.ratios.vert_c,
 			init_adj_v,
-			&spl_out->scl_data.inits.v_c,
-			&spl_out->scl_data.viewport_c.y,
-			&spl_out->scl_data.viewport_c.height);
+			&spl_scratch->scl_data.inits.v_c,
+			&spl_scratch->scl_data.viewport_c.y,
+			&spl_scratch->scl_data.viewport_c.height);
 	if (orthogonal_rotation) {
-		swap(spl_out->scl_data.viewport.x, spl_out->scl_data.viewport.y);
-		swap(spl_out->scl_data.viewport.width, spl_out->scl_data.viewport.height);
-		swap(spl_out->scl_data.viewport_c.x, spl_out->scl_data.viewport_c.y);
-		swap(spl_out->scl_data.viewport_c.width, spl_out->scl_data.viewport_c.height);
+		spl_swap(spl_scratch->scl_data.viewport.x, spl_scratch->scl_data.viewport.y);
+		spl_swap(spl_scratch->scl_data.viewport.width, spl_scratch->scl_data.viewport.height);
+		spl_swap(spl_scratch->scl_data.viewport_c.x, spl_scratch->scl_data.viewport_c.y);
+		spl_swap(spl_scratch->scl_data.viewport_c.width, spl_scratch->scl_data.viewport_c.height);
 	}
-	spl_out->scl_data.viewport.x += src.x;
-	spl_out->scl_data.viewport.y += src.y;
-	ASSERT(src.x % vpc_div == 0 && src.y % vpc_div == 0);
-	spl_out->scl_data.viewport_c.x += src.x / vpc_div;
-	spl_out->scl_data.viewport_c.y += src.y / vpc_div;
+	spl_scratch->scl_data.viewport.x += src.x;
+	spl_scratch->scl_data.viewport.y += src.y;
+	SPL_ASSERT(src.x % vpc_div == 0 && src.y % vpc_div == 0);
+	spl_scratch->scl_data.viewport_c.x += src.x / vpc_div;
+	spl_scratch->scl_data.viewport_c.y += src.y / vpc_div;
 }
+
 static void spl_handle_3d_recout(struct spl_in *spl_in, struct spl_rect *recout)
 {
 	/*
@@ -647,7 +671,7 @@ static void spl_handle_3d_recout(struct spl_in *spl_in, struct spl_rect *recout)
 	 * This may break with rotation, good thing we aren't mixing hw rotation and 3d
 	 */
 	if (spl_in->basic_in.mpc_combine_v) {
-		ASSERT(spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_0 ||
+		SPL_ASSERT(spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_0 ||
 			(spl_in->basic_out.view_format != SPL_VIEW_3D_TOP_AND_BOTTOM &&
 					spl_in->basic_out.view_format != SPL_VIEW_3D_SIDE_BY_SIDE));
 		if (spl_in->basic_out.view_format == SPL_VIEW_3D_TOP_AND_BOTTOM)
@@ -665,6 +689,7 @@ static void spl_clamp_viewport(struct spl_rect *viewport)
 	if (viewport->width < MIN_VIEWPORT_SIZE)
 		viewport->width = MIN_VIEWPORT_SIZE;
 }
+
 static bool spl_dscl_is_420_format(enum spl_pixel_format format)
 {
 	if (format == SPL_PIXEL_FORMAT_420BPP8 ||
@@ -673,6 +698,7 @@ static bool spl_dscl_is_420_format(enum spl_pixel_format format)
 	else
 		return false;
 }
+
 static bool spl_dscl_is_video_format(enum spl_pixel_format format)
 {
 	if (format >= SPL_PIXEL_FORMAT_VIDEO_BEGIN
@@ -681,17 +707,21 @@ static bool spl_dscl_is_video_format(enum spl_pixel_format format)
 	else
 		return false;
 }
+
 static enum scl_mode spl_get_dscl_mode(const struct spl_in *spl_in,
-				const struct spl_scaler_data *data)
+				const struct spl_scaler_data *data,
+				bool enable_isharp, bool enable_easf)
 {
-	const long long one = dc_fixpt_one.value;
+	const long long one = spl_fixpt_one.value;
 	enum spl_pixel_format pixel_format = spl_in->basic_in.format;
 
+	/* Bypass if ratio is 1:1 with no ISHARP or force scale on */
 	if (data->ratios.horz.value == one
 			&& data->ratios.vert.value == one
 			&& data->ratios.horz_c.value == one
 			&& data->ratios.vert_c.value == one
-			&& !spl_in->basic_out.always_scale)
+			&& !spl_in->basic_out.always_scale
+			&& !enable_isharp)
 		return SCL_MODE_SCALING_444_BYPASS;
 
 	if (!spl_dscl_is_420_format(pixel_format)) {
@@ -700,69 +730,204 @@ static enum scl_mode spl_get_dscl_mode(const struct spl_in *spl_in,
 		else
 			return SCL_MODE_SCALING_444_RGB_ENABLE;
 	}
-	if (data->ratios.horz.value == one && data->ratios.vert.value == one)
-		return SCL_MODE_SCALING_420_LUMA_BYPASS;
-	if (data->ratios.horz_c.value == one && data->ratios.vert_c.value == one)
-		return SCL_MODE_SCALING_420_CHROMA_BYPASS;
+
+	/* Bypass YUV if at 1:1 with no ISHARP or if doing 2:1 YUV
+	 *  downscale without EASF
+	 */
+	if ((!enable_isharp) && (!enable_easf)) {
+		if (data->ratios.horz.value == one && data->ratios.vert.value == one)
+			return SCL_MODE_SCALING_420_LUMA_BYPASS;
+		if (data->ratios.horz_c.value == one && data->ratios.vert_c.value == one)
+			return SCL_MODE_SCALING_420_CHROMA_BYPASS;
+	}
 
 	return SCL_MODE_SCALING_420_YCBCR_ENABLE;
 }
+
+static bool spl_choose_lls_policy(enum spl_pixel_format format,
+	enum spl_transfer_func_type tf_type,
+	enum spl_transfer_func_predefined tf_predefined_type,
+	enum linear_light_scaling *lls_pref)
+{
+	if (spl_is_yuv420(format)) {
+		*lls_pref = LLS_PREF_NO;
+		if ((tf_type == SPL_TF_TYPE_PREDEFINED) ||
+			(tf_type == SPL_TF_TYPE_DISTRIBUTED_POINTS))
+			return true;
+	} else { /* RGB or YUV444 */
+		if ((tf_type == SPL_TF_TYPE_PREDEFINED) ||
+			(tf_type == SPL_TF_TYPE_BYPASS)) {
+			*lls_pref = LLS_PREF_YES;
+			return true;
+		}
+	}
+	*lls_pref = LLS_PREF_NO;
+	return false;
+}
+
+/* Enable EASF ?*/
+static bool enable_easf(struct spl_in *spl_in, struct spl_scratch *spl_scratch)
+{
+	int vratio = 0;
+	int hratio = 0;
+	bool skip_easf = false;
+	bool lls_enable_easf = true;
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
+	vratio = spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert);
+	hratio = spl_fixpt_ceil(spl_scratch->scl_data.ratios.horz);
+
+	if (!lls_enable_easf || spl_in->disable_easf)
+		skip_easf = true;
+
+	/*
+	 * No EASF support for downscaling > 2:1
+	 * EASF support for upscaling or downscaling up to 2:1
+	 */
+	if ((vratio > 2) || (hratio > 2))
+		skip_easf = true;
+
+	/* Check for linear scaling or EASF preferred */
+	if (spl_in->lls_pref != LLS_PREF_YES && !spl_in->prefer_easf)
+		skip_easf = true;
+
+	return skip_easf;
+}
+
+/* Check if video is in fullscreen mode */
+static bool spl_is_video_fullscreen(struct spl_in *spl_in)
+{
+	if (spl_is_yuv420(spl_in->basic_in.format) && spl_in->is_fullscreen)
+		return true;
+	return false;
+}
+
+static bool spl_get_isharp_en(struct spl_in *spl_in,
+	struct spl_scratch *spl_scratch)
+{
+	bool enable_isharp = false;
+	int vratio = 0;
+	int hratio = 0;
+	struct spl_taps taps = spl_scratch->scl_data.taps;
+	bool fullscreen = spl_is_video_fullscreen(spl_in);
+
+	vratio = spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert);
+	hratio = spl_fixpt_ceil(spl_scratch->scl_data.ratios.horz);
+
+	/* Return if adaptive sharpness is disabled */
+	if (spl_in->adaptive_sharpness.enable == false)
+		return enable_isharp;
+
+	/* No iSHARP support for downscaling */
+	if (vratio > 1 || hratio > 1)
+		return enable_isharp;
+
+	// Scaling is up to 1:1 (no scaling) or upscaling
+
+	/*
+	 * Apply sharpness to all RGB surfaces and to
+	 *  NV12/P010 surfaces if in fullscreen
+	 */
+	if (spl_is_yuv420(spl_in->basic_in.format) && !fullscreen)
+		return enable_isharp;
+
+	/*
+	 * Apply sharpness if supports horizontal taps 4,6 AND
+	 *  vertical taps 3, 4, 6
+	 */
+	if ((taps.h_taps == 4 || taps.h_taps == 6) &&
+		(taps.v_taps == 3 || taps.v_taps == 4 || taps.v_taps == 6))
+		enable_isharp = true;
+
+	return enable_isharp;
+}
+
 /* Calculate optimal number of taps */
 static bool spl_get_optimal_number_of_taps(
-	  int max_downscale_src_width, struct spl_in *spl_in, struct spl_out *spl_out,
-	  const struct spl_taps *in_taps)
+	  int max_downscale_src_width, struct spl_in *spl_in, struct spl_scratch *spl_scratch,
+	  const struct spl_taps *in_taps, bool *enable_easf_v, bool *enable_easf_h,
+	  bool *enable_isharp)
 {
 	int num_part_y, num_part_c;
 	int max_taps_y, max_taps_c;
 	int min_taps_y, min_taps_c;
 	enum lb_memory_config lb_config;
+	bool skip_easf = false;
 
-	if (spl_out->scl_data.viewport.width > spl_out->scl_data.h_active &&
+	if (spl_scratch->scl_data.viewport.width > spl_scratch->scl_data.h_active &&
 		max_downscale_src_width != 0 &&
-		spl_out->scl_data.viewport.width > max_downscale_src_width)
+		spl_scratch->scl_data.viewport.width > max_downscale_src_width)
 		return false;
+
+	/* Check if we are using EASF or not */
+	skip_easf = enable_easf(spl_in, spl_scratch);
+
 	/*
 	 * Set default taps if none are provided
 	 * From programming guide: taps = min{ ceil(2*H_RATIO,1), 8} for downscaling
 	 * taps = 4 for upscaling
 	 */
-	if (in_taps->h_taps == 0) {
-		if (dc_fixpt_ceil(spl_out->scl_data.ratios.horz) > 1)
-			spl_out->scl_data.taps.h_taps = min(2 * dc_fixpt_ceil(spl_out->scl_data.ratios.horz), 8);
-		else
-			spl_out->scl_data.taps.h_taps = 4;
-	} else
-		spl_out->scl_data.taps.h_taps = in_taps->h_taps;
-	if (in_taps->v_taps == 0) {
-		if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert) > 1)
-			spl_out->scl_data.taps.v_taps = min(dc_fixpt_ceil(dc_fixpt_mul_int(
-							spl_out->scl_data.ratios.vert, 2)), 8);
-		else
-			spl_out->scl_data.taps.v_taps = 4;
-	} else
-		spl_out->scl_data.taps.v_taps = in_taps->v_taps;
-	if (in_taps->v_taps_c == 0) {
-		if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c) > 1)
-			spl_out->scl_data.taps.v_taps_c = min(dc_fixpt_ceil(dc_fixpt_mul_int(
-							spl_out->scl_data.ratios.vert_c, 2)), 8);
-		else
-			spl_out->scl_data.taps.v_taps_c = 4;
-	} else
-		spl_out->scl_data.taps.v_taps_c = in_taps->v_taps_c;
-	if (in_taps->h_taps_c == 0) {
-		if (dc_fixpt_ceil(spl_out->scl_data.ratios.horz_c) > 1)
-			spl_out->scl_data.taps.h_taps_c = min(2 * dc_fixpt_ceil(spl_out->scl_data.ratios.horz_c), 8);
+	if (skip_easf) {
+		if (in_taps->h_taps == 0) {
+			if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.horz) > 1)
+				spl_scratch->scl_data.taps.h_taps = spl_min(2 * spl_fixpt_ceil(
+					spl_scratch->scl_data.ratios.horz), 8);
+			else
+				spl_scratch->scl_data.taps.h_taps = 4;
+		} else
+			spl_scratch->scl_data.taps.h_taps = in_taps->h_taps;
+		if (in_taps->v_taps == 0) {
+			if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert) > 1)
+				spl_scratch->scl_data.taps.v_taps = spl_min(spl_fixpt_ceil(spl_fixpt_mul_int(
+					spl_scratch->scl_data.ratios.vert, 2)), 8);
+			else
+				spl_scratch->scl_data.taps.v_taps = 4;
+		} else
+			spl_scratch->scl_data.taps.v_taps = in_taps->v_taps;
+		if (in_taps->v_taps_c == 0) {
+			if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert_c) > 1)
+				spl_scratch->scl_data.taps.v_taps_c = spl_min(spl_fixpt_ceil(spl_fixpt_mul_int(
+					spl_scratch->scl_data.ratios.vert_c, 2)), 8);
+			else
+				spl_scratch->scl_data.taps.v_taps_c = 4;
+		} else
+			spl_scratch->scl_data.taps.v_taps_c = in_taps->v_taps_c;
+		if (in_taps->h_taps_c == 0) {
+			if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.horz_c) > 1)
+				spl_scratch->scl_data.taps.h_taps_c = spl_min(2 * spl_fixpt_ceil(
+					spl_scratch->scl_data.ratios.horz_c), 8);
+			else
+				spl_scratch->scl_data.taps.h_taps_c = 4;
+		} else if ((in_taps->h_taps_c % 2) != 0 && in_taps->h_taps_c != 1)
+			/* Only 1 and even h_taps_c are supported by hw */
+			spl_scratch->scl_data.taps.h_taps_c = in_taps->h_taps_c - 1;
 		else
-			spl_out->scl_data.taps.h_taps_c = 4;
-	} else if ((in_taps->h_taps_c % 2) != 0 && in_taps->h_taps_c != 1)
-		/* Only 1 and even h_taps_c are supported by hw */
-		spl_out->scl_data.taps.h_taps_c = in_taps->h_taps_c - 1;
-	else
-		spl_out->scl_data.taps.h_taps_c = in_taps->h_taps_c;
+			spl_scratch->scl_data.taps.h_taps_c = in_taps->h_taps_c;
+	} else {
+		if (spl_is_yuv420(spl_in->basic_in.format)) {
+			spl_scratch->scl_data.taps.h_taps = 6;
+			spl_scratch->scl_data.taps.v_taps = 6;
+			spl_scratch->scl_data.taps.h_taps_c = 4;
+			spl_scratch->scl_data.taps.v_taps_c = 4;
+		} else { /* RGB */
+			spl_scratch->scl_data.taps.h_taps = 6;
+			spl_scratch->scl_data.taps.v_taps = 6;
+			spl_scratch->scl_data.taps.h_taps_c = 6;
+			spl_scratch->scl_data.taps.v_taps_c = 6;
+		}
+	}
 
 	/*Ensure we can support the requested number of vtaps*/
-	min_taps_y = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
-	min_taps_c = dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c);
+	min_taps_y = spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert);
+	min_taps_c = spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert_c);
 
 	/* Use LB_MEMORY_CONFIG_3 for 4:2:0 */
 	if ((spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP8)
@@ -771,16 +936,16 @@ static bool spl_get_optimal_number_of_taps(
 	else
 		lb_config = LB_MEMORY_CONFIG_0;
 	// Determine max vtap support by calculating how much line buffer can fit
-	spl_in->funcs->spl_calc_lb_num_partitions(spl_in->basic_out.alpha_en, &spl_out->scl_data,
+	spl_in->funcs->spl_calc_lb_num_partitions(spl_in->basic_out.alpha_en, &spl_scratch->scl_data,
 			lb_config, &num_part_y, &num_part_c);
 	/* MAX_V_TAPS = MIN (NUM_LINES - MAX(CEILING(V_RATIO,1)-2, 0), 8) */
-	if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert) > 2)
-		max_taps_y = num_part_y - (dc_fixpt_ceil(spl_out->scl_data.ratios.vert) - 2);
+	if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert) > 2)
+		max_taps_y = num_part_y - (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert) - 2);
 	else
 		max_taps_y = num_part_y;
 
-	if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c) > 2)
-		max_taps_c = num_part_c - (dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c) - 2);
+	if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert_c) > 2)
+		max_taps_c = num_part_c - (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert_c) - 2);
 	else
 		max_taps_c = num_part_c;
 
@@ -789,48 +954,108 @@ static bool spl_get_optimal_number_of_taps(
 	else if (max_taps_c < min_taps_c)
 		return false;
 
-	if (spl_out->scl_data.taps.v_taps > max_taps_y)
-		spl_out->scl_data.taps.v_taps = max_taps_y;
-
-	if (spl_out->scl_data.taps.v_taps_c > max_taps_c)
-		spl_out->scl_data.taps.v_taps_c = max_taps_c;
-	if (spl_in->prefer_easf)	{
-		// EASF can be enabled only for taps 3,4,6
-		// If optimal no of taps is 5, then set it to 4
-		// If optimal no of taps is 7 or 8, then set it to 6
-		if (spl_out->scl_data.taps.v_taps == 5)
-			spl_out->scl_data.taps.v_taps = 4;
-		if (spl_out->scl_data.taps.v_taps == 7 || spl_out->scl_data.taps.v_taps == 8)
-			spl_out->scl_data.taps.v_taps = 6;
-
-		if (spl_out->scl_data.taps.v_taps_c == 5)
-			spl_out->scl_data.taps.v_taps_c = 4;
-		if (spl_out->scl_data.taps.v_taps_c == 7 || spl_out->scl_data.taps.v_taps_c == 8)
-			spl_out->scl_data.taps.v_taps_c = 6;
-
-		if (spl_out->scl_data.taps.h_taps == 5)
-			spl_out->scl_data.taps.h_taps = 4;
-		if (spl_out->scl_data.taps.h_taps == 7 || spl_out->scl_data.taps.h_taps == 8)
-			spl_out->scl_data.taps.h_taps = 6;
-
-		if (spl_out->scl_data.taps.h_taps_c == 5)
-			spl_out->scl_data.taps.h_taps_c = 4;
-		if (spl_out->scl_data.taps.h_taps_c == 7 || spl_out->scl_data.taps.h_taps_c == 8)
-			spl_out->scl_data.taps.h_taps_c = 6;
+	if (spl_scratch->scl_data.taps.v_taps > max_taps_y)
+		spl_scratch->scl_data.taps.v_taps = max_taps_y;
 
+	if (spl_scratch->scl_data.taps.v_taps_c > max_taps_c)
+		spl_scratch->scl_data.taps.v_taps_c = max_taps_c;
+
+	if (!skip_easf) {
+		/*
+		 * RGB ( L + NL ) and Linear HDR support 6x6, 6x4, 6x3, 4x4, 4x3
+		 * NL YUV420 only supports 6x6, 6x4 for Y and 4x4 for UV
+		 *
+		 * If LB does not support 3, 4, or 6 taps, then disable EASF_V
+		 *  and only enable EASF_H.  So for RGB, support 6x2, 4x2
+		 *  and for NL YUV420, support 6x2 for Y and 4x2 for UV
+		 *
+		 * All other cases, have to disable EASF_V and EASF_H
+		 *
+		 * If optimal no of taps is 5, then set it to 4
+		 * If optimal no of taps is 7 or 8, then fine since max tap is 6
+		 *
+		 */
+		if (spl_scratch->scl_data.taps.v_taps == 5)
+			spl_scratch->scl_data.taps.v_taps = 4;
+
+		if (spl_scratch->scl_data.taps.v_taps_c == 5)
+			spl_scratch->scl_data.taps.v_taps_c = 4;
+
+		if (spl_scratch->scl_data.taps.h_taps == 5)
+			spl_scratch->scl_data.taps.h_taps = 4;
+
+		if (spl_scratch->scl_data.taps.h_taps_c == 5)
+			spl_scratch->scl_data.taps.h_taps_c = 4;
+
+		if (spl_is_yuv420(spl_in->basic_in.format)) {
+			if ((spl_scratch->scl_data.taps.h_taps <= 4) ||
+				(spl_scratch->scl_data.taps.h_taps_c <= 3)) {
+				*enable_easf_v = false;
+				*enable_easf_h = false;
+			} else if ((spl_scratch->scl_data.taps.v_taps <= 3) ||
+				(spl_scratch->scl_data.taps.v_taps_c <= 3)) {
+				*enable_easf_v = false;
+				*enable_easf_h = true;
+			} else {
+				*enable_easf_v = true;
+				*enable_easf_h = true;
+			}
+			SPL_ASSERT((spl_scratch->scl_data.taps.v_taps > 1) &&
+				(spl_scratch->scl_data.taps.v_taps_c > 1));
+		} else { /* RGB */
+			if (spl_scratch->scl_data.taps.h_taps <= 3) {
+				*enable_easf_v = false;
+				*enable_easf_h = false;
+			} else if (spl_scratch->scl_data.taps.v_taps < 3) {
+				*enable_easf_v = false;
+				*enable_easf_h = true;
+			} else {
+				*enable_easf_v = true;
+				*enable_easf_h = true;
+			}
+			SPL_ASSERT(spl_scratch->scl_data.taps.v_taps > 1);
+		}
+	} else {
+		*enable_easf_v = false;
+		*enable_easf_h = false;
 	} // end of if prefer_easf
-	if (!spl_in->basic_out.always_scale)	{
-		if (IDENTITY_RATIO(spl_out->scl_data.ratios.horz))
-			spl_out->scl_data.taps.h_taps = 1;
-		if (IDENTITY_RATIO(spl_out->scl_data.ratios.vert))
-			spl_out->scl_data.taps.v_taps = 1;
-		if (IDENTITY_RATIO(spl_out->scl_data.ratios.horz_c))
-			spl_out->scl_data.taps.h_taps_c = 1;
-		if (IDENTITY_RATIO(spl_out->scl_data.ratios.vert_c))
-			spl_out->scl_data.taps.v_taps_c = 1;
+
+	/* Sharpener requires scaler to be enabled, including for 1:1
+	 * Check if ISHARP can be enabled
+	 * If ISHARP is not enabled, for 1:1, set taps to 1 and disable
+	 *  EASF
+	 * For case of 2:1 YUV where chroma is 1:1, set taps to 1 if
+	 *  EASF is not enabled
+	 */
+
+	*enable_isharp = spl_get_isharp_en(spl_in, spl_scratch);
+	if (!*enable_isharp && !spl_in->basic_out.always_scale)	{
+		if ((IDENTITY_RATIO(spl_scratch->scl_data.ratios.horz)) &&
+			(IDENTITY_RATIO(spl_scratch->scl_data.ratios.vert))) {
+			spl_scratch->scl_data.taps.h_taps = 1;
+			spl_scratch->scl_data.taps.v_taps = 1;
+
+			if (IDENTITY_RATIO(spl_scratch->scl_data.ratios.horz_c))
+				spl_scratch->scl_data.taps.h_taps_c = 1;
+
+			if (IDENTITY_RATIO(spl_scratch->scl_data.ratios.vert_c))
+				spl_scratch->scl_data.taps.v_taps_c = 1;
+
+			*enable_easf_v = false;
+			*enable_easf_h = false;
+		} else {
+			if ((!*enable_easf_h) &&
+				(IDENTITY_RATIO(spl_scratch->scl_data.ratios.horz_c)))
+				spl_scratch->scl_data.taps.h_taps_c = 1;
+
+			if ((!*enable_easf_v) &&
+				(IDENTITY_RATIO(spl_scratch->scl_data.ratios.vert_c)))
+				spl_scratch->scl_data.taps.v_taps_c = 1;
+		}
 	}
 	return true;
 }
+
 static void spl_set_black_color_data(enum spl_pixel_format format,
 			struct scl_black_color *scl_black_color)
 {
@@ -848,38 +1073,38 @@ static void spl_set_black_color_data(enum spl_pixel_format format,
 static void spl_set_manual_ratio_init_data(struct dscl_prog_data *dscl_prog_data,
 		const struct spl_scaler_data *scl_data)
 {
-	struct fixed31_32 bot;
+	struct spl_fixed31_32 bot;
 
-	dscl_prog_data->ratios.h_scale_ratio = dc_fixpt_u3d19(scl_data->ratios.horz) << 5;
-	dscl_prog_data->ratios.v_scale_ratio = dc_fixpt_u3d19(scl_data->ratios.vert) << 5;
-	dscl_prog_data->ratios.h_scale_ratio_c = dc_fixpt_u3d19(scl_data->ratios.horz_c) << 5;
-	dscl_prog_data->ratios.v_scale_ratio_c = dc_fixpt_u3d19(scl_data->ratios.vert_c) << 5;
+	dscl_prog_data->ratios.h_scale_ratio = spl_fixpt_u3d19(scl_data->ratios.horz) << 5;
+	dscl_prog_data->ratios.v_scale_ratio = spl_fixpt_u3d19(scl_data->ratios.vert) << 5;
+	dscl_prog_data->ratios.h_scale_ratio_c = spl_fixpt_u3d19(scl_data->ratios.horz_c) << 5;
+	dscl_prog_data->ratios.v_scale_ratio_c = spl_fixpt_u3d19(scl_data->ratios.vert_c) << 5;
 	/*
 	 * 0.24 format for fraction, first five bits zeroed
 	 */
 	dscl_prog_data->init.h_filter_init_frac =
-			dc_fixpt_u0d19(scl_data->inits.h) << 5;
+			spl_fixpt_u0d19(scl_data->inits.h) << 5;
 	dscl_prog_data->init.h_filter_init_int =
-			dc_fixpt_floor(scl_data->inits.h);
+			spl_fixpt_floor(scl_data->inits.h);
 	dscl_prog_data->init.h_filter_init_frac_c =
-			dc_fixpt_u0d19(scl_data->inits.h_c) << 5;
+			spl_fixpt_u0d19(scl_data->inits.h_c) << 5;
 	dscl_prog_data->init.h_filter_init_int_c =
-			dc_fixpt_floor(scl_data->inits.h_c);
+			spl_fixpt_floor(scl_data->inits.h_c);
 	dscl_prog_data->init.v_filter_init_frac =
-			dc_fixpt_u0d19(scl_data->inits.v) << 5;
+			spl_fixpt_u0d19(scl_data->inits.v) << 5;
 	dscl_prog_data->init.v_filter_init_int =
-			dc_fixpt_floor(scl_data->inits.v);
+			spl_fixpt_floor(scl_data->inits.v);
 	dscl_prog_data->init.v_filter_init_frac_c =
-			dc_fixpt_u0d19(scl_data->inits.v_c) << 5;
+			spl_fixpt_u0d19(scl_data->inits.v_c) << 5;
 	dscl_prog_data->init.v_filter_init_int_c =
-			dc_fixpt_floor(scl_data->inits.v_c);
-
-	bot = dc_fixpt_add(scl_data->inits.v, scl_data->ratios.vert);
-	dscl_prog_data->init.v_filter_init_bot_frac = dc_fixpt_u0d19(bot) << 5;
-	dscl_prog_data->init.v_filter_init_bot_int = dc_fixpt_floor(bot);
-	bot = dc_fixpt_add(scl_data->inits.v_c, scl_data->ratios.vert_c);
-	dscl_prog_data->init.v_filter_init_bot_frac_c = dc_fixpt_u0d19(bot) << 5;
-	dscl_prog_data->init.v_filter_init_bot_int_c = dc_fixpt_floor(bot);
+			spl_fixpt_floor(scl_data->inits.v_c);
+
+	bot = spl_fixpt_add(scl_data->inits.v, scl_data->ratios.vert);
+	dscl_prog_data->init.v_filter_init_bot_frac = spl_fixpt_u0d19(bot) << 5;
+	dscl_prog_data->init.v_filter_init_bot_int = spl_fixpt_floor(bot);
+	bot = spl_fixpt_add(scl_data->inits.v_c, scl_data->ratios.vert_c);
+	dscl_prog_data->init.v_filter_init_bot_frac_c = spl_fixpt_u0d19(bot) << 5;
+	dscl_prog_data->init.v_filter_init_bot_int_c = spl_fixpt_floor(bot);
 }
 
 static void spl_set_taps_data(struct dscl_prog_data *dscl_prog_data,
@@ -890,79 +1115,28 @@ static void spl_set_taps_data(struct dscl_prog_data *dscl_prog_data,
 	dscl_prog_data->taps.v_taps_c = scl_data->taps.v_taps_c - 1;
 	dscl_prog_data->taps.h_taps_c = scl_data->taps.h_taps_c - 1;
 }
-static const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct fixed31_32 ratio)
-{
-	if (taps == 8)
-		return spl_get_filter_8tap_64p(ratio);
-	else if (taps == 7)
-		return spl_get_filter_7tap_64p(ratio);
-	else if (taps == 6)
-		return spl_get_filter_6tap_64p(ratio);
-	else if (taps == 5)
-		return spl_get_filter_5tap_64p(ratio);
-	else if (taps == 4)
-		return spl_get_filter_4tap_64p(ratio);
-	else if (taps == 3)
-		return spl_get_filter_3tap_64p(ratio);
-	else if (taps == 2)
-		return spl_get_filter_2tap_64p();
-	else if (taps == 1)
-		return NULL;
-	else {
-		/* should never happen, bug */
-		BREAK_TO_DEBUGGER();
-		return NULL;
-	}
-}
-static void spl_set_filters_data(struct dscl_prog_data *dscl_prog_data,
-		const struct spl_scaler_data *data)
-{
-	dscl_prog_data->filter_h = spl_dscl_get_filter_coeffs_64p(
-				data->taps.h_taps, data->ratios.horz);
-	dscl_prog_data->filter_v = spl_dscl_get_filter_coeffs_64p(
-				data->taps.v_taps, data->ratios.vert);
-	dscl_prog_data->filter_h_c = spl_dscl_get_filter_coeffs_64p(
-				data->taps.h_taps_c, data->ratios.horz_c);
-	dscl_prog_data->filter_v_c = spl_dscl_get_filter_coeffs_64p(
-				data->taps.v_taps_c, data->ratios.vert_c);
-}
-#ifdef CONFIG_DRM_AMD_DC_FP
-static const uint16_t *spl_dscl_get_blur_scale_coeffs_64p(int taps)
-{
-	if ((taps == 3) || (taps == 4) || (taps == 6))
-		return spl_get_filter_isharp_bs_4tap_64p();
-	else {
-		/* should never happen, bug */
-		BREAK_TO_DEBUGGER();
-		return NULL;
-	}
-}
-static void spl_set_blur_scale_data(struct dscl_prog_data *dscl_prog_data,
-		const struct spl_scaler_data *data)
-{
-	dscl_prog_data->filter_blur_scale_h = spl_dscl_get_blur_scale_coeffs_64p(
-				data->taps.h_taps);
-	dscl_prog_data->filter_blur_scale_v = spl_dscl_get_blur_scale_coeffs_64p(
-				data->taps.v_taps);
-}
-#endif
+
 /* Populate dscl prog data structure from scaler data calculated by SPL */
-static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_scratch *spl_scratch,
+	struct spl_out *spl_out, bool enable_easf_v, bool enable_easf_h, bool enable_isharp)
 {
 	struct dscl_prog_data *dscl_prog_data = spl_out->dscl_prog_data;
 
-	const struct spl_scaler_data *data = &spl_out->scl_data;
+	const struct spl_scaler_data *data = &spl_scratch->scl_data;
 
 	struct scl_black_color *scl_black_color = &dscl_prog_data->scl_black_color;
 
+	bool enable_easf = enable_easf_v || enable_easf_h;
+
 	// Set values for recout
-	dscl_prog_data->recout = spl_out->scl_data.recout;
+	dscl_prog_data->recout = spl_scratch->scl_data.recout;
 	// Set values for MPC Size
-	dscl_prog_data->mpc_size.width = spl_out->scl_data.h_active;
-	dscl_prog_data->mpc_size.height = spl_out->scl_data.v_active;
+	dscl_prog_data->mpc_size.width = spl_scratch->scl_data.h_active;
+	dscl_prog_data->mpc_size.height = spl_scratch->scl_data.v_active;
 
 	// SCL_MODE - Set SCL_MODE data
-	dscl_prog_data->dscl_mode = spl_get_dscl_mode(spl_in, data);
+	dscl_prog_data->dscl_mode = spl_get_dscl_mode(spl_in, data, enable_isharp,
+		enable_easf);
 
 	// SCL_BLACK_COLOR
 	spl_set_black_color_data(spl_in->basic_in.format, scl_black_color);
@@ -973,103 +1147,101 @@ static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_out *spl_ou
 	// Set HTaps/VTaps
 	spl_set_taps_data(dscl_prog_data, data);
 	// Set viewport
-	dscl_prog_data->viewport = spl_out->scl_data.viewport;
+	dscl_prog_data->viewport = spl_scratch->scl_data.viewport;
 	// Set viewport_c
-	dscl_prog_data->viewport_c = spl_out->scl_data.viewport_c;
+	dscl_prog_data->viewport_c = spl_scratch->scl_data.viewport_c;
 	// Set filters data
-	spl_set_filters_data(dscl_prog_data, data);
-}
-/* Enable EASF ?*/
-static bool enable_easf(int scale_ratio, int taps,
-		enum linear_light_scaling lls_pref, bool prefer_easf)
-{
-	// Is downscaling > 6:1 ?
-	if (scale_ratio > 6) {
-		// END - No EASF support for downscaling > 6:1
-		return false;
-	}
-	// Is upscaling or downscaling up to 2:1?
-	if (scale_ratio <= 2) {
-		// Is linear scaling or EASF preferred?
-		if (lls_pref == LLS_PREF_YES || prefer_easf)	{
-			// LB support taps 3, 4, 6
-			if (taps == 3 || taps == 4 || taps == 6) {
-				// END - EASF supported
-				return true;
-			}
-		}
-	}
-	// END - EASF not supported
-	return false;
+	spl_set_filters_data(dscl_prog_data, data, enable_easf_v, enable_easf_h);
 }
+
 /* Set EASF data */
-static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
-	bool enable_easf_v, bool enable_easf_h, enum linear_light_scaling lls_pref,
-	enum spl_pixel_format format)
+static void spl_set_easf_data(struct spl_scratch *spl_scratch, struct spl_out *spl_out, bool enable_easf_v,
+	bool enable_easf_h, enum linear_light_scaling lls_pref,
+	enum spl_pixel_format format, enum system_setup setup)
 {
-	if (spl_is_yuv420(format)) /* TODO: 0 = RGB, 1 = YUV */
-		dscl_prog_data->easf_matrix_mode = 1;
-	else
-		dscl_prog_data->easf_matrix_mode = 0;
-
+	struct dscl_prog_data *dscl_prog_data = spl_out->dscl_prog_data;
 	if (enable_easf_v) {
 		dscl_prog_data->easf_v_en = true;
 		dscl_prog_data->easf_v_ring = 0;
-		dscl_prog_data->easf_v_sharp_factor = 1;
+		dscl_prog_data->easf_v_sharp_factor = 0;
 		dscl_prog_data->easf_v_bf1_en = 1;	// 1-bit, BF1 calculation enable, 0=disable, 1=enable
 		dscl_prog_data->easf_v_bf2_mode = 0xF;	// 4-bit, BF2 calculation mode
-		dscl_prog_data->easf_v_bf3_mode = 2;	// 2-bit, BF3 chroma mode correction calculation mode
-		dscl_prog_data->easf_v_bf2_flat1_gain = 4;	// U1.3, BF2 Flat1 Gain control
-		dscl_prog_data->easf_v_bf2_flat2_gain = 8;	// U4.0, BF2 Flat2 Gain control
-		dscl_prog_data->easf_v_bf2_roc_gain = 4;	// U2.2, Rate Of Change control
+		/* 2-bit, BF3 chroma mode correction calculation mode */
+		dscl_prog_data->easf_v_bf3_mode = spl_get_v_bf3_mode(
+			spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ minCoef ]*/
 		dscl_prog_data->easf_v_ringest_3tap_dntilt_uptilt =
-			0x9F00;// FP1.5.10 [minCoef]           (-0.036109167214271)
+			spl_get_3tap_dntilt_uptilt_offset(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ upTiltMaxVal ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt_max =
-			0x24FE;       // FP1.5.10 [upTiltMaxVal]      ( 0.904556445553545)
+			spl_get_3tap_uptilt_maxval(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ dnTiltSlope ]*/
 		dscl_prog_data->easf_v_ringest_3tap_dntilt_slope =
-			0x3940;       // FP1.5.10 [dnTiltSlope]       ( 0.910488988173371)
+			spl_get_3tap_dntilt_slope(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ upTilt1Slope ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt1_slope =
-			0x359C;       // FP1.5.10 [upTilt1Slope]      ( 0.125620179040899)
+			spl_get_3tap_uptilt1_slope(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ upTilt2Slope ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt2_slope =
-			0x359C;       // FP1.5.10 [upTilt2Slope]      ( 0.006786817723568)
+			spl_get_3tap_uptilt2_slope(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ upTilt2Offset ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt2_offset =
-			0x9F00;       // FP1.5.10 [upTilt2Offset]     (-0.006139059716651)
+			spl_get_3tap_uptilt2_offset(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4] */
 		dscl_prog_data->easf_v_ringest_eventap_reduceg1 =
-			0x4000;   // FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4]
+			spl_get_reducer_gain4(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6] */
 		dscl_prog_data->easf_v_ringest_eventap_reduceg2 =
-			0x4100;   // FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6]
+			spl_get_reducer_gain6(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024 */
 		dscl_prog_data->easf_v_ringest_eventap_gain1 =
-			0xB058;   // FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024
+			spl_get_gainRing4(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
+		/* FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024 */
 		dscl_prog_data->easf_v_ringest_eventap_gain2 =
-			0xA640;    // FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024
+			spl_get_gainRing6(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		dscl_prog_data->easf_v_bf_maxa = 63; //Vertical Max BF value A in U0.6 format.Selected if V_FCNTL == 0
 		dscl_prog_data->easf_v_bf_maxb = 63; //Vertical Max BF value A in U0.6 format.Selected if V_FCNTL == 1
 		dscl_prog_data->easf_v_bf_mina = 0;	//Vertical Min BF value A in U0.6 format.Selected if V_FCNTL == 0
 		dscl_prog_data->easf_v_bf_minb = 0;	//Vertical Min BF value A in U0.6 format.Selected if V_FCNTL == 1
-		dscl_prog_data->easf_v_bf1_pwl_in_seg0 = -512;	// S0.10, BF1 PWL Segment 0
-		dscl_prog_data->easf_v_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg0 = 3;	// S7.3, BF1 Slope PWL Segment 0
-		dscl_prog_data->easf_v_bf1_pwl_in_seg1 = -20;	// S0.10, BF1 PWL Segment 1
-		dscl_prog_data->easf_v_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg1 = 326;	// S7.3, BF1 Slope PWL Segment 1
-		dscl_prog_data->easf_v_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
-		dscl_prog_data->easf_v_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
-		dscl_prog_data->easf_v_bf1_pwl_in_seg3 = 16;	// S0.10, BF1 PWL Segment 3
-		dscl_prog_data->easf_v_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg3 = -56;	// S7.3, BF1 Slope PWL Segment 3
-		dscl_prog_data->easf_v_bf1_pwl_in_seg4 = 32;	// S0.10, BF1 PWL Segment 4
-		dscl_prog_data->easf_v_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg4 = -48;	// S7.3, BF1 Slope PWL Segment 4
-		dscl_prog_data->easf_v_bf1_pwl_in_seg5 = 48;	// S0.10, BF1 PWL Segment 5
-		dscl_prog_data->easf_v_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg5 = -240;	// S7.3, BF1 Slope PWL Segment 5
-		dscl_prog_data->easf_v_bf1_pwl_in_seg6 = 64;	// S0.10, BF1 PWL Segment 6
-		dscl_prog_data->easf_v_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg6 = -160;	// S7.3, BF1 Slope PWL Segment 6
-		dscl_prog_data->easf_v_bf1_pwl_in_seg7 = 80;	// S0.10, BF1 PWL Segment 7
-		dscl_prog_data->easf_v_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
 		if (lls_pref == LLS_PREF_YES)	{
+			dscl_prog_data->easf_v_bf2_flat1_gain = 4;	// U1.3, BF2 Flat1 Gain control
+			dscl_prog_data->easf_v_bf2_flat2_gain = 8;	// U4.0, BF2 Flat2 Gain control
+			dscl_prog_data->easf_v_bf2_roc_gain = 4;	// U2.2, Rate Of Change control
+
+			dscl_prog_data->easf_v_bf1_pwl_in_seg0 = 0x600;	// S0.10, BF1 PWL Segment 0 = -512
+			dscl_prog_data->easf_v_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg0 = 3;	// S7.3, BF1 Slope PWL Segment 0
+			dscl_prog_data->easf_v_bf1_pwl_in_seg1 = 0x7EC;	// S0.10, BF1 PWL Segment 1 = -20
+			dscl_prog_data->easf_v_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg1 = 326;	// S7.3, BF1 Slope PWL Segment 1
+			dscl_prog_data->easf_v_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_in_seg3 = 16;	// S0.10, BF1 PWL Segment 3
+			dscl_prog_data->easf_v_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg3 = 0x7C8;	// S7.3, BF1 Slope PWL Segment 3 = -56
+			dscl_prog_data->easf_v_bf1_pwl_in_seg4 = 32;	// S0.10, BF1 PWL Segment 4
+			dscl_prog_data->easf_v_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg4 = 0x7D0;	// S7.3, BF1 Slope PWL Segment 4 = -48
+			dscl_prog_data->easf_v_bf1_pwl_in_seg5 = 48;	// S0.10, BF1 PWL Segment 5
+			dscl_prog_data->easf_v_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg5 = 0x710;	// S7.3, BF1 Slope PWL Segment 5 = -240
+			dscl_prog_data->easf_v_bf1_pwl_in_seg6 = 64;	// S0.10, BF1 PWL Segment 6
+			dscl_prog_data->easf_v_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg6 = 0x760;	// S7.3, BF1 Slope PWL Segment 6 = -160
+			dscl_prog_data->easf_v_bf1_pwl_in_seg7 = 80;	// S0.10, BF1 PWL Segment 7
+			dscl_prog_data->easf_v_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
+
 			dscl_prog_data->easf_v_bf3_pwl_in_set0 = 0x000;	// FP0.6.6, BF3 Input value PWL Segment 0
 			dscl_prog_data->easf_v_bf3_pwl_base_set0 = 63;	// S0.6, BF3 Base PWL Segment 0
 			dscl_prog_data->easf_v_bf3_pwl_slope_set0 = 0x12C5;	// FP1.6.6, BF3 Slope PWL Segment 0
@@ -1090,13 +1262,41 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 				0x136B;	// FP1.6.6, BF3 Slope PWL Segment 3
 			dscl_prog_data->easf_v_bf3_pwl_in_set4 =
 				0x0C37;	// FP0.6.6, BF3 Input value PWL Segment 4 (0.125 * 125^3)
-			dscl_prog_data->easf_v_bf3_pwl_base_set4 = -50;	// S0.6, BF3 Base PWL Segment 4
+			dscl_prog_data->easf_v_bf3_pwl_base_set4 = 0x4E;	// S0.6, BF3 Base PWL Segment 4 = -50
 			dscl_prog_data->easf_v_bf3_pwl_slope_set4 =
 				0x1200;	// FP1.6.6, BF3 Slope PWL Segment 4
 			dscl_prog_data->easf_v_bf3_pwl_in_set5 =
 				0x0CF7;	// FP0.6.6, BF3 Input value PWL Segment 5 (1.0 * 125^3)
-			dscl_prog_data->easf_v_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
+			dscl_prog_data->easf_v_bf3_pwl_base_set5 = 0x41;	// S0.6, BF3 Base PWL Segment 5 = -63
 		}	else	{
+			dscl_prog_data->easf_v_bf2_flat1_gain = 13;	// U1.3, BF2 Flat1 Gain control
+			dscl_prog_data->easf_v_bf2_flat2_gain = 15;	// U4.0, BF2 Flat2 Gain control
+			dscl_prog_data->easf_v_bf2_roc_gain = 14;	// U2.2, Rate Of Change control
+
+			dscl_prog_data->easf_v_bf1_pwl_in_seg0 = 0x440;	// S0.10, BF1 PWL Segment 0 = -960
+			dscl_prog_data->easf_v_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg0 = 2;	// S7.3, BF1 Slope PWL Segment 0
+			dscl_prog_data->easf_v_bf1_pwl_in_seg1 = 0x7C4;	// S0.10, BF1 PWL Segment 1 = -60
+			dscl_prog_data->easf_v_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg1 = 109;	// S7.3, BF1 Slope PWL Segment 1
+			dscl_prog_data->easf_v_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_in_seg3 = 48;	// S0.10, BF1 PWL Segment 3
+			dscl_prog_data->easf_v_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg3 = 0x7ED;	// S7.3, BF1 Slope PWL Segment 3 = -19
+			dscl_prog_data->easf_v_bf1_pwl_in_seg4 = 96;	// S0.10, BF1 PWL Segment 4
+			dscl_prog_data->easf_v_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg4 = 0x7F0;	// S7.3, BF1 Slope PWL Segment 4 = -16
+			dscl_prog_data->easf_v_bf1_pwl_in_seg5 = 144;	// S0.10, BF1 PWL Segment 5
+			dscl_prog_data->easf_v_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg5 = 0x7B0;	// S7.3, BF1 Slope PWL Segment 5 = -80
+			dscl_prog_data->easf_v_bf1_pwl_in_seg6 = 192;	// S0.10, BF1 PWL Segment 6
+			dscl_prog_data->easf_v_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg6 = 0x7CB;	// S7.3, BF1 Slope PWL Segment 6 = -53
+			dscl_prog_data->easf_v_bf1_pwl_in_seg7 = 240;	// S0.10, BF1 PWL Segment 7
+			dscl_prog_data->easf_v_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
+
 			dscl_prog_data->easf_v_bf3_pwl_in_set0 = 0x000;	// FP0.6.6, BF3 Input value PWL Segment 0
 			dscl_prog_data->easf_v_bf3_pwl_base_set0 = 63;	// S0.6, BF3 Base PWL Segment 0
 			dscl_prog_data->easf_v_bf3_pwl_slope_set0 = 0x0000;	// FP1.6.6, BF3 Slope PWL Segment 0
@@ -1115,11 +1315,11 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 				0x1878;	// FP1.6.6, BF3 Slope PWL Segment 3
 			dscl_prog_data->easf_v_bf3_pwl_in_set4 =
 				0x0761;	// FP0.6.6, BF3 Input value PWL Segment 4 (0.375)
-			dscl_prog_data->easf_v_bf3_pwl_base_set4 = -60;	// S0.6, BF3 Base PWL Segment 4
+			dscl_prog_data->easf_v_bf3_pwl_base_set4 = 0x44;	// S0.6, BF3 Base PWL Segment 4 = -60
 			dscl_prog_data->easf_v_bf3_pwl_slope_set4 = 0x1760;	// FP1.6.6, BF3 Slope PWL Segment 4
 			dscl_prog_data->easf_v_bf3_pwl_in_set5 =
 				0x0780;	// FP0.6.6, BF3 Input value PWL Segment 5 (0.5)
-			dscl_prog_data->easf_v_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
+			dscl_prog_data->easf_v_bf3_pwl_base_set5 = 0x41;	// S0.6, BF3 Base PWL Segment 5 = -63
 		}
 	} else
 		dscl_prog_data->easf_v_en = false;
@@ -1127,52 +1327,63 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 	if (enable_easf_h) {
 		dscl_prog_data->easf_h_en = true;
 		dscl_prog_data->easf_h_ring = 0;
-		dscl_prog_data->easf_h_sharp_factor = 1;
+		dscl_prog_data->easf_h_sharp_factor = 0;
 		dscl_prog_data->easf_h_bf1_en =
 			1;	// 1-bit, BF1 calculation enable, 0=disable, 1=enable
 		dscl_prog_data->easf_h_bf2_mode =
 			0xF;	// 4-bit, BF2 calculation mode
-		dscl_prog_data->easf_h_bf3_mode =
-			2;	// 2-bit, BF3 chroma mode correction calculation mode
-		dscl_prog_data->easf_h_bf2_flat1_gain = 4;	// U1.3, BF2 Flat1 Gain control
-		dscl_prog_data->easf_h_bf2_flat2_gain = 8;	// U4.0, BF2 Flat2 Gain control
-		dscl_prog_data->easf_h_bf2_roc_gain = 4;	// U2.2, Rate Of Change control
+		/* 2-bit, BF3 chroma mode correction calculation mode */
+		dscl_prog_data->easf_h_bf3_mode = spl_get_h_bf3_mode(
+			spl_scratch->scl_data.recip_ratios.horz);
+		/* FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4] */
 		dscl_prog_data->easf_h_ringest_eventap_reduceg1 =
-			0x4000;	// FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4]
+			spl_get_reducer_gain4(spl_scratch->scl_data.taps.h_taps,
+				spl_scratch->scl_data.recip_ratios.horz);
+		/* FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6] */
 		dscl_prog_data->easf_h_ringest_eventap_reduceg2 =
-			0x4100;	// FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6]
+			spl_get_reducer_gain6(spl_scratch->scl_data.taps.h_taps,
+				spl_scratch->scl_data.recip_ratios.horz);
+		/* FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024 */
 		dscl_prog_data->easf_h_ringest_eventap_gain1 =
-			0xB058;	// FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024
+			spl_get_gainRing4(spl_scratch->scl_data.taps.h_taps,
+				spl_scratch->scl_data.recip_ratios.horz);
+		/* FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024 */
 		dscl_prog_data->easf_h_ringest_eventap_gain2 =
-			0xA640;	// FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024
+			spl_get_gainRing6(spl_scratch->scl_data.taps.h_taps,
+				spl_scratch->scl_data.recip_ratios.horz);
 		dscl_prog_data->easf_h_bf_maxa = 63; //Horz Max BF value A in U0.6 format.Selected if H_FCNTL==0
 		dscl_prog_data->easf_h_bf_maxb = 63; //Horz Max BF value B in U0.6 format.Selected if H_FCNTL==1
 		dscl_prog_data->easf_h_bf_mina = 0;	//Horz Min BF value B in U0.6 format.Selected if H_FCNTL==0
 		dscl_prog_data->easf_h_bf_minb = 0;	//Horz Min BF value B in U0.6 format.Selected if H_FCNTL==1
-		dscl_prog_data->easf_h_bf1_pwl_in_seg0 = -512;	// S0.10, BF1 PWL Segment 0
-		dscl_prog_data->easf_h_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg0 = 3;	// S7.3, BF1 Slope PWL Segment 0
-		dscl_prog_data->easf_h_bf1_pwl_in_seg1 = -20;	// S0.10, BF1 PWL Segment 1
-		dscl_prog_data->easf_h_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg1 = 326;	// S7.3, BF1 Slope PWL Segment 1
-		dscl_prog_data->easf_h_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
-		dscl_prog_data->easf_h_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
-		dscl_prog_data->easf_h_bf1_pwl_in_seg3 = 16;	// S0.10, BF1 PWL Segment 3
-		dscl_prog_data->easf_h_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg3 = -56;	// S7.3, BF1 Slope PWL Segment 3
-		dscl_prog_data->easf_h_bf1_pwl_in_seg4 = 32;	// S0.10, BF1 PWL Segment 4
-		dscl_prog_data->easf_h_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg4 = -48;	// S7.3, BF1 Slope PWL Segment 4
-		dscl_prog_data->easf_h_bf1_pwl_in_seg5 = 48;	// S0.10, BF1 PWL Segment 5
-		dscl_prog_data->easf_h_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg5 = -240;	// S7.3, BF1 Slope PWL Segment 5
-		dscl_prog_data->easf_h_bf1_pwl_in_seg6 = 64;	// S0.10, BF1 PWL Segment 6
-		dscl_prog_data->easf_h_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg6 = -160;	// S7.3, BF1 Slope PWL Segment 6
-		dscl_prog_data->easf_h_bf1_pwl_in_seg7 = 80;	// S0.10, BF1 PWL Segment 7
-		dscl_prog_data->easf_h_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
 		if (lls_pref == LLS_PREF_YES)	{
+			dscl_prog_data->easf_h_bf2_flat1_gain = 4;	// U1.3, BF2 Flat1 Gain control
+			dscl_prog_data->easf_h_bf2_flat2_gain = 8;	// U4.0, BF2 Flat2 Gain control
+			dscl_prog_data->easf_h_bf2_roc_gain = 4;	// U2.2, Rate Of Change control
+
+			dscl_prog_data->easf_h_bf1_pwl_in_seg0 = 0x600;	// S0.10, BF1 PWL Segment 0 = -512
+			dscl_prog_data->easf_h_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg0 = 3;	// S7.3, BF1 Slope PWL Segment 0
+			dscl_prog_data->easf_h_bf1_pwl_in_seg1 = 0x7EC;	// S0.10, BF1 PWL Segment 1 = -20
+			dscl_prog_data->easf_h_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg1 = 326;	// S7.3, BF1 Slope PWL Segment 1
+			dscl_prog_data->easf_h_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_in_seg3 = 16;	// S0.10, BF1 PWL Segment 3
+			dscl_prog_data->easf_h_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg3 = 0x7C8;	// S7.3, BF1 Slope PWL Segment 3 = -56
+			dscl_prog_data->easf_h_bf1_pwl_in_seg4 = 32;	// S0.10, BF1 PWL Segment 4
+			dscl_prog_data->easf_h_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg4 = 0x7D0;	// S7.3, BF1 Slope PWL Segment 4 = -48
+			dscl_prog_data->easf_h_bf1_pwl_in_seg5 = 48;	// S0.10, BF1 PWL Segment 5
+			dscl_prog_data->easf_h_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg5 = 0x710;	// S7.3, BF1 Slope PWL Segment 5 = -240
+			dscl_prog_data->easf_h_bf1_pwl_in_seg6 = 64;	// S0.10, BF1 PWL Segment 6
+			dscl_prog_data->easf_h_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg6 = 0x760;	// S7.3, BF1 Slope PWL Segment 6 = -160
+			dscl_prog_data->easf_h_bf1_pwl_in_seg7 = 80;	// S0.10, BF1 PWL Segment 7
+			dscl_prog_data->easf_h_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
+
 			dscl_prog_data->easf_h_bf3_pwl_in_set0 = 0x000;	// FP0.6.6, BF3 Input value PWL Segment 0
 			dscl_prog_data->easf_h_bf3_pwl_base_set0 = 63;	// S0.6, BF3 Base PWL Segment 0
 			dscl_prog_data->easf_h_bf3_pwl_slope_set0 = 0x12C5;	// FP1.6.6, BF3 Slope PWL Segment 0
@@ -1190,12 +1401,40 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 			dscl_prog_data->easf_h_bf3_pwl_slope_set3 =	0x136B;	// FP1.6.6, BF3 Slope PWL Segment 3
 			dscl_prog_data->easf_h_bf3_pwl_in_set4 =
 				0x0C37;	// FP0.6.6, BF3 Input value PWL Segment 4 (0.125 * 125^3)
-			dscl_prog_data->easf_h_bf3_pwl_base_set4 = -50;	// S0.6, BF3 Base PWL Segment 4
+			dscl_prog_data->easf_h_bf3_pwl_base_set4 = 0x4E;	// S0.6, BF3 Base PWL Segment 4 = -50
 			dscl_prog_data->easf_h_bf3_pwl_slope_set4 = 0x1200;	// FP1.6.6, BF3 Slope PWL Segment 4
 			dscl_prog_data->easf_h_bf3_pwl_in_set5 =
 				0x0CF7;	// FP0.6.6, BF3 Input value PWL Segment 5 (1.0 * 125^3)
-			dscl_prog_data->easf_h_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
+			dscl_prog_data->easf_h_bf3_pwl_base_set5 = 0x41;	// S0.6, BF3 Base PWL Segment 5 = -63
 		} else {
+			dscl_prog_data->easf_h_bf2_flat1_gain = 13;	// U1.3, BF2 Flat1 Gain control
+			dscl_prog_data->easf_h_bf2_flat2_gain = 15;	// U4.0, BF2 Flat2 Gain control
+			dscl_prog_data->easf_h_bf2_roc_gain = 14;	// U2.2, Rate Of Change control
+
+			dscl_prog_data->easf_h_bf1_pwl_in_seg0 = 0x440;	// S0.10, BF1 PWL Segment 0 = -960
+			dscl_prog_data->easf_h_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg0 = 2;	// S7.3, BF1 Slope PWL Segment 0
+			dscl_prog_data->easf_h_bf1_pwl_in_seg1 = 0x7C4;	// S0.10, BF1 PWL Segment 1 = -60
+			dscl_prog_data->easf_h_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg1 = 109;	// S7.3, BF1 Slope PWL Segment 1
+			dscl_prog_data->easf_h_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_in_seg3 = 48;	// S0.10, BF1 PWL Segment 3
+			dscl_prog_data->easf_h_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg3 = 0x7ED;	// S7.3, BF1 Slope PWL Segment 3 = -19
+			dscl_prog_data->easf_h_bf1_pwl_in_seg4 = 96;	// S0.10, BF1 PWL Segment 4
+			dscl_prog_data->easf_h_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg4 = 0x7F0;	// S7.3, BF1 Slope PWL Segment 4 = -16
+			dscl_prog_data->easf_h_bf1_pwl_in_seg5 = 144;	// S0.10, BF1 PWL Segment 5
+			dscl_prog_data->easf_h_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg5 = 0x7B0;	// S7.3, BF1 Slope PWL Segment 5 = -80
+			dscl_prog_data->easf_h_bf1_pwl_in_seg6 = 192;	// S0.10, BF1 PWL Segment 6
+			dscl_prog_data->easf_h_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg6 = 0x7CB;	// S7.3, BF1 Slope PWL Segment 6 = -53
+			dscl_prog_data->easf_h_bf1_pwl_in_seg7 = 240;	// S0.10, BF1 PWL Segment 7
+			dscl_prog_data->easf_h_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
+
 			dscl_prog_data->easf_h_bf3_pwl_in_set0 = 0x000;	// FP0.6.6, BF3 Input value PWL Segment 0
 			dscl_prog_data->easf_h_bf3_pwl_base_set0 = 63;	// S0.6, BF3 Base PWL Segment 0
 			dscl_prog_data->easf_h_bf3_pwl_slope_set0 = 0x0000;	// FP1.6.6, BF3 Slope PWL Segment 0
@@ -1213,25 +1452,36 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 			dscl_prog_data->easf_h_bf3_pwl_slope_set3 = 0x1878;	// FP1.6.6, BF3 Slope PWL Segment 3
 			dscl_prog_data->easf_h_bf3_pwl_in_set4 =
 				0x0761;	// FP0.6.6, BF3 Input value PWL Segment 4 (0.375)
-			dscl_prog_data->easf_h_bf3_pwl_base_set4 = -60;	// S0.6, BF3 Base PWL Segment 4
+			dscl_prog_data->easf_h_bf3_pwl_base_set4 = 0x44;	// S0.6, BF3 Base PWL Segment 4 = -60
 			dscl_prog_data->easf_h_bf3_pwl_slope_set4 = 0x1760;	// FP1.6.6, BF3 Slope PWL Segment 4
 			dscl_prog_data->easf_h_bf3_pwl_in_set5 =
 				0x0780;	// FP0.6.6, BF3 Input value PWL Segment 5 (0.5)
-			dscl_prog_data->easf_h_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
+			dscl_prog_data->easf_h_bf3_pwl_base_set5 = 0x41;	// S0.6, BF3 Base PWL Segment 5 = -63
 		} // if (lls_pref == LLS_PREF_YES)
 	} else
 		dscl_prog_data->easf_h_en = false;
 
 	if (lls_pref == LLS_PREF_YES)	{
 		dscl_prog_data->easf_ltonl_en = 1;	// Linear input
-		dscl_prog_data->easf_matrix_c0 =
-			0x504E;	// fp1.5.10, C0 coefficient (LN_BT2020:  0.2627 * (2^14)/125 = 34.43750000)
-		dscl_prog_data->easf_matrix_c1 =
-			0x558E;	// fp1.5.10, C1 coefficient (LN_BT2020:  0.6780 * (2^14)/125 = 88.87500000)
-		dscl_prog_data->easf_matrix_c2 =
-			0x47C6;	// fp1.5.10, C2 coefficient (LN_BT2020:  0.0593 * (2^14)/125 = 7.77343750)
-		dscl_prog_data->easf_matrix_c3 =
-			0x0;	// fp1.5.10, C3 coefficient
+		if (setup == HDR_L) {
+			dscl_prog_data->easf_matrix_c0 =
+				0x504E;	// fp1.5.10, C0 coefficient (LN_BT2020:  0.2627 * (2^14)/125 = 34.43750000)
+			dscl_prog_data->easf_matrix_c1 =
+				0x558E;	// fp1.5.10, C1 coefficient (LN_BT2020:  0.6780 * (2^14)/125 = 88.87500000)
+			dscl_prog_data->easf_matrix_c2 =
+				0x47C6;	// fp1.5.10, C2 coefficient (LN_BT2020:  0.0593 * (2^14)/125 = 7.77343750)
+			dscl_prog_data->easf_matrix_c3 =
+				0x0;	// fp1.5.10, C3 coefficient
+		} else { // SDR_L
+			dscl_prog_data->easf_matrix_c0 =
+				0x4EF7;	// fp1.5.10, C0 coefficient (LN_rec709:  0.2126 * (2^14)/125 = 27.86590720)
+			dscl_prog_data->easf_matrix_c1 =
+				0x55DC;	// fp1.5.10, C1 coefficient (LN_rec709:  0.7152 * (2^14)/125 = 93.74269440)
+			dscl_prog_data->easf_matrix_c2 =
+				0x48BB;	// fp1.5.10, C2 coefficient (LN_rec709:  0.0722 * (2^14)/125 = 9.46339840)
+			dscl_prog_data->easf_matrix_c3 =
+				0x0;	// fp1.5.10, C3 coefficient
+		}
 	}	else	{
 		dscl_prog_data->easf_ltonl_en = 0;	// Non-Linear input
 		dscl_prog_data->easf_matrix_c0 =
@@ -1243,27 +1493,43 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 		dscl_prog_data->easf_matrix_c3 =
 			0x0;	// fp1.5.10, C3 coefficient
 	}
+
+	if (spl_is_yuv420(format)) { /* TODO: 0 = RGB, 1 = YUV */
+		dscl_prog_data->easf_matrix_mode = 1;
+		/*
+		 * 2-bit, BF3 chroma mode correction calculation mode
+		 * Needs to be disabled for YUV420 mode
+		 * Override lookup value
+		 */
+		dscl_prog_data->easf_v_bf3_mode = 0;
+		dscl_prog_data->easf_h_bf3_mode = 0;
+	} else
+		dscl_prog_data->easf_matrix_mode = 0;
+
 }
+
 /*Set isharp noise detection */
-static void spl_set_isharp_noise_det_mode(struct dscl_prog_data *dscl_prog_data)
+static void spl_set_isharp_noise_det_mode(struct dscl_prog_data *dscl_prog_data,
+	const struct spl_scaler_data *data)
 {
 	// ISHARP_NOISEDET_MODE
 	// 0: 3x5 as VxH
 	// 1: 4x5 as VxH
 	// 2:
 	// 3: 5x5 as VxH
-	if (dscl_prog_data->taps.v_taps == 6)
-		dscl_prog_data->isharp_noise_det.mode = 3;	// ISHARP_NOISEDET_MODE
-	else if (dscl_prog_data->taps.h_taps == 4)
-		dscl_prog_data->isharp_noise_det.mode = 1;	// ISHARP_NOISEDET_MODE
-	else if (dscl_prog_data->taps.h_taps == 3)
-		dscl_prog_data->isharp_noise_det.mode = 0;	// ISHARP_NOISEDET_MODE
+	if (data->taps.v_taps == 6)
+		dscl_prog_data->isharp_noise_det.mode = 3;
+	else if (data->taps.v_taps == 4)
+		dscl_prog_data->isharp_noise_det.mode = 1;
+	else if (data->taps.v_taps == 3)
+		dscl_prog_data->isharp_noise_det.mode = 0;
 };
 /* Set Sharpener data */
 static void spl_set_isharp_data(struct dscl_prog_data *dscl_prog_data,
 		struct adaptive_sharpness adp_sharpness, bool enable_isharp,
 		enum linear_light_scaling lls_pref, enum spl_pixel_format format,
-		const struct spl_scaler_data *data)
+		const struct spl_scaler_data *data, struct spl_fixed31_32 ratio,
+		enum system_setup setup)
 {
 	/* Turn off sharpener if not required */
 	if (!enable_isharp) {
@@ -1272,10 +1538,12 @@ static void spl_set_isharp_data(struct dscl_prog_data *dscl_prog_data,
 	}
 
 	dscl_prog_data->isharp_en = 1;	// ISHARP_EN
-	dscl_prog_data->isharp_noise_det.enable = 1;	// ISHARP_NOISEDET_EN
 	// Set ISHARP_NOISEDET_MODE if htaps = 6-tap
-	if (dscl_prog_data->taps.h_taps == 6)
-		spl_set_isharp_noise_det_mode(dscl_prog_data);	// ISHARP_NOISEDET_MODE
+	if (data->taps.h_taps == 6) {
+		dscl_prog_data->isharp_noise_det.enable = 1;	/* ISHARP_NOISEDET_EN */
+		spl_set_isharp_noise_det_mode(dscl_prog_data, data);	/* ISHARP_NOISEDET_MODE */
+	} else
+		dscl_prog_data->isharp_noise_det.enable = 0;	// ISHARP_NOISEDET_EN
 	// Program noise detection threshold
 	dscl_prog_data->isharp_noise_det.uthreshold = 24;	// ISHARP_NOISEDET_UTHRE
 	dscl_prog_data->isharp_noise_det.dthreshold = 4;	// ISHARP_NOISEDET_DTHRE
@@ -1284,50 +1552,67 @@ static void spl_set_isharp_data(struct dscl_prog_data *dscl_prog_data,
 	dscl_prog_data->isharp_noise_det.pwl_end_in = 13;	// ISHARP_NOISEDET_PWL_END_IN
 	dscl_prog_data->isharp_noise_det.pwl_slope = 1623;	// ISHARP_NOISEDET_PWL_SLOPE
 
-	if ((lls_pref == LLS_PREF_NO) && !spl_is_yuv420(format)) /* ISHARP_FMT_MODE */
+	if (lls_pref == LLS_PREF_NO) /* ISHARP_FMT_MODE */
 		dscl_prog_data->isharp_fmt.mode = 1;
 	else
 		dscl_prog_data->isharp_fmt.mode = 0;
 
 	dscl_prog_data->isharp_fmt.norm = 0x3C00;	// ISHARP_FMT_NORM
 	dscl_prog_data->isharp_lba.mode = 0;	// ISHARP_LBA_MODE
-	// ISHARP_LBA_PWL_SEG0: ISHARP Local Brightness Adjustment PWL Segment 0
-	dscl_prog_data->isharp_lba.in_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[0] = 32;	// ISHARP LBA for Seg 0. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG1: ISHARP LBA PWL Segment 1
-	dscl_prog_data->isharp_lba.in_seg[1] = 256;	// ISHARP LBA PWL for Seg 1. INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[1] = 63; // ISHARP LBA PWL for Seg 1. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[1] = 0; // ISHARP LBA for Seg 1. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG2: ISHARP LBA PWL Segment 2
-	dscl_prog_data->isharp_lba.in_seg[2] = 614; // ISHARP LBA PWL for Seg 2. INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[2] = 63; // ISHARP LBA PWL for Seg 2. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[2] = -20; // ISHARP LBA for Seg 2. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG3: ISHARP LBA PWL Segment 3
-	dscl_prog_data->isharp_lba.in_seg[3] = 1023; // ISHARP LBA PWL for Seg 3.INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[3] = 0; // ISHARP LBA PWL for Seg 3. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[3] = 0; // ISHARP LBA for Seg 3. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG4: ISHARP LBA PWL Segment 4
-	dscl_prog_data->isharp_lba.in_seg[4] = 1023; // ISHARP LBA PWL for Seg 4.INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[4] = 0; // ISHARP LBA PWL for Seg 4. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[4] = 0; // ISHARP LBA for Seg 4. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG5: ISHARP LBA PWL Segment 5
-	dscl_prog_data->isharp_lba.in_seg[5] = 1023; // ISHARP LBA PWL for Seg 5.INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[5] = 0;	// ISHARP LBA PWL for Seg 5. BASE value in U0.6 format
-	switch (adp_sharpness.sharpness) {
-	case SHARPNESS_LOW:
-		dscl_prog_data->isharp_delta = spl_get_filter_isharp_1D_lut_0p5x();
-		break;
-	case SHARPNESS_MID:
-		dscl_prog_data->isharp_delta = spl_get_filter_isharp_1D_lut_1p0x();
-		break;
-	case SHARPNESS_HIGH:
-		dscl_prog_data->isharp_delta = spl_get_filter_isharp_1D_lut_2p0x();
-		break;
-	default:
-		BREAK_TO_DEBUGGER();
+
+	if (setup == SDR_L) {
+		// ISHARP_LBA_PWL_SEG0: ISHARP Local Brightness Adjustment PWL Segment 0
+		dscl_prog_data->isharp_lba.in_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[0] = 62;	// ISHARP LBA for Seg 0. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG1: ISHARP LBA PWL Segment 1
+		dscl_prog_data->isharp_lba.in_seg[1] = 130;	// ISHARP LBA PWL for Seg 1. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[1] = 63; // ISHARP LBA PWL for Seg 1. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[1] = 0; // ISHARP LBA for Seg 1. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG2: ISHARP LBA PWL Segment 2
+		dscl_prog_data->isharp_lba.in_seg[2] = 312; // ISHARP LBA PWL for Seg 2. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[2] = 63; // ISHARP LBA PWL for Seg 2. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[2] = 0x1D9; // ISHARP LBA for Seg 2. SLOPE value in S5.3 format = -39
+		// ISHARP_LBA_PWL_SEG3: ISHARP LBA PWL Segment 3
+		dscl_prog_data->isharp_lba.in_seg[3] = 520; // ISHARP LBA PWL for Seg 3.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[3] = 0; // ISHARP LBA PWL for Seg 3. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[3] = 0; // ISHARP LBA for Seg 3. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG4: ISHARP LBA PWL Segment 4
+		dscl_prog_data->isharp_lba.in_seg[4] = 520; // ISHARP LBA PWL for Seg 4.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[4] = 0; // ISHARP LBA PWL for Seg 4. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[4] = 0; // ISHARP LBA for Seg 4. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG5: ISHARP LBA PWL Segment 5
+		dscl_prog_data->isharp_lba.in_seg[5] = 520; // ISHARP LBA PWL for Seg 5.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[5] = 0;	// ISHARP LBA PWL for Seg 5. BASE value in U0.6 format
+	} else {
+		// ISHARP_LBA_PWL_SEG0: ISHARP Local Brightness Adjustment PWL Segment 0
+		dscl_prog_data->isharp_lba.in_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[0] = 32;	// ISHARP LBA for Seg 0. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG1: ISHARP LBA PWL Segment 1
+		dscl_prog_data->isharp_lba.in_seg[1] = 256;	// ISHARP LBA PWL for Seg 1. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[1] = 63; // ISHARP LBA PWL for Seg 1. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[1] = 0; // ISHARP LBA for Seg 1. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG2: ISHARP LBA PWL Segment 2
+		dscl_prog_data->isharp_lba.in_seg[2] = 614; // ISHARP LBA PWL for Seg 2. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[2] = 63; // ISHARP LBA PWL for Seg 2. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[2] = 0x1EC; // ISHARP LBA for Seg 2. SLOPE value in S5.3 format = -20
+		// ISHARP_LBA_PWL_SEG3: ISHARP LBA PWL Segment 3
+		dscl_prog_data->isharp_lba.in_seg[3] = 1023; // ISHARP LBA PWL for Seg 3.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[3] = 0; // ISHARP LBA PWL for Seg 3. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[3] = 0; // ISHARP LBA for Seg 3. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG4: ISHARP LBA PWL Segment 4
+		dscl_prog_data->isharp_lba.in_seg[4] = 1023; // ISHARP LBA PWL for Seg 4.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[4] = 0; // ISHARP LBA PWL for Seg 4. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[4] = 0; // ISHARP LBA for Seg 4. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG5: ISHARP LBA PWL Segment 5
+		dscl_prog_data->isharp_lba.in_seg[5] = 1023; // ISHARP LBA PWL for Seg 5.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[5] = 0;	// ISHARP LBA PWL for Seg 5. BASE value in U0.6 format
 	}
 
+	spl_build_isharp_1dlut_from_reference_curve(ratio, setup, adp_sharpness.sharpness);
+	dscl_prog_data->isharp_delta = spl_get_pregen_filter_isharp_1D_lut(setup);
+
 	// Program the nldelta soft clip values
 	if (lls_pref == LLS_PREF_YES) {
 		dscl_prog_data->isharp_nldelta_sclip.enable_p = 0;	/* ISHARP_NLDELTA_SCLIP_EN_P */
@@ -1346,62 +1631,7 @@ static void spl_set_isharp_data(struct dscl_prog_data *dscl_prog_data,
 	}
 
 	// Set the values as per lookup table
-#ifdef CONFIG_DRM_AMD_DC_FP
 	spl_set_blur_scale_data(dscl_prog_data, data);
-#endif
-}
-static bool spl_get_isharp_en(struct adaptive_sharpness adp_sharpness,
-		int vscale_ratio, int hscale_ratio, struct spl_taps taps,
-		enum spl_pixel_format format)
-{
-	bool enable_isharp = false;
-
-	if (adp_sharpness.enable == false)
-		return enable_isharp; // Return if adaptive sharpness is disabled
-	// Is downscaling ?
-	if (vscale_ratio > 1 || hscale_ratio > 1) {
-		// END - No iSHARP support for downscaling
-		return enable_isharp;
-	}
-	// Scaling is up to 1:1 (no scaling) or upscaling
-
-	/* Only apply sharpness to NV12 and not P010 */
-	if (format != SPL_PIXEL_FORMAT_420BPP8)
-		return enable_isharp;
-
-	// LB support horizontal taps 4,6 or vertical taps 3, 4, 6
-	if (taps.h_taps == 4 || taps.h_taps == 6 ||
-		taps.v_taps == 3 || taps.v_taps == 4 || taps.v_taps == 6) {
-		// END - iSHARP supported
-		enable_isharp = true;
-	}
-	return enable_isharp;
-}
-
-static bool spl_choose_lls_policy(enum spl_pixel_format format,
-	enum spl_transfer_func_type tf_type,
-	enum spl_transfer_func_predefined tf_predefined_type,
-	enum linear_light_scaling *lls_pref)
-{
-	if (spl_is_yuv420(format)) {
-		*lls_pref = LLS_PREF_NO;
-		if ((tf_type == SPL_TF_TYPE_PREDEFINED) || (tf_type == SPL_TF_TYPE_DISTRIBUTED_POINTS))
-			return true;
-	} else { /* RGB or YUV444 */
-		if (tf_type == SPL_TF_TYPE_PREDEFINED) {
-			if ((tf_predefined_type == SPL_TRANSFER_FUNCTION_HLG) ||
-				(tf_predefined_type == SPL_TRANSFER_FUNCTION_HLG12))
-				*lls_pref = LLS_PREF_NO;
-			else
-				*lls_pref = LLS_PREF_YES;
-			return true;
-		} else if (tf_type == SPL_TF_TYPE_BYPASS) {
-			*lls_pref = LLS_PREF_YES;
-			return true;
-		}
-	}
-	*lls_pref = LLS_PREF_NO;
-	return false;
 }
 
 /* Calculate scaler parameters */
@@ -1410,67 +1640,74 @@ bool spl_calculate_scaler_params(struct spl_in *spl_in, struct spl_out *spl_out)
 	bool res = false;
 	bool enable_easf_v = false;
 	bool enable_easf_h = false;
-	bool lls_enable_easf = true;
 	int vratio = 0;
 	int hratio = 0;
-	const struct spl_scaler_data *data = &spl_out->scl_data;
+	struct spl_scratch spl_scratch;
+	struct spl_fixed31_32 isharp_scale_ratio;
+	enum system_setup setup;
+	bool enable_isharp = false;
+	const struct spl_scaler_data *data = &spl_scratch.scl_data;
+
+	memset(&spl_scratch, 0, sizeof(struct spl_scratch));
+	spl_scratch.scl_data.h_active = spl_in->h_active;
+	spl_scratch.scl_data.v_active = spl_in->v_active;
+
 	// All SPL calls
 	/* recout calculation */
 	/* depends on h_active */
-	spl_calculate_recout(spl_in, spl_out);
+	spl_calculate_recout(spl_in, &spl_scratch, spl_out);
 	/* depends on pixel format */
-	spl_calculate_scaling_ratios(spl_in, spl_out);
+	spl_calculate_scaling_ratios(spl_in, &spl_scratch, spl_out);
 	/* depends on scaling ratios and recout, does not calculate offset yet */
-	spl_calculate_viewport_size(spl_in, spl_out);
+	spl_calculate_viewport_size(spl_in, &spl_scratch);
 
 	res = spl_get_optimal_number_of_taps(
 			  spl_in->basic_out.max_downscale_src_width, spl_in,
-			  spl_out, &spl_in->scaling_quality);
+			  &spl_scratch, &spl_in->scaling_quality, &enable_easf_v,
+			  &enable_easf_h, &enable_isharp);
 	/*
 	 * Depends on recout, scaling ratios, h_active and taps
 	 * May need to re-check lb size after this in some obscure scenario
 	 */
 	if (res)
-		spl_calculate_inits_and_viewports(spl_in, spl_out);
+		spl_calculate_inits_and_viewports(spl_in, &spl_scratch);
 	// Handle 3d recout
-	spl_handle_3d_recout(spl_in, &spl_out->scl_data.recout);
+	spl_handle_3d_recout(spl_in, &spl_scratch.scl_data.recout);
 	// Clamp
-	spl_clamp_viewport(&spl_out->scl_data.viewport);
+	spl_clamp_viewport(&spl_scratch.scl_data.viewport);
 
 	if (!res)
 		return res;
 
-	/*
-	 * If lls_pref is LLS_PREF_DONT_CARE, then use pixel format and transfer
-	 *  function to determine whether to use LINEAR or NONLINEAR scaling
-	 */
-	if (spl_in->lls_pref == LLS_PREF_DONT_CARE)
-		lls_enable_easf = spl_choose_lls_policy(spl_in->basic_in.format,
-			spl_in->basic_in.tf_type, spl_in->basic_in.tf_predefined_type,
-			&spl_in->lls_pref);
-
 	// Save all calculated parameters in dscl_prog_data structure to program hw registers
-	spl_set_dscl_prog_data(spl_in, spl_out);
+	spl_set_dscl_prog_data(spl_in, &spl_scratch, spl_out, enable_easf_v, enable_easf_h, enable_isharp);
 
-	vratio = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
-	hratio = dc_fixpt_ceil(spl_out->scl_data.ratios.horz);
-	if (!lls_enable_easf || spl_in->disable_easf) {
-		enable_easf_v = false;
-		enable_easf_h = false;
+	if (spl_in->lls_pref == LLS_PREF_YES) {
+		if (spl_in->is_hdr_on)
+			setup = HDR_L;
+		else
+			setup = SDR_L;
 	} else {
-		/* Enable EASF on vertical? */
-		enable_easf_v = enable_easf(vratio, spl_out->scl_data.taps.v_taps, spl_in->lls_pref, spl_in->prefer_easf);
-		/* Enable EASF on horizontal? */
-		enable_easf_h = enable_easf(hratio, spl_out->scl_data.taps.h_taps, spl_in->lls_pref, spl_in->prefer_easf);
+		if (spl_in->is_hdr_on)
+			setup = HDR_NL;
+		else
+			setup = SDR_NL;
 	}
+
 	// Set EASF
-	spl_set_easf_data(spl_out->dscl_prog_data, enable_easf_v, enable_easf_h, spl_in->lls_pref,
-		spl_in->basic_in.format);
+	spl_set_easf_data(&spl_scratch, spl_out, enable_easf_v, enable_easf_h, spl_in->lls_pref,
+		spl_in->basic_in.format, setup);
+
 	// Set iSHARP
-	bool enable_isharp = spl_get_isharp_en(spl_in->adaptive_sharpness, vratio, hratio,
-		spl_out->scl_data.taps, spl_in->basic_in.format);
+	vratio = spl_fixpt_ceil(spl_scratch.scl_data.ratios.vert);
+	hratio = spl_fixpt_ceil(spl_scratch.scl_data.ratios.horz);
+	if (vratio <= hratio)
+		isharp_scale_ratio = spl_scratch.scl_data.recip_ratios.vert;
+	else
+		isharp_scale_ratio = spl_scratch.scl_data.recip_ratios.horz;
+
 	spl_set_isharp_data(spl_out->dscl_prog_data, spl_in->adaptive_sharpness, enable_isharp,
-		spl_in->lls_pref, spl_in->basic_in.format, data);
+		spl_in->lls_pref, spl_in->basic_in.format, data, isharp_scale_ratio, setup);
 
 	return res;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c
new file mode 100644
index 000000000000..99238644e0a1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#include "dc_spl_filters.h"
+
+void convert_filter_s1_10_to_s1_12(const uint16_t *s1_10_filter,
+	uint16_t *s1_12_filter, int num_taps)
+{
+	int num_entries = NUM_PHASES_COEFF * num_taps;
+	int i;
+
+	for (i = 0; i < num_entries; i++)
+		*(s1_12_filter + i) = *(s1_10_filter + i) * 4;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h
new file mode 100644
index 000000000000..20439cdbdb10
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+
+#ifndef __DC_SPL_FILTERS_H__
+#define __DC_SPL_FILTERS_H__
+
+#include "dc_spl_types.h"
+
+#define NUM_PHASES_COEFF 33
+
+void convert_filter_s1_10_to_s1_12(const uint16_t *s1_10_filter,
+	uint16_t *s1_12_filter, int num_taps);
+
+#endif /* __DC_SPL_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
index a5d9a6223d06..8e4bcba2932a 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
@@ -2,6 +2,8 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
+#include "spl_debug.h"
+#include "dc_spl_filters.h"
 #include "dc_spl_isharp_filters.h"
 
 //========================================
@@ -15,7 +17,7 @@
 // C_start = 40.000000
 // C_end   = 64.000000
 //========================================
-static const uint32_t filter_isharp_1D_lut_0[32] = {
+static const uint32_t filter_isharp_1D_lut_0[ISHARP_LUT_TABLE_SIZE] = {
 0x02010000,
 0x0A070503,
 0x1614100D,
@@ -61,7 +63,7 @@ static const uint32_t filter_isharp_1D_lut_0[32] = {
 // C_end   = 127.000000
 //========================================
 
-static const uint32_t filter_isharp_1D_lut_0p5x[32] = {
+static const uint32_t filter_isharp_1D_lut_0p5x[ISHARP_LUT_TABLE_SIZE] = {
 0x00000000,
 0x02020101,
 0x06050403,
@@ -106,7 +108,7 @@ static const uint32_t filter_isharp_1D_lut_0p5x[32] = {
 // C_start = 96.000000
 // C_end   = 127.000000
 //========================================
-static const uint32_t filter_isharp_1D_lut_1p0x[32] = {
+static const uint32_t filter_isharp_1D_lut_1p0x[ISHARP_LUT_TABLE_SIZE] = {
 0x01000000,
 0x05040302,
 0x0B0A0806,
@@ -151,7 +153,7 @@ static const uint32_t filter_isharp_1D_lut_1p0x[32] = {
 // C_start = 96.000000
 // C_end   = 127.000000
 //========================================
-static const uint32_t filter_isharp_1D_lut_1p5x[32] = {
+static const uint32_t filter_isharp_1D_lut_1p5x[ISHARP_LUT_TABLE_SIZE] = {
 0x01010000,
 0x07050402,
 0x110F0C0A,
@@ -196,7 +198,7 @@ static const uint32_t filter_isharp_1D_lut_1p5x[32] = {
 // C_start = 40.000000
 // C_end   = 127.000000
 //========================================
-static const uint32_t filter_isharp_1D_lut_2p0x[32] = {
+static const uint32_t filter_isharp_1D_lut_2p0x[ISHARP_LUT_TABLE_SIZE] = {
 0x02010000,
 0x0A070503,
 0x1614100D,
@@ -230,6 +232,53 @@ static const uint32_t filter_isharp_1D_lut_2p0x[32] = {
 0x080B0D0E,
 0x00020406,
 };
+//========================================
+// Delta Gain 1DLUT
+// LUT content is packed as 4-bytes into one DWORD/entry
+// A_start = 0.000000
+// A_end   = 10.000000
+// A_gain  = 3.000000
+// B_start = 11.000000
+// B_end   = 127.000000
+// C_start = 40.000000
+// C_end   = 127.000000
+//========================================
+static const uint32_t filter_isharp_1D_lut_3p0x[ISHARP_LUT_TABLE_SIZE] = {
+0x03010000,
+0x0F0B0805,
+0x211E1813,
+0x2B292624,
+0x3533302E,
+0x3E3C3A37,
+0x46444240,
+0x4D4B4A48,
+0x5352504F,
+0x59575655,
+0x5D5C5B5A,
+0x61605F5E,
+0x64646362,
+0x66666565,
+0x68686767,
+0x68686868,
+0x68686868,
+0x67676868,
+0x65656666,
+0x62636464,
+0x5E5F6061,
+0x5A5B5C5D,
+0x55565759,
+0x4F505253,
+0x484A4B4D,
+0x40424446,
+0x373A3C3E,
+0x2E303335,
+0x2426292B,
+0x191B1E21,
+0x0D101316,
+0x0003060A,
+};
+
+//========================================
 // Wide scaler coefficients
 //========================================================
 // <using>			gen_scaler_coeffs.m
@@ -284,7 +333,7 @@ static const uint16_t filter_isharp_wide_6tap_64p[198] = {
 // <CoefType>		Blur & Scale LPF
 // <CoefQuant>		S1.10
 //========================================================
-static const uint16_t filter_isharp_bs_4tap_64p[198] = {
+static const uint16_t filter_isharp_bs_4tap_in_6_64p[198] = {
 0x0000, 0x00E5, 0x0237, 0x00E4, 0x0000, 0x0000,
 0x0000, 0x00DE, 0x0237, 0x00EB, 0x0000, 0x0000,
 0x0000, 0x00D7, 0x0236, 0x00F2, 0x0001, 0x0000,
@@ -319,6 +368,246 @@ static const uint16_t filter_isharp_bs_4tap_64p[198] = {
 0x0000, 0x003B, 0x01CF, 0x01C2, 0x0034, 0x0000,
 0x0000, 0x0037, 0x01C9, 0x01C9, 0x0037, 0x0000
 };
+//========================================================
+// <using>			gen_BlurScale_coeffs.m
+// <date>			25-Apr-2022
+// <num_taps>		4
+// <num_phases>		64
+// <CoefType>		Blur & Scale LPF
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t filter_isharp_bs_4tap_64p[132] = {
+0x00E5, 0x0237, 0x00E4, 0x0000,
+0x00DE, 0x0237, 0x00EB, 0x0000,
+0x00D7, 0x0236, 0x00F2, 0x0001,
+0x00D0, 0x0235, 0x00FA, 0x0001,
+0x00C9, 0x0234, 0x0101, 0x0002,
+0x00C2, 0x0233, 0x0108, 0x0003,
+0x00BB, 0x0232, 0x0110, 0x0003,
+0x00B5, 0x0230, 0x0117, 0x0004,
+0x00AE, 0x022E, 0x011F, 0x0005,
+0x00A8, 0x022C, 0x0126, 0x0006,
+0x00A2, 0x022A, 0x012D, 0x0007,
+0x009C, 0x0228, 0x0134, 0x0008,
+0x0096, 0x0225, 0x013C, 0x0009,
+0x0090, 0x0222, 0x0143, 0x000B,
+0x008A, 0x021F, 0x014B, 0x000C,
+0x0085, 0x021C, 0x0151, 0x000E,
+0x007F, 0x0218, 0x015A, 0x000F,
+0x007A, 0x0215, 0x0160, 0x0011,
+0x0074, 0x0211, 0x0168, 0x0013,
+0x006F, 0x020D, 0x016F, 0x0015,
+0x006A, 0x0209, 0x0176, 0x0017,
+0x0065, 0x0204, 0x017E, 0x0019,
+0x0060, 0x0200, 0x0185, 0x001B,
+0x005C, 0x01FB, 0x018C, 0x001D,
+0x0057, 0x01F6, 0x0193, 0x0020,
+0x0053, 0x01F1, 0x019A, 0x0022,
+0x004E, 0x01EC, 0x01A1, 0x0025,
+0x004A, 0x01E6, 0x01A8, 0x0028,
+0x0046, 0x01E1, 0x01AF, 0x002A,
+0x0042, 0x01DB, 0x01B6, 0x002D,
+0x003F, 0x01D5, 0x01BB, 0x0031,
+0x003B, 0x01CF, 0x01C2, 0x0034,
+0x0037, 0x01C9, 0x01C9, 0x0037,
+};
+//========================================================
+// <using>			gen_BlurScale_coeffs.m
+// <date>			09-Jun-2022
+// <num_taps>		3
+// <num_phases>		64
+// <CoefType>		Blur & Scale LPF
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t filter_isharp_bs_3tap_64p[99] = {
+0x0200, 0x0200, 0x0000,
+0x01F6, 0x0206, 0x0004,
+0x01EC, 0x020B, 0x0009,
+0x01E2, 0x0211, 0x000D,
+0x01D8, 0x0216, 0x0012,
+0x01CE, 0x021C, 0x0016,
+0x01C4, 0x0221, 0x001B,
+0x01BA, 0x0226, 0x0020,
+0x01B0, 0x022A, 0x0026,
+0x01A6, 0x022F, 0x002B,
+0x019C, 0x0233, 0x0031,
+0x0192, 0x0238, 0x0036,
+0x0188, 0x023C, 0x003C,
+0x017E, 0x0240, 0x0042,
+0x0174, 0x0244, 0x0048,
+0x016A, 0x0248, 0x004E,
+0x0161, 0x024A, 0x0055,
+0x0157, 0x024E, 0x005B,
+0x014D, 0x0251, 0x0062,
+0x0144, 0x0253, 0x0069,
+0x013A, 0x0256, 0x0070,
+0x0131, 0x0258, 0x0077,
+0x0127, 0x025B, 0x007E,
+0x011E, 0x025C, 0x0086,
+0x0115, 0x025E, 0x008D,
+0x010B, 0x0260, 0x0095,
+0x0102, 0x0262, 0x009C,
+0x00F9, 0x0263, 0x00A4,
+0x00F0, 0x0264, 0x00AC,
+0x00E7, 0x0265, 0x00B4,
+0x00DF, 0x0264, 0x00BD,
+0x00D6, 0x0265, 0x00C5,
+0x00CD, 0x0266, 0x00CD,
+};
+
+/* Converted Blur & Scale coeff tables from S1.10 to S1.12 */
+static uint16_t filter_isharp_bs_4tap_in_6_64p_s1_12[198];
+static uint16_t filter_isharp_bs_4tap_64p_s1_12[132];
+static uint16_t filter_isharp_bs_3tap_64p_s1_12[99];
+
+struct scale_ratio_to_sharpness_level_lookup scale_to_sharp_sdr_nl[3][6] = {
+	{ /* LOW */
+		{1125, 1000, 75, 100},
+		{11, 10, 6, 10},
+		{1075, 1000, 45, 100},
+		{105, 100, 3, 10},
+		{1025, 1000, 15, 100},
+		{1, 1, 0, 1},
+	},
+	{ /* MID */
+		{1125, 1000, 2, 1},
+		{11, 10, 175, 100},
+		{1075, 1000, 15, 10},
+		{105, 100, 125, 100},
+		{1025, 1000, 1, 1},
+		{1, 1, 75, 100},
+	},
+	{ /* HIGH */
+		{1125, 1000, 35, 10},
+		{11, 10, 32, 10},
+		{1075, 1000, 29, 10},
+		{105, 100, 26, 10},
+		{1025, 1000, 23, 10},
+		{1, 1, 2, 1},
+	},
+};
+
+struct scale_ratio_to_sharpness_level_lookup scale_to_sharp_sdr_l[3][6] = {
+	{ /* LOW */
+		{1125, 1000, 75, 100},
+		{11, 10, 6, 10},
+		{1075, 1000, 45, 100},
+		{105, 100, 3, 10},
+		{1025, 1000, 15, 100},
+		{1, 1, 0, 1},
+	},
+	{ /* MID */
+		{1125, 1000, 15, 10},
+		{11, 10, 135, 100},
+		{1075, 1000, 12, 10},
+		{105, 100, 105, 100},
+		{1025, 1000, 9, 10},
+		{1, 1, 75, 100},
+	},
+	{ /* HIGH */
+		{1125, 1000, 25, 10},
+		{11, 10, 23, 10},
+		{1075, 1000, 21, 10},
+		{105, 100, 19, 10},
+		{1025, 1000, 17, 10},
+		{1, 1, 15, 10},
+	},
+};
+
+struct scale_ratio_to_sharpness_level_lookup scale_to_sharp_hdr_nl[3][6] = {
+	{ /* LOW */
+		{1125, 1000, 5, 10},
+		{11, 10, 4, 10},
+		{1075, 1000, 3, 10},
+		{105, 100, 2, 10},
+		{1025, 1000, 1, 10},
+		{1, 1, 0, 1},
+	},
+	{ /* MID */
+		{1125, 1000, 1, 1},
+		{11, 10, 9, 10},
+		{1075, 1000, 8, 10},
+		{105, 100, 7, 10},
+		{1025, 1000, 6, 10},
+		{1, 1, 5, 10},
+	},
+	{ /* HIGH */
+		{1125, 1000, 15, 10},
+		{11, 10, 14, 10},
+		{1075, 1000, 13, 10},
+		{105, 100, 12, 10},
+		{1025, 1000, 11, 10},
+		{1, 1, 1, 1},
+	},
+};
+
+struct scale_ratio_to_sharpness_level_lookup scale_to_sharp_hdr_l[3][6] = {
+	{ /* LOW */
+		{1125, 1000, 75, 100},
+		{11, 10, 6, 10},
+		{1075, 1000, 45, 100},
+		{105, 100, 3, 10},
+		{1025, 1000, 15, 100},
+		{1, 1, 0, 1},
+	},
+	{ /* MID */
+		{1125, 1000, 15, 10},
+		{11, 10, 135, 100},
+		{1075, 1000, 12, 10},
+		{105, 100, 105, 100},
+		{1025, 1000, 9, 10},
+		{1, 1, 75, 100},
+	},
+	{ /* HIGH */
+		{1125, 1000, 25, 10},
+		{11, 10, 23, 10},
+		{1075, 1000, 21, 10},
+		{105, 100, 19, 10},
+		{1025, 1000, 17, 10},
+		{1, 1, 15, 10},
+	},
+};
+
+/* Pre-generated 1DLUT for given setup and sharpness level */
+struct isharp_1D_lut_pregen filter_isharp_1D_lut_pregen[NUM_SHARPNESS_SETUPS] = {
+	{
+		0, 0,
+		{
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+		}
+	},
+	{
+		0, 0,
+		{
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+		}
+	},
+	{
+		0, 0,
+		{
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+		}
+	},
+	{
+		0, 0,
+		{
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+		}
+	},
+};
+
 const uint32_t *spl_get_filter_isharp_1D_lut_0(void)
 {
 	return filter_isharp_1D_lut_0;
@@ -339,11 +628,166 @@ const uint32_t *spl_get_filter_isharp_1D_lut_2p0x(void)
 {
 	return filter_isharp_1D_lut_2p0x;
 }
+const uint32_t *spl_get_filter_isharp_1D_lut_3p0x(void)
+{
+	return filter_isharp_1D_lut_3p0x;
+}
 const uint16_t *spl_get_filter_isharp_wide_6tap_64p(void)
 {
 	return filter_isharp_wide_6tap_64p;
 }
-const uint16_t *spl_get_filter_isharp_bs_4tap_64p(void)
+uint16_t *spl_get_filter_isharp_bs_4tap_in_6_64p(void)
+{
+	return filter_isharp_bs_4tap_in_6_64p_s1_12;
+}
+uint16_t *spl_get_filter_isharp_bs_4tap_64p(void)
+{
+	return filter_isharp_bs_4tap_64p_s1_12;
+}
+uint16_t *spl_get_filter_isharp_bs_3tap_64p(void)
 {
-	return filter_isharp_bs_4tap_64p;
+	return filter_isharp_bs_3tap_64p_s1_12;
 }
+
+void spl_build_isharp_1dlut_from_reference_curve(struct spl_fixed31_32 ratio, enum system_setup setup, enum explicit_sharpness sharpness)
+{
+	uint8_t *byte_ptr_1dlut_src, *byte_ptr_1dlut_dst;
+	struct spl_fixed31_32 sharp_base, sharp_calc, sharp_level, ratio_level;
+	int j;
+	struct scale_ratio_to_sharpness_level_lookup *setup_lookup_ptr;
+	int num_sharp_ramp_levels;
+	int size_1dlut;
+	int sharp_calc_int;
+	uint32_t filter_pregen_store[ISHARP_LUT_TABLE_SIZE];
+
+	/*
+	 * Given scaling ratio, setup and sharpness, build pregenerated
+	 * 1DLUT tables
+	 *
+	 * Based on setup ( HDR/SDR, L/NL ), get base scale ratio to
+	 *  sharpness curve
+	 */
+	switch (setup) {
+	case HDR_L:
+		setup_lookup_ptr = scale_to_sharp_hdr_l[sharpness];
+		num_sharp_ramp_levels = sizeof(scale_to_sharp_hdr_l[sharpness])/
+			sizeof(struct scale_ratio_to_sharpness_level_lookup);
+		break;
+	case HDR_NL:
+		setup_lookup_ptr = scale_to_sharp_hdr_nl[sharpness];
+		num_sharp_ramp_levels = sizeof(scale_to_sharp_hdr_nl[sharpness])/
+			sizeof(struct scale_ratio_to_sharpness_level_lookup);
+		break;
+	case SDR_L:
+		setup_lookup_ptr = scale_to_sharp_sdr_l[sharpness];
+		num_sharp_ramp_levels = sizeof(scale_to_sharp_sdr_l[sharpness])/
+			sizeof(struct scale_ratio_to_sharpness_level_lookup);
+		break;
+	case SDR_NL:
+	default:
+		setup_lookup_ptr = scale_to_sharp_sdr_nl[sharpness];
+		num_sharp_ramp_levels = sizeof(scale_to_sharp_sdr_nl[sharpness])/
+			sizeof(struct scale_ratio_to_sharpness_level_lookup);
+		break;
+	}
+
+	/*
+	 * Compare desired scaling ratio and find adjusted sharpness from
+	 *  base scale ratio to sharpness curve
+	 */
+	j = 0;
+	sharp_level = spl_fixpt_zero;
+	while (j < num_sharp_ramp_levels) {
+		ratio_level = spl_fixpt_from_fraction(setup_lookup_ptr->ratio_numer,
+			setup_lookup_ptr->ratio_denom);
+		if (ratio.value >= ratio_level.value) {
+			sharp_level = spl_fixpt_from_fraction(setup_lookup_ptr->sharpness_numer,
+				setup_lookup_ptr->sharpness_denom);
+			break;
+		}
+		setup_lookup_ptr++;
+		j++;
+	}
+
+	/*
+	 * Check if pregen 1dlut table is already precalculated
+	 * If numer/denom is different, then recalculate
+	 */
+	if ((filter_isharp_1D_lut_pregen[setup].sharpness_numer == setup_lookup_ptr->sharpness_numer) &&
+		(filter_isharp_1D_lut_pregen[setup].sharpness_denom == setup_lookup_ptr->sharpness_denom))
+		return;
+
+	/*
+	 * Calculate LUT_128_gained with this equation:
+	 *
+	 * LUT_128_gained[i] = (uint8)(0.5 + min(255,(double)(LUT_128[i])*sharpLevel/iGain))
+	 *  where LUT_128[i] is contents of 3p0x isharp 1dlut
+	 *  where sharpLevel is desired sharpness level
+	 *  where iGain is base sharpness level 3.0
+	 *  where LUT_128_gained[i] is adjusted 1dlut value based on desired sharpness level
+	 */
+	byte_ptr_1dlut_src = (uint8_t *)filter_isharp_1D_lut_3p0x;
+	byte_ptr_1dlut_dst = (uint8_t *)filter_pregen_store;
+	size_1dlut = sizeof(filter_isharp_1D_lut_3p0x);
+	memset(byte_ptr_1dlut_dst, 0, size_1dlut);
+	for (j = 0; j < size_1dlut; j++) {
+		sharp_base = spl_fixpt_from_int((int)*byte_ptr_1dlut_src);
+		sharp_calc = spl_fixpt_mul(sharp_base, sharp_level);
+		sharp_calc = spl_fixpt_div(sharp_calc, spl_fixpt_from_int(3));
+		sharp_calc = spl_fixpt_min(spl_fixpt_from_int(255), sharp_calc);
+		sharp_calc = spl_fixpt_add(sharp_calc, spl_fixpt_from_fraction(1, 2));
+		sharp_calc_int = spl_fixpt_floor(sharp_calc);
+		if (sharp_calc_int > 255)
+			sharp_calc_int = 255;
+		*byte_ptr_1dlut_dst = (uint8_t)sharp_calc_int;
+
+		byte_ptr_1dlut_src++;
+		byte_ptr_1dlut_dst++;
+	}
+
+	/* Update 1dlut table and sharpness level */
+	memcpy((void *)filter_isharp_1D_lut_pregen[setup].value, (void *)filter_pregen_store, size_1dlut);
+	filter_isharp_1D_lut_pregen[setup].sharpness_numer = setup_lookup_ptr->sharpness_numer;
+	filter_isharp_1D_lut_pregen[setup].sharpness_denom = setup_lookup_ptr->sharpness_denom;
+}
+
+uint32_t *spl_get_pregen_filter_isharp_1D_lut(enum system_setup setup)
+{
+	return filter_isharp_1D_lut_pregen[setup].value;
+}
+
+void spl_init_blur_scale_coeffs(void)
+{
+	convert_filter_s1_10_to_s1_12(filter_isharp_bs_3tap_64p,
+		filter_isharp_bs_3tap_64p_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(filter_isharp_bs_4tap_64p,
+		filter_isharp_bs_4tap_64p_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(filter_isharp_bs_4tap_in_6_64p,
+		filter_isharp_bs_4tap_in_6_64p_s1_12, 6);
+}
+
+uint16_t *spl_dscl_get_blur_scale_coeffs_64p(int taps)
+{
+	if (taps == 3)
+		return spl_get_filter_isharp_bs_3tap_64p();
+	else if (taps == 4)
+		return spl_get_filter_isharp_bs_4tap_64p();
+	else if (taps == 6)
+		return spl_get_filter_isharp_bs_4tap_in_6_64p();
+	else {
+		/* should never happen, bug */
+		SPL_BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+}
+
+void spl_set_blur_scale_data(struct dscl_prog_data *dscl_prog_data,
+		const struct spl_scaler_data *data)
+{
+	dscl_prog_data->filter_blur_scale_h =
+		spl_dscl_get_blur_scale_coeffs_64p(data->taps.h_taps);
+
+	dscl_prog_data->filter_blur_scale_v =
+		spl_dscl_get_blur_scale_coeffs_64p(data->taps.v_taps);
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
index 1aaf4c50c1bc..3d023a154a92 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
@@ -7,11 +7,44 @@
 
 #include "dc_spl_types.h"
 
+#define ISHARP_LUT_TABLE_SIZE 32
 const uint32_t *spl_get_filter_isharp_1D_lut_0(void);
 const uint32_t *spl_get_filter_isharp_1D_lut_0p5x(void);
 const uint32_t *spl_get_filter_isharp_1D_lut_1p0x(void);
 const uint32_t *spl_get_filter_isharp_1D_lut_1p5x(void);
 const uint32_t *spl_get_filter_isharp_1D_lut_2p0x(void);
-const uint16_t *spl_get_filter_isharp_bs_4tap_64p(void);
+const uint32_t *spl_get_filter_isharp_1D_lut_3p0x(void);
+uint16_t *spl_get_filter_isharp_bs_4tap_in_6_64p(void);
+uint16_t *spl_get_filter_isharp_bs_4tap_64p(void);
+uint16_t *spl_get_filter_isharp_bs_3tap_64p(void);
 const uint16_t *spl_get_filter_isharp_wide_6tap_64p(void);
+uint16_t *spl_dscl_get_blur_scale_coeffs_64p(int taps);
+
+struct scale_ratio_to_sharpness_level_lookup {
+	unsigned int ratio_numer;
+	unsigned int ratio_denom;
+	unsigned int sharpness_numer;
+	unsigned int sharpness_denom;
+};
+
+struct isharp_1D_lut_pregen {
+	unsigned int sharpness_numer;
+	unsigned int sharpness_denom;
+	uint32_t value[ISHARP_LUT_TABLE_SIZE];
+};
+
+enum system_setup {
+	SDR_NL = 0,
+	SDR_L,
+	HDR_NL,
+	HDR_L,
+	NUM_SHARPNESS_SETUPS
+};
+
+void spl_init_blur_scale_coeffs(void);
+void spl_set_blur_scale_data(struct dscl_prog_data *dscl_prog_data,
+	const struct spl_scaler_data *data);
+
+void spl_build_isharp_1dlut_from_reference_curve(struct spl_fixed31_32 ratio, enum system_setup setup, enum explicit_sharpness sharpness);
+uint32_t *spl_get_pregen_filter_isharp_1D_lut(enum system_setup setup);
 #endif /* __DC_SPL_ISHARP_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
new file mode 100644
index 000000000000..09bf82f7d468
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
@@ -0,0 +1,1726 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#include "spl_debug.h"
+#include "dc_spl_filters.h"
+#include "dc_spl_scl_filters.h"
+#include "dc_spl_scl_easf_filters.h"
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.3_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.300000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_30[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F6, 0x0206, 0x0004,
+	0x01EC, 0x020B, 0x0009,
+	0x01E2, 0x0211, 0x000D,
+	0x01D8, 0x0216, 0x0012,
+	0x01CE, 0x021C, 0x0016,
+	0x01C4, 0x0221, 0x001B,
+	0x01BA, 0x0226, 0x0020,
+	0x01B0, 0x022A, 0x0026,
+	0x01A6, 0x022F, 0x002B,
+	0x019C, 0x0233, 0x0031,
+	0x0192, 0x0238, 0x0036,
+	0x0188, 0x023C, 0x003C,
+	0x017E, 0x0240, 0x0042,
+	0x0174, 0x0244, 0x0048,
+	0x016A, 0x0248, 0x004E,
+	0x0161, 0x024A, 0x0055,
+	0x0157, 0x024E, 0x005B,
+	0x014D, 0x0251, 0x0062,
+	0x0144, 0x0253, 0x0069,
+	0x013A, 0x0256, 0x0070,
+	0x0131, 0x0258, 0x0077,
+	0x0127, 0x025B, 0x007E,
+	0x011E, 0x025C, 0x0086,
+	0x0115, 0x025E, 0x008D,
+	0x010B, 0x0260, 0x0095,
+	0x0102, 0x0262, 0x009C,
+	0x00F9, 0x0263, 0x00A4,
+	0x00F0, 0x0264, 0x00AC,
+	0x00E7, 0x0265, 0x00B4,
+	0x00DF, 0x0264, 0x00BD,
+	0x00D6, 0x0265, 0x00C5,
+	0x00CD, 0x0266, 0x00CD,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.4_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.400000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_40[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F6, 0x0206, 0x0004,
+	0x01EB, 0x020E, 0x0007,
+	0x01E1, 0x0214, 0x000B,
+	0x01D7, 0x021A, 0x000F,
+	0x01CD, 0x0220, 0x0013,
+	0x01C2, 0x0226, 0x0018,
+	0x01B8, 0x022C, 0x001C,
+	0x01AE, 0x0231, 0x0021,
+	0x01A3, 0x0237, 0x0026,
+	0x0199, 0x023C, 0x002B,
+	0x018F, 0x0240, 0x0031,
+	0x0185, 0x0245, 0x0036,
+	0x017A, 0x024A, 0x003C,
+	0x0170, 0x024F, 0x0041,
+	0x0166, 0x0253, 0x0047,
+	0x015C, 0x0257, 0x004D,
+	0x0152, 0x025A, 0x0054,
+	0x0148, 0x025E, 0x005A,
+	0x013E, 0x0261, 0x0061,
+	0x0134, 0x0264, 0x0068,
+	0x012B, 0x0266, 0x006F,
+	0x0121, 0x0269, 0x0076,
+	0x0117, 0x026C, 0x007D,
+	0x010E, 0x026E, 0x0084,
+	0x0104, 0x0270, 0x008C,
+	0x00FB, 0x0271, 0x0094,
+	0x00F2, 0x0272, 0x009C,
+	0x00E9, 0x0273, 0x00A4,
+	0x00E0, 0x0274, 0x00AC,
+	0x00D7, 0x0275, 0x00B4,
+	0x00CE, 0x0275, 0x00BD,
+	0x00C5, 0x0276, 0x00C5,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.5_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.500000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_50[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F5, 0x0209, 0x0002,
+	0x01EA, 0x0211, 0x0005,
+	0x01DF, 0x021A, 0x0007,
+	0x01D4, 0x0222, 0x000A,
+	0x01C9, 0x022A, 0x000D,
+	0x01BE, 0x0232, 0x0010,
+	0x01B3, 0x0239, 0x0014,
+	0x01A8, 0x0241, 0x0017,
+	0x019D, 0x0248, 0x001B,
+	0x0192, 0x024F, 0x001F,
+	0x0187, 0x0255, 0x0024,
+	0x017C, 0x025C, 0x0028,
+	0x0171, 0x0262, 0x002D,
+	0x0166, 0x0268, 0x0032,
+	0x015B, 0x026E, 0x0037,
+	0x0150, 0x0273, 0x003D,
+	0x0146, 0x0278, 0x0042,
+	0x013B, 0x027D, 0x0048,
+	0x0130, 0x0282, 0x004E,
+	0x0126, 0x0286, 0x0054,
+	0x011B, 0x028A, 0x005B,
+	0x0111, 0x028D, 0x0062,
+	0x0107, 0x0290, 0x0069,
+	0x00FD, 0x0293, 0x0070,
+	0x00F3, 0x0296, 0x0077,
+	0x00E9, 0x0298, 0x007F,
+	0x00DF, 0x029A, 0x0087,
+	0x00D5, 0x029C, 0x008F,
+	0x00CC, 0x029D, 0x0097,
+	0x00C3, 0x029E, 0x009F,
+	0x00BA, 0x029E, 0x00A8,
+	0x00B1, 0x029E, 0x00B1,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.6_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.600000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_60[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F4, 0x020B, 0x0001,
+	0x01E8, 0x0216, 0x0002,
+	0x01DC, 0x0221, 0x0003,
+	0x01D0, 0x022B, 0x0005,
+	0x01C4, 0x0235, 0x0007,
+	0x01B8, 0x0240, 0x0008,
+	0x01AC, 0x0249, 0x000B,
+	0x01A0, 0x0253, 0x000D,
+	0x0194, 0x025C, 0x0010,
+	0x0188, 0x0265, 0x0013,
+	0x017C, 0x026E, 0x0016,
+	0x0170, 0x0277, 0x0019,
+	0x0164, 0x027F, 0x001D,
+	0x0158, 0x0287, 0x0021,
+	0x014C, 0x028F, 0x0025,
+	0x0140, 0x0297, 0x0029,
+	0x0135, 0x029D, 0x002E,
+	0x0129, 0x02A4, 0x0033,
+	0x011D, 0x02AB, 0x0038,
+	0x0112, 0x02B0, 0x003E,
+	0x0107, 0x02B5, 0x0044,
+	0x00FC, 0x02BA, 0x004A,
+	0x00F1, 0x02BF, 0x0050,
+	0x00E6, 0x02C3, 0x0057,
+	0x00DB, 0x02C7, 0x005E,
+	0x00D1, 0x02CA, 0x0065,
+	0x00C7, 0x02CC, 0x006D,
+	0x00BD, 0x02CE, 0x0075,
+	0x00B3, 0x02D0, 0x007D,
+	0x00A9, 0x02D2, 0x0085,
+	0x00A0, 0x02D2, 0x008E,
+	0x0097, 0x02D2, 0x0097,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.7_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.700000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_70[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F3, 0x020D, 0x0000,
+	0x01E5, 0x021B, 0x0000,
+	0x01D8, 0x0228, 0x0000,
+	0x01CB, 0x0235, 0x0000,
+	0x01BD, 0x0243, 0x0000,
+	0x01B0, 0x024F, 0x0001,
+	0x01A2, 0x025C, 0x0002,
+	0x0195, 0x0268, 0x0003,
+	0x0187, 0x0275, 0x0004,
+	0x017A, 0x0280, 0x0006,
+	0x016D, 0x028C, 0x0007,
+	0x015F, 0x0298, 0x0009,
+	0x0152, 0x02A2, 0x000C,
+	0x0145, 0x02AD, 0x000E,
+	0x0138, 0x02B7, 0x0011,
+	0x012B, 0x02C0, 0x0015,
+	0x011E, 0x02CA, 0x0018,
+	0x0111, 0x02D3, 0x001C,
+	0x0105, 0x02DB, 0x0020,
+	0x00F8, 0x02E3, 0x0025,
+	0x00EC, 0x02EA, 0x002A,
+	0x00E0, 0x02F1, 0x002F,
+	0x00D5, 0x02F6, 0x0035,
+	0x00C9, 0x02FC, 0x003B,
+	0x00BE, 0x0301, 0x0041,
+	0x00B3, 0x0305, 0x0048,
+	0x00A8, 0x0309, 0x004F,
+	0x009E, 0x030C, 0x0056,
+	0x0094, 0x030E, 0x005E,
+	0x008A, 0x0310, 0x0066,
+	0x0081, 0x0310, 0x006F,
+	0x0077, 0x0312, 0x0077,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.8_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.800000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_80[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F1, 0x0210, 0x0FFF,
+	0x01E2, 0x0220, 0x0FFE,
+	0x01D2, 0x0232, 0x0FFC,
+	0x01C3, 0x0241, 0x0FFC,
+	0x01B4, 0x0251, 0x0FFB,
+	0x01A4, 0x0262, 0x0FFA,
+	0x0195, 0x0271, 0x0FFA,
+	0x0186, 0x0281, 0x0FF9,
+	0x0176, 0x0291, 0x0FF9,
+	0x0167, 0x02A0, 0x0FF9,
+	0x0158, 0x02AE, 0x0FFA,
+	0x0149, 0x02BD, 0x0FFA,
+	0x013A, 0x02CB, 0x0FFB,
+	0x012C, 0x02D7, 0x0FFD,
+	0x011D, 0x02E5, 0x0FFE,
+	0x010F, 0x02F1, 0x0000,
+	0x0101, 0x02FD, 0x0002,
+	0x00F3, 0x0308, 0x0005,
+	0x00E5, 0x0313, 0x0008,
+	0x00D8, 0x031D, 0x000B,
+	0x00CB, 0x0326, 0x000F,
+	0x00BE, 0x032F, 0x0013,
+	0x00B2, 0x0337, 0x0017,
+	0x00A6, 0x033E, 0x001C,
+	0x009A, 0x0345, 0x0021,
+	0x008F, 0x034A, 0x0027,
+	0x0084, 0x034F, 0x002D,
+	0x0079, 0x0353, 0x0034,
+	0x006F, 0x0356, 0x003B,
+	0x0065, 0x0358, 0x0043,
+	0x005C, 0x0359, 0x004B,
+	0x0053, 0x035A, 0x0053,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.9_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.900000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_90[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01EE, 0x0214, 0x0FFE,
+	0x01DC, 0x0228, 0x0FFC,
+	0x01CA, 0x023C, 0x0FFA,
+	0x01B9, 0x024F, 0x0FF8,
+	0x01A7, 0x0262, 0x0FF7,
+	0x0195, 0x0276, 0x0FF5,
+	0x0183, 0x028A, 0x0FF3,
+	0x0172, 0x029C, 0x0FF2,
+	0x0160, 0x02AF, 0x0FF1,
+	0x014F, 0x02C2, 0x0FEF,
+	0x013E, 0x02D4, 0x0FEE,
+	0x012D, 0x02E5, 0x0FEE,
+	0x011C, 0x02F7, 0x0FED,
+	0x010C, 0x0307, 0x0FED,
+	0x00FB, 0x0318, 0x0FED,
+	0x00EC, 0x0327, 0x0FED,
+	0x00DC, 0x0336, 0x0FEE,
+	0x00CD, 0x0344, 0x0FEF,
+	0x00BE, 0x0352, 0x0FF0,
+	0x00B0, 0x035E, 0x0FF2,
+	0x00A2, 0x036A, 0x0FF4,
+	0x0095, 0x0375, 0x0FF6,
+	0x0088, 0x037F, 0x0FF9,
+	0x007B, 0x0388, 0x0FFD,
+	0x006F, 0x0391, 0x0000,
+	0x0064, 0x0397, 0x0005,
+	0x0059, 0x039D, 0x000A,
+	0x004E, 0x03A3, 0x000F,
+	0x0045, 0x03A6, 0x0015,
+	0x003B, 0x03A9, 0x001C,
+	0x0033, 0x03AA, 0x0023,
+	0x002A, 0x03AC, 0x002A,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_1_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 1.000000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_1_00[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01EB, 0x0217, 0x0FFE,
+	0x01D5, 0x022F, 0x0FFC,
+	0x01C0, 0x0247, 0x0FF9,
+	0x01AB, 0x025E, 0x0FF7,
+	0x0196, 0x0276, 0x0FF4,
+	0x0181, 0x028D, 0x0FF2,
+	0x016C, 0x02A5, 0x0FEF,
+	0x0158, 0x02BB, 0x0FED,
+	0x0144, 0x02D1, 0x0FEB,
+	0x0130, 0x02E8, 0x0FE8,
+	0x011C, 0x02FE, 0x0FE6,
+	0x0109, 0x0313, 0x0FE4,
+	0x00F6, 0x0328, 0x0FE2,
+	0x00E4, 0x033C, 0x0FE0,
+	0x00D2, 0x034F, 0x0FDF,
+	0x00C0, 0x0363, 0x0FDD,
+	0x00B0, 0x0374, 0x0FDC,
+	0x009F, 0x0385, 0x0FDC,
+	0x0090, 0x0395, 0x0FDB,
+	0x0081, 0x03A4, 0x0FDB,
+	0x0072, 0x03B3, 0x0FDB,
+	0x0064, 0x03C0, 0x0FDC,
+	0x0057, 0x03CC, 0x0FDD,
+	0x004B, 0x03D6, 0x0FDF,
+	0x003F, 0x03E0, 0x0FE1,
+	0x0034, 0x03E8, 0x0FE4,
+	0x002A, 0x03EF, 0x0FE7,
+	0x0020, 0x03F5, 0x0FEB,
+	0x0017, 0x03FA, 0x0FEF,
+	0x000F, 0x03FD, 0x0FF4,
+	0x0007, 0x03FF, 0x0FFA,
+	0x0000, 0x0400, 0x0000,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.3_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.300000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_30[132] = {
+	0x0104, 0x01F8, 0x0104, 0x0000,
+	0x00FE, 0x01F7, 0x010A, 0x0001,
+	0x00F8, 0x01F6, 0x010F, 0x0003,
+	0x00F2, 0x01F5, 0x0114, 0x0005,
+	0x00EB, 0x01F4, 0x011B, 0x0006,
+	0x00E5, 0x01F3, 0x0120, 0x0008,
+	0x00DF, 0x01F2, 0x0125, 0x000A,
+	0x00DA, 0x01F0, 0x012A, 0x000C,
+	0x00D4, 0x01EE, 0x0130, 0x000E,
+	0x00CE, 0x01ED, 0x0135, 0x0010,
+	0x00C8, 0x01EB, 0x013A, 0x0013,
+	0x00C2, 0x01E9, 0x0140, 0x0015,
+	0x00BD, 0x01E7, 0x0145, 0x0017,
+	0x00B7, 0x01E5, 0x014A, 0x001A,
+	0x00B1, 0x01E2, 0x0151, 0x001C,
+	0x00AC, 0x01E0, 0x0155, 0x001F,
+	0x00A7, 0x01DD, 0x015A, 0x0022,
+	0x00A1, 0x01DB, 0x015F, 0x0025,
+	0x009C, 0x01D8, 0x0165, 0x0027,
+	0x0097, 0x01D5, 0x016A, 0x002A,
+	0x0092, 0x01D2, 0x016E, 0x002E,
+	0x008C, 0x01CF, 0x0174, 0x0031,
+	0x0087, 0x01CC, 0x0179, 0x0034,
+	0x0083, 0x01C9, 0x017D, 0x0037,
+	0x007E, 0x01C5, 0x0182, 0x003B,
+	0x0079, 0x01C2, 0x0187, 0x003E,
+	0x0074, 0x01BE, 0x018C, 0x0042,
+	0x0070, 0x01BA, 0x0190, 0x0046,
+	0x006B, 0x01B7, 0x0195, 0x0049,
+	0x0066, 0x01B3, 0x019A, 0x004D,
+	0x0062, 0x01AF, 0x019E, 0x0051,
+	0x005E, 0x01AB, 0x01A2, 0x0055,
+	0x005A, 0x01A6, 0x01A6, 0x005A,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.4_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.400000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_40[132] = {
+	0x00FB, 0x0209, 0x00FC, 0x0000,
+	0x00F5, 0x0209, 0x0101, 0x0001,
+	0x00EE, 0x0208, 0x0108, 0x0002,
+	0x00E8, 0x0207, 0x010E, 0x0003,
+	0x00E2, 0x0206, 0x0114, 0x0004,
+	0x00DB, 0x0205, 0x011A, 0x0006,
+	0x00D5, 0x0204, 0x0120, 0x0007,
+	0x00CF, 0x0203, 0x0125, 0x0009,
+	0x00C9, 0x0201, 0x012C, 0x000A,
+	0x00C3, 0x01FF, 0x0132, 0x000C,
+	0x00BD, 0x01FD, 0x0138, 0x000E,
+	0x00B7, 0x01FB, 0x013E, 0x0010,
+	0x00B1, 0x01F9, 0x0144, 0x0012,
+	0x00AC, 0x01F7, 0x0149, 0x0014,
+	0x00A6, 0x01F4, 0x0150, 0x0016,
+	0x00A0, 0x01F2, 0x0156, 0x0018,
+	0x009B, 0x01EF, 0x015C, 0x001A,
+	0x0095, 0x01EC, 0x0162, 0x001D,
+	0x0090, 0x01E9, 0x0168, 0x001F,
+	0x008B, 0x01E6, 0x016D, 0x0022,
+	0x0085, 0x01E3, 0x0173, 0x0025,
+	0x0080, 0x01DF, 0x0179, 0x0028,
+	0x007B, 0x01DC, 0x017E, 0x002B,
+	0x0076, 0x01D8, 0x0184, 0x002E,
+	0x0071, 0x01D4, 0x018A, 0x0031,
+	0x006D, 0x01D1, 0x018E, 0x0034,
+	0x0068, 0x01CD, 0x0193, 0x0038,
+	0x0063, 0x01C8, 0x019A, 0x003B,
+	0x005F, 0x01C4, 0x019E, 0x003F,
+	0x005B, 0x01C0, 0x01A3, 0x0042,
+	0x0056, 0x01BB, 0x01A9, 0x0046,
+	0x0052, 0x01B7, 0x01AD, 0x004A,
+	0x004E, 0x01B2, 0x01B2, 0x004E,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.5_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.500000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_50[132] = {
+	0x00E5, 0x0236, 0x00E5, 0x0000,
+	0x00DE, 0x0235, 0x00ED, 0x0000,
+	0x00D7, 0x0235, 0x00F4, 0x0000,
+	0x00D0, 0x0235, 0x00FB, 0x0000,
+	0x00C9, 0x0234, 0x0102, 0x0001,
+	0x00C2, 0x0233, 0x010A, 0x0001,
+	0x00BC, 0x0232, 0x0111, 0x0001,
+	0x00B5, 0x0230, 0x0119, 0x0002,
+	0x00AE, 0x022F, 0x0121, 0x0002,
+	0x00A8, 0x022D, 0x0128, 0x0003,
+	0x00A2, 0x022B, 0x012F, 0x0004,
+	0x009B, 0x0229, 0x0137, 0x0005,
+	0x0095, 0x0226, 0x013F, 0x0006,
+	0x008F, 0x0224, 0x0146, 0x0007,
+	0x0089, 0x0221, 0x014E, 0x0008,
+	0x0083, 0x021E, 0x0155, 0x000A,
+	0x007E, 0x021B, 0x015C, 0x000B,
+	0x0078, 0x0217, 0x0164, 0x000D,
+	0x0072, 0x0213, 0x016D, 0x000E,
+	0x006D, 0x0210, 0x0173, 0x0010,
+	0x0068, 0x020C, 0x017A, 0x0012,
+	0x0063, 0x0207, 0x0182, 0x0014,
+	0x005E, 0x0203, 0x0189, 0x0016,
+	0x0059, 0x01FE, 0x0191, 0x0018,
+	0x0054, 0x01F9, 0x0198, 0x001B,
+	0x0050, 0x01F4, 0x019F, 0x001D,
+	0x004B, 0x01EF, 0x01A6, 0x0020,
+	0x0047, 0x01EA, 0x01AC, 0x0023,
+	0x0043, 0x01E4, 0x01B3, 0x0026,
+	0x003F, 0x01DF, 0x01B9, 0x0029,
+	0x003B, 0x01D9, 0x01C0, 0x002C,
+	0x0037, 0x01D3, 0x01C6, 0x0030,
+	0x0033, 0x01CD, 0x01CD, 0x0033,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.6_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.600000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_60[132] = {
+	0x00C8, 0x026F, 0x00C9, 0x0000,
+	0x00C0, 0x0270, 0x00D1, 0x0FFF,
+	0x00B8, 0x0270, 0x00D9, 0x0FFF,
+	0x00B1, 0x0270, 0x00E1, 0x0FFE,
+	0x00A9, 0x026F, 0x00EB, 0x0FFD,
+	0x00A2, 0x026E, 0x00F3, 0x0FFD,
+	0x009A, 0x026D, 0x00FD, 0x0FFC,
+	0x0093, 0x026C, 0x0105, 0x0FFC,
+	0x008C, 0x026A, 0x010F, 0x0FFB,
+	0x0085, 0x0268, 0x0118, 0x0FFB,
+	0x007E, 0x0265, 0x0122, 0x0FFB,
+	0x0078, 0x0263, 0x012A, 0x0FFB,
+	0x0071, 0x0260, 0x0134, 0x0FFB,
+	0x006B, 0x025C, 0x013E, 0x0FFB,
+	0x0065, 0x0259, 0x0147, 0x0FFB,
+	0x005F, 0x0255, 0x0151, 0x0FFB,
+	0x0059, 0x0251, 0x015A, 0x0FFC,
+	0x0054, 0x024D, 0x0163, 0x0FFC,
+	0x004E, 0x0248, 0x016D, 0x0FFD,
+	0x0049, 0x0243, 0x0176, 0x0FFE,
+	0x0044, 0x023E, 0x017F, 0x0FFF,
+	0x003F, 0x0238, 0x0189, 0x0000,
+	0x003A, 0x0232, 0x0193, 0x0001,
+	0x0036, 0x022C, 0x019C, 0x0002,
+	0x0031, 0x0226, 0x01A5, 0x0004,
+	0x002D, 0x021F, 0x01AF, 0x0005,
+	0x0029, 0x0218, 0x01B8, 0x0007,
+	0x0025, 0x0211, 0x01C1, 0x0009,
+	0x0022, 0x020A, 0x01C9, 0x000B,
+	0x001E, 0x0203, 0x01D2, 0x000D,
+	0x001B, 0x01FB, 0x01DA, 0x0010,
+	0x0018, 0x01F3, 0x01E3, 0x0012,
+	0x0015, 0x01EB, 0x01EB, 0x0015,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.7_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.700000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_70[132] = {
+	0x00A3, 0x02B9, 0x00A4, 0x0000,
+	0x009A, 0x02BA, 0x00AD, 0x0FFF,
+	0x0092, 0x02BA, 0x00B6, 0x0FFE,
+	0x0089, 0x02BA, 0x00C1, 0x0FFC,
+	0x0081, 0x02B9, 0x00CB, 0x0FFB,
+	0x0079, 0x02B8, 0x00D5, 0x0FFA,
+	0x0071, 0x02B7, 0x00DF, 0x0FF9,
+	0x0069, 0x02B5, 0x00EA, 0x0FF8,
+	0x0062, 0x02B3, 0x00F4, 0x0FF7,
+	0x005B, 0x02B0, 0x00FF, 0x0FF6,
+	0x0054, 0x02AD, 0x010B, 0x0FF4,
+	0x004D, 0x02A9, 0x0117, 0x0FF3,
+	0x0046, 0x02A5, 0x0123, 0x0FF2,
+	0x0040, 0x02A1, 0x012D, 0x0FF2,
+	0x003A, 0x029C, 0x0139, 0x0FF1,
+	0x0034, 0x0297, 0x0145, 0x0FF0,
+	0x002F, 0x0292, 0x0150, 0x0FEF,
+	0x0029, 0x028C, 0x015C, 0x0FEF,
+	0x0024, 0x0285, 0x0169, 0x0FEE,
+	0x001F, 0x027F, 0x0174, 0x0FEE,
+	0x001B, 0x0278, 0x017F, 0x0FEE,
+	0x0016, 0x0270, 0x018D, 0x0FED,
+	0x0012, 0x0268, 0x0199, 0x0FED,
+	0x000E, 0x0260, 0x01A4, 0x0FEE,
+	0x000B, 0x0258, 0x01AF, 0x0FEE,
+	0x0007, 0x024F, 0x01BC, 0x0FEE,
+	0x0004, 0x0246, 0x01C7, 0x0FEF,
+	0x0001, 0x023D, 0x01D3, 0x0FEF,
+	0x0FFE, 0x0233, 0x01DF, 0x0FF0,
+	0x0FFC, 0x0229, 0x01EA, 0x0FF1,
+	0x0FFA, 0x021F, 0x01F4, 0x0FF3,
+	0x0FF8, 0x0215, 0x01FF, 0x0FF4,
+	0x0FF6, 0x020A, 0x020A, 0x0FF6,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.8_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.800000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_80[132] = {
+	0x0075, 0x0315, 0x0076, 0x0000,
+	0x006C, 0x0316, 0x007F, 0x0FFF,
+	0x0062, 0x0316, 0x008A, 0x0FFE,
+	0x0059, 0x0315, 0x0096, 0x0FFC,
+	0x0050, 0x0314, 0x00A1, 0x0FFB,
+	0x0048, 0x0312, 0x00AD, 0x0FF9,
+	0x0040, 0x0310, 0x00B8, 0x0FF8,
+	0x0038, 0x030D, 0x00C5, 0x0FF6,
+	0x0030, 0x030A, 0x00D1, 0x0FF5,
+	0x0029, 0x0306, 0x00DE, 0x0FF3,
+	0x0022, 0x0301, 0x00EB, 0x0FF2,
+	0x001C, 0x02FC, 0x00F8, 0x0FF0,
+	0x0015, 0x02F7, 0x0106, 0x0FEE,
+	0x0010, 0x02F1, 0x0112, 0x0FED,
+	0x000A, 0x02EA, 0x0121, 0x0FEB,
+	0x0005, 0x02E3, 0x012F, 0x0FE9,
+	0x0000, 0x02DB, 0x013D, 0x0FE8,
+	0x0FFB, 0x02D3, 0x014C, 0x0FE6,
+	0x0FF7, 0x02CA, 0x015A, 0x0FE5,
+	0x0FF3, 0x02C1, 0x0169, 0x0FE3,
+	0x0FF0, 0x02B7, 0x0177, 0x0FE2,
+	0x0FEC, 0x02AD, 0x0186, 0x0FE1,
+	0x0FE9, 0x02A2, 0x0196, 0x0FDF,
+	0x0FE7, 0x0297, 0x01A4, 0x0FDE,
+	0x0FE4, 0x028C, 0x01B3, 0x0FDD,
+	0x0FE2, 0x0280, 0x01C2, 0x0FDC,
+	0x0FE0, 0x0274, 0x01D0, 0x0FDC,
+	0x0FDF, 0x0268, 0x01DE, 0x0FDB,
+	0x0FDD, 0x025B, 0x01EE, 0x0FDA,
+	0x0FDC, 0x024E, 0x01FC, 0x0FDA,
+	0x0FDB, 0x0241, 0x020A, 0x0FDA,
+	0x0FDB, 0x0233, 0x0218, 0x0FDA,
+	0x0FDA, 0x0226, 0x0226, 0x0FDA,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.9_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.900000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_90[132] = {
+	0x003F, 0x0383, 0x003E, 0x0000,
+	0x0034, 0x0383, 0x004A, 0x0FFF,
+	0x002B, 0x0383, 0x0054, 0x0FFE,
+	0x0021, 0x0381, 0x0061, 0x0FFD,
+	0x0019, 0x037F, 0x006C, 0x0FFC,
+	0x0010, 0x037C, 0x0079, 0x0FFB,
+	0x0008, 0x0378, 0x0086, 0x0FFA,
+	0x0001, 0x0374, 0x0093, 0x0FF8,
+	0x0FFA, 0x036E, 0x00A1, 0x0FF7,
+	0x0FF3, 0x0368, 0x00B0, 0x0FF5,
+	0x0FED, 0x0361, 0x00BF, 0x0FF3,
+	0x0FE8, 0x035A, 0x00CD, 0x0FF1,
+	0x0FE2, 0x0352, 0x00DC, 0x0FF0,
+	0x0FDE, 0x0349, 0x00EB, 0x0FEE,
+	0x0FD9, 0x033F, 0x00FC, 0x0FEC,
+	0x0FD5, 0x0335, 0x010D, 0x0FE9,
+	0x0FD2, 0x032A, 0x011D, 0x0FE7,
+	0x0FCF, 0x031E, 0x012E, 0x0FE5,
+	0x0FCC, 0x0312, 0x013F, 0x0FE3,
+	0x0FCA, 0x0305, 0x0150, 0x0FE1,
+	0x0FC8, 0x02F8, 0x0162, 0x0FDE,
+	0x0FC6, 0x02EA, 0x0174, 0x0FDC,
+	0x0FC5, 0x02DC, 0x0185, 0x0FDA,
+	0x0FC4, 0x02CD, 0x0197, 0x0FD8,
+	0x0FC3, 0x02BE, 0x01AA, 0x0FD5,
+	0x0FC3, 0x02AF, 0x01BB, 0x0FD3,
+	0x0FC3, 0x029F, 0x01CD, 0x0FD1,
+	0x0FC3, 0x028E, 0x01E0, 0x0FCF,
+	0x0FC3, 0x027E, 0x01F2, 0x0FCD,
+	0x0FC4, 0x026D, 0x0203, 0x0FCC,
+	0x0FC5, 0x025C, 0x0215, 0x0FCA,
+	0x0FC6, 0x024B, 0x0227, 0x0FC8,
+	0x0FC7, 0x0239, 0x0239, 0x0FC7,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_1_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 1.000000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_1_00[132] = {
+	0x0000, 0x0400, 0x0000, 0x0000,
+	0x0FF6, 0x03FF, 0x000B, 0x0000,
+	0x0FED, 0x03FE, 0x0015, 0x0000,
+	0x0FE4, 0x03FB, 0x0022, 0x0FFF,
+	0x0FDC, 0x03F7, 0x002E, 0x0FFF,
+	0x0FD5, 0x03F2, 0x003B, 0x0FFE,
+	0x0FCE, 0x03EC, 0x0048, 0x0FFE,
+	0x0FC8, 0x03E5, 0x0056, 0x0FFD,
+	0x0FC3, 0x03DC, 0x0065, 0x0FFC,
+	0x0FBE, 0x03D3, 0x0075, 0x0FFA,
+	0x0FB9, 0x03C9, 0x0085, 0x0FF9,
+	0x0FB6, 0x03BE, 0x0094, 0x0FF8,
+	0x0FB2, 0x03B2, 0x00A6, 0x0FF6,
+	0x0FB0, 0x03A5, 0x00B7, 0x0FF4,
+	0x0FAD, 0x0397, 0x00CA, 0x0FF2,
+	0x0FAB, 0x0389, 0x00DC, 0x0FF0,
+	0x0FAA, 0x0379, 0x00EF, 0x0FEE,
+	0x0FA9, 0x0369, 0x0102, 0x0FEC,
+	0x0FA9, 0x0359, 0x0115, 0x0FE9,
+	0x0FA9, 0x0348, 0x0129, 0x0FE6,
+	0x0FA9, 0x0336, 0x013D, 0x0FE4,
+	0x0FA9, 0x0323, 0x0153, 0x0FE1,
+	0x0FAA, 0x0310, 0x0168, 0x0FDE,
+	0x0FAC, 0x02FD, 0x017C, 0x0FDB,
+	0x0FAD, 0x02E9, 0x0192, 0x0FD8,
+	0x0FAF, 0x02D5, 0x01A7, 0x0FD5,
+	0x0FB1, 0x02C0, 0x01BD, 0x0FD2,
+	0x0FB3, 0x02AC, 0x01D2, 0x0FCF,
+	0x0FB5, 0x0296, 0x01E9, 0x0FCC,
+	0x0FB8, 0x0281, 0x01FE, 0x0FC9,
+	0x0FBA, 0x026C, 0x0214, 0x0FC6,
+	0x0FBD, 0x0256, 0x022A, 0x0FC3,
+	0x0FC0, 0x0240, 0x0240, 0x0FC0,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.3_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.300000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_30[198] = {
+	0x004B, 0x0100, 0x0169, 0x0101, 0x004B, 0x0000,
+	0x0049, 0x00FD, 0x0169, 0x0103, 0x004E, 0x0000,
+	0x0047, 0x00FA, 0x0169, 0x0106, 0x0050, 0x0000,
+	0x0045, 0x00F7, 0x0168, 0x0109, 0x0052, 0x0001,
+	0x0043, 0x00F5, 0x0168, 0x010B, 0x0054, 0x0001,
+	0x0040, 0x00F2, 0x0168, 0x010E, 0x0057, 0x0001,
+	0x003E, 0x00EF, 0x0168, 0x0110, 0x0059, 0x0002,
+	0x003C, 0x00EC, 0x0167, 0x0113, 0x005C, 0x0002,
+	0x003A, 0x00E9, 0x0167, 0x0116, 0x005E, 0x0002,
+	0x0038, 0x00E6, 0x0166, 0x0118, 0x0061, 0x0003,
+	0x0036, 0x00E3, 0x0165, 0x011C, 0x0063, 0x0003,
+	0x0034, 0x00E0, 0x0165, 0x011D, 0x0066, 0x0004,
+	0x0033, 0x00DD, 0x0164, 0x0120, 0x0068, 0x0004,
+	0x0031, 0x00DA, 0x0163, 0x0122, 0x006B, 0x0005,
+	0x002F, 0x00D7, 0x0163, 0x0125, 0x006D, 0x0005,
+	0x002D, 0x00D3, 0x0162, 0x0128, 0x0070, 0x0006,
+	0x002B, 0x00D0, 0x0161, 0x012A, 0x0073, 0x0007,
+	0x002A, 0x00CD, 0x0160, 0x012D, 0x0075, 0x0007,
+	0x0028, 0x00CA, 0x015F, 0x012F, 0x0078, 0x0008,
+	0x0026, 0x00C7, 0x015E, 0x0131, 0x007B, 0x0009,
+	0x0025, 0x00C4, 0x015D, 0x0133, 0x007E, 0x0009,
+	0x0023, 0x00C1, 0x015C, 0x0136, 0x0080, 0x000A,
+	0x0022, 0x00BE, 0x015A, 0x0138, 0x0083, 0x000B,
+	0x0020, 0x00BB, 0x0159, 0x013A, 0x0086, 0x000C,
+	0x001F, 0x00B8, 0x0158, 0x013B, 0x0089, 0x000D,
+	0x001E, 0x00B5, 0x0156, 0x013E, 0x008C, 0x000D,
+	0x001C, 0x00B2, 0x0155, 0x0140, 0x008F, 0x000E,
+	0x001B, 0x00AF, 0x0153, 0x0143, 0x0091, 0x000F,
+	0x0019, 0x00AC, 0x0152, 0x0145, 0x0094, 0x0010,
+	0x0018, 0x00A9, 0x0150, 0x0147, 0x0097, 0x0011,
+	0x0017, 0x00A6, 0x014F, 0x0148, 0x009A, 0x0012,
+	0x0016, 0x00A3, 0x014D, 0x0149, 0x009D, 0x0014,
+	0x0015, 0x00A0, 0x014B, 0x014B, 0x00A0, 0x0015,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.4_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.400000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_40[198] = {
+	0x0028, 0x0106, 0x01A3, 0x0107, 0x0028, 0x0000,
+	0x0026, 0x0102, 0x01A3, 0x010A, 0x002B, 0x0000,
+	0x0024, 0x00FE, 0x01A3, 0x010F, 0x002D, 0x0FFF,
+	0x0022, 0x00FA, 0x01A3, 0x0113, 0x002F, 0x0FFF,
+	0x0021, 0x00F6, 0x01A3, 0x0116, 0x0031, 0x0FFF,
+	0x001F, 0x00F2, 0x01A2, 0x011B, 0x0034, 0x0FFE,
+	0x001D, 0x00EE, 0x01A2, 0x011F, 0x0036, 0x0FFE,
+	0x001B, 0x00EA, 0x01A1, 0x0123, 0x0039, 0x0FFE,
+	0x0019, 0x00E6, 0x01A1, 0x0127, 0x003B, 0x0FFE,
+	0x0018, 0x00E2, 0x01A0, 0x012A, 0x003E, 0x0FFE,
+	0x0016, 0x00DE, 0x01A0, 0x012E, 0x0041, 0x0FFD,
+	0x0015, 0x00DA, 0x019F, 0x0132, 0x0043, 0x0FFD,
+	0x0013, 0x00D6, 0x019E, 0x0136, 0x0046, 0x0FFD,
+	0x0012, 0x00D2, 0x019D, 0x0139, 0x0049, 0x0FFD,
+	0x0010, 0x00CE, 0x019C, 0x013D, 0x004C, 0x0FFD,
+	0x000F, 0x00CA, 0x019A, 0x0141, 0x004F, 0x0FFD,
+	0x000E, 0x00C6, 0x0199, 0x0144, 0x0052, 0x0FFD,
+	0x000D, 0x00C2, 0x0197, 0x0148, 0x0055, 0x0FFD,
+	0x000B, 0x00BE, 0x0196, 0x014C, 0x0058, 0x0FFD,
+	0x000A, 0x00BA, 0x0195, 0x014F, 0x005B, 0x0FFD,
+	0x0009, 0x00B6, 0x0193, 0x0153, 0x005E, 0x0FFD,
+	0x0008, 0x00B2, 0x0191, 0x0157, 0x0061, 0x0FFD,
+	0x0007, 0x00AE, 0x0190, 0x015A, 0x0064, 0x0FFD,
+	0x0006, 0x00AA, 0x018E, 0x015D, 0x0068, 0x0FFD,
+	0x0005, 0x00A6, 0x018C, 0x0161, 0x006B, 0x0FFD,
+	0x0005, 0x00A2, 0x0189, 0x0164, 0x006F, 0x0FFD,
+	0x0004, 0x009E, 0x0187, 0x0167, 0x0072, 0x0FFE,
+	0x0003, 0x009A, 0x0185, 0x016B, 0x0075, 0x0FFE,
+	0x0002, 0x0096, 0x0183, 0x016E, 0x0079, 0x0FFE,
+	0x0002, 0x0093, 0x0180, 0x016F, 0x007D, 0x0FFF,
+	0x0001, 0x008F, 0x017E, 0x0173, 0x0080, 0x0FFF,
+	0x0001, 0x008B, 0x017B, 0x0175, 0x0084, 0x0000,
+	0x0000, 0x0087, 0x0179, 0x0179, 0x0087, 0x0000,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.5_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.500000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_50[198] = {
+	0x0000, 0x0107, 0x01F3, 0x0106, 0x0000, 0x0000,
+	0x0FFE, 0x0101, 0x01F3, 0x010D, 0x0002, 0x0FFF,
+	0x0FFD, 0x00FB, 0x01F3, 0x0113, 0x0003, 0x0FFF,
+	0x0FFC, 0x00F6, 0x01F3, 0x0118, 0x0005, 0x0FFE,
+	0x0FFA, 0x00F0, 0x01F3, 0x011E, 0x0007, 0x0FFE,
+	0x0FF9, 0x00EB, 0x01F2, 0x0124, 0x0009, 0x0FFD,
+	0x0FF8, 0x00E5, 0x01F2, 0x0129, 0x000B, 0x0FFD,
+	0x0FF7, 0x00E0, 0x01F1, 0x012F, 0x000D, 0x0FFC,
+	0x0FF6, 0x00DA, 0x01F0, 0x0135, 0x0010, 0x0FFB,
+	0x0FF5, 0x00D4, 0x01EF, 0x013B, 0x0012, 0x0FFB,
+	0x0FF4, 0x00CF, 0x01EE, 0x0141, 0x0014, 0x0FFA,
+	0x0FF3, 0x00C9, 0x01ED, 0x0147, 0x0017, 0x0FF9,
+	0x0FF2, 0x00C4, 0x01EB, 0x014C, 0x001A, 0x0FF9,
+	0x0FF1, 0x00BF, 0x01EA, 0x0152, 0x001C, 0x0FF8,
+	0x0FF1, 0x00B9, 0x01E8, 0x0157, 0x001F, 0x0FF8,
+	0x0FF0, 0x00B4, 0x01E6, 0x015D, 0x0022, 0x0FF7,
+	0x0FF0, 0x00AE, 0x01E4, 0x0163, 0x0025, 0x0FF6,
+	0x0FEF, 0x00A9, 0x01E2, 0x0168, 0x0028, 0x0FF6,
+	0x0FEF, 0x00A4, 0x01DF, 0x016E, 0x002B, 0x0FF5,
+	0x0FEF, 0x009F, 0x01DD, 0x0172, 0x002E, 0x0FF5,
+	0x0FEE, 0x009A, 0x01DA, 0x0178, 0x0032, 0x0FF4,
+	0x0FEE, 0x0094, 0x01D8, 0x017E, 0x0035, 0x0FF3,
+	0x0FEE, 0x008F, 0x01D5, 0x0182, 0x0039, 0x0FF3,
+	0x0FEE, 0x008A, 0x01D2, 0x0188, 0x003C, 0x0FF2,
+	0x0FEE, 0x0085, 0x01CF, 0x018C, 0x0040, 0x0FF2,
+	0x0FEE, 0x0081, 0x01CB, 0x0191, 0x0044, 0x0FF1,
+	0x0FEE, 0x007C, 0x01C8, 0x0196, 0x0047, 0x0FF1,
+	0x0FEE, 0x0077, 0x01C4, 0x019C, 0x004B, 0x0FF0,
+	0x0FEE, 0x0072, 0x01C1, 0x01A0, 0x004F, 0x0FF0,
+	0x0FEE, 0x006E, 0x01BD, 0x01A4, 0x0053, 0x0FF0,
+	0x0FEE, 0x0069, 0x01B9, 0x01A9, 0x0058, 0x0FEF,
+	0x0FEE, 0x0065, 0x01B5, 0x01AD, 0x005C, 0x0FEF,
+	0x0FEF, 0x0060, 0x01B1, 0x01B1, 0x0060, 0x0FEF,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.6_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.600000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_60[198] = {
+	0x0FD9, 0x00FB, 0x0258, 0x00FB, 0x0FD9, 0x0000,
+	0x0FD9, 0x00F3, 0x0258, 0x0102, 0x0FDA, 0x0000,
+	0x0FD8, 0x00EB, 0x0258, 0x010B, 0x0FDB, 0x0FFF,
+	0x0FD8, 0x00E3, 0x0258, 0x0112, 0x0FDC, 0x0FFF,
+	0x0FD8, 0x00DC, 0x0257, 0x011B, 0x0FDC, 0x0FFE,
+	0x0FD7, 0x00D4, 0x0256, 0x0123, 0x0FDE, 0x0FFE,
+	0x0FD7, 0x00CD, 0x0255, 0x012B, 0x0FDF, 0x0FFD,
+	0x0FD7, 0x00C5, 0x0254, 0x0133, 0x0FE0, 0x0FFD,
+	0x0FD7, 0x00BE, 0x0252, 0x013C, 0x0FE1, 0x0FFC,
+	0x0FD7, 0x00B6, 0x0251, 0x0143, 0x0FE3, 0x0FFC,
+	0x0FD8, 0x00AF, 0x024F, 0x014B, 0x0FE4, 0x0FFB,
+	0x0FD8, 0x00A8, 0x024C, 0x0154, 0x0FE6, 0x0FFA,
+	0x0FD8, 0x00A1, 0x024A, 0x015B, 0x0FE8, 0x0FFA,
+	0x0FD9, 0x009A, 0x0247, 0x0163, 0x0FEA, 0x0FF9,
+	0x0FD9, 0x0093, 0x0244, 0x016C, 0x0FEC, 0x0FF8,
+	0x0FD9, 0x008C, 0x0241, 0x0174, 0x0FEF, 0x0FF7,
+	0x0FDA, 0x0085, 0x023E, 0x017B, 0x0FF1, 0x0FF7,
+	0x0FDB, 0x007F, 0x023A, 0x0183, 0x0FF3, 0x0FF6,
+	0x0FDB, 0x0078, 0x0237, 0x018B, 0x0FF6, 0x0FF5,
+	0x0FDC, 0x0072, 0x0233, 0x0192, 0x0FF9, 0x0FF4,
+	0x0FDD, 0x006C, 0x022F, 0x0199, 0x0FFC, 0x0FF3,
+	0x0FDD, 0x0065, 0x022A, 0x01A3, 0x0FFF, 0x0FF2,
+	0x0FDE, 0x005F, 0x0226, 0x01AA, 0x0002, 0x0FF1,
+	0x0FDF, 0x005A, 0x0221, 0x01B0, 0x0006, 0x0FF0,
+	0x0FE0, 0x0054, 0x021C, 0x01B7, 0x0009, 0x0FF0,
+	0x0FE1, 0x004E, 0x0217, 0x01BE, 0x000D, 0x0FEF,
+	0x0FE2, 0x0048, 0x0212, 0x01C6, 0x0010, 0x0FEE,
+	0x0FE3, 0x0043, 0x020C, 0x01CD, 0x0014, 0x0FED,
+	0x0FE4, 0x003E, 0x0207, 0x01D3, 0x0018, 0x0FEC,
+	0x0FE5, 0x0039, 0x0200, 0x01DA, 0x001D, 0x0FEB,
+	0x0FE6, 0x0034, 0x01FA, 0x01E1, 0x0021, 0x0FEA,
+	0x0FE7, 0x002F, 0x01F5, 0x01E7, 0x0025, 0x0FE9,
+	0x0FE8, 0x002A, 0x01EE, 0x01EE, 0x002A, 0x0FE8,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.7_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.700000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_70[198] = {
+	0x0FC0, 0x00DA, 0x02CC, 0x00DA, 0x0FC0, 0x0000,
+	0x0FC1, 0x00D0, 0x02CC, 0x00E4, 0x0FBF, 0x0000,
+	0x0FC2, 0x00C6, 0x02CB, 0x00EF, 0x0FBE, 0x0000,
+	0x0FC3, 0x00BC, 0x02CA, 0x00F9, 0x0FBE, 0x0000,
+	0x0FC4, 0x00B2, 0x02C9, 0x0104, 0x0FBD, 0x0000,
+	0x0FC5, 0x00A8, 0x02C7, 0x010F, 0x0FBD, 0x0000,
+	0x0FC7, 0x009F, 0x02C5, 0x0119, 0x0FBC, 0x0000,
+	0x0FC8, 0x0095, 0x02C3, 0x0124, 0x0FBC, 0x0000,
+	0x0FC9, 0x008C, 0x02C0, 0x012F, 0x0FBC, 0x0000,
+	0x0FCB, 0x0083, 0x02BD, 0x0139, 0x0FBC, 0x0000,
+	0x0FCC, 0x007A, 0x02BA, 0x0144, 0x0FBC, 0x0000,
+	0x0FCE, 0x0072, 0x02B6, 0x014D, 0x0FBD, 0x0000,
+	0x0FD0, 0x0069, 0x02B2, 0x0159, 0x0FBD, 0x0FFF,
+	0x0FD1, 0x0061, 0x02AD, 0x0164, 0x0FBE, 0x0FFF,
+	0x0FD3, 0x0059, 0x02A9, 0x016E, 0x0FBF, 0x0FFE,
+	0x0FD4, 0x0051, 0x02A4, 0x017A, 0x0FBF, 0x0FFE,
+	0x0FD6, 0x0049, 0x029E, 0x0184, 0x0FC1, 0x0FFE,
+	0x0FD8, 0x0042, 0x0299, 0x018E, 0x0FC2, 0x0FFD,
+	0x0FD9, 0x003A, 0x0293, 0x019B, 0x0FC3, 0x0FFC,
+	0x0FDB, 0x0033, 0x028D, 0x01A4, 0x0FC5, 0x0FFC,
+	0x0FDC, 0x002D, 0x0286, 0x01AF, 0x0FC7, 0x0FFB,
+	0x0FDE, 0x0026, 0x0280, 0x01BA, 0x0FC8, 0x0FFA,
+	0x0FE0, 0x001F, 0x0279, 0x01C4, 0x0FCB, 0x0FF9,
+	0x0FE1, 0x0019, 0x0272, 0x01CE, 0x0FCD, 0x0FF9,
+	0x0FE3, 0x0013, 0x026A, 0x01D9, 0x0FCF, 0x0FF8,
+	0x0FE4, 0x000D, 0x0263, 0x01E3, 0x0FD2, 0x0FF7,
+	0x0FE6, 0x0008, 0x025B, 0x01EC, 0x0FD5, 0x0FF6,
+	0x0FE7, 0x0002, 0x0253, 0x01F7, 0x0FD8, 0x0FF5,
+	0x0FE9, 0x0FFD, 0x024A, 0x0202, 0x0FDB, 0x0FF3,
+	0x0FEA, 0x0FF8, 0x0242, 0x020B, 0x0FDF, 0x0FF2,
+	0x0FEC, 0x0FF3, 0x0239, 0x0215, 0x0FE2, 0x0FF1,
+	0x0FED, 0x0FEF, 0x0230, 0x021E, 0x0FE6, 0x0FF0,
+	0x0FEF, 0x0FEB, 0x0226, 0x0226, 0x0FEB, 0x0FEF,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.8_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.800000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_80[198] = {
+	0x0FBF, 0x00A1, 0x0340, 0x00A1, 0x0FBF, 0x0000,
+	0x0FC1, 0x0095, 0x0340, 0x00AD, 0x0FBC, 0x0001,
+	0x0FC4, 0x0089, 0x033E, 0x00BA, 0x0FBA, 0x0001,
+	0x0FC6, 0x007D, 0x033D, 0x00C6, 0x0FB8, 0x0002,
+	0x0FC9, 0x0072, 0x033A, 0x00D3, 0x0FB6, 0x0002,
+	0x0FCC, 0x0067, 0x0338, 0x00DF, 0x0FB3, 0x0003,
+	0x0FCE, 0x005C, 0x0334, 0x00EE, 0x0FB1, 0x0003,
+	0x0FD1, 0x0051, 0x0331, 0x00FA, 0x0FAF, 0x0004,
+	0x0FD3, 0x0047, 0x032D, 0x0108, 0x0FAD, 0x0004,
+	0x0FD6, 0x003D, 0x0328, 0x0116, 0x0FAB, 0x0004,
+	0x0FD8, 0x0033, 0x0323, 0x0123, 0x0FAA, 0x0005,
+	0x0FDB, 0x002A, 0x031D, 0x0131, 0x0FA8, 0x0005,
+	0x0FDD, 0x0021, 0x0317, 0x013F, 0x0FA7, 0x0005,
+	0x0FDF, 0x0018, 0x0311, 0x014D, 0x0FA5, 0x0006,
+	0x0FE2, 0x0010, 0x030A, 0x015A, 0x0FA4, 0x0006,
+	0x0FE4, 0x0008, 0x0302, 0x0169, 0x0FA3, 0x0006,
+	0x0FE6, 0x0000, 0x02FB, 0x0177, 0x0FA2, 0x0006,
+	0x0FE8, 0x0FF9, 0x02F3, 0x0185, 0x0FA1, 0x0006,
+	0x0FEB, 0x0FF1, 0x02EA, 0x0193, 0x0FA1, 0x0006,
+	0x0FED, 0x0FEB, 0x02E1, 0x01A1, 0x0FA0, 0x0006,
+	0x0FEE, 0x0FE4, 0x02D8, 0x01B0, 0x0FA0, 0x0006,
+	0x0FF0, 0x0FDE, 0x02CE, 0x01BE, 0x0FA0, 0x0006,
+	0x0FF2, 0x0FD8, 0x02C5, 0x01CB, 0x0FA0, 0x0006,
+	0x0FF4, 0x0FD3, 0x02BA, 0x01D8, 0x0FA1, 0x0006,
+	0x0FF6, 0x0FCD, 0x02B0, 0x01E7, 0x0FA1, 0x0005,
+	0x0FF7, 0x0FC8, 0x02A5, 0x01F5, 0x0FA2, 0x0005,
+	0x0FF9, 0x0FC4, 0x029A, 0x0202, 0x0FA3, 0x0004,
+	0x0FFA, 0x0FC0, 0x028E, 0x0210, 0x0FA4, 0x0004,
+	0x0FFB, 0x0FBC, 0x0283, 0x021D, 0x0FA6, 0x0003,
+	0x0FFD, 0x0FB8, 0x0276, 0x022A, 0x0FA8, 0x0003,
+	0x0FFE, 0x0FB4, 0x026B, 0x0237, 0x0FAA, 0x0002,
+	0x0FFF, 0x0FB1, 0x025E, 0x0245, 0x0FAC, 0x0001,
+	0x0000, 0x0FAE, 0x0252, 0x0252, 0x0FAE, 0x0000,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.9_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.900000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_90[198] = {
+	0x0FD8, 0x0055, 0x03A7, 0x0054, 0x0FD8, 0x0000,
+	0x0FDB, 0x0047, 0x03A7, 0x0063, 0x0FD4, 0x0000,
+	0x0FDF, 0x003B, 0x03A5, 0x006F, 0x0FD1, 0x0001,
+	0x0FE2, 0x002E, 0x03A3, 0x007E, 0x0FCD, 0x0002,
+	0x0FE5, 0x0022, 0x03A0, 0x008D, 0x0FCA, 0x0002,
+	0x0FE8, 0x0017, 0x039D, 0x009B, 0x0FC6, 0x0003,
+	0x0FEB, 0x000C, 0x0398, 0x00AC, 0x0FC2, 0x0003,
+	0x0FEE, 0x0001, 0x0394, 0x00BA, 0x0FBF, 0x0004,
+	0x0FF1, 0x0FF7, 0x038E, 0x00CA, 0x0FBB, 0x0005,
+	0x0FF4, 0x0FED, 0x0388, 0x00DA, 0x0FB8, 0x0005,
+	0x0FF6, 0x0FE4, 0x0381, 0x00EB, 0x0FB4, 0x0006,
+	0x0FF9, 0x0FDB, 0x037A, 0x00FA, 0x0FB1, 0x0007,
+	0x0FFB, 0x0FD3, 0x0372, 0x010B, 0x0FAD, 0x0008,
+	0x0FFD, 0x0FCB, 0x0369, 0x011D, 0x0FAA, 0x0008,
+	0x0000, 0x0FC3, 0x0360, 0x012E, 0x0FA6, 0x0009,
+	0x0002, 0x0FBC, 0x0356, 0x013F, 0x0FA3, 0x000A,
+	0x0003, 0x0FB6, 0x034C, 0x0150, 0x0FA0, 0x000B,
+	0x0005, 0x0FB0, 0x0341, 0x0162, 0x0F9D, 0x000B,
+	0x0007, 0x0FAA, 0x0336, 0x0173, 0x0F9A, 0x000C,
+	0x0008, 0x0FA5, 0x032A, 0x0185, 0x0F97, 0x000D,
+	0x000A, 0x0FA0, 0x031E, 0x0197, 0x0F94, 0x000D,
+	0x000B, 0x0F9B, 0x0311, 0x01A9, 0x0F92, 0x000E,
+	0x000C, 0x0F97, 0x0303, 0x01BC, 0x0F8F, 0x000F,
+	0x000D, 0x0F94, 0x02F6, 0x01CD, 0x0F8D, 0x000F,
+	0x000E, 0x0F91, 0x02E8, 0x01DE, 0x0F8B, 0x0010,
+	0x000F, 0x0F8E, 0x02D9, 0x01F1, 0x0F89, 0x0010,
+	0x0010, 0x0F8B, 0x02CA, 0x0202, 0x0F88, 0x0011,
+	0x0010, 0x0F89, 0x02BB, 0x0214, 0x0F87, 0x0011,
+	0x0011, 0x0F87, 0x02AB, 0x0226, 0x0F86, 0x0011,
+	0x0011, 0x0F86, 0x029C, 0x0236, 0x0F85, 0x0012,
+	0x0011, 0x0F85, 0x028B, 0x0249, 0x0F84, 0x0012,
+	0x0012, 0x0F84, 0x027B, 0x0259, 0x0F84, 0x0012,
+	0x0012, 0x0F84, 0x026A, 0x026A, 0x0F84, 0x0012,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_1_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 1.000000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_1_00[198] = {
+	0x0000, 0x0000, 0x0400, 0x0000, 0x0000, 0x0000,
+	0x0003, 0x0FF3, 0x0400, 0x000D, 0x0FFD, 0x0000,
+	0x0006, 0x0FE7, 0x03FE, 0x001C, 0x0FF9, 0x0000,
+	0x0009, 0x0FDB, 0x03FC, 0x002B, 0x0FF5, 0x0000,
+	0x000C, 0x0FD0, 0x03F9, 0x003A, 0x0FF1, 0x0000,
+	0x000E, 0x0FC5, 0x03F5, 0x004A, 0x0FED, 0x0001,
+	0x0011, 0x0FBB, 0x03F0, 0x005A, 0x0FE9, 0x0001,
+	0x0013, 0x0FB2, 0x03EB, 0x006A, 0x0FE5, 0x0001,
+	0x0015, 0x0FA9, 0x03E4, 0x007B, 0x0FE1, 0x0002,
+	0x0017, 0x0FA1, 0x03DD, 0x008D, 0x0FDC, 0x0002,
+	0x0018, 0x0F99, 0x03D4, 0x00A0, 0x0FD8, 0x0003,
+	0x001A, 0x0F92, 0x03CB, 0x00B2, 0x0FD3, 0x0004,
+	0x001B, 0x0F8C, 0x03C1, 0x00C6, 0x0FCE, 0x0004,
+	0x001C, 0x0F86, 0x03B7, 0x00D9, 0x0FC9, 0x0005,
+	0x001D, 0x0F80, 0x03AB, 0x00EE, 0x0FC4, 0x0006,
+	0x001E, 0x0F7C, 0x039F, 0x0101, 0x0FBF, 0x0007,
+	0x001F, 0x0F78, 0x0392, 0x0115, 0x0FBA, 0x0008,
+	0x001F, 0x0F74, 0x0385, 0x012B, 0x0FB5, 0x0008,
+	0x0020, 0x0F71, 0x0376, 0x0140, 0x0FB0, 0x0009,
+	0x0020, 0x0F6E, 0x0367, 0x0155, 0x0FAB, 0x000B,
+	0x0020, 0x0F6C, 0x0357, 0x016B, 0x0FA6, 0x000C,
+	0x0020, 0x0F6A, 0x0347, 0x0180, 0x0FA2, 0x000D,
+	0x0020, 0x0F69, 0x0336, 0x0196, 0x0F9D, 0x000E,
+	0x0020, 0x0F69, 0x0325, 0x01AB, 0x0F98, 0x000F,
+	0x001F, 0x0F68, 0x0313, 0x01C3, 0x0F93, 0x0010,
+	0x001F, 0x0F69, 0x0300, 0x01D8, 0x0F8F, 0x0011,
+	0x001E, 0x0F69, 0x02ED, 0x01EF, 0x0F8B, 0x0012,
+	0x001D, 0x0F6A, 0x02D9, 0x0205, 0x0F87, 0x0014,
+	0x001D, 0x0F6C, 0x02C5, 0x021A, 0x0F83, 0x0015,
+	0x001C, 0x0F6E, 0x02B1, 0x0230, 0x0F7F, 0x0016,
+	0x001B, 0x0F70, 0x029C, 0x0247, 0x0F7B, 0x0017,
+	0x001A, 0x0F72, 0x0287, 0x025D, 0x0F78, 0x0018,
+	0x0019, 0x0F75, 0x0272, 0x0272, 0x0F75, 0x0019,
+};
+
+/* Converted scaler coeff tables from S1.10 to S1.12 */
+static uint16_t easf_filter_3tap_64p_ratio_0_30_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_40_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_50_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_60_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_70_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_80_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_90_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_1_00_s1_12[99];
+static uint16_t easf_filter_4tap_64p_ratio_0_30_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_40_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_50_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_60_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_70_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_80_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_90_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_1_00_s1_12[132];
+static uint16_t easf_filter_6tap_64p_ratio_0_30_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_40_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_50_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_60_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_70_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_80_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_90_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_1_00_s1_12[198];
+
+struct scale_ratio_to_reg_value_lookup easf_v_bf3_mode_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x0000},
+	{1, 1, 0x0000},
+	{-1, -1, 0x0002},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_h_bf3_mode_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x0000},
+	{1, 1, 0x0000},
+	{-1, -1, 0x0002},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_reducer_gain6_6tap_lookup[] = {
+	{3, 10, 0x4100},
+	{4, 10, 0x4100},
+	{5, 10, 0x4100},
+	{6, 10, 0x4100},
+	{7, 10, 0x4100},
+	{8, 10, 0x4100},
+	{9, 10, 0x4100},
+	{1, 1, 0x4100},
+	{-1, -1, 0x4100},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_reducer_gain4_6tap_lookup[] = {
+	{3, 10, 0x4000},
+	{4, 10, 0x4000},
+	{5, 10, 0x4000},
+	{6, 10, 0x4000},
+	{7, 10, 0x4000},
+	{8, 10, 0x4000},
+	{9, 10, 0x4000},
+	{1, 1, 0x4000},
+	{-1, -1, 0x4000},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_gain_ring6_6tap_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x251F},
+	{5, 10, 0x291F},
+	{6, 10, 0xA51F},
+	{7, 10, 0xA51F},
+	{8, 10, 0xAA66},
+	{9, 10, 0xA51F},
+	{1, 1, 0xA640},
+	{-1, -1, 0xA640},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_gain_ring4_6tap_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x9600},
+	{5, 10, 0xA460},
+	{6, 10, 0xA8E0},
+	{7, 10, 0xAC00},
+	{8, 10, 0xAD20},
+	{9, 10, 0xAFC0},
+	{1, 1, 0xB058},
+	{-1, -1, 0xB058},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_reducer_gain6_4tap_lookup[] = {
+	{3, 10, 0x4100},
+	{4, 10, 0x4100},
+	{5, 10, 0x4100},
+	{6, 10, 0x4100},
+	{7, 10, 0x4100},
+	{8, 10, 0x4100},
+	{9, 10, 0x4100},
+	{1, 1, 0x4100},
+	{-1, -1, 0x4100},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_reducer_gain4_4tap_lookup[] = {
+	{3, 10, 0x4000},
+	{4, 10, 0x4000},
+	{5, 10, 0x4000},
+	{6, 10, 0x4000},
+	{7, 10, 0x4000},
+	{8, 10, 0x4000},
+	{9, 10, 0x4000},
+	{1, 1, 0x4000},
+	{-1, -1, 0x4000},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_gain_ring6_4tap_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x0000},
+	{1, 1, 0x0000},
+	{-1, -1, 0x0000},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_gain_ring4_4tap_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x9900},
+	{7, 10, 0xA100},
+	{8, 10, 0xA8C0},
+	{9, 10, 0xAB20},
+	{1, 1, 0xAC00},
+	{-1, -1, 0xAC00},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_dntilt_uptilt_offset_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x4100},
+	{9, 10, 0x9F00},
+	{1, 1, 0xA4C0},
+	{-1, -1, 0xA8D8},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_uptilt_maxval_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x4000},
+	{9, 10, 0x24FE},
+	{1, 1, 0x2D64},
+	{-1, -1, 0x3ADB},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_dntilt_slope_lookup[] = {
+	{3, 10, 0x3800},
+	{4, 10, 0x3800},
+	{5, 10, 0x3800},
+	{6, 10, 0x3800},
+	{7, 10, 0x3800},
+	{8, 10, 0x3886},
+	{9, 10, 0x3940},
+	{1, 1, 0x3A4E},
+	{-1, -1, 0x3B66},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_uptilt1_slope_lookup[] = {
+	{3, 10, 0x3800},
+	{4, 10, 0x3800},
+	{5, 10, 0x3800},
+	{6, 10, 0x3800},
+	{7, 10, 0x3800},
+	{8, 10, 0x36F4},
+	{9, 10, 0x359C},
+	{1, 1, 0x3360},
+	{-1, -1, 0x2F20},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_uptilt2_slope_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x359C},
+	{1, 1, 0x31F0},
+	{-1, -1, 0x1F00},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_uptilt2_offset_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x9F00},
+	{1, 1, 0xA400},
+	{-1, -1, 0x9E00},
+};
+
+void spl_init_easf_filter_coeffs(void)
+{
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_30,
+		easf_filter_3tap_64p_ratio_0_30_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_40,
+		easf_filter_3tap_64p_ratio_0_40_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_50,
+		easf_filter_3tap_64p_ratio_0_50_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_60,
+		easf_filter_3tap_64p_ratio_0_60_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_70,
+		easf_filter_3tap_64p_ratio_0_70_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_80,
+		easf_filter_3tap_64p_ratio_0_80_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_90,
+		easf_filter_3tap_64p_ratio_0_90_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_1_00,
+		easf_filter_3tap_64p_ratio_1_00_s1_12, 3);
+
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_30,
+		easf_filter_4tap_64p_ratio_0_30_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_40,
+		easf_filter_4tap_64p_ratio_0_40_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_50,
+		easf_filter_4tap_64p_ratio_0_50_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_60,
+		easf_filter_4tap_64p_ratio_0_60_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_70,
+		easf_filter_4tap_64p_ratio_0_70_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_80,
+		easf_filter_4tap_64p_ratio_0_80_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_90,
+		easf_filter_4tap_64p_ratio_0_90_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_1_00,
+		easf_filter_4tap_64p_ratio_1_00_s1_12, 4);
+
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_30,
+		easf_filter_6tap_64p_ratio_0_30_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_40,
+		easf_filter_6tap_64p_ratio_0_40_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_50,
+		easf_filter_6tap_64p_ratio_0_50_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_60,
+		easf_filter_6tap_64p_ratio_0_60_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_70,
+		easf_filter_6tap_64p_ratio_0_70_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_80,
+		easf_filter_6tap_64p_ratio_0_80_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_90,
+		easf_filter_6tap_64p_ratio_0_90_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_1_00,
+		easf_filter_6tap_64p_ratio_1_00_s1_12, 6);
+}
+
+uint16_t *spl_get_easf_filter_3tap_64p(struct spl_fixed31_32 ratio)
+{
+	if (ratio.value < spl_fixpt_from_fraction(3, 10).value)
+		return easf_filter_3tap_64p_ratio_0_30_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(4, 10).value)
+		return easf_filter_3tap_64p_ratio_0_40_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(5, 10).value)
+		return easf_filter_3tap_64p_ratio_0_50_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(6, 10).value)
+		return easf_filter_3tap_64p_ratio_0_60_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(7, 10).value)
+		return easf_filter_3tap_64p_ratio_0_70_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(8, 10).value)
+		return easf_filter_3tap_64p_ratio_0_80_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(9, 10).value)
+		return easf_filter_3tap_64p_ratio_0_90_s1_12;
+	else
+		return easf_filter_3tap_64p_ratio_1_00_s1_12;
+}
+
+uint16_t *spl_get_easf_filter_4tap_64p(struct spl_fixed31_32 ratio)
+{
+	if (ratio.value < spl_fixpt_from_fraction(3, 10).value)
+		return easf_filter_4tap_64p_ratio_0_30_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(4, 10).value)
+		return easf_filter_4tap_64p_ratio_0_40_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(5, 10).value)
+		return easf_filter_4tap_64p_ratio_0_50_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(6, 10).value)
+		return easf_filter_4tap_64p_ratio_0_60_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(7, 10).value)
+		return easf_filter_4tap_64p_ratio_0_70_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(8, 10).value)
+		return easf_filter_4tap_64p_ratio_0_80_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(9, 10).value)
+		return easf_filter_4tap_64p_ratio_0_90_s1_12;
+	else
+		return easf_filter_4tap_64p_ratio_1_00_s1_12;
+}
+
+uint16_t *spl_get_easf_filter_6tap_64p(struct spl_fixed31_32 ratio)
+{
+	if (ratio.value < spl_fixpt_from_fraction(3, 10).value)
+		return easf_filter_6tap_64p_ratio_0_30_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(4, 10).value)
+		return easf_filter_6tap_64p_ratio_0_40_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(5, 10).value)
+		return easf_filter_6tap_64p_ratio_0_50_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(6, 10).value)
+		return easf_filter_6tap_64p_ratio_0_60_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(7, 10).value)
+		return easf_filter_6tap_64p_ratio_0_70_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(8, 10).value)
+		return easf_filter_6tap_64p_ratio_0_80_s1_12;
+	else if (ratio.value < spl_fixpt_from_fraction(9, 10).value)
+		return easf_filter_6tap_64p_ratio_0_90_s1_12;
+	else
+		return easf_filter_6tap_64p_ratio_1_00_s1_12;
+}
+
+uint16_t *spl_dscl_get_easf_filter_coeffs_64p(int taps, struct spl_fixed31_32 ratio)
+{
+	if (taps == 6)
+		return spl_get_easf_filter_6tap_64p(ratio);
+	else if (taps == 4)
+		return spl_get_easf_filter_4tap_64p(ratio);
+	else if (taps == 3)
+		return spl_get_easf_filter_3tap_64p(ratio);
+	else {
+		/* should never happen, bug */
+		SPL_BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+}
+
+void spl_set_filters_data(struct dscl_prog_data *dscl_prog_data,
+		const struct spl_scaler_data *data, bool enable_easf_v,
+		bool enable_easf_h)
+{
+	/*
+	 * Old coefficients calculated scaling ratio = input / output
+	 * New coefficients are calculated based on = output / input
+	 */
+	if (enable_easf_h) {
+		dscl_prog_data->filter_h = spl_dscl_get_easf_filter_coeffs_64p(
+			data->taps.h_taps, data->recip_ratios.horz);
+
+		dscl_prog_data->filter_h_c = spl_dscl_get_easf_filter_coeffs_64p(
+			data->taps.h_taps_c, data->recip_ratios.horz_c);
+	} else {
+		dscl_prog_data->filter_h = spl_dscl_get_filter_coeffs_64p(
+			data->taps.h_taps, data->ratios.horz);
+
+		dscl_prog_data->filter_h_c = spl_dscl_get_filter_coeffs_64p(
+			data->taps.h_taps_c, data->ratios.horz_c);
+	}
+	if (enable_easf_v) {
+		dscl_prog_data->filter_v = spl_dscl_get_easf_filter_coeffs_64p(
+			data->taps.v_taps, data->recip_ratios.vert);
+
+		dscl_prog_data->filter_v_c = spl_dscl_get_easf_filter_coeffs_64p(
+			data->taps.v_taps_c, data->recip_ratios.vert_c);
+	} else {
+		dscl_prog_data->filter_v = spl_dscl_get_filter_coeffs_64p(
+			data->taps.v_taps, data->ratios.vert);
+
+		dscl_prog_data->filter_v_c = spl_dscl_get_filter_coeffs_64p(
+			data->taps.v_taps_c, data->ratios.vert_c);
+	}
+}
+
+static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct spl_fixed31_32 ratio,
+	struct scale_ratio_to_reg_value_lookup *lookup_table_base_ptr,
+	unsigned int num_entries)
+{
+	unsigned int count = 0;
+	uint32_t value = 0;
+	struct scale_ratio_to_reg_value_lookup *lookup_table_index_ptr;
+
+	lookup_table_index_ptr = (lookup_table_base_ptr + num_entries - 1);
+	value = lookup_table_index_ptr->reg_value;
+
+	while (count < num_entries) {
+
+		lookup_table_index_ptr = (lookup_table_base_ptr + count);
+		if (lookup_table_index_ptr->numer < 0)
+			break;
+
+		if (ratio.value < spl_fixpt_from_fraction(
+			lookup_table_index_ptr->numer,
+			lookup_table_index_ptr->denom).value) {
+			value = lookup_table_index_ptr->reg_value;
+			break;
+		}
+
+		count++;
+	}
+	return value;
+}
+uint32_t spl_get_v_bf3_mode(struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries = sizeof(easf_v_bf3_mode_lookup) /
+		sizeof(struct scale_ratio_to_reg_value_lookup);
+	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+		easf_v_bf3_mode_lookup, num_entries);
+	return value;
+}
+uint32_t spl_get_h_bf3_mode(struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries = sizeof(easf_h_bf3_mode_lookup) /
+		sizeof(struct scale_ratio_to_reg_value_lookup);
+	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+		easf_h_bf3_mode_lookup, num_entries);
+	return value;
+}
+uint32_t spl_get_reducer_gain6(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 4) {
+		num_entries = sizeof(easf_reducer_gain6_4tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_reducer_gain6_4tap_lookup, num_entries);
+	} else if (taps == 6) {
+		num_entries = sizeof(easf_reducer_gain6_6tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_reducer_gain6_6tap_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_reducer_gain4(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 4) {
+		num_entries = sizeof(easf_reducer_gain4_4tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_reducer_gain4_4tap_lookup, num_entries);
+	} else if (taps == 6) {
+		num_entries = sizeof(easf_reducer_gain4_6tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_reducer_gain4_6tap_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_gainRing6(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 4) {
+		num_entries = sizeof(easf_gain_ring6_4tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_gain_ring6_4tap_lookup, num_entries);
+	} else if (taps == 6) {
+		num_entries = sizeof(easf_gain_ring6_6tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_gain_ring6_6tap_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_gainRing4(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 4) {
+		num_entries = sizeof(easf_gain_ring4_4tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_gain_ring4_4tap_lookup, num_entries);
+	} else if (taps == 6) {
+		num_entries = sizeof(easf_gain_ring4_6tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_gain_ring4_6tap_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_dntilt_uptilt_offset_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_dntilt_uptilt_offset_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_uptilt_maxval(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_uptilt_maxval_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_uptilt_maxval_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_dntilt_slope(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_dntilt_slope_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_dntilt_slope_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_uptilt1_slope(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_uptilt1_slope_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_uptilt1_slope_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_uptilt2_slope(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_uptilt2_slope_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_uptilt2_slope_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_uptilt2_offset(int taps, struct spl_fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_uptilt2_offset_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_uptilt2_offset_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h
new file mode 100644
index 000000000000..8bb2b8108e38
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+
+#ifndef __DC_SPL_SCL_EASF_FILTERS_H__
+#define __DC_SPL_SCL_EASF_FILTERS_H__
+
+#include "dc_spl_types.h"
+
+struct scale_ratio_to_reg_value_lookup {
+	int numer;
+	int denom;
+	const uint32_t reg_value;
+};
+
+void spl_init_easf_filter_coeffs(void);
+uint16_t *spl_get_easf_filter_3tap_64p(struct spl_fixed31_32 ratio);
+uint16_t *spl_get_easf_filter_4tap_64p(struct spl_fixed31_32 ratio);
+uint16_t *spl_get_easf_filter_6tap_64p(struct spl_fixed31_32 ratio);
+uint16_t *spl_dscl_get_easf_filter_coeffs_64p(int taps, struct spl_fixed31_32 ratio);
+void spl_set_filters_data(struct dscl_prog_data *dscl_prog_data,
+	const struct spl_scaler_data *data, bool enable_easf_v,
+	bool enable_easf_h);
+
+uint32_t spl_get_v_bf3_mode(struct spl_fixed31_32 ratio);
+uint32_t spl_get_h_bf3_mode(struct spl_fixed31_32 ratio);
+uint32_t spl_get_reducer_gain6(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_reducer_gain4(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_gainRing6(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_gainRing4(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt_maxval(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_dntilt_slope(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt1_slope(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt2_slope(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt2_offset(int taps, struct spl_fixed31_32 ratio);
+
+#endif /* __DC_SPL_SCL_EASF_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
index e2baaf584139..b02c7b0b262b 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
@@ -2,6 +2,7 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
+#include "spl_debug.h"
 #include "dc_spl_scl_filters.h"
 //=========================================
 // <num_taps>    = 2
@@ -1317,97 +1318,97 @@ static const uint16_t filter_8tap_64p_183[264] = {
 		0x3FD4, 0x3F84, 0x0214, 0x0694, 0x0694, 0x0214, 0x3F84, 0x3FD4
 };
 
-const uint16_t *spl_get_filter_3tap_16p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_3tap_16p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_3tap_16p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_3tap_16p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_3tap_16p_149;
 	else
 		return filter_3tap_16p_183;
 }
 
-const uint16_t *spl_get_filter_3tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_3tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_3tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_3tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_3tap_64p_149;
 	else
 		return filter_3tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_4tap_16p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_4tap_16p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_4tap_16p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_4tap_16p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_4tap_16p_149;
 	else
 		return filter_4tap_16p_183;
 }
 
-const uint16_t *spl_get_filter_4tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_4tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_4tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_4tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_4tap_64p_149;
 	else
 		return filter_4tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_5tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_5tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_5tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_5tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_5tap_64p_149;
 	else
 		return filter_5tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_6tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_6tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_6tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_6tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_6tap_64p_149;
 	else
 		return filter_6tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_7tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_7tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_7tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_7tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_7tap_64p_149;
 	else
 		return filter_7tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_8tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_8tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_8tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_8tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_8tap_64p_149;
 	else
 		return filter_8tap_64p_183;
@@ -1422,3 +1423,29 @@ const uint16_t *spl_get_filter_2tap_64p(void)
 {
 	return filter_2tap_64p;
 }
+
+const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct spl_fixed31_32 ratio)
+{
+	if (taps == 8)
+		return spl_get_filter_8tap_64p(ratio);
+	else if (taps == 7)
+		return spl_get_filter_7tap_64p(ratio);
+	else if (taps == 6)
+		return spl_get_filter_6tap_64p(ratio);
+	else if (taps == 5)
+		return spl_get_filter_5tap_64p(ratio);
+	else if (taps == 4)
+		return spl_get_filter_4tap_64p(ratio);
+	else if (taps == 3)
+		return spl_get_filter_3tap_64p(ratio);
+	else if (taps == 2)
+		return spl_get_filter_2tap_64p();
+	else if (taps == 1)
+		return NULL;
+	else {
+		/* should never happen, bug */
+		SPL_BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
index 6d96aca53b24..48202bc4f81e 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
@@ -7,53 +7,16 @@
 
 #include "dc_spl_types.h"
 
-const uint16_t *spl_get_filter_3tap_16p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_3tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_4tap_16p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_4tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_5tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_6tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_7tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_8tap_64p(struct fixed31_32 ratio);
+const uint16_t *spl_get_filter_3tap_16p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_3tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_4tap_16p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_4tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_5tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_6tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_7tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_8tap_64p(struct spl_fixed31_32 ratio);
 const uint16_t *spl_get_filter_2tap_16p(void);
 const uint16_t *spl_get_filter_2tap_64p(void);
-const uint16_t *spl_get_filter_3tap_16p_upscale(void);
-const uint16_t *spl_get_filter_3tap_16p_116(void);
-const uint16_t *spl_get_filter_3tap_16p_149(void);
-const uint16_t *spl_get_filter_3tap_16p_183(void);
+const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct spl_fixed31_32 ratio);
 
-const uint16_t *spl_get_filter_4tap_16p_upscale(void);
-const uint16_t *spl_get_filter_4tap_16p_116(void);
-const uint16_t *spl_get_filter_4tap_16p_149(void);
-const uint16_t *spl_get_filter_4tap_16p_183(void);
-
-const uint16_t *spl_get_filter_3tap_64p_upscale(void);
-const uint16_t *spl_get_filter_3tap_64p_116(void);
-const uint16_t *spl_get_filter_3tap_64p_149(void);
-const uint16_t *spl_get_filter_3tap_64p_183(void);
-
-const uint16_t *spl_get_filter_4tap_64p_upscale(void);
-const uint16_t *spl_get_filter_4tap_64p_116(void);
-const uint16_t *spl_get_filter_4tap_64p_149(void);
-const uint16_t *spl_get_filter_4tap_64p_183(void);
-
-const uint16_t *spl_get_filter_5tap_64p_upscale(void);
-const uint16_t *spl_get_filter_5tap_64p_116(void);
-const uint16_t *spl_get_filter_5tap_64p_149(void);
-const uint16_t *spl_get_filter_5tap_64p_183(void);
-
-const uint16_t *spl_get_filter_6tap_64p_upscale(void);
-const uint16_t *spl_get_filter_6tap_64p_116(void);
-const uint16_t *spl_get_filter_6tap_64p_149(void);
-const uint16_t *spl_get_filter_6tap_64p_183(void);
-
-const uint16_t *spl_get_filter_7tap_64p_upscale(void);
-const uint16_t *spl_get_filter_7tap_64p_116(void);
-const uint16_t *spl_get_filter_7tap_64p_149(void);
-const uint16_t *spl_get_filter_7tap_64p_183(void);
-
-const uint16_t *spl_get_filter_8tap_64p_upscale(void);
-const uint16_t *spl_get_filter_8tap_64p_116(void);
-const uint16_t *spl_get_filter_8tap_64p_149(void);
-const uint16_t *spl_get_filter_8tap_64p_183(void);
 #endif /* __DC_SPL_SCL_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters_old.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters_old.c
deleted file mode 100644
index bb0e1b80ec3c..000000000000
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters_old.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * Copyright 2012-16 Advanced Micro Devices, Inc.
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
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
index 36d10b0f2eed..3d61c9825807 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
@@ -2,14 +2,15 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-#include "os_types.h"   // swap
-#ifndef ASSERT
-#define ASSERT(_bool) ((void *)0)
-#endif
-#include "include/fixed31_32.h"	// fixed31_32 and related functions
 #ifndef __DC_SPL_TYPES_H__
 #define __DC_SPL_TYPES_H__
 
+#include "spl_os_types.h"   // swap
+#ifndef SPL_ASSERT
+#define SPL_ASSERT(_bool) ((void *)0)
+#endif
+#include "spl_fixpt31_32.h"	// fixed31_32 and related functions
+
 struct spl_size {
 	uint32_t width;
 	uint32_t height;
@@ -22,16 +23,16 @@ struct spl_rect	{
 };
 
 struct spl_ratios {
-	struct fixed31_32 horz;
-	struct fixed31_32 vert;
-	struct fixed31_32 horz_c;
-	struct fixed31_32 vert_c;
+	struct spl_fixed31_32 horz;
+	struct spl_fixed31_32 vert;
+	struct spl_fixed31_32 horz_c;
+	struct spl_fixed31_32 vert_c;
 };
 struct spl_inits {
-	struct fixed31_32 h;
-	struct fixed31_32 h_c;
-	struct fixed31_32 v;
-	struct fixed31_32 v_c;
+	struct spl_fixed31_32 h;
+	struct spl_fixed31_32 h_c;
+	struct spl_fixed31_32 v;
+	struct spl_fixed31_32 v_c;
 };
 
 struct spl_taps	{
@@ -64,6 +65,8 @@ enum spl_pixel_format {
 	SPL_PIXEL_FORMAT_420BPP10,
 	/*end of pixel format definition*/
 	SPL_PIXEL_FORMAT_INVALID,
+	SPL_PIXEL_FORMAT_422BPP8,
+	SPL_PIXEL_FORMAT_422BPP10,
 	SPL_PIXEL_FORMAT_GRPH_BEGIN = SPL_PIXEL_FORMAT_INDEX8,
 	SPL_PIXEL_FORMAT_GRPH_END = SPL_PIXEL_FORMAT_FP16,
 	SPL_PIXEL_FORMAT_VIDEO_BEGIN = SPL_PIXEL_FORMAT_420BPP8,
@@ -135,6 +138,7 @@ struct spl_scaler_data {
 	struct spl_rect viewport_c;
 	struct spl_rect recout;
 	struct spl_ratios ratios;
+	struct spl_ratios recip_ratios;
 	struct spl_inits inits;
 };
 
@@ -405,10 +409,15 @@ struct dscl_prog_data {
 };
 
 /* SPL input and output definitions */
-// SPL outputs struct
-struct spl_out	{
+// SPL scratch struct
+struct spl_scratch {
 	// Pack all SPL outputs in scl_data
 	struct spl_scaler_data scl_data;
+};
+
+/* SPL input and output definitions */
+// SPL outputs struct
+struct spl_out	{
 	// Pack all output need to program hw registers
 	struct dscl_prog_data *dscl_prog_data;
 };
@@ -491,6 +500,10 @@ struct spl_in	{
 	bool prefer_easf;
 	bool disable_easf;
 	struct spl_debug debug;
+	bool is_fullscreen;
+	bool is_hdr_on;
+	int h_active;
+	int v_active;
 };
 // end of SPL inputs
 
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h b/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
new file mode 100644
index 000000000000..5696dafd0894
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+
+#ifndef SPL_DEBUG_H
+#define SPL_DEBUG_H
+
+#ifdef SPL_ASSERT
+#undef SPL_ASSERT
+#endif
+#define SPL_ASSERT(b)
+
+#define SPL_ASSERT_CRITICAL(expr)  do {if (expr)/* Do nothing */; } while (0)
+
+#ifdef SPL_DALMSG
+#undef SPL_DALMSG
+#endif
+#define SPL_DALMSG(b)
+
+#ifdef SPL_DAL_ASSERT_MSG
+#undef SPL_DAL_ASSERT_MSG
+#endif
+#define SPL_DAL_ASSERT_MSG(b, m)
+
+#endif  // SPL_DEBUG_H
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
new file mode 100644
index 000000000000..a95565df5487
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#include "spl_fixpt31_32.h"
+
+static const struct spl_fixed31_32 spl_fixpt_two_pi = { 26986075409LL };
+static const struct spl_fixed31_32 spl_fixpt_ln2 = { 2977044471LL };
+static const struct spl_fixed31_32 spl_fixpt_ln2_div_2 = { 1488522236LL };
+
+static inline unsigned long long abs_i64(
+	long long arg)
+{
+	if (arg > 0)
+		return (unsigned long long)arg;
+	else
+		return (unsigned long long)(-arg);
+}
+
+/*
+ * @brief
+ * result = dividend / divisor
+ * *remainder = dividend % divisor
+ */
+static inline unsigned long long complete_integer_division_u64(
+	unsigned long long dividend,
+	unsigned long long divisor,
+	unsigned long long *remainder)
+{
+	unsigned long long result;
+
+	ASSERT(divisor);
+
+	result = spl_div64_u64_rem(dividend, divisor, remainder);
+
+	return result;
+}
+
+
+#define FRACTIONAL_PART_MASK \
+	((1ULL << FIXED31_32_BITS_PER_FRACTIONAL_PART) - 1)
+
+#define GET_INTEGER_PART(x) \
+	((x) >> FIXED31_32_BITS_PER_FRACTIONAL_PART)
+
+#define GET_FRACTIONAL_PART(x) \
+	(FRACTIONAL_PART_MASK & (x))
+
+struct spl_fixed31_32 spl_fixpt_from_fraction(long long numerator, long long denominator)
+{
+	struct spl_fixed31_32 res;
+
+	bool arg1_negative = numerator < 0;
+	bool arg2_negative = denominator < 0;
+
+	unsigned long long arg1_value = arg1_negative ? -numerator : numerator;
+	unsigned long long arg2_value = arg2_negative ? -denominator : denominator;
+
+	unsigned long long remainder;
+
+	/* determine integer part */
+
+	unsigned long long res_value = complete_integer_division_u64(
+		arg1_value, arg2_value, &remainder);
+
+	ASSERT(res_value <= LONG_MAX);
+
+	/* determine fractional part */
+	{
+		unsigned int i = FIXED31_32_BITS_PER_FRACTIONAL_PART;
+
+		do {
+			remainder <<= 1;
+
+			res_value <<= 1;
+
+			if (remainder >= arg2_value) {
+				res_value |= 1;
+				remainder -= arg2_value;
+			}
+		} while (--i != 0);
+	}
+
+	/* round up LSB */
+	{
+		unsigned long long summand = (remainder << 1) >= arg2_value;
+
+		ASSERT(res_value <= LLONG_MAX - summand);
+
+		res_value += summand;
+	}
+
+	res.value = (long long)res_value;
+
+	if (arg1_negative ^ arg2_negative)
+		res.value = -res.value;
+
+	return res;
+}
+
+struct spl_fixed31_32 spl_fixpt_mul(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	struct spl_fixed31_32 res;
+
+	bool arg1_negative = arg1.value < 0;
+	bool arg2_negative = arg2.value < 0;
+
+	unsigned long long arg1_value = arg1_negative ? -arg1.value : arg1.value;
+	unsigned long long arg2_value = arg2_negative ? -arg2.value : arg2.value;
+
+	unsigned long long arg1_int = GET_INTEGER_PART(arg1_value);
+	unsigned long long arg2_int = GET_INTEGER_PART(arg2_value);
+
+	unsigned long long arg1_fra = GET_FRACTIONAL_PART(arg1_value);
+	unsigned long long arg2_fra = GET_FRACTIONAL_PART(arg2_value);
+
+	unsigned long long tmp;
+
+	res.value = arg1_int * arg2_int;
+
+	ASSERT(res.value <= (long long)LONG_MAX);
+
+	res.value <<= FIXED31_32_BITS_PER_FRACTIONAL_PART;
+
+	tmp = arg1_int * arg2_fra;
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	tmp = arg2_int * arg1_fra;
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	tmp = arg1_fra * arg2_fra;
+
+	tmp = (tmp >> FIXED31_32_BITS_PER_FRACTIONAL_PART) +
+		(tmp >= (unsigned long long)spl_fixpt_half.value);
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	if (arg1_negative ^ arg2_negative)
+		res.value = -res.value;
+
+	return res;
+}
+
+struct spl_fixed31_32 spl_fixpt_sqr(struct spl_fixed31_32 arg)
+{
+	struct spl_fixed31_32 res;
+
+	unsigned long long arg_value = abs_i64(arg.value);
+
+	unsigned long long arg_int = GET_INTEGER_PART(arg_value);
+
+	unsigned long long arg_fra = GET_FRACTIONAL_PART(arg_value);
+
+	unsigned long long tmp;
+
+	res.value = arg_int * arg_int;
+
+	ASSERT(res.value <= (long long)LONG_MAX);
+
+	res.value <<= FIXED31_32_BITS_PER_FRACTIONAL_PART;
+
+	tmp = arg_int * arg_fra;
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	tmp = arg_fra * arg_fra;
+
+	tmp = (tmp >> FIXED31_32_BITS_PER_FRACTIONAL_PART) +
+		(tmp >= (unsigned long long)spl_fixpt_half.value);
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	return res;
+}
+
+struct spl_fixed31_32 spl_fixpt_recip(struct spl_fixed31_32 arg)
+{
+	/*
+	 * @note
+	 * Good idea to use Newton's method
+	 */
+
+	ASSERT(arg.value);
+
+	return spl_fixpt_from_fraction(
+		spl_fixpt_one.value,
+		arg.value);
+}
+
+struct spl_fixed31_32 spl_fixpt_sinc(struct spl_fixed31_32 arg)
+{
+	struct spl_fixed31_32 square;
+
+	struct spl_fixed31_32 res = spl_fixpt_one;
+
+	int n = 27;
+
+	struct spl_fixed31_32 arg_norm = arg;
+
+	if (spl_fixpt_le(
+		spl_fixpt_two_pi,
+		spl_fixpt_abs(arg))) {
+		arg_norm = spl_fixpt_sub(
+			arg_norm,
+			spl_fixpt_mul_int(
+				spl_fixpt_two_pi,
+				(int)spl_div64_s64(
+					arg_norm.value,
+					spl_fixpt_two_pi.value)));
+	}
+
+	square = spl_fixpt_sqr(arg_norm);
+
+	do {
+		res = spl_fixpt_sub(
+			spl_fixpt_one,
+			spl_fixpt_div_int(
+				spl_fixpt_mul(
+					square,
+					res),
+				n * (n - 1)));
+
+		n -= 2;
+	} while (n > 2);
+
+	if (arg.value != arg_norm.value)
+		res = spl_fixpt_div(
+			spl_fixpt_mul(res, arg_norm),
+			arg);
+
+	return res;
+}
+
+struct spl_fixed31_32 spl_fixpt_sin(struct spl_fixed31_32 arg)
+{
+	return spl_fixpt_mul(
+		arg,
+		spl_fixpt_sinc(arg));
+}
+
+struct spl_fixed31_32 spl_fixpt_cos(struct spl_fixed31_32 arg)
+{
+	/* TODO implement argument normalization */
+
+	const struct spl_fixed31_32 square = spl_fixpt_sqr(arg);
+
+	struct spl_fixed31_32 res = spl_fixpt_one;
+
+	int n = 26;
+
+	do {
+		res = spl_fixpt_sub(
+			spl_fixpt_one,
+			spl_fixpt_div_int(
+				spl_fixpt_mul(
+					square,
+					res),
+				n * (n - 1)));
+
+		n -= 2;
+	} while (n != 0);
+
+	return res;
+}
+
+/*
+ * @brief
+ * result = exp(arg),
+ * where abs(arg) < 1
+ *
+ * Calculated as Taylor series.
+ */
+static struct spl_fixed31_32 fixed31_32_exp_from_taylor_series(struct spl_fixed31_32 arg)
+{
+	unsigned int n = 9;
+
+	struct spl_fixed31_32 res = spl_fixpt_from_fraction(
+		n + 2,
+		n + 1);
+	/* TODO find correct res */
+
+	ASSERT(spl_fixpt_lt(arg, spl_fixpt_one));
+
+	do
+		res = spl_fixpt_add(
+			spl_fixpt_one,
+			spl_fixpt_div_int(
+				spl_fixpt_mul(
+					arg,
+					res),
+				n));
+	while (--n != 1);
+
+	return spl_fixpt_add(
+		spl_fixpt_one,
+		spl_fixpt_mul(
+			arg,
+			res));
+}
+
+struct spl_fixed31_32 spl_fixpt_exp(struct spl_fixed31_32 arg)
+{
+	/*
+	 * @brief
+	 * Main equation is:
+	 * exp(x) = exp(r + m * ln(2)) = (1 << m) * exp(r),
+	 * where m = round(x / ln(2)), r = x - m * ln(2)
+	 */
+
+	if (spl_fixpt_le(
+		spl_fixpt_ln2_div_2,
+		spl_fixpt_abs(arg))) {
+		int m = spl_fixpt_round(
+			spl_fixpt_div(
+				arg,
+				spl_fixpt_ln2));
+
+		struct spl_fixed31_32 r = spl_fixpt_sub(
+			arg,
+			spl_fixpt_mul_int(
+				spl_fixpt_ln2,
+				m));
+
+		ASSERT(m != 0);
+
+		ASSERT(spl_fixpt_lt(
+			spl_fixpt_abs(r),
+			spl_fixpt_one));
+
+		if (m > 0)
+			return spl_fixpt_shl(
+				fixed31_32_exp_from_taylor_series(r),
+				(unsigned char)m);
+		else
+			return spl_fixpt_div_int(
+				fixed31_32_exp_from_taylor_series(r),
+				1LL << -m);
+	} else if (arg.value != 0)
+		return fixed31_32_exp_from_taylor_series(arg);
+	else
+		return spl_fixpt_one;
+}
+
+struct spl_fixed31_32 spl_fixpt_log(struct spl_fixed31_32 arg)
+{
+	struct spl_fixed31_32 res = spl_fixpt_neg(spl_fixpt_one);
+	/* TODO improve 1st estimation */
+
+	struct spl_fixed31_32 error;
+
+	ASSERT(arg.value > 0);
+	/* TODO if arg is negative, return NaN */
+	/* TODO if arg is zero, return -INF */
+
+	do {
+		struct spl_fixed31_32 res1 = spl_fixpt_add(
+			spl_fixpt_sub(
+				res,
+				spl_fixpt_one),
+			spl_fixpt_div(
+				arg,
+				spl_fixpt_exp(res)));
+
+		error = spl_fixpt_sub(
+			res,
+			res1);
+
+		res = res1;
+		/* TODO determine max_allowed_error based on quality of exp() */
+	} while (abs_i64(error.value) > 100ULL);
+
+	return res;
+}
+
+
+/* this function is a generic helper to translate fixed point value to
+ * specified integer format that will consist of integer_bits integer part and
+ * fractional_bits fractional part. For example it is used in
+ * spl_fixpt_u2d19 to receive 2 bits integer part and 19 bits fractional
+ * part in 32 bits. It is used in hw programming (scaler)
+ */
+
+static inline unsigned int ux_dy(
+	long long value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits)
+{
+	/* 1. create mask of integer part */
+	unsigned int result = (1 << integer_bits) - 1;
+	/* 2. mask out fractional part */
+	unsigned int fractional_part = FRACTIONAL_PART_MASK & value;
+	/* 3. shrink fixed point integer part to be of integer_bits width*/
+	result &= GET_INTEGER_PART(value);
+	/* 4. make space for fractional part to be filled in after integer */
+	result <<= fractional_bits;
+	/* 5. shrink fixed point fractional part to of fractional_bits width*/
+	fractional_part >>= FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits;
+	/* 6. merge the result */
+	return result | fractional_part;
+}
+
+static inline unsigned int clamp_ux_dy(
+	long long value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits,
+	unsigned int min_clamp)
+{
+	unsigned int truncated_val = ux_dy(value, integer_bits, fractional_bits);
+
+	if (value >= (1LL << (integer_bits + FIXED31_32_BITS_PER_FRACTIONAL_PART)))
+		return (1 << (integer_bits + fractional_bits)) - 1;
+	else if (truncated_val > min_clamp)
+		return truncated_val;
+	else
+		return min_clamp;
+}
+
+unsigned int spl_fixpt_u4d19(struct spl_fixed31_32 arg)
+{
+	return ux_dy(arg.value, 4, 19);
+}
+
+unsigned int spl_fixpt_u3d19(struct spl_fixed31_32 arg)
+{
+	return ux_dy(arg.value, 3, 19);
+}
+
+unsigned int spl_fixpt_u2d19(struct spl_fixed31_32 arg)
+{
+	return ux_dy(arg.value, 2, 19);
+}
+
+unsigned int spl_fixpt_u0d19(struct spl_fixed31_32 arg)
+{
+	return ux_dy(arg.value, 0, 19);
+}
+
+unsigned int spl_fixpt_clamp_u0d14(struct spl_fixed31_32 arg)
+{
+	return clamp_ux_dy(arg.value, 0, 14, 1);
+}
+
+unsigned int spl_fixpt_clamp_u0d10(struct spl_fixed31_32 arg)
+{
+	return clamp_ux_dy(arg.value, 0, 10, 1);
+}
+
+int spl_fixpt_s4d19(struct spl_fixed31_32 arg)
+{
+	if (arg.value < 0)
+		return -(int)ux_dy(spl_fixpt_abs(arg).value, 4, 19);
+	else
+		return ux_dy(arg.value, 4, 19);
+}
+
+struct spl_fixed31_32 spl_fixpt_from_ux_dy(unsigned int value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits)
+{
+	struct spl_fixed31_32 fixpt_value = spl_fixpt_zero;
+	struct spl_fixed31_32 fixpt_int_value = spl_fixpt_zero;
+	long long frac_mask = ((long long)1 << (long long)integer_bits) - 1;
+
+	fixpt_value.value = (long long)value << (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+	frac_mask = frac_mask << fractional_bits;
+	fixpt_int_value.value = value & frac_mask;
+	fixpt_int_value.value <<= (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+	fixpt_value.value |= fixpt_int_value.value;
+	return fixpt_value;
+}
+
+struct spl_fixed31_32 spl_fixpt_from_int_dy(unsigned int int_value,
+	unsigned int frac_value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits)
+{
+	struct spl_fixed31_32 fixpt_value = spl_fixpt_from_int(int_value);
+
+	fixpt_value.value |= (long long)frac_value << (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+	return fixpt_value;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
new file mode 100644
index 000000000000..8a045e2f8699
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
@@ -0,0 +1,525 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+
+#ifndef __SPL_FIXED31_32_H__
+#define __SPL_FIXED31_32_H__
+
+#include "os_types.h"
+#include "spl_os_types.h"   // swap
+#ifndef ASSERT
+#define ASSERT(_bool) ((void *)0)
+#endif
+
+#ifndef LLONG_MAX
+#define LLONG_MAX 9223372036854775807ll
+#endif
+#ifndef LLONG_MIN
+#define LLONG_MIN (-LLONG_MAX - 1ll)
+#endif
+
+#define FIXED31_32_BITS_PER_FRACTIONAL_PART 32
+#ifndef LLONG_MIN
+#define LLONG_MIN (1LL<<63)
+#endif
+#ifndef LLONG_MAX
+#define LLONG_MAX (-1LL>>1)
+#endif
+
+/*
+ * @brief
+ * Arithmetic operations on real numbers
+ * represented as fixed-point numbers.
+ * There are: 1 bit for sign,
+ * 31 bit for integer part,
+ * 32 bits for fractional part.
+ *
+ * @note
+ * Currently, overflows and underflows are asserted;
+ * no special result returned.
+ */
+
+struct spl_fixed31_32 {
+	long long value;
+};
+
+
+/*
+ * @brief
+ * Useful constants
+ */
+
+static const struct spl_fixed31_32 spl_fixpt_zero = { 0 };
+static const struct spl_fixed31_32 spl_fixpt_epsilon = { 1LL };
+static const struct spl_fixed31_32 spl_fixpt_half = { 0x80000000LL };
+static const struct spl_fixed31_32 spl_fixpt_one = { 0x100000000LL };
+
+/*
+ * @brief
+ * Initialization routines
+ */
+
+/*
+ * @brief
+ * result = numerator / denominator
+ */
+struct spl_fixed31_32 spl_fixpt_from_fraction(long long numerator, long long denominator);
+
+/*
+ * @brief
+ * result = arg
+ */
+static inline struct spl_fixed31_32 spl_fixpt_from_int(int arg)
+{
+	struct spl_fixed31_32 res;
+
+	res.value = (long long) arg << FIXED31_32_BITS_PER_FRACTIONAL_PART;
+
+	return res;
+}
+
+/*
+ * @brief
+ * Unary operators
+ */
+
+/*
+ * @brief
+ * result = -arg
+ */
+static inline struct spl_fixed31_32 spl_fixpt_neg(struct spl_fixed31_32 arg)
+{
+	struct spl_fixed31_32 res;
+
+	res.value = -arg.value;
+
+	return res;
+}
+
+/*
+ * @brief
+ * result = abs(arg) := (arg >= 0) ? arg : -arg
+ */
+static inline struct spl_fixed31_32 spl_fixpt_abs(struct spl_fixed31_32 arg)
+{
+	if (arg.value < 0)
+		return spl_fixpt_neg(arg);
+	else
+		return arg;
+}
+
+/*
+ * @brief
+ * Binary relational operators
+ */
+
+/*
+ * @brief
+ * result = arg1 < arg2
+ */
+static inline bool spl_fixpt_lt(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	return arg1.value < arg2.value;
+}
+
+/*
+ * @brief
+ * result = arg1 <= arg2
+ */
+static inline bool spl_fixpt_le(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	return arg1.value <= arg2.value;
+}
+
+/*
+ * @brief
+ * result = arg1 == arg2
+ */
+static inline bool spl_fixpt_eq(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	return arg1.value == arg2.value;
+}
+
+/*
+ * @brief
+ * result = min(arg1, arg2) := (arg1 <= arg2) ? arg1 : arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_min(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	if (arg1.value <= arg2.value)
+		return arg1;
+	else
+		return arg2;
+}
+
+/*
+ * @brief
+ * result = max(arg1, arg2) := (arg1 <= arg2) ? arg2 : arg1
+ */
+static inline struct spl_fixed31_32 spl_fixpt_max(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	if (arg1.value <= arg2.value)
+		return arg2;
+	else
+		return arg1;
+}
+
+/*
+ * @brief
+ *          | min_value, when arg <= min_value
+ * result = | arg, when min_value < arg < max_value
+ *          | max_value, when arg >= max_value
+ */
+static inline struct spl_fixed31_32 spl_fixpt_clamp(
+	struct spl_fixed31_32 arg,
+	struct spl_fixed31_32 min_value,
+	struct spl_fixed31_32 max_value)
+{
+	if (spl_fixpt_le(arg, min_value))
+		return min_value;
+	else if (spl_fixpt_le(max_value, arg))
+		return max_value;
+	else
+		return arg;
+}
+
+/*
+ * @brief
+ * Binary shift operators
+ */
+
+/*
+ * @brief
+ * result = arg << shift
+ */
+static inline struct spl_fixed31_32 spl_fixpt_shl(struct spl_fixed31_32 arg, unsigned char shift)
+{
+	ASSERT(((arg.value >= 0) && (arg.value <= LLONG_MAX >> shift)) ||
+		((arg.value < 0) && (arg.value >= ~(LLONG_MAX >> shift))));
+
+	arg.value = arg.value << shift;
+
+	return arg;
+}
+
+/*
+ * @brief
+ * result = arg >> shift
+ */
+static inline struct spl_fixed31_32 spl_fixpt_shr(struct spl_fixed31_32 arg, unsigned char shift)
+{
+	bool negative = arg.value < 0;
+
+	if (negative)
+		arg.value = -arg.value;
+	arg.value = arg.value >> shift;
+	if (negative)
+		arg.value = -arg.value;
+	return arg;
+}
+
+/*
+ * @brief
+ * Binary additive operators
+ */
+
+/*
+ * @brief
+ * result = arg1 + arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_add(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	struct spl_fixed31_32 res;
+
+	ASSERT(((arg1.value >= 0) && (LLONG_MAX - arg1.value >= arg2.value)) ||
+		((arg1.value < 0) && (LLONG_MIN - arg1.value <= arg2.value)));
+
+	res.value = arg1.value + arg2.value;
+
+	return res;
+}
+
+/*
+ * @brief
+ * result = arg1 + arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_add_int(struct spl_fixed31_32 arg1, int arg2)
+{
+	return spl_fixpt_add(arg1, spl_fixpt_from_int(arg2));
+}
+
+/*
+ * @brief
+ * result = arg1 - arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_sub(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	struct spl_fixed31_32 res;
+
+	ASSERT(((arg2.value >= 0) && (LLONG_MIN + arg2.value <= arg1.value)) ||
+		((arg2.value < 0) && (LLONG_MAX + arg2.value >= arg1.value)));
+
+	res.value = arg1.value - arg2.value;
+
+	return res;
+}
+
+/*
+ * @brief
+ * result = arg1 - arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_sub_int(struct spl_fixed31_32 arg1, int arg2)
+{
+	return spl_fixpt_sub(arg1, spl_fixpt_from_int(arg2));
+}
+
+
+/*
+ * @brief
+ * Binary multiplicative operators
+ */
+
+/*
+ * @brief
+ * result = arg1 * arg2
+ */
+struct spl_fixed31_32 spl_fixpt_mul(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2);
+
+
+/*
+ * @brief
+ * result = arg1 * arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_mul_int(struct spl_fixed31_32 arg1, int arg2)
+{
+	return spl_fixpt_mul(arg1, spl_fixpt_from_int(arg2));
+}
+
+/*
+ * @brief
+ * result = square(arg) := arg * arg
+ */
+struct spl_fixed31_32 spl_fixpt_sqr(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * result = arg1 / arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_div_int(struct spl_fixed31_32 arg1, long long arg2)
+{
+	return spl_fixpt_from_fraction(arg1.value, spl_fixpt_from_int((int)arg2).value);
+}
+
+/*
+ * @brief
+ * result = arg1 / arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_div(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	return spl_fixpt_from_fraction(arg1.value, arg2.value);
+}
+
+/*
+ * @brief
+ * Reciprocal function
+ */
+
+/*
+ * @brief
+ * result = reciprocal(arg) := 1 / arg
+ *
+ * @note
+ * No special actions taken in case argument is zero.
+ */
+struct spl_fixed31_32 spl_fixpt_recip(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * Trigonometric functions
+ */
+
+/*
+ * @brief
+ * result = sinc(arg) := sin(arg) / arg
+ *
+ * @note
+ * Argument specified in radians,
+ * internally it's normalized to [-2pi...2pi] range.
+ */
+struct spl_fixed31_32 spl_fixpt_sinc(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * result = sin(arg)
+ *
+ * @note
+ * Argument specified in radians,
+ * internally it's normalized to [-2pi...2pi] range.
+ */
+struct spl_fixed31_32 spl_fixpt_sin(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * result = cos(arg)
+ *
+ * @note
+ * Argument specified in radians
+ * and should be in [-2pi...2pi] range -
+ * passing arguments outside that range
+ * will cause incorrect result!
+ */
+struct spl_fixed31_32 spl_fixpt_cos(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * Transcendent functions
+ */
+
+/*
+ * @brief
+ * result = exp(arg)
+ *
+ * @note
+ * Currently, function is verified for abs(arg) <= 1.
+ */
+struct spl_fixed31_32 spl_fixpt_exp(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * result = log(arg)
+ *
+ * @note
+ * Currently, abs(arg) should be less than 1.
+ * No normalization is done.
+ * Currently, no special actions taken
+ * in case of invalid argument(s). Take care!
+ */
+struct spl_fixed31_32 spl_fixpt_log(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * Power function
+ */
+
+/*
+ * @brief
+ * result = pow(arg1, arg2)
+ *
+ * @note
+ * Currently, abs(arg1) should be less than 1. Take care!
+ */
+static inline struct spl_fixed31_32 spl_fixpt_pow(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	if (arg1.value == 0)
+		return arg2.value == 0 ? spl_fixpt_one : spl_fixpt_zero;
+
+	return spl_fixpt_exp(
+		spl_fixpt_mul(
+			spl_fixpt_log(arg1),
+			arg2));
+}
+
+/*
+ * @brief
+ * Rounding functions
+ */
+
+/*
+ * @brief
+ * result = floor(arg) := greatest integer lower than or equal to arg
+ */
+static inline int spl_fixpt_floor(struct spl_fixed31_32 arg)
+{
+	unsigned long long arg_value = arg.value > 0 ? arg.value : -arg.value;
+
+	if (arg.value >= 0)
+		return (int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+	else
+		return -(int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+}
+
+/*
+ * @brief
+ * result = round(arg) := integer nearest to arg
+ */
+static inline int spl_fixpt_round(struct spl_fixed31_32 arg)
+{
+	unsigned long long arg_value = arg.value > 0 ? arg.value : -arg.value;
+
+	const long long summand = spl_fixpt_half.value;
+
+	ASSERT(LLONG_MAX - (long long)arg_value >= summand);
+
+	arg_value += summand;
+
+	if (arg.value >= 0)
+		return (int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+	else
+		return -(int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+}
+
+/*
+ * @brief
+ * result = ceil(arg) := lowest integer greater than or equal to arg
+ */
+static inline int spl_fixpt_ceil(struct spl_fixed31_32 arg)
+{
+	unsigned long long arg_value = arg.value > 0 ? arg.value : -arg.value;
+
+	const long long summand = spl_fixpt_one.value -
+		spl_fixpt_epsilon.value;
+
+	ASSERT(LLONG_MAX - (long long)arg_value >= summand);
+
+	arg_value += summand;
+
+	if (arg.value >= 0)
+		return (int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+	else
+		return -(int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+}
+
+/* the following two function are used in scaler hw programming to convert fixed
+ * point value to format 2 bits from integer part and 19 bits from fractional
+ * part. The same applies for u0d19, 0 bits from integer part and 19 bits from
+ * fractional
+ */
+
+unsigned int spl_fixpt_u4d19(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_u3d19(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_u2d19(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_u0d19(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_clamp_u0d14(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_clamp_u0d10(struct spl_fixed31_32 arg);
+
+int spl_fixpt_s4d19(struct spl_fixed31_32 arg);
+
+static inline struct spl_fixed31_32 spl_fixpt_truncate(struct spl_fixed31_32 arg, unsigned int frac_bits)
+{
+	bool negative = arg.value < 0;
+
+	if (frac_bits >= FIXED31_32_BITS_PER_FRACTIONAL_PART) {
+		ASSERT(frac_bits == FIXED31_32_BITS_PER_FRACTIONAL_PART);
+		return arg;
+	}
+
+	if (negative)
+		arg.value = -arg.value;
+	arg.value &= (~0ULL) << (FIXED31_32_BITS_PER_FRACTIONAL_PART - frac_bits);
+	if (negative)
+		arg.value = -arg.value;
+	return arg;
+}
+
+struct spl_fixed31_32 spl_fixpt_from_ux_dy(unsigned int value, unsigned int integer_bits, unsigned int fractional_bits);
+struct spl_fixed31_32 spl_fixpt_from_int_dy(unsigned int int_value,
+		unsigned int frac_value,
+		unsigned int integer_bits,
+		unsigned int fractional_bits);
+
+#endif
-- 
2.34.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAF39D3171
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Nov 2024 01:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5331710E382;
	Wed, 20 Nov 2024 00:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hGriyHOy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F06910E382
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Nov 2024 00:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW1eWtqNr8NB6sqBW0yJByCcJbCDFti2ER77mmKgQewok4YIrpR1QEwfSMNVbkH2NfRdtDwEj9/mmmXYt8+3DG8sxUYvfh8q644y0X1PnIQi6bqwWidc7DZiQR/Zd2Zj4uf1/w+q2RqNfaeEwP+iq/htjSiNfLkTkwPPMzmKUYpmpTpjLSUaX9LzbO49XUBRt3YAyMIs6Uk3bfWSAy6+4uVNuyI9vJQbX5XrLfn4eSgpqnOu+WfOmn8AFyAurhgtSSixRSEE8ZO/nikMpGXkRr2ZNZp9J/2ajs0u6SUT41+U1JJPd+boAmEGMGEBrA4OxrR6xllL6w+YirE1mYY/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXz5gZn8SolbCbBXZ5msSIRSmvHPUSsITe28I8+mR0U=;
 b=rbzAe+8h4/PIT5/G7k/0YDQhUbfdnzZNREmQFBLkFx1QqAS1hUl+3Z7MWwTjbobol9WiNMnO9KV3zx5p6cSXkBB9dXwqKNi/N4MieGI6czecW+7GXe7fStLMrRTQFOLlMcERadItf8Pp5Q86X685VpacoYaQrdIpX/fvOGbttdxGNdO/KoqRXy2/VixuCqTF8qR0vZAADMkiHMZcPAcumHBlanf2BU8Ag5c13Uvq3Yt0BHdc7tcUHM1LyIFSHACIH175ptfRTRb2sjxB07H21nRjJGs3GUQXcJwP2G50PCvs/tE8tuMT2lR7xqGX62VmaFmNBuWNsAEey19dEvzs6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXz5gZn8SolbCbBXZ5msSIRSmvHPUSsITe28I8+mR0U=;
 b=hGriyHOyrEQ5uh6KgkBVM3mKvoEwtGGw7/+PqvM+Qm8BJhFJbXAXauYqDjMiZxp04eciU0J873ygZiiUaH1wjAzwsbOl0Y2fG7f8dzYFnVQzSggod797A3sHi/m44VWgAToxLrPpQFwJ0c1D+tB1r2Wsd7aE54Off8Jkve71G48=
Received: from PH7PR03CA0001.namprd03.prod.outlook.com (2603:10b6:510:339::26)
 by DS0PR12MB8295.namprd12.prod.outlook.com (2603:10b6:8:f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Wed, 20 Nov
 2024 00:33:46 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::7a) by PH7PR03CA0001.outlook.office365.com
 (2603:10b6:510:339::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.25 via Frontend
 Transport; Wed, 20 Nov 2024 00:33:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 20 Nov 2024 00:33:46 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 18:33:43 -0600
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>, Wayne Lin
 <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, Fangzhi Zuo
 <jerry.zuo@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>, Solomon Chiu
 <solomon.chiu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Sung Lee
 <Sung.Lee@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, <stable@vger.kernel.org>, Aric Cyr
 <aric.cyr@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 5/9] drm/amd/display: Add option to retrieve detile buffer size
Date: Tue, 19 Nov 2024 17:28:33 -0700
Message-ID: <20241120003044.2160289-6-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120003044.2160289-1-alex.hung@amd.com>
References: <20241120003044.2160289-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|DS0PR12MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: c53ae187-8344-4e49-dd16-08dd08fafe8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k7ZonI7OeWxcZ/wiDLNLKJ4CU6W++D7kTG9BAsQRTgOozP/XNok0dlJ27Pjd?=
 =?us-ascii?Q?RY90q6sBazdymYfL1Izv8X4GFn9L1m9pN4RyPGGI4uB1f/DjLEdHY7lBPiTQ?=
 =?us-ascii?Q?nTX+cv/U6Q7FMPr1awNiAKQJgIS0Ky4IPUOtWzFZGzxhHVGpZFRR4vPpLar5?=
 =?us-ascii?Q?NShO+EbuwPtBIMFBC9oRvWhnF7F6u/9O7FUKfxKO04Aa0B3KYD/RY/QPFPOd?=
 =?us-ascii?Q?ZRKgeRSaitymdSSWHjZnLnGCBBrYDgrPW4AyG7H6OQcZNQqJm5RQrELfoXbl?=
 =?us-ascii?Q?ByO4h1RF0+gDPUlW4jo/P6ixbAzeDytF3+PGqLmbUWFpfic0Or1Ts4WsNkGj?=
 =?us-ascii?Q?SK95EhDD/4QwQqM1aAq79XkV7hsQoi421FLT/2iCuLU05qo4Yn6Syvsbelpr?=
 =?us-ascii?Q?QYu+cjMAE1J4xiq/e54QGw+UVFp50iKd/Tq/KR3/mTZXKkl5Z3hRVoaPBP+/?=
 =?us-ascii?Q?toPDEMPCl2OPDzfyPIKKZXhIz7sWDsknrtt0oSj6KPG79aOEusThZ9PZjqUP?=
 =?us-ascii?Q?RNuS+UQts3nOYV3oifSKe0PnOTLRI408MZdYDLeN8kvrQ5LFrIT7D1ipjgcL?=
 =?us-ascii?Q?cCTWHm87mWUfqDw86d47xGERdaX0JUQyeV2OfB7n9EUQ9k9amkh5eCYjw+R5?=
 =?us-ascii?Q?a3cbuar5UKPkqeVe3+q6dQ79y+iVh1PsJW535qXZvmkWGsE7E91a/3kz/c6P?=
 =?us-ascii?Q?9K9PCqxjC2RziFUVw3TzI/SmQDoT0W5NZ62U+fw6p7s5tLSGOsPKuD/H5/J5?=
 =?us-ascii?Q?2d9FeOFJhAQX+T59RRPpytm6YHBb6m6VxFDOxwR02XZ+/auJ0gsFY02xlIZf?=
 =?us-ascii?Q?303UVQVOPFFtCoqcc7Qw6qhmzMo4h+FHrNyBhFrd/LqZ390gV7QJ2lFs2ArS?=
 =?us-ascii?Q?zv7Xr9Iahem34/JXeJ/N0w/7YO1yrvwUDxczF1ArwB3FdL1K1XIxd5WP26iE?=
 =?us-ascii?Q?aTxVw/OV8681BJY3W6dNXSlD7ZqM2QphiAk8M+nil+GSePFn879+E1/BA8A2?=
 =?us-ascii?Q?h2Xd91scoC0Khxbyd+rBt7p5hxOUfYuOIMcvnSVsHQuKOL2QRoP6+DasCi5U?=
 =?us-ascii?Q?ziieCYK5eXqOLMeQhr3/q5c4Nvg6RTuC1JW25WDHQHBedyc5qDug4rctcwKQ?=
 =?us-ascii?Q?CYDIro+Fh7/wkAscc4RFadabdPiPcrFzHKfemqb5+ck7b2dka8c0SnotPnAP?=
 =?us-ascii?Q?eXePkacS/NPVjDb44iLKMolBMDI7L9ZltBNqLy+Z8RavY1xJqG2mcjyeku95?=
 =?us-ascii?Q?4U7etcGei7NP8qmhg5bU88ivF9CgKOj6PBVNzXjB2ABgtRtccGWvwD3rDZVa?=
 =?us-ascii?Q?WnF/sN2q9DkIN0bQtVsX3c/rk96KeoiDtXmnCB+CW6HPWcA4wTLnOMaXn/X6?=
 =?us-ascii?Q?3skD+yVnvVUk7CKc1zkn9+z55z1Ka4vicErRdKTSmoS31n+ZiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 00:33:46.0184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c53ae187-8344-4e49-dd16-08dd08fafe8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8295
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

From: Sung Lee <Sung.Lee@amd.com>

[WHY]
For better power profiling knowing the detile
buffer size at a given point in time
would be useful.

[HOW]
Add interface to retrieve detile buffer from
dc state.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Aric Cyr <aric.cyr@amd.com>
Signed-off-by: Sung Lee <Sung.Lee@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h            |  2 ++
 .../gpu/drm/amd/display/dc/inc/core_types.h    |  1 +
 .../display/dc/resource/dcn31/dcn31_resource.c |  7 +++++++
 .../display/dc/resource/dcn31/dcn31_resource.h |  3 +++
 .../dc/resource/dcn314/dcn314_resource.c       |  1 +
 .../dc/resource/dcn315/dcn315_resource.c       |  1 +
 .../dc/resource/dcn316/dcn316_resource.c       |  1 +
 .../display/dc/resource/dcn35/dcn35_resource.c |  1 +
 .../dc/resource/dcn351/dcn351_resource.c       |  1 +
 10 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 1dd26d5df6b9..49fe7dcf9372 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -6109,3 +6109,21 @@ struct dc_power_profile dc_get_power_profile_for_dc_state(const struct dc_state
 		profile.power_level = dc->res_pool->funcs->get_power_profile(context);
 	return profile;
 }
+
+/*
+ **********************************************************************************
+ * dc_get_det_buffer_size_from_state() - extracts detile buffer size from dc state
+ *
+ * Called when DM wants to log detile buffer size from dc_state
+ *
+ **********************************************************************************
+ */
+unsigned int dc_get_det_buffer_size_from_state(const struct dc_state *context)
+{
+	struct dc *dc = context->clk_mgr->ctx->dc;
+
+	if (dc->res_pool->funcs->get_det_buffer_size)
+		return dc->res_pool->funcs->get_det_buffer_size(context);
+	else
+		return 0;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index b5613b71742f..943e52bb2c31 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -2551,6 +2551,8 @@ struct dc_power_profile {
 
 struct dc_power_profile dc_get_power_profile_for_dc_state(const struct dc_state *context);
 
+unsigned int dc_get_det_buffer_size_from_state(const struct dc_state *context);
+
 /* DSC Interfaces */
 #include "dc_dsc.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 8597e866bfe6..3061dca47dd2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -219,6 +219,7 @@ struct resource_funcs {
 	 * Get indicator of power from a context that went through full validation
 	 */
 	int (*get_power_profile)(const struct dc_state *context);
+	unsigned int (*get_det_buffer_size)(const struct dc_state *context);
 };
 
 struct audio_support{
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index c16cf1c8f7f9..54ec3d8e920c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1720,6 +1720,12 @@ int dcn31_populate_dml_pipes_from_context(
 	return pipe_cnt;
 }
 
+unsigned int dcn31_get_det_buffer_size(
+	const struct dc_state *context)
+{
+	return context->bw_ctx.dml.ip.det_buffer_size_kbytes;
+}
+
 void dcn31_calculate_wm_and_dlg(
 		struct dc *dc, struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
@@ -1842,6 +1848,7 @@ static struct resource_funcs dcn31_res_pool_funcs = {
 	.update_bw_bounding_box = dcn31_update_bw_bounding_box,
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.get_panel_config_defaults = dcn31_get_panel_config_defaults,
+	.get_det_buffer_size = dcn31_get_det_buffer_size,
 };
 
 static struct clock_source *dcn30_clock_source_create(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h
index 901436591ed4..551ad912f7be 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h
@@ -63,6 +63,9 @@ struct resource_pool *dcn31_create_resource_pool(
 		const struct dc_init_data *init_data,
 		struct dc *dc);
 
+unsigned int dcn31_get_det_buffer_size(
+	const struct dc_state *context);
+
 /*temp: B0 specific before switch to dcn313 headers*/
 #ifndef regPHYPLLF_PIXCLK_RESYNC_CNTL
 #define regPHYPLLF_PIXCLK_RESYNC_CNTL 0x007e
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index c0f48c78e968..2794473f2aff 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -1777,6 +1777,7 @@ static struct resource_funcs dcn314_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.get_panel_config_defaults = dcn314_get_panel_config_defaults,
 	.get_preferred_eng_id_dpia = dcn314_get_preferred_eng_id_dpia,
+	.get_det_buffer_size = dcn31_get_det_buffer_size,
 };
 
 static struct clock_source *dcn30_clock_source_create(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
index 6c3295259a81..4ee33eb3381d 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
@@ -1845,6 +1845,7 @@ static struct resource_funcs dcn315_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.get_panel_config_defaults = dcn315_get_panel_config_defaults,
 	.get_power_profile = dcn315_get_power_profile,
+	.get_det_buffer_size = dcn31_get_det_buffer_size,
 };
 
 static bool dcn315_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
index 6edaaadcb173..79eddbafe3c2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
@@ -1719,6 +1719,7 @@ static struct resource_funcs dcn316_res_pool_funcs = {
 	.update_bw_bounding_box = dcn316_update_bw_bounding_box,
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.get_panel_config_defaults = dcn316_get_panel_config_defaults,
+	.get_det_buffer_size = dcn31_get_det_buffer_size,
 };
 
 static bool dcn316_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 6cc2960b6104..09a5a9474903 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1778,6 +1778,7 @@ static struct resource_funcs dcn35_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.get_panel_config_defaults = dcn35_get_panel_config_defaults,
 	.get_preferred_eng_id_dpia = dcn35_get_preferred_eng_id_dpia,
+	.get_det_buffer_size = dcn31_get_det_buffer_size,
 };
 
 static bool dcn35_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index d87e2641cda1..fe382f9b6ff2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1757,6 +1757,7 @@ static struct resource_funcs dcn351_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
 	.get_panel_config_defaults = dcn35_get_panel_config_defaults,
 	.get_preferred_eng_id_dpia = dcn351_get_preferred_eng_id_dpia,
+	.get_det_buffer_size = dcn31_get_det_buffer_size,
 };
 
 static bool dcn351_resource_construct(
-- 
2.43.0


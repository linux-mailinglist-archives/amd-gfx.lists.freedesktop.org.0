Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9064EA9F2DF
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Apr 2025 15:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E1A10E550;
	Mon, 28 Apr 2025 13:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HKXRVqzN";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B0C10E555
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Apr 2025 13:56:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xx3gPwAxa4SuDvVH+ndBN0dobF4qNt5qZOEWCKQADklmDT/vSpf9MXqnu4kv6jNXpZg0+M4Wwb2ezq0NmMqDWgL5ibp2iuRiGGfRE14hBKJ7VNwN27qoYUPlQNzOMWFnPo+Zzs1LpZiGjKO9pQL5W0zmMGO1QgxGiXQrh6Y9k7Y75sr7b6/SPF08Kj3JB3weOSkBp0mb6X8GGURhc4dF79yi7s29P9v0QVs557SjPjBimcyfCvFWn7Lve9wpCk3zj/9H97opVhrE/F0wIxIepqV64phNxVCz06fszHSOpcNoSVXQncVmjuADuQufkud9lcq+dUo9IpOy1BIorM/fvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYpf3JTM4Qf9Uu9xRoQN5XCUS9voYB5G1SNqJEOU0DU=;
 b=rn8tCVzKPO0jVB5FVHFafWQcKqbP43BcNE7q9JvOKNTImq3uFODISw97pMUPs6DdgHASd008XZpjKyxz9Qz/g9wDGC59nEQuZgTmNNFVkW28wFtvwjpB9PgbmjYhgAmgk8Szmzt9ZsmvcoboMC6VR9GsxPECelOTCKKky66XMJRRzvkhNdj9kvuhSxsmimLlQW4jOjRo5W+/ItqQLJOV+XOYwEKU7wzoOzf4b+KNUj1hshg2Xlz3wvftZOmFarz3LxaBD1iK1Zfktp/jDtKWmaxHEL8iiaLyu6xHzmiypTLT+NEQU493kacujb9KBoT8SnUAgBUXTnB3M1YioG6LSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYpf3JTM4Qf9Uu9xRoQN5XCUS9voYB5G1SNqJEOU0DU=;
 b=HKXRVqzN6+HgSv0tAiv5YhqDjE+DhmgvxRY9xG+Oh+PscADexQNb/LzUQDC5o0bPmnqc4wMIcU6dfZSVSbkDZ7mwL+7507tS/mOft88YzjQIexdij0to25UQLJSU+ZNkOIdWgiQMPrXXnHnM+bPcJyojAr24soyHTSiEZIl7ZkI=
Received: from MN0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:208:52f::9)
 by PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 13:56:23 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::36) by MN0PR03CA0025.outlook.office365.com
 (2603:10b6:208:52f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Mon,
 28 Apr 2025 13:56:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 13:56:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 08:56:20 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Apr 2025 08:56:17 -0500
From: Ray Wu <ray.wu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>, "Daniel
 Wheeler" <daniel.wheeler@amd.com>, Alex Hung <alex.hung@amd.com>, Ryan Seto
 <ryanseto@amd.com>, Alvin Lee <alvin.lee2@amd.com>, Ray Wu <ray.wu@amd.com>
Subject: [PATCH 08/28] Revert "drm/amd/display: Refactor SubVP cursor limiting
 logic"
Date: Mon, 28 Apr 2025 21:50:38 +0800
Message-ID: <20250428135514.20775-9-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428135514.20775-1-ray.wu@amd.com>
References: <20250428135514.20775-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ray.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|PH7PR12MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 665902d8-c6ea-4d47-8e92-08dd865c75ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eNyBYnZt5OTaKuK8hYh91yxIA5478eT9Cop2kz6zql6BQuaK/ehqRLMKUqMn?=
 =?us-ascii?Q?U3QWtUTEQul4GXCjPTCspCZOehECdbxdtQynHzcHTDM7LdmflNwBF80LIYpL?=
 =?us-ascii?Q?QjXkWVF/JTTK0L8xyaUE4aLeVN3NqLyjmkMax3t1HppD2FsqKLE6iOTvpSN3?=
 =?us-ascii?Q?VmAs2bDSGV0lzN3bD3EQorUCrS7US1aA6MKLuXn+foEzEWkFPs85f8FB6B7C?=
 =?us-ascii?Q?cpuPS0lLW/vsfiOkqkw+V65LIPMqIdSjx3doAJ6PMwfv/jERrUY8uTmxlbeM?=
 =?us-ascii?Q?xaWFFE5NUDzFIgW35T3Q/QjkSI+mIlpwA20nTwcN9iDSG/nwhT9YC8d1hSlq?=
 =?us-ascii?Q?Nx95ohWbdkUGkLXavBmltZFZxnT8V/NOGSQHG3hWhinR5ZeWrVB3xj5Pcc2H?=
 =?us-ascii?Q?MWO7dHk869KYD0J6uMcovLR5jn1Sp9oQI7qXY6pk3YYeCcFadvLXtdRHFpOj?=
 =?us-ascii?Q?0LwWVO5nGi+K2YBFs55rX9SxxmySBifuS15NNdoTcSWsiJa0CyBSdfhx2JjC?=
 =?us-ascii?Q?VY2CMAXDf/9yeZGKknyjoSqgIhMVAhBfRnOIc+bEgjhDgLXN6WGuOlXcaszl?=
 =?us-ascii?Q?0lQkxUtA/nB5epZCEfAW6F+GMyxH804sl13b7H+jl7flIRay6JikgNMnTWXf?=
 =?us-ascii?Q?T/ezga88bcvYd9WpevqSX3so7O5gxRlmr1j9BxgTj/YkYVBIQXfCdXWCdgjc?=
 =?us-ascii?Q?BgFXe9eT03s6MospVtV6T9xtIqqnGZSX7O15j4e9XKu8dUh5bOrXlWD/JjCn?=
 =?us-ascii?Q?rsieArf97zTOmBK4bPqJPaK8mTbT1sZdKQUbIEmJcio9YC8ss3cf4cqA3bTn?=
 =?us-ascii?Q?YbCK2GYipP25mNcNUU+H00/t33HBtfD+fygj6K/r3NR9k9bjWBSb7FWDRmt5?=
 =?us-ascii?Q?tRzbVMh57FPLT1yvDphK3bS8gU0swL+uPbu6uLOmIRiWnTNE80FQE1nf2UxO?=
 =?us-ascii?Q?HLmafqOCD5UMafYgK/NoyLsT4H/2CSEbgMehqiKpGX9eiisEDpnxrEC+sVaF?=
 =?us-ascii?Q?Mo6kshg0K2iS7o4wEpd1/33+uxe2KZJaphOOvLjDxTn6ZxOVaO0KaRb2mjyC?=
 =?us-ascii?Q?wMd5vGC0BSQI+YSBbh/mcxTNBznlfeM0DLDgI68cJ/UtjM+hni0DKMbirdmk?=
 =?us-ascii?Q?ybdwMj4FUpWwFQfk5vBokLYECYpHGTbhzYRz07FMUfkkeULCwzASnTrOsrxy?=
 =?us-ascii?Q?FiAkGf83NrmLi8jP6mXSmWz2IYrdqXi3ULWI52wZnCSr21wbBLgz11E6LwsO?=
 =?us-ascii?Q?oFCJVOslGySrK4Bshw1iajyKSP2jvqpIUlBAmBgdBiCa49pqEmNc822Eg32t?=
 =?us-ascii?Q?bOahXg4kr4kMZAqw+QkhqNLZaYJyLfm23zHXGV76C+Medc4Yia7FTTE5Izph?=
 =?us-ascii?Q?YPROcYjx8fv2fAbH7SpMiB6vzQFQ6rgUcg6hucHFXqsB77/jFDvexah9A6Ea?=
 =?us-ascii?Q?cqfB1gw2nxEdScbDNtKaGWiykG+Ef5+moaZ+GtApfYfSx214Fy9cb5TXrR+3?=
 =?us-ascii?Q?EDLxYM+x3S6/+46EaejHQ5O+kTLYwR2TH4kr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:56:22.5405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 665902d8-c6ea-4d47-8e92-08dd865c75ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9174
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

From: Ryan Seto <ryanseto@amd.com>

This reverts commit bf4cfa2b1854("drm/amd/display: Refactor SubVP cursor limiting logic")

Reason for revert: Corruption

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Ryan Seto <ryanseto@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 52 ++--------
 .../gpu/drm/amd/display/dc/core/dc_debug.c    |  2 -
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 48 ++++++++--
 .../gpu/drm/amd/display/dc/core/dc_state.c    | 96 -------------------
 .../gpu/drm/amd/display/dc/core/dc_stream.c   | 70 +++-----------
 drivers/gpu/drm/amd/display/dc/dc.h           |  4 -
 .../gpu/drm/amd/display/dc/dc_state_priv.h    | 20 ----
 drivers/gpu/drm/amd/display/dc/dc_stream.h    | 10 --
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  |  1 -
 .../dc/dml2/dml21/dml21_translation_helper.c  |  9 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  2 +-
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c |  2 +-
 .../gpu/drm/amd/display/dc/inc/core_status.h  |  3 -
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  6 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h |  2 +
 .../dc/resource/dce100/dce100_resource.c      |  4 +-
 .../dc/resource/dce110/dce110_resource.c      |  4 +-
 .../dc/resource/dce112/dce112_resource.c      |  4 +-
 .../dc/resource/dce112/dce112_resource.h      |  2 +-
 .../dc/resource/dce60/dce60_resource.c        |  4 +-
 .../dc/resource/dce80/dce80_resource.c        |  4 +-
 .../dc/resource/dcn10/dcn10_resource.c        |  5 +-
 .../dc/resource/dcn20/dcn20_resource.c        |  6 +-
 .../dc/resource/dcn20/dcn20_resource.h        |  2 +-
 .../dc/resource/dcn21/dcn21_resource.c        |  6 +-
 .../dc/resource/dcn30/dcn30_resource.c        |  4 +-
 .../dc/resource/dcn30/dcn30_resource.h        |  2 +-
 .../dc/resource/dcn31/dcn31_resource.c        |  4 +-
 .../dc/resource/dcn31/dcn31_resource.h        |  2 +-
 .../dc/resource/dcn314/dcn314_resource.c      |  4 +-
 .../dc/resource/dcn314/dcn314_resource.h      |  2 +-
 .../dc/resource/dcn32/dcn32_resource.c        | 65 ++-----------
 .../dc/resource/dcn32/dcn32_resource.h        |  6 +-
 .../dc/resource/dcn321/dcn321_resource.c      |  3 +-
 .../dc/resource/dcn35/dcn35_resource.c        |  6 +-
 .../dc/resource/dcn351/dcn351_resource.c      |  6 +-
 .../dc/resource/dcn36/dcn36_resource.c        |  6 +-
 .../dc/resource/dcn401/dcn401_resource.c      | 49 ++--------
 .../dc/resource/dcn401/dcn401_resource.h      |  2 +-
 39 files changed, 129 insertions(+), 400 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 3f56f9a1250c..66e23507eb82 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -37,7 +37,6 @@
 #include "dc_state.h"
 #include "dc_state_priv.h"
 #include "dc_plane_priv.h"
-#include "dc_stream_priv.h"
 
 #include "gpio_service_interface.h"
 #include "clk_mgr.h"
@@ -2887,7 +2886,7 @@ static enum surface_update_type check_update_surfaces_for_stream(
 	int i;
 	enum surface_update_type overall_type = UPDATE_TYPE_FAST;
 
-	if (dc->idle_optimizations_allowed || dc_can_clear_cursor_limit(dc))
+	if (dc->idle_optimizations_allowed)
 		overall_type = UPDATE_TYPE_FULL;
 
 	if (stream_status == NULL || stream_status->plane_count != surface_count)
@@ -3291,7 +3290,7 @@ static void copy_stream_update_to_stream(struct dc *dc,
 		if (dsc_validate_context) {
 			stream->timing.dsc_cfg = *update->dsc_config;
 			stream->timing.flags.DSC = enable_dsc;
-			if (dc->res_pool->funcs->validate_bandwidth(dc, dsc_validate_context, true) != DC_OK) {
+			if (!dc->res_pool->funcs->validate_bandwidth(dc, dsc_validate_context, true)) {
 				stream->timing.dsc_cfg = old_dsc_cfg;
 				stream->timing.flags.DSC = old_dsc_enabled;
 				update->dsc_config = NULL;
@@ -4609,7 +4608,7 @@ static struct dc_state *create_minimal_transition_state(struct dc *dc,
 
 	backup_and_set_minimal_pipe_split_policy(dc, base_context, policy);
 	/* commit minimal state */
-	if (dc->res_pool->funcs->validate_bandwidth(dc, minimal_transition_context, false) == DC_OK) {
+	if (dc->res_pool->funcs->validate_bandwidth(dc, minimal_transition_context, false)) {
 		/* prevent underflow and corruption when reconfiguring pipes */
 		force_vsync_flip_in_minimal_transition_context(minimal_transition_context);
 	} else {
@@ -5129,7 +5128,7 @@ static bool update_planes_and_stream_v1(struct dc *dc,
 	copy_stream_update_to_stream(dc, context, stream, stream_update);
 
 	if (update_type >= UPDATE_TYPE_FULL) {
-		if (dc->res_pool->funcs->validate_bandwidth(dc, context, false) != DC_OK) {
+		if (!dc->res_pool->funcs->validate_bandwidth(dc, context, false)) {
 			DC_ERROR("Mode validation failed for stream update!\n");
 			dc_state_release(context);
 			return false;
@@ -6273,22 +6272,15 @@ bool dc_abm_save_restore(
 void dc_query_current_properties(struct dc *dc, struct dc_current_properties *properties)
 {
 	unsigned int i;
-	unsigned int max_cursor_size = dc->caps.max_cursor_size;
-	unsigned int stream_cursor_size;
+	bool subvp_sw_cursor_req = false;
 
-	if (dc->debug.allow_sw_cursor_fallback && dc->res_pool->funcs->get_max_hw_cursor_size) {
-		for (i = 0; i < dc->current_state->stream_count; i++) {
-			stream_cursor_size = dc->res_pool->funcs->get_max_hw_cursor_size(dc,
-					dc->current_state,
-					dc->current_state->streams[i]);
-
-			if (stream_cursor_size < max_cursor_size) {
-				max_cursor_size = stream_cursor_size;
-			}
+	for (i = 0; i < dc->current_state->stream_count; i++) {
+		if (check_subvp_sw_cursor_fallback_req(dc, dc->current_state->streams[i]) && !dc->current_state->streams[i]->hw_cursor_req) {
+			subvp_sw_cursor_req = true;
+			break;
 		}
 	}
-
-	properties->cursor_size_limit = max_cursor_size;
+	properties->cursor_size_limit = subvp_sw_cursor_req ? 64 : dc->caps.max_cursor_size;
 }
 
 /**
@@ -6354,27 +6346,3 @@ unsigned int dc_get_det_buffer_size_from_state(const struct dc_state *context)
 	else
 		return 0;
 }
-
-bool dc_is_cursor_limit_pending(struct dc *dc)
-{
-	uint32_t i;
-
-	for (i = 0; i < dc->current_state->stream_count; i++) {
-		if (dc_stream_is_cursor_limit_pending(dc, dc->current_state->streams[i]))
-			return true;
-	}
-
-	return false;
-}
-
-bool dc_can_clear_cursor_limit(struct dc *dc)
-{
-	uint32_t i;
-
-	for (i = 0; i < dc->current_state->stream_count; i++) {
-		if (dc_state_can_clear_stream_cursor_subvp_limit(dc->current_state->streams[i], dc->current_state))
-			return true;
-	}
-
-	return false;
-}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index 7551d0a3fe82..650e89825968 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -266,8 +266,6 @@ char *dc_status_to_str(enum dc_status status)
 		return "Fail dp payload allocation";
 	case DC_FAIL_DP_LINK_BANDWIDTH:
 		return "Insufficient DP link bandwidth";
-	case DC_FAIL_HW_CURSOR_SUPPORT:
-		return "HW Cursor not supported";
 	case DC_ERROR_UNEXPECTED:
 		return "Unexpected error";
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 13559fe56062..313a32248cd7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1342,6 +1342,32 @@ static void calculate_inits_and_viewports(struct pipe_ctx *pipe_ctx)
 	data->viewport_c.y += src.y / vpc_div;
 }
 
+static bool is_subvp_high_refresh_candidate(struct dc_stream_state *stream)
+{
+	uint32_t refresh_rate;
+	struct dc *dc = stream->ctx->dc;
+
+	refresh_rate = (stream->timing.pix_clk_100hz * (uint64_t)100 +
+		stream->timing.v_total * stream->timing.h_total - (uint64_t)1);
+	refresh_rate = div_u64(refresh_rate, stream->timing.v_total);
+	refresh_rate = div_u64(refresh_rate, stream->timing.h_total);
+
+	/* If there's any stream that fits the SubVP high refresh criteria,
+	 * we must return true. This is because cursor updates are asynchronous
+	 * with full updates, so we could transition into a SubVP config and
+	 * remain in HW cursor mode if there's no cursor update which will
+	 * then cause corruption.
+	 */
+	if ((refresh_rate >= 120 && refresh_rate <= 175 &&
+			stream->timing.v_addressable >= 1080 &&
+			stream->timing.v_addressable <= 2160) &&
+			(dc->current_state->stream_count > 1 ||
+			(dc->current_state->stream_count == 1 && !stream->allow_freesync)))
+		return true;
+
+	return false;
+}
+
 static enum controller_dp_test_pattern convert_dp_to_controller_test_pattern(
 				enum dp_test_pattern test_pattern)
 {
@@ -4233,11 +4259,6 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 		}
 	}
 
-	/* clear subvp cursor limitations */
-	for (i = 0; i < context->stream_count; i++) {
-		dc_state_set_stream_subvp_cursor_limit(context->streams[i], context, false);
-	}
-
 	res = dc_validate_global_state(dc, context, fast_validate);
 
 	/* calculate pixel rate divider after deciding pxiel clock & odm combine  */
@@ -4364,7 +4385,8 @@ enum dc_status dc_validate_global_state(
 	result = resource_build_scaling_params_for_context(dc, new_ctx);
 
 	if (result == DC_OK)
-		result = dc->res_pool->funcs->validate_bandwidth(dc, new_ctx, fast_validate);
+		if (!dc->res_pool->funcs->validate_bandwidth(dc, new_ctx, fast_validate))
+			result = DC_FAIL_BANDWIDTH_VALIDATE;
 
 	return result;
 }
@@ -5516,6 +5538,20 @@ enum dc_status update_dp_encoder_resources_for_test_harness(const struct dc *dc,
 	return DC_OK;
 }
 
+bool check_subvp_sw_cursor_fallback_req(const struct dc *dc, struct dc_stream_state *stream)
+{
+	if (!dc->debug.disable_subvp_high_refresh && is_subvp_high_refresh_candidate(stream))
+		return true;
+	if (dc->current_state->stream_count == 1 && stream->timing.v_addressable >= 2880 &&
+			((stream->timing.pix_clk_100hz * 100) / stream->timing.v_total / stream->timing.h_total) < 120)
+		return true;
+	else if (dc->current_state->stream_count > 1 && stream->timing.v_addressable >= 1080 &&
+			((stream->timing.pix_clk_100hz * 100) / stream->timing.v_total / stream->timing.h_total) < 120)
+		return true;
+
+	return false;
+}
+
 struct dscl_prog_data *resource_get_dscl_prog_data(struct pipe_ctx *pipe_ctx)
 {
 	return &pipe_ctx->plane_res.scl_data.dscl_prog_data;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index 8800ea512a21..1b2cce127981 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -22,7 +22,6 @@
  * Authors: AMD
  *
  */
-#include "dc_types.h"
 #include "core_types.h"
 #include "core_status.h"
 #include "dc_state.h"
@@ -813,12 +812,8 @@ enum dc_status dc_state_add_phantom_stream(const struct dc *dc,
 	if (phantom_stream_status) {
 		phantom_stream_status->mall_stream_config.type = SUBVP_PHANTOM;
 		phantom_stream_status->mall_stream_config.paired_stream = main_stream;
-		phantom_stream_status->mall_stream_config.subvp_limit_cursor_size = false;
-		phantom_stream_status->mall_stream_config.cursor_size_limit_subvp = false;
 	}
 
-	dc_state_set_stream_subvp_cursor_limit(main_stream, state, true);
-
 	return res;
 }
 
@@ -982,94 +977,3 @@ bool dc_state_is_fams2_in_use(
 
 	return is_fams2_in_use;
 }
-
-void dc_state_set_stream_subvp_cursor_limit(const struct dc_stream_state *stream,
-		struct dc_state *state,
-		bool limit)
-{
-	struct dc_stream_status *stream_status;
-
-	stream_status = dc_state_get_stream_status(state, stream);
-
-	if (stream_status) {
-		stream_status->mall_stream_config.subvp_limit_cursor_size = limit;
-	}
-}
-
-bool dc_state_get_stream_subvp_cursor_limit(const struct dc_stream_state *stream,
-		struct dc_state *state)
-{
-	bool limit = false;
-
-	struct dc_stream_status *stream_status;
-
-	stream_status = dc_state_get_stream_status(state, stream);
-
-	if (stream_status) {
-		limit = stream_status->mall_stream_config.subvp_limit_cursor_size;
-	}
-
-	return limit;
-}
-
-void dc_state_set_stream_cursor_subvp_limit(const struct dc_stream_state *stream,
-		struct dc_state *state,
-		bool limit)
-{
-	struct dc_stream_status *stream_status;
-
-	stream_status = dc_state_get_stream_status(state, stream);
-
-	if (stream_status) {
-		stream_status->mall_stream_config.cursor_size_limit_subvp = limit;
-	}
-}
-
-bool dc_state_get_stream_cursor_subvp_limit(const struct dc_stream_state *stream,
-		struct dc_state *state)
-{
-	bool limit = false;
-
-	struct dc_stream_status *stream_status;
-
-	stream_status = dc_state_get_stream_status(state, stream);
-
-	if (stream_status) {
-		limit = stream_status->mall_stream_config.cursor_size_limit_subvp;
-	}
-
-	return limit;
-}
-
-bool dc_state_can_clear_stream_cursor_subvp_limit(const struct dc_stream_state *stream,
-		struct dc_state *state)
-{
-	bool can_clear_limit = false;
-
-	struct dc_stream_status *stream_status;
-
-	stream_status = dc_state_get_stream_status(state, stream);
-
-	if (stream_status) {
-		can_clear_limit = dc_state_get_stream_cursor_subvp_limit(stream, state) &&
-				(stream_status->mall_stream_config.type == SUBVP_PHANTOM ||
-				stream->hw_cursor_req ||
-				!stream_status->mall_stream_config.subvp_limit_cursor_size ||
-				!stream->cursor_position.enable ||
-				dc_stream_check_cursor_attributes(stream, state, &stream->cursor_attributes));
-	}
-
-	return can_clear_limit;
-}
-
-bool dc_state_is_subvp_in_use(struct dc_state *state)
-{
-	uint32_t i;
-
-	for (i = 0; i < state->stream_count; i++) {
-		if (dc_state_get_stream_subvp_type(state, state->streams[i]) != SUBVP_NONE)
-			return true;
-	}
-
-	return false;
-}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index e6e41678525f..0478dd856d8c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -265,16 +265,13 @@ void program_cursor_attributes(
 }
 
 /*
- * dc_stream_check_cursor_attributes() - Check validitity of cursor attributes and surface address
+ * dc_stream_set_cursor_attributes() - Update cursor attributes and set cursor surface address
  */
-bool dc_stream_check_cursor_attributes(
-	const struct dc_stream_state *stream,
-	struct dc_state *state,
+bool dc_stream_set_cursor_attributes(
+	struct dc_stream_state *stream,
 	const struct dc_cursor_attributes *attributes)
 {
-	const struct dc *dc;
-
-	unsigned int max_cursor_size;
+	struct dc  *dc;
 
 	if (NULL == stream) {
 		dm_error("DC: dc_stream is NULL!\n");
@@ -292,36 +289,22 @@ bool dc_stream_check_cursor_attributes(
 
 	dc = stream->ctx->dc;
 
-	/* SubVP is not compatible with HW cursor larger than what can fit in cursor SRAM.
-	 * Therefore, if cursor is greater than this, fallback to SW cursor.
+	/* SubVP is not compatible with HW cursor larger than 64 x 64 x 4.
+	 * Therefore, if cursor is greater than 64 x 64 x 4, fallback to SW cursor in the following case:
+	 * 1. If the config is a candidate for SubVP high refresh (both single an dual display configs)
+	 * 2. If not subvp high refresh, for single display cases, if resolution is >= 5K and refresh rate < 120hz
+	 * 3. If not subvp high refresh, for multi display cases, if resolution is >= 4K and refresh rate < 120hz
 	 */
-	if (dc->debug.allow_sw_cursor_fallback && dc->res_pool->funcs->get_max_hw_cursor_size) {
-		max_cursor_size = dc->res_pool->funcs->get_max_hw_cursor_size(dc, state, stream);
-		max_cursor_size = max_cursor_size * max_cursor_size * 4;
-
-		if (attributes->height * attributes->width * 4 > max_cursor_size) {
+	if (dc->debug.allow_sw_cursor_fallback &&
+		attributes->height * attributes->width * 4 > 16384 &&
+		!stream->hw_cursor_req) {
+		if (check_subvp_sw_cursor_fallback_req(dc, stream))
 			return false;
-		}
 	}
 
-	return true;
-}
-
-/*
- * dc_stream_set_cursor_attributes() - Update cursor attributes and set cursor surface address
- */
-bool dc_stream_set_cursor_attributes(
-	struct dc_stream_state *stream,
-	const struct dc_cursor_attributes *attributes)
-{
-	bool result = false;
-
-	if (dc_stream_check_cursor_attributes(stream, stream->ctx->dc->current_state, attributes)) {
-		stream->cursor_attributes = *attributes;
-		result = true;
-	}
+	stream->cursor_attributes = *attributes;
 
-	return result;
+	return true;
 }
 
 bool dc_stream_program_cursor_attributes(
@@ -1126,26 +1109,3 @@ unsigned int dc_stream_get_max_flickerless_instant_vtotal_increase(struct dc_str
 
 	return dc_stream_get_max_flickerless_instant_vtotal_delta(stream, is_gaming, false);
 }
-
-bool dc_stream_is_cursor_limit_pending(struct dc *dc, struct dc_stream_state *stream)
-{
-	bool is_limit_pending = false;
-
-	if (dc->current_state)
-		is_limit_pending = dc_state_get_stream_cursor_subvp_limit(stream, dc->current_state);
-
-	return is_limit_pending;
-}
-
-bool dc_stream_can_clear_cursor_limit(struct dc *dc, struct dc_stream_state *stream)
-{
-	bool can_clear_limit = false;
-
-	if (dc->current_state)
-		can_clear_limit = dc_state_get_stream_cursor_subvp_limit(stream, dc->current_state) &&
-				(stream->hw_cursor_req ||
-				!stream->cursor_position.enable ||
-				dc_stream_check_cursor_attributes(stream, dc->current_state, &stream->cursor_attributes));
-
-	return can_clear_limit;
-}
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index a9bd84469821..ca879f27b0dd 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -249,7 +249,6 @@ struct dc_caps {
 	uint32_t i2c_speed_in_khz_hdcp;
 	uint32_t dmdata_alloc_size;
 	unsigned int max_cursor_size;
-	unsigned int max_buffered_cursor_size;
 	unsigned int max_video_width;
 	/*
 	 * max video plane width that can be safely assumed to be always
@@ -2608,7 +2607,4 @@ void dc_disable_accelerated_mode(struct dc *dc);
 bool dc_is_timing_changed(struct dc_stream_state *cur_stream,
 		       struct dc_stream_state *new_stream);
 
-bool dc_is_cursor_limit_pending(struct dc *dc);
-bool dc_can_clear_cursor_limit(struct dc *dc);
-
 #endif /* DC_INTERFACE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_state_priv.h b/drivers/gpu/drm/amd/display/dc/dc_state_priv.h
index 1d9bae56ff6a..1a12ef579ff4 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_state_priv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_state_priv.h
@@ -105,24 +105,4 @@ bool dc_state_is_fams2_in_use(
 		const struct dc *dc,
 		const struct dc_state *state);
 
-
-void dc_state_set_stream_subvp_cursor_limit(const struct dc_stream_state *stream,
-		struct dc_state *state,
-		bool limit);
-
-bool dc_state_get_stream_subvp_cursor_limit(const struct dc_stream_state *stream,
-		struct dc_state *state);
-
-void dc_state_set_stream_cursor_subvp_limit(const struct dc_stream_state *stream,
-		struct dc_state *state,
-		bool limit);
-
-bool dc_state_get_stream_cursor_subvp_limit(const struct dc_stream_state *stream,
-		struct dc_state *state);
-
-bool dc_state_can_clear_stream_cursor_subvp_limit(const struct dc_stream_state *stream,
-		struct dc_state *state);
-
-bool dc_state_is_subvp_in_use(struct dc_state *state);
-
 #endif /* _DC_STATE_PRIV_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 341d2ffb64b1..6a6c92da5848 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -44,8 +44,6 @@ struct mall_stream_config {
 	 */
 	enum mall_stream_type type;
 	struct dc_stream_state *paired_stream;	// master / slave stream
-	bool subvp_limit_cursor_size; /* stream has/is using subvp limiting hw cursor support */
-	bool cursor_size_limit_subvp; /* stream is using hw cursor config preventing subvp */
 };
 
 struct dc_stream_status {
@@ -505,11 +503,6 @@ void program_cursor_position(
 	struct dc *dc,
 	struct dc_stream_state *stream);
 
-bool dc_stream_check_cursor_attributes(
-	const struct dc_stream_state *stream,
-	struct dc_state *state,
-	const struct dc_cursor_attributes *attributes);
-
 bool dc_stream_set_cursor_attributes(
 	struct dc_stream_state *stream,
 	const struct dc_cursor_attributes *attributes);
@@ -587,7 +580,4 @@ void dc_dmub_update_dirty_rect(struct dc *dc,
 			       struct dc_surface_update *srf_updates,
 			       struct dc_state *context);
 
-bool dc_stream_is_cursor_limit_pending(struct dc *dc, struct dc_stream_state *stream);
-bool dc_stream_can_clear_cursor_limit(struct dc *dc, struct dc_stream_state *stream);
-
 #endif /* DC_STREAM_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index b0fc1fd20208..56dda686e299 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -627,7 +627,6 @@ static bool dcn32_assign_subvp_pipe(struct dc *dc,
 		 */
 		if (pipe->plane_state && !pipe->top_pipe && !pipe->prev_odm_pipe && !dcn32_is_center_timing(pipe) &&
 				!pipe->stream->hw_cursor_req &&
-				!dc_state_get_stream_cursor_subvp_limit(pipe->stream, context) &&
 				!(pipe->stream->timing.pix_clk_100hz / 10000 > DCN3_2_MAX_SUBVP_PIXEL_RATE_MHZ) &&
 				(!dcn32_is_psr_capable(pipe) || (context->stream_count == 1 && dc->caps.dmub_caps.subvp_psr)) &&
 				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_NONE &&
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index ed75319a07d5..f721aabdd470 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -526,8 +526,7 @@ static void populate_dml21_output_config_from_stream_state(struct dml2_link_outp
 
 static void populate_dml21_stream_overrides_from_stream_state(
 		struct dml2_stream_parameters *stream_desc,
-		struct dc_stream_state *stream,
-		struct dc_stream_status *stream_status)
+		struct dc_stream_state *stream)
 {
 	switch (stream->debug.force_odm_combine_segments) {
 	case 0:
@@ -552,9 +551,7 @@ static void populate_dml21_stream_overrides_from_stream_state(
 	if (!stream->ctx->dc->debug.enable_single_display_2to1_odm_policy ||
 			stream->debug.force_odm_combine_segments > 0)
 		stream_desc->overrides.disable_dynamic_odm = true;
-	stream_desc->overrides.disable_subvp = stream->ctx->dc->debug.force_disable_subvp ||
-			stream->hw_cursor_req ||
-			stream_status->mall_stream_config.cursor_size_limit_subvp;
+	stream_desc->overrides.disable_subvp = stream->ctx->dc->debug.force_disable_subvp || stream->hw_cursor_req;
 }
 
 static enum dml2_swizzle_mode gfx_addr3_to_dml2_swizzle_mode(enum swizzle_mode_addr3_values addr3_mode)
@@ -1027,7 +1024,7 @@ bool dml21_map_dc_state_into_dml_display_cfg(const struct dc *in_dc, struct dc_s
 		populate_dml21_timing_config_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location].timing, context->streams[stream_index], dml_ctx);
 		adjust_dml21_hblank_timing_config_from_pipe_ctx(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location].timing, &context->res_ctx.pipe_ctx[stream_index]);
 		populate_dml21_output_config_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location].output, context->streams[stream_index], &context->res_ctx.pipe_ctx[stream_index]);
-		populate_dml21_stream_overrides_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location], context->streams[stream_index], &context->stream_status[stream_index]);
+		populate_dml21_stream_overrides_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location], context->streams[stream_index]);
 
 		dml_dispcfg->stream_descriptors[disp_cfg_stream_location].overrides.hw.twait_budgeting.fclk_pstate = dml2_twait_budgeting_setting_if_needed;
 		dml_dispcfg->stream_descriptors[disp_cfg_stream_location].overrides.hw.twait_budgeting.uclk_pstate = dml2_twait_budgeting_setting_if_needed;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 5e78b553adbd..846c9c51f2d9 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -2482,7 +2482,7 @@ bool dcn20_update_bandwidth(
 	struct dce_hwseq *hws = dc->hwseq;
 
 	/* recalculate DML parameters */
-	if (dc->res_pool->funcs->validate_bandwidth(dc, context, false) != DC_OK)
+	if (!dc->res_pool->funcs->validate_bandwidth(dc, context, false))
 		return false;
 
 	/* apply updated bandwidth parameters */
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index ae7194da5987..e9811ef0cf9a 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -2651,7 +2651,7 @@ bool dcn401_update_bandwidth(
 	struct dce_hwseq *hws = dc->hwseq;
 
 	/* recalculate DML parameters */
-	if (dc->res_pool->funcs->validate_bandwidth(dc, context, false) != DC_OK)
+	if (!dc->res_pool->funcs->validate_bandwidth(dc, context, false))
 		return false;
 
 	/* apply updated bandwidth parameters */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_status.h b/drivers/gpu/drm/amd/display/dc/inc/core_status.h
index f3696143590c..b5afd8c3103d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_status.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_status.h
@@ -26,8 +26,6 @@
 #ifndef _CORE_STATUS_H_
 #define _CORE_STATUS_H_
 
-#include "dc_hw_types.h"
-
 enum dc_status {
 	DC_OK = 1,
 
@@ -58,7 +56,6 @@ enum dc_status {
 	DC_NO_LINK_ENC_RESOURCE = 26,
 	DC_FAIL_DP_PAYLOAD_ALLOCATION = 27,
 	DC_FAIL_DP_LINK_BANDWIDTH = 28,
-	DC_FAIL_HW_CURSOR_SUPPORT = 29,
 	DC_ERROR_UNEXPECTED = -1
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index bae98d994275..749ba5f24aca 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -78,8 +78,7 @@ struct resource_funcs {
 	/* Create a minimal link encoder object with no dc_link object
 	 * associated with it. */
 	struct link_encoder *(*link_enc_create_minimal)(struct dc_context *ctx, enum engine_id eng_id);
-
-	enum dc_status (*validate_bandwidth)(
+	bool (*validate_bandwidth)(
 					struct dc *dc,
 					struct dc_state *context,
 					bool fast_validate);
@@ -218,9 +217,6 @@ struct resource_funcs {
 	int (*get_power_profile)(const struct dc_state *context);
 	unsigned int (*get_det_buffer_size)(const struct dc_state *context);
 	unsigned int (*get_vstartup_for_pipe)(struct pipe_ctx *pipe_ctx);
-	unsigned int (*get_max_hw_cursor_size)(const struct dc *dc,
-			struct dc_state *state,
-			const struct dc_stream_state *stream);
 };
 
 struct audio_support{
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index 7a87a7c07c1b..9458187b834d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -628,6 +628,8 @@ enum dc_status update_dp_encoder_resources_for_test_harness(const struct dc *dc,
 		struct dc_state *context,
 		struct pipe_ctx *pipe_ctx);
 
+bool check_subvp_sw_cursor_fallback_req(const struct dc *dc, struct dc_stream_state *stream);
+
 /* Get hw programming parameters container from pipe context
  * @pipe_ctx: pipe context
  * @dscl_prog_data: struct to hold programmable hw reg values
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
index 84f73fdb0f95..e0c64861eff3 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
@@ -836,7 +836,7 @@ static enum dc_status build_mapped_resource(
 	return DC_OK;
 }
 
-static enum dc_status dce100_validate_bandwidth(
+static bool dce100_validate_bandwidth(
 	struct dc  *dc,
 	struct dc_state *context,
 	bool fast_validate)
@@ -858,7 +858,7 @@ static enum dc_status dce100_validate_bandwidth(
 		context->bw_ctx.bw.dce.yclk_khz = 0;
 	}
 
-	return DC_OK;
+	return true;
 }
 
 static bool dce100_validate_surface_sets(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c
index f3d5baac11bf..035c6cfdaee5 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c
@@ -960,7 +960,7 @@ static enum dc_status build_mapped_resource(
 	return DC_OK;
 }
 
-static enum dc_status dce110_validate_bandwidth(
+static bool dce110_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
 	bool fast_validate)
@@ -1031,7 +1031,7 @@ static enum dc_status dce110_validate_bandwidth(
 			context->bw_ctx.bw.dce.yclk_khz,
 			context->bw_ctx.bw.dce.blackout_recovery_time_us);
 	}
-	return result ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return result;
 }
 
 static enum dc_status dce110_validate_plane(const struct dc_plane_state *plane_state,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
index 4225cae68c10..480a50967385 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
@@ -883,7 +883,7 @@ static enum dc_status build_mapped_resource(
 	return DC_OK;
 }
 
-enum dc_status dce112_validate_bandwidth(
+bool dce112_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
 	bool fast_validate)
@@ -952,7 +952,7 @@ enum dc_status dce112_validate_bandwidth(
 			context->bw_ctx.bw.dce.yclk_khz,
 			context->bw_ctx.bw.dce.blackout_recovery_time_us);
 	}
-	return result ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return result;
 }
 
 enum dc_status resource_map_phy_clock_resources(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.h
index 6221d749246d..1f57ebc6f9b4 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.h
@@ -42,7 +42,7 @@ enum dc_status dce112_validate_with_context(
 		struct dc_state *context,
 		struct dc_state *old_context);
 
-enum dc_status dce112_validate_bandwidth(
+bool dce112_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
 	bool fast_validate);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c
index d9ffdded5ce1..737c1b1d861a 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c
@@ -863,7 +863,7 @@ static void dce60_resource_destruct(struct dce110_resource_pool *pool)
 	}
 }
 
-static enum dc_status dce60_validate_bandwidth(
+static bool dce60_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
 	bool fast_validate)
@@ -885,7 +885,7 @@ static enum dc_status dce60_validate_bandwidth(
 		context->bw_ctx.bw.dce.yclk_khz = 0;
 	}
 
-	return DC_OK;
+	return true;
 }
 
 static bool dce60_validate_surface_sets(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
index bd5811f97531..3d5113f010bb 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
@@ -869,7 +869,7 @@ static void dce80_resource_destruct(struct dce110_resource_pool *pool)
 	}
 }
 
-static enum dc_status dce80_validate_bandwidth(
+static bool dce80_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
 	bool fast_validate)
@@ -891,7 +891,7 @@ static enum dc_status dce80_validate_bandwidth(
 		context->bw_ctx.bw.dce.yclk_khz = 0;
 	}
 
-	return DC_OK;
+	return true;
 }
 
 static bool dce80_validate_surface_sets(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
index 9d8ecc6229d9..e92f14d50adb 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
@@ -23,7 +23,6 @@
  *
  */
 
-#include "core_status.h"
 #include "dm_services.h"
 #include "dc.h"
 
@@ -1126,7 +1125,7 @@ static void dcn10_destroy_resource_pool(struct resource_pool **pool)
 	*pool = NULL;
 }
 
-static enum dc_status dcn10_validate_bandwidth(
+static bool dcn10_validate_bandwidth(
 		struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
@@ -1137,7 +1136,7 @@ static enum dc_status dcn10_validate_bandwidth(
 	voltage_supported = dcn_validate_bandwidth(dc, context, fast_validate);
 	DC_FP_END();
 
-	return voltage_supported ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return voltage_supported;
 }
 
 static enum dc_status dcn10_validate_plane(const struct dc_plane_state *plane_state, struct dc_caps *caps)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
index 3405be07f5e3..e4eca3e32c1b 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
@@ -2124,7 +2124,7 @@ bool dcn20_fast_validate_bw(
 	return out;
 }
 
-enum dc_status dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context,
+bool dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context,
 		bool fast_validate)
 {
 	bool voltage_supported;
@@ -2132,14 +2132,14 @@ enum dc_status dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context,
 
 	pipes = kcalloc(dc->res_pool->pipe_count, sizeof(display_e2e_pipe_params_st), GFP_KERNEL);
 	if (!pipes)
-		return DC_FAIL_BANDWIDTH_VALIDATE;
+		return false;
 
 	DC_FP_START();
 	voltage_supported = dcn20_validate_bandwidth_fp(dc, context, fast_validate, pipes);
 	DC_FP_END();
 
 	kfree(pipes);
-	return voltage_supported ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return voltage_supported;
 }
 
 struct pipe_ctx *dcn20_acquire_free_pipe_for_layer(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.h
index c0e062c7407d..4cee3fa11a7f 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.h
@@ -119,7 +119,7 @@ void dcn20_set_mcif_arb_params(
 		struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
 		int pipe_cnt);
-enum dc_status dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context, bool fast_validate);
+bool dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context, bool fast_validate);
 void dcn20_merge_pipes_for_validate(
 		struct dc *dc,
 		struct dc_state *context);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
index 9ab01b65b177..4bd5c2278596 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
@@ -923,7 +923,7 @@ bool dcn21_fast_validate_bw(struct dc *dc,
  * with DC_FP_START()/DC_FP_END(). Use the same approach as for
  * dcn20_validate_bandwidth in dcn20_resource.c.
  */
-static enum dc_status dcn21_validate_bandwidth(struct dc *dc, struct dc_state *context,
+static bool dcn21_validate_bandwidth(struct dc *dc, struct dc_state *context,
 		bool fast_validate)
 {
 	bool voltage_supported;
@@ -931,14 +931,14 @@ static enum dc_status dcn21_validate_bandwidth(struct dc *dc, struct dc_state *c
 
 	pipes = kcalloc(dc->res_pool->pipe_count, sizeof(display_e2e_pipe_params_st), GFP_KERNEL);
 	if (!pipes)
-		return DC_FAIL_BANDWIDTH_VALIDATE;
+		return false;
 
 	DC_FP_START();
 	voltage_supported = dcn21_validate_bandwidth_fp(dc, context, fast_validate, pipes);
 	DC_FP_END();
 
 	kfree(pipes);
-	return voltage_supported ? DC_OK : DC_NOT_SUPPORTED;
+	return voltage_supported;
 }
 
 static void dcn21_destroy_resource_pool(struct resource_pool **pool)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
index f631ae34e320..f040c22db59b 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
@@ -2035,7 +2035,7 @@ void dcn30_calculate_wm_and_dlg(
 	DC_FP_END();
 }
 
-enum dc_status dcn30_validate_bandwidth(struct dc *dc,
+bool dcn30_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
 {
@@ -2092,7 +2092,7 @@ enum dc_status dcn30_validate_bandwidth(struct dc *dc,
 
 	BW_VAL_TRACE_FINISH();
 
-	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return out;
 }
 
 void dcn30_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.h
index 689d9bdace81..8e6b8b7368fd 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.h
@@ -56,7 +56,7 @@ unsigned int dcn30_calc_max_scaled_time(
 		enum mmhubbub_wbif_mode mode,
 		unsigned int urgent_watermark);
 
-enum dc_status dcn30_validate_bandwidth(struct dc *dc, struct dc_state *context,
+bool dcn30_validate_bandwidth(struct dc *dc, struct dc_state *context,
 		bool fast_validate);
 bool dcn30_internal_validate_bw(
 		struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index 7e0af5297dc4..dddddbfef85f 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1758,7 +1758,7 @@ dcn31_set_mcif_arb_params(struct dc *dc,
 	DC_FP_END();
 }
 
-enum dc_status dcn31_validate_bandwidth(struct dc *dc,
+bool dcn31_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
 {
@@ -1813,7 +1813,7 @@ enum dc_status dcn31_validate_bandwidth(struct dc *dc,
 
 	BW_VAL_TRACE_FINISH();
 
-	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return out;
 }
 
 static void dcn31_get_panel_config_defaults(struct dc_panel_config *panel_config)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h
index dd82815d7efe..551ad912f7be 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h
@@ -37,7 +37,7 @@ struct dcn31_resource_pool {
 	struct resource_pool base;
 };
 
-enum dc_status dcn31_validate_bandwidth(struct dc *dc,
+bool dcn31_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate);
 void dcn31_calculate_wm_and_dlg(
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index d96bc6cb73ad..26becc4cb804 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -1694,7 +1694,7 @@ static void dcn314_get_panel_config_defaults(struct dc_panel_config *panel_confi
 	*panel_config = panel_config_defaults;
 }
 
-enum dc_status dcn314_validate_bandwidth(struct dc *dc,
+bool dcn314_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
 {
@@ -1750,7 +1750,7 @@ enum dc_status dcn314_validate_bandwidth(struct dc *dc,
 
 	BW_VAL_TRACE_FINISH();
 
-	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return out;
 }
 
 static struct resource_funcs dcn314_res_pool_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.h
index f8ba531d6342..49ffe71018df 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.h
@@ -39,7 +39,7 @@ struct dcn314_resource_pool {
 	struct resource_pool base;
 };
 
-enum dc_status dcn314_validate_bandwidth(struct dc *dc,
+bool dcn314_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate);
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 6dda862b47e3..2a59cc61ed8c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -24,7 +24,6 @@
  *
  */
 
-#include "dc_types.h"
 #include "dm_services.h"
 #include "dc.h"
 
@@ -1807,56 +1806,19 @@ static bool dml1_validate(struct dc *dc, struct dc_state *context, bool fast_val
 	return out;
 }
 
-enum dc_status dcn32_validate_bandwidth(struct dc *dc,
+bool dcn32_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
 {
-	unsigned int i;
-	enum dc_status status;
-	const struct dc_stream_state *stream;
-
-	/* reset cursor limitations on subvp */
-	for (i = 0; i < context->stream_count; i++) {
-		stream = context->streams[i];
-
-		if (dc_state_can_clear_stream_cursor_subvp_limit(stream, context)) {
-			dc_state_set_stream_cursor_subvp_limit(stream, context, false);
-		}
-	}
+	bool out = false;
 
 	if (dc->debug.using_dml2)
-		status = dml2_validate(dc, context,
+		out = dml2_validate(dc, context,
 				context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-				fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+				fast_validate);
 	else
-		status = dml1_validate(dc, context, fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
-
-	if (!fast_validate && status == DC_OK && dc_state_is_subvp_in_use(context)) {
-		/* check new stream configuration still supports cursor if subvp used */
-		for (i = 0; i < context->stream_count; i++) {
-			stream = context->streams[i];
-
-			if (dc_state_get_stream_subvp_type(context, stream) != SUBVP_PHANTOM &&
-					stream->cursor_position.enable &&
-					!dc_stream_check_cursor_attributes(stream, context, &stream->cursor_attributes)) {
-				/* hw cursor cannot be supported with subvp active, so disable subvp for now */
-				dc_state_set_stream_cursor_subvp_limit(stream, context, true);
-				status = DC_FAIL_HW_CURSOR_SUPPORT;
-			}
-		};
-	}
-
-	if (!fast_validate && status == DC_FAIL_HW_CURSOR_SUPPORT) {
-		/* attempt to validate again with subvp disabled due to cursor */
-		if (dc->debug.using_dml2)
-			status = dml2_validate(dc, context,
-					context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-					fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
-		else
-			status = dml1_validate(dc, context, fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
-	}
-
-	return status;
+		out = dml1_validate(dc, context, fast_validate);
+	return out;
 }
 
 int dcn32_populate_dml_pipes_from_context(
@@ -2080,18 +2042,6 @@ static void dcn32_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw
 	DC_FP_END();
 }
 
-unsigned int dcn32_get_max_hw_cursor_size(const struct dc *dc,
-			struct dc_state *state,
-			const struct dc_stream_state *stream)
-{
-	bool limit_cur_to_buf;
-
-	limit_cur_to_buf = dc_state_get_stream_subvp_cursor_limit(stream, state) &&
-			!stream->hw_cursor_req;
-
-	return limit_cur_to_buf ? dc->caps.max_buffered_cursor_size : dc->caps.max_cursor_size;
-}
-
 static struct resource_funcs dcn32_res_pool_funcs = {
 	.destroy = dcn32_destroy_resource_pool,
 	.link_enc_create = dcn32_link_encoder_create,
@@ -2117,8 +2067,7 @@ static struct resource_funcs dcn32_res_pool_funcs = {
 	.add_phantom_pipes = dcn32_add_phantom_pipes,
 	.build_pipe_pix_clk_params = dcn20_build_pipe_pix_clk_params,
 	.calculate_mall_ways_from_bytes = dcn32_calculate_mall_ways_from_bytes,
-	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe,
-	.get_max_hw_cursor_size = dcn32_get_max_hw_cursor_size,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static uint32_t read_pipe_fuses(struct dc_context *ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
index d60ed77eda80..1aa4ced29291 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
@@ -98,7 +98,7 @@ void dcn32_add_phantom_pipes(struct dc *dc,
 		unsigned int pipe_cnt,
 		unsigned int index);
 
-enum dc_status dcn32_validate_bandwidth(struct dc *dc,
+bool dcn32_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate);
 
@@ -188,10 +188,6 @@ void dcn32_override_min_req_dcfclk(struct dc *dc, struct dc_state *context);
 
 unsigned int dcn32_calculate_mall_ways_from_bytes(const struct dc *dc, unsigned int total_size_in_mall_bytes);
 
-unsigned int dcn32_get_max_hw_cursor_size(const struct dc *dc,
-			struct dc_state *state,
-			const struct dc_stream_state *stream);
-
 /* definitions for run time init of reg offsets */
 
 /* CLK SRC */
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 3b91b7379cf3..38d76434683e 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1624,8 +1624,7 @@ static struct resource_funcs dcn321_res_pool_funcs = {
 	.add_phantom_pipes = dcn32_add_phantom_pipes,
 	.build_pipe_pix_clk_params = dcn20_build_pipe_pix_clk_params,
 	.calculate_mall_ways_from_bytes = dcn32_calculate_mall_ways_from_bytes,
-	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe,
-	.get_max_hw_cursor_size = dcn32_get_max_hw_cursor_size,
+	.get_vstartup_for_pipe = dcn10_get_vstartup_for_pipe
 };
 
 static uint32_t read_pipe_fuses(struct dc_context *ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 72c6cf047db0..8948d44a7a80 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1732,7 +1732,7 @@ static void dcn35_get_panel_config_defaults(struct dc_panel_config *panel_config
 }
 
 
-static enum dc_status dcn35_validate_bandwidth(struct dc *dc,
+static bool dcn35_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
 {
@@ -1743,13 +1743,13 @@ static enum dc_status dcn35_validate_bandwidth(struct dc *dc,
 			fast_validate);
 
 	if (fast_validate)
-		return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+		return out;
 
 	DC_FP_START();
 	dcn35_decide_zstate_support(dc, context);
 	DC_FP_END();
 
-	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return out;
 }
 
 enum dc_status dcn35_patch_unknown_plane_state(struct dc_plane_state *plane_state)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 989a270f7dea..98f5bc1b929e 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1712,7 +1712,7 @@ static void dcn35_get_panel_config_defaults(struct dc_panel_config *panel_config
 }
 
 
-static enum dc_status dcn351_validate_bandwidth(struct dc *dc,
+static bool dcn351_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
 {
@@ -1723,13 +1723,13 @@ static enum dc_status dcn351_validate_bandwidth(struct dc *dc,
 			fast_validate);
 
 	if (fast_validate)
-		return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+		return out;
 
 	DC_FP_START();
 	dcn35_decide_zstate_support(dc, context);
 	DC_FP_END();
 
-	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return out;
 }
 
 static struct resource_funcs dcn351_res_pool_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
index 48e1f234185f..7f19689e976a 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
@@ -1713,7 +1713,7 @@ static void dcn35_get_panel_config_defaults(struct dc_panel_config *panel_config
 }
 
 
-static enum dc_status dcn35_validate_bandwidth(struct dc *dc,
+static bool dcn35_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
 {
@@ -1724,13 +1724,13 @@ static enum dc_status dcn35_validate_bandwidth(struct dc *dc,
 			fast_validate);
 
 	if (fast_validate)
-		return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+		return out;
 
 	DC_FP_START();
 	dcn35_decide_zstate_support(dc, context);
 	DC_FP_END();
 
-	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+	return out;
 }
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 5b7148bb1701..7436dfbdf927 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1642,52 +1642,16 @@ enum dc_status dcn401_patch_unknown_plane_state(struct dc_plane_state *plane_sta
 	return DC_OK;
 }
 
-enum dc_status dcn401_validate_bandwidth(struct dc *dc,
+bool dcn401_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
 {
-	unsigned int i;
-	enum dc_status status = DC_OK;
-	const struct dc_stream_state *stream;
-
-	/* reset cursor limitations on subvp */
-	for (i = 0; i < context->stream_count; i++) {
-		stream = context->streams[i];
-
-		if (dc_state_can_clear_stream_cursor_subvp_limit(stream, context)) {
-			dc_state_set_stream_cursor_subvp_limit(stream, context, false);
-		}
-	}
-
+	bool out = false;
 	if (dc->debug.using_dml2)
-		status = dml2_validate(dc, context,
+		out = dml2_validate(dc, context,
 				context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-				fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
-
-	if (!fast_validate && status == DC_OK && dc_state_is_subvp_in_use(context)) {
-		/* check new stream configuration still supports cursor if subvp used */
-		for (i = 0; i < context->stream_count; i++) {
-			stream = context->streams[i];
-
-			if (dc_state_get_stream_subvp_type(context, stream) != SUBVP_PHANTOM &&
-					stream->cursor_position.enable &&
-					!dc_stream_check_cursor_attributes(stream, context, &stream->cursor_attributes))	{
-				/* hw cursor cannot be supported with subvp active, so disable subvp for now */
-				dc_state_set_stream_cursor_subvp_limit(stream, context, true);
-				status = DC_FAIL_HW_CURSOR_SUPPORT;
-			}
-		};
-	}
-
-	if (!fast_validate && status == DC_FAIL_HW_CURSOR_SUPPORT) {
-		/* attempt to validate again with subvp disabled due to cursor */
-		if (dc->debug.using_dml2)
-			status = dml2_validate(dc, context,
-					context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-					fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
-	}
-
-	return status;
+				fast_validate);
+	return out;
 }
 
 void dcn401_prepare_mcache_programming(struct dc *dc,
@@ -1806,8 +1770,7 @@ static struct resource_funcs dcn401_res_pool_funcs = {
 	.build_pipe_pix_clk_params = dcn401_build_pipe_pix_clk_params,
 	.calculate_mall_ways_from_bytes = dcn32_calculate_mall_ways_from_bytes,
 	.get_power_profile = dcn401_get_power_profile,
-	.get_vstartup_for_pipe = dcn401_get_vstartup_for_pipe,
-	.get_max_hw_cursor_size = dcn32_get_max_hw_cursor_size
+	.get_vstartup_for_pipe = dcn401_get_vstartup_for_pipe
 };
 
 static uint32_t read_pipe_fuses(struct dc_context *ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
index dc52a30991af..4c259745d519 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
@@ -22,7 +22,7 @@ struct resource_pool *dcn401_create_resource_pool(
 
 enum dc_status dcn401_patch_unknown_plane_state(struct dc_plane_state *plane_state);
 
-enum dc_status dcn401_validate_bandwidth(struct dc *dc,
+bool dcn401_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate);
 
-- 
2.43.0


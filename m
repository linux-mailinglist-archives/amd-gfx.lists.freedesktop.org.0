Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579D49363F
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jan 2022 09:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A203C10E672;
	Wed, 19 Jan 2022 08:25:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDC510E672
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jan 2022 08:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0OAqgViJlnBI+GHKL12eWacnbT0yNBo93V4zj87c53JlzJDRzERHot1uZFQGSpbIc7lDvoypnN7d7/bQ9uSkDziJn/fbHyd/gfQasIeVvYIuJoG7nfs246Zs8HlvzrG09qyAMCEmPBmMVh0/grnskhAAdybKC3FBwENguVaptA5efJAusUXNpP+Uqmp2hUqthjx4a6PN/7/WNm+fVBMnCVxlO0tlmlgSXMnob+S1ccCJQ0VghWnkj76khdKTkjlbGCBaDTs5B8CFp8QZLeSMoexbExBmN7aZUiWBJLEL54KUXzznYrPKZGhXnj+/6u8ecCkWAQD6PFOFtlF37vGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyqM5aVj5g0ZkAAWyJ57v5GtWcEb8aH1QVfFOxlnIJo=;
 b=Zd/Ck4jTX+0LInQ+2z3kMr8Cb/i0TAxdojrSWhpu9oSQtc1TxCfbiwMoqZlf5Sm6K0KRKREPzL/2eDXT/mej77/MFOPF7gH8BL5pwrwhDfJi4zRX0apI3iLer6YzuzOoomC5cC/cMPbHXUJlVnpK8CFJdRvV+GAdaRzYLXQrC4T47jCSfjEp/rh/hNL8rJ10OGfGr7ubRNbPouVm0UaMzhECEg4MuhiJoAzAwX8Dh9HMlDg8Q84O1ahYMGr+nfNytp9Rcxr/Wp8p2d2OfeYgNc3Ct/2Fv3htEZXHE/rADlSTHnUBSYzyqcI29Ucf0XK8v8RMLLLpRBmOCzOD0d1ffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyqM5aVj5g0ZkAAWyJ57v5GtWcEb8aH1QVfFOxlnIJo=;
 b=WoUQ61uHUno2b/z9lxLt5EnKiLREn2IxYGyaaiSxzqYrz6wRLov4Ja5z5Ms+QD0aatuIXPLuv+ZLyFWaKs3kcpLF5FJZJZoQOJHq7aXogxeGXrMTP7WEswKnbTHLTFwjYy6nNGnghL9FmbbdiUhkLAmwls/xc3Dzm8yRD6K97XE=
Received: from BN9PR03CA0040.namprd03.prod.outlook.com (2603:10b6:408:fb::15)
 by BYAPR12MB3062.namprd12.prod.outlook.com (2603:10b6:a03:aa::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 08:25:07 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::ac) by BN9PR03CA0040.outlook.office365.com
 (2603:10b6:408:fb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Wed, 19 Jan 2022 08:25:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 08:25:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 02:25:06 -0600
Received: from wayne-Celadon-CZN.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18
 via Frontend Transport; Wed, 19 Jan 2022 02:25:02 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/8] drm/amd/display: factor out dp detection link training
 and mst top detection
Date: Wed, 19 Jan 2022 16:24:36 +0800
Message-ID: <20220119082443.1046810-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119082443.1046810-1-Wayne.Lin@amd.com>
References: <20220119082443.1046810-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef0ba7af-a611-42be-9f8f-08d9db253352
X-MS-TrafficTypeDiagnostic: BYAPR12MB3062:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3062E99981932F8969C2035DFC599@BYAPR12MB3062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GsYcuIe9TIKUaVpqFHFsXP0nQF6wEfdXzqR+RV0wQB9h4smYcARZ+TPSkas/9Q3doSxJkn9pBO665kRvLQqUbIqVuOgNueVmouvEe5ZEDlyLY4C5BHJCjwOn5sbU96PCt0kcFQLJpZCXQSqarDDL4G0saYlthJgdOeJ3RoCT7g0Dycg6K44XNt59kTiauKsPfja/WJVa6xx88v7dKULUSOBJxHQng/9yVvJIaVpjoLGVQ+G9MPC0IR+uQbaI/0KtrqhL63Ww3hPtKAy+P9EzYRu83gEzMA6MTkXnHAD7lia0uJvNwiIBprTClY5TAOgS058YocSgFqOs4IDzdMgg6Uu9tZgvWSWkuiNn6EDRYIbVlzbDEF0EMlIPSMdGrBxpR1NE0rb19BUYliXHhm44m1f946OZEKyH2KMFk2zk8cCFDoOaX23OgW7A79zW+wiwEKQmJUYhzbBgCSqsYtT3grBbp0g7aMKPhRSPYw2oJx8zHKMOdkkHChDedovf7c+dEJm7CuGg8eFT4YSXnrr1kq8fzYYoKvNCYox2kT6KPEBqYJeSDTvv6j8c4dlGR10QwZ6aFTbMiBOarr7Yo0R03OyDu1sXGJULVLYsg8wpaKyuh+zxqsr+pPacce2A9WuETaK04K4k9dJo69FUQOqAMS1NBWNb6ho+GI//t4IUGTvxvB7pjmjfOZd50fR/3jqROA8RVdjNaSba2ZLBgQAw04ZpqUc5eNIADxwlCpWbilE3jIndfOXVkuKjmvH4TOPWZX3RRmcgEZAuUyzY4WeqqSEtS0vyEZIL16+52sQVf8k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(81166007)(70586007)(8936002)(26005)(1076003)(336012)(316002)(4326008)(186003)(2616005)(86362001)(30864003)(47076005)(36756003)(82310400004)(7696005)(6666004)(2906002)(5660300002)(54906003)(6916009)(83380400001)(356005)(8676002)(40460700001)(70206006)(508600001)(36860700001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:25:07.0492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0ba7af-a611-42be-9f8f-08d9db253352
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3062
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
Cc: stylon.wang@amd.com, Chris Park <Chris.Park@amd.com>, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, Wenjing Liu <wenjing.liu@amd.com>, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[why]
dc_link_detect_helper has multiple purpose:
1. Detect link and local sink.
2. Verify link capability by performing detection link training.
3. Start mst topology discovery and if succeeded fails the current interface.

This is difficult to maintain as item 2 has become more destructive to current
dc state. The change is to decouple these sequences to its own functions.
Eventually only item 2 is a destructive method and we will redesign this
sequence with a more unified policy across different encoder types.

Reviewed-by: Chris Park <Chris.Park@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 362 +++++++++++-------
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 164 ++------
 .../drm/amd/display/dc/core/dc_link_hwss.c    |  16 -
 drivers/gpu/drm/amd/display/dc/dc.h           |   1 +
 .../gpu/drm/amd/display/dc/inc/dc_link_dp.h   |   7 +-
 5 files changed, 259 insertions(+), 291 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 0c64dea4fdd8..5396a19eeebc 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -720,35 +720,8 @@ static bool detect_dp(struct dc_link *link,
 		sink_caps->signal = SIGNAL_TYPE_DISPLAY_PORT;
 		if (!detect_dp_sink_caps(link))
 			return false;
-		if (is_mst_supported(link)) {
-			sink_caps->signal = SIGNAL_TYPE_DISPLAY_PORT_MST;
-			link->type = dc_connection_mst_branch;
 
-			dal_ddc_service_set_transaction_type(link->ddc,
-							     sink_caps->transaction_type);
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-			/* Apply work around for tunneled MST on certain USB4 docks. Always use DSC if dock
-			 * reports DSC support.
-			 */
-			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
-					link->type == dc_connection_mst_branch &&
-					link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_90CC24 &&
-					link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT &&
-					!link->dc->debug.dpia_debug.bits.disable_mst_dsc_work_around)
-				link->wa_flags.dpia_mst_dsc_always_on = true;
-#endif
-
-#if defined(CONFIG_DRM_AMD_DC_HDCP)
-			/* In case of fallback to SST when topology discovery below fails
-			 * HDCP caps will be querried again later by the upper layer (caller
-			 * of this function). */
-			query_hdcp_capability(SIGNAL_TYPE_DISPLAY_PORT_MST, link);
-#endif
-		}
-
-		if (link->type != dc_connection_mst_branch &&
-				is_dp_branch_device(link))
+		if (is_dp_branch_device(link))
 			/* DP SST branch */
 			link->type = dc_connection_sst_branch;
 	} else {
@@ -824,15 +797,215 @@ static bool wait_for_entering_dp_alt_mode(struct dc_link *link)
 	return false;
 }
 
-/*
- * dc_link_detect() - Detect if a sink is attached to a given link
+static void apply_dpia_mst_dsc_always_on_wa(struct dc_link *link)
+{
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	/* Apply work around for tunneled MST on certain USB4 docks. Always use DSC if dock
+	 * reports DSC support.
+	 */
+	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
+			link->type == dc_connection_mst_branch &&
+			link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_90CC24 &&
+			link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT &&
+			!link->dc->debug.dpia_debug.bits.disable_mst_dsc_work_around)
+		link->wa_flags.dpia_mst_dsc_always_on = true;
+#endif
+}
+
+static void revert_dpia_mst_dsc_always_on_wa(struct dc_link *link)
+{
+	/* Disable work around which keeps DSC on for tunneled MST on certain USB4 docks. */
+	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+		link->wa_flags.dpia_mst_dsc_always_on = false;
+}
+
+static bool discover_dp_mst_topology(struct dc_link *link, enum dc_detect_reason reason)
+{
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	LINK_INFO("link=%d, mst branch is now Connected\n",
+		  link->link_index);
+
+	apply_dpia_mst_dsc_always_on_wa(link);
+	link->type = dc_connection_mst_branch;
+	dm_helpers_dp_update_branch_info(link->ctx, link);
+	if (dm_helpers_dp_mst_start_top_mgr(link->ctx,
+			link, reason == DETECT_REASON_BOOT)) {
+		link_disconnect_sink(link);
+	} else {
+		link->type = dc_connection_sst_branch;
+	}
+
+	return link->type == dc_connection_mst_branch;
+}
+
+static void reset_cur_dp_mst_topology(struct dc_link *link)
+{
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	LINK_INFO("link=%d, mst branch is now Disconnected\n",
+		  link->link_index);
+
+	revert_dpia_mst_dsc_always_on_wa(link);
+	dm_helpers_dp_mst_stop_top_mgr(link->ctx, link);
+
+	link->mst_stream_alloc_table.stream_count = 0;
+	memset(link->mst_stream_alloc_table.stream_allocations,
+			0,
+			sizeof(link->mst_stream_alloc_table.stream_allocations));
+}
+
+static bool should_prepare_phy_clocks_for_link_verification(const struct dc *dc,
+		enum dc_detect_reason reason)
+{
+	int i;
+	bool can_apply_seamless_boot = false;
+
+	for (i = 0; i < dc->current_state->stream_count; i++) {
+		if (dc->current_state->streams[i]->apply_seamless_boot_optimization) {
+			can_apply_seamless_boot = true;
+			break;
+		}
+	}
+
+	return !can_apply_seamless_boot && reason != DETECT_REASON_BOOT;
+}
+
+static void prepare_phy_clocks_for_destructive_link_verification(const struct dc *dc)
+{
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	dc_z10_restore(dc);
+#endif
+	clk_mgr_exit_optimized_pwr_state(dc, dc->clk_mgr);
+}
+
+static void restore_phy_clocks_for_destructive_link_verification(const struct dc *dc)
+{
+	clk_mgr_optimize_pwr_state(dc, dc->clk_mgr);
+}
+
+static void set_all_streams_dpms_off_for_link(struct dc_link *link)
+{
+	int i;
+	struct pipe_ctx *pipe_ctx;
+	struct dc_stream_update stream_update;
+	bool dpms_off = true;
+
+	memset(&stream_update, 0, sizeof(stream_update));
+	stream_update.dpms_off = &dpms_off;
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
+		if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off &&
+				pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe) {
+			stream_update.stream = pipe_ctx->stream;
+			dc_commit_updates_for_stream(link->ctx->dc, NULL, 0,
+					pipe_ctx->stream, &stream_update,
+					link->ctx->dc->current_state);
+		}
+	}
+}
+
+static void verify_link_capability_destructive(struct dc_link *link,
+		struct dc_sink *sink,
+		enum dc_detect_reason reason)
+{
+	struct link_resource link_res = { 0 };
+	bool should_prepare_phy_clocks =
+			should_prepare_phy_clocks_for_link_verification(link->dc, reason);
+
+	if (should_prepare_phy_clocks)
+		prepare_phy_clocks_for_destructive_link_verification(link->dc);
+
+
+	if (dc_is_dp_signal(link->local_sink->sink_signal)) {
+		struct dc_link_settings known_limit_link_setting =
+				dp_get_max_link_cap(link);
+
+		set_all_streams_dpms_off_for_link(link);
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+		if (dp_get_link_encoding_format(&known_limit_link_setting) ==
+				DP_128b_132b_ENCODING)
+			link_res.hpo_dp_link_enc = resource_get_hpo_dp_link_enc_for_det_lt(
+					&link->dc->current_state->res_ctx,
+					link->dc->res_pool,
+					link);
+#endif
+		dp_verify_link_cap_with_retries(
+				link, &link_res, &known_limit_link_setting,
+				LINK_TRAINING_MAX_VERIFY_RETRY);
+	} else {
+		ASSERT(0);
+	}
+
+	if (should_prepare_phy_clocks)
+		restore_phy_clocks_for_destructive_link_verification(link->dc);
+}
+
+static void verify_link_capability_non_destructive(struct dc_link *link)
+{
+	if (dc_is_dp_signal(link->local_sink->sink_signal)) {
+		if (dc_is_embedded_signal(link->local_sink->sink_signal) ||
+				link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+			/* TODO - should we check link encoder's max link caps here?
+			 * How do we know which link encoder to check from?
+			 */
+			link->verified_link_cap = link->reported_link_cap;
+		else
+			link->verified_link_cap = dp_get_max_link_cap(link);
+	}
+}
+
+static bool should_verify_link_capability_destructively(struct dc_link *link,
+		enum dc_detect_reason reason)
+{
+	bool destrictive = false;
+	struct dc_link_settings max_link_cap;
+	bool is_link_enc_unavailable = link->link_enc &&
+			link->dc->res_pool->funcs->link_encs_assign &&
+			!link_enc_cfg_is_link_enc_avail(
+					link->ctx->dc,
+					link->link_enc->preferred_engine,
+					link);
+
+	if (dc_is_dp_signal(link->local_sink->sink_signal)) {
+		max_link_cap = dp_get_max_link_cap(link);
+		destrictive = true;
+
+		if (link->dc->debug.skip_detection_link_training ||
+				dc_is_embedded_signal(link->local_sink->sink_signal) ||
+				link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
+			destrictive = false;
+		} else if (dp_get_link_encoding_format(&max_link_cap) ==
+				DP_8b_10b_ENCODING) {
+			if (link->dpcd_caps.is_mst_capable ||
+					is_link_enc_unavailable) {
+				destrictive = false;
+			}
+		}
+	}
+
+	return destrictive;
+}
+
+static void verify_link_capability(struct dc_link *link, struct dc_sink *sink,
+		enum dc_detect_reason reason)
+{
+	if (should_verify_link_capability_destructively(link, reason))
+		verify_link_capability_destructive(link, sink, reason);
+	else
+		verify_link_capability_non_destructive(link);
+}
+
+
+/**
+ * detect_link_and_local_sink() - Detect if a sink is attached to a given link
  *
  * link->local_sink is created or destroyed as needed.
  *
- * This does not create remote sinks but will trigger DM
- * to start MST detection if a branch is detected.
+ * This does not create remote sinks.
  */
-static bool dc_link_detect_helper(struct dc_link *link,
+static bool detect_link_and_local_sink(struct dc_link *link,
 				  enum dc_detect_reason reason)
 {
 	struct dc_sink_init_data sink_init_data = { 0 };
@@ -848,9 +1021,7 @@ static bool dc_link_detect_helper(struct dc_link *link,
 	struct dpcd_caps prev_dpcd_caps;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	enum dc_connection_type pre_connection_type = dc_connection_none;
-	bool perform_dp_seamless_boot = false;
 	const uint32_t post_oui_delay = 30; // 30ms
-	struct link_resource link_res = { 0 };
 
 	DC_LOGGER_INIT(link->ctx->logger);
 
@@ -943,61 +1114,6 @@ static bool dc_link_detect_helper(struct dc_link *link,
 				return false;
 			}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-			if (dp_get_link_encoding_format(&link->reported_link_cap) == DP_128b_132b_ENCODING)
-				link_res.hpo_dp_link_enc = resource_get_hpo_dp_link_enc_for_det_lt(
-						&link->dc->current_state->res_ctx,
-						link->dc->res_pool,
-						link);
-#endif
-
-			if (link->type == dc_connection_mst_branch) {
-				LINK_INFO("link=%d, mst branch is now Connected\n",
-					  link->link_index);
-				/* Need to setup mst link_cap struct here
-				 * otherwise dc_link_detect() will leave mst link_cap
-				 * empty which leads to allocate_mst_payload() has "0"
-				 * pbn_per_slot value leading to exception on dc_fixpt_div()
-				 */
-				dp_verify_mst_link_cap(link, &link_res);
-
-				/*
-				 * This call will initiate MST topology discovery. Which
-				 * will detect MST ports and add new DRM connector DRM
-				 * framework. Then read EDID via remote i2c over aux. In
-				 * the end, will notify DRM detect result and save EDID
-				 * into DRM framework.
-				 *
-				 * .detect is called by .fill_modes.
-				 * .fill_modes is called by user mode ioctl
-				 * DRM_IOCTL_MODE_GETCONNECTOR.
-				 *
-				 * .get_modes is called by .fill_modes.
-				 *
-				 * call .get_modes, AMDGPU DM implementation will create
-				 * new dc_sink and add to dc_link. For long HPD plug
-				 * in/out, MST has its own handle.
-				 *
-				 * Therefore, just after dc_create, link->sink is not
-				 * created for MST until user mode app calls
-				 * DRM_IOCTL_MODE_GETCONNECTOR.
-				 *
-				 * Need check ->sink usages in case ->sink = NULL
-				 * TODO: s3 resume check
-				 */
-
-				dm_helpers_dp_update_branch_info(link->ctx, link);
-				if (dm_helpers_dp_mst_start_top_mgr(link->ctx,
-						link, reason == DETECT_REASON_BOOT)) {
-					if (prev_sink)
-						dc_sink_release(prev_sink);
-					return false;
-				} else {
-					link->type = dc_connection_sst_branch;
-					sink_caps.signal = SIGNAL_TYPE_DISPLAY_PORT;
-				}
-			}
-
 			/* Active SST downstream branch device unplug*/
 			if (link->type == dc_connection_sst_branch &&
 			    link->dpcd_caps.sink_count.bits.SINK_COUNT == 0) {
@@ -1018,7 +1134,6 @@ static bool dc_link_detect_helper(struct dc_link *link,
 			if (pre_connection_type == dc_connection_mst_branch &&
 					link->type != dc_connection_mst_branch)
 				dm_helpers_dp_mst_stop_top_mgr(link->ctx, link);
-
 			break;
 		}
 
@@ -1107,13 +1222,6 @@ static bool dc_link_detect_helper(struct dc_link *link,
 #if defined(CONFIG_DRM_AMD_DC_HDCP)
 			query_hdcp_capability(sink->sink_signal, link);
 #endif
-
-			// verify link cap for SST non-seamless boot
-			if (!perform_dp_seamless_boot)
-				dp_verify_link_cap_with_retries(link,
-								&link_res,
-								&link->reported_link_cap,
-								LINK_TRAINING_MAX_VERIFY_RETRY);
 		} else {
 			// If edid is the same, then discard new sink and revert back to original sink
 			if (same_edid) {
@@ -1173,27 +1281,6 @@ static bool dc_link_detect_helper(struct dc_link *link,
 		}
 	} else {
 		/* From Connected-to-Disconnected. */
-		if (link->type == dc_connection_mst_branch) {
-			LINK_INFO("link=%d, mst branch is now Disconnected\n",
-				  link->link_index);
-
-			/* Disable work around which keeps DSC on for tunneled MST on certain USB4 docks. */
-			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
-				link->wa_flags.dpia_mst_dsc_always_on = false;
-
-			dm_helpers_dp_mst_stop_top_mgr(link->ctx, link);
-
-			link->mst_stream_alloc_table.stream_count = 0;
-			memset(link->mst_stream_alloc_table.stream_allocations,
-			       0,
-			       sizeof(link->mst_stream_alloc_table.stream_allocations));
-		}
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-		if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING)
-			reset_dp_hpo_stream_encoders_for_link(link);
-#endif
-
 		link->type = dc_connection_none;
 		sink_caps.signal = SIGNAL_TYPE_NONE;
 		/* When we unplug a passive DP-HDMI dongle connection, dongle_max_pix_clk
@@ -1218,33 +1305,26 @@ static bool dc_link_detect_helper(struct dc_link *link,
 
 bool dc_link_detect(struct dc_link *link, enum dc_detect_reason reason)
 {
-	const struct dc *dc = link->dc;
-	bool ret;
-	bool can_apply_seamless_boot = false;
-	int i;
-
-	for (i = 0; i < dc->current_state->stream_count; i++) {
-		if (dc->current_state->streams[i]->apply_seamless_boot_optimization) {
-			can_apply_seamless_boot = true;
-			break;
-		}
-	}
+	bool is_local_sink_detect_success;
+	bool is_remote_sink_detect_required = false;
+	enum dc_connection_type pre_link_type = link->type;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-	dc_z10_restore(dc);
-#endif
+	is_local_sink_detect_success = detect_link_and_local_sink(link, reason);
 
-	/* get out of low power state */
-	if (!can_apply_seamless_boot && reason != DETECT_REASON_BOOT)
-		clk_mgr_exit_optimized_pwr_state(dc, dc->clk_mgr);
+	if (is_local_sink_detect_success && link->local_sink)
+		verify_link_capability(link, link->local_sink, reason);
 
-	ret = dc_link_detect_helper(link, reason);
+	if (is_local_sink_detect_success && link->local_sink &&
+			dc_is_dp_signal(link->local_sink->sink_signal) &&
+			link->dpcd_caps.is_mst_capable)
+		is_remote_sink_detect_required = discover_dp_mst_topology(link, reason);
 
-	/* Go back to power optimized state */
-	if (!can_apply_seamless_boot && reason != DETECT_REASON_BOOT)
-		clk_mgr_optimize_pwr_state(dc, dc->clk_mgr);
+	if (is_local_sink_detect_success &&
+			pre_link_type == dc_connection_mst_branch &&
+			link->type != dc_connection_mst_branch)
+		reset_cur_dp_mst_topology(link);
 
-	return ret;
+	return is_local_sink_detect_success && !is_remote_sink_detect_required;
 }
 
 bool dc_link_get_hpd_state(struct dc_link *dc_link)
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index cb2f96690b4a..5cc8c2633558 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -104,9 +104,6 @@ static bool decide_fallback_link_setting(
 		struct dc_link_settings initial_link_settings,
 		struct dc_link_settings *current_link_setting,
 		enum link_training_result training_result);
-static struct dc_link_settings get_common_supported_link_settings(
-		struct dc_link_settings link_setting_a,
-		struct dc_link_settings link_setting_b);
 static void maximize_lane_settings(const struct link_training_settings *lt_settings,
 		struct dc_lane_settings lane_settings[LANE_COUNT_DP_MAX]);
 static void override_lane_settings(const struct link_training_settings *lt_settings,
@@ -3186,13 +3183,11 @@ bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_
 	return false;
 }
 
-static struct dc_link_settings get_max_link_cap(struct dc_link *link,
-		const struct link_resource *link_res)
+
+struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
 {
 	struct dc_link_settings max_link_cap = {0};
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	enum dc_link_rate lttpr_max_link_rate;
-#endif
 	struct link_encoder *link_enc = NULL;
 
 	/* Links supporting dynamically assigned link encoder will be assigned next
@@ -3210,13 +3205,6 @@ static struct dc_link_settings get_max_link_cap(struct dc_link *link,
 	/* get max link encoder capability */
 	if (link_enc)
 		link_enc->funcs->get_max_link_cap(link_enc, &max_link_cap);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-	if (max_link_cap.link_rate >= LINK_RATE_UHBR10) {
-		if (!link_res->hpo_dp_link_enc ||
-				link->dc->debug.disable_uhbr)
-			max_link_cap.link_rate = LINK_RATE_HIGH3;
-	}
-#endif
 
 	/* Lower link settings based on sink's link cap */
 	if (link->reported_link_cap.lane_count < max_link_cap.lane_count)
@@ -3236,22 +3224,21 @@ static struct dc_link_settings get_max_link_cap(struct dc_link *link,
 	if (link->lttpr_mode != LTTPR_MODE_NON_LTTPR) {
 		if (link->dpcd_caps.lttpr_caps.max_lane_count < max_link_cap.lane_count)
 			max_link_cap.lane_count = link->dpcd_caps.lttpr_caps.max_lane_count;
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		lttpr_max_link_rate = get_lttpr_max_link_rate(link);
 
 		if (lttpr_max_link_rate < max_link_cap.link_rate)
 			max_link_cap.link_rate = lttpr_max_link_rate;
-#else
-		if (link->dpcd_caps.lttpr_caps.max_link_rate < max_link_cap.link_rate)
-			max_link_cap.link_rate = link->dpcd_caps.lttpr_caps.max_link_rate;
-#endif
 
 		DC_LOG_HW_LINK_TRAINING("%s\n Training with LTTPR,  max_lane count %d max_link rate %d \n",
 						__func__,
 						max_link_cap.lane_count,
 						max_link_cap.link_rate);
 	}
+
+	if (dp_get_link_encoding_format(&max_link_cap) == DP_128b_132b_ENCODING &&
+			link->dc->debug.disable_uhbr)
+		max_link_cap.link_rate = LINK_RATE_HIGH3;
+
 	return max_link_cap;
 }
 
@@ -3376,10 +3363,9 @@ bool dp_verify_link_cap(
 	struct dc_link_settings *known_limit_link_setting,
 	int *fail_count)
 {
-	struct dc_link_settings max_link_cap = {0};
 	struct dc_link_settings cur_link_setting = {0};
 	struct dc_link_settings *cur = &cur_link_setting;
-	struct dc_link_settings initial_link_settings = {0};
+	struct dc_link_settings initial_link_settings = *known_limit_link_setting;
 	bool success;
 	bool skip_link_training;
 	bool skip_video_pattern;
@@ -3387,28 +3373,6 @@ bool dp_verify_link_cap(
 	enum link_training_result status;
 	union hpd_irq_data irq_data;
 
-	/* link training starts with the maximum common settings
-	 * supported by both sink and ASIC.
-	 */
-	max_link_cap = get_max_link_cap(link, link_res);
-	initial_link_settings = get_common_supported_link_settings(
-			*known_limit_link_setting,
-			max_link_cap);
-
-	/* Accept reported capabilities if link supports flexible encoder mapping or encoder already in use. */
-	if (link->dc->debug.skip_detection_link_training ||
-			link->is_dig_mapping_flexible) {
-		/* TODO - should we check link encoder's max link caps here?
-		 * How do we know which link encoder to check from?
-		 */
-		link->verified_link_cap = *known_limit_link_setting;
-		return true;
-	} else if (link->link_enc && link->dc->res_pool->funcs->link_encs_assign &&
-			!link_enc_cfg_is_link_enc_avail(link->ctx->dc, link->link_enc->preferred_engine, link)) {
-		link->verified_link_cap = initial_link_settings;
-		return true;
-	}
-
 	memset(&irq_data, 0, sizeof(irq_data));
 	success = false;
 	skip_link_training = false;
@@ -3420,10 +3384,6 @@ bool dp_verify_link_cap(
 		core_link_write_dpcd(link, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &grant, sizeof(grant));
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-	if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING)
-		reset_dp_hpo_stream_encoders_for_link(link);
-#endif
 	/* TODO implement override and monitor patch later */
 
 	/* try to train the link from high to low to
@@ -3540,79 +3500,32 @@ bool dp_verify_link_cap_with_retries(
 	return success;
 }
 
-bool dp_verify_mst_link_cap(
-	struct dc_link *link, const struct link_resource *link_res)
-{
-	struct dc_link_settings max_link_cap = {0};
-
-	if (dp_get_link_encoding_format(&link->reported_link_cap) ==
-			DP_8b_10b_ENCODING) {
-		max_link_cap = get_max_link_cap(link, link_res);
-		link->verified_link_cap = get_common_supported_link_settings(
-				link->reported_link_cap,
-				max_link_cap);
-	}
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-	else if (dp_get_link_encoding_format(&link->reported_link_cap) ==
-			DP_128b_132b_ENCODING) {
-		dp_verify_link_cap_with_retries(link,
-				link_res,
-				&link->reported_link_cap,
-				LINK_TRAINING_MAX_VERIFY_RETRY);
-	}
-#endif
-	return true;
-}
-
-static struct dc_link_settings get_common_supported_link_settings(
-		struct dc_link_settings link_setting_a,
-		struct dc_link_settings link_setting_b)
+/* in DP compliance test, DPR-120 may have
+ * a random value in its MAX_LINK_BW dpcd field.
+ * We map it to the maximum supported link rate that
+ * is smaller than MAX_LINK_BW in this case.
+ */
+static enum dc_link_rate get_link_rate_from_max_link_bw(
+		 uint8_t max_link_bw)
 {
-	struct dc_link_settings link_settings = {0};
+	enum dc_link_rate link_rate;
 
-	link_settings.lane_count =
-		(link_setting_a.lane_count <=
-			link_setting_b.lane_count) ?
-			link_setting_a.lane_count :
-			link_setting_b.lane_count;
-	link_settings.link_rate =
-		(link_setting_a.link_rate <=
-			link_setting_b.link_rate) ?
-			link_setting_a.link_rate :
-			link_setting_b.link_rate;
-	link_settings.link_spread = LINK_SPREAD_DISABLED;
-
-	/* in DP compliance test, DPR-120 may have
-	 * a random value in its MAX_LINK_BW dpcd field.
-	 * We map it to the maximum supported link rate that
-	 * is smaller than MAX_LINK_BW in this case.
-	 */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-	if (link_settings.link_rate > LINK_RATE_UHBR20) {
-		link_settings.link_rate = LINK_RATE_UHBR20;
-	} else if (link_settings.link_rate < LINK_RATE_UHBR20 &&
-			link_settings.link_rate > LINK_RATE_UHBR13_5) {
-		link_settings.link_rate = LINK_RATE_UHBR13_5;
-	} else if (link_settings.link_rate < LINK_RATE_UHBR10 &&
-			link_settings.link_rate > LINK_RATE_HIGH3) {
-#else
-	if (link_settings.link_rate > LINK_RATE_HIGH3) {
-#endif
-		link_settings.link_rate = LINK_RATE_HIGH3;
-	} else if (link_settings.link_rate < LINK_RATE_HIGH3
-			&& link_settings.link_rate > LINK_RATE_HIGH2) {
-		link_settings.link_rate = LINK_RATE_HIGH2;
-	} else if (link_settings.link_rate < LINK_RATE_HIGH2
-			&& link_settings.link_rate > LINK_RATE_HIGH) {
-		link_settings.link_rate = LINK_RATE_HIGH;
-	} else if (link_settings.link_rate < LINK_RATE_HIGH
-			&& link_settings.link_rate > LINK_RATE_LOW) {
-		link_settings.link_rate = LINK_RATE_LOW;
-	} else if (link_settings.link_rate < LINK_RATE_LOW) {
-		link_settings.link_rate = LINK_RATE_UNKNOWN;
+	if (max_link_bw >= LINK_RATE_HIGH3) {
+		link_rate = LINK_RATE_HIGH3;
+	} else if (max_link_bw < LINK_RATE_HIGH3
+			&& max_link_bw >= LINK_RATE_HIGH2) {
+		link_rate = LINK_RATE_HIGH2;
+	} else if (max_link_bw < LINK_RATE_HIGH2
+			&& max_link_bw >= LINK_RATE_HIGH) {
+		link_rate = LINK_RATE_HIGH;
+	} else if (max_link_bw < LINK_RATE_HIGH
+			&& max_link_bw >= LINK_RATE_LOW) {
+		link_rate = LINK_RATE_LOW;
+	} else {
+		link_rate = LINK_RATE_UNKNOWN;
 	}
 
-	return link_settings;
+	return link_rate;
 }
 
 static inline bool reached_minimum_lane_count(enum dc_lane_count lane_count)
@@ -5516,6 +5429,9 @@ static bool retrieve_link_cap(struct dc_link *link)
 
 	read_dp_device_vendor_id(link);
 
+	/* TODO - decouple raw mst capability from policy decision */
+	link->dpcd_caps.is_mst_capable = is_mst_supported(link);
+
 	get_active_converter_info(ds_port.byte, link);
 
 	dp_wa_power_up_0010FA(link, dpcd_data, sizeof(dpcd_data));
@@ -5534,8 +5450,8 @@ static bool retrieve_link_cap(struct dc_link *link)
 
 	link->reported_link_cap.lane_count =
 		link->dpcd_caps.max_ln_count.bits.MAX_LANE_COUNT;
-	link->reported_link_cap.link_rate = dpcd_data[
-		DP_MAX_LINK_RATE - DP_DPCD_REV];
+	link->reported_link_cap.link_rate = get_link_rate_from_max_link_bw(
+			dpcd_data[DP_MAX_LINK_RATE - DP_DPCD_REV]);
 	link->reported_link_cap.link_spread =
 		link->dpcd_caps.max_down_spread.bits.MAX_DOWN_SPREAD ?
 		LINK_SPREAD_05_DOWNSPREAD_30KHZ : LINK_SPREAD_DISABLED;
@@ -5759,14 +5675,6 @@ bool dp_overwrite_extended_receiver_cap(struct dc_link *link)
 bool detect_dp_sink_caps(struct dc_link *link)
 {
 	return retrieve_link_cap(link);
-
-	/* dc init_hw has power encoder using default
-	 * signal for connector. For native DP, no
-	 * need to power up encoder again. If not native
-	 * DP, hw_init may need check signal or power up
-	 * encoder here.
-	 */
-	/* TODO save sink caps in link->sink */
 }
 
 static enum dc_link_rate linkRateInKHzToLinkRateMultiplier(uint32_t link_rate_in_khz)
@@ -5844,8 +5752,6 @@ void detect_edp_sink_caps(struct dc_link *link)
 			}
 		}
 	}
-	link->verified_link_cap = link->reported_link_cap;
-
 	core_link_read_dpcd(link, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP,
 						&backlight_adj_cap, sizeof(backlight_adj_cap));
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 45d03d3a95c3..e2409c14df34 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -897,21 +897,5 @@ void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable)
 	}
 }
 
-void reset_dp_hpo_stream_encoders_for_link(struct dc_link *link)
-{
-	const struct dc *dc = link->dc;
-	struct dc_state *state = dc->current_state;
-	uint8_t i;
-
-	for (i = 0; i < MAX_PIPES; i++) {
-		if (state->res_ctx.pipe_ctx[i].stream_res.hpo_dp_stream_enc &&
-				state->res_ctx.pipe_ctx[i].stream &&
-				state->res_ctx.pipe_ctx[i].stream->link == link &&
-				!state->res_ctx.pipe_ctx[i].stream->dpms_off) {
-			setup_dp_hpo_stream(&state->res_ctx.pipe_ctx[i], false);
-		}
-	}
-}
-
 #undef DC_LOGGER
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 235e33f73913..5ba6abdbd3aa 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1212,6 +1212,7 @@ struct dpcd_caps {
 	bool is_branch_dev;
 	/* Dongle's downstream count. */
 	union sink_count sink_count;
+	bool is_mst_capable;
 	/* If dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER,
 	indicates 'Frame Sequential-to-lllFrame Pack' conversion capability.*/
 	struct dc_dongle_caps dongle_caps;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
index cd52813a8432..b18c8198f66d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
@@ -54,6 +54,8 @@ enum {
 	PEAK_FACTOR_X1000 = 1006,
 };
 
+struct dc_link_settings dp_get_max_link_cap(struct dc_link *link);
+
 bool dp_verify_link_cap(
 	struct dc_link *link,
 	const struct link_resource *link_res,
@@ -66,10 +68,6 @@ bool dp_verify_link_cap_with_retries(
 	struct dc_link_settings *known_limit_link_setting,
 	int attempts);
 
-bool dp_verify_mst_link_cap(
-	struct dc_link *link,
-	const struct link_resource *link_res);
-
 bool dp_validate_mode_timing(
 	struct dc_link *link,
 	const struct dc_crtc_timing *timing);
@@ -222,7 +220,6 @@ void disable_dp_hpo_output(struct dc_link *link,
 		enum signal_type signal);
 void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable);
 bool is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx);
-void reset_dp_hpo_stream_encoders_for_link(struct dc_link *link);
 
 bool dp_retrieve_lttpr_cap(struct dc_link *link);
 void edp_panel_backlight_power_on(struct dc_link *link);
-- 
2.25.1


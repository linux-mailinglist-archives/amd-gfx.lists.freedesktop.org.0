Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79E479636
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Dec 2021 22:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74FC10E69C;
	Fri, 17 Dec 2021 21:24:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2046.outbound.protection.outlook.com [40.107.101.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1C10E6BE
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Dec 2021 21:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O06Iu/QFEyC50VlBpfXv8XQxb0oi1wNXyvcVrcySBroFw152el3U2BGmQXLsAOSxuI+B+o/meeb/mxyCsq5EWk3UWm6p7Y14jrZI6BMouWg+I/l5Rkfzck1pJbLz4D4awTqZHRWmsMZabuhbaojzv0v6/X99ZtLUj27VQgQ/8c0e476dlxE3qZpH/0KUhUGVe28sRBGzFkZUfgU52alb0M+bau/psoughKO06ZAL+gpV+y2qhgYRFTuiG5T4cyg8tRlrzKVymZfNEoRKGzRaaEl+DTAETMmlixhzV8OvobGvUzzgsULkL+uhw0CW2o7zidiz4xZbk/jQLi3IPbZ3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+M493KUKLTMZF3YhBQ5rbDjpy3+WHlTXj7xf9oA5SM=;
 b=U2P4M80xtzTAk/PejuquJkthcJsZssUIQEx0JsjgB3jmhyCiRe0PJF9049MDcYFiUoRMoQFU5ymKUiiKnfAek/UjyRjFL4JQJh5H8zGTFAPT1L5vX7GpH2ZHgfeMRgUeMVQ8gX09mHaJmqHCseafqHDUWuruLd0LNeNUgi0UPaoy0KFYlWUezL9Ced83VtlkhxyyRibKJUJgjdjMSoerbOj6kWfI7EPVcYGZeiRLm0Y2LhLzhOn/vfc/qrvlITKS4joqBmUypSA5tOdCWCu4l66QXD6RvRknsLAp7opw2uwa/B3qAPWRE+7C3xy3OLFvPSNyEEVbUrdwcvWqmNJ2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+M493KUKLTMZF3YhBQ5rbDjpy3+WHlTXj7xf9oA5SM=;
 b=vfSDYzJ4Z4/isoVMht7PKpSnD4SCt+57BZwJItE/AuHfhPgDuxphYSFs/LMjxXikAbYQ1pUcJCNHqZ8INanei6VaLzIbTno5kFSwyzPC4kltyRdnsnvu4sUdSzMtNYwN3phrwocow2UUFgJPpRUCLQDZcHm41dEPVUyNqLeeR0s=
Received: from MW4PR04CA0257.namprd04.prod.outlook.com (2603:10b6:303:88::22)
 by BYAPR12MB4631.namprd12.prod.outlook.com (2603:10b6:a03:10d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 17 Dec
 2021 21:24:41 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::cd) by MW4PR04CA0257.outlook.office365.com
 (2603:10b6:303:88::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Fri, 17 Dec 2021 21:24:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 21:24:41 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 17 Dec
 2021 15:24:39 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/19] drm/amd/display: define link res and make it accessible
 to all link interfaces
Date: Fri, 17 Dec 2021 16:24:03 -0500
Message-ID: <20211217212407.3583190-16-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217212407.3583190-1-Rodrigo.Siqueira@amd.com>
References: <20211217212407.3583190-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 642433b4-ac39-4727-abaa-08d9c1a3a376
X-MS-TrafficTypeDiagnostic: BYAPR12MB4631:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB4631EB80D02B33A1BD5BEF2B98789@BYAPR12MB4631.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qKwxRNeUm9ZU7QPSxOWEpNW8jv+fNVNKxaFhqjXCmqJvLW2JKbWUi2lIQvSpnMfrgJmFZv2qZwHy6xGfSlvtjNwV6Gfdqh6ltukvIznw+wlFeIhTm5y3RSNiv0/AXQ80+tmvrggvUGXu16g8kF1fnXz56N8WEFtbC8fn2YloUdGppyEmIR7wu9kTMvB58cH/zQfdwWteVFNVyPgswCQwldEd3cPBij9hsdtCfHu/yVlvdqxAp+TBknqK31L8SsbSjD0Et7NSKiWXQAkUg1ipQ4JHeC42LTjWMVOqVNSb5Vs48GdkGTFnCyyGzbqLAtyiFHDAXXaoRe/vY7r2DG+h5AZMe0QEUNNUKclIHM9mpIae4xMUU4jm9I+pwM4bWUAV5XX04F8LKBEVeIjqWgH5X7cJ58OcH+Sv5sQv4WKUzVFB62FD38vQ/QdMOWqQSXdxx6ram2ucTjwlaIsczEm2ET75P5JndFAKN7RfiAC5efkTL9vhuuaQ7rlNYSy8N/8UBkegzUxhPMMalIlYO9vLP6DzF3MyuyYOmOfgztLFdEZJ3vlIP8Rpe/mMkcNa74jGFO/EWWjEZPuELJr/e6l87zkAKQph6ICetYh9YX5Qh/RV5QIgv3/kzk0bls61FrlQc0yGZ066GhuL030RQdMTRm3/rxto7wIM7+LyjmFV7E8O03tUa0tvU7GmADZjLgTQrSxD1nipZ7XWD42Zfg1Tmh27Vz+U55Ki4xSCmtZ8arwCRHSPLnJ2YbAy/tJdriC7ykmreOkVi3cL//isURmK7kP83Yy/7g/a2A5hQpuGmOw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(316002)(40460700001)(8936002)(16526019)(2906002)(186003)(26005)(81166007)(6916009)(6666004)(1076003)(336012)(36756003)(8676002)(83380400001)(508600001)(36860700001)(70586007)(426003)(70206006)(4326008)(47076005)(5660300002)(30864003)(356005)(86362001)(54906003)(2616005)(82310400004)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 21:24:41.4367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 642433b4-ac39-4727-abaa-08d9c1a3a376
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4631
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
Cc: stylon.wang@amd.com, Jun Lei <Jun.Lei@amd.com>, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, Wenjing Liu <wenjing.liu@amd.com>, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, wayne.lin@amd.com, mikita.lipski@amd.com,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[why]
There will be a series of re-arch changes in Link Resource Management.
They are more and more muxable link resource objects and the resource is
insufficient for a one to one allocation to all links created.
Therefore a link resource sharing logic is required to determine which
link should use certain link resource.

This commit is the first one in this series that starts by defining a
link resource struct, this struct will be available to all interfaces
that need to perform link programming sequence.

In later commits, we will granduately decouple link resource objects out
of dc link. So instead of access a link resource from dc link. Current
link's resource can be accessible through pipe_ctx->link_res during
commit, or by calling  dc_link_get_cur_link_res function with current
link passed in after commit.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  69 +++++---
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 152 +++++++++++-------
 .../drm/amd/display/dc/core/dc_link_dpia.c    |  48 ++++--
 .../drm/amd/display/dc/core/dc_link_hwss.c    |  30 ++--
 drivers/gpu/drm/amd/display/dc/dc_link.h      |   8 +
 .../gpu/drm/amd/display/dc/inc/core_types.h   |   6 +
 .../gpu/drm/amd/display/dc/inc/dc_link_dp.h   |  15 +-
 .../gpu/drm/amd/display/dc/inc/dc_link_dpia.h |   5 +-
 .../gpu/drm/amd/display/dc/inc/link_hwss.h    |  10 +-
 9 files changed, 229 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 857941d83f1f..4130cd98f1ce 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -986,7 +986,7 @@ static bool dc_link_detect_helper(struct dc_link *link,
 				 * empty which leads to allocate_mst_payload() has "0"
 				 * pbn_per_slot value leading to exception on dc_fixpt_div()
 				 */
-				dp_verify_mst_link_cap(link);
+				dp_verify_mst_link_cap(link, NULL);
 
 				/*
 				 * This call will initiate MST topology discovery. Which
@@ -1150,6 +1150,7 @@ static bool dc_link_detect_helper(struct dc_link *link,
 			// verify link cap for SST non-seamless boot
 			if (!perform_dp_seamless_boot)
 				dp_verify_link_cap_with_retries(link,
+								NULL,
 								&link->reported_link_cap,
 								LINK_TRAINING_MAX_VERIFY_RETRY);
 		} else {
@@ -2503,7 +2504,8 @@ static void write_i2c_redriver_setting(
 		DC_LOG_DEBUG("Set redriver failed");
 }
 
-static void disable_link(struct dc_link *link, enum signal_type signal)
+static void disable_link(struct dc_link *link, const struct link_resource *link_res,
+		enum signal_type signal)
 {
 	/*
 	 * TODO: implement call for dp_set_hw_test_pattern
@@ -2522,20 +2524,20 @@ static void disable_link(struct dc_link *link, enum signal_type signal)
 		struct dc_link_settings link_settings = link->cur_link_settings;
 #endif
 		if (dc_is_dp_sst_signal(signal))
-			dp_disable_link_phy(link, signal);
+			dp_disable_link_phy(link, link_res, signal);
 		else
-			dp_disable_link_phy_mst(link, signal);
+			dp_disable_link_phy_mst(link, link_res, signal);
 
 		if (dc_is_dp_sst_signal(signal) ||
 				link->mst_stream_alloc_table.stream_count == 0) {
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 			if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING) {
 				dp_set_fec_enable(link, false);
-				dp_set_fec_ready(link, false);
+				dp_set_fec_ready(link, link_res, false);
 			}
 #else
 			dp_set_fec_enable(link, false);
-			dp_set_fec_ready(link, false);
+			dp_set_fec_ready(link, link_res, false);
 #endif
 		}
 	} else {
@@ -2646,7 +2648,7 @@ static enum dc_status enable_link(
 	 * new link settings.
 	 */
 	if (link->link_status.link_active) {
-		disable_link(link, pipe_ctx->stream->signal);
+		disable_link(link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
 	}
 
 	switch (pipe_ctx->stream->signal) {
@@ -4109,7 +4111,7 @@ static void fpga_dp_hpo_enable_link_and_stream(struct dc_state *state, struct pi
 	stream->link->cur_link_settings = link_settings;
 
 	/*  Enable clock, Configure lane count, and Enable Link Encoder*/
-	enable_dp_hpo_output(stream->link, &stream->link->cur_link_settings);
+	enable_dp_hpo_output(stream->link, &pipe_ctx->link_res, &stream->link->cur_link_settings);
 
 #ifdef DIAGS_BUILD
 	/* Workaround for FPGA HPO capture DP link data:
@@ -4353,7 +4355,8 @@ void core_link_enable_stream(
 			if (status != DC_FAIL_DP_LINK_TRAINING ||
 					pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
 				if (false == stream->link->link_status.link_active)
-					disable_link(stream->link, pipe_ctx->stream->signal);
+					disable_link(stream->link, &pipe_ctx->link_res,
+							pipe_ctx->stream->signal);
 				BREAK_TO_DEBUGGER();
 				return;
 			}
@@ -4502,14 +4505,14 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 		 * state machine.
 		 * In DP2 or MST mode, our encoder will stay video active
 		 */
-		disable_link(pipe_ctx->stream->link, pipe_ctx->stream->signal);
+		disable_link(pipe_ctx->stream->link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
 		dc->hwss.disable_stream(pipe_ctx);
 	} else {
 		dc->hwss.disable_stream(pipe_ctx);
-		disable_link(pipe_ctx->stream->link, pipe_ctx->stream->signal);
+		disable_link(pipe_ctx->stream->link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
 	}
 #else
-	disable_link(pipe_ctx->stream->link, pipe_ctx->stream->signal);
+	disable_link(pipe_ctx->stream->link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
 
 	dc->hwss.disable_stream(pipe_ctx);
 #endif
@@ -4592,16 +4595,22 @@ void dc_link_set_drive_settings(struct dc *dc,
 {
 
 	int i;
+	struct pipe_ctx *pipe = NULL;
+	const struct link_resource *link_res;
 
-	for (i = 0; i < dc->link_count; i++) {
-		if (dc->links[i] == link)
-			break;
-	}
+	link_res = dc_link_get_cur_link_res(link);
 
-	if (i >= dc->link_count)
+	for (i = 0; i < MAX_PIPES; i++) {
+		pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+		if (pipe->stream && pipe->stream->link) {
+			if (pipe->stream->link == link)
+				break;
+		}
+	}
+	if (pipe && link_res)
+		dc_link_dp_set_drive_settings(pipe->stream->link, link_res, lt_settings);
+	else
 		ASSERT_CRITICAL(false);
-
-	dc_link_dp_set_drive_settings(dc->links[i], lt_settings);
 }
 
 void dc_link_set_preferred_link_settings(struct dc *dc,
@@ -4793,6 +4802,9 @@ void dc_link_overwrite_extended_receiver_cap(
 
 bool dc_link_is_fec_supported(const struct dc_link *link)
 {
+	/* TODO - use asic cap instead of link_enc->features
+	 * we no longer know which link enc to use for this link before commit
+	 */
 	struct link_encoder *link_enc = NULL;
 
 	/* Links supporting dynamically assigned link encoder will be assigned next
@@ -4887,3 +4899,22 @@ uint32_t dc_bandwidth_in_kbps_from_timing(
 	return kbps;
 
 }
+
+const struct link_resource *dc_link_get_cur_link_res(const struct dc_link *link)
+{
+	int i;
+	struct pipe_ctx *pipe = NULL;
+	const struct link_resource *link_res = NULL;
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		pipe = &link->dc->current_state->res_ctx.pipe_ctx[i];
+		if (pipe->stream && pipe->stream->link && pipe->top_pipe == NULL) {
+			if (pipe->stream->link == link) {
+				link_res = &pipe->link_res;
+				break;
+			}
+		}
+	}
+
+	return link_res;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 9dc99929b0cd..98835d6c9036 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -1251,6 +1251,7 @@ bool dp_is_max_vs_reached(
 
 static bool perform_post_lt_adj_req_sequence(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct link_training_settings *lt_settings)
 {
 	enum dc_lane_count lane_count =
@@ -1314,6 +1315,7 @@ static bool perform_post_lt_adj_req_sequence(
 						lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
 
 				dc_link_dp_set_drive_settings(link,
+						link_res,
 						lt_settings);
 				break;
 			}
@@ -1388,6 +1390,7 @@ enum link_training_result dp_get_cr_failure(enum dc_lane_count ln_count,
 
 static enum link_training_result perform_channel_equalization_sequence(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct link_training_settings *lt_settings,
 	uint32_t offset)
 {
@@ -1410,12 +1413,12 @@ static enum link_training_result perform_channel_equalization_sequence(
 		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
 #endif
 
-	dp_set_hw_training_pattern(link, tr_pattern, offset);
+	dp_set_hw_training_pattern(link, link_res, tr_pattern, offset);
 
 	for (retries_ch_eq = 0; retries_ch_eq <= LINK_TRAINING_MAX_RETRY_COUNT;
 		retries_ch_eq++) {
 
-		dp_set_hw_lane_settings(link, lt_settings, offset);
+		dp_set_hw_lane_settings(link, link_res, lt_settings, offset);
 
 		/* 2. update DPCD*/
 		if (!retries_ch_eq)
@@ -1479,18 +1482,20 @@ static enum link_training_result perform_channel_equalization_sequence(
 }
 
 static void start_clock_recovery_pattern_early(struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings,
 		uint32_t offset)
 {
 	DC_LOG_HW_LINK_TRAINING("%s\n GPU sends TPS1. Wait 400us.\n",
 			__func__);
-	dp_set_hw_training_pattern(link, lt_settings->pattern_for_cr, offset);
-	dp_set_hw_lane_settings(link, lt_settings, offset);
+	dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_cr, offset);
+	dp_set_hw_lane_settings(link, link_res, lt_settings, offset);
 	udelay(400);
 }
 
 static enum link_training_result perform_clock_recovery_sequence(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct link_training_settings *lt_settings,
 	uint32_t offset)
 {
@@ -1506,7 +1511,7 @@ static enum link_training_result perform_clock_recovery_sequence(
 	retry_count = 0;
 
 	if (!link->ctx->dc->work_arounds.lt_early_cr_pattern)
-		dp_set_hw_training_pattern(link, lt_settings->pattern_for_cr, offset);
+		dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_cr, offset);
 
 	/* najeeb - The synaptics MST hub can put the LT in
 	* infinite loop by switching the VS
@@ -1523,6 +1528,7 @@ static enum link_training_result perform_clock_recovery_sequence(
 		/* 1. call HWSS to set lane settings*/
 		dp_set_hw_lane_settings(
 				link,
+				link_res,
 				lt_settings,
 				offset);
 
@@ -1621,13 +1627,14 @@ static enum link_training_result perform_clock_recovery_sequence(
 
 static inline enum link_training_result dp_transition_to_video_idle(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct link_training_settings *lt_settings,
 	enum link_training_result status)
 {
 	union lane_count_set lane_count_set = {0};
 
 	/* 4. mainlink output idle pattern*/
-	dp_set_hw_test_pattern(link, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
+	dp_set_hw_test_pattern(link, link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
 
 	/*
 	 * 5. post training adjust if required
@@ -1651,7 +1658,7 @@ static inline enum link_training_result dp_transition_to_video_idle(
 	}
 
 	if (status == LINK_TRAINING_SUCCESS &&
-		perform_post_lt_adj_req_sequence(link, lt_settings) == false)
+		perform_post_lt_adj_req_sequence(link, link_res, lt_settings) == false)
 		status = LINK_TRAINING_LQA_FAIL;
 
 	lane_count_set.bits.LANE_COUNT_SET = lt_settings->link_settings.lane_count;
@@ -2094,10 +2101,11 @@ static void print_status_message(
 
 void dc_link_dp_set_drive_settings(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct link_training_settings *lt_settings)
 {
 	/* program ASIC PHY settings*/
-	dp_set_hw_lane_settings(link, lt_settings, DPRX);
+	dp_set_hw_lane_settings(link, link_res, lt_settings, DPRX);
 
 	dp_hw_to_dpcd_lane_settings(lt_settings,
 			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
@@ -2108,6 +2116,7 @@ void dc_link_dp_set_drive_settings(
 
 bool dc_link_dp_perform_link_training_skip_aux(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	const struct dc_link_settings *link_setting)
 {
 	struct link_training_settings lt_settings = {0};
@@ -2124,10 +2133,10 @@ bool dc_link_dp_perform_link_training_skip_aux(
 	/* 1. Perform_clock_recovery_sequence. */
 
 	/* transmit training pattern for clock recovery */
-	dp_set_hw_training_pattern(link, lt_settings.pattern_for_cr, DPRX);
+	dp_set_hw_training_pattern(link, link_res, lt_settings.pattern_for_cr, DPRX);
 
 	/* call HWSS to set lane settings*/
-	dp_set_hw_lane_settings(link, &lt_settings, DPRX);
+	dp_set_hw_lane_settings(link, link_res, &lt_settings, DPRX);
 
 	/* wait receiver to lock-on*/
 	dp_wait_for_training_aux_rd_interval(link, lt_settings.cr_pattern_time);
@@ -2135,10 +2144,10 @@ bool dc_link_dp_perform_link_training_skip_aux(
 	/* 2. Perform_channel_equalization_sequence. */
 
 	/* transmit training pattern for channel equalization. */
-	dp_set_hw_training_pattern(link, lt_settings.pattern_for_eq, DPRX);
+	dp_set_hw_training_pattern(link, link_res, lt_settings.pattern_for_eq, DPRX);
 
 	/* call HWSS to set lane settings*/
-	dp_set_hw_lane_settings(link, &lt_settings, DPRX);
+	dp_set_hw_lane_settings(link, link_res, &lt_settings, DPRX);
 
 	/* wait receiver to lock-on. */
 	dp_wait_for_training_aux_rd_interval(link, lt_settings.eq_pattern_time);
@@ -2146,7 +2155,7 @@ bool dc_link_dp_perform_link_training_skip_aux(
 	/* 3. Perform_link_training_int. */
 
 	/* Mainlink output idle pattern. */
-	dp_set_hw_test_pattern(link, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
+	dp_set_hw_test_pattern(link, link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
 
 	print_status_message(link, &lt_settings, LINK_TRAINING_SUCCESS);
 
@@ -2227,6 +2236,7 @@ static void dpcd_128b_132b_get_aux_rd_interval(struct dc_link *link,
 
 static enum link_training_result dp_perform_128b_132b_channel_eq_done_sequence(
 		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings)
 {
 	uint8_t loop_count;
@@ -2238,7 +2248,7 @@ static enum link_training_result dp_perform_128b_132b_channel_eq_done_sequence(
 	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
 
 	/* Transmit 128b/132b_TPS1 over Main-Link */
-	dp_set_hw_training_pattern(link, lt_settings->pattern_for_cr, DPRX);
+	dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_cr, DPRX);
 	/* Set TRAINING_PATTERN_SET to 01h */
 	dpcd_set_training_pattern(link, lt_settings->pattern_for_cr);
 
@@ -2248,8 +2258,8 @@ static enum link_training_result dp_perform_128b_132b_channel_eq_done_sequence(
 			&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
 	dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
 			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-	dp_set_hw_lane_settings(link, lt_settings, DPRX);
-	dp_set_hw_training_pattern(link, lt_settings->pattern_for_eq, DPRX);
+	dp_set_hw_lane_settings(link, link_res, lt_settings, DPRX);
+	dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_eq, DPRX);
 
 	/* Set loop counter to start from 1 */
 	loop_count = 1;
@@ -2276,7 +2286,7 @@ static enum link_training_result dp_perform_128b_132b_channel_eq_done_sequence(
 		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
 			status = DP_128b_132b_LT_FAILED;
 		} else {
-			dp_set_hw_lane_settings(link, lt_settings, DPRX);
+			dp_set_hw_lane_settings(link, link_res, lt_settings, DPRX);
 			dpcd_set_lane_settings(link, lt_settings, DPRX);
 		}
 		loop_count++;
@@ -2305,6 +2315,7 @@ static enum link_training_result dp_perform_128b_132b_channel_eq_done_sequence(
 
 static enum link_training_result dp_perform_128b_132b_cds_done_sequence(
 		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings)
 {
 	/* Assumption: assume hardware has transmitted eq pattern */
@@ -2341,6 +2352,7 @@ static enum link_training_result dp_perform_128b_132b_cds_done_sequence(
 
 static enum link_training_result dp_perform_8b_10b_link_training(
 		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings)
 {
 	enum link_training_result status = LINK_TRAINING_SUCCESS;
@@ -2350,7 +2362,7 @@ static enum link_training_result dp_perform_8b_10b_link_training(
 	uint8_t lane = 0;
 
 	if (link->ctx->dc->work_arounds.lt_early_cr_pattern)
-		start_clock_recovery_pattern_early(link, lt_settings, DPRX);
+		start_clock_recovery_pattern_early(link, link_res, lt_settings, DPRX);
 
 	/* 1. set link rate, lane count and spread. */
 	dpcd_set_link_settings(link, lt_settings);
@@ -2364,12 +2376,13 @@ static enum link_training_result dp_perform_8b_10b_link_training(
 
 		for (repeater_id = repeater_cnt; (repeater_id > 0 && status == LINK_TRAINING_SUCCESS);
 				repeater_id--) {
-			status = perform_clock_recovery_sequence(link, lt_settings, repeater_id);
+			status = perform_clock_recovery_sequence(link, link_res, lt_settings, repeater_id);
 
 			if (status != LINK_TRAINING_SUCCESS)
 				break;
 
 			status = perform_channel_equalization_sequence(link,
+					link_res,
 					lt_settings,
 					repeater_id);
 
@@ -2384,9 +2397,10 @@ static enum link_training_result dp_perform_8b_10b_link_training(
 	}
 
 	if (status == LINK_TRAINING_SUCCESS) {
-		status = perform_clock_recovery_sequence(link, lt_settings, DPRX);
+		status = perform_clock_recovery_sequence(link, link_res, lt_settings, DPRX);
 	if (status == LINK_TRAINING_SUCCESS) {
 		status = perform_channel_equalization_sequence(link,
+					link_res,
 					lt_settings,
 					DPRX);
 		}
@@ -2398,6 +2412,7 @@ static enum link_training_result dp_perform_8b_10b_link_training(
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 static enum link_training_result dp_perform_128b_132b_link_training(
 		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings)
 {
 	enum link_training_result result = LINK_TRAINING_SUCCESS;
@@ -2409,16 +2424,16 @@ static enum link_training_result dp_perform_128b_132b_link_training(
 		decide_8b_10b_training_settings(link,
 				&lt_settings->link_settings,
 				&legacy_settings);
-		return dp_perform_8b_10b_link_training(link, &legacy_settings);
+		return dp_perform_8b_10b_link_training(link, link_res, &legacy_settings);
 	}
 
 	dpcd_set_link_settings(link, lt_settings);
 
 	if (result == LINK_TRAINING_SUCCESS)
-		result = dp_perform_128b_132b_channel_eq_done_sequence(link, lt_settings);
+		result = dp_perform_128b_132b_channel_eq_done_sequence(link, link_res, lt_settings);
 
 	if (result == LINK_TRAINING_SUCCESS)
-		result = dp_perform_128b_132b_cds_done_sequence(link, lt_settings);
+		result = dp_perform_128b_132b_cds_done_sequence(link, link_res, lt_settings);
 
 	return result;
 }
@@ -2426,6 +2441,7 @@ static enum link_training_result dp_perform_128b_132b_link_training(
 
 static enum link_training_result dc_link_dp_perform_fixed_vs_pe_training_sequence(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct link_training_settings *lt_settings)
 {
 	const uint8_t vendor_lttpr_write_data_reset[4] = {0x1, 0x50, 0x63, 0xFF};
@@ -2554,6 +2570,7 @@ static enum link_training_result dc_link_dp_perform_fixed_vs_pe_training_sequenc
 			/* 1. call HWSS to set lane settings */
 			dp_set_hw_lane_settings(
 					link,
+					link_res,
 					lt_settings,
 					0);
 
@@ -2670,14 +2687,14 @@ static enum link_training_result dc_link_dp_perform_fixed_vs_pe_training_sequenc
 		/* Note: also check that TPS4 is a supported feature*/
 		tr_pattern = lt_settings->pattern_for_eq;
 
-		dp_set_hw_training_pattern(link, tr_pattern, 0);
+		dp_set_hw_training_pattern(link, link_res, tr_pattern, 0);
 
 		status = LINK_TRAINING_EQ_FAIL_EQ;
 
 		for (retries_ch_eq = 0; retries_ch_eq <= LINK_TRAINING_MAX_RETRY_COUNT;
 			retries_ch_eq++) {
 
-			dp_set_hw_lane_settings(link, lt_settings, 0);
+			dp_set_hw_lane_settings(link, link_res, lt_settings, 0);
 
 			vendor_lttpr_write_data_vs[3] = 0;
 			vendor_lttpr_write_data_pe[3] = 0;
@@ -2758,6 +2775,7 @@ static enum link_training_result dc_link_dp_perform_fixed_vs_pe_training_sequenc
 
 enum link_training_result dc_link_dp_perform_link_training(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	const struct dc_link_settings *link_settings,
 	bool skip_video_pattern)
 {
@@ -2788,7 +2806,7 @@ enum link_training_result dc_link_dp_perform_link_training(
 
 	/* configure link prior to entering training mode */
 	dpcd_configure_lttpr_mode(link, &lt_settings);
-	dp_set_fec_ready(link, lt_settings.should_set_fec_ready);
+	dp_set_fec_ready(link, link_res, lt_settings.should_set_fec_ready);
 	dpcd_configure_channel_coding(link, &lt_settings);
 
 	/* enter training mode:
@@ -2798,12 +2816,12 @@ enum link_training_result dc_link_dp_perform_link_training(
 	if (!link->dc->debug.apply_vendor_specific_lttpr_wa &&
 			(link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) &&
 			link->lttpr_mode == LTTPR_MODE_TRANSPARENT)
-		status = dc_link_dp_perform_fixed_vs_pe_training_sequence(link, &lt_settings);
+		status = dc_link_dp_perform_fixed_vs_pe_training_sequence(link, link_res, &lt_settings);
 	else if (encoding == DP_8b_10b_ENCODING)
-		status = dp_perform_8b_10b_link_training(link, &lt_settings);
+		status = dp_perform_8b_10b_link_training(link, link_res, &lt_settings);
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	else if (encoding == DP_128b_132b_ENCODING)
-		status = dp_perform_128b_132b_link_training(link, &lt_settings);
+		status = dp_perform_128b_132b_link_training(link, link_res, &lt_settings);
 #endif
 	else
 		ASSERT(0);
@@ -2821,6 +2839,7 @@ enum link_training_result dc_link_dp_perform_link_training(
 	/* switch to video idle */
 	if ((status == LINK_TRAINING_SUCCESS) || !skip_video_pattern)
 		status = dp_transition_to_video_idle(link,
+				link_res,
 				&lt_settings,
 				status);
 
@@ -2872,6 +2891,7 @@ bool perform_link_training_with_retries(
 
 		dp_enable_link_phy(
 			link,
+			&pipe_ctx->link_res,
 			signal,
 			pipe_ctx->clock_source->id,
 			&current_setting);
@@ -2899,23 +2919,24 @@ bool perform_link_training_with_retries(
 		dp_set_panel_mode(link, panel_mode);
 
 		if (link->aux_access_disabled) {
-			dc_link_dp_perform_link_training_skip_aux(link, &current_setting);
+			dc_link_dp_perform_link_training_skip_aux(link, &pipe_ctx->link_res, &current_setting);
 			return true;
 		} else {
 			/** @todo Consolidate USB4 DP and DPx.x training. */
 			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
 				status = dc_link_dpia_perform_link_training(link,
-									    &current_setting,
-									    skip_video_pattern);
+						&pipe_ctx->link_res,
+						&current_setting,
+						skip_video_pattern);
 
 				/* Transmit idle pattern once training successful. */
 				if (status == LINK_TRAINING_SUCCESS)
-					dp_set_hw_test_pattern(link, DP_TEST_PATTERN_VIDEO_MODE,
-							       NULL, 0);
+					dp_set_hw_test_pattern(link, &pipe_ctx->link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
 			} else {
 				status = dc_link_dp_perform_link_training(link,
-									  &current_setting,
-									  skip_video_pattern);
+						&pipe_ctx->link_res,
+						&current_setting,
+						skip_video_pattern);
 			}
 
 			if (status == LINK_TRAINING_SUCCESS)
@@ -2930,7 +2951,7 @@ bool perform_link_training_with_retries(
 		DC_LOG_WARNING("%s: Link training attempt %u of %d failed\n",
 			__func__, (unsigned int)j + 1, attempts);
 
-		dp_disable_link_phy(link, signal);
+		dp_disable_link_phy(link, &pipe_ctx->link_res, signal);
 
 		/* Abort link training if failure due to sink being unplugged. */
 		if (status == LINK_TRAINING_ABORT) {
@@ -2979,12 +3000,13 @@ static enum clock_source_id get_clock_source_id(struct dc_link *link)
 	return dp_cs_id;
 }
 
-static void set_dp_mst_mode(struct dc_link *link, bool mst_enable)
+static void set_dp_mst_mode(struct dc_link *link, const struct link_resource *link_res,
+		bool mst_enable)
 {
 	if (mst_enable == false &&
 		link->type == dc_connection_mst_branch) {
 		/* Disable MST on link. Use only local sink. */
-		dp_disable_link_phy_mst(link, link->connector_signal);
+		dp_disable_link_phy_mst(link, link_res, link->connector_signal);
 
 		link->type = dc_connection_single;
 		link->local_sink = link->remote_sinks[0];
@@ -2995,7 +3017,7 @@ static void set_dp_mst_mode(struct dc_link *link, bool mst_enable)
 			link->type == dc_connection_single &&
 			link->remote_sinks[0] != NULL) {
 		/* Re-enable MST on link. */
-		dp_disable_link_phy(link, link->connector_signal);
+		dp_disable_link_phy(link, link_res, link->connector_signal);
 		dp_enable_mst_on_sink(link, true);
 
 		link->type = dc_connection_mst_branch;
@@ -3021,6 +3043,7 @@ bool dc_link_dp_sync_lt_begin(struct dc_link *link)
 
 enum link_training_result dc_link_dp_sync_lt_attempt(
     struct dc_link *link,
+    const struct link_resource *link_res,
     struct dc_link_settings *link_settings,
     struct dc_link_training_overrides *lt_overrides)
 {
@@ -3040,14 +3063,14 @@ enum link_training_result dc_link_dp_sync_lt_attempt(
 			&lt_settings);
 	/* Setup MST Mode */
 	if (lt_overrides->mst_enable)
-		set_dp_mst_mode(link, *lt_overrides->mst_enable);
+		set_dp_mst_mode(link, link_res, *lt_overrides->mst_enable);
 
 	/* Disable link */
-	dp_disable_link_phy(link, link->connector_signal);
+	dp_disable_link_phy(link, link_res, link->connector_signal);
 
 	/* Enable link */
 	dp_cs_id = get_clock_source_id(link);
-	dp_enable_link_phy(link, link->connector_signal,
+	dp_enable_link_phy(link, link_res, link->connector_signal,
 		dp_cs_id, link_settings);
 
 	/* Set FEC enable */
@@ -3055,7 +3078,7 @@ enum link_training_result dc_link_dp_sync_lt_attempt(
 	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
 #endif
 		fec_enable = lt_overrides->fec_enable && *lt_overrides->fec_enable;
-		dp_set_fec_ready(link, fec_enable);
+		dp_set_fec_ready(link, NULL, fec_enable);
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	}
 #endif
@@ -3072,7 +3095,7 @@ enum link_training_result dc_link_dp_sync_lt_attempt(
 
 	/* Attempt to train with given link training settings */
 	if (link->ctx->dc->work_arounds.lt_early_cr_pattern)
-		start_clock_recovery_pattern_early(link, &lt_settings, DPRX);
+		start_clock_recovery_pattern_early(link, link_res, &lt_settings, DPRX);
 
 	/* Set link rate, lane count and spread. */
 	dpcd_set_link_settings(link, &lt_settings);
@@ -3080,9 +3103,10 @@ enum link_training_result dc_link_dp_sync_lt_attempt(
 	/* 2. perform link training (set link training done
 	 *  to false is done as well)
 	 */
-	lt_status = perform_clock_recovery_sequence(link, &lt_settings, DPRX);
+	lt_status = perform_clock_recovery_sequence(link, link_res, &lt_settings, DPRX);
 	if (lt_status == LINK_TRAINING_SUCCESS) {
 		lt_status = perform_channel_equalization_sequence(link,
+						link_res,
 						&lt_settings,
 						DPRX);
 	}
@@ -3103,11 +3127,11 @@ bool dc_link_dp_sync_lt_end(struct dc_link *link, bool link_down)
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 		struct dc_link_settings link_settings = link->cur_link_settings;
 #endif
-		dp_disable_link_phy(link, link->connector_signal);
+		dp_disable_link_phy(link, NULL, link->connector_signal);
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING)
 #endif
-			dp_set_fec_ready(link, false);
+			dp_set_fec_ready(link, NULL, false);
 	}
 
 	link->sync_lt_in_progress = false;
@@ -3162,7 +3186,8 @@ bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_
 	return false;
 }
 
-static struct dc_link_settings get_max_link_cap(struct dc_link *link)
+static struct dc_link_settings get_max_link_cap(struct dc_link *link,
+		const struct link_resource *link_res)
 {
 	struct dc_link_settings max_link_cap = {0};
 #if defined(CONFIG_DRM_AMD_DC_DCN)
@@ -3345,6 +3370,7 @@ bool hpd_rx_irq_check_link_loss_status(
 
 bool dp_verify_link_cap(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct dc_link_settings *known_limit_link_setting,
 	int *fail_count)
 {
@@ -3362,7 +3388,7 @@ bool dp_verify_link_cap(
 	/* link training starts with the maximum common settings
 	 * supported by both sink and ASIC.
 	 */
-	max_link_cap = get_max_link_cap(link);
+	max_link_cap = get_max_link_cap(link, link_res);
 	initial_link_settings = get_common_supported_link_settings(
 			*known_limit_link_setting,
 			max_link_cap);
@@ -3402,7 +3428,7 @@ bool dp_verify_link_cap(
 	 * find the physical link capability
 	 */
 	/* disable PHY done possible by BIOS, will be done by driver itself */
-	dp_disable_link_phy(link, link->connector_signal);
+	dp_disable_link_phy(link, link_res, link->connector_signal);
 
 	dp_cs_id = get_clock_source_id(link);
 
@@ -3414,8 +3440,8 @@ bool dp_verify_link_cap(
 	 */
 	if (link->link_enc && link->link_enc->features.flags.bits.DP_IS_USB_C &&
 			link->dc->debug.usbc_combo_phy_reset_wa) {
-		dp_enable_link_phy(link, link->connector_signal, dp_cs_id, cur);
-		dp_disable_link_phy(link, link->connector_signal);
+		dp_enable_link_phy(link, link_res, link->connector_signal, dp_cs_id, cur);
+		dp_disable_link_phy(link, link_res, link->connector_signal);
 	}
 
 	do {
@@ -3426,6 +3452,7 @@ bool dp_verify_link_cap(
 
 		dp_enable_link_phy(
 				link,
+				link_res,
 				link->connector_signal,
 				dp_cs_id,
 				cur);
@@ -3436,6 +3463,7 @@ bool dp_verify_link_cap(
 		else {
 			status = dc_link_dp_perform_link_training(
 							link,
+							link_res,
 							cur,
 							skip_video_pattern);
 			if (status == LINK_TRAINING_SUCCESS)
@@ -3457,7 +3485,7 @@ bool dp_verify_link_cap(
 		 * setting or before returning we'll enable it later
 		 * based on the actual mode we're driving
 		 */
-		dp_disable_link_phy(link, link->connector_signal);
+		dp_disable_link_phy(link, link_res, link->connector_signal);
 	} while (!success && decide_fallback_link_setting(link,
 			initial_link_settings, cur, status));
 
@@ -3481,6 +3509,7 @@ bool dp_verify_link_cap(
 
 bool dp_verify_link_cap_with_retries(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct dc_link_settings *known_limit_link_setting,
 	int attempts)
 {
@@ -3498,7 +3527,7 @@ bool dp_verify_link_cap_with_retries(
 			link->verified_link_cap.link_rate = LINK_RATE_LOW;
 			link->verified_link_cap.link_spread = LINK_SPREAD_DISABLED;
 			break;
-		} else if (dp_verify_link_cap(link,
+		} else if (dp_verify_link_cap(link, link_res,
 				known_limit_link_setting,
 				&fail_count) && fail_count == 0) {
 			success = true;
@@ -3510,13 +3539,13 @@ bool dp_verify_link_cap_with_retries(
 }
 
 bool dp_verify_mst_link_cap(
-	struct dc_link *link)
+	struct dc_link *link, const struct link_resource *link_res)
 {
 	struct dc_link_settings max_link_cap = {0};
 
 	if (dp_get_link_encoding_format(&link->reported_link_cap) ==
 			DP_8b_10b_ENCODING) {
-		max_link_cap = get_max_link_cap(link);
+		max_link_cap = get_max_link_cap(link, link_res);
 		link->verified_link_cap = get_common_supported_link_settings(
 				link->reported_link_cap,
 				max_link_cap);
@@ -3525,6 +3554,7 @@ bool dp_verify_mst_link_cap(
 	else if (dp_get_link_encoding_format(&link->reported_link_cap) ==
 			DP_128b_132b_ENCODING) {
 		dp_verify_link_cap_with_retries(link,
+				link_res,
 				&link->reported_link_cap,
 				LINK_TRAINING_MAX_VERIFY_RETRY);
 	}
@@ -6053,7 +6083,7 @@ bool dc_link_dp_set_test_pattern(
 			DP_TEST_PATTERN_VIDEO_MODE) {
 		/* Set CRTC Test Pattern */
 		set_crtc_test_pattern(link, pipe_ctx, test_pattern, test_pattern_color_space);
-		dp_set_hw_test_pattern(link, test_pattern,
+		dp_set_hw_test_pattern(link, &pipe_ctx->link_res, test_pattern,
 				(uint8_t *)p_custom_pattern,
 				(uint32_t)cust_pattern_size);
 
@@ -6084,7 +6114,7 @@ bool dc_link_dp_set_test_pattern(
 						p_link_settings->dpcd_lane_settings,
 						p_link_settings->link_settings.lane_count);
 			} else {
-				dp_set_hw_lane_settings(link, p_link_settings, DPRX);
+				dp_set_hw_lane_settings(link, &pipe_ctx->link_res, p_link_settings, DPRX);
 				dpcd_set_lane_settings(link, p_link_settings, DPRX);
 			}
 		}
@@ -6099,7 +6129,7 @@ bool dc_link_dp_set_test_pattern(
 			pipes->stream_res.stream_enc->funcs->dp_blank(link, pipe_ctx->stream_res.stream_enc);
 		}
 
-		dp_set_hw_test_pattern(link, test_pattern,
+		dp_set_hw_test_pattern(link, &pipe_ctx->link_res, test_pattern,
 				(uint8_t *)p_custom_pattern,
 				(uint32_t)cust_pattern_size);
 
@@ -6419,7 +6449,7 @@ enum dp_panel_mode dp_get_panel_mode(struct dc_link *link)
 	return DP_PANEL_MODE_DEFAULT;
 }
 
-enum dc_status dp_set_fec_ready(struct dc_link *link, bool ready)
+enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource *link_res, bool ready)
 {
 	/* FEC has to be "set ready" before the link training.
 	 * The policy is to always train with FEC
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
index d72122593959..0e95bc5df4e7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
@@ -77,7 +77,9 @@ enum dc_status dpcd_get_tunneling_device_data(struct dc_link *link)
  * @param[in] link_setting Lane count, link rate and downspread control.
  * @param[out] lt_settings Link settings and drive settings (voltage swing and pre-emphasis).
  */
-static enum link_training_result dpia_configure_link(struct dc_link *link,
+static enum link_training_result dpia_configure_link(
+		struct dc_link *link,
+		const struct link_resource *link_res,
 		const struct dc_link_settings *link_setting,
 		struct link_training_settings *lt_settings)
 {
@@ -111,7 +113,7 @@ static enum link_training_result dpia_configure_link(struct dc_link *link,
 		fec_enable = *link->preferred_training_settings.fec_enable;
 	else
 		fec_enable = true;
-	status = dp_set_fec_ready(link, fec_enable);
+	status = dp_set_fec_ready(link, link_res, fec_enable);
 	if (status != DC_OK && link->is_hpd_pending)
 		return LINK_TRAINING_ABORT;
 
@@ -252,7 +254,9 @@ static enum dc_status dpcd_set_lt_pattern(struct dc_link *link,
  * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
  * @param hop The Hop in display path. DPRX = 0.
  */
-static enum link_training_result dpia_training_cr_non_transparent(struct dc_link *link,
+static enum link_training_result dpia_training_cr_non_transparent(
+		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings,
 		uint32_t hop)
 {
@@ -411,7 +415,9 @@ static enum link_training_result dpia_training_cr_non_transparent(struct dc_link
  * @param link DPIA link being trained.
  * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
  */
-static enum link_training_result dpia_training_cr_transparent(struct dc_link *link,
+static enum link_training_result dpia_training_cr_transparent(
+		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings)
 {
 	enum link_training_result result = LINK_TRAINING_CR_FAIL_LANE0;
@@ -511,16 +517,18 @@ static enum link_training_result dpia_training_cr_transparent(struct dc_link *li
  * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
  * @param hop The Hop in display path. DPRX = 0.
  */
-static enum link_training_result dpia_training_cr_phase(struct dc_link *link,
+static enum link_training_result dpia_training_cr_phase(
+		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings,
 		uint32_t hop)
 {
 	enum link_training_result result = LINK_TRAINING_CR_FAIL_LANE0;
 
 	if (link->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
-		result = dpia_training_cr_non_transparent(link, lt_settings, hop);
+		result = dpia_training_cr_non_transparent(link, link_res, lt_settings, hop);
 	else
-		result = dpia_training_cr_transparent(link, lt_settings);
+		result = dpia_training_cr_transparent(link, link_res, lt_settings);
 
 	return result;
 }
@@ -561,7 +569,9 @@ static uint32_t dpia_get_eq_aux_rd_interval(const struct dc_link *link,
  * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
  * @param hop The Hop in display path. DPRX = 0.
  */
-static enum link_training_result dpia_training_eq_non_transparent(struct dc_link *link,
+static enum link_training_result dpia_training_eq_non_transparent(
+		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings,
 		uint32_t hop)
 {
@@ -700,7 +710,9 @@ static enum link_training_result dpia_training_eq_non_transparent(struct dc_link
  * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
  * @param hop The Hop in display path. DPRX = 0.
  */
-static enum link_training_result dpia_training_eq_transparent(struct dc_link *link,
+static enum link_training_result dpia_training_eq_transparent(
+		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings)
 {
 	enum link_training_result result = LINK_TRAINING_EQ_FAIL_EQ;
@@ -779,16 +791,18 @@ static enum link_training_result dpia_training_eq_transparent(struct dc_link *li
  * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
  * @param hop The Hop in display path. DPRX = 0.
  */
-static enum link_training_result dpia_training_eq_phase(struct dc_link *link,
+static enum link_training_result dpia_training_eq_phase(
+		struct dc_link *link,
+		const struct link_resource *link_res,
 		struct link_training_settings *lt_settings,
 		uint32_t hop)
 {
 	enum link_training_result result;
 
 	if (link->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
-		result = dpia_training_eq_non_transparent(link, lt_settings, hop);
+		result = dpia_training_eq_non_transparent(link, link_res, lt_settings, hop);
 	else
-		result = dpia_training_eq_transparent(link, lt_settings);
+		result = dpia_training_eq_transparent(link, link_res, lt_settings);
 
 	return result;
 }
@@ -908,7 +922,9 @@ static void dpia_training_abort(struct dc_link *link, uint32_t hop)
 	core_link_send_set_config(link, DPIA_SET_CFG_SET_LINK, data);
 }
 
-enum link_training_result dc_link_dpia_perform_link_training(struct dc_link *link,
+enum link_training_result dc_link_dpia_perform_link_training(
+	struct dc_link *link,
+	const struct link_resource *link_res,
 	const struct dc_link_settings *link_setting,
 	bool skip_video_pattern)
 {
@@ -918,7 +934,7 @@ enum link_training_result dc_link_dpia_perform_link_training(struct dc_link *lin
 	int8_t repeater_id; /* Current hop. */
 
 	/* Configure link as prescribed in link_setting and set LTTPR mode. */
-	result = dpia_configure_link(link, link_setting, &lt_settings);
+	result = dpia_configure_link(link, link_res, link_setting, &lt_settings);
 	if (result != LINK_TRAINING_SUCCESS)
 		return result;
 
@@ -930,12 +946,12 @@ enum link_training_result dc_link_dpia_perform_link_training(struct dc_link *lin
 	 */
 	for (repeater_id = repeater_cnt; repeater_id >= 0; repeater_id--) {
 		/* Clock recovery. */
-		result = dpia_training_cr_phase(link, &lt_settings, repeater_id);
+		result = dpia_training_cr_phase(link, link_res, &lt_settings, repeater_id);
 		if (result != LINK_TRAINING_SUCCESS)
 			break;
 
 		/* Equalization. */
-		result = dpia_training_eq_phase(link, &lt_settings, repeater_id);
+		result = dpia_training_eq_phase(link, link_res, &lt_settings, repeater_id);
 		if (result != LINK_TRAINING_SUCCESS)
 			break;
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 368e834c6809..10d7f986011d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -71,6 +71,7 @@ void dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode)
 
 void dp_enable_link_phy(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	enum signal_type signal,
 	enum clock_source_id clock_source,
 	const struct dc_link_settings *link_settings)
@@ -135,7 +136,7 @@ void dp_enable_link_phy(
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
-		enable_dp_hpo_output(link, link_settings);
+		enable_dp_hpo_output(link, link_res, link_settings);
 	} else if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
 		if (dc_is_dp_sst_signal(signal)) {
 			link_enc->funcs->enable_dp_output(
@@ -236,7 +237,8 @@ bool edp_receiver_ready_T7(struct dc_link *link)
 	return result;
 }
 
-void dp_disable_link_phy(struct dc_link *link, enum signal_type signal)
+void dp_disable_link_phy(struct dc_link *link, const struct link_resource *link_res,
+		enum signal_type signal)
 {
 	struct dc  *dc = link->ctx->dc;
 	struct dmcu *dmcu = dc->res_pool->dmcu;
@@ -260,7 +262,7 @@ void dp_disable_link_phy(struct dc_link *link, enum signal_type signal)
 			link->dc->hwss.edp_backlight_control(link, false);
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING)
-			disable_dp_hpo_output(link, signal);
+			disable_dp_hpo_output(link, link_res, signal);
 		else
 			link_enc->funcs->disable_output(link_enc, signal);
 #else
@@ -274,7 +276,7 @@ void dp_disable_link_phy(struct dc_link *link, enum signal_type signal)
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING &&
 				hpo_link_enc)
-			disable_dp_hpo_output(link, signal);
+			disable_dp_hpo_output(link, link_res, signal);
 		else
 			link_enc->funcs->disable_output(link_enc, signal);
 #else
@@ -294,13 +296,14 @@ void dp_disable_link_phy(struct dc_link *link, enum signal_type signal)
 		dc->clk_mgr->funcs->notify_link_rate_change(dc->clk_mgr, link);
 }
 
-void dp_disable_link_phy_mst(struct dc_link *link, enum signal_type signal)
+void dp_disable_link_phy_mst(struct dc_link *link, const struct link_resource *link_res,
+		enum signal_type signal)
 {
 	/* MST disable link only when no stream use the link */
 	if (link->mst_stream_alloc_table.stream_count > 0)
 		return;
 
-	dp_disable_link_phy(link, signal);
+	dp_disable_link_phy(link, link_res, signal);
 
 	/* set the sink to SST mode after disabling the link */
 	dp_enable_mst_on_sink(link, false);
@@ -308,6 +311,7 @@ void dp_disable_link_phy_mst(struct dc_link *link, enum signal_type signal)
 
 bool dp_set_hw_training_pattern(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	enum dc_dp_training_pattern pattern,
 	uint32_t offset)
 {
@@ -338,7 +342,7 @@ bool dp_set_hw_training_pattern(
 		break;
 	}
 
-	dp_set_hw_test_pattern(link, test_pattern, NULL, 0);
+	dp_set_hw_test_pattern(link, link_res, test_pattern, NULL, 0);
 
 	return true;
 }
@@ -349,6 +353,7 @@ bool dp_set_hw_training_pattern(
 #endif
 void dp_set_hw_lane_settings(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	const struct link_training_settings *link_settings,
 	uint32_t offset)
 {
@@ -379,6 +384,7 @@ void dp_set_hw_lane_settings(
 
 void dp_set_hw_test_pattern(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	enum dp_test_pattern test_pattern,
 	uint8_t *custom_pattern,
 	uint32_t custom_pattern_size)
@@ -446,7 +452,7 @@ void dp_retrain_link_dp_test(struct dc_link *link,
 					pipes[i].stream_res.stream_enc);
 
 			/* disable any test pattern that might be active */
-			dp_set_hw_test_pattern(link,
+			dp_set_hw_test_pattern(link, &pipes[i].link_res,
 					DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
 
 			dp_receiver_power_ctrl(link, false);
@@ -763,7 +769,9 @@ static enum phyd32clk_clock_source get_phyd32clk_src(struct dc_link *link)
 	}
 }
 
-void enable_dp_hpo_output(struct dc_link *link, const struct dc_link_settings *link_settings)
+void enable_dp_hpo_output(struct dc_link *link,
+		const struct link_resource *link_res,
+		const struct dc_link_settings *link_settings)
 {
 	const struct dc *dc = link->dc;
 	enum phyd32clk_clock_source phyd32clk;
@@ -814,7 +822,9 @@ void enable_dp_hpo_output(struct dc_link *link, const struct dc_link_settings *l
 	}
 }
 
-void disable_dp_hpo_output(struct dc_link *link, enum signal_type signal)
+void disable_dp_hpo_output(struct dc_link *link,
+		const struct link_resource *link_res,
+		enum signal_type signal)
 {
 	const struct dc *dc = link->dc;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index 4ebba641538b..88d11724db5d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -30,6 +30,8 @@
 #include "dc_types.h"
 #include "grph_object_defs.h"
 
+struct link_resource;
+
 enum dc_link_fec_state {
 	dc_link_fec_not_ready,
 	dc_link_fec_ready,
@@ -359,14 +361,17 @@ void dc_link_remove_remote_sink(
 
 void dc_link_dp_set_drive_settings(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct link_training_settings *lt_settings);
 
 bool dc_link_dp_perform_link_training_skip_aux(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	const struct dc_link_settings *link_setting);
 
 enum link_training_result dc_link_dp_perform_link_training(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	const struct dc_link_settings *link_settings,
 	bool skip_video_pattern);
 
@@ -374,6 +379,7 @@ bool dc_link_dp_sync_lt_begin(struct dc_link *link);
 
 enum link_training_result dc_link_dp_sync_lt_attempt(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct dc_link_settings *link_setting,
 	struct dc_link_training_overrides *lt_settings);
 
@@ -454,4 +460,6 @@ bool dc_link_should_enable_fec(const struct dc_link *link);
 uint32_t dc_link_bw_kbps_from_raw_frl_link_rate_data(uint8_t bw);
 enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link);
 #endif
+
+const struct link_resource *dc_link_get_cur_link_res(const struct dc_link *link);
 #endif /* DC_LINK_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index f3c0e70073da..9381ea0549d8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -334,6 +334,11 @@ struct plane_resource {
 	struct dcn_fe_bandwidth bw;
 };
 
+/* all mappable hardware resources used to enable a link */
+struct link_resource {
+	void *dummy;
+};
+
 union pipe_update_flags {
 	struct {
 		uint32_t enable : 1;
@@ -361,6 +366,7 @@ struct pipe_ctx {
 
 	struct plane_resource plane_res;
 	struct stream_resource stream_res;
+	struct link_resource link_res;
 
 	struct clock_source *clock_source;
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
index 52bdfea7897b..cd52813a8432 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
@@ -56,16 +56,19 @@ enum {
 
 bool dp_verify_link_cap(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct dc_link_settings *known_limit_link_setting,
 	int *fail_count);
 
 bool dp_verify_link_cap_with_retries(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	struct dc_link_settings *known_limit_link_setting,
 	int attempts);
 
 bool dp_verify_mst_link_cap(
-	struct dc_link *link);
+	struct dc_link *link,
+	const struct link_resource *link_res);
 
 bool dp_validate_mode_timing(
 	struct dc_link *link,
@@ -168,7 +171,7 @@ uint8_t dc_dp_initialize_scrambling_data_symbols(
 	struct dc_link *link,
 	enum dc_dp_training_pattern pattern);
 
-enum dc_status dp_set_fec_ready(struct dc_link *link, bool ready);
+enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource *link_res, bool ready);
 void dp_set_fec_enable(struct dc_link *link, bool enable);
 struct link_encoder *dp_get_link_enc(struct dc_link *link);
 bool dp_set_dsc_enable(struct pipe_ctx *pipe_ctx, bool enable);
@@ -211,8 +214,12 @@ bool dpcd_poll_for_allocation_change_trigger(struct dc_link *link);
 struct fixed31_32 calculate_sst_avg_time_slots_per_mtp(
 		const struct dc_stream_state *stream,
 		const struct dc_link *link);
-void enable_dp_hpo_output(struct dc_link *link, const struct dc_link_settings *link_settings);
-void disable_dp_hpo_output(struct dc_link *link, enum signal_type signal);
+void enable_dp_hpo_output(struct dc_link *link,
+		const struct link_resource *link_res,
+		const struct dc_link_settings *link_settings);
+void disable_dp_hpo_output(struct dc_link *link,
+		const struct link_resource *link_res,
+		enum signal_type signal);
 void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable);
 bool is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx);
 void reset_dp_hpo_stream_encoders_for_link(struct dc_link *link);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
index 974d703e3771..74dafd0f9d3d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
@@ -91,8 +91,9 @@ enum dc_status dpcd_get_tunneling_device_data(struct dc_link *link);
  * DPIA equivalent of dc_link_dp_perfrorm_link_training.
  * Aborts link training upon detection of sink unplug.
  */
-enum link_training_result
-dc_link_dpia_perform_link_training(struct dc_link *link,
+enum link_training_result dc_link_dpia_perform_link_training(
+	struct dc_link *link,
+	const struct link_resource *link_res,
 	const struct dc_link_settings *link_setting,
 	bool skip_video_pattern);
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h b/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
index ba664bc49595..69d63763a10e 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
@@ -32,6 +32,7 @@ struct gpio *get_hpd_gpio(struct dc_bios *dcb,
 
 void dp_enable_link_phy(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	enum signal_type signal,
 	enum clock_source_id clock_source,
 	const struct dc_link_settings *link_settings);
@@ -42,22 +43,27 @@ void edp_add_delay_for_T9(struct dc_link *link);
 bool edp_receiver_ready_T9(struct dc_link *link);
 bool edp_receiver_ready_T7(struct dc_link *link);
 
-void dp_disable_link_phy(struct dc_link *link, enum signal_type signal);
+void dp_disable_link_phy(struct dc_link *link, const struct link_resource *link_res,
+		enum signal_type signal);
 
-void dp_disable_link_phy_mst(struct dc_link *link, enum signal_type signal);
+void dp_disable_link_phy_mst(struct dc_link *link, const struct link_resource *link_res,
+		enum signal_type signal);
 
 bool dp_set_hw_training_pattern(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	enum dc_dp_training_pattern pattern,
 	uint32_t offset);
 
 void dp_set_hw_lane_settings(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	const struct link_training_settings *link_settings,
 	uint32_t offset);
 
 void dp_set_hw_test_pattern(
 	struct dc_link *link,
+	const struct link_resource *link_res,
 	enum dp_test_pattern test_pattern,
 	uint8_t *custom_pattern,
 	uint32_t custom_pattern_size);
-- 
2.25.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF96A9B1F
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Mar 2023 16:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5731C10E6DA;
	Fri,  3 Mar 2023 15:49:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6142210E6DA
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Mar 2023 15:49:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3DbaITmy9r2kHOsS/D4Amvcwe9AQcKIolMI8mognQpEuZoxwFOPwATTiGP5sVCO0DihCp8EIcDPGL9Goz5juKH6lc3ul5Y4ByXFeUjI1vrqHHu7KJh9tRhIJxD88cL3yHcKSX7HxKgvBfErmHDIaiXtUP3+Jw5eOZLGFaQBMyJ39ImCn2ErwqfHPpr7eMUzPyUGXmGi3+dqcfGN4NzR/OwL+QptYNtGIEC7SVWR838Dm+DbGrRrPocoiej64xg38rPmm8sYNlRcVSIVoMGjJN4sHYx4h+PnYf9BNt9rpRXgSIsIgKbGwhZcvhJyD8fIEsogUpFbaYiZ9DZhSbx8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAla+AkxdPSH9lL9OAZNNiTVOZSgcQ5gX6++X6Kljog=;
 b=lNAp/flU5CEFkDB45lgKYJZE4Ra1Dd6Bv5iF16yrUTw020xS14noosEBGLQTAKqBabGAvttLADIMR1/iuhML8FJNeDtcoKOAXGynn1fUA2v3HfGBCfh1CUZZZH55CAHCFLWUFx29vT+OlmcukANmCo4lXInRSEEC08LkL4YmmNrQknfyknk7RwGD959kCf36O18OvOFZM9jcKvBbTE6AAViTd97oa5kMQrfmZKUDASNvpFzs0TOBbpYdyCnHNCOD1pb7eNHigNKE5ZINyOoRpl2udLTQ/IswiNmB1/rVjjE9TPxH683c4APeMSPtBtGqSyaEuB3bKlhXC9eXITaEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAla+AkxdPSH9lL9OAZNNiTVOZSgcQ5gX6++X6Kljog=;
 b=R+Jdxh2MMxKbRkGPY62AIeJ7svAhrZqI4TDWojhb1yKSSPl+Hw4aJIpguVu6vnvYEwh1BNjv3PK2wNofEpwKBtEG0JI3ud7nkW3KefOqGCakk7xyXQ+98UNqMf2AYEls8r3pnhprcKdXBLxWvZE8VwNRskh72MH4DuUt3wfk3cM=
Received: from DS7PR03CA0038.namprd03.prod.outlook.com (2603:10b6:5:3b5::13)
 by PH7PR12MB6720.namprd12.prod.outlook.com (2603:10b6:510:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 15:49:25 +0000
Received: from DS1PEPF0000E62E.namprd02.prod.outlook.com
 (2603:10b6:5:3b5:cafe::e7) by DS7PR03CA0038.outlook.office365.com
 (2603:10b6:5:3b5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 15:49:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E62E.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.12 via Frontend Transport; Fri, 3 Mar 2023 15:49:24 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 09:49:07 -0600
From: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/33] drm/amd/display: replace all dc_link function call in
 link with link functions
Date: Fri, 3 Mar 2023 10:40:06 -0500
Message-ID: <20230303154022.2667-18-qingqing.zhuo@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303154022.2667-1-qingqing.zhuo@amd.com>
References: <20230303154022.2667-1-qingqing.zhuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E62E:EE_|PH7PR12MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: f9fa6897-816f-4c88-46b9-08db1bfedd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7Q1VK3xjPsSAO4JCtTaNIjZN/NkIGKTtdB6ExIQGVUuKpSVHm8kYrdDqxU/CBYl4dQhFxi1DtE0MHU1xt09ndqEQdXpQm9ZYJRsWGI2jUyDFzJlHAsJYhmxG0kSyQUbXQF+XHvbXjDZsGzG+NJDHfmMgFz4ylappX9GR0QJyGTX63XuCekFg2Dw7AeckUK2aNggY4KoeDVei1NNb7+vJnHjwhf60AXaSVg9UFWUoGbRhanORRSI2Qln3ZrpSn/3ukJ/vx8SqSX57j4RkBfsrwhdviYbmhvEL/vT920ERwOHnnmfqL4kBukOY6uhHnSN8AH9GxHHrEzrb1yTrorEOLsT1Shv0El/796sFV4CpKMFFbwmQdPaczZltmZ15yRuvpcnxNDTc8S+85YOFLofgLtp11UrvbD8qL0K4QpepcPtXJ6e0Af1oWHCVxpuQLtO7olQvjr/+TtC6VZWsw9JCzEAm6bKjZULQ596VGddBHoj7RNfN/gE21si0vz6s3c74h9FLVmltq0Ab10aehBWg60F7CxRNP6yLb67flN+/l4i9SpcSdKYRpOy4uzQ2N19wm5HXDxYgCdSmVcwQzVCjB3XxU5A0qLVFbWogOtoL7tSsVqVa4P1g3cI+g21XuY5MoBcc2akqjWeecDWo9g8GVWYdKivjrDZOqaE+lEcrq9627Qx58DsDhztzbzHpgHvbyfV1sMyWVnpB7nEY0TPO4B/FYkWuWImuJKsGyqfrQQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199018)(40470700004)(46966006)(36840700001)(6916009)(40480700001)(8676002)(41300700001)(316002)(82310400005)(54906003)(4326008)(70586007)(36756003)(70206006)(2906002)(478600001)(356005)(36860700001)(1076003)(26005)(82740400003)(81166007)(426003)(47076005)(40460700003)(2616005)(336012)(86362001)(186003)(83380400001)(16526019)(44832011)(30864003)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 15:49:24.7143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fa6897-816f-4c88-46b9-08db1bfedd16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E62E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6720
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
 Wenjing Liu <wenjing.liu@amd.com>, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, wayne.lin@amd.com, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[why]
Link components should not reply on dc_link_exports to access link function in
other link components.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 .../display/dc/dcn31/dcn31_dio_link_encoder.c |  5 ++--
 .../display/dc/link/accessories/link_dp_cts.c |  6 ++--
 .../gpu/drm/amd/display/dc/link/link_dpms.c   |  2 +-
 .../drm/amd/display/dc/link/link_validation.c |  5 ++--
 .../dc/link/protocols/link_dp_capability.c    | 28 ++++++++++---------
 .../dc/link/protocols/link_dp_irq_handler.c   | 17 +++++------
 .../display/dc/link/protocols/link_dp_phy.c   |  8 +++---
 .../dc/link/protocols/link_dp_training.c      |  7 +++--
 .../dc/link/protocols/link_dp_training_dpia.c |  2 +-
 .../link/protocols/link_edp_panel_control.c   |  6 ++--
 10 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
index 275e78c06dee..745a5d187a98 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
@@ -37,6 +37,7 @@
 #include "link_enc_cfg.h"
 #include "dc_dmub_srv.h"
 #include "dal_asic_id.h"
+#include "link.h"
 
 #define CTX \
 	enc10->base.ctx
@@ -485,7 +486,7 @@ void dcn31_link_encoder_enable_dp_output(
 
 		if (link) {
 			dpia_control.dpia_id = link->ddc_hw_inst;
-			dpia_control.fec_rdy = dc_link_should_enable_fec(link);
+			dpia_control.fec_rdy = link->dc->link_srv->dp_should_enable_fec(link);
 		} else {
 			DC_LOG_ERROR("%s: Failed to execute DPIA enable DMUB command.\n", __func__);
 			BREAK_TO_DEBUGGER();
@@ -532,7 +533,7 @@ void dcn31_link_encoder_enable_dp_mst_output(
 
 		if (link) {
 			dpia_control.dpia_id = link->ddc_hw_inst;
-			dpia_control.fec_rdy = dc_link_should_enable_fec(link);
+			dpia_control.fec_rdy = link->dc->link_srv->dp_should_enable_fec(link);
 		} else {
 			DC_LOG_ERROR("%s: Failed to execute DPIA enable DMUB command.\n", __func__);
 			BREAK_TO_DEBUGGER();
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
index 080019f4252f..704373d4d110 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
@@ -250,7 +250,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 	/* prepare link training settings */
 	link_training_settings.link_settings = link->cur_link_settings;
 
-	link_training_settings.lttpr_mode = dc_link_decide_lttpr_mode(link, &link->cur_link_settings);
+	link_training_settings.lttpr_mode = dp_decide_lttpr_mode(link, &link->cur_link_settings);
 
 	if ((link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) &&
 			link_training_settings.lttpr_mode == LTTPR_MODE_TRANSPARENT)
@@ -408,7 +408,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 	 * all the time. Do not touch it.
 	 * forward request to DS
 	 */
-	dc_link_dp_set_test_pattern(
+	dp_set_test_pattern(
 		link,
 		test_pattern,
 		DP_TEST_PATTERN_COLOR_SPACE_UNDEFINED,
@@ -1006,5 +1006,5 @@ void dp_set_preferred_training_settings(struct dc *dc,
 
 	/* Retrain now, or wait until next stream update to apply */
 	if (skip_immediate_retrain == false)
-		dc_link_set_preferred_link_settings(dc, &link->preferred_link_setting, link);
+		dp_set_preferred_link_settings(dc, &link->preferred_link_setting, link);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index 650ac2a608ef..00d441cacbff 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -137,7 +137,7 @@ void link_blank_dp_stream(struct dc_link *link, bool hw_init)
 		}
 
 		if ((!link->wa_flags.dp_keep_receiver_powered) || hw_init)
-			dc_link_dp_receiver_power_ctrl(link, false);
+			dpcd_write_rx_power_ctrl(link, false);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_validation.c b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
index d4f6ee6ca948..b29f62337ba0 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_validation.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
@@ -29,6 +29,7 @@
  * provides helper functions exposing bandwidth formulas used in validation.
  */
 #include "link_validation.h"
+#include "protocols/link_dp_capability.h"
 #include "resource.h"
 
 #define DC_LOGGER_INIT(logger)
@@ -233,7 +234,7 @@ uint32_t dp_link_bandwidth_kbps(
 		 */
 		link_rate_per_lane_kbps = link_settings->link_rate * LINK_RATE_REF_FREQ_IN_KHZ * BITS_PER_DP_BYTE;
 		total_data_bw_efficiency_x10000 = DATA_EFFICIENCY_8b_10b_x10000;
-		if (dc_link_should_enable_fec(link)) {
+		if (dp_should_enable_fec(link)) {
 			total_data_bw_efficiency_x10000 /= 100;
 			total_data_bw_efficiency_x10000 *= DATA_EFFICIENCY_8b_10b_FEC_EFFICIENCY_x100;
 		}
@@ -329,7 +330,7 @@ static bool dp_validate_mode_timing(
 		timing->v_addressable == (uint32_t) 480)
 		return true;
 
-	link_setting = dc_link_get_link_cap(link);
+	link_setting = dp_get_verified_link_cap(link);
 
 	/* TODO: DYNAMIC_VALIDATION needs to be implemented */
 	/*if (flags.DYNAMIC_VALIDATION == 1 &&
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 97856c4d0904..75e1a687608a 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -42,6 +42,8 @@
 #include "link_edp_panel_control.h"
 #include "link_dp_irq_handler.h"
 #include "link/accessories/link_dp_trace.h"
+#include "link/link_detection.h"
+#include "link/link_validation.h"
 #include "link_dp_training.h"
 #include "atomfirmware.h"
 #include "resource.h"
@@ -278,7 +280,7 @@ static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
 
 	if (!link->dpcd_caps.dpcd_rev.raw) {
 		do {
-			dc_link_dp_receiver_power_ctrl(link, true);
+			dpcd_write_rx_power_ctrl(link, true);
 			core_link_read_dpcd(link, DP_DPCD_REV,
 							dpcd_data, length);
 			link->dpcd_caps.dpcd_rev.raw = dpcd_data[
@@ -342,7 +344,7 @@ bool dp_should_enable_fec(const struct dc_link *link)
 				|| !link->dc->caps.edp_dsc_support))
 		force_disable = true;
 
-	return !force_disable && dc_link_is_fec_supported(link);
+	return !force_disable && dp_is_fec_supported(link);
 }
 
 bool link_is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx)
@@ -645,7 +647,7 @@ static bool decide_dp_link_settings(struct dc_link *link, struct dc_link_setting
 			initial_link_setting;
 	uint32_t link_bw;
 
-	if (req_bw > dc_link_bandwidth_kbps(link, &link->verified_link_cap))
+	if (req_bw > dp_link_bandwidth_kbps(link, &link->verified_link_cap))
 		return false;
 
 	/* search for the minimum link setting that:
@@ -765,7 +767,7 @@ bool decide_edp_link_settings_with_dsc(struct dc_link *link,
 		initial_link_setting.use_link_rate_set = false;
 		initial_link_setting.link_rate_set = 0;
 		current_link_setting = initial_link_setting;
-		if (req_bw > dc_link_bandwidth_kbps(link, &link->verified_link_cap))
+		if (req_bw > dp_link_bandwidth_kbps(link, &link->verified_link_cap))
 			return false;
 
 		/* search for the minimum link setting that:
@@ -774,7 +776,7 @@ bool decide_edp_link_settings_with_dsc(struct dc_link *link,
 		 */
 		while (current_link_setting.link_rate <=
 				max_link_rate) {
-			link_bw = dc_link_bandwidth_kbps(
+			link_bw = dp_link_bandwidth_kbps(
 					link,
 					&current_link_setting);
 			if (req_bw <= link_bw) {
@@ -831,7 +833,7 @@ bool decide_edp_link_settings_with_dsc(struct dc_link *link,
 	 */
 	while (current_link_setting.link_rate <=
 			max_link_rate) {
-		link_bw = dc_link_bandwidth_kbps(
+		link_bw = dp_link_bandwidth_kbps(
 				link,
 				&current_link_setting);
 		if (req_bw <= link_bw) {
@@ -889,7 +891,7 @@ bool link_decide_link_settings(struct dc_stream_state *stream,
 	struct dc_link_settings *link_setting)
 {
 	struct dc_link *link = stream->link;
-	uint32_t req_bw = dc_bandwidth_in_kbps_from_timing(&stream->timing);
+	uint32_t req_bw = link_timing_bandwidth_kbps(&stream->timing);
 
 	memset(link_setting, 0, sizeof(*link_setting));
 
@@ -922,13 +924,13 @@ bool link_decide_link_settings(struct dc_stream_state *stream,
 
 				tmp_link_setting.link_rate = LINK_RATE_UNKNOWN;
 				tmp_timing.flags.DSC = 0;
-				orig_req_bw = dc_bandwidth_in_kbps_from_timing(&tmp_timing);
-				dc_link_decide_edp_link_settings(link, &tmp_link_setting, orig_req_bw);
+				orig_req_bw = link_timing_bandwidth_kbps(&tmp_timing);
+				edp_decide_link_settings(link, &tmp_link_setting, orig_req_bw);
 				max_link_rate = tmp_link_setting.link_rate;
 			}
 			decide_edp_link_settings_with_dsc(link, link_setting, req_bw, max_link_rate);
 		} else {
-			dc_link_decide_edp_link_settings(link, link_setting, req_bw);
+			edp_decide_link_settings(link, link_setting, req_bw);
 		}
 	} else {
 		decide_dp_link_settings(link, link_setting, req_bw);
@@ -2117,8 +2119,8 @@ static bool dp_verify_link_cap(
 		if (status == LINK_TRAINING_SUCCESS) {
 			success = true;
 			fsleep(1000);
-			if (dc_link_dp_read_hpd_rx_irq_data(link, &irq_data) == DC_OK &&
-					dc_link_check_link_loss_status(
+			if (dp_read_hpd_rx_irq_data(link, &irq_data) == DC_OK &&
+					dp_parse_link_loss_status(
 							link,
 							&irq_data))
 				(*fail_count)++;
@@ -2158,7 +2160,7 @@ bool dp_verify_link_cap_with_retries(
 
 		memset(&link->verified_link_cap, 0,
 				sizeof(struct dc_link_settings));
-		if (!dc_link_detect_connection_type(link, &type) || type == dc_connection_none) {
+		if (!link_detect_connection_type(link, &type) || type == dc_connection_none) {
 			link->verified_link_cap = fail_safe_link_settings;
 			break;
 		} else if (dp_verify_link_cap(link, known_limit_link_setting,
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
index 6611d0767bd4..ba95facc4ee8 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
@@ -33,6 +33,7 @@
 #include "link_dpcd.h"
 #include "link_dp_training.h"
 #include "link_dp_capability.h"
+#include "link_edp_panel_control.h"
 #include "link/accessories/link_dp_trace.h"
 #include "link/link_dpms.h"
 #include "dm_helpers.h"
@@ -155,9 +156,9 @@ static bool handle_hpd_irq_psr_sink(struct dc_link *link)
 			/* PSR error, disable and re-enable PSR */
 			if (link->psr_settings.psr_allow_active) {
 				allow_active = false;
-				dc_link_set_psr_allow_active(link, &allow_active, true, false, NULL);
+				edp_set_psr_allow_active(link, &allow_active, true, false, NULL);
 				allow_active = true;
-				dc_link_set_psr_allow_active(link, &allow_active, true, false, NULL);
+				edp_set_psr_allow_active(link, &allow_active, true, false, NULL);
 			}
 
 			return true;
@@ -289,7 +290,7 @@ bool dp_handle_hpd_rx_irq(struct dc_link *link,
 		 * dal_dpsst_ls_read_hpd_irq_data
 		 * Order of calls is important too
 		 */
-	result = dc_link_dp_read_hpd_rx_irq_data(link, &hpd_irq_dpcd_data);
+	result = dp_read_hpd_rx_irq_data(link, &hpd_irq_dpcd_data);
 	if (out_hpd_irq_dpcd_data)
 		*out_hpd_irq_dpcd_data = hpd_irq_dpcd_data;
 
@@ -316,7 +317,7 @@ bool dp_handle_hpd_rx_irq(struct dc_link *link,
 		return false;
 	}
 
-	if (!dc_link_dp_allow_hpd_rx_irq(link)) {
+	if (!dp_should_allow_hpd_rx_irq(link)) {
 		DC_LOG_HW_HPD_IRQ("%s: skipping HPD handling on %d\n",
 			__func__, link->link_index);
 		return false;
@@ -349,9 +350,9 @@ bool dp_handle_hpd_rx_irq(struct dc_link *link,
 	 * then DM should call DC to do the detection.
 	 * NOTE: Do not handle link loss on eDP since it is internal link*/
 	if ((link->connector_signal != SIGNAL_TYPE_EDP) &&
-		dc_link_check_link_loss_status(
-			link,
-			&hpd_irq_dpcd_data)) {
+			dp_parse_link_loss_status(
+					link,
+					&hpd_irq_dpcd_data)) {
 		/* Connectivity log: link loss */
 		CONN_DATA_LINK_LOSS(link,
 					hpd_irq_dpcd_data.raw,
@@ -361,7 +362,7 @@ bool dp_handle_hpd_rx_irq(struct dc_link *link,
 		if (defer_handling && has_left_work)
 			*has_left_work = true;
 		else
-			dc_link_dp_handle_link_loss(link);
+			dp_handle_link_loss(link);
 
 		status = false;
 		if (out_link_loss)
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
index 92c2aa104eb5..b7abba55bc2f 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
@@ -64,7 +64,7 @@ void dp_enable_link_phy(
 	link->cur_link_settings = *link_settings;
 	link->dc->hwss.enable_dp_link_output(link, link_res, signal,
 			clock_source, link_settings);
-	dc_link_dp_receiver_power_ctrl(link, true);
+	dpcd_write_rx_power_ctrl(link, true);
 }
 
 void dp_disable_link_phy(struct dc_link *link,
@@ -74,7 +74,7 @@ void dp_disable_link_phy(struct dc_link *link,
 	struct dc  *dc = link->ctx->dc;
 
 	if (!link->wa_flags.dp_keep_receiver_powered)
-		dc_link_dp_receiver_power_ctrl(link, false);
+		dpcd_write_rx_power_ctrl(link, false);
 
 	dc->hwss.disable_link_output(link, link_res, signal);
 	/* Clear current link setting.*/
@@ -143,7 +143,7 @@ enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource
 	link_enc = link_enc_cfg_get_link_enc(link);
 	ASSERT(link_enc);
 
-	if (!dc_link_should_enable_fec(link))
+	if (!dp_should_enable_fec(link))
 		return status;
 
 	if (link_enc->funcs->fec_set_ready &&
@@ -183,7 +183,7 @@ void dp_set_fec_enable(struct dc_link *link, bool enable)
 	link_enc = link_enc_cfg_get_link_enc(link);
 	ASSERT(link_enc);
 
-	if (!dc_link_should_enable_fec(link))
+	if (!dp_should_enable_fec(link))
 		return;
 
 	if (link_enc->funcs->fec_set_enable &&
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index 2948319b06f8..4a3758ea04f5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -41,6 +41,7 @@
 #include "link_dp_phy.h"
 #include "link_dp_capability.h"
 #include "link_edp_panel_control.h"
+#include "link/link_detection.h"
 #include "atomfirmware.h"
 #include "link_enc_cfg.h"
 #include "resource.h"
@@ -1644,7 +1645,7 @@ bool perform_link_training_with_retries(
 		if (status == LINK_TRAINING_ABORT) {
 			enum dc_connection_type type = dc_connection_none;
 
-			dc_link_detect_connection_type(link, &type);
+			link_detect_connection_type(link, &type);
 			if (type == dc_connection_none) {
 				DC_LOG_HW_LINK_TRAINING("%s: Aborting training because sink unplugged\n", __func__);
 				break;
@@ -1676,8 +1677,8 @@ bool perform_link_training_with_retries(
 			/* Flag if reduced link bandwidth no longer meets stream requirements or fallen back to
 			 * minimum link bandwidth.
 			 */
-			req_bw = dc_bandwidth_in_kbps_from_timing(&stream->timing);
-			link_bw = dc_link_bandwidth_kbps(link, &cur_link_settings);
+			req_bw = link_timing_bandwidth_kbps(&stream->timing);
+			link_bw = dp_link_bandwidth_kbps(link, &cur_link_settings);
 			is_link_bw_low = (req_bw > link_bw);
 			is_link_bw_min = ((cur_link_settings.link_rate <= LINK_RATE_LOW) &&
 				(cur_link_settings.lane_count <= LANE_COUNT_ONE));
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
index 0f56db4018e1..ab4aafdb5e5c 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
@@ -998,7 +998,7 @@ enum link_training_result dpia_perform_link_training(
 
 	struct dc_link_settings link_settings = *link_setting; // non-const copy to pass in
 
-	lt_settings.lttpr_mode = dc_link_decide_lttpr_mode(link, &link_settings);
+	lt_settings.lttpr_mode = dp_decide_lttpr_mode(link, &link_settings);
 
 	/* Configure link as prescribed in link_setting and set LTTPR mode. */
 	result = dpia_configure_link(link, link_res, link_setting, &lt_settings);
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
index 2f7e0f464144..eaafa00a7b9f 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
@@ -243,7 +243,7 @@ bool set_default_brightness_aux(struct dc_link *link)
 		if (default_backlight < 5000 || default_backlight > 5000000)
 			default_backlight = 150000; //
 
-		return dc_link_set_backlight_level_nits(link, true,
+		return edp_set_backlight_level_nits(link, true,
 				default_backlight, 0);
 	}
 	return false;
@@ -282,10 +282,10 @@ bool link_is_edp_ilr_optimization_required(struct dc_link *link,
 	core_link_read_dpcd(link, DP_LANE_COUNT_SET,
 				&lane_count_set.raw, sizeof(lane_count_set));
 
-	req_bw = dc_bandwidth_in_kbps_from_timing(crtc_timing);
+	req_bw = link_timing_bandwidth_kbps(crtc_timing);
 
 	if (!crtc_timing->flags.DSC)
-		dc_link_decide_edp_link_settings(link, &link_setting, req_bw);
+		edp_decide_link_settings(link, &link_setting, req_bw);
 	else
 		decide_edp_link_settings_with_dsc(link, &link_setting, req_bw, LINK_RATE_UNKNOWN);
 
-- 
2.34.1


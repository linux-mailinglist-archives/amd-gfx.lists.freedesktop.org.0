Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68769EEE3
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Feb 2023 07:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5B10E408;
	Wed, 22 Feb 2023 06:43:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A530F10E408
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Feb 2023 06:43:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYL+r1tbI5DKhFV+Sz/rqJRZasz3nut+iarnxhajaxysyG5Tyl9CGL7VhzuJTkeDSoNVtc7/yi/Ld/LPPDn0N/1weoh039FqlVMnep/9aN/5WGPPaiLBRdQWF/5YrBb73cX0q5bM8LTySaQOxtxFD6Bp0cq+XVdMRkErD1391ILdtSgcauIOKThn7h2uqrOcC71jeuptTcW+LBgozD5d3ZHa2pZQOBD4Ah7g7z8MkTUyukwLyAlZSLM9e5fFS5mR4ls37p7K+NLFI23MlXCWgb/zub/8PUgbiUIJClMEBtq+vlbMJ1dpizXkiMcgIVK14tQXZTUZsN8fyDAp32iWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8wTqU3xdXV9ZHf9bbhFk2BzB/MMrCNeNgUIzMCpgEU=;
 b=imLLbBVwiczzlEbnGtbm69c548gbg7rcWCj01c4hNFGnEYGGMR7e/2oDSHlipBAqwU9kaZgOj7HH9A+e7Cp1oPDFOY2SDyhiv6OOYTiXRmmNdXgwoSv/R4G987H0djudEHK0HmghdltpvwxoTXG7M51pxnmWFP+x/gP/Z+GrfsdSE29tOjNqnD5GjM/sguzq5QG8OvpXAkzLdMX1rLmfaOS7FrwdI8JBiimx0OeLCVzU14U3faJqEpBqv5uiI/aNGcapqomaslulWXvRL1eW/L/pZBT8kxISMAKcLD54f+aDnGDMFMKSpVb4p+I2JSmFFQ7H3nnjh71EnAGgXdweRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8wTqU3xdXV9ZHf9bbhFk2BzB/MMrCNeNgUIzMCpgEU=;
 b=mG6cYfxVor4I6ggjRs0rH4R3P79fO9ohrn5WqDoXtb6o6zPJOjdmcP5d42xRSwfYFgVnMFbY0adU46X2JGRcKWGGr75VB9EbUHCa99Tp8vx0GHtD0fIwJoKZpnhaNgJb7apUC40CMRFAKBMeH8M47rETrWYEKqna5Vm2cNLVrdE=
Received: from DS7PR05CA0068.namprd05.prod.outlook.com (2603:10b6:8:57::20) by
 SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Wed, 22 Feb 2023 06:42:56 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::9f) by DS7PR05CA0068.outlook.office365.com
 (2603:10b6:8:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 06:42:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6134.19 via Frontend Transport; Wed, 22 Feb 2023 06:42:55 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Feb
 2023 00:42:47 -0600
From: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/20] drm/amd/display: merge dc_link.h into dc.h and
 dc_types.h
Date: Wed, 22 Feb 2023 01:40:36 -0500
Message-ID: <20230222064041.2824-16-qingqing.zhuo@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222064041.2824-1-qingqing.zhuo@amd.com>
References: <20230222064041.2824-1-qingqing.zhuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ffaec0-68f8-47f1-ab2d-08db14a007ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLJ2VYm0+4VDlPMhy2LrpoHiKx8nIgvqzx8mjNbd6wCO8p6/EZZ55syAnX7C8IZXmPEDPlu8nVvZodmDgZHi1BNaJcnYQB2atDFBpnYUKgY2MOilHL01qVbHue8fYbJqyam9PdaJI3CdeOk6hE0Goce3Fl3nE6No8eQKXg+Rp7xgbGGiURm1wHBhm0arYBJaoJJz/56g4oGGyC8eZFKDeAD+ox9WEolFg5hXLM79WwxNM3INmYNWEThgMymuuqwP/4inYYYn7ezkSkAFXvWYxuqr9pwkW1W0jY34T4FLhFAm+D0QH7YFAMCzD9H7QotdBVUXucc/w5d+hl0ijhWxvxFW5+EFTQlgeto1SvC0AqZKK8g4Un5ENjV488nB0V/iqauJN2HO2uzo3jEsvLo7X+IWw9sJXfc90frDSNjmI51FtT0DBgbXvdZH9uabrEAOxpJ9fLVUtE+3C1+f5c18KQR8JTgH8LwuCbKjnbUdJW0FUqxIRxh+0sGmEgtFvxdNt/d2iylVnEfzCk1MZt7aWvE1ouYZH3OMX389Mfic4GDSZFgwRtp2/g1SEkXvh8QEy+dk8R8rFO+vJMK/oA4s7eFfaWW3KzL/QDN0QkW94bO/9vNDqYIo4pucBDH/fzMv9x7sThe74DgszPa3unJLjUatTTzSnnAx3ZXLp7v8vL/fPfwoqQvqDlSnEE4YWFuDSCT2k1K3MFVIJq7dDg34+7MAJ37s32KA4ml3SG0o3mWjh8yzvqprOD/YRYiDKxm8CHS4NAG8tz6kMTwV4WfkUiTBpsAY+UzAWepYwBCsLOA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(2906002)(1076003)(26005)(186003)(8676002)(82310400005)(4326008)(6916009)(70206006)(86362001)(70586007)(41300700001)(82740400003)(6666004)(30864003)(16526019)(2616005)(8936002)(5660300002)(356005)(40460700003)(36860700001)(478600001)(47076005)(316002)(40480700001)(426003)(36756003)(81166007)(54906003)(83380400001)(336012)(44832011)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 06:42:55.8642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ffaec0-68f8-47f1-ab2d-08db14a007ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635
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
Remove the need to include dc_link.h separately. dc.h should contain
everything needed on DM side.

[How]
Merge dc_link.h into dc.h and dc_types.h so DM only needs to include
dc.h to use all link public functions.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   2 +-
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 156 +----
 .../drm/amd/display/dc/core/dc_link_exports.c |  87 +++
 drivers/gpu/drm/amd/display/dc/dc.h           | 553 +++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h  | 107 ++++
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h  |  14 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     | 104 ++++
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h |   5 +-
 .../display/dc/dce110/dce110_hw_sequencer.c   |   2 +-
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |   2 +-
 .../dc/dcn30/dcn30_dio_stream_encoder.c       |   1 +
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   2 +-
 .../dc/dcn31/dcn31_hpo_dp_link_encoder.c      |   1 -
 .../dc/dcn31/dcn31_hpo_dp_stream_encoder.c    |   2 +-
 .../dc/dcn32/dcn32_hpo_dp_link_encoder.c      |   1 -
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    |   2 +-
 .../dc/dml/dcn30/display_mode_vba_30.c        |   1 -
 .../dc/dml/dcn31/display_mode_vba_31.c        |   1 -
 .../dc/dml/dcn314/display_mode_vba_314.c      |   1 -
 .../dc/dml/dcn32/display_mode_vba_32.c        |   1 -
 .../gpu/drm/amd/display/dc/inc/hw/hw_shared.h |  14 -
 .../drm/amd/display/dc/inc/hw/link_encoder.h  |  52 --
 .../amd/display/dc/inc/hw/stream_encoder.h    |   1 -
 drivers/gpu/drm/amd/display/dc/inc/link.h     |   1 -
 .../display/dc/link/accessories/link_dp_cts.c |  17 -
 .../drm/amd/display/dc/link/link_detection.c  |  99 ++++
 .../display/dc/link/protocols/link_dp_dpia.c  |   1 -
 .../dc/link/protocols/link_dp_dpia_bw.c       |   1 -
 .../dc/link/protocols/link_dp_training_dpia.c |   1 -
 .../amd/display/include/link_service_types.h  |  26 -
 33 files changed, 978 insertions(+), 288 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 790d4910c009..e656c8f02e7c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2273,7 +2273,7 @@ static int dm_late_init(void *handle)
 		struct dc_link *edp_links[MAX_NUM_EDP];
 		int edp_num;
 
-		get_edp_links(adev->dm.dc, edp_links, &edp_num);
+		dc_get_edp_links(adev->dm.dc, edp_links, &edp_num);
 		for (i = 0; i < edp_num; i++) {
 			if (!dmub_init_abm_config(adev->dm.dc->res_pool, params, i))
 				return -EINVAL;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 09a3efa517da..4a5dae578d97 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -724,7 +724,7 @@ static ssize_t dp_phy_test_pattern_debugfs_write(struct file *f, const char __us
 	for (i = 0; i < (unsigned int)(link_training_settings.link_settings.lane_count); i++)
 		link_training_settings.hw_lane_settings[i] = link->cur_lane_setting[i];
 
-	dc_link_set_test_pattern(
+	dc_link_dp_set_test_pattern(
 		link,
 		test_pattern,
 		DP_TEST_PATTERN_COLOR_SPACE_RGB,
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index 69691daf4dbb..73a45ec27f90 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -104,7 +104,7 @@ void clk_mgr_exit_optimized_pwr_state(const struct dc *dc, struct clk_mgr *clk_m
 	int edp_num;
 	unsigned int panel_inst;
 
-	get_edp_links(dc, edp_links, &edp_num);
+	dc_get_edp_links(dc, edp_links, &edp_num);
 	if (dc->hwss.exit_optimized_pwr_state)
 		dc->hwss.exit_optimized_pwr_state(dc, dc->current_state);
 
@@ -129,7 +129,7 @@ void clk_mgr_optimize_pwr_state(const struct dc *dc, struct clk_mgr *clk_mgr)
 	int edp_num;
 	unsigned int panel_inst;
 
-	get_edp_links(dc, edp_links, &edp_num);
+	dc_get_edp_links(dc, edp_links, &edp_num);
 	if (edp_num) {
 		for (panel_inst = 0; panel_inst < edp_num; panel_inst++) {
 			edp_link = edp_links[panel_inst];
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index cfb6f4eefce9..ca048e38c4d4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -53,7 +53,6 @@
 #include "link_encoder.h"
 #include "link_enc_cfg.h"
 
-#include "dc_link.h"
 #include "link.h"
 #include "dm_helpers.h"
 #include "mem_input.h"
@@ -1305,7 +1304,7 @@ static void detect_edp_presence(struct dc *dc)
 	int i;
 	int edp_num;
 
-	get_edp_links(dc, edp_links, &edp_num);
+	dc_get_edp_links(dc, edp_links, &edp_num);
 	if (!edp_num)
 		return;
 
@@ -4327,157 +4326,6 @@ bool dc_is_dmcu_initialized(struct dc *dc)
 	return false;
 }
 
-bool dc_is_oem_i2c_device_present(
-	struct dc *dc,
-	size_t slave_address)
-{
-	if (dc->res_pool->oem_device)
-		return dce_i2c_oem_device_present(
-			dc->res_pool,
-			dc->res_pool->oem_device,
-			slave_address);
-
-	return false;
-}
-
-bool dc_submit_i2c(
-		struct dc *dc,
-		uint32_t link_index,
-		struct i2c_command *cmd)
-{
-
-	struct dc_link *link = dc->links[link_index];
-	struct ddc_service *ddc = link->ddc;
-	return dce_i2c_submit_command(
-		dc->res_pool,
-		ddc->ddc_pin,
-		cmd);
-}
-
-bool dc_submit_i2c_oem(
-		struct dc *dc,
-		struct i2c_command *cmd)
-{
-	struct ddc_service *ddc = dc->res_pool->oem_device;
-	if (ddc)
-		return dce_i2c_submit_command(
-			dc->res_pool,
-			ddc->ddc_pin,
-			cmd);
-
-	return false;
-}
-
-static bool link_add_remote_sink_helper(struct dc_link *dc_link, struct dc_sink *sink)
-{
-	if (dc_link->sink_count >= MAX_SINKS_PER_LINK) {
-		BREAK_TO_DEBUGGER();
-		return false;
-	}
-
-	dc_sink_retain(sink);
-
-	dc_link->remote_sinks[dc_link->sink_count] = sink;
-	dc_link->sink_count++;
-
-	return true;
-}
-
-/*
- * dc_link_add_remote_sink() - Create a sink and attach it to an existing link
- *
- * EDID length is in bytes
- */
-struct dc_sink *dc_link_add_remote_sink(
-		struct dc_link *link,
-		const uint8_t *edid,
-		int len,
-		struct dc_sink_init_data *init_data)
-{
-	struct dc_sink *dc_sink;
-	enum dc_edid_status edid_status;
-
-	if (len > DC_MAX_EDID_BUFFER_SIZE) {
-		dm_error("Max EDID buffer size breached!\n");
-		return NULL;
-	}
-
-	if (!init_data) {
-		BREAK_TO_DEBUGGER();
-		return NULL;
-	}
-
-	if (!init_data->link) {
-		BREAK_TO_DEBUGGER();
-		return NULL;
-	}
-
-	dc_sink = dc_sink_create(init_data);
-
-	if (!dc_sink)
-		return NULL;
-
-	memmove(dc_sink->dc_edid.raw_edid, edid, len);
-	dc_sink->dc_edid.length = len;
-
-	if (!link_add_remote_sink_helper(
-			link,
-			dc_sink))
-		goto fail_add_sink;
-
-	edid_status = dm_helpers_parse_edid_caps(
-			link,
-			&dc_sink->dc_edid,
-			&dc_sink->edid_caps);
-
-	/*
-	 * Treat device as no EDID device if EDID
-	 * parsing fails
-	 */
-	if (edid_status != EDID_OK && edid_status != EDID_PARTIAL_VALID) {
-		dc_sink->dc_edid.length = 0;
-		dm_error("Bad EDID, status%d!\n", edid_status);
-	}
-
-	return dc_sink;
-
-fail_add_sink:
-	dc_sink_release(dc_sink);
-	return NULL;
-}
-
-/*
- * dc_link_remove_remote_sink() - Remove a remote sink from a dc_link
- *
- * Note that this just removes the struct dc_sink - it doesn't
- * program hardware or alter other members of dc_link
- */
-void dc_link_remove_remote_sink(struct dc_link *link, struct dc_sink *sink)
-{
-	int i;
-
-	if (!link->sink_count) {
-		BREAK_TO_DEBUGGER();
-		return;
-	}
-
-	for (i = 0; i < link->sink_count; i++) {
-		if (link->remote_sinks[i] == sink) {
-			dc_sink_release(sink);
-			link->remote_sinks[i] = NULL;
-
-			/* shrink array to remove empty place */
-			while (i < link->sink_count - 1) {
-				link->remote_sinks[i] = link->remote_sinks[i+1];
-				i++;
-			}
-			link->remote_sinks[i] = NULL;
-			link->sink_count--;
-			return;
-		}
-	}
-}
-
 void get_clock_requirements_for_state(struct dc_state *state, struct AsicStateEx *info)
 {
 	info->displayClock				= (unsigned int)state->bw_ctx.bw.dcn.clk.dispclk_khz;
@@ -5000,7 +4848,7 @@ void dc_notify_vsync_int_state(struct dc *dc, struct dc_stream_state *stream, bo
 		return;
 	}
 
-	get_edp_links(dc, edp_links, &edp_num);
+	dc_get_edp_links(dc, edp_links, &edp_num);
 
 	/* Determine panel inst */
 	for (i = 0; i < edp_num; i++) {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
index a951e10416ee..862cb0f93b7d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
@@ -34,6 +34,49 @@
  * in this file which calls link functions.
  */
 #include "link.h"
+#include "dce/dce_i2c.h"
+struct dc_link *dc_get_link_at_index(struct dc *dc, uint32_t link_index)
+{
+	return dc->links[link_index];
+}
+
+void dc_get_edp_links(const struct dc *dc,
+		struct dc_link **edp_links,
+		int *edp_num)
+{
+	int i;
+
+	*edp_num = 0;
+	for (i = 0; i < dc->link_count; i++) {
+		// report any eDP links, even unconnected DDI's
+		if (!dc->links[i])
+			continue;
+		if (dc->links[i]->connector_signal == SIGNAL_TYPE_EDP) {
+			edp_links[*edp_num] = dc->links[i];
+			if (++(*edp_num) == MAX_NUM_EDP)
+				return;
+		}
+	}
+}
+
+bool dc_get_edp_link_panel_inst(const struct dc *dc,
+		const struct dc_link *link,
+		unsigned int *inst_out)
+{
+	struct dc_link *edp_links[MAX_NUM_EDP];
+	int edp_num, i;
+
+	*inst_out = 0;
+	if (link->connector_signal != SIGNAL_TYPE_EDP)
+		return false;
+	dc_get_edp_links(dc, edp_links, &edp_num);
+	for (i = 0; i < edp_num; i++) {
+		if (link == edp_links[i])
+			break;
+		(*inst_out)++;
+	}
+	return true;
+}
 
 bool dc_link_detect(struct dc_link *link, enum dc_detect_reason reason)
 {
@@ -101,3 +144,47 @@ bool dc_link_update_dsc_config(struct pipe_ctx *pipe_ctx)
 {
 	return link_update_dsc_config(pipe_ctx);
 }
+
+bool dc_is_oem_i2c_device_present(
+	struct dc *dc,
+	size_t slave_address)
+{
+	if (dc->res_pool->oem_device)
+		return dce_i2c_oem_device_present(
+			dc->res_pool,
+			dc->res_pool->oem_device,
+			slave_address);
+
+	return false;
+}
+
+bool dc_submit_i2c(
+		struct dc *dc,
+		uint32_t link_index,
+		struct i2c_command *cmd)
+{
+
+	struct dc_link *link = dc->links[link_index];
+	struct ddc_service *ddc = link->ddc;
+
+	return dce_i2c_submit_command(
+		dc->res_pool,
+		ddc->ddc_pin,
+		cmd);
+}
+
+bool dc_submit_i2c_oem(
+		struct dc *dc,
+		struct i2c_command *cmd)
+{
+	struct ddc_service *ddc = dc->res_pool->oem_device;
+
+	if (ddc)
+		return dce_i2c_submit_command(
+			dc->res_pool,
+			ddc->ddc_pin,
+			cmd);
+
+	return false;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 8a62f3e93e35..c84554933dc2 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1380,8 +1380,159 @@ struct dc_plane_state *dc_get_surface_for_mpcc(struct dc *dc,
 uint32_t dc_get_opp_for_plane(struct dc *dc, struct dc_plane_state *plane);
 
 /* Link Interfaces */
-/* TODO: remove this after resolving external dependencies */
-#include "dc_link.h"
+/*
+ * A link contains one or more sinks and their connected status.
+ * The currently active signal type (HDMI, DP-SST, DP-MST) is also reported.
+ */
+struct dc_link {
+	struct dc_sink *remote_sinks[MAX_SINKS_PER_LINK];
+	unsigned int sink_count;
+	struct dc_sink *local_sink;
+	unsigned int link_index;
+	enum dc_connection_type type;
+	enum signal_type connector_signal;
+	enum dc_irq_source irq_source_hpd;
+	enum dc_irq_source irq_source_hpd_rx;/* aka DP Short Pulse  */
+
+	bool is_hpd_filter_disabled;
+	bool dp_ss_off;
+
+	/**
+	 * @link_state_valid:
+	 *
+	 * If there is no link and local sink, this variable should be set to
+	 * false. Otherwise, it should be set to true; usually, the function
+	 * core_link_enable_stream sets this field to true.
+	 */
+	bool link_state_valid;
+	bool aux_access_disabled;
+	bool sync_lt_in_progress;
+	bool skip_stream_reenable;
+	bool is_internal_display;
+	/** @todo Rename. Flag an endpoint as having a programmable mapping to a DIG encoder. */
+	bool is_dig_mapping_flexible;
+	bool hpd_status; /* HPD status of link without physical HPD pin. */
+	bool is_hpd_pending; /* Indicates a new received hpd */
+	bool is_automated; /* Indicates automated testing */
+
+	bool edp_sink_present;
+
+	struct dp_trace dp_trace;
+
+	/* caps is the same as reported_link_cap. link_traing use
+	 * reported_link_cap. Will clean up.  TODO
+	 */
+	struct dc_link_settings reported_link_cap;
+	struct dc_link_settings verified_link_cap;
+	struct dc_link_settings cur_link_settings;
+	struct dc_lane_settings cur_lane_setting[LANE_COUNT_DP_MAX];
+	struct dc_link_settings preferred_link_setting;
+	/* preferred_training_settings are override values that
+	 * come from DM. DM is responsible for the memory
+	 * management of the override pointers.
+	 */
+	struct dc_link_training_overrides preferred_training_settings;
+	struct dp_audio_test_data audio_test_data;
+
+	uint8_t ddc_hw_inst;
+
+	uint8_t hpd_src;
+
+	uint8_t link_enc_hw_inst;
+	/* DIG link encoder ID. Used as index in link encoder resource pool.
+	 * For links with fixed mapping to DIG, this is not changed after dc_link
+	 * object creation.
+	 */
+	enum engine_id eng_id;
+
+	bool test_pattern_enabled;
+	union compliance_test_state compliance_test_state;
+
+	void *priv;
+
+	struct ddc_service *ddc;
+
+	bool aux_mode;
+
+	/* Private to DC core */
+
+	const struct dc *dc;
+
+	struct dc_context *ctx;
+
+	struct panel_cntl *panel_cntl;
+	struct link_encoder *link_enc;
+	struct graphics_object_id link_id;
+	/* Endpoint type distinguishes display endpoints which do not have entries
+	 * in the BIOS connector table from those that do. Helps when tracking link
+	 * encoder to display endpoint assignments.
+	 */
+	enum display_endpoint_type ep_type;
+	union ddi_channel_mapping ddi_channel_mapping;
+	struct connector_device_tag_info device_tag;
+	struct dpcd_caps dpcd_caps;
+	uint32_t dongle_max_pix_clk;
+	unsigned short chip_caps;
+	unsigned int dpcd_sink_count;
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+	struct hdcp_caps hdcp_caps;
+#endif
+	enum edp_revision edp_revision;
+	union dpcd_sink_ext_caps dpcd_sink_ext_caps;
+
+	struct psr_settings psr_settings;
+
+	/* Drive settings read from integrated info table */
+	struct dc_lane_settings bios_forced_drive_settings;
+
+	/* Vendor specific LTTPR workaround variables */
+	uint8_t vendor_specific_lttpr_link_rate_wa;
+	bool apply_vendor_specific_lttpr_link_rate_wa;
+
+	/* MST record stream using this link */
+	struct link_flags {
+		bool dp_keep_receiver_powered;
+		bool dp_skip_DID2;
+		bool dp_skip_reset_segment;
+		bool dp_skip_fs_144hz;
+		bool dp_mot_reset_segment;
+		/* Some USB4 docks do not handle turning off MST DSC once it has been enabled. */
+		bool dpia_mst_dsc_always_on;
+		/* Forced DPIA into TBT3 compatibility mode. */
+		bool dpia_forced_tbt3_mode;
+		bool dongle_mode_timing_override;
+	} wa_flags;
+	struct link_mst_stream_allocation_table mst_stream_alloc_table;
+
+	struct dc_link_status link_status;
+	struct dprx_states dprx_states;
+
+	struct gpio *hpd_gpio;
+	enum dc_link_fec_state fec_state;
+	bool link_powered_externally;	// Used to bypass hardware sequencing delays when panel is powered down forcibly
+
+	struct dc_panel_config panel_config;
+	struct phy_state phy_state;
+	// BW ALLOCATON USB4 ONLY
+	struct dc_dpia_bw_alloc dpia_bw_alloc_config;
+};
+
+/* Return an enumerated dc_link.
+ * dc_link order is constant and determined at
+ * boot time.  They cannot be created or destroyed.
+ * Use dc_get_caps() to get number of links.
+ */
+struct dc_link *dc_get_link_at_index(struct dc *dc, uint32_t link_index);
+
+/* Return instance id of the edp link. Inst 0 is primary edp link. */
+bool dc_get_edp_link_panel_inst(const struct dc *dc,
+		const struct dc_link *link,
+		unsigned int *inst_out);
+
+/* Return an array of link pointers to edp links. */
+void dc_get_edp_links(const struct dc *dc,
+		struct dc_link **edp_links,
+		int *edp_num);
 
 /* The function initiates detection handshake over the given link. It first
  * determines if there are display connections over the link. If so it initiates
@@ -1405,6 +1556,38 @@ uint32_t dc_get_opp_for_plane(struct dc *dc, struct dc_plane_state *plane);
  */
 bool dc_link_detect(struct dc_link *link, enum dc_detect_reason reason);
 
+struct dc_sink_init_data;
+
+/* When link connection type is dc_connection_mst_branch, remote sink can be
+ * added to the link. The interface creates a remote sink and associates it with
+ * current link. The sink will be retained by link until remove remote sink is
+ * called.
+ *
+ * @dc_link - link the remote sink will be added to.
+ * @edid - byte array of EDID raw data.
+ * @len - size of the edid in byte
+ * @init_data -
+ */
+struct dc_sink *dc_link_add_remote_sink(
+		struct dc_link *dc_link,
+		const uint8_t *edid,
+		int len,
+		struct dc_sink_init_data *init_data);
+
+/* Remove remote sink from a link with dc_connection_mst_branch connection type.
+ * @link - link the sink should be removed from
+ * @sink - sink to be removed.
+ */
+void dc_link_remove_remote_sink(
+	struct dc_link *link,
+	struct dc_sink *sink);
+
+/* Enable HPD interrupt handler for a given link */
+void dc_link_enable_hpd(const struct dc_link *link);
+
+/* Disable HPD interrupt handler for a given link */
+void dc_link_disable_hpd(const struct dc_link *link);
+
 /* determine if there is a sink connected to the link
  *
  * @type - dc_connection_single if connected, dc_connection_none otherwise.
@@ -1418,15 +1601,119 @@ bool dc_link_detect(struct dc_link *link, enum dc_detect_reason reason);
 bool dc_link_detect_connection_type(struct dc_link *link,
 		enum dc_connection_type *type);
 
+/* query current hpd pin value
+ * return - true HPD is asserted (HPD high), false otherwise (HPD low)
+ *
+ */
+bool dc_link_get_hpd_state(struct dc_link *dc_link);
+
 /* Getter for cached link status from given link */
 const struct dc_link_status *dc_link_get_status(const struct dc_link *link);
 
+/* enable/disable hardware HPD filter.
+ *
+ * @link - The link the HPD pin is associated with.
+ * @enable = true - enable hardware HPD filter. HPD event will only queued to irq
+ * handler once after no HPD change has been detected within dc default HPD
+ * filtering interval since last HPD event. i.e if display keeps toggling hpd
+ * pulses within default HPD interval, no HPD event will be received until HPD
+ * toggles have stopped. Then HPD event will be queued to irq handler once after
+ * dc default HPD filtering interval since last HPD event.
+ *
+ * @enable = false - disable hardware HPD filter. HPD event will be queued
+ * immediately to irq handler after no HPD change has been detected within
+ * IRQ_HPD (aka HPD short pulse) interval (i.e 2ms).
+ */
+void dc_link_enable_hpd_filter(struct dc_link *link, bool enable);
+
+/* submit i2c read/write payloads through ddc channel
+ * @link_index - index to a link with ddc in i2c mode
+ * @cmd - i2c command structure
+ * return - true if success, false otherwise.
+ */
+bool dc_submit_i2c(
+		struct dc *dc,
+		uint32_t link_index,
+		struct i2c_command *cmd);
+
+/* submit i2c read/write payloads through oem channel
+ * @link_index - index to a link with ddc in i2c mode
+ * @cmd - i2c command structure
+ * return - true if success, false otherwise.
+ */
+bool dc_submit_i2c_oem(
+		struct dc *dc,
+		struct i2c_command *cmd);
+
+enum aux_return_code_type;
+/* Attempt to transfer the given aux payload. This function does not perform
+ * retries or handle error states. The reply is returned in the payload->reply
+ * and the result through operation_result. Returns the number of bytes
+ * transferred,or -1 on a failure.
+ */
+int dc_link_aux_transfer_raw(struct ddc_service *ddc,
+		struct aux_payload *payload,
+		enum aux_return_code_type *operation_result);
+
+bool dc_is_oem_i2c_device_present(
+	struct dc *dc,
+	size_t slave_address
+);
+
 #ifdef CONFIG_DRM_AMD_DC_HDCP
+
 /* return true if the connected receiver supports the hdcp version */
 bool dc_link_is_hdcp14(struct dc_link *link, enum signal_type signal);
 bool dc_link_is_hdcp22(struct dc_link *link, enum signal_type signal);
 #endif
 
+/* Notify DC about DP RX Interrupt (aka DP IRQ_HPD).
+ *
+ * TODO - When defer_handling is true the function will have a different purpose.
+ * It no longer does complete hpd rx irq handling. We should create a separate
+ * interface specifically for this case.
+ *
+ * Return:
+ * true - Downstream port status changed. DM should call DC to do the
+ * detection.
+ * false - no change in Downstream port status. No further action required
+ * from DM.
+ */
+bool dc_link_handle_hpd_rx_irq(struct dc_link *dc_link,
+		union hpd_irq_data *hpd_irq_dpcd_data, bool *out_link_loss,
+		bool defer_handling, bool *has_left_work);
+/* handle DP specs define test automation sequence*/
+void dc_link_dp_handle_automated_test(struct dc_link *link);
+
+/* handle DP Link loss sequence and try to recover RX link loss with best
+ * effort
+ */
+void dc_link_dp_handle_link_loss(struct dc_link *link);
+
+/* Determine if hpd rx irq should be handled or ignored
+ * return true - hpd rx irq should be handled.
+ * return false - it is safe to ignore hpd rx irq event
+ */
+bool dc_link_dp_allow_hpd_rx_irq(const struct dc_link *link);
+
+/* Determine if link loss is indicated with a given hpd_irq_dpcd_data.
+ * @link - link the hpd irq data associated with
+ * @hpd_irq_dpcd_data - input hpd irq data
+ * return - true if hpd irq data indicates a link lost
+ */
+bool dc_link_check_link_loss_status(struct dc_link *link,
+		union hpd_irq_data *hpd_irq_dpcd_data);
+
+/* Read hpd rx irq data from a given link
+ * @link - link where the hpd irq data should be read from
+ * @irq_data - output hpd irq data
+ * return - DC_OK if hpd irq data is read successfully, otherwise hpd irq data
+ * read has failed.
+ */
+enum dc_status dc_link_dp_read_hpd_rx_irq_data(
+	struct dc_link *link,
+	union hpd_irq_data *irq_data);
+
 /* The function clears recorded DP RX states in the link. DM should call this
  * function when it is resuming from S3 power state to previously connected links.
  *
@@ -1494,6 +1781,268 @@ void dc_restore_link_res_map(const struct dc *dc, uint32_t *map);
  * interface i.e stream_update->dsc_config
  */
 bool dc_link_update_dsc_config(struct pipe_ctx *pipe_ctx);
+
+/* translate a raw link rate data to bandwidth in kbps */
+uint32_t dc_link_bw_kbps_from_raw_frl_link_rate_data(uint8_t bw);
+
+/* determine the optimal bandwidth given link and required bw.
+ * @link - current detected link
+ * @req_bw - requested bandwidth in kbps
+ * @link_settings - returned most optimal link settings that can fit the
+ * requested bandwidth
+ * return - false if link can't support requested bandwidth, true if link
+ * settings is found.
+ */
+bool dc_link_decide_edp_link_settings(struct dc_link *link,
+		struct dc_link_settings *link_settings,
+		uint32_t req_bw);
+
+/* return the max dp link settings can be driven by the link without considering
+ * connected RX device and its capability
+ */
+bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link,
+		struct dc_link_settings *max_link_enc_cap);
+
+/* determine when the link is driving MST mode, what DP link channel coding
+ * format will be used. The decision will remain unchanged until next HPD event.
+ *
+ * @link -  a link with DP RX connection
+ * return - if stream is committed to this link with MST signal type, type of
+ * channel coding format dc will choose.
+ */
+enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(
+		const struct dc_link *link);
+
+/* get max dp link settings the link can enable with all things considered. (i.e
+ * TX/RX/Cable capabilities and dp override policies.
+ *
+ * @link - a link with DP RX connection
+ * return - max dp link settings the link can enable.
+ *
+ */
+const struct dc_link_settings *dc_link_get_link_cap(const struct dc_link *link);
+
+/* Check if a RX (ex. DP sink, MST hub, passive or active dongle) is connected
+ * to a link with dp connector signal type.
+ * @link - a link with dp connector signal type
+ * return - true if connected, false otherwise
+ */
+bool dc_link_is_dp_sink_present(struct dc_link *link);
+
+/* Force DP lane settings update to main-link video signal and notify the change
+ * to DP RX via DPCD. This is a debug interface used for video signal integrity
+ * tuning purpose. The interface assumes link has already been enabled with DP
+ * signal.
+ *
+ * @lt_settings - a container structure with desired hw_lane_settings
+ */
+void dc_link_set_drive_settings(struct dc *dc,
+				struct link_training_settings *lt_settings,
+				const struct dc_link *link);
+
+/* Enable a test pattern in Link or PHY layer in an active link for compliance
+ * test or debugging purpose. The test pattern will remain until next un-plug.
+ *
+ * @link - active link with DP signal output enabled.
+ * @test_pattern - desired test pattern to output.
+ * NOTE: set to DP_TEST_PATTERN_VIDEO_MODE to disable previous test pattern.
+ * @test_pattern_color_space - for video test pattern choose a desired color
+ * space.
+ * @p_link_settings - For PHY pattern choose a desired link settings
+ * @p_custom_pattern - some test pattern will require a custom input to
+ * customize some pattern details. Otherwise keep it to NULL.
+ * @cust_pattern_size - size of the custom pattern input.
+ *
+ */
+bool dc_link_dp_set_test_pattern(
+	struct dc_link *link,
+	enum dp_test_pattern test_pattern,
+	enum dp_test_pattern_color_space test_pattern_color_space,
+	const struct link_training_settings *p_link_settings,
+	const unsigned char *p_custom_pattern,
+	unsigned int cust_pattern_size);
+
+/* Force DP link settings to always use a specific value until reboot to a
+ * specific link. If link has already been enabled, the interface will also
+ * switch to desired link settings immediately. This is a debug interface to
+ * generic dp issue trouble shooting.
+ */
+void dc_link_set_preferred_link_settings(struct dc *dc,
+		struct dc_link_settings *link_setting,
+		struct dc_link *link);
+
+/* Force DP link to customize a specific link training behavior by overriding to
+ * standard DP specs defined protocol. This is a debug interface to trouble shoot
+ * display specific link training issues or apply some display specific
+ * workaround in link training.
+ *
+ * @link_settings - if not NULL, force preferred link settings to the link.
+ * @lt_override - a set of override pointers. If any pointer is none NULL, dc
+ * will apply this particular override in future link training. If NULL is
+ * passed in, dc resets previous overrides.
+ * NOTE: DM must keep the memory from override pointers until DM resets preferred
+ * training settings.
+ */
+void dc_link_set_preferred_training_settings(struct dc *dc,
+		struct dc_link_settings *link_setting,
+		struct dc_link_training_overrides *lt_overrides,
+		struct dc_link *link,
+		bool skip_immediate_retrain);
+
+/* return - true if FEC is supported with connected DP RX, false otherwise */
+bool dc_link_is_fec_supported(const struct dc_link *link);
+
+/* query FEC enablement policy to determine if FEC will be enabled by dc during
+ * link enablement.
+ * return - true if FEC should be enabled, false otherwise.
+ */
+bool dc_link_should_enable_fec(const struct dc_link *link);
+
+/* determine lttpr mode the current link should be enabled with a specific link
+ * settings.
+ */
+enum lttpr_mode dc_link_decide_lttpr_mode(struct dc_link *link,
+		struct dc_link_settings *link_setting);
+
+/* Force DP RX to update its power state.
+ * NOTE: this interface doesn't update dp main-link. Calling this function will
+ * cause DP TX main-link and DP RX power states out of sync. DM has to restore
+ * RX power state back upon finish DM specific execution requiring DP RX in a
+ * specific power state.
+ * @on - true to set DP RX in D0 power state, false to set DP RX in D3 power
+ * state.
+ */
+void dc_link_dp_receiver_power_ctrl(struct dc_link *link, bool on);
+
+/* Force link to read base dp receiver caps from dpcd 000h - 00Fh and overwrite
+ * current value read from extended receiver cap from 02200h - 0220Fh.
+ * Some DP RX has problems of providing accurate DP receiver caps from extended
+ * field, this interface is a workaround to revert link back to use base caps.
+ */
+void dc_link_overwrite_extended_receiver_cap(
+		struct dc_link *link);
+
+void dc_link_edp_panel_backlight_power_on(struct dc_link *link,
+		bool wait_for_hpd);
+
+/* Set backlight level of an embedded panel (eDP, LVDS).
+ * backlight_pwm_u16_16 is unsigned 32 bit with 16 bit integer
+ * and 16 bit fractional, where 1.0 is max backlight value.
+ */
+bool dc_link_set_backlight_level(const struct dc_link *dc_link,
+		uint32_t backlight_pwm_u16_16,
+		uint32_t frame_ramp);
+
+/* Set/get nits-based backlight level of an embedded panel (eDP, LVDS). */
+bool dc_link_set_backlight_level_nits(struct dc_link *link,
+		bool isHDR,
+		uint32_t backlight_millinits,
+		uint32_t transition_time_in_ms);
+
+bool dc_link_get_backlight_level_nits(struct dc_link *link,
+		uint32_t *backlight_millinits,
+		uint32_t *backlight_millinits_peak);
+
+int dc_link_get_backlight_level(const struct dc_link *dc_link);
+
+int dc_link_get_target_backlight_pwm(const struct dc_link *link);
+
+bool dc_link_set_psr_allow_active(struct dc_link *dc_link, const bool *enable,
+		bool wait, bool force_static, const unsigned int *power_opts);
+
+bool dc_link_get_psr_state(const struct dc_link *dc_link, enum dc_psr_state *state);
+
+bool dc_link_setup_psr(struct dc_link *dc_link,
+		const struct dc_stream_state *stream, struct psr_config *psr_config,
+		struct psr_context *psr_context);
+
+/* On eDP links this function call will stall until T12 has elapsed.
+ * If the panel is not in power off state, this function will return
+ * immediately.
+ */
+bool dc_link_wait_for_t12(struct dc_link *link);
+
+/* Determine if dp trace has been initialized to reflect upto date result *
+ * return - true if trace is initialized and has valid data. False dp trace
+ * doesn't have valid result.
+ */
+bool dc_dp_trace_is_initialized(struct dc_link *link);
+
+/* Query a dp trace flag to indicate if the current dp trace data has been
+ * logged before
+ */
+bool dc_dp_trace_is_logged(struct dc_link *link,
+		bool in_detection);
+
+/* Set dp trace flag to indicate whether DM has already logged the current dp
+ * trace data. DM can set is_logged to true upon logging and check
+ * dc_dp_trace_is_logged before logging to avoid logging the same result twice.
+ */
+void dc_dp_trace_set_is_logged_flag(struct dc_link *link,
+		bool in_detection,
+		bool is_logged);
+
+/* Obtain driver time stamp for last dp link training end. The time stamp is
+ * formatted based on dm_get_timestamp DM function.
+ * @in_detection - true to get link training end time stamp of last link
+ * training in detection sequence. false to get link training end time stamp
+ * of last link training in commit (dpms) sequence
+ */
+unsigned long long dc_dp_trace_get_lt_end_timestamp(struct dc_link *link,
+		bool in_detection);
+
+/* Get how many link training attempts dc has done with latest sequence.
+ * @in_detection - true to get link training count of last link
+ * training in detection sequence. false to get link training count of last link
+ * training in commit (dpms) sequence
+ */
+struct dp_trace_lt_counts *dc_dp_trace_get_lt_counts(struct dc_link *link,
+		bool in_detection);
+
+/* Get how many link loss has happened since last link training attempts */
+unsigned int dc_dp_trace_get_link_loss_count(struct dc_link *link);
+
+/*
+ *  USB4 DPIA BW ALLOCATION PUBLIC FUNCTIONS
+ */
+/*
+ * Send a request from DP-Tx requesting to allocate BW remotely after
+ * allocating it locally. This will get processed by CM and a CB function
+ * will be called.
+ *
+ * @link: pointer to the dc_link struct instance
+ * @req_bw: The requested bw in Kbyte to allocated
+ *
+ * return: none
+ */
+void dc_link_set_usb4_req_bw_req(struct dc_link *link, int req_bw);
+
+/*
+ * Handle function for when the status of the Request above is complete.
+ * We will find out the result of allocating on CM and update structs.
+ *
+ * @link: pointer to the dc_link struct instance
+ * @bw: Allocated or Estimated BW depending on the result
+ * @result: Response type
+ *
+ * return: none
+ */
+void dc_link_handle_usb4_bw_alloc_response(struct dc_link *link,
+		uint8_t bw, uint8_t result);
+
+/*
+ * Handle the USB4 BW Allocation related functionality here:
+ * Plug => Try to allocate max bw from timing parameters supported by the sink
+ * Unplug => de-allocate bw
+ *
+ * @link: pointer to the dc_link struct instance
+ * @peak_bw: Peak bw used by the link/sink
+ *
+ * return: allocated bw else return 0
+ */
+int dc_link_dp_dpia_handle_usb4_bandwidth_allocation_for_link(
+		struct dc_link *link, int peak_bw);
+
 /* Sink Interfaces - A sink corresponds to a display output device */
 
 struct dc_container_id {
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index 809a1851f196..4bccce94d83b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -1261,4 +1261,111 @@ union dpcd_sink_ext_caps {
 	} bits;
 	uint8_t raw;
 };
+
+enum dc_link_fec_state {
+	dc_link_fec_not_ready,
+	dc_link_fec_ready,
+	dc_link_fec_enabled
+};
+
+union dpcd_psr_configuration {
+	struct {
+		unsigned char ENABLE                    : 1;
+		unsigned char TRANSMITTER_ACTIVE_IN_PSR : 1;
+		unsigned char CRC_VERIFICATION          : 1;
+		unsigned char FRAME_CAPTURE_INDICATION  : 1;
+		/* For eDP 1.4, PSR v2*/
+		unsigned char LINE_CAPTURE_INDICATION   : 1;
+		/* For eDP 1.4, PSR v2*/
+		unsigned char IRQ_HPD_WITH_CRC_ERROR    : 1;
+		unsigned char ENABLE_PSR2               : 1;
+		unsigned char EARLY_TRANSPORT_ENABLE    : 1;
+	} bits;
+	unsigned char raw;
+};
+
+union dpcd_alpm_configuration {
+	struct {
+		unsigned char ENABLE                    : 1;
+		unsigned char IRQ_HPD_ENABLE            : 1;
+		unsigned char RESERVED                  : 6;
+	} bits;
+	unsigned char raw;
+};
+
+union dpcd_sink_active_vtotal_control_mode {
+	struct {
+		unsigned char ENABLE                    : 1;
+		unsigned char RESERVED                  : 7;
+	} bits;
+	unsigned char raw;
+};
+
+union psr_error_status {
+	struct {
+		unsigned char LINK_CRC_ERROR        :1;
+		unsigned char RFB_STORAGE_ERROR     :1;
+		unsigned char VSC_SDP_ERROR         :1;
+		unsigned char RESERVED              :5;
+	} bits;
+	unsigned char raw;
+};
+
+union psr_sink_psr_status {
+	struct {
+	unsigned char SINK_SELF_REFRESH_STATUS  :3;
+	unsigned char RESERVED                  :5;
+	} bits;
+	unsigned char raw;
+};
+
+struct edp_trace_power_timestamps {
+	uint64_t poweroff;
+	uint64_t poweron;
+};
+
+struct dp_trace_lt_counts {
+	unsigned int total;
+	unsigned int fail;
+};
+
+enum link_training_result {
+	LINK_TRAINING_SUCCESS,
+	LINK_TRAINING_CR_FAIL_LANE0,
+	LINK_TRAINING_CR_FAIL_LANE1,
+	LINK_TRAINING_CR_FAIL_LANE23,
+	/* CR DONE bit is cleared during EQ step */
+	LINK_TRAINING_EQ_FAIL_CR,
+	/* CR DONE bit is cleared but LANE0_CR_DONE is set during EQ step */
+	LINK_TRAINING_EQ_FAIL_CR_PARTIAL,
+	/* other failure during EQ step */
+	LINK_TRAINING_EQ_FAIL_EQ,
+	LINK_TRAINING_LQA_FAIL,
+	/* one of the CR,EQ or symbol lock is dropped */
+	LINK_TRAINING_LINK_LOSS,
+	/* Abort link training (because sink unplugged) */
+	LINK_TRAINING_ABORT,
+	DP_128b_132b_LT_FAILED,
+	DP_128b_132b_MAX_LOOP_COUNT_REACHED,
+	DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT,
+	DP_128b_132b_CDS_DONE_TIMEOUT,
+};
+
+struct dp_trace_lt {
+	struct dp_trace_lt_counts counts;
+	struct dp_trace_timestamps {
+		unsigned long long start;
+		unsigned long long end;
+	} timestamps;
+	enum link_training_result result;
+	bool is_logged;
+};
+
+struct dp_trace {
+	struct dp_trace_lt detect_lt_trace;
+	struct dp_trace_lt commit_lt_trace;
+	unsigned int link_loss_count;
+	bool is_initialized;
+	struct edp_trace_power_timestamps edp_trace_power_timestamps;
+};
 #endif /* DC_DP_TYPES_H */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index cc3d6fb39364..a583a72845fe 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -1085,5 +1085,19 @@ struct tg_color {
 	uint16_t color_b_cb;
 };
 
+enum symclk_state {
+	SYMCLK_OFF_TX_OFF,
+	SYMCLK_ON_TX_ON,
+	SYMCLK_ON_TX_OFF,
+};
+
+struct phy_state {
+	struct {
+		uint8_t otg		: 1;
+		uint8_t reserved	: 7;
+	} symclk_ref_cnts;
+	enum symclk_state symclk_state;
+};
+
 #endif /* DC_HW_TYPES_H */
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 27d0242d6cbd..f28b8597cc1e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -38,6 +38,7 @@
 #include "dc_hw_types.h"
 #include "dal_types.h"
 #include "grph_object_defs.h"
+#include "grph_object_ctrl_defs.h"
 
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 #include "dm_cp_psp.h"
@@ -982,4 +983,107 @@ struct hdcp_caps {
 	union hdcp_bcaps bcaps;
 };
 #endif
+
+/* DP MST stream allocation (payload bandwidth number) */
+struct link_mst_stream_allocation {
+	/* DIG front */
+	const struct stream_encoder *stream_enc;
+	/* HPO DP Stream Encoder */
+	const struct hpo_dp_stream_encoder *hpo_dp_stream_enc;
+	/* associate DRM payload table with DC stream encoder */
+	uint8_t vcp_id;
+	/* number of slots required for the DP stream in transport packet */
+	uint8_t slot_count;
+};
+
+#define MAX_CONTROLLER_NUM 6
+
+/* DP MST stream allocation table */
+struct link_mst_stream_allocation_table {
+	/* number of DP video streams */
+	int stream_count;
+	/* array of stream allocations */
+	struct link_mst_stream_allocation stream_allocations[MAX_CONTROLLER_NUM];
+};
+
+/* PSR feature flags */
+struct psr_settings {
+	bool psr_feature_enabled;		// PSR is supported by sink
+	bool psr_allow_active;			// PSR is currently active
+	enum dc_psr_version psr_version;		// Internal PSR version, determined based on DPCD
+	bool psr_vtotal_control_support;	// Vtotal control is supported by sink
+	unsigned long long psr_dirty_rects_change_timestamp_ns;	// for delay of enabling PSR-SU
+
+	/* These parameters are calculated in Driver,
+	 * based on display timing and Sink capabilities.
+	 * If VBLANK region is too small and Sink takes a long time
+	 * to set up RFB, it may take an extra frame to enter PSR state.
+	 */
+	bool psr_frame_capture_indication_req;
+	unsigned int psr_sdp_transmit_line_num_deadline;
+	uint8_t force_ffu_mode;
+	unsigned int psr_power_opt;
+};
+
+/* To split out "global" and "per-panel" config settings.
+ * Add a struct dc_panel_config under dc_link
+ */
+struct dc_panel_config {
+	/* extra panel power sequence parameters */
+	struct pps {
+		unsigned int extra_t3_ms;
+		unsigned int extra_t7_ms;
+		unsigned int extra_delay_backlight_off;
+		unsigned int extra_post_t7_ms;
+		unsigned int extra_pre_t11_ms;
+		unsigned int extra_t12_ms;
+		unsigned int extra_post_OUI_ms;
+	} pps;
+	/* nit brightness */
+	struct nits_brightness {
+		unsigned int peak; /* nits */
+		unsigned int max_avg; /* nits */
+		unsigned int min; /* 1/10000 nits */
+		unsigned int max_nonboost_brightness_millinits;
+		unsigned int min_brightness_millinits;
+	} nits_brightness;
+	/* PSR */
+	struct psr {
+		bool disable_psr;
+		bool disallow_psrsu;
+		bool rc_disable;
+		bool rc_allow_static_screen;
+		bool rc_allow_fullscreen_VPB;
+	} psr;
+	/* ABM */
+	struct varib {
+		unsigned int varibright_feature_enable;
+		unsigned int def_varibright_level;
+		unsigned int abm_config_setting;
+	} varib;
+	/* edp DSC */
+	struct dsc {
+		bool disable_dsc_edp;
+		unsigned int force_dsc_edp_policy;
+	} dsc;
+	/* eDP ILR */
+	struct ilr {
+		bool optimize_edp_link_rate; /* eDP ILR */
+	} ilr;
+};
+
+/*
+ *  USB4 DPIA BW ALLOCATION STRUCTS
+ */
+struct dc_dpia_bw_alloc {
+	int sink_verified_bw;  // The Verified BW that sink can allocated and use that has been verified already
+	int sink_allocated_bw; // The Actual Allocated BW that sink currently allocated
+	int sink_max_bw;       // The Max BW that sink can require/support
+	int estimated_bw;      // The estimated available BW for this DPIA
+	int bw_granularity;    // BW Granularity
+	bool bw_alloc_enabled; // The BW Alloc Mode Support is turned ON for all 3:  DP-Tx & Dpia & CM
+	bool response_ready;   // Response ready from the CM side
+};
+
+#define MAX_SINKS_PER_LINK 4
 #endif /* DC_TYPES_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
index fb0dec4ed3a6..9fc48208c2e4 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
@@ -148,7 +148,7 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
 	int edp_num;
 	uint8_t panel_mask = 0;
 
-	get_edp_links(dc->dc, edp_links, &edp_num);
+	dc_get_edp_links(dc->dc, edp_links, &edp_num);
 
 	for (i = 0; i < edp_num; i++) {
 		if (edp_links[i]->link_status.link_active)
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h
index 74005b9d352a..289e42070ece 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h
@@ -26,8 +26,9 @@
 #ifndef _DMUB_PSR_H_
 #define _DMUB_PSR_H_
 
-#include "os_types.h"
-#include "dc_link.h"
+#include "dc_types.h"
+struct dc_link;
+struct dmub_psr_funcs;
 
 struct dmub_psr {
 	struct dc_context *ctx;
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index fb3fd5b7c78b..e1814f1cba5a 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1741,7 +1741,7 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 
 
 	get_edp_links_with_sink(dc, edp_links_with_sink, &edp_with_sink_num);
-	get_edp_links(dc, edp_links, &edp_num);
+	dc_get_edp_links(dc, edp_links, &edp_num);
 
 	if (hws->funcs.init_pipes)
 		hws->funcs.init_pipes(dc, context);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index a1a29c508394..5b34066ffcf6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -1638,7 +1638,7 @@ void dcn10_power_down_on_boot(struct dc *dc)
 	int edp_num;
 	int i = 0;
 
-	get_edp_links(dc, edp_links, &edp_num);
+	dc_get_edp_links(dc, edp_links, &edp_num);
 	if (edp_num)
 		edp_link = edp_links[0];
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
index 5f9079d3943a..9d08127d209b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
@@ -28,6 +28,7 @@
 #include "dcn30_dio_stream_encoder.h"
 #include "reg_helper.h"
 #include "hw_shared.h"
+#include "dc.h"
 #include "core_types.h"
 #include <linux/delay.h>
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 0f7de972c80a..73de15a20d13 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -562,7 +562,7 @@ void dcn30_init_hw(struct dc *dc)
 		struct dc_link *edp_links[MAX_NUM_EDP];
 		struct dc_link *edp_link = NULL;
 
-		get_edp_links(dc, edp_links, &edp_num);
+		dc_get_edp_links(dc, edp_links, &edp_num);
 		if (edp_num)
 			edp_link = edp_links[0];
 		if (edp_link && edp_link->link_enc->funcs->is_dig_enabled &&
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.c
index 0b317ed31f91..5b7ad38f85e0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.c
@@ -26,7 +26,6 @@
 #include "dc_bios_types.h"
 #include "dcn31_hpo_dp_link_encoder.h"
 #include "reg_helper.h"
-#include "dc_link.h"
 #include "stream_encoder.h"
 
 #define DC_LOGGER \
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
index d76f55a12eb4..0278bae50a9d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
@@ -26,7 +26,7 @@
 #include "dc_bios_types.h"
 #include "dcn31_hpo_dp_stream_encoder.h"
 #include "reg_helper.h"
-#include "dc_link.h"
+#include "dc.h"
 
 #define DC_LOGGER \
 		enc3->base.ctx->logger
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c
index 4dbad8d4b4fc..8af01f579690 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c
@@ -26,7 +26,6 @@
 #include "dcn31/dcn31_hpo_dp_link_encoder.h"
 #include "dcn32_hpo_dp_link_encoder.h"
 #include "reg_helper.h"
-#include "dc_link.h"
 #include "stream_encoder.h"
 
 #define DC_LOGGER \
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index f667f2a6f686..4ba7a10dd7ec 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -837,7 +837,7 @@ void dcn32_init_hw(struct dc *dc)
 		struct dc_link *edp_links[MAX_NUM_EDP];
 		struct dc_link *edp_link;
 
-		get_edp_links(dc, edp_links, &edp_num);
+		dc_get_edp_links(dc, edp_links, &edp_num);
 		if (edp_num) {
 			for (i = 0; i < edp_num; i++) {
 				edp_link = edp_links[i];
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index c3d75e56410c..899105da0433 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -25,7 +25,6 @@
 
 #ifdef CONFIG_DRM_AMD_DC_DCN
 #include "dc.h"
-#include "dc_link.h"
 #include "../display_mode_lib.h"
 #include "display_mode_vba_30.h"
 #include "../dml_inline_defs.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 27f488405335..2b57f5b2362a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -24,7 +24,6 @@
  */
 
 #include "dc.h"
-#include "dc_link.h"
 #include "../display_mode_lib.h"
 #include "../dcn30/display_mode_vba_30.h"
 #include "display_mode_vba_31.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index c843b394aeb4..461ab6d2030e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -27,7 +27,6 @@
 #define UNIT_TEST 0
 #if !UNIT_TEST
 #include "dc.h"
-#include "dc_link.h"
 #endif
 #include "../display_mode_lib.h"
 #include "display_mode_vba_314.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index 3b2a014ccf8f..f2499811e269 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -24,7 +24,6 @@
  */
 
 #include "dc.h"
-#include "dc_link.h"
 #include "../display_mode_lib.h"
 #include "display_mode_vba_32.h"
 #include "../dml_inline_defs.h"
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
index a819f0f97c5f..b95ae9596c3b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
@@ -275,20 +275,6 @@ enum dc_lut_mode {
 	LUT_RAM_B
 };
 
-enum symclk_state {
-	SYMCLK_OFF_TX_OFF,
-	SYMCLK_ON_TX_ON,
-	SYMCLK_ON_TX_OFF,
-};
-
-struct phy_state {
-	struct {
-		uint8_t otg		: 1;
-		uint8_t reserved	: 7;
-	} symclk_ref_cnts;
-	enum symclk_state symclk_state;
-};
-
 /**
  * speakersToChannels
  *
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h
index ec572a9e4054..dbe7afa9d3a2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h
@@ -75,58 +75,6 @@ struct encoder_feature_support {
 	bool fec_supported;
 };
 
-union dpcd_psr_configuration {
-	struct {
-		unsigned char ENABLE                    : 1;
-		unsigned char TRANSMITTER_ACTIVE_IN_PSR : 1;
-		unsigned char CRC_VERIFICATION          : 1;
-		unsigned char FRAME_CAPTURE_INDICATION  : 1;
-		/* For eDP 1.4, PSR v2*/
-		unsigned char LINE_CAPTURE_INDICATION   : 1;
-		/* For eDP 1.4, PSR v2*/
-		unsigned char IRQ_HPD_WITH_CRC_ERROR    : 1;
-		unsigned char ENABLE_PSR2               : 1;
-		/* For eDP 1.5, PSR v2 w/ early transport */
-		unsigned char EARLY_TRANSPORT_ENABLE    : 1;
-	} bits;
-	unsigned char raw;
-};
-
-union dpcd_alpm_configuration {
-	struct {
-		unsigned char ENABLE                    : 1;
-		unsigned char IRQ_HPD_ENABLE            : 1;
-		unsigned char RESERVED                  : 6;
-	} bits;
-	unsigned char raw;
-};
-
-union dpcd_sink_active_vtotal_control_mode {
-	struct {
-		unsigned char ENABLE                    : 1;
-		unsigned char RESERVED                  : 7;
-	} bits;
-	unsigned char raw;
-};
-
-union psr_error_status {
-	struct {
-		unsigned char LINK_CRC_ERROR        :1;
-		unsigned char RFB_STORAGE_ERROR     :1;
-		unsigned char VSC_SDP_ERROR         :1;
-		unsigned char RESERVED              :5;
-	} bits;
-	unsigned char raw;
-};
-
-union psr_sink_psr_status {
-	struct {
-	unsigned char SINK_SELF_REFRESH_STATUS  :3;
-	unsigned char RESERVED                  :5;
-	} bits;
-	unsigned char raw;
-};
-
 struct link_encoder {
 	const struct link_encoder_funcs *funcs;
 	int32_t aux_channel_offset;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
index bb5ad70d4266..c4fbbf08ef86 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
@@ -30,7 +30,6 @@
 
 #include "audio_types.h"
 #include "hw_shared.h"
-#include "dc_link.h"
 
 struct dc_bios;
 struct dc_context;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index e70fa0059223..6a346a41f07b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -38,7 +38,6 @@
  * into this file and prefix it with "link_".
  */
 #include "core_types.h"
-#include "dc_link.h"
 
 struct link_init_data {
 	const struct dc *dc;
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
index 942300e0bd92..7f36d733bfca 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
@@ -1027,20 +1027,3 @@ void dc_link_set_preferred_training_settings(struct dc *dc,
 	if (skip_immediate_retrain == false)
 		dc_link_set_preferred_link_settings(dc, &link->preferred_link_setting, link);
 }
-
-void dc_link_set_test_pattern(struct dc_link *link,
-		enum dp_test_pattern test_pattern,
-		enum dp_test_pattern_color_space test_pattern_color_space,
-		const struct link_training_settings *p_link_settings,
-		const unsigned char *p_custom_pattern,
-		unsigned int cust_pattern_size)
-{
-	if (link != NULL)
-		dc_link_dp_set_test_pattern(
-			link,
-			test_pattern,
-			test_pattern_color_space,
-			p_link_settings,
-			p_custom_pattern,
-			cust_pattern_size);
-}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 38216c789d77..2c4bbff6897b 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1321,3 +1321,102 @@ const struct dc_link_status *link_get_status(const struct dc_link *link)
 	return &link->link_status;
 }
 
+
+static bool link_add_remote_sink_helper(struct dc_link *dc_link, struct dc_sink *sink)
+{
+	if (dc_link->sink_count >= MAX_SINKS_PER_LINK) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+
+	dc_sink_retain(sink);
+
+	dc_link->remote_sinks[dc_link->sink_count] = sink;
+	dc_link->sink_count++;
+
+	return true;
+}
+
+struct dc_sink *dc_link_add_remote_sink(
+		struct dc_link *link,
+		const uint8_t *edid,
+		int len,
+		struct dc_sink_init_data *init_data)
+{
+	struct dc_sink *dc_sink;
+	enum dc_edid_status edid_status;
+
+	if (len > DC_MAX_EDID_BUFFER_SIZE) {
+		dm_error("Max EDID buffer size breached!\n");
+		return NULL;
+	}
+
+	if (!init_data) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	if (!init_data->link) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dc_sink = dc_sink_create(init_data);
+
+	if (!dc_sink)
+		return NULL;
+
+	memmove(dc_sink->dc_edid.raw_edid, edid, len);
+	dc_sink->dc_edid.length = len;
+
+	if (!link_add_remote_sink_helper(
+			link,
+			dc_sink))
+		goto fail_add_sink;
+
+	edid_status = dm_helpers_parse_edid_caps(
+			link,
+			&dc_sink->dc_edid,
+			&dc_sink->edid_caps);
+
+	/*
+	 * Treat device as no EDID device if EDID
+	 * parsing fails
+	 */
+	if (edid_status != EDID_OK && edid_status != EDID_PARTIAL_VALID) {
+		dc_sink->dc_edid.length = 0;
+		dm_error("Bad EDID, status%d!\n", edid_status);
+	}
+
+	return dc_sink;
+
+fail_add_sink:
+	dc_sink_release(dc_sink);
+	return NULL;
+}
+
+void dc_link_remove_remote_sink(struct dc_link *link, struct dc_sink *sink)
+{
+	int i;
+
+	if (!link->sink_count) {
+		BREAK_TO_DEBUGGER();
+		return;
+	}
+
+	for (i = 0; i < link->sink_count; i++) {
+		if (link->remote_sinks[i] == sink) {
+			dc_sink_release(sink);
+			link->remote_sinks[i] = NULL;
+
+			/* shrink array to remove empty place */
+			while (i < link->sink_count - 1) {
+				link->remote_sinks[i] = link->remote_sinks[i+1];
+				i++;
+			}
+			link->remote_sinks[i] = NULL;
+			link->sink_count--;
+			return;
+		}
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
index 32f48a48e9dd..cbfa9343ffaf 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
@@ -26,7 +26,6 @@
 
 #include "dc.h"
 #include "inc/core_status.h"
-#include "dc_link.h"
 #include "dpcd_defs.h"
 
 #include "link_dp_dpia.h"
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
index 72ff0ae44d01..7b32fd010f11 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
@@ -27,7 +27,6 @@
 //				USB4 DPIA BANDWIDTH ALLOCATION LOGIC
 /*********************************************************************/
 #include "dc.h"
-#include "dc_link.h"
 #include "link_dp_dpia_bw.h"
 #include "drm_dp_helper_dc.h"
 #include "link_dpcd.h"
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
index 9715fa754d56..7711fda42261 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
@@ -29,7 +29,6 @@
 #include "link_dp_training_dpia.h"
 #include "dc.h"
 #include "inc/core_status.h"
-#include "dc_link.h"
 #include "dpcd_defs.h"
 
 #include "link_dp_dpia.h"
diff --git a/drivers/gpu/drm/amd/display/include/link_service_types.h b/drivers/gpu/drm/amd/display/include/link_service_types.h
index 18b9173d5a96..cd870af5fd25 100644
--- a/drivers/gpu/drm/amd/display/include/link_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/link_service_types.h
@@ -34,10 +34,6 @@
 struct ddc;
 struct irq_manager;
 
-enum {
-	MAX_CONTROLLER_NUM = 6
-};
-
 enum dp_power_state {
 	DP_POWER_STATE_D0 = 1,
 	DP_POWER_STATE_D3
@@ -60,28 +56,6 @@ enum {
 	DATA_EFFICIENCY_128b_132b_x10000 = 9646, /* 96.71% data efficiency x 99.75% downspread factor */
 };
 
-enum link_training_result {
-	LINK_TRAINING_SUCCESS,
-	LINK_TRAINING_CR_FAIL_LANE0,
-	LINK_TRAINING_CR_FAIL_LANE1,
-	LINK_TRAINING_CR_FAIL_LANE23,
-	/* CR DONE bit is cleared during EQ step */
-	LINK_TRAINING_EQ_FAIL_CR,
-	/* CR DONE bit is cleared but LANE0_CR_DONE is set during EQ step */
-	LINK_TRAINING_EQ_FAIL_CR_PARTIAL,
-	/* other failure during EQ step */
-	LINK_TRAINING_EQ_FAIL_EQ,
-	LINK_TRAINING_LQA_FAIL,
-	/* one of the CR,EQ or symbol lock is dropped */
-	LINK_TRAINING_LINK_LOSS,
-	/* Abort link training (because sink unplugged) */
-	LINK_TRAINING_ABORT,
-	DP_128b_132b_LT_FAILED,
-	DP_128b_132b_MAX_LOOP_COUNT_REACHED,
-	DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT,
-	DP_128b_132b_CDS_DONE_TIMEOUT,
-};
-
 enum lttpr_mode {
 	LTTPR_MODE_UNKNOWN,
 	LTTPR_MODE_NON_LTTPR,
-- 
2.34.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF26E2792
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Apr 2023 17:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7101B10EDD0;
	Fri, 14 Apr 2023 15:54:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7A210EDCD
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Apr 2023 15:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3NLUPvGKxIJKwnRdzfswd1pH5/NtdUAWPWzdW/ynyrTboXWKEi9YnxYm2yStPwoFnFC7oaw4RPj8cw6SY4n8JanjPe7xWBvH5ENrDhIC8UNuXUnB0jYkAhVdjOAzfxTGi1Cnwga2l7GoqOkh7J2m6ywLctbjCkM2HZly9xGr2Pfiueh/pTiEO7LmA28nwPDd7Ier/TsXd/kUKjo2MsUJf6cHxSUUJMFNCa9KXLpgXE94UNSn1qDgfMsc2URY1NnoeHvyynH+NSgbRfFJrZK9plG5oEP3dbH6IM9fZqffwWU6j2UX9/K964OnzwiNmGFPB8/Sh/jEaJEJePT6o36Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw+1wdATjZB4wByQlN3g46Wzy0e9yMaiKBKzTo78dh4=;
 b=SR9P5BQwKli/hQAkBpD3PhGFdXNH0fXDUVkVm7dKtjFdvH8Bw12OBW9iBAmmUAubPf1uYP253q/cgtYwqdhjcHpFeaRPpMCtOjlCTtfnzDy7w1fnGjNNqVdoSb8lxhlnYKfO/NZ3K5uN3P2uwcavTsg74WXHC30JvkIbjV/EKvjgdEcORV0k2U4+Cq4nEGANCC7VRT5Qu6f8NtELNAewWgyK+L5JSp610+EqG7dwQZ3zH1kl84axDfD8Mwr3P1hiXqGoooX4i4C0t5DJhsNtFga1AS3tauds3cRSfMd8oT6J5Cmi9SKen0ylgEo9H27GaNXN5lSwuvtR0QI4a1EFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bw+1wdATjZB4wByQlN3g46Wzy0e9yMaiKBKzTo78dh4=;
 b=4qbM5YEndgMX7ArgabMumdkb1W0zpdTYmUwRdQvfxPp+qEkI59ZHgfEoDKFf4OK9Z6oM94rjwbfav9AbptniZgdN9Q62gGsuVn8KqlzRDGOo5Mi2TC7ihAU3rTQr+MsnM6BFQuNjcMcyzxeuQUDkwOCLjtVTfLUD33FC+zFbXG8=
Received: from BN0PR10CA0008.namprd10.prod.outlook.com (2603:10b6:408:143::27)
 by PH8PR12MB6913.namprd12.prod.outlook.com (2603:10b6:510:1ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 15:54:19 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::e6) by BN0PR10CA0008.outlook.office365.com
 (2603:10b6:408:143::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 15:54:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.31 via Frontend Transport; Fri, 14 Apr 2023 15:54:18 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 10:54:16 -0500
From: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/66] drm/amd/display: refactor dmub commands into single
 function
Date: Fri, 14 Apr 2023 11:52:45 -0400
Message-ID: <20230414155330.5215-22-Qingqing.Zhuo@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414155330.5215-1-Qingqing.Zhuo@amd.com>
References: <20230414155330.5215-1-Qingqing.Zhuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT030:EE_|PH8PR12MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f804b6-48c0-4938-9b96-08db3d0081ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7bOZCO8t6IjW6oWMWK4xZuESwrQHumetkjaMSKPC5W5P+swkhYsD17aHOc2N9zrVcZI+hC0a54HqyPBV1J64AvOOZyBnu0LhSckc9uW+UbeeaYqYUDfB+z71UtmI6k3TwDpRLHP/Iir2AE8LXW1WJ6/duVKByBXul2NekkYebrZ0AH6oVJuKvfNXyfbWcj+MPKbIB88GIuNA83uBCcK/6bQETXAEwhDSbsi90l7tuWdvjoQUzch6iLNBrjSOgCuHXar5/RwkHEX5YdwV+sej72FbCmZNQqEsO1IUzyajwwrPMcD8oRaxm8U5VEsfiHbTifdHmE4Tm+rcQ5Yrk3g3hVPcmrQr1xx9gCC4GwKVc4jcqnwRRbf9XSb9MK/6QZR4Xa/rkMnKQ2LpJV+CdaoBEy9vM3+q6YhlKq0gnjrkZE3srcfpipRm36grT7bWe/SyMifi1TYxOiJtbZjsF0y1zLNg3HtotqELApK4BZJ4PBJ/jeBZDz3CHozHkrY/dQ3xlDrdkBcCBlQbwG4qF1HTAIZzfqiv+HPrZIZwhJfa7r90SVYOLI3D/Kh+A25Il0mDJsEv/1lTeOclhB45vmWKXw2D7+xKfjUIJv7VMxPGrFcpkC/w2XyazfR1I9I+PmzfJzVySc7x4jUJu2SdLuP8SqpP3MFXpOdqvbHjwKIKyzd5qPR22sD2rQ7al6buxw1kQJYsRABOpUObarDaPzsLgduEZP72j0qdJNrrMxa5vM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(26005)(336012)(426003)(1076003)(54906003)(40480700001)(186003)(47076005)(83380400001)(2616005)(16526019)(36860700001)(40460700003)(6666004)(5660300002)(41300700001)(316002)(8936002)(82740400003)(82310400005)(8676002)(356005)(86362001)(81166007)(478600001)(70586007)(36756003)(4326008)(70206006)(6916009)(2906002)(30864003)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 15:54:18.7390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f804b6-48c0-4938-9b96-08db3d0081ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6913
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
Cc: stylon.wang@amd.com, Josip Pavic <Josip.Pavic@amd.com>, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, solomon.chiu@amd.com, Aurabindo.Pillai@amd.com,
 wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Josip Pavic <Josip.Pavic@amd.com>

[Why & How]
Consolidate dmub access to a single interface. This makes it easier to
add code in the future that needs to run every time a dmub command is
requested (e.g. instrumentation, locking etc).

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Josip Pavic <Josip.Pavic@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
 .../drm/amd/display/dc/bios/command_table2.c  |  25 +--
 .../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c  |   4 +-
 .../dc/clk_mgr/dcn314/dcn314_clk_mgr.c        |   4 +-
 .../dc/clk_mgr/dcn315/dcn315_clk_mgr.c        |   4 +-
 .../dc/clk_mgr/dcn316/dcn316_clk_mgr.c        |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  23 +--
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  | 164 +++++++-----------
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h  |  13 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c    |  28 +--
 .../gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c |  28 +--
 .../drm/amd/display/dc/dce/dmub_hw_lock_mgr.c |   4 +-
 .../gpu/drm/amd/display/dc/dce/dmub_outbox.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |  28 +--
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c |   7 +-
 .../drm/amd/display/dc/dcn21/dcn21_hwseq.c    |   8 +-
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  16 +-
 .../display/dc/dcn31/dcn31_dio_link_encoder.c |   8 +-
 .../drm/amd/display/dc/dcn31/dcn31_hwseq.c    |  10 +-
 .../amd/display/dc/dcn31/dcn31_panel_cntl.c   |   4 +-
 .../drm/amd/display/dc/dcn314/dcn314_hwseq.c  |   4 +-
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    |  12 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h  |   7 +
 .../drm/amd/display/dc/dm_services_types.h    |   6 +
 .../dc/link/protocols/link_dp_capability.c    |   2 +-
 .../display/dc/link/protocols/link_dp_dpia.c  |   2 +-
 26 files changed, 148 insertions(+), 283 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fa2acc017437..ffa2743e92e2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10310,7 +10310,7 @@ static bool dm_edid_parser_send_cea(struct amdgpu_display_manager *dm,
 	input->cea_total_length = total_length;
 	memcpy(input->payload, data, length);
 
-	res = dc_dmub_srv_cmd_with_reply_data(dm->dc->ctx->dmub_srv, &cmd);
+	res = dm_execute_dmub_cmd(dm->dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY);
 	if (!res) {
 		DRM_ERROR("EDID CEA parser failed\n");
 		return false;
@@ -10760,3 +10760,13 @@ bool check_seamless_boot_capability(struct amdgpu_device *adev)
 
 	return false;
 }
+
+bool dm_execute_dmub_cmd(const struct dc_context *ctx, union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type)
+{
+	return dc_dmub_srv_cmd_run(ctx->dmub_srv, cmd, wait_type);
+}
+
+bool dm_execute_dmub_cmd_list(const struct dc_context *ctx, unsigned int count, union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type)
+{
+	return dc_dmub_srv_cmd_run_list(ctx->dmub_srv, count, cmd, wait_type);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
index 1ef9e4053bb7..90a02d7bd3da 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
@@ -123,9 +123,7 @@ static void encoder_control_dmcub(
 		sizeof(cmd.digx_encoder_control.header);
 	cmd.digx_encoder_control.encoder_control.dig.stream_param = *dig;
 
-	dc_dmub_srv_cmd_queue(dmcub, &cmd);
-	dc_dmub_srv_cmd_execute(dmcub);
-	dc_dmub_srv_wait_idle(dmcub);
+	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result encoder_control_digx_v1_5(
@@ -261,9 +259,7 @@ static void transmitter_control_dmcub(
 		sizeof(cmd.dig1_transmitter_control.header);
 	cmd.dig1_transmitter_control.transmitter_control.dig = *dig;
 
-	dc_dmub_srv_cmd_queue(dmcub, &cmd);
-	dc_dmub_srv_cmd_execute(dmcub);
-	dc_dmub_srv_wait_idle(dmcub);
+	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result transmitter_control_v1_6(
@@ -325,9 +321,7 @@ static void transmitter_control_dmcub_v1_7(
 		sizeof(cmd.dig1_transmitter_control.header);
 	cmd.dig1_transmitter_control.transmitter_control.dig_v1_7 = *dig;
 
-	dc_dmub_srv_cmd_queue(dmcub, &cmd);
-	dc_dmub_srv_cmd_execute(dmcub);
-	dc_dmub_srv_wait_idle(dmcub);
+	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result transmitter_control_v1_7(
@@ -435,9 +429,7 @@ static void set_pixel_clock_dmcub(
 		sizeof(cmd.set_pixel_clock.header);
 	cmd.set_pixel_clock.pixel_clock.clk = *clk;
 
-	dc_dmub_srv_cmd_queue(dmcub, &cmd);
-	dc_dmub_srv_cmd_execute(dmcub);
-	dc_dmub_srv_wait_idle(dmcub);
+	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result set_pixel_clock_v7(
@@ -804,9 +796,7 @@ static void enable_disp_power_gating_dmcub(
 		sizeof(cmd.enable_disp_power_gating.header);
 	cmd.enable_disp_power_gating.power_gating.pwr = *pwr;
 
-	dc_dmub_srv_cmd_queue(dmcub, &cmd);
-	dc_dmub_srv_cmd_execute(dmcub);
-	dc_dmub_srv_wait_idle(dmcub);
+	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result enable_disp_power_gating_v2_1(
@@ -1016,10 +1006,7 @@ static void enable_lvtma_control_dmcub(
 			panel_instance;
 	cmd.lvtma_control.data.bypass_panel_control_wait =
 			bypass_panel_control_wait;
-	dc_dmub_srv_cmd_queue(dmcub, &cmd);
-	dc_dmub_srv_cmd_execute(dmcub);
-	dc_dmub_srv_wait_idle(dmcub);
-
+	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result enable_lvtma_control(
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
index f9e2e0c3095e..3c743cd3d3f0 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
@@ -250,9 +250,7 @@ void dcn31_update_clocks(struct clk_mgr *clk_mgr_base,
 	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
 	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
 
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static int get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
index 5cb44f838bde..4d5cd59f6433 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
@@ -286,9 +286,7 @@ void dcn314_update_clocks(struct clk_mgr *clk_mgr_base,
 	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
 	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
 
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static int get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index b737cbc468f5..300c6a5872d0 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -234,9 +234,7 @@ static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
 	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
 	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
 
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static void dcn315_dump_clk_registers(struct clk_state_registers_and_bypass *regs_and_bypass,
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
index 93db4dbee713..538126cefd4d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
@@ -254,9 +254,7 @@ static void dcn316_update_clocks(struct clk_mgr *clk_mgr_base,
 	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
 	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
 
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static void dcn316_dump_clk_registers(struct clk_state_registers_and_bypass *regs_and_bypass,
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index d61bfa3562dd..9b2003a497b4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -515,8 +515,7 @@ dc_stream_forward_dmub_crc_window(struct dc_dmub_srv *dmub_srv,
 		cmd.secure_display.roi_info.y_end = rect->y + rect->height;
 	}
 
-	dc_dmub_srv_cmd_queue(dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dmub_srv);
+	dm_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 }
 
 static inline void
@@ -3309,7 +3308,6 @@ void dc_dmub_update_dirty_rect(struct dc *dc,
 			       struct dc_state *context)
 {
 	union dmub_rb_cmd cmd;
-	struct dc_context *dc_ctx = dc->ctx;
 	struct dmub_cmd_update_dirty_rect_data *update_dirty_rect;
 	unsigned int i, j;
 	unsigned int panel_inst = 0;
@@ -3350,8 +3348,7 @@ void dc_dmub_update_dirty_rect(struct dc *dc,
 
 			update_dirty_rect->panel_inst = panel_inst;
 			update_dirty_rect->pipe_idx = j;
-			dc_dmub_srv_cmd_queue(dc_ctx->dmub_srv, &cmd);
-			dc_dmub_srv_cmd_execute(dc_ctx->dmub_srv);
+			dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 		}
 	}
 }
@@ -4627,7 +4624,6 @@ bool dc_process_dmub_aux_transfer_async(struct dc *dc,
 {
 	uint8_t action;
 	union dmub_rb_cmd cmd = {0};
-	struct dc_dmub_srv *dmub_srv = dc->ctx->dmub_srv;
 
 	ASSERT(payload->length <= 16);
 
@@ -4675,9 +4671,7 @@ bool dc_process_dmub_aux_transfer_async(struct dc *dc,
 			);
 	}
 
-	dc_dmub_srv_cmd_queue(dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dmub_srv);
-	dc_dmub_srv_wait_idle(dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -4721,7 +4715,6 @@ bool dc_process_dmub_set_config_async(struct dc *dc,
 				struct dmub_notification *notify)
 {
 	union dmub_rb_cmd cmd = {0};
-	struct dc_dmub_srv *dmub_srv = dc->ctx->dmub_srv;
 	bool is_cmd_complete = true;
 
 	/* prepare SET_CONFIG command */
@@ -4732,7 +4725,7 @@ bool dc_process_dmub_set_config_async(struct dc *dc,
 	cmd.set_config_access.set_config_control.cmd_pkt.msg_type = payload->msg_type;
 	cmd.set_config_access.set_config_control.cmd_pkt.msg_data = payload->msg_data;
 
-	if (!dc_dmub_srv_cmd_with_reply_data(dmub_srv, &cmd)) {
+	if (!dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY)) {
 		/* command is not processed by dmub */
 		notify->sc_status = SET_CONFIG_UNKNOWN_ERROR;
 		return is_cmd_complete;
@@ -4767,7 +4760,6 @@ enum dc_status dc_process_dmub_set_mst_slots(const struct dc *dc,
 				uint8_t *mst_slots_in_use)
 {
 	union dmub_rb_cmd cmd = {0};
-	struct dc_dmub_srv *dmub_srv = dc->ctx->dmub_srv;
 
 	/* prepare MST_ALLOC_SLOTS command */
 	cmd.set_mst_alloc_slots.header.type = DMUB_CMD__DPIA;
@@ -4776,7 +4768,7 @@ enum dc_status dc_process_dmub_set_mst_slots(const struct dc *dc,
 	cmd.set_mst_alloc_slots.mst_slots_control.instance = dc->links[link_index]->ddc_hw_inst;
 	cmd.set_mst_alloc_slots.mst_slots_control.mst_alloc_slots = mst_alloc_slots;
 
-	if (!dc_dmub_srv_cmd_with_reply_data(dmub_srv, &cmd))
+	if (!dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY))
 		/* command is not processed by dmub */
 		return DC_ERROR_UNEXPECTED;
 
@@ -4810,14 +4802,11 @@ void dc_process_dmub_dpia_hpd_int_enable(const struct dc *dc,
 				uint32_t hpd_int_enable)
 {
 	union dmub_rb_cmd cmd = {0};
-	struct dc_dmub_srv *dmub_srv = dc->ctx->dmub_srv;
 
 	cmd.dpia_hpd_int_enable.header.type = DMUB_CMD__DPIA_HPD_INT_ENABLE;
 	cmd.dpia_hpd_int_enable.enable = hpd_int_enable;
 
-	dc_dmub_srv_cmd_queue(dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dmub_srv);
-	dc_dmub_srv_wait_idle(dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	DC_LOG_DEBUG("%s: hpd_int_enable(%d)\n", __func__, hpd_int_enable);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index a9b9490a532c..954cbfdbc3b6 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -65,47 +65,6 @@ void dc_dmub_srv_destroy(struct dc_dmub_srv **dmub_srv)
 	}
 }
 
-void dc_dmub_srv_cmd_queue(struct dc_dmub_srv *dc_dmub_srv,
-			   union dmub_rb_cmd *cmd)
-{
-	struct dmub_srv *dmub = dc_dmub_srv->dmub;
-	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
-	enum dmub_status status;
-
-	status = dmub_srv_cmd_queue(dmub, cmd);
-	if (status == DMUB_STATUS_OK)
-		return;
-
-	if (status != DMUB_STATUS_QUEUE_FULL)
-		goto error;
-
-	/* Execute and wait for queue to become empty again. */
-	dc_dmub_srv_cmd_execute(dc_dmub_srv);
-	dc_dmub_srv_wait_idle(dc_dmub_srv);
-
-	/* Requeue the command. */
-	status = dmub_srv_cmd_queue(dmub, cmd);
-	if (status == DMUB_STATUS_OK)
-		return;
-
-error:
-	DC_ERROR("Error queuing DMUB command: status=%d\n", status);
-	dc_dmub_srv_log_diagnostic_data(dc_dmub_srv);
-}
-
-void dc_dmub_srv_cmd_execute(struct dc_dmub_srv *dc_dmub_srv)
-{
-	struct dmub_srv *dmub = dc_dmub_srv->dmub;
-	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
-	enum dmub_status status;
-
-	status = dmub_srv_cmd_execute(dmub);
-	if (status != DMUB_STATUS_OK) {
-		DC_ERROR("Error starting DMUB execution: status=%d\n", status);
-		dc_dmub_srv_log_diagnostic_data(dc_dmub_srv);
-	}
-}
-
 void dc_dmub_srv_wait_idle(struct dc_dmub_srv *dc_dmub_srv)
 {
 	struct dmub_srv *dmub = dc_dmub_srv->dmub;
@@ -159,22 +118,55 @@ void dc_dmub_srv_send_inbox0_cmd(struct dc_dmub_srv *dmub_srv,
 	}
 }
 
-bool dc_dmub_srv_cmd_with_reply_data(struct dc_dmub_srv *dc_dmub_srv, union dmub_rb_cmd *cmd)
+bool dc_dmub_srv_cmd_run(struct dc_dmub_srv *dc_dmub_srv, union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type)
 {
+	return dc_dmub_srv_cmd_run_list(dc_dmub_srv, 1, cmd, wait_type);
+}
+
+bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int count, union dmub_rb_cmd *cmd_list, enum dm_dmub_wait_type wait_type)
+{
+	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
 	struct dmub_srv *dmub;
 	enum dmub_status status;
+	int i;
 
 	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
 		return false;
 
 	dmub = dc_dmub_srv->dmub;
 
-	status = dmub_srv_cmd_with_reply_data(dmub, cmd);
+	for (i = 0 ; i < count; i++) {
+		// Queue command
+		status = dmub_srv_cmd_queue(dmub, &cmd_list[i]);
+
+		if (status != DMUB_STATUS_OK) {
+			DC_ERROR("Error queueing DMUB command: status=%d\n", status);
+			dc_dmub_srv_log_diagnostic_data(dc_dmub_srv);
+			return false;
+		}
+	}
+
+	status = dmub_srv_cmd_execute(dmub);
 	if (status != DMUB_STATUS_OK) {
-		DC_LOG_DEBUG("No reply for DMUB command: status=%d\n", status);
+		DC_ERROR("Error starting DMUB execution: status=%d\n", status);
+		dc_dmub_srv_log_diagnostic_data(dc_dmub_srv);
 		return false;
 	}
 
+	// Wait for DMUB to process command
+	if (wait_type != DM_DMUB_WAIT_TYPE_NO_WAIT) {
+		status = dmub_srv_wait_for_idle(dmub, 100000);
+
+		if (status != DMUB_STATUS_OK) {
+			DC_LOG_DEBUG("No reply for DMUB command: status=%d\n", status);
+			return false;
+		}
+
+		// Copy data back from ring buffer into command
+		if (wait_type == DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY)
+			dmub_rb_get_return_data(&dmub->inbox1_rb, cmd_list);
+	}
+
 	return true;
 }
 
@@ -267,9 +259,7 @@ void dc_dmub_srv_drr_update_cmd(struct dc *dc, uint32_t tg_inst, uint32_t vtotal
 	cmd.drr_update.header.payload_bytes = sizeof(cmd.drr_update) - sizeof(cmd.drr_update.header);
 
 	// Send the command to the DMCUB.
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dc_dmub_srv_set_drr_manual_trigger_cmd(struct dc *dc, uint32_t tg_inst)
@@ -283,9 +273,7 @@ void dc_dmub_srv_set_drr_manual_trigger_cmd(struct dc *dc, uint32_t tg_inst)
 	cmd.drr_update.header.payload_bytes = sizeof(cmd.drr_update) - sizeof(cmd.drr_update.header);
 
 	// Send the command to the DMCUB.
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static uint8_t dc_dmub_srv_get_pipes_for_stream(struct dc *dc, struct dc_stream_state *stream)
@@ -378,21 +366,14 @@ bool dc_dmub_srv_p_state_delegate(struct dc *dc, bool should_manage_pstate, stru
 		sizeof(cmd.fw_assisted_mclk_switch) - sizeof(cmd.fw_assisted_mclk_switch.header);
 
 	// Send the command to the DMCUB.
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
 
-void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub)
+void dc_dmub_srv_query_caps_cmd(struct dc_dmub_srv *dc_dmub_srv)
 {
 	union dmub_rb_cmd cmd = { 0 };
-	enum dmub_status status;
-
-	if (!dmub) {
-		return;
-	}
 
 	memset(&cmd, 0, sizeof(cmd));
 
@@ -402,15 +383,10 @@ void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub)
 	cmd.query_feature_caps.header.ret_status = 1;
 	cmd.query_feature_caps.header.payload_bytes = sizeof(struct dmub_cmd_query_feature_caps_data);
 
-	/* Send command to fw */
-	status = dmub_srv_cmd_with_reply_data(dmub, &cmd);
-
-	ASSERT(status == DMUB_STATUS_OK);
-
 	/* If command was processed, copy feature caps to dmub srv */
-	if (status == DMUB_STATUS_OK &&
+	if (dm_execute_dmub_cmd(dc_dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
 	    cmd.query_feature_caps.header.ret_status == 0) {
-		memcpy(&dmub->feature_caps,
+		memcpy(&dc_dmub_srv->dmub->feature_caps,
 		       &cmd.query_feature_caps.query_feature_caps_data,
 		       sizeof(struct dmub_feature_caps));
 	}
@@ -419,7 +395,6 @@ void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub)
 void dc_dmub_srv_get_visual_confirm_color_cmd(struct dc *dc, struct pipe_ctx *pipe_ctx)
 {
 	union dmub_rb_cmd cmd = { 0 };
-	enum dmub_status status;
 	unsigned int panel_inst = 0;
 
 	dc_get_edp_link_panel_inst(dc, pipe_ctx->stream->link, &panel_inst);
@@ -433,13 +408,8 @@ void dc_dmub_srv_get_visual_confirm_color_cmd(struct dc *dc, struct pipe_ctx *pi
 	cmd.visual_confirm_color.header.payload_bytes = sizeof(struct dmub_cmd_visual_confirm_color_data);
 	cmd.visual_confirm_color.visual_confirm_color_data.visual_confirm_color.panel_inst = panel_inst;
 
-	// Send command to fw
-	status = dmub_srv_cmd_with_reply_data(dc->ctx->dmub_srv->dmub, &cmd);
-
-	ASSERT(status == DMUB_STATUS_OK);
-
 	// If command was processed, copy feature caps to dmub srv
-	if (status == DMUB_STATUS_OK &&
+	if (dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
 		cmd.visual_confirm_color.header.ret_status == 0) {
 		memcpy(&dc->ctx->dmub_srv->dmub->visual_confirm_color,
 			&cmd.visual_confirm_color.visual_confirm_color_data,
@@ -797,9 +767,8 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
 
 		cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_cache = wm_val_refclk < 0xFFFF ? wm_val_refclk : 0xFFFF;
 	}
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 bool dc_dmub_srv_get_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv, struct dmub_diagnostic_data *diag_data)
@@ -982,14 +951,6 @@ static void dc_build_cursor_update_payload0(
 	payload->panel_inst  = panel_inst;
 }
 
-static void dc_send_cmd_to_dmu(struct dc_dmub_srv *dmub_srv,
-		union dmub_rb_cmd *cmd)
-{
-	dc_dmub_srv_cmd_queue(dmub_srv, cmd);
-	dc_dmub_srv_cmd_execute(dmub_srv);
-	dc_dmub_srv_wait_idle(dmub_srv);
-}
-
 static void dc_build_cursor_position_update_payload0(
 		struct dmub_cmd_update_cursor_payload0 *pl, const uint8_t p_idx,
 		const struct hubp *hubp, const struct dpp *dpp)
@@ -1032,9 +993,11 @@ static void dc_build_cursor_attribute_update_payload1(
 void dc_send_update_cursor_info_to_dmu(
 		struct pipe_ctx *pCtx, uint8_t pipe_idx)
 {
-	union dmub_rb_cmd cmd = { 0 };
-	union dmub_cmd_update_cursor_info_data *update_cursor_info =
-					&cmd.update_cursor_info.update_cursor_info_data;
+	union dmub_rb_cmd cmd[2];
+	union dmub_cmd_update_cursor_info_data *update_cursor_info_0 =
+					&cmd[0].update_cursor_info.update_cursor_info_data;
+
+	memset(cmd, 0, sizeof(cmd));
 
 	if (!dc_dmub_should_update_cursor_data(pCtx))
 		return;
@@ -1051,31 +1014,28 @@ void dc_send_update_cursor_info_to_dmu(
 
 	{
 		/* Build Payload#0 Header */
-		cmd.update_cursor_info.header.type = DMUB_CMD__UPDATE_CURSOR_INFO;
-		cmd.update_cursor_info.header.payload_bytes =
-				sizeof(cmd.update_cursor_info.update_cursor_info_data);
-		cmd.update_cursor_info.header.multi_cmd_pending = 1; /* To combine multi dmu cmd, 1st cmd */
+		cmd[0].update_cursor_info.header.type = DMUB_CMD__UPDATE_CURSOR_INFO;
+		cmd[0].update_cursor_info.header.payload_bytes =
+				sizeof(cmd[0].update_cursor_info.update_cursor_info_data);
+		cmd[0].update_cursor_info.header.multi_cmd_pending = 1; //To combine multi dmu cmd, 1st cmd
 
 		/* Prepare Payload */
-		dc_build_cursor_update_payload0(pCtx, pipe_idx, &update_cursor_info->payload0);
+		dc_build_cursor_update_payload0(pCtx, pipe_idx, &update_cursor_info_0->payload0);
 
-		dc_build_cursor_position_update_payload0(&update_cursor_info->payload0, pipe_idx,
+		dc_build_cursor_position_update_payload0(&update_cursor_info_0->payload0, pipe_idx,
 				pCtx->plane_res.hubp, pCtx->plane_res.dpp);
-		/* Send update_curosr_info to queue */
-		dc_dmub_srv_cmd_queue(pCtx->stream->ctx->dmub_srv, &cmd);
-	}
+		}
 	{
 		/* Build Payload#1 Header */
-		memset(update_cursor_info, 0, sizeof(union dmub_cmd_update_cursor_info_data));
-		cmd.update_cursor_info.header.type = DMUB_CMD__UPDATE_CURSOR_INFO;
-		cmd.update_cursor_info.header.payload_bytes = sizeof(struct cursor_attributes_cfg);
-		cmd.update_cursor_info.header.multi_cmd_pending = 0; /* Indicate it's the last command. */
+		cmd[1].update_cursor_info.header.type = DMUB_CMD__UPDATE_CURSOR_INFO;
+		cmd[1].update_cursor_info.header.payload_bytes = sizeof(struct cursor_attributes_cfg);
+		cmd[1].update_cursor_info.header.multi_cmd_pending = 0; //Indicate it's the last command.
 
 		dc_build_cursor_attribute_update_payload1(
-				&cmd.update_cursor_info.update_cursor_info_data.payload1.attribute_cfg,
+				&cmd[1].update_cursor_info.update_cursor_info_data.payload1.attribute_cfg,
 				pipe_idx, pCtx->plane_res.hubp, pCtx->plane_res.dpp);
 
 		/* Combine 2nd cmds update_curosr_info to DMU */
-		dc_send_cmd_to_dmu(pCtx->stream->ctx->dmub_srv, &cmd);
+		dm_execute_dmub_cmd_list(pCtx->stream->ctx, 2, cmd, DM_DMUB_WAIT_TYPE_WAIT);
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
index d34f5563df2e..22f7b2704c8e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
@@ -26,7 +26,7 @@
 #ifndef _DMUB_DC_SRV_H_
 #define _DMUB_DC_SRV_H_
 
-#include "os_types.h"
+#include "dm_services_types.h"
 #include "dmub/dmub_srv.h"
 
 struct dmub_srv;
@@ -52,16 +52,13 @@ struct dc_dmub_srv {
 	void *dm;
 };
 
-void dc_dmub_srv_cmd_queue(struct dc_dmub_srv *dc_dmub_srv,
-			   union dmub_rb_cmd *cmd);
-
-void dc_dmub_srv_cmd_execute(struct dc_dmub_srv *dc_dmub_srv);
-
 void dc_dmub_srv_wait_idle(struct dc_dmub_srv *dc_dmub_srv);
 
 void dc_dmub_srv_wait_phy_init(struct dc_dmub_srv *dc_dmub_srv);
 
-bool dc_dmub_srv_cmd_with_reply_data(struct dc_dmub_srv *dc_dmub_srv, union dmub_rb_cmd *cmd);
+bool dc_dmub_srv_cmd_run(struct dc_dmub_srv *dc_dmub_srv, union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type);
+
+bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int count, union dmub_rb_cmd *cmd_list, enum dm_dmub_wait_type wait_type);
 
 bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,
 				    unsigned int stream_mask);
@@ -77,7 +74,7 @@ void dc_dmub_srv_drr_update_cmd(struct dc *dc, uint32_t tg_inst, uint32_t vtotal
 void dc_dmub_srv_set_drr_manual_trigger_cmd(struct dc *dc, uint32_t tg_inst);
 bool dc_dmub_srv_p_state_delegate(struct dc *dc, bool enable_pstate, struct dc_state *context);
 
-void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub);
+void dc_dmub_srv_query_caps_cmd(struct dc_dmub_srv *dc_dmub_srv);
 void dc_dmub_srv_get_visual_confirm_color_cmd(struct dc *dc, struct pipe_ctx *pipe_ctx);
 void dc_dmub_srv_clear_inbox0_ack(struct dc_dmub_srv *dmub_srv);
 void dc_dmub_srv_wait_for_inbox0_ack(struct dc_dmub_srv *dmub_srv);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_helper.c b/drivers/gpu/drm/amd/display/dc/dc_helper.c
index f43cce16bb6c..a21948267c0f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_helper.c
@@ -41,19 +41,13 @@ static inline void submit_dmub_read_modify_write(
 	const struct dc_context *ctx)
 {
 	struct dmub_rb_cmd_read_modify_write *cmd_buf = &offload->cmd_data.read_modify_write;
-	bool gather = false;
 
 	offload->should_burst_write =
 			(offload->same_addr_count == (DMUB_READ_MODIFY_WRITE_SEQ__MAX - 1));
 	cmd_buf->header.payload_bytes =
 			sizeof(struct dmub_cmd_read_modify_write_sequence) * offload->reg_seq_count;
 
-	gather = ctx->dmub_srv->reg_helper_offload.gather_in_progress;
-	ctx->dmub_srv->reg_helper_offload.gather_in_progress = false;
-
-	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &offload->cmd_data);
-
-	ctx->dmub_srv->reg_helper_offload.gather_in_progress = gather;
+	dm_execute_dmub_cmd(ctx, &offload->cmd_data, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 	memset(cmd_buf, 0, sizeof(*cmd_buf));
 
@@ -66,17 +60,11 @@ static inline void submit_dmub_burst_write(
 	const struct dc_context *ctx)
 {
 	struct dmub_rb_cmd_burst_write *cmd_buf = &offload->cmd_data.burst_write;
-	bool gather = false;
 
 	cmd_buf->header.payload_bytes =
 			sizeof(uint32_t) * offload->reg_seq_count;
 
-	gather = ctx->dmub_srv->reg_helper_offload.gather_in_progress;
-	ctx->dmub_srv->reg_helper_offload.gather_in_progress = false;
-
-	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &offload->cmd_data);
-
-	ctx->dmub_srv->reg_helper_offload.gather_in_progress = gather;
+	dm_execute_dmub_cmd(ctx, &offload->cmd_data, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 	memset(cmd_buf, 0, sizeof(*cmd_buf));
 
@@ -88,17 +76,11 @@ static inline void submit_dmub_reg_wait(
 		const struct dc_context *ctx)
 {
 	struct dmub_rb_cmd_reg_wait *cmd_buf = &offload->cmd_data.reg_wait;
-	bool gather = false;
 
-	gather = ctx->dmub_srv->reg_helper_offload.gather_in_progress;
-	ctx->dmub_srv->reg_helper_offload.gather_in_progress = false;
-
-	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &offload->cmd_data);
+	dm_execute_dmub_cmd(ctx, &offload->cmd_data, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 	memset(cmd_buf, 0, sizeof(*cmd_buf));
 	offload->reg_seq_count = 0;
-
-	ctx->dmub_srv->reg_helper_offload.gather_in_progress = gather;
 }
 
 struct dc_reg_value_masks {
@@ -151,7 +133,6 @@ static void dmub_flush_buffer_execute(
 		const struct dc_context *ctx)
 {
 	submit_dmub_read_modify_write(offload, ctx);
-	dc_dmub_srv_cmd_execute(ctx->dmub_srv);
 }
 
 static void dmub_flush_burst_write_buffer_execute(
@@ -159,7 +140,6 @@ static void dmub_flush_burst_write_buffer_execute(
 		const struct dc_context *ctx)
 {
 	submit_dmub_burst_write(offload, ctx);
-	dc_dmub_srv_cmd_execute(ctx->dmub_srv);
 }
 
 static bool dmub_reg_value_burst_set_pack(const struct dc_context *ctx, uint32_t addr,
@@ -691,8 +671,6 @@ void reg_sequence_start_execute(const struct dc_context *ctx)
 		default:
 			return;
 		}
-
-		dc_dmub_srv_cmd_execute(ctx->dmub_srv);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
index 4055d271ac57..e152c68edfd1 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
@@ -75,9 +75,7 @@ static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
 	cmd.abm_set_pwm_frac.abm_set_pwm_frac_data.panel_mask = panel_mask;
 	cmd.abm_set_pwm_frac.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pwm_frac_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dmub_abm_init(struct abm *abm, uint32_t backlight)
@@ -156,9 +154,7 @@ bool dmub_abm_set_level(struct abm *abm, uint32_t level, uint8_t panel_mask)
 	cmd.abm_set_level.abm_set_level_data.panel_mask = panel_mask;
 	cmd.abm_set_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_level_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -180,9 +176,7 @@ void dmub_abm_set_ambient_level(struct abm *abm, unsigned int ambient_lux, uint8
 	cmd.abm_set_ambient_level.abm_set_ambient_level_data.panel_mask = panel_mask;
 	cmd.abm_set_ambient_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_ambient_level_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 #endif
 
@@ -212,9 +206,7 @@ void dmub_abm_init_config(struct abm *abm,
 
 	cmd.abm_init_config.header.payload_bytes = sizeof(struct dmub_cmd_abm_init_config_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 }
 
@@ -231,9 +223,7 @@ bool dmub_abm_set_pause(struct abm *abm, bool pause, unsigned int panel_inst, un
 	cmd.abm_pause.abm_pause_data.panel_mask = panel_mask;
 	cmd.abm_set_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_pause_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -253,9 +243,7 @@ bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst, uint32_t option, uint
 	cmd.abm_set_pipe.abm_set_pipe_data.ramping_boundary = ramping_boundary;
 	cmd.abm_set_pipe.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pipe_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -277,9 +265,7 @@ bool dmub_abm_set_backlight_level(struct abm *abm,
 	cmd.abm_set_backlight.abm_set_backlight_data.panel_mask = (0x01 << panel_inst);
 	cmd.abm_set_backlight.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_backlight_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
index 3f32e9c3fbaf..2aa0e01a6891 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
@@ -47,9 +47,7 @@ void dmub_hw_lock_mgr_cmd(struct dc_dmub_srv *dmub_srv,
 	if (!lock)
 		cmd.lock_hw.lock_hw_data.should_release = 1;
 
-	dc_dmub_srv_cmd_queue(dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dmub_srv);
-	dc_dmub_srv_wait_idle(dmub_srv);
+	dm_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dmub_hw_lock_mgr_inbox0_cmd(struct dc_dmub_srv *dmub_srv,
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
index fff1d07d865d..d8009b2dc56a 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
@@ -48,7 +48,5 @@ void dmub_enable_outbox_notification(struct dc_dmub_srv *dmub_srv)
 		sizeof(cmd.outbox1_enable.header);
 	cmd.outbox1_enable.enable = true;
 
-	dc_dmub_srv_cmd_queue(dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dmub_srv);
-	dc_dmub_srv_wait_idle(dmub_srv);
+	dm_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 9705d8f88382..4000a834592c 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -168,9 +168,7 @@ static bool dmub_psr_set_version(struct dmub_psr *dmub, struct dc_stream_state *
 	cmd.psr_set_version.psr_set_version_data.panel_inst = panel_inst;
 	cmd.psr_set_version.header.payload_bytes = sizeof(struct dmub_cmd_psr_set_version_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -198,9 +196,7 @@ static void dmub_psr_enable(struct dmub_psr *dmub, bool enable, bool wait, uint8
 
 	cmd.psr_enable.header.payload_bytes = 0; // Send header only
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc->dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	/* Below loops 1000 x 500us = 500 ms.
 	 *  Exit PSR may need to wait 1-2 frames to power up. Timeout after at
@@ -248,9 +244,7 @@ static void dmub_psr_set_level(struct dmub_psr *dmub, uint16_t psr_level, uint8_
 	cmd.psr_set_level.psr_set_level_data.psr_level = psr_level;
 	cmd.psr_set_level.psr_set_level_data.cmd_version = DMUB_CMD_PSR_CONTROL_VERSION_1;
 	cmd.psr_set_level.psr_set_level_data.panel_inst = panel_inst;
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
@@ -269,9 +263,7 @@ static void dmub_psr_set_sink_vtotal_in_psr_active(struct dmub_psr *dmub,
 	cmd.psr_set_vtotal.psr_set_vtotal_data.psr_vtotal_idle = psr_vtotal_idle;
 	cmd.psr_set_vtotal.psr_set_vtotal_data.psr_vtotal_su = psr_vtotal_su;
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
@@ -290,9 +282,7 @@ static void dmub_psr_set_power_opt(struct dmub_psr *dmub, unsigned int power_opt
 	cmd.psr_set_power_opt.psr_set_power_opt_data.power_opt = power_opt;
 	cmd.psr_set_power_opt.psr_set_power_opt_data.panel_inst = panel_inst;
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
@@ -422,9 +412,7 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
 		copy_settings_data->relock_delay_frame_cnt = 2;
 	copy_settings_data->dsc_slice_height = psr_context->dsc_slice_height;
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -445,9 +433,7 @@ static void dmub_psr_force_static(struct dmub_psr *dmub, uint8_t panel_inst)
 	cmd.psr_force_static.header.sub_type = DMUB_CMD__PSR_FORCE_STATIC;
 	cmd.psr_enable.header.payload_bytes = 0;
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
index 58e459c7e7d3..f976fac8dc3f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
@@ -667,7 +667,6 @@ static void program_surface_flip_and_addr(struct hubp *hubp, struct surface_flip
 static void dmcub_PLAT_54186_wa(struct hubp *hubp,
 				struct surface_flip_registers *flip_regs)
 {
-	struct dc_dmub_srv *dmcub = hubp->ctx->dmub_srv;
 	struct dcn21_hubp *hubp21 = TO_DCN21_HUBP(hubp);
 	union dmub_rb_cmd cmd;
 
@@ -690,11 +689,7 @@ static void dmcub_PLAT_54186_wa(struct hubp *hubp,
 	cmd.PLAT_54186_wa.flip.flip_params.vmid = flip_regs->vmid;
 
 	PERF_TRACE();  // TODO: remove after performance is stable.
-	dc_dmub_srv_cmd_queue(dmcub, &cmd);
-	PERF_TRACE();  // TODO: remove after performance is stable.
-	dc_dmub_srv_cmd_execute(dmcub);
-	PERF_TRACE();  // TODO: remove after performance is stable.
-	dc_dmub_srv_wait_idle(dmcub);
+	dm_execute_dmub_cmd(hubp->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 	PERF_TRACE();  // TODO: remove after performance is stable.
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
index 1c6477d73c8e..55a464a39529 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
@@ -152,9 +152,7 @@ static bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst, uint32_t optio
 	cmd.abm_set_pipe.abm_set_pipe_data.ramping_boundary = ramping_boundary;
 	cmd.abm_set_pipe.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pipe_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -173,9 +171,7 @@ static void dmub_abm_set_backlight(struct dc_context *dc, uint32_t backlight_pwm
 	cmd.abm_set_backlight.abm_set_backlight_data.panel_mask = (0x01 << panel_inst);
 	cmd.abm_set_backlight.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_backlight_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->dmub_srv);
+	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dcn21_set_abm_immediate_disable(struct pipe_ctx *pipe_ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 8263a07f265f..3303c9aae068 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -632,7 +632,7 @@ void dcn30_init_hw(struct dc *dc)
 		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
 
 	// Get DMCUB capabilities
-	dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv->dmub);
+	dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv);
 	dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
 	dc->caps.dmub_caps.mclk_sw = dc->ctx->dmub_srv->dmub->feature_caps.fw_assisted_mclk_switch;
 }
@@ -736,8 +736,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				cmd.mall.header.sub_type = DMUB_CMD__MALL_ACTION_NO_DF_REQ;
 				cmd.mall.header.payload_bytes = sizeof(cmd.mall) - sizeof(cmd.mall.header);
 
-				dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-				dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+				dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 				return true;
 			}
@@ -859,9 +858,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 					cmd.mall.cursor_height = cursor_attr.height;
 					cmd.mall.cursor_pitch = cursor_attr.pitch;
 
-					dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-					dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-					dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+					dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 					/* Use copied cursor, and it's okay to not switch back */
 					cursor_attr.address.quad_part = cmd.mall.cursor_copy_dst.quad_part;
@@ -877,8 +874,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				cmd.mall.tmr_scale = tmr_scale;
 				cmd.mall.debug_bits = dc->debug.mall_error_as_fatal;
 
-				dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-				dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+				dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 				return true;
 			}
@@ -895,9 +891,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 	cmd.mall.header.payload_bytes =
 		sizeof(cmd.mall) - sizeof(cmd.mall.header);
 
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
index 745a5d187a98..bd62502380d8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
@@ -117,7 +117,6 @@ static bool query_dp_alt_from_dmub(struct link_encoder *enc,
 				   union dmub_rb_cmd *cmd)
 {
 	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
-	struct dc_dmub_srv *dc_dmub_srv = enc->ctx->dmub_srv;
 
 	memset(cmd, 0, sizeof(*cmd));
 	cmd->query_dp_alt.header.type = DMUB_CMD__VBIOS;
@@ -126,7 +125,7 @@ static bool query_dp_alt_from_dmub(struct link_encoder *enc,
 	cmd->query_dp_alt.header.payload_bytes = sizeof(cmd->query_dp_alt.data);
 	cmd->query_dp_alt.data.phy_id = phy_id_from_transmitter(enc10->base.transmitter);
 
-	if (!dc_dmub_srv_cmd_with_reply_data(dc_dmub_srv, cmd))
+	if (!dm_execute_dmub_cmd(enc->ctx, cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY))
 		return false;
 
 	return true;
@@ -425,7 +424,6 @@ static bool link_dpia_control(struct dc_context *dc_ctx,
 	struct dmub_cmd_dig_dpia_control_data *dpia_control)
 {
 	union dmub_rb_cmd cmd;
-	struct dc_dmub_srv *dmub = dc_ctx->dmub_srv;
 
 	memset(&cmd, 0, sizeof(cmd));
 
@@ -438,9 +436,7 @@ static bool link_dpia_control(struct dc_context *dc_ctx,
 
 	cmd.dig1_dpia_control.dpia_control = *dpia_control;
 
-	dc_dmub_srv_cmd_queue(dmub, &cmd);
-	dc_dmub_srv_cmd_execute(dmub);
-	dc_dmub_srv_wait_idle(dmub);
+	dm_execute_dmub_cmd(dc_ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
index 62ce36c75c4d..e0c74868d2ee 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
@@ -297,7 +297,7 @@ void dcn31_init_hw(struct dc *dc)
 #endif
 
 	// Get DMCUB capabilities
-	dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv->dmub);
+	dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv);
 	dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
 }
 
@@ -442,9 +442,7 @@ void dcn31_z10_save_init(struct dc *dc)
 	cmd.dcn_restore.header.type = DMUB_CMD__IDLE_OPT;
 	cmd.dcn_restore.header.sub_type = DMUB_CMD__IDLE_OPT_DCN_SAVE_INIT;
 
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dcn31_z10_restore(const struct dc *dc)
@@ -462,9 +460,7 @@ void dcn31_z10_restore(const struct dc *dc)
 	cmd.dcn_restore.header.type = DMUB_CMD__IDLE_OPT;
 	cmd.dcn_restore.header.sub_type = DMUB_CMD__IDLE_OPT_DCN_RESTORE;
 
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dcn31_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
index 11ea9d13e312..217acd4e292a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
@@ -52,7 +52,7 @@ static bool dcn31_query_backlight_info(struct panel_cntl *panel_cntl, union dmub
 	cmd->panel_cntl.header.payload_bytes = sizeof(cmd->panel_cntl.data);
 	cmd->panel_cntl.data.inst = dcn31_panel_cntl->base.inst;
 
-	return dc_dmub_srv_cmd_with_reply_data(dc_dmub_srv, cmd);
+	return dm_execute_dmub_cmd(dc_dmub_srv->ctx, cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY);
 }
 
 static uint32_t dcn31_get_16_bit_backlight_from_pwm(struct panel_cntl *panel_cntl)
@@ -85,7 +85,7 @@ static uint32_t dcn31_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
 		panel_cntl->stored_backlight_registers.LVTMA_PWRSEQ_REF_DIV_BL_PWM_REF_DIV;
 	cmd.panel_cntl.data.bl_pwm_ref_div2 =
 		panel_cntl->stored_backlight_registers.PANEL_PWRSEQ_REF_DIV2;
-	if (!dc_dmub_srv_cmd_with_reply_data(dc_dmub_srv, &cmd))
+	if (!dm_execute_dmub_cmd(dc_dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY))
 		return 0;
 
 	panel_cntl->stored_backlight_registers.BL_PWM_CNTL = cmd.panel_cntl.data.bl_pwm_cntl;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
index 40c488b26901..6fb3f64e3057 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
@@ -417,9 +417,7 @@ void dcn314_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool
 	cmd.domain_control.data.inst = hubp_inst;
 	cmd.domain_control.data.power_gate = !power_on;
 
-	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(ctx->dmub_srv);
+	dm_execute_dmub_cmd(ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	PERF_TRACE();
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index 26791e3d162f..9ce11ed769a0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -274,8 +274,7 @@ bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				cmd.cab.header.sub_type = DMUB_CMD__CAB_NO_DCN_REQ;
 				cmd.cab.header.payload_bytes = sizeof(cmd.cab) - sizeof(cmd.cab.header);
 
-				dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-				dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+				dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 				return true;
 			}
@@ -309,8 +308,7 @@ bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				cmd.cab.header.payload_bytes = sizeof(cmd.cab) - sizeof(cmd.cab.header);
 				cmd.cab.cab_alloc_ways = ways;
 
-				dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-				dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+				dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 				return true;
 			}
@@ -326,9 +324,7 @@ bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable)
 	cmd.cab.header.payload_bytes =
 			sizeof(cmd.cab) - sizeof(cmd.cab.header);
 
-	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -946,7 +942,7 @@ void dcn32_init_hw(struct dc *dc)
 
 	// Get DMCUB capabilities
 	if (dc->ctx->dmub_srv) {
-		dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv->dmub);
+		dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv);
 		dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
 		dc->caps.dmub_caps.mclk_sw = dc->ctx->dmub_srv->dmub->feature_caps.fw_assisted_mclk_switch;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dm_services.h b/drivers/gpu/drm/amd/display/dc/dm_services.h
index 9a3f2a44f882..d33d595405a9 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_services.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_services.h
@@ -40,6 +40,7 @@
 
 struct dmub_srv;
 struct dc_dmub_srv;
+union dmub_rb_cmd;
 
 irq_handler_idx dm_register_interrupt(
 	struct dc_context *ctx,
@@ -273,6 +274,12 @@ void dm_perf_trace_timestamp(const char *func_name, unsigned int line, struct dc
 #define PERF_TRACE()	dm_perf_trace_timestamp(__func__, __LINE__, CTX)
 #define PERF_TRACE_CTX(__CTX)	dm_perf_trace_timestamp(__func__, __LINE__, __CTX)
 
+/*
+ * DMUB Interfaces
+ */
+bool dm_execute_dmub_cmd(const struct dc_context *ctx, union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type);
+bool dm_execute_dmub_cmd_list(const struct dc_context *ctx, unsigned int count, union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type);
+
 /*
  * Debug and verification hooks
  */
diff --git a/drivers/gpu/drm/amd/display/dc/dm_services_types.h b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
index b52ba6ffabe1..facf269c4326 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_services_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
@@ -269,4 +269,10 @@ struct dtn_min_clk_info {
 	uint32_t min_memory_clock_khz;
 };
 
+enum dm_dmub_wait_type {
+	DM_DMUB_WAIT_TYPE_NO_WAIT,
+	DM_DMUB_WAIT_TYPE_WAIT,
+	DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY,
+};
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index c840ef17802e..eeaceed61bc4 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1393,7 +1393,7 @@ static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
 	cmd.cable_id.header.payload_bytes = sizeof(cmd.cable_id.data);
 	cmd.cable_id.data.input.phy_inst = resource_transmitter_to_phy_idx(
 			link->dc, link->link_enc->transmitter);
-	if (dc_dmub_srv_cmd_with_reply_data(link->ctx->dmub_srv, &cmd) &&
+	if (dm_execute_dmub_cmd(link->dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
 			cmd.cable_id.header.ret_status == 1) {
 		cable_id->raw = cmd.cable_id.data.output_raw;
 		DC_LOG_DC("usbc_cable_id = %d.\n", cable_id->raw);
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
index 4626fabc0a96..0bb749133909 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
@@ -90,7 +90,7 @@ bool dpia_query_hpd_status(struct dc_link *link)
 	cmd.query_hpd.data.ch_type = AUX_CHANNEL_DPIA;
 
 	/* Return HPD status reported by DMUB if query successfully executed. */
-	if (dc_dmub_srv_cmd_with_reply_data(dmub_srv, &cmd) && cmd.query_hpd.data.status == AUX_RET_SUCCESS)
+	if (dm_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) && cmd.query_hpd.data.status == AUX_RET_SUCCESS)
 		is_hpd_high = cmd.query_hpd.data.result;
 
 	DC_LOG_DEBUG("%s: link(%d) dpia(%d) cmd_status(%d) result(%d)\n",
-- 
2.34.1


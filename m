Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F9A5622C3
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Jun 2022 21:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1074912A721;
	Thu, 30 Jun 2022 19:14:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8DD12A671
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Jun 2022 19:14:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zn1OVmN5hxt/G+J74QOi0l3PwE2hadv5XAyeao3W6Jb9PATw9BM15J+g/S+XQdZ8M23p0mhggQoxWR7CfU3B0gi5RWIsI/cCHLg9EwiNxsyThhSNMuHFKGb13XVNbTuKmEA/b+NqR3VOllomvZMOYwrjMqqsOdT7j+T9xNPVKHmj6pQ2CY+6hN0tPJJol+bQJc1pr5t9D60BNX0pY1FksrIGxGEyjbbWN9FURZ6MEjKsP+GgJ9DFR0BSY8AGh6rd34QjbRtp2deto3vATPBNteG1wVZAOA6Gyz51F0CP6ViBuNSiU1aqViDzJZHCV2vVHD9zhKukg7BCBk56NSdT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pja/TykxTAMH9rJueDklEZuJLmbnx8Sw1gIcS/e7mxg=;
 b=EwjlUTTaB//7AuMcR2ezd84u+3QddP4PainaKCbURpamaFAxL7sv8QH6nzxWFtlSjva8G2DxLafPc2SMcdkeeqB2xHaeXStczSYlHAaBQNt2ZujZPvhOfYKcEojNmw27PzxEWbakpo5BCIpRiBpLwt8lciY9i9CRIlugndgtrZ11/x3/sBLgZnBJBCFupqoGzExaoHJfiVikYqdKBEDMKHumnMEZgRcxlpytSO7LIFrGCSuOd21s16QdHnpqZEtYmtxtOZzNlgVmL03yiA+JC+Dim28K/DyUqqbFDs7gCT5cI2eromBAS09AfJ+ZfXp8t8qbIdd0vMmh5ZnZPJWDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pja/TykxTAMH9rJueDklEZuJLmbnx8Sw1gIcS/e7mxg=;
 b=Y5im5YHwTXq2E7tdYp1gf2NgN+TAXEYFUyXlvqsDKp4CUQJNCURsmb9lQ9vDYFrXkZoUmU5KhEdDvp9E/JpTxkANRKUcDwQ/rqUy+J7uyQjsxWJFafGRMt4M0U2HK6ZT5EAh55w3h2xJ2ItvOQuPbgd5K1ptDIj8jh/VdfmTMgQ=
Received: from BN9PR03CA0520.namprd03.prod.outlook.com (2603:10b6:408:131::15)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 19:14:00 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::d3) by BN9PR03CA0520.outlook.office365.com
 (2603:10b6:408:131::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 30 Jun 2022 19:14:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 19:14:00 +0000
Received: from atma2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 14:13:59 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/40] drm/amd/display: Add basic infrastructure for enabling
 FAMS
Date: Thu, 30 Jun 2022 15:12:53 -0400
Message-ID: <20220630191322.909650-12-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
References: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8435f483-4275-4a54-b31d-08da5accb079
X-MS-TrafficTypeDiagnostic: CH2PR12MB4167:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tgXvr66OPRrP6UwwsSMkCWOsuiaT9k3vI0XW8tJhrQCYwmvHIFvmcNHEhAn99c4RYZupANqkvvmi1zwD2UIQJauFadwQekkjr/Lnzy1wPx14VDYJFbbELECuektBXz6MLGH5TGL4/icYCgBflyVMdHxn/Vm6dbvWDMXzS3b19R8udxcVL9lhawT7cBwf44vnirxLapaAlCPcfzW6mV4i+6usTNAaA/0JlCTixkSopxGnG/VnIpMqWFDOEb7fL0B9TfRCZSNqyy5771yb/cAmWHco6BNWAs1sJmpUscGqteFuYRDyUIYdVdDn7CpV+cjbtLtRDAyEt30G5f0hZnwdVN9GSC1eJnjtmvTK92tMkChoeMZWb13yGA5dxGqHvjNu1i9S3F10mQb/f8fJTeFYrI2x2K3caqf1pKTlGKk4HuGsysdq8PsOkZ5gbEZ0mrG0XUplCvuY4yhj2Kkf2rat32jTXDyMjhA0XbGBS+tHOH9dIu7QZdR2jJThw8xC1W+JQxFD9e00gB7ZMgWHaZzk3Amsmu+pEszxEcpsgovYq/+MJ00MpUAVAtUSbExRgHg/nbclG7dd5rDPfphFjmJ5P5WzDhm8VWMpucuQSqwV2z2xJKrJJsl08LTQQiiL6RXwQvycUiZRMEzwfPxvkUBl/QWDr9yF/406xM4UqTG/IhtmKeHOEITsG7FBtTqtKVXvVE16Li41hT7MhMpinD2AnM6f1ohJXrgfhBH+QRU87R9yT0mHjg5DQjkETxokVSNKPHbkvzdrr/U3wgqjyFU85JvPGodGalPAKnEgm2FoKs+93ZC0tFLGd0h7I8TILQ2pNCQCDq2Z0mt2Vyv6mx645Eyhw85spkc72HOfiMrmSuY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(40470700004)(46966006)(36840700001)(81166007)(478600001)(26005)(5660300002)(30864003)(40480700001)(36756003)(8936002)(6666004)(2906002)(83380400001)(70586007)(7696005)(82310400005)(47076005)(36860700001)(86362001)(336012)(70206006)(4326008)(8676002)(40460700003)(316002)(356005)(82740400003)(2616005)(6916009)(54906003)(41300700001)(16526019)(186003)(426003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 19:14:00.6315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8435f483-4275-4a54-b31d-08da5accb079
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
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
 solomon.chiu@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 hamza.mahfooz@amd.com, wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

We want to enable Firmware Assisted Memory (FAMS) Switching, but first,
we need to add the required code infrastructure in DC before allowing it
in amdgpu_dm.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   8 +
 drivers/gpu/drm/amd/display/dc/dc.h           |  10 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  87 +++++++++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h  |   4 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   2 +
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  22 ++-
 .../drm/amd/display/dc/dcn30/dcn30_resource.c | 170 ++++++++++++++++++
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |   6 +
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  |   2 +
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   |  25 ++-
 10 files changed, 328 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index fcb503b6a1a2..db02f071c949 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3842,10 +3842,18 @@ bool dc_is_plane_eligible_for_idle_optimizations(struct dc *dc, struct dc_plane_
 /* cleanup on driver unload */
 void dc_hardware_release(struct dc *dc)
 {
+	dc_mclk_switch_using_fw_based_vblank_stretch_shut_down(dc);
+
 	if (dc->hwss.hardware_release)
 		dc->hwss.hardware_release(dc);
 }
 
+void dc_mclk_switch_using_fw_based_vblank_stretch_shut_down(struct dc *dc)
+{
+	if (dc->current_state)
+		dc->current_state->bw_ctx.bw.dcn.clk.fw_based_mclk_switching_shut_down = true;
+}
+
 /*
  *****************************************************************************
  * Function: dc_is_dmub_outbox_supported -
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 629cd76b97c2..6674edf69b87 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -163,7 +163,8 @@ struct dc_color_caps {
 };
 
 struct dc_dmub_caps {
-    bool psr;
+	bool psr;
+	bool mclk_sw;
 };
 
 struct dc_caps {
@@ -359,6 +360,8 @@ enum visual_confirm {
 	VISUAL_CONFIRM_HDR = 2,
 	VISUAL_CONFIRM_MPCTREE = 4,
 	VISUAL_CONFIRM_PSR = 5,
+	VISUAL_CONFIRM_SWAPCHAIN = 6,
+	VISUAL_CONFIRM_FAMS = 7,
 	VISUAL_CONFIRM_SWIZZLE = 9,
 };
 
@@ -441,6 +444,7 @@ struct dc_clocks {
 	bool fclk_prev_p_state_change_support;
 	int num_ways;
 	bool fw_based_mclk_switching;
+	bool fw_based_mclk_switching_shut_down;
 	int prev_num_ways;
 	enum dtm_pstate dtm_level;
 	int max_supported_dppclk_khz;
@@ -726,6 +730,7 @@ struct dc_debug_options {
 
 	/* Enable dmub aux for legacy ddc */
 	bool enable_dmub_aux_for_legacy_ddc;
+	bool disable_fams;
 	bool optimize_edp_link_rate; /* eDP ILR */
 	/* FEC/PSR1 sequence enable delay in 100us */
 	uint8_t fec_enable_delay_in100us;
@@ -1452,6 +1457,9 @@ void dc_enable_dcmode_clk_limit(struct dc *dc, bool enable);
 /* cleanup on driver unload */
 void dc_hardware_release(struct dc *dc);
 
+/* disables fw based mclk switch */
+void dc_mclk_switch_using_fw_based_vblank_stretch_shut_down(struct dc *dc);
+
 bool dc_set_psr_allow_active(struct dc *dc, bool enable);
 void dc_z10_restore(const struct dc *dc);
 void dc_z10_save_init(struct dc *dc);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index ae63159e5d86..6a25d64dd15c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -252,6 +252,93 @@ void dc_dmub_trace_event_control(struct dc *dc, bool enable)
 	dm_helpers_dmub_outbox_interrupt_control(dc->ctx, enable);
 }
 
+void dc_dmub_srv_drr_update_cmd(struct dc *dc, uint32_t tg_inst, uint32_t vtotal_min, uint32_t vtotal_max)
+{
+	union dmub_rb_cmd cmd = { 0 };
+
+	cmd.drr_update.header.type = DMUB_CMD__FW_ASSISTED_MCLK_SWITCH;
+	cmd.drr_update.header.sub_type = DMUB_CMD__FAMS_DRR_UPDATE;
+	cmd.drr_update.dmub_optc_state_req.v_total_max = vtotal_max;
+	cmd.drr_update.dmub_optc_state_req.v_total_min = vtotal_min;
+	cmd.drr_update.dmub_optc_state_req.tg_inst = tg_inst;
+
+	cmd.drr_update.header.payload_bytes = sizeof(cmd.drr_update) - sizeof(cmd.drr_update.header);
+
+	// Send the command to the DMCUB.
+	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+}
+
+uint8_t dc_dmub_srv_get_pipes_for_stream(struct dc *dc, struct dc_stream_state *stream)
+{
+	uint8_t pipes = 0;
+	int i = 0;
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		if (pipe->stream == stream && pipe->stream_res.tg)
+			pipes = i;
+	}
+	return pipes;
+}
+
+int dc_dmub_srv_get_timing_generator_offset(struct dc *dc, struct dc_stream_state *stream)
+{
+	int  tg_inst = 0;
+	int i = 0;
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		if (pipe->stream == stream && pipe->stream_res.tg) {
+			tg_inst = pipe->stream_res.tg->inst;
+			break;
+		}
+	}
+	return tg_inst;
+}
+
+bool dc_dmub_srv_p_state_delegate(struct dc *dc, bool should_manage_pstate, struct dc_state *context)
+{
+	union dmub_rb_cmd cmd = { 0 };
+	struct dmub_cmd_fw_assisted_mclk_switch_config *config_data = &cmd.fw_assisted_mclk_switch.config_data;
+	int i = 0;
+	int ramp_up_num_steps = 1; // TODO: Ramp is currently disabled. Reenable it.
+	uint8_t visual_confirm_enabled = dc->debug.visual_confirm == VISUAL_CONFIRM_FAMS;
+
+	if (dc == NULL)
+		return false;
+
+	// Format command.
+	cmd.fw_assisted_mclk_switch.header.type = DMUB_CMD__FW_ASSISTED_MCLK_SWITCH;
+	cmd.fw_assisted_mclk_switch.header.sub_type = DMUB_CMD__FAMS_SETUP_FW_CTRL;
+	cmd.fw_assisted_mclk_switch.config_data.fams_enabled = should_manage_pstate;
+	cmd.fw_assisted_mclk_switch.config_data.visual_confirm_enabled = visual_confirm_enabled;
+
+	for (i = 0; context && i < context->stream_count; i++) {
+		struct dc_stream_state *stream = context->streams[i];
+		uint8_t min_refresh_in_hz = (stream->timing.min_refresh_in_uhz + 999999) / 1000000;
+		int  tg_inst = dc_dmub_srv_get_timing_generator_offset(dc, stream);
+
+		config_data->pipe_data[tg_inst].pix_clk_100hz = stream->timing.pix_clk_100hz;
+		config_data->pipe_data[tg_inst].min_refresh_in_hz = min_refresh_in_hz;
+		config_data->pipe_data[tg_inst].max_ramp_step = ramp_up_num_steps;
+		config_data->pipe_data[tg_inst].pipes = dc_dmub_srv_get_pipes_for_stream(dc, stream);
+	}
+
+	cmd.fw_assisted_mclk_switch.header.payload_bytes =
+		sizeof(cmd.fw_assisted_mclk_switch) - sizeof(cmd.fw_assisted_mclk_switch.header);
+
+	// Send the command to the DMCUB.
+	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+
+	return true;
+}
+
 void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub)
 {
 	union dmub_rb_cmd cmd = { 0 };
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
index 52758ff1e405..1d124a2695d5 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
@@ -72,6 +72,10 @@ bool dc_dmub_srv_get_dmub_outbox0_msg(const struct dc *dc, struct dmcub_trace_bu
 
 void dc_dmub_trace_event_control(struct dc *dc, bool enable);
 
+void dc_dmub_srv_drr_update_cmd(struct dc *dc, uint32_t tg_inst, uint32_t vtotal_min, uint32_t vtotal_max);
+
+bool dc_dmub_srv_p_state_delegate(struct dc *dc, bool enable_pstate, struct dc_state *context);
+
 void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub);
 void dc_dmub_srv_clear_inbox0_ack(struct dc_dmub_srv *dmub_srv);
 void dc_dmub_srv_wait_for_inbox0_ack(struct dc_dmub_srv *dmub_srv);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index fa735d5f730f..413738fe9d59 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -196,6 +196,8 @@ struct dc_panel_patch {
 	unsigned int disable_fec;
 	unsigned int extra_t3_ms;
 	unsigned int max_dsc_target_bpp_limit;
+	unsigned int embedded_tiled_slave;
+	unsigned int disable_fams;
 	unsigned int skip_avmute;
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 08b8893ff145..fb59fed8f425 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -641,6 +641,7 @@ void dcn30_init_hw(struct dc *dc)
 	// Get DMCUB capabilities
 	dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv->dmub);
 	dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
+	dc->caps.dmub_caps.mclk_sw = dc->ctx->dmub_srv->dmub->feature_caps.fw_assisted_mclk_switch;
 }
 
 void dcn30_set_avmute(struct pipe_ctx *pipe_ctx, bool enable)
@@ -938,11 +939,17 @@ bool dcn30_does_plane_fit_in_mall(struct dc *dc, struct dc_plane_state *plane, s
 
 void dcn30_hardware_release(struct dc *dc)
 {
-	/* if pstate unsupported, force it supported */
-	if (!dc->clk_mgr->clks.p_state_change_support &&
-			dc->res_pool->hubbub->funcs->force_pstate_change_control)
-		dc->res_pool->hubbub->funcs->force_pstate_change_control(
-				dc->res_pool->hubbub, true, true);
+	dc_dmub_srv_p_state_delegate(dc, false, NULL);
+
+	/* If pstate unsupported, or still supported
+	 * by firmware, force it supported by dcn
+	 */
+	if (dc->current_state)
+		if ((!dc->clk_mgr->clks.p_state_change_support ||
+				dc->current_state->bw_ctx.bw.dcn.clk.fw_based_mclk_switching) &&
+				dc->res_pool->hubbub->funcs->force_pstate_change_control)
+			dc->res_pool->hubbub->funcs->force_pstate_change_control(
+					dc->res_pool->hubbub, true, true);
 }
 
 void dcn30_set_disp_pattern_generator(const struct dc *dc,
@@ -965,6 +972,9 @@ void dcn30_prepare_bandwidth(struct dc *dc,
 				context->bw_ctx.bw.dcn.clk.dramclk_khz > dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000)
 			dc->clk_mgr->funcs->set_max_memclk(dc->clk_mgr, dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz);
 
- 	dcn20_prepare_bandwidth(dc, context);
+	dcn20_prepare_bandwidth(dc, context);
+
+	dc_dmub_srv_p_state_delegate(dc,
+		context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching, context);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index 4cf9a6cff46e..b74d5f3f0472 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -1899,6 +1899,176 @@ noinline bool dcn30_internal_validate_bw(
 	return out;
 }
 
+int get_refresh_rate(struct dc_state *context)
+{
+	int refresh_rate = 0;
+	int h_v_total = 0;
+	struct dc_crtc_timing *timing = NULL;
+
+	if (context == NULL || context->streams[0] == NULL)
+		return 0;
+
+	/* check if refresh rate at least 120hz */
+	timing = &context->streams[0]->timing;
+	if (timing == NULL)
+		return 0;
+
+	h_v_total = timing->h_total * timing->v_total;
+	if (h_v_total == 0)
+		return 0;
+
+	refresh_rate = ((timing->pix_clk_100hz * 100) / (h_v_total)) + 1;
+	return refresh_rate;
+}
+
+#define MAX_STRETCHED_V_BLANK 500 // in micro-seconds
+/*
+ * Scaling factor for v_blank stretch calculations considering timing in
+ * micro-seconds and pixel clock in 100hz.
+ * Note: the parenthesis are necessary to ensure the correct order of
+ * operation where V_SCALE is used.
+ */
+#define V_SCALE (10000 / MAX_STRETCHED_V_BLANK)
+
+int get_frame_rate_at_max_stretch_100hz(struct dc_state *context)
+{
+	struct dc_crtc_timing *timing = NULL;
+	uint32_t sec_per_100_lines;
+	uint32_t max_v_blank;
+	uint32_t curr_v_blank;
+	uint32_t v_stretch_max;
+	uint32_t stretched_frame_pix_cnt;
+	uint32_t scaled_stretched_frame_pix_cnt;
+	uint32_t scaled_refresh_rate;
+
+	if (context == NULL || context->streams[0] == NULL)
+		return 0;
+
+	/* check if refresh rate at least 120hz */
+	timing = &context->streams[0]->timing;
+	if (timing == NULL)
+		return 0;
+
+	sec_per_100_lines = timing->pix_clk_100hz / timing->h_total + 1;
+	max_v_blank = sec_per_100_lines / V_SCALE + 1;
+	curr_v_blank = timing->v_total - timing->v_addressable;
+	v_stretch_max = (max_v_blank > curr_v_blank) ? (max_v_blank - curr_v_blank) : (0);
+	stretched_frame_pix_cnt = (v_stretch_max + timing->v_total) * timing->h_total;
+	scaled_stretched_frame_pix_cnt = stretched_frame_pix_cnt / 10000;
+	scaled_refresh_rate = (timing->pix_clk_100hz) / scaled_stretched_frame_pix_cnt + 1;
+
+	return scaled_refresh_rate;
+}
+
+bool is_refresh_rate_support_mclk_switch_using_fw_based_vblank_stretch(struct dc_state *context)
+{
+	int refresh_rate_max_stretch_100hz;
+	int min_refresh_100hz;
+
+	if (context == NULL || context->streams[0] == NULL)
+		return false;
+
+	refresh_rate_max_stretch_100hz = get_frame_rate_at_max_stretch_100hz(context);
+	min_refresh_100hz = context->streams[0]->timing.min_refresh_in_uhz / 10000;
+
+	if (refresh_rate_max_stretch_100hz < min_refresh_100hz)
+		return false;
+
+	return true;
+}
+
+bool dcn30_can_support_mclk_switch_using_fw_based_vblank_stretch(struct dc *dc, struct dc_state *context)
+{
+	int refresh_rate = 0;
+	const int minimum_refreshrate_supported = 120;
+
+	if (context == NULL || context->streams[0] == NULL)
+		return false;
+
+	if (context->streams[0]->sink->edid_caps.panel_patch.disable_fams)
+		return false;
+
+	if (dc->debug.disable_fams)
+		return false;
+
+	if (!dc->caps.dmub_caps.mclk_sw)
+		return false;
+
+	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching_shut_down)
+		return false;
+
+	/* more then 1 monitor connected */
+	if (context->stream_count != 1)
+		return false;
+
+	refresh_rate = get_refresh_rate(context);
+	if (refresh_rate < minimum_refreshrate_supported)
+		return false;
+
+	if (!is_refresh_rate_support_mclk_switch_using_fw_based_vblank_stretch(context))
+		return false;
+
+	// check if freesync enabled
+	if (!context->streams[0]->allow_freesync)
+		return false;
+
+	if (context->streams[0]->vrr_active_variable)
+		return false;
+
+	return true;
+}
+
+/*
+ * set up FPO watermarks, pstate, dram latency
+ */
+void dcn30_setup_mclk_switch_using_fw_based_vblank_stretch(struct dc *dc, struct dc_state *context)
+{
+	ASSERT(dc != NULL && context != NULL);
+	if (dc == NULL || context == NULL)
+		return;
+
+	/* Set wm_a.pstate so high natural MCLK switches are impossible: 4 seconds */
+	context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = 4U * 1000U * 1000U * 1000U;
+}
+
+/*
+ * Finds dummy_latency_index when MCLK switching using firmware based
+ * vblank stretch is enabled. This function will iterate through the
+ * table of dummy pstate latencies until the lowest value that allows
+ * dm_allow_self_refresh_and_mclk_switch to happen is found
+ */
+int dcn30_find_dummy_latency_index_for_fw_based_mclk_switch(struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes, int pipe_cnt, int vlevel)
+{
+	const int max_latency_table_entries = 4;
+	int dummy_latency_index = 0;
+
+	while (dummy_latency_index < max_latency_table_entries) {
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us =
+				dc->clk_mgr->bw_params->dummy_pstate_table[dummy_latency_index].dummy_pstate_latency_us;
+		dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, false);
+
+		if (context->bw_ctx.dml.soc.allow_dram_self_refresh_or_dram_clock_change_in_vblank ==
+			dm_allow_self_refresh_and_mclk_switch)
+			break;
+
+		dummy_latency_index++;
+	}
+
+	if (dummy_latency_index == max_latency_table_entries) {
+		ASSERT(dummy_latency_index != max_latency_table_entries);
+		/* If the execution gets here, it means dummy p_states are
+		 * not possible. This should never happen and would mean
+		 * something is severely wrong.
+		 * Here we reset dummy_latency_index to 3, because it is
+		 * better to have underflows than system crashes.
+		 */
+		dummy_latency_index = 3;
+	}
+
+	return dummy_latency_index;
+}
+
 void dcn30_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
 {
 	DC_FP_START();
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index e247b2270b1d..dc60b835e938 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -797,6 +797,12 @@ void dcn20_calculate_dlg_params(
 	context->bw_ctx.bw.dcn.clk.p_state_change_support =
 		context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb]
 							!= dm_dram_clock_change_unsupported;
+
+	/* Pstate change might not be supported by hardware, but it might be
+	 * possible with firmware driven vertical blank stretching.
+	 */
+	context->bw_ctx.bw.dcn.clk.p_state_change_support |= context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching;
+
 	context->bw_ctx.bw.dcn.clk.dppclk_khz = 0;
 
 	context->bw_ctx.bw.dcn.clk.dtbclk_en = is_dtbclk_required(dc, context);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
index 574676a0711a..a8db1306750e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
@@ -529,6 +529,8 @@ dc_assert_fp_enabled();
 		context->bw_ctx.dml.soc.dram_clock_change_latency_us =
 				dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
 
+	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching)
+		dcn30_setup_mclk_switch_using_fw_based_vblank_stretch(dc, context);
 }
 
 void dcn30_fpu_update_dram_channel_width_bytes(struct dc *dc)
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 4e21ff32800f..de193636d022 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -242,7 +242,8 @@ struct dmub_feature_caps {
 	 * Max PSR version supported by FW.
 	 */
 	uint8_t psr;
-	uint8_t reserved[7];
+	uint8_t fw_assisted_mclk_switch;
+	uint8_t reserved[6];
 };
 
 #if defined(__cplusplus)
@@ -2773,6 +2774,26 @@ struct dmub_rb_cmd_drr_update {
 		struct dmub_optc_state dmub_optc_state_req;
 };
 
+struct dmub_cmd_fw_assisted_mclk_switch_pipe_data {
+	uint32_t pix_clk_100hz;
+	uint8_t max_ramp_step;
+	uint8_t pipes;
+	uint8_t min_refresh_in_hz;
+	uint8_t padding[1];
+};
+
+struct dmub_cmd_fw_assisted_mclk_switch_config {
+	uint8_t fams_enabled;
+	uint8_t visual_confirm_enabled;
+	uint8_t padding[2];
+	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data pipe_data[DMUB_MAX_STREAMS];
+};
+
+struct dmub_rb_cmd_fw_assisted_mclk_switch {
+	struct dmub_cmd_header header;
+	struct dmub_cmd_fw_assisted_mclk_switch_config config_data;
+};
+
 /**
  * enum dmub_cmd_panel_cntl_type - Panel control command.
  */
@@ -3111,6 +3132,8 @@ union dmub_rb_cmd {
 	 */
 	struct dmub_rb_cmd_query_feature_caps query_feature_caps;
 	struct dmub_rb_cmd_drr_update drr_update;
+	struct dmub_rb_cmd_fw_assisted_mclk_switch fw_assisted_mclk_switch;
+
 	/**
 	 * Definition of a DMUB_CMD__VBIOS_LVTMA_CONTROL command.
 	 */
-- 
2.25.1


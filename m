Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457A9844885
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jan 2024 21:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C945010FC12;
	Wed, 31 Jan 2024 20:14:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B73D10FC12
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jan 2024 20:14:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHj+8ECfkjES+ZzAf/0RpwthiV3wn/9hZjfMFBYxRgAaLt3GXbDyH6SfcJEKld63/EUO/o8yRL5NKt+6v/hEBekGDcrN+Rtw9a1plUKsYh6ufZERuaqQQbxjWGOwfxQvBXAV/vOMNImQV7OZii0cQ8CjwjkL9giOYz8MPawUBYnFf0R6eP+fuXSafn15jiwHL0eUvQAPlWNzYU8+ZTPmXghgCtROEsMGGvhVHtLzkTpZZbrZq7mNZnLI11EigSaCbp3zaYBbCtbIboy1kKR1TlcLv23YGVdDTC+XhAzT64Ue9A7EHSB4An5xLijBtA9d2XEZc3T7JoliDqFFmPmABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT/XL6eREQ5HrGPIcO6iwTx3Fes9KOLNbpS1gbjYjpQ=;
 b=TYzfLMtJvQOWFqHVTrcuyP5x55sg+Q3vD92bU+xUOT/cQY9ezvwG3uyM4bm6JBRh118ipTcGa3v75dJXkhRZjdOP8xw44nV4q1LVYITbpyjnf2bXrYRyu8eWlslSUmP5HoY5n+80eZ+mORK9e+lKLBFByNVPfRFlYwOROLa6kjmCpquvEHBNKCqiKVlLkyNoPWo8myhuDwAN4b7DXU2iAjAbHu2+DduzN9szE2ZCDW9gn+RxUE1K1Pec4eTsdvmgyDl8kAQE80wLFSWGXMRrBdmY2sJNHlRt/ODxQvMJKeEQiVFm/JvQkITmOqoCKB5AlodhG8bc4mbOhyUK8nBQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT/XL6eREQ5HrGPIcO6iwTx3Fes9KOLNbpS1gbjYjpQ=;
 b=GB98pkjWTpaSNDAUAUfJWq7wv0BxnQiYRHbkmm8KSKTyErgvNxfzcaUlnDVxrt6YZ3CTgnQ5FLB4hDk8tcfYuW3lCqt/kqOvn374O+8cE2jqoKSoaeCBcSg2wUP+Bz8gTL5DYfJMKehcABw80yesA186XD5Rd9D5Z/JCrT7hJc0=
Received: from SN7PR18CA0016.namprd18.prod.outlook.com (2603:10b6:806:f3::20)
 by CY5PR12MB6551.namprd12.prod.outlook.com (2603:10b6:930:41::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 20:14:20 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::33) by SN7PR18CA0016.outlook.office365.com
 (2603:10b6:806:f3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Wed, 31 Jan 2024 20:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 20:14:19 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 14:12:41 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/21] drm/amd/display: Add more checks for exiting idle in DC
Date: Wed, 31 Jan 2024 15:11:11 -0500
Message-ID: <20240131201220.19106-6-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131201220.19106-1-hamza.mahfooz@amd.com>
References: <20240131201220.19106-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|CY5PR12MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad4cd90-a373-4485-1c82-08dc2299355a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1U0aSMW+dTzx+1t0Dpgh49+yY2rSkv8XBErqnXLuJMzS2kOSKjCNICwGHZroIVSVdkU81h5hfgzfaxy9TeNXRkrlQud9SDxGylbN8vLHvb5miPGb4qwX7Vn6N9GP17KUSXh0BCV3URUmBDZy68DKVIrp4ex9lO4dMxT6NYxRVjmjzLnnZtWq+Rl1mFpGDT9EmugyBlfrN95cX1L1dsfw0V8oEzzmjN3YfgBXPX/21fiICIkLSZ+oMzSQtOnrqBJzZ0cMmMo6SaApcp5OZwsjGqQ+TlE/cQBoTQwYAzE6dpryOPU8apbytTfUiGTKFznK9ddJ6U1T3QVTSnAKAXfm9UeTazyVH2N2aomx6TOHpoHclP3yLK6GnxV3z9tdzh9a17anAYMe0GHRT9ae0uuo6/wdQUcNTQ1/QecPZipAQNJqyd6+yFX1TMxkM6RJawe/GZmiKJtQ2VWMshKTy5KtmDVnO63xUkULY0yjaGtzBtTPX5pMQWlQmSXkZUSmXCDFtxzG7rCXSnNbOE6W8OdSmxwoKZGI2UsTCFJRp1laQPKAVCxw/a6yEKku+PZiff77J+sC0scL34T8nWou4Iqw7wSASNUvAN1VnE11VncomxYl8HFRgZGFDFJwRxuv0w2iTgEgh+FlKvWlbywVWABwfh0sTSu/WMhm+GsXY49CClVUtEXLeafaFa9Wm+eVJw2/anbqni7zeK7bVvjzQ1xFabVLG9q40hiqBemZMyejny1JWji95flZas8jDliaYhgNZSayvwY3O+HasD14bEH4jpxer6Eq23JVN7Ese4PdJeLxygTu26ads5iFe4+HVB9p
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(83380400001)(41300700001)(82740400003)(36756003)(86362001)(70206006)(356005)(81166007)(36860700001)(1076003)(2616005)(26005)(47076005)(336012)(16526019)(426003)(316002)(6916009)(2906002)(70586007)(54906003)(6666004)(478600001)(44832011)(4326008)(8676002)(8936002)(5660300002)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 20:14:19.9268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad4cd90-a373-4485-1c82-08dc2299355a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6551
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
Cc: chiahsuan.chung@amd.com, Sunpeng.Li@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, stable@vger.kernel.org, jerry.zuo@amd.com,
 Aurabindo.Pillai@amd.com, hersenxs.wu@amd.com,
 Ovidiu Bunea <ovidiu.bunea@amd.com>, wayne.lin@amd.com, Harry.Wentland@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, agustin.gutierrez@amd.com,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[Why]
Any interface that touches registers needs to wake up the system.

[How]
Add a new interface dc_exit_ips_for_hw_access that wraps the check
for IPS support and insert it into the public DC interfaces that
touch registers.

We don't re-enter, since we expect that the enter/exit to have been done
on the DM side.

Cc: stable@vger.kernel.org # 6.1+
Reviewed-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 42 +++++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_stream.c   | 18 ++++++++
 .../gpu/drm/amd/display/dc/core/dc_surface.c  |  2 +
 drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
 4 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 2db361aeaf25..eb803d4d3478 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -417,6 +417,8 @@ bool dc_stream_adjust_vmin_vmax(struct dc *dc,
 	if (!memcmp(&stream->adjust, adjust, sizeof(*adjust)))
 		return true;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	stream->adjust.v_total_max = adjust->v_total_max;
 	stream->adjust.v_total_mid = adjust->v_total_mid;
 	stream->adjust.v_total_mid_frame_num = adjust->v_total_mid_frame_num;
@@ -457,6 +459,8 @@ bool dc_stream_get_last_used_drr_vtotal(struct dc *dc,
 
 	int i = 0;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 
@@ -487,6 +491,8 @@ bool dc_stream_get_crtc_position(struct dc *dc,
 	bool ret = false;
 	struct crtc_position position;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct pipe_ctx *pipe =
 				&dc->current_state->res_ctx.pipe_ctx[i];
@@ -606,6 +612,8 @@ bool dc_stream_configure_crc(struct dc *dc, struct dc_stream_state *stream,
 	if (pipe == NULL)
 		return false;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	/* By default, capture the full frame */
 	param.windowa_x_start = 0;
 	param.windowa_y_start = 0;
@@ -665,6 +673,8 @@ bool dc_stream_get_crc(struct dc *dc, struct dc_stream_state *stream,
 	struct pipe_ctx *pipe;
 	struct timing_generator *tg;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 		if (pipe->stream == stream)
@@ -689,6 +699,8 @@ void dc_stream_set_dyn_expansion(struct dc *dc, struct dc_stream_state *stream,
 	int i;
 	struct pipe_ctx *pipe_ctx;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		if (dc->current_state->res_ctx.pipe_ctx[i].stream
 				== stream) {
@@ -724,6 +736,8 @@ void dc_stream_set_dither_option(struct dc_stream_state *stream,
 	if (option > DITHER_OPTION_MAX)
 		return;
 
+	dc_exit_ips_for_hw_access(stream->ctx->dc);
+
 	stream->dither_option = option;
 
 	memset(&params, 0, sizeof(params));
@@ -748,6 +762,8 @@ bool dc_stream_set_gamut_remap(struct dc *dc, const struct dc_stream_state *stre
 	bool ret = false;
 	struct pipe_ctx *pipes;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		if (dc->current_state->res_ctx.pipe_ctx[i].stream == stream) {
 			pipes = &dc->current_state->res_ctx.pipe_ctx[i];
@@ -765,6 +781,8 @@ bool dc_stream_program_csc_matrix(struct dc *dc, struct dc_stream_state *stream)
 	bool ret = false;
 	struct pipe_ctx *pipes;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		if (dc->current_state->res_ctx.pipe_ctx[i].stream
 				== stream) {
@@ -791,6 +809,8 @@ void dc_stream_set_static_screen_params(struct dc *dc,
 	struct pipe_ctx *pipes_affected[MAX_PIPES];
 	int num_pipes_affected = 0;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < num_streams; i++) {
 		struct dc_stream_state *stream = streams[i];
 
@@ -1769,6 +1789,8 @@ void dc_enable_stereo(
 	int i, j;
 	struct pipe_ctx *pipe;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		if (context != NULL) {
 			pipe = &context->res_ctx.pipe_ctx[i];
@@ -1788,6 +1810,8 @@ void dc_enable_stereo(
 void dc_trigger_sync(struct dc *dc, struct dc_state *context)
 {
 	if (context->stream_count > 1 && !dc->debug.disable_timing_sync) {
+		dc_exit_ips_for_hw_access(dc);
+
 		enable_timing_multisync(dc, context);
 		program_timing_sync(dc, context);
 	}
@@ -2044,6 +2068,8 @@ enum dc_status dc_commit_streams(struct dc *dc,
 	if (!streams_changed(dc, streams, stream_count))
 		return res;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	DC_LOG_DC("%s: %d streams\n", __func__, stream_count);
 
 	for (i = 0; i < stream_count; i++) {
@@ -3373,6 +3399,8 @@ static void commit_planes_for_stream_fast(struct dc *dc,
 	int i, j;
 	struct pipe_ctx *top_pipe_to_program = NULL;
 	struct dc_stream_status *stream_status = NULL;
+	dc_exit_ips_for_hw_access(dc);
+
 	dc_z10_restore(dc);
 
 	top_pipe_to_program = resource_get_otg_master_for_stream(
@@ -3527,6 +3555,8 @@ static void commit_planes_for_stream(struct dc *dc,
 	// dc->current_state anymore, so we have to cache it before we apply
 	// the new SubVP context
 	subvp_prev_use = false;
+	dc_exit_ips_for_hw_access(dc);
+
 	dc_z10_restore(dc);
 	if (update_type == UPDATE_TYPE_FULL)
 		wait_for_outstanding_hw_updates(dc, context);
@@ -4409,6 +4439,8 @@ bool dc_update_planes_and_stream(struct dc *dc,
 	bool is_plane_addition = 0;
 	bool is_fast_update_only;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	populate_fast_updates(fast_update, srf_updates, surface_count, stream_update);
 	is_fast_update_only = fast_update_only(dc, fast_update, srf_updates,
 			surface_count, stream_update, stream);
@@ -4529,6 +4561,8 @@ void dc_commit_updates_for_stream(struct dc *dc,
 	int i, j;
 	struct dc_fast_update fast_update[MAX_SURFACES] = {0};
 
+	dc_exit_ips_for_hw_access(dc);
+
 	populate_fast_updates(fast_update, srf_updates, surface_count, stream_update);
 	stream_status = dc_stream_get_status(stream);
 	context = dc->current_state;
@@ -4713,6 +4747,8 @@ void dc_set_power_state(
 	case DC_ACPI_CM_POWER_STATE_D0:
 		dc_state_construct(dc, dc->current_state);
 
+		dc_exit_ips_for_hw_access(dc);
+
 		dc_z10_restore(dc);
 
 		dc->hwss.init_hw(dc);
@@ -4854,6 +4890,12 @@ void dc_allow_idle_optimizations(struct dc *dc, bool allow)
 		dc->idle_optimizations_allowed = allow;
 }
 
+void dc_exit_ips_for_hw_access(struct dc *dc)
+{
+	if (dc->caps.ips_support)
+		dc_allow_idle_optimizations(dc, false);
+}
+
 bool dc_dmub_is_ips_idle_state(struct dc *dc)
 {
 	uint32_t idle_state = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 54670e0b1518..51a970fcb5d0 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -423,6 +423,8 @@ bool dc_stream_add_writeback(struct dc *dc,
 		return false;
 	}
 
+	dc_exit_ips_for_hw_access(dc);
+
 	wb_info->dwb_params.out_transfer_func = stream->out_transfer_func;
 
 	dwb = dc->res_pool->dwbc[wb_info->dwb_pipe_inst];
@@ -493,6 +495,8 @@ bool dc_stream_fc_disable_writeback(struct dc *dc,
 		return false;
 	}
 
+	dc_exit_ips_for_hw_access(dc);
+
 	if (dwb->funcs->set_fc_enable)
 		dwb->funcs->set_fc_enable(dwb, DWB_FRAME_CAPTURE_DISABLE);
 
@@ -542,6 +546,8 @@ bool dc_stream_remove_writeback(struct dc *dc,
 		return false;
 	}
 
+	dc_exit_ips_for_hw_access(dc);
+
 	/* disable writeback */
 	if (dc->hwss.disable_writeback) {
 		struct dwbc *dwb = dc->res_pool->dwbc[dwb_pipe_inst];
@@ -557,6 +563,8 @@ bool dc_stream_warmup_writeback(struct dc *dc,
 		int num_dwb,
 		struct dc_writeback_info *wb_info)
 {
+	dc_exit_ips_for_hw_access(dc);
+
 	if (dc->hwss.mmhubbub_warmup)
 		return dc->hwss.mmhubbub_warmup(dc, num_dwb, wb_info);
 	else
@@ -569,6 +577,8 @@ uint32_t dc_stream_get_vblank_counter(const struct dc_stream_state *stream)
 	struct resource_context *res_ctx =
 		&dc->current_state->res_ctx;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct timing_generator *tg = res_ctx->pipe_ctx[i].stream_res.tg;
 
@@ -597,6 +607,8 @@ bool dc_stream_send_dp_sdp(const struct dc_stream_state *stream,
 	dc = stream->ctx->dc;
 	res_ctx = &dc->current_state->res_ctx;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct pipe_ctx *pipe_ctx = &res_ctx->pipe_ctx[i];
 
@@ -628,6 +640,8 @@ bool dc_stream_get_scanoutpos(const struct dc_stream_state *stream,
 	struct resource_context *res_ctx =
 		&dc->current_state->res_ctx;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct timing_generator *tg = res_ctx->pipe_ctx[i].stream_res.tg;
 
@@ -664,6 +678,8 @@ bool dc_stream_dmdata_status_done(struct dc *dc, struct dc_stream_state *stream)
 	if (i == MAX_PIPES)
 		return true;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	return dc->hwss.dmdata_status_done(pipe);
 }
 
@@ -698,6 +714,8 @@ bool dc_stream_set_dynamic_metadata(struct dc *dc,
 
 	pipe_ctx->stream->dmdata_address = attr->address;
 
+	dc_exit_ips_for_hw_access(dc);
+
 	dc->hwss.program_dmdata_engine(pipe_ctx);
 
 	if (hubp->funcs->dmdata_set_attributes != NULL &&
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
index 19a2c7140ae8..19140fb65787 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
@@ -161,6 +161,8 @@ const struct dc_plane_status *dc_plane_get_status(
 		break;
 	}
 
+	dc_exit_ips_for_hw_access(dc);
+
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe_ctx =
 				&dc->current_state->res_ctx.pipe_ctx[i];
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 74c871917eaf..53919c0eb1e3 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -2325,6 +2325,7 @@ bool dc_is_plane_eligible_for_idle_optimizations(struct dc *dc, struct dc_plane_
 				struct dc_cursor_attributes *cursor_attr);
 
 void dc_allow_idle_optimizations(struct dc *dc, bool allow);
+void dc_exit_ips_for_hw_access(struct dc *dc);
 bool dc_dmub_is_ips_idle_state(struct dc *dc);
 
 /* set min and max memory clock to lowest and highest DPM level, respectively */
-- 
2.43.0


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981F88DDF7
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4BF10FB19;
	Wed, 27 Mar 2024 12:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EP2DrEtb";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C3010FB15;
 Wed, 27 Mar 2024 12:12:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACF1861507;
 Wed, 27 Mar 2024 12:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5774AC433F1;
 Wed, 27 Mar 2024 12:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541547;
 bh=oartVK6+nahYao5Vdj4udZvAQsS8HQpvnwVJVqPWdWc=;
 h=From:To:Cc:Subject:Date:From;
 b=EP2DrEtbWAAWmwm1enwqHW9jCet4h5lwQTHvjrC6+QUVhJW2bpoBx6bdvEE8P+EAp
 Uos68N0Mpbmvmo9IFrqV63ANsg7fmwAGL4TQAnZe9FAhwDcj9LXz7Z2LUVNAoNFXPD
 zteAWVkJE4UwGJS+Au0B0fOIiU6QO1LLIvcvB+eHTFtzCdjHQ4/tO+BFzlkioGGCJK
 Yyb2Fw7jTIGLbx+4uCp242gobt/0bR8E2gicGMdPrlW6nmuf/lwS0q1mUYX0ilVqRg
 d6mUTSGYO8lF8sTpPzQRF27JLe9jSDzzKmquyfB6WlKUQxIfq8/4+d7k5jxB7A2NVG
 4tsQ6WpQ5xIhQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nicholas.kazlauskas@amd.com
Cc: Ovidiu Bunea <ovidiu.bunea@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Add more checks for exiting idle in
 DC" failed to apply to 6.1-stable tree
Date: Wed, 27 Mar 2024 08:12:24 -0400
Message-ID: <20240327121225.2829504-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a9b1a4f684b32bcd33431b67acd6f4c275728380 Mon Sep 17 00:00:00 2001
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date: Tue, 16 Jan 2024 09:52:58 -0500
Subject: [PATCH] drm/amd/display: Add more checks for exiting idle in DC

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
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 42 +++++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_stream.c   | 18 ++++++++
 .../gpu/drm/amd/display/dc/core/dc_surface.c  |  2 +
 drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
 4 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 2db361aeaf259..eb803d4d34786 100644
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
index 54670e0b15189..51a970fcb5d05 100644
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
index 19a2c7140ae84..19140fb65787c 100644
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
index 74c871917eafc..53919c0eb1e3d 100644
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





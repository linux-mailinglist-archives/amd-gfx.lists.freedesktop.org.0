Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812BF98593E
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2024 13:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E04F10E970;
	Wed, 25 Sep 2024 11:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PIcy8nqL";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FBC10E970;
 Wed, 25 Sep 2024 11:51:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD3815C0E74;
 Wed, 25 Sep 2024 11:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E54C4CEC3;
 Wed, 25 Sep 2024 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265112;
 bh=NDm3uuNhVRojICJ8zXfHndhbHpTlzcsz5V8KPgKbxjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PIcy8nqLzs76PdNaopI2/jFwlmnY9KstnTflk2rNG9pQ0r/9ooVO9NcVA1pwgR4kb
 dGzzRnHIfufWmLpTuJCkV/ZeIr2b5P/xrlMxiU1IUH2T6b59b+MoqHcgc2lLl+6MgN
 R1OlYn8/kTs3CK2qveHjYt3vOfci1U3FuJ53cedjxzDvrdQTl/AccasE23y/aNMtj+
 LTM4vzqOtfoJwYkJt8SnMPk1+2uJBRJSWKlJSN8T/cxlDY6WsxScL/iWOA50QWQTeC
 MVfkyelZ0zMSrToFI7WoX8gYXc1vMg4VCSNNFeYwinU8OFqF0WZw6bXvc87fNbw6uS
 1x7p4gB+B7dVQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Austin Zheng <Austin.Zheng@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, wenjing.liu@amd.com, alex.hung@amd.com,
 george.shen@amd.com, dillon.varone@amd.com, aurabindo.pillai@amd.com,
 gabe.teeger@amd.com, Harikrishna.Revalla@amd.com, sarvinde@amd.com,
 nevenko.stupar@amd.com, joshua.aberback@amd.com, ilya.bakoulin@amd.com,
 Samson.Tam@amd.com, hanghong.ma@amd.com, hugo.hu@amd.com,
 chris.park@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 208/244] drm/amd/display: Unlock Pipes Based On
 DET Allocation
Date: Wed, 25 Sep 2024 07:27:09 -0400
Message-ID: <20240925113641.1297102-208-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Austin Zheng <Austin.Zheng@amd.com>

[ Upstream commit 4af0d8ebf74ccbb60d33fdd410891283dd6cb109 ]

[Why]
DML21 does not allocate DET evenly between pipes.
May result in underflow when unlocking the pipes as DET could
be overallocated.

[How]
1. Unlock pipes that have a decreased amount of DET allocation
2. Wait for the double buffer to be updated.
3. Unlock the remaining pipes.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Austin Zheng <Austin.Zheng@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 28 ++++++
 .../display/dc/hubbub/dcn401/dcn401_hubbub.c  | 23 +++++
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 91 +++++++++++++++++++
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |  2 +
 .../amd/display/dc/hwss/dcn401/dcn401_init.c  |  2 +-
 .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |  1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h |  5 +
 7 files changed, 151 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 913adca531fc4..5ab5866dc73af 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -5275,3 +5275,31 @@ void resource_init_common_dml2_callbacks(struct dc *dc, struct dml2_configuratio
 	dml2_options->svp_pstate.callbacks.remove_phantom_streams_and_planes = &dc_state_remove_phantom_streams_and_planes;
 	dml2_options->svp_pstate.callbacks.release_phantom_streams_and_planes = &dc_state_release_phantom_streams_and_planes;
 }
+
+/* Returns number of DET segments allocated for a given OTG_MASTER pipe */
+int resource_calculate_det_for_stream(struct dc_state *state, struct pipe_ctx *otg_master)
+{
+	struct pipe_ctx *opp_heads[MAX_PIPES];
+	struct pipe_ctx *dpp_pipes[MAX_PIPES];
+
+	int dpp_count = 0;
+	int det_segments = 0;
+
+	if (!otg_master->stream)
+		return 0;
+
+	int slice_count = resource_get_opp_heads_for_otg_master(otg_master,
+			&state->res_ctx, opp_heads);
+
+	for (int slice_idx = 0; slice_idx < slice_count; slice_idx++) {
+		if (opp_heads[slice_idx]->plane_state) {
+			dpp_count = resource_get_dpp_pipes_for_opp_head(
+					opp_heads[slice_idx],
+					&state->res_ctx,
+					dpp_pipes);
+			for (int dpp_idx = 0; dpp_idx < dpp_count; dpp_idx++)
+				det_segments += dpp_pipes[dpp_idx]->hubp_regs.det_size;
+		}
+	}
+	return det_segments;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
index 181041d6d177c..70ddc0392a5b6 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
@@ -1170,6 +1170,28 @@ static void dcn401_program_compbuf_segments(struct hubbub *hubbub, unsigned comp
 	}
 }
 
+static void dcn401_wait_for_det_update(struct hubbub *hubbub, int hubp_inst)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+
+	switch (hubp_inst) {
+	case 0:
+		REG_WAIT(DCHUBBUB_DET0_CTRL, DET0_SIZE_CURRENT, hubbub2->det0_size, 1, 100000); /* 1 vupdate at 10hz */
+		break;
+	case 1:
+		REG_WAIT(DCHUBBUB_DET1_CTRL, DET1_SIZE_CURRENT, hubbub2->det1_size, 1, 100000);
+		break;
+	case 2:
+		REG_WAIT(DCHUBBUB_DET2_CTRL, DET2_SIZE_CURRENT, hubbub2->det2_size, 1, 100000);
+		break;
+	case 3:
+		REG_WAIT(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT, hubbub2->det3_size, 1, 100000);
+		break;
+	default:
+		break;
+	}
+}
+
 static const struct hubbub_funcs hubbub4_01_funcs = {
 	.update_dchub = hubbub2_update_dchub,
 	.init_dchub_sys_ctx = hubbub3_init_dchub_sys_ctx,
@@ -1192,6 +1214,7 @@ static const struct hubbub_funcs hubbub4_01_funcs = {
 	.set_request_limit = hubbub32_set_request_limit,
 	.program_det_segments = dcn401_program_det_segments,
 	.program_compbuf_segments = dcn401_program_compbuf_segments,
+	.wait_for_det_update = dcn401_wait_for_det_update,
 };
 
 void hubbub401_construct(struct dcn20_hubbub *hubbub2,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 7c724cf682840..edd302ebbdfcf 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -1677,3 +1677,94 @@ void dcn401_hardware_release(struct dc *dc)
 	}
 }
 
+void dcn401_wait_for_det_buffer_update(struct dc *dc, struct dc_state *context, struct pipe_ctx *otg_master)
+{
+	struct pipe_ctx *opp_heads[MAX_PIPES];
+	struct pipe_ctx *dpp_pipes[MAX_PIPES];
+	struct hubbub *hubbub = dc->res_pool->hubbub;
+	int dpp_count = 0;
+
+	if (!otg_master->stream)
+		return;
+
+	int slice_count = resource_get_opp_heads_for_otg_master(otg_master,
+			&context->res_ctx, opp_heads);
+
+	for (int slice_idx = 0; slice_idx < slice_count; slice_idx++) {
+		if (opp_heads[slice_idx]->plane_state) {
+			dpp_count = resource_get_dpp_pipes_for_opp_head(
+					opp_heads[slice_idx],
+					&context->res_ctx,
+					dpp_pipes);
+			for (int dpp_idx = 0; dpp_idx < dpp_count; dpp_idx++) {
+				struct pipe_ctx *dpp_pipe = dpp_pipes[dpp_idx];
+					if (dpp_pipe && hubbub &&
+						dpp_pipe->plane_res.hubp &&
+						hubbub->funcs->wait_for_det_update)
+						hubbub->funcs->wait_for_det_update(hubbub, dpp_pipe->plane_res.hubp->inst);
+			}
+		}
+	}
+}
+
+void dcn401_interdependent_update_lock(struct dc *dc,
+		struct dc_state *context, bool lock)
+{
+	unsigned int i = 0;
+	struct pipe_ctx *pipe = NULL;
+	struct timing_generator *tg = NULL;
+	bool pipe_unlocked[MAX_PIPES] = {0};
+
+	if (lock) {
+		for (i = 0; i < dc->res_pool->pipe_count; i++) {
+			pipe = &context->res_ctx.pipe_ctx[i];
+			tg = pipe->stream_res.tg;
+
+			if (!resource_is_pipe_type(pipe, OTG_MASTER) ||
+					!tg->funcs->is_tg_enabled(tg) ||
+					dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM)
+				continue;
+			dc->hwss.pipe_control_lock(dc, pipe, true);
+		}
+	} else {
+		/* Unlock pipes based on the change in DET allocation instead of pipe index
+		 * Prevents over allocation of DET during unlock process
+		 * e.g. 2 pipe config with different streams with a max of 20 DET segments
+		 *	Before:								After:
+		 *		- Pipe0: 10 DET segments			- Pipe0: 12 DET segments
+		 *		- Pipe1: 10 DET segments			- Pipe1: 8 DET segments
+		 * If Pipe0 gets updated first, 22 DET segments will be allocated
+		 */
+		for (i = 0; i < dc->res_pool->pipe_count; i++) {
+			pipe = &context->res_ctx.pipe_ctx[i];
+			tg = pipe->stream_res.tg;
+			int current_pipe_idx = i;
+
+			if (!resource_is_pipe_type(pipe, OTG_MASTER) ||
+					!tg->funcs->is_tg_enabled(tg) ||
+					dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
+				pipe_unlocked[i] = true;
+				continue;
+			}
+
+			// If the same stream exists in old context, ensure the OTG_MASTER pipes for the same stream get compared
+			struct pipe_ctx *old_otg_master = resource_get_otg_master_for_stream(&dc->current_state->res_ctx, pipe->stream);
+
+			if (old_otg_master)
+				current_pipe_idx = old_otg_master->pipe_idx;
+			if (resource_calculate_det_for_stream(context, pipe) <
+					resource_calculate_det_for_stream(dc->current_state, &dc->current_state->res_ctx.pipe_ctx[current_pipe_idx])) {
+				dc->hwss.pipe_control_lock(dc, pipe, false);
+				pipe_unlocked[i] = true;
+				dcn401_wait_for_det_buffer_update(dc, context, pipe);
+			}
+		}
+
+		for (i = 0; i < dc->res_pool->pipe_count; i++) {
+			if (pipe_unlocked[i])
+				continue;
+			pipe = &context->res_ctx.pipe_ctx[i];
+			dc->hwss.pipe_control_lock(dc, pipe, false);
+		}
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
index 8e9c1c17aa662..3ecb1ebffcee8 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
@@ -81,4 +81,6 @@ void dcn401_hardware_release(struct dc *dc);
 void dcn401_update_odm(struct dc *dc, struct dc_state *context,
 		struct pipe_ctx *otg_master);
 void adjust_hotspot_between_slices_for_2x_magnify(uint32_t cursor_width, struct dc_cursor_position *pos_cpy);
+void dcn401_wait_for_det_buffer_update(struct dc *dc, struct dc_state *context, struct pipe_ctx *otg_master);
+void dcn401_interdependent_update_lock(struct dc *dc, struct dc_state *context, bool lock);
 #endif /* __DC_HWSS_DCN401_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
index 6a768702c7bde..28f3eb8f4b2d8 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
@@ -38,7 +38,7 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.disable_audio_stream = dce110_disable_audio_stream,
 	.disable_plane = dcn20_disable_plane,
 	.pipe_control_lock = dcn20_pipe_control_lock,
-	.interdependent_update_lock = dcn32_interdependent_update_lock,
+	.interdependent_update_lock = dcn401_interdependent_update_lock,
 	.cursor_lock = dcn10_cursor_lock,
 	.prepare_bandwidth = dcn401_prepare_bandwidth,
 	.optimize_bandwidth = dcn401_optimize_bandwidth,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
index dd2b2864876c7..67c32401893e8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
@@ -227,6 +227,7 @@ struct hubbub_funcs {
 	void (*get_mall_en)(struct hubbub *hubbub, unsigned int *mall_in_use);
 	void (*program_det_segments)(struct hubbub *hubbub, int hubp_inst, unsigned det_buffer_size_seg);
 	void (*program_compbuf_segments)(struct hubbub *hubbub, unsigned compbuf_size_seg, bool safe_to_increase);
+	void (*wait_for_det_update)(struct hubbub *hubbub, int hubp_inst);
 };
 
 struct hubbub {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index 96d40d33a1f99..9cd80d3864c7b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -639,4 +639,9 @@ struct dscl_prog_data *resource_get_dscl_prog_data(struct pipe_ctx *pipe_ctx);
  * @dml2_options: struct to hold callbacks
  */
 void resource_init_common_dml2_callbacks(struct dc *dc, struct dml2_configuration_options *dml2_options);
+
+/*
+ *Calculate total DET allocated for all pipes for a given OTG_MASTER pipe
+ */
+int resource_calculate_det_for_stream(struct dc_state *state, struct pipe_ctx *otg_master);
 #endif /* DRIVERS_GPU_DRM_AMD_DC_DEV_DC_INC_RESOURCE_H_ */
-- 
2.43.0


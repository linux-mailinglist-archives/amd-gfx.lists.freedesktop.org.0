Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628581EAC0B
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5BB6E9D9;
	Mon,  1 Jun 2020 18:30:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C986E9D9
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:30:08 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id c12so9988743qkk.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I8ekx+Qudnl/VEltk451/BtSC2QzXPU1woPMaP1aUuI=;
 b=oNczGkk7VLBk4u6Bo3wM+o1EcCms1C/JYDNWzFbYjIOgheQPJ23iBKVBLkeSCq/wSu
 2XRewmEOAFZk5PPR0wZglD/a+W0w3EEM2iRzNdKop5piGDMaKKB3rLYSHthMzuTEAgwS
 N0bx5bEHkCZzL3PIz2Wwj4BYWl64h0DLYRjleyUdKf2Q87xvgT5sQE21vfTTaFMlR13i
 Ke62huBBri2vun6Y3I+HCnTSmP9j3BWNJJqwdxuFCNfWFWIydQDxqXL4KmGSiHTAiPF3
 tv+JzU7QHLSV7Hld34V3u4d2e1Mao3FxjM3+a5zEYQAUlKzVdB6FMGwoMr8lDu4zmOrN
 mtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I8ekx+Qudnl/VEltk451/BtSC2QzXPU1woPMaP1aUuI=;
 b=sWWj5V52VhiX324UThmyfpchzzCt5TaUc3hX9lkxK8ZJkv2watbV74OY2esa9+X8FM
 GZPPGen2LT3hqVCApfwa2SpDvaFyohIOnkIc+XMRs8eY7TyN6n3JvxvbFnmIkJL/m1Zt
 tcAw4a3Q/sOuR9w8OwDoy9H8IxNklK0PEDNvy1XM6L3u3DpOHW+jdfMK8n6NwbQS57+d
 oRo3+jd30g2KpVJC5AAOdBu5fLZhC2heJTBuB3Unpu3IJSoFZZigLJyY7wrpTzDxtPi7
 4d8I+bPrmA8yibrLiFZ5aaYuN/0ankuBJgoyeSqRr0rFb8OJeqSIdAVJVS5KqeoSQJGz
 HIxQ==
X-Gm-Message-State: AOAM533tzfTIjpDSxqSz27SVXWBlE2xZDmHnq7r5QoKwnst8GkeBbk7h
 j6Ys/CZ0gMkrNz+sZUIrcwyYkRKN
X-Google-Smtp-Source: ABdhPJxukIisvi7Qd/UMA5vw/jktuFDyczFE2vwkj4uTwYogXWtuze36bmfwgo07OZVxIm/7ecH6GA==
X-Received: by 2002:a37:b847:: with SMTP id i68mr20815436qkf.431.1591036206571; 
 Mon, 01 Jun 2020 11:30:06 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:30:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 195/207] drm/amd/display: Add DCN3 HWSEQ
Date: Mon,  1 Jun 2020 14:29:14 -0400
Message-Id: <20200601182926.1267958-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182926.1267958-1-alexander.deucher@amd.com>
References: <20200601182926.1267958-1-alexander.deucher@amd.com>
MIME-Version: 1.0
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Add HW sequence programing for DCN3

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h  |   3 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  15 +
 .../gpu/drm/amd/display/dc/dce/dce_hwseq.h    |  46 ++
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |   5 +
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |  85 +++
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 714 ++++++++++++++++++
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |  70 ++
 .../gpu/drm/amd/display/dc/inc/core_types.h   |   4 +
 .../gpu/drm/amd/display/dc/inc/hw/mcif_wb.h   |   5 +
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   4 +
 10 files changed, 951 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h

diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index a31c75d6d2cf..95175471e48d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -893,6 +893,9 @@ struct mcif_buf_params {
 	unsigned int		chroma_pitch;
 	unsigned int		warmup_pitch;
 	unsigned int		swlock;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	unsigned int		p_vmid;
+#endif
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 49aad691e687..f2ed9bc5a319 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -87,6 +87,13 @@ struct dc_writeback_info {
 	int dwb_pipe_inst;
 	struct dc_dwb_params dwb_params;
 	struct mcif_buf_params mcif_buf_params;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	struct mcif_warmup_params mcif_warmup_params;
+	/* the plane that is the input to TOP_MUX for MPCC that is the DWB source */
+	struct dc_plane_state *writeback_source_plane;
+	/* source MPCC instance.  for use by internally by dc */
+	int mpcc_inst;
+#endif
 };
 
 struct dc_writeback_update {
@@ -200,6 +207,10 @@ struct dc_stream_state {
 	/* writeback */
 	unsigned int num_wb_info;
 	struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	const struct dc_transfer_func *func_shaper;
+	const struct dc_3dlut *lut3d_func;
+#endif
 	/* Computed state bits */
 	bool mode_changed : 1;
 
@@ -251,6 +262,10 @@ struct dc_stream_update {
 
 	struct dc_writeback_update *wb_update;
 	struct dc_dsc_config *dsc_config;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	struct dc_transfer_func *func_shaper;
+	struct dc_3dlut *lut3d_func;
+#endif
 };
 
 bool dc_is_stream_unchanged(
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
index 5479d959ec62..66b88d6ba398 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
@@ -78,6 +78,24 @@
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 4), \
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 5)
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define HWSEQ_PIXEL_RATE_REG_LIST_3(blk) \
+	SRII(PIXEL_RATE_CNTL, blk, 0), \
+	SRII(PIXEL_RATE_CNTL, blk, 1),\
+	SRII(PIXEL_RATE_CNTL, blk, 2),\
+	SRII(PIXEL_RATE_CNTL, blk, 3), \
+	SRII(PIXEL_RATE_CNTL, blk, 4), \
+	SRII(PIXEL_RATE_CNTL, blk, 5)
+
+#define HWSEQ_PHYPLL_REG_LIST_3(blk) \
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 0), \
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 1),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 2),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 3), \
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 4), \
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 5)
+#endif
+
 #define HWSEQ_DCE11_REG_LIST_BASE() \
 	SR(DC_MEM_GLOBAL_PWR_REQ_CNTL), \
 	SR(DCFEV_CLOCK_CONTROL), \
@@ -200,6 +218,28 @@
 	SR(VGA_TEST_CONTROL), \
 	SR(DC_IP_REQUEST_CNTL)
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define HWSEQ_DCN30_REG_LIST()\
+	HWSEQ_DCN2_REG_LIST(),\
+	HWSEQ_DCN_REG_LIST(), \
+	HWSEQ_PIXEL_RATE_REG_LIST_3(OTG), \
+	HWSEQ_PHYPLL_REG_LIST_3(OTG), \
+	SR(MICROSECOND_TIME_BASE_DIV), \
+	SR(MILLISECOND_TIME_BASE_DIV), \
+	SR(DISPCLK_FREQ_CHANGE_CNTL), \
+	SR(RBBMIF_TIMEOUT_DIS), \
+	SR(RBBMIF_TIMEOUT_DIS_2), \
+	SR(DCHUBBUB_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_VAL_B_A), \
+	SR(DPP_TOP0_DPP_CRC_VAL_R_G), \
+	SR(MPC_CRC_CTRL), \
+	SR(MPC_CRC_RESULT_GB), \
+	SR(MPC_CRC_RESULT_C), \
+	SR(MPC_CRC_RESULT_AR), \
+	SR(AZALIA_AUDIO_DTO), \
+	SR(AZALIA_CONTROLLER_CLOCK_GATING)
+#endif
 #define HWSEQ_DCN2_REG_LIST()\
 	HWSEQ_DCN_REG_LIST(), \
 	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 0), \
@@ -546,6 +586,12 @@ struct dce_hwseq_registers {
 	HWS_SF(, VGA_TEST_CONTROL, VGA_TEST_ENABLE, mask_sh),\
 	HWS_SF(, VGA_TEST_CONTROL, VGA_TEST_RENDER_START, mask_sh)
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define HWSEQ_DCN30_MASK_SH_LIST(mask_sh)\
+	HWSEQ_DCN2_MASK_SH_LIST(mask_sh), \
+	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
+#endif
+
 #define HWSEQ_DCN2_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
 	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index deaafb4782d6..8d3a125a0cae 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -1453,6 +1453,11 @@ void dcn10_init_hw(struct dc *dc)
 	if (dc->clk_mgr->funcs->notify_wm_ranges)
 		dc->clk_mgr->funcs->notify_wm_ranges(dc->clk_mgr);
 
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	if (dc->clk_mgr->funcs->set_hard_max_memclk)
+		dc->clk_mgr->funcs->set_hard_max_memclk(dc->clk_mgr);
+#endif
+
 }
 
 void dcn10_reset_hw_ctx_wrap(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 13183bd7ea0f..0b318f799db3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -609,6 +609,31 @@ void dcn20_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx)
 					pipe_ctx->pipe_idx);
 }
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+static int calc_mpc_flow_ctrl_cnt(const struct dc_stream_state *stream,
+		int opp_cnt)
+{
+	bool hblank_halved = optc2_is_two_pixels_per_containter(&stream->timing);
+	int flow_ctrl_cnt;
+
+	if (opp_cnt == 2)
+		hblank_halved = true;
+
+	flow_ctrl_cnt = stream->timing.h_total - stream->timing.h_addressable -
+			stream->timing.h_border_left -
+			stream->timing.h_border_right;
+
+	if (hblank_halved)
+		flow_ctrl_cnt /= 2;
+
+	/* ODM combine 4:1 case */
+	if (opp_cnt == 4)
+		flow_ctrl_cnt /= 2;
+
+	return flow_ctrl_cnt;
+}
+#endif
+
 enum dc_status dcn20_enable_stream_timing(
 		struct pipe_ctx *pipe_ctx,
 		struct dc_state *context,
@@ -622,6 +647,15 @@ enum dc_status dcn20_enable_stream_timing(
 	int opp_cnt = 1;
 	int opp_inst[MAX_PIPES] = { pipe_ctx->stream_res.opp->inst };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	bool interlace = stream->timing.flags.INTERLACE;
+	int i;
+
+	struct mpc_dwb_flow_control flow_control;
+	struct mpc *mpc = dc->res_pool->mpc;
+	bool rate_control_2x_pclk = (interlace || optc2_is_two_pixels_per_containter(&stream->timing));
+
+#endif
 	/* by upper caller loop, pipe0 is parent pipe and be called first.
 	 * back end is set up by for pipe0. Other children pipe share back end
 	 * with pipe 0. No program is needed.
@@ -668,6 +702,21 @@ enum dc_status dcn20_enable_stream_timing(
 			pipe_ctx->stream->signal,
 			true);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	rate_control_2x_pclk = rate_control_2x_pclk || opp_cnt > 1;
+	flow_control.flow_ctrl_mode = 0;
+	flow_control.flow_ctrl_cnt0 = 0x80;
+	flow_control.flow_ctrl_cnt1 = calc_mpc_flow_ctrl_cnt(stream, opp_cnt);
+	if (mpc->funcs->set_out_rate_control) {
+		for (i = 0; i < opp_cnt; ++i) {
+			mpc->funcs->set_out_rate_control(
+					mpc, opp_inst[i],
+					true,
+					rate_control_2x_pclk,
+					&flow_control);
+		}
+	}
+#endif
 	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
 		odm_pipe->stream_res.opp->funcs->opp_pipe_clock_control(
 				odm_pipe->stream_res.opp,
@@ -1414,6 +1463,37 @@ static void dcn20_update_dchubp_dpp(
 	if (pipe_ctx->update_flags.bits.enable || pipe_ctx->update_flags.bits.opp_changed
 			|| pipe_ctx->stream->update_flags.bits.gamut_remap
 			|| pipe_ctx->stream->update_flags.bits.out_csc) {
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+		struct mpc *mpc = pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
+
+		if (mpc->funcs->set_gamut_remap) {
+			int i;
+			int mpcc_id = hubp->inst;
+			struct mpc_grph_gamut_adjustment adjust;
+			bool enable_remap_dpp = false;
+
+			memset(&adjust, 0, sizeof(adjust));
+			adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
+			/* save the enablement of gamut remap for dpp*/
+			enable_remap_dpp = pipe_ctx->stream->gamut_remap_matrix.enable_remap;
+			/*force bypass gamut remap for dpp/cm*/
+			pipe_ctx->stream->gamut_remap_matrix.enable_remap = false;
+			dc->hwss.program_gamut_remap(pipe_ctx);
+			/*restore gamut remap flag for the top plane and use this remap into mpc*/
+			if (pipe_ctx->top_pipe == NULL)
+				pipe_ctx->stream->gamut_remap_matrix.enable_remap = enable_remap_dpp;
+			else
+				pipe_ctx->stream->gamut_remap_matrix.enable_remap = false;
+
+			if (pipe_ctx->stream->gamut_remap_matrix.enable_remap == true) {
+				adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_SW;
+				for (i = 0; i < CSC_TEMPERATURE_MATRIX_SIZE; i++)
+					adjust.temperature_matrix[i] =
+						pipe_ctx->stream->gamut_remap_matrix.matrix[i];
+			}
+			mpc->funcs->set_gamut_remap(mpc, mpcc_id, &adjust);
+		} else
+#endif
 			/* dpp/cm gamut remap*/
 			dc->hwss.program_gamut_remap(pipe_ctx);
 
@@ -2173,6 +2253,11 @@ void dcn20_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	blnd_cfg.bottom_inside_gain = 0x1f000;
 	blnd_cfg.bottom_outside_gain = 0x1f000;
 	blnd_cfg.pre_multiplied_alpha = per_pixel_alpha;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	if (pipe_ctx->plane_state->format
+			== SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA)
+		blnd_cfg.pre_multiplied_alpha = false;
+#endif
 
 	/*
 	 * TODO: remove hack
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
new file mode 100644
index 000000000000..ab20320ebc99
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -0,0 +1,714 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+
+#include "dm_services.h"
+#include "dm_helpers.h"
+#include "core_types.h"
+#include "resource.h"
+#include "dcn30_hwseq.h"
+#include "dccg.h"
+#include "dce/dce_hwseq.h"
+#include "dcn30_mpc.h"
+#include "dcn30_dpp.h"
+#include "dcn10/dcn10_cm_common.h"
+#include "dcn30_cm_common.h"
+#include "clk_mgr.h"
+#include "reg_helper.h"
+#include "abm.h"
+#include "clk_mgr.h"
+#include "hubp.h"
+#include "dchubbub.h"
+#include "timing_generator.h"
+#include "opp.h"
+#include "ipp.h"
+#include "mpc.h"
+#include "mcif_wb.h"
+#include "dc_dmub_srv.h"
+
+
+
+
+#define DC_LOGGER_INIT(logger)
+
+#define CTX \
+	hws->ctx
+#define REG(reg)\
+	hws->regs->reg
+#define DC_LOGGER \
+		dc->ctx->logger
+
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hws->shifts->field_name, hws->masks->field_name
+
+bool dcn30_set_blend_lut(
+	struct pipe_ctx *pipe_ctx, const struct dc_plane_state *plane_state)
+{
+	struct dpp *dpp_base = pipe_ctx->plane_res.dpp;
+	bool result = true;
+	struct pwl_params *blend_lut = NULL;
+
+	if (plane_state->blend_tf) {
+		if (plane_state->blend_tf->type == TF_TYPE_HWPWL)
+			blend_lut = &plane_state->blend_tf->pwl;
+		else if (plane_state->blend_tf->type == TF_TYPE_DISTRIBUTED_POINTS) {
+			cm3_helper_translate_curve_to_hw_format(
+					plane_state->blend_tf, &dpp_base->regamma_params, false);
+			blend_lut = &dpp_base->regamma_params;
+		}
+	}
+	result = dpp_base->funcs->dpp_program_blnd_lut(dpp_base, blend_lut);
+
+	return result;
+}
+
+static bool dcn30_set_mpc_shaper_3dlut(
+	struct pipe_ctx *pipe_ctx, const struct dc_stream_state *stream)
+{
+	struct dpp *dpp_base = pipe_ctx->plane_res.dpp;
+	int mpcc_id = pipe_ctx->plane_res.hubp->inst;
+	struct mpc *mpc = pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
+	bool result = false;
+	int acquired_rmu = 0;
+	int mpcc_id_projected = 0;
+
+	const struct pwl_params *shaper_lut = NULL;
+	//get the shaper lut params
+	if (stream->func_shaper) {
+		if (stream->func_shaper->type == TF_TYPE_HWPWL)
+			shaper_lut = &stream->func_shaper->pwl;
+		else if (stream->func_shaper->type == TF_TYPE_DISTRIBUTED_POINTS) {
+			cm_helper_translate_curve_to_hw_format(
+					stream->func_shaper,
+					&dpp_base->shaper_params, true);
+			shaper_lut = &dpp_base->shaper_params;
+		}
+	}
+
+	if (stream->lut3d_func &&
+		stream->lut3d_func->state.bits.initialized == 1 &&
+		stream->lut3d_func->state.bits.rmu_idx_valid == 1) {
+		if (stream->lut3d_func->state.bits.rmu_mux_num == 0)
+			mpcc_id_projected = stream->lut3d_func->state.bits.mpc_rmu0_mux;
+		else if (stream->lut3d_func->state.bits.rmu_mux_num == 1)
+			mpcc_id_projected = stream->lut3d_func->state.bits.mpc_rmu1_mux;
+		else if (stream->lut3d_func->state.bits.rmu_mux_num == 2)
+			mpcc_id_projected = stream->lut3d_func->state.bits.mpc_rmu2_mux;
+		if (mpcc_id_projected != mpcc_id)
+			BREAK_TO_DEBUGGER();
+		/*find the reason why logical layer assigned a differant mpcc_id into acquire_post_bldn_3dlut*/
+		acquired_rmu = mpc->funcs->acquire_rmu(mpc, mpcc_id,
+				stream->lut3d_func->state.bits.rmu_mux_num);
+		if (acquired_rmu != stream->lut3d_func->state.bits.rmu_mux_num)
+			BREAK_TO_DEBUGGER();
+		result = mpc->funcs->program_3dlut(mpc,
+								&stream->lut3d_func->lut_3d,
+								stream->lut3d_func->state.bits.rmu_mux_num);
+		result = mpc->funcs->program_shaper(mpc, shaper_lut,
+				stream->lut3d_func->state.bits.rmu_mux_num);
+	} else
+		/*loop through the available mux and release the requested mpcc_id*/
+		mpc->funcs->release_rmu(mpc, mpcc_id);
+
+
+	return result;
+}
+
+bool dcn30_set_input_transfer_func(struct dc *dc,
+				struct pipe_ctx *pipe_ctx,
+				const struct dc_plane_state *plane_state)
+{
+	struct dce_hwseq *hws = dc->hwseq;
+	struct dpp *dpp_base = pipe_ctx->plane_res.dpp;
+	enum dc_transfer_func_predefined tf;
+	bool result = true;
+	struct pwl_params *params = NULL;
+
+	if (dpp_base == NULL || plane_state == NULL)
+		return false;
+
+	tf = TRANSFER_FUNCTION_UNITY;
+
+	if (plane_state->in_transfer_func &&
+		plane_state->in_transfer_func->type == TF_TYPE_PREDEFINED)
+		tf = plane_state->in_transfer_func->tf;
+
+	dpp_base->funcs->dpp_set_pre_degam(dpp_base, tf);
+
+	if (plane_state->in_transfer_func) {
+		if (plane_state->in_transfer_func->type == TF_TYPE_HWPWL)
+			params = &plane_state->in_transfer_func->pwl;
+		else if (plane_state->in_transfer_func->type == TF_TYPE_DISTRIBUTED_POINTS &&
+			cm3_helper_translate_curve_to_hw_format(plane_state->in_transfer_func,
+					&dpp_base->degamma_params, false))
+			params = &dpp_base->degamma_params;
+	}
+
+	result = dpp_base->funcs->dpp_program_gamcor_lut(dpp_base, params);
+
+	if (pipe_ctx->stream_res.opp && pipe_ctx->stream_res.opp->ctx) {
+		if (dpp_base->funcs->dpp_program_blnd_lut)
+			hws->funcs.set_blend_lut(pipe_ctx, plane_state);
+		if (dpp_base->funcs->dpp_program_shaper_lut &&
+				dpp_base->funcs->dpp_program_3dlut)
+			hws->funcs.set_shaper_3dlut(pipe_ctx, plane_state);
+	}
+
+	return result;
+}
+
+bool dcn30_set_output_transfer_func(struct dc *dc,
+				struct pipe_ctx *pipe_ctx,
+				const struct dc_stream_state *stream)
+{
+	int mpcc_id = pipe_ctx->plane_res.hubp->inst;
+	struct mpc *mpc = pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
+	struct pwl_params *params = NULL;
+	bool ret = false;
+
+	/* program OGAM or 3DLUT only for the top pipe*/
+	if (pipe_ctx->top_pipe == NULL) {
+		/*program rmu shaper and 3dlut in MPC*/
+		ret = dcn30_set_mpc_shaper_3dlut(pipe_ctx, stream);
+		if (ret == false && mpc->funcs->set_output_gamma && stream->out_transfer_func) {
+			if (stream->out_transfer_func->type == TF_TYPE_HWPWL)
+				params = &stream->out_transfer_func->pwl;
+			else if (pipe_ctx->stream->out_transfer_func->type ==
+					TF_TYPE_DISTRIBUTED_POINTS &&
+					cm3_helper_translate_curve_to_hw_format(
+					stream->out_transfer_func,
+					&mpc->blender_params, false))
+				params = &mpc->blender_params;
+		 /* there are no ROM LUTs in OUTGAM */
+		if (stream->out_transfer_func->type == TF_TYPE_PREDEFINED)
+			BREAK_TO_DEBUGGER();
+		}
+	}
+
+	mpc->funcs->set_output_gamma(mpc, mpcc_id, params);
+	return ret;
+}
+
+static void dcn30_set_writeback(
+		struct dc *dc,
+		struct dc_writeback_info *wb_info,
+		struct dc_state *context)
+{
+	struct dwbc *dwb;
+	struct mcif_wb *mcif_wb;
+	struct mcif_buf_params *mcif_buf_params;
+
+	ASSERT(wb_info->dwb_pipe_inst < MAX_DWB_PIPES);
+	ASSERT(wb_info->wb_enabled);
+	ASSERT(wb_info->mpcc_inst >= 0);
+	ASSERT(wb_info->mpcc_inst < 4);
+	dwb = dc->res_pool->dwbc[wb_info->dwb_pipe_inst];
+	mcif_wb = dc->res_pool->mcif_wb[wb_info->dwb_pipe_inst];
+	mcif_buf_params = &wb_info->mcif_buf_params;
+
+	/* set DWB MPC mux */
+	dc->res_pool->mpc->funcs->set_dwb_mux(dc->res_pool->mpc,
+			wb_info->dwb_pipe_inst, wb_info->mpcc_inst);
+	/* set MCIF_WB buffer and arbitration configuration */
+	mcif_wb->funcs->config_mcif_buf(mcif_wb, mcif_buf_params, wb_info->dwb_params.dest_height);
+	mcif_wb->funcs->config_mcif_arb(mcif_wb, &context->bw_ctx.bw.dcn.bw_writeback.mcif_wb_arb[wb_info->dwb_pipe_inst]);
+}
+
+void dcn30_update_writeback(
+		struct dc *dc,
+		struct dc_writeback_info *wb_info,
+		struct dc_state *context)
+{
+	struct dwbc *dwb;
+	dwb = dc->res_pool->dwbc[wb_info->dwb_pipe_inst];
+	DC_LOG_DWB("%s dwb_pipe_inst = %d, mpcc_inst = %d",\
+		__func__, wb_info->dwb_pipe_inst,\
+		wb_info->mpcc_inst);
+
+	dcn30_set_writeback(dc, wb_info, context);
+
+	/* update DWB */
+	dwb->funcs->update(dwb, &wb_info->dwb_params);
+}
+
+bool dcn30_mmhubbub_warmup(
+	struct dc *dc,
+	unsigned int num_dwb,
+	struct dc_writeback_info *wb_info)
+{
+	struct dwbc *dwb;
+	struct mcif_wb *mcif_wb;
+	struct mcif_warmup_params warmup_params = {0};
+	unsigned int  i, i_buf;
+	/*make sure there is no active DWB eanbled */
+	for (i = 0; i < num_dwb; i++) {
+		dwb = dc->res_pool->dwbc[wb_info[i].dwb_pipe_inst];
+		if (dwb->dwb_is_efc_transition || dwb->dwb_is_drc) {
+			/*can not do warmup while any dwb enabled*/
+			return false;
+		}
+	}
+
+	if (wb_info->mcif_warmup_params.p_vmid == 0)
+		return false;
+
+	/*check whether this is new interface: warmup big buffer once*/
+	if (wb_info->mcif_warmup_params.start_address.quad_part != 0 &&
+		wb_info->mcif_warmup_params.region_size != 0) {
+		/*mmhubbub is shared, so it does not matter which MCIF*/
+		mcif_wb = dc->res_pool->mcif_wb[0];
+		/*warmup a big chunk of VM buffer at once*/
+		warmup_params.start_address.quad_part = wb_info->mcif_warmup_params.start_address.quad_part;
+		warmup_params.address_increment =  wb_info->mcif_warmup_params.region_size;
+		warmup_params.region_size = wb_info->mcif_warmup_params.region_size;
+		warmup_params.p_vmid = wb_info->mcif_warmup_params.p_vmid;
+
+		if (warmup_params.address_increment == 0)
+			warmup_params.address_increment = dc->dml.soc.vmm_page_size_bytes;
+
+		mcif_wb->funcs->warmup_mcif(mcif_wb, &warmup_params);
+		return true;
+	}
+	/*following is the original: warmup each DWB's mcif buffer*/
+	for (i = 0; i < num_dwb; i++) {
+		dwb = dc->res_pool->dwbc[wb_info[i].dwb_pipe_inst];
+		mcif_wb = dc->res_pool->mcif_wb[wb_info[i].dwb_pipe_inst];
+		/*warmup is for VM mode only*/
+		if (wb_info[i].mcif_buf_params.p_vmid == 0)
+			return false;
+
+		/* Warmup MCIF_WB */
+		for (i_buf = 0; i_buf < MCIF_BUF_COUNT; i_buf++) {
+			warmup_params.start_address.quad_part = wb_info[i].mcif_buf_params.luma_address[i_buf];
+			warmup_params.address_increment = dc->dml.soc.vmm_page_size_bytes;
+			warmup_params.region_size = wb_info[i].mcif_buf_params.luma_pitch * wb_info[i].dwb_params.dest_height;
+			warmup_params.p_vmid = wb_info[i].mcif_buf_params.p_vmid;
+			mcif_wb->funcs->warmup_mcif(mcif_wb, &warmup_params);
+		}
+	}
+	return true;
+}
+
+void dcn30_enable_writeback(
+		struct dc *dc,
+		struct dc_writeback_info *wb_info,
+		struct dc_state *context)
+{
+	struct dwbc *dwb;
+	struct mcif_wb *mcif_wb;
+	struct timing_generator *optc;
+
+	dwb = dc->res_pool->dwbc[wb_info->dwb_pipe_inst];
+	mcif_wb = dc->res_pool->mcif_wb[wb_info->dwb_pipe_inst];
+
+	/* set the OPTC source mux */
+	optc = dc->res_pool->timing_generators[dwb->otg_inst];
+	DC_LOG_DWB("%s dwb_pipe_inst = %d, mpcc_inst = %d",\
+		__func__, wb_info->dwb_pipe_inst,\
+		wb_info->mpcc_inst);
+	if (IS_DIAG_DC(dc->ctx->dce_environment)) {
+		/*till diags switch to warmup interface*/
+		dcn30_mmhubbub_warmup(dc, 1, wb_info);
+	}
+	/* Update writeback pipe */
+	dcn30_set_writeback(dc, wb_info, context);
+
+	/* Enable MCIF_WB */
+	mcif_wb->funcs->enable_mcif(mcif_wb);
+	/* Enable DWB */
+	dwb->funcs->enable(dwb, &wb_info->dwb_params);
+}
+
+void dcn30_disable_writeback(
+		struct dc *dc,
+		unsigned int dwb_pipe_inst)
+{
+	struct dwbc *dwb;
+	struct mcif_wb *mcif_wb;
+
+	ASSERT(dwb_pipe_inst < MAX_DWB_PIPES);
+	dwb = dc->res_pool->dwbc[dwb_pipe_inst];
+	mcif_wb = dc->res_pool->mcif_wb[dwb_pipe_inst];
+	DC_LOG_DWB("%s dwb_pipe_inst = %d",\
+		__func__, dwb_pipe_inst);
+
+	/* disable DWB */
+	dwb->funcs->disable(dwb);
+	/* disable MCIF */
+	mcif_wb->funcs->disable_mcif(mcif_wb);
+	/* disable MPC DWB mux */
+	dc->res_pool->mpc->funcs->disable_dwb_mux(dc->res_pool->mpc, dwb_pipe_inst);
+}
+
+void dcn30_program_all_writeback_pipes_in_tree(
+		struct dc *dc,
+		const struct dc_stream_state *stream,
+		struct dc_state *context)
+{
+	struct dc_writeback_info wb_info;
+	struct dwbc *dwb;
+	struct dc_stream_status *stream_status = NULL;
+	int i_wb, i_pipe, i_stream;
+	DC_LOG_DWB("%s", __func__);
+
+	ASSERT(stream);
+	for (i_stream = 0; i_stream < context->stream_count; i_stream++) {
+		if (context->streams[i_stream] == stream) {
+			stream_status = &context->stream_status[i_stream];
+			break;
+		}
+	}
+	ASSERT(stream_status);
+
+	ASSERT(stream->num_wb_info <= dc->res_pool->res_cap->num_dwb);
+	/* For each writeback pipe */
+	for (i_wb = 0; i_wb < stream->num_wb_info; i_wb++) {
+
+		/* copy writeback info to local non-const so mpcc_inst can be set */
+		wb_info = stream->writeback_info[i_wb];
+		if (wb_info.wb_enabled) {
+
+			/* get the MPCC instance for writeback_source_plane */
+			wb_info.mpcc_inst = -1;
+			for (i_pipe = 0; i_pipe < dc->res_pool->pipe_count; i_pipe++) {
+				struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i_pipe];
+
+				if (pipe_ctx->plane_state == wb_info.writeback_source_plane) {
+					wb_info.mpcc_inst = pipe_ctx->plane_res.mpcc_inst;
+					break;
+				}
+			}
+			ASSERT(wb_info.mpcc_inst != -1);
+
+			ASSERT(wb_info.dwb_pipe_inst < dc->res_pool->res_cap->num_dwb);
+			dwb = dc->res_pool->dwbc[wb_info.dwb_pipe_inst];
+			if (dwb->funcs->is_enabled(dwb)) {
+				/* writeback pipe already enabled, only need to update */
+				dc->hwss.update_writeback(dc, &wb_info, context);
+			} else {
+				/* Enable writeback pipe and connect to MPCC */
+				dc->hwss.enable_writeback(dc, &wb_info, context);
+			}
+		} else {
+			/* Disable writeback pipe and disconnect from MPCC */
+			dc->hwss.disable_writeback(dc, wb_info.dwb_pipe_inst);
+		}
+	}
+}
+
+void dcn30_init_hw(struct dc *dc)
+{
+	int i, j;
+	struct abm **abms = dc->res_pool->multiple_abms;
+	struct dce_hwseq *hws = dc->hwseq;
+	struct dc_bios *dcb = dc->ctx->dc_bios;
+	struct resource_pool *res_pool = dc->res_pool;
+	struct dc_state  *context = dc->current_state;
+	uint32_t backlight = MAX_BACKLIGHT_LEVEL;
+
+	if (dc->clk_mgr && dc->clk_mgr->funcs->init_clocks)
+		dc->clk_mgr->funcs->init_clocks(dc->clk_mgr);
+
+	// Initialize the dccg
+	if (res_pool->dccg->funcs->dccg_init)
+		res_pool->dccg->funcs->dccg_init(res_pool->dccg);
+
+	//Enable ability to power gate / don't force power on permanently
+	hws->funcs.enable_power_gating_plane(dc->hwseq, true);
+
+	if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+		REG_WRITE(RBBMIF_TIMEOUT_DIS, 0xFFFFFFFF);
+		REG_WRITE(RBBMIF_TIMEOUT_DIS_2, 0xFFFFFFFF);
+
+		hws->funcs.dccg_init(hws);
+
+		REG_UPDATE(DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, 2);
+		REG_UPDATE(DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_ENABLE, 1);
+		REG_WRITE(REFCLK_CNTL, 0);
+	} else {
+		if (!dcb->funcs->is_accelerated_mode(dcb)) {
+			hws->funcs.bios_golden_init(dc);
+			hws->funcs.disable_vga(dc->hwseq);
+		}
+
+		if (dc->ctx->dc_bios->fw_info_valid) {
+			res_pool->ref_clocks.xtalin_clock_inKhz =
+					dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency;
+
+			if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+				if (res_pool->dccg && res_pool->hubbub) {
+
+					(res_pool->dccg->funcs->get_dccg_ref_freq)(res_pool->dccg,
+							dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency,
+							&res_pool->ref_clocks.dccg_ref_clock_inKhz);
+
+					(res_pool->hubbub->funcs->get_dchub_ref_freq)(res_pool->hubbub,
+							res_pool->ref_clocks.dccg_ref_clock_inKhz,
+							&res_pool->ref_clocks.dchub_ref_clock_inKhz);
+				} else {
+					// Not all ASICs have DCCG sw component
+					res_pool->ref_clocks.dccg_ref_clock_inKhz =
+							res_pool->ref_clocks.xtalin_clock_inKhz;
+					res_pool->ref_clocks.dchub_ref_clock_inKhz =
+							res_pool->ref_clocks.xtalin_clock_inKhz;
+				}
+			}
+		} else
+			ASSERT_CRITICAL(false);
+
+		for (i = 0; i < dc->link_count; i++) {
+			/* Power up AND update implementation according to the
+			 * required signal (which may be different from the
+			 * default signal on connector).
+			 */
+			struct dc_link *link = dc->links[i];
+
+			link->link_enc->funcs->hw_init(link->link_enc);
+		}
+	}
+
+	/* Power gate DSCs */
+	for (i = 0; i < res_pool->res_cap->num_dsc; i++)
+		hws->funcs.dsc_pg_control(hws, res_pool->dscs[i]->inst, false);
+
+	/* Blank pixel data with OPP DPG */
+	for (i = 0; i < dc->res_pool->timing_generator_count; i++) {
+		struct timing_generator *tg = dc->res_pool->timing_generators[i];
+
+		if (tg->funcs->is_tg_enabled(tg))
+			hws->funcs.init_blank(dc, tg);
+	}
+
+	for (i = 0; i < res_pool->timing_generator_count; i++) {
+		struct timing_generator *tg = dc->res_pool->timing_generators[i];
+
+		if (tg->funcs->is_tg_enabled(tg))
+			tg->funcs->lock(tg);
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct dpp *dpp = res_pool->dpps[i];
+
+		dpp->funcs->dpp_reset(dpp);
+	}
+
+	/* Reset all MPCC muxes */
+	res_pool->mpc->funcs->mpc_init(res_pool->mpc);
+
+	/* initialize OPP mpc_tree parameter */
+	for (i = 0; i < dc->res_pool->res_cap->num_opp; i++) {
+		res_pool->opps[i]->mpc_tree_params.opp_id = res_pool->opps[i]->inst;
+		res_pool->opps[i]->mpc_tree_params.opp_list = NULL;
+		for (j = 0; j < MAX_PIPES; j++)
+			res_pool->opps[i]->mpcc_disconnect_pending[j] = false;
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct timing_generator *tg = dc->res_pool->timing_generators[i];
+		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
+		struct hubp *hubp = dc->res_pool->hubps[i];
+		struct dpp *dpp = dc->res_pool->dpps[i];
+
+		pipe_ctx->stream_res.tg = tg;
+		pipe_ctx->pipe_idx = i;
+
+		pipe_ctx->plane_res.hubp = hubp;
+		pipe_ctx->plane_res.dpp = dpp;
+		pipe_ctx->plane_res.mpcc_inst = dpp->inst;
+		hubp->mpcc_id = dpp->inst;
+		hubp->opp_id = OPP_ID_INVALID;
+		hubp->power_gated = false;
+		pipe_ctx->stream_res.opp = NULL;
+
+		hubp->funcs->hubp_init(hubp);
+
+		//dc->res_pool->opps[i]->mpc_tree_params.opp_id = dc->res_pool->opps[i]->inst;
+		//dc->res_pool->opps[i]->mpc_tree_params.opp_list = NULL;
+		dc->res_pool->opps[i]->mpcc_disconnect_pending[pipe_ctx->plane_res.mpcc_inst] = true;
+		pipe_ctx->stream_res.opp = dc->res_pool->opps[i];
+		/*to do*/
+		hws->funcs.plane_atomic_disconnect(dc, pipe_ctx);
+	}
+
+	/* initialize DWB pointer to MCIF_WB */
+	for (i = 0; i < res_pool->res_cap->num_dwb; i++)
+		res_pool->dwbc[i]->mcif = res_pool->mcif_wb[i];
+
+	for (i = 0; i < dc->res_pool->timing_generator_count; i++) {
+		struct timing_generator *tg = dc->res_pool->timing_generators[i];
+
+		if (tg->funcs->is_tg_enabled(tg))
+			tg->funcs->unlock(tg);
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
+
+		dc->hwss.disable_plane(dc, pipe_ctx);
+
+		pipe_ctx->stream_res.tg = NULL;
+		pipe_ctx->plane_res.hubp = NULL;
+	}
+
+	for (i = 0; i < dc->res_pool->timing_generator_count; i++) {
+		struct timing_generator *tg = dc->res_pool->timing_generators[i];
+
+		tg->funcs->tg_init(tg);
+	}
+
+	/* end of FPGA. Below if real ASIC */
+	if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
+		return;
+
+
+	for (i = 0; i < res_pool->audio_count; i++) {
+		struct audio *audio = res_pool->audios[i];
+
+		audio->funcs->hw_init(audio);
+	}
+
+	for (i = 0; i < dc->link_count; i++) {
+		struct dc_link *link = dc->links[i];
+
+		if (link->panel_cntl)
+			backlight = link->panel_cntl->funcs->hw_init(link->panel_cntl);
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (abms[i] != NULL)
+			abms[i]->funcs->abm_init(abms[i], backlight);
+	}
+
+	/* power AFMT HDMI memory TODO: may move to dis/en output save power*/
+	REG_WRITE(DIO_MEM_PWR_CTRL, 0);
+
+	if (!dc->debug.disable_clock_gate) {
+		/* enable all DCN clock gating */
+		REG_WRITE(DCCG_GATE_DISABLE_CNTL, 0);
+
+		REG_WRITE(DCCG_GATE_DISABLE_CNTL2, 0);
+
+		REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
+	}
+
+	if (dc->clk_mgr->funcs->notify_wm_ranges)
+		dc->clk_mgr->funcs->notify_wm_ranges(dc->clk_mgr);
+
+	if (dc->clk_mgr->funcs->set_hard_max_memclk)
+		dc->clk_mgr->funcs->set_hard_max_memclk(dc->clk_mgr);
+}
+
+void dcn30_set_avmute(struct pipe_ctx *pipe_ctx, bool enable)
+{
+	if (pipe_ctx == NULL)
+		return;
+
+	if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal) && pipe_ctx->stream_res.stream_enc != NULL)
+		pipe_ctx->stream_res.stream_enc->funcs->set_avmute(
+				pipe_ctx->stream_res.stream_enc,
+				enable);
+}
+
+void dcn30_update_info_frame(struct pipe_ctx *pipe_ctx)
+{
+	bool is_hdmi_tmds;
+	bool is_dp;
+
+	ASSERT(pipe_ctx->stream);
+
+	if (pipe_ctx->stream_res.stream_enc == NULL)
+		return;  /* this is not root pipe */
+
+	is_hdmi_tmds = dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal);
+	is_dp = dc_is_dp_signal(pipe_ctx->stream->signal);
+
+	if (!is_hdmi_tmds)
+		return;
+
+	if (is_hdmi_tmds)
+		pipe_ctx->stream_res.stream_enc->funcs->update_hdmi_info_packets(
+			pipe_ctx->stream_res.stream_enc,
+			&pipe_ctx->stream_res.encoder_info_frame);
+	else
+		pipe_ctx->stream_res.stream_enc->funcs->update_dp_info_packets(
+			pipe_ctx->stream_res.stream_enc,
+			&pipe_ctx->stream_res.encoder_info_frame);
+}
+
+void dcn30_program_dmdata_engine(struct pipe_ctx *pipe_ctx)
+{
+	struct dc_stream_state    *stream     = pipe_ctx->stream;
+	struct hubp               *hubp       = pipe_ctx->plane_res.hubp;
+	bool                       enable     = false;
+	struct stream_encoder     *stream_enc = pipe_ctx->stream_res.stream_enc;
+	enum dynamic_metadata_mode mode       = dc_is_dp_signal(stream->signal)
+							? dmdata_dp
+							: dmdata_hdmi;
+
+	/* if using dynamic meta, don't set up generic infopackets */
+	if (pipe_ctx->stream->dmdata_address.quad_part != 0) {
+		pipe_ctx->stream_res.encoder_info_frame.hdrsmd.valid = false;
+		enable = true;
+	}
+
+	if (!hubp)
+		return;
+
+	if (!stream_enc || !stream_enc->funcs->set_dynamic_metadata)
+		return;
+
+	stream_enc->funcs->set_dynamic_metadata(stream_enc, enable,
+							hubp->inst, mode);
+}
+
+bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
+{
+	unsigned int surface_size;
+
+	if (!dc->ctx->dmub_srv)
+		return false;
+
+	if (enable) {
+		if (dc->current_state
+				&& dc->current_state->stream_count == 1 // single display only
+				&& dc->current_state->stream_status[0].plane_count == 1 // single surface only
+				&& dc->current_state->stream_status[0].plane_states[0]->address.page_table_base.quad_part == 0 // no VM
+				// Only 8 and 16 bit formats
+				&& dc->current_state->stream_status[0].plane_states[0]->format <= SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F
+				&& dc->current_state->stream_status[0].plane_states[0]->format >= SURFACE_PIXEL_FORMAT_GRPH_ARGB8888) {
+
+			surface_size = dc->current_state->stream_status[0].plane_states[0]->plane_size.surface_pitch *
+					dc->current_state->stream_status[0].plane_states[0]->plane_size.surface_size.height *
+					(dc->current_state->stream_status[0].plane_states[0]->format >= SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616 ? 8 : 4);
+
+		}
+
+		return false;
+	}
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
new file mode 100644
index 000000000000..a4989f5ac4e9
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
@@ -0,0 +1,70 @@
+/*
+* Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_HWSS_DCN30_H__
+#define __DC_HWSS_DCN30_H__
+
+#include "hw_sequencer_private.h"
+
+struct dc;
+
+void dcn30_init_hw(struct dc *dc);
+void dcn30_program_all_writeback_pipes_in_tree(
+		struct dc *dc,
+		const struct dc_stream_state *stream,
+		struct dc_state *context);
+void dcn30_update_writeback(
+		struct dc *dc,
+		struct dc_writeback_info *wb_info,
+		struct dc_state *context);
+void dcn30_enable_writeback(
+		struct dc *dc,
+		struct dc_writeback_info *wb_info,
+		struct dc_state *context);
+void dcn30_disable_writeback(
+		struct dc *dc,
+		unsigned int dwb_pipe_inst);
+
+bool dcn30_mmhubbub_warmup(
+	struct dc *dc,
+	unsigned int num_dwb,
+	struct dc_writeback_info *wb_info);
+
+bool dcn30_set_blend_lut(struct pipe_ctx *pipe_ctx,
+		const struct dc_plane_state *plane_state);
+
+bool dcn30_set_input_transfer_func(struct dc *dc,
+				struct pipe_ctx *pipe_ctx,
+				const struct dc_plane_state *plane_state);
+bool dcn30_set_output_transfer_func(struct dc *dc,
+				struct pipe_ctx *pipe_ctx,
+				const struct dc_stream_state *stream);
+void dcn30_set_avmute(struct pipe_ctx *pipe_ctx, bool enable);
+void dcn30_update_info_frame(struct pipe_ctx *pipe_ctx);
+void dcn30_program_dmdata_engine(struct pipe_ctx *pipe_ctx);
+
+bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable);
+
+#endif /* __DC_HWSS_DCN30_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index c7fd702a4a87..654dcdb4aba6 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -217,6 +217,10 @@ struct resource_pool {
 	struct dmcu *dmcu;
 	struct dmub_psr *psr;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	struct abm *multiple_abms[MAX_PIPES];
+#endif
+
 	const struct resource_funcs *funcs;
 	const struct resource_caps *res_cap;
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h
index 553f81c731f7..aeab7fd782b8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h
@@ -75,6 +75,11 @@ struct mcif_wb {
 
 struct mcif_wb_funcs {
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	void (*warmup_mcif)(
+		struct mcif_wb *mcif_wb,
+		struct mcif_warmup_params *params);
+#endif
 	void (*enable_mcif)(struct mcif_wb *mcif_wb);
 
 	void (*disable_mcif)(struct mcif_wb *mcif_wb);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
index 4f9216c96e59..066a2a723c12 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
@@ -205,6 +205,10 @@ struct hw_sequencer_funcs {
 
 	void (*set_pipe)(struct pipe_ctx *pipe_ctx);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	/* Idle Optimization Related */
+	bool (*apply_idle_power_optimizations)(struct dc *dc, bool enable);
+#endif
 
 };
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

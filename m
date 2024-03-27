Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F788DE31
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E808C10FB4B;
	Wed, 27 Mar 2024 12:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YAC7/zo2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8348110FB49;
 Wed, 27 Mar 2024 12:14:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB57861507;
 Wed, 27 Mar 2024 12:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C66BC43394;
 Wed, 27 Mar 2024 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541660;
 bh=dPHogu0zPYCRx23gWg8pJyYRaJCr/jSDu73tRKXeMRg=;
 h=From:To:Cc:Subject:Date:From;
 b=YAC7/zo2oY4gaVBxlr427768M5tFyeMpHETFHoyoozfD6dogAVsndctSMWGa+18Oq
 gD3svoR9mj8ny8WgFH/6h2I7JifohZQR9tgZC7xmY53d9G5M91kCrGmj4jGhrx6Mpn
 a8VjZrCotaw06qEabgvsW3OS9FuNrtq7j56+qThwFWd4bloEey+dEMTd6vp8+zX+ZA
 1ogF4iE5scV3p9DJwKMIGaIDGmLqV78/A0j/r6ozdDplrDs+z7xXhXbF2jLJ5D9eqr
 SSqfdc8Wbjvvv8dQFBhFap8Ce50cXNEMNDT00y97qiyZ1VgLxx0ZiHufWR42fgoL+X
 FCL5QC1jEpTdA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	wenjing.liu@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Implement
 wait_for_odm_update_pending_complete" failed to apply to 6.1-stable tree
Date: Wed, 27 Mar 2024 08:14:17 -0400
Message-ID: <20240327121418.2830995-1-sashal@kernel.org>
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

From 2d7f3d1a5866705be2393150e1ffdf67030ab88d Mon Sep 17 00:00:00 2001
From: Wenjing Liu <wenjing.liu@amd.com>
Date: Fri, 23 Feb 2024 15:38:40 -0500
Subject: [PATCH] drm/amd/display: Implement
 wait_for_odm_update_pending_complete

[WHY]
Odm update is doubled buffered. We need to wait for ODM update to be
completed before optimizing bandwidth or programming new udpates.

[HOW]
implement wait_for_odm_update_pending_complete function to wait for:
1. odm configuration update is no longer pending in timing generator.
2. no pending dpg pattern update for each active OPP.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 56 ++++++++++++++++++-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_opp.c  |  1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_opp.c  | 14 +++++
 .../gpu/drm/amd/display/dc/dcn20/dcn20_opp.h  |  2 +
 .../drm/amd/display/dc/dcn201/dcn201_opp.c    |  1 +
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  4 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h   |  3 +
 .../amd/display/dc/inc/hw/timing_generator.h  |  1 +
 .../amd/display/dc/optc/dcn10/dcn10_optc.h    |  3 +-
 .../amd/display/dc/optc/dcn32/dcn32_optc.c    |  8 +++
 .../amd/display/dc/optc/dcn32/dcn32_optc.h    |  1 +
 11 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 958552a8605ff..e7dc128f6284b 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1302,6 +1302,54 @@ static void disable_vbios_mode_if_required(
 	}
 }
 
+/**
+ * wait_for_blank_complete - wait for all active OPPs to finish pending blank
+ * pattern updates
+ *
+ * @dc: [in] dc reference
+ * @context: [in] hardware context in use
+ */
+static void wait_for_blank_complete(struct dc *dc,
+		struct dc_state *context)
+{
+	struct pipe_ctx *opp_head;
+	struct dce_hwseq *hws = dc->hwseq;
+	int i;
+
+	if (!hws->funcs.wait_for_blank_complete)
+		return;
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		opp_head = &context->res_ctx.pipe_ctx[i];
+
+		if (!resource_is_pipe_type(opp_head, OPP_HEAD) ||
+				dc_state_get_pipe_subvp_type(context, opp_head) == SUBVP_PHANTOM)
+			continue;
+
+		hws->funcs.wait_for_blank_complete(opp_head->stream_res.opp);
+	}
+}
+
+static void wait_for_odm_update_pending_complete(struct dc *dc, struct dc_state *context)
+{
+	struct pipe_ctx *otg_master;
+	struct timing_generator *tg;
+	int i;
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		otg_master = &context->res_ctx.pipe_ctx[i];
+		if (!resource_is_pipe_type(otg_master, OTG_MASTER) ||
+				dc_state_get_pipe_subvp_type(context, otg_master) == SUBVP_PHANTOM)
+			continue;
+		tg = otg_master->stream_res.tg;
+		if (tg->funcs->wait_odm_doublebuffer_pending_clear)
+			tg->funcs->wait_odm_doublebuffer_pending_clear(tg);
+	}
+
+	/* ODM update may require to reprogram blank pattern for each OPP */
+	wait_for_blank_complete(dc, context);
+}
+
 static void wait_for_no_pipes_pending(struct dc *dc, struct dc_state *context)
 {
 	int i;
@@ -1993,6 +2041,11 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 		context->stream_count == 0) {
 		/* Must wait for no flips to be pending before doing optimize bw */
 		wait_for_no_pipes_pending(dc, context);
+		/*
+		 * optimized dispclk depends on ODM setup. Need to wait for ODM
+		 * update pending complete before optimizing bandwidth.
+		 */
+		wait_for_odm_update_pending_complete(dc, context);
 		/* pplib is notified if disp_num changed */
 		dc->hwss.optimize_bandwidth(dc, context);
 		/* Need to do otg sync again as otg could be out of sync due to otg
@@ -3496,7 +3549,7 @@ static void commit_planes_for_stream_fast(struct dc *dc,
 		top_pipe_to_program->stream->update_flags.raw = 0;
 }
 
-static void wait_for_outstanding_hw_updates(struct dc *dc, const struct dc_state *dc_context)
+static void wait_for_outstanding_hw_updates(struct dc *dc, struct dc_state *dc_context)
 {
 /*
  * This function calls HWSS to wait for any potentially double buffered
@@ -3534,6 +3587,7 @@ static void wait_for_outstanding_hw_updates(struct dc *dc, const struct dc_state
 			}
 		}
 	}
+	wait_for_odm_update_pending_complete(dc, dc_context);
 }
 
 static void commit_planes_for_stream(struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c
index 48a40dcc7050b..5838a11efd00c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c
@@ -384,6 +384,7 @@ static const struct opp_funcs dcn10_opp_funcs = {
 		.opp_set_disp_pattern_generator = NULL,
 		.opp_program_dpg_dimensions = NULL,
 		.dpg_is_blanked = NULL,
+		.dpg_is_pending = NULL,
 		.opp_destroy = opp1_destroy
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.c
index 0784d01986610..fbf1b6370eb23 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.c
@@ -337,6 +337,19 @@ bool opp2_dpg_is_blanked(struct output_pixel_processor *opp)
 		(double_buffer_pending == 0);
 }
 
+bool opp2_dpg_is_pending(struct output_pixel_processor *opp)
+{
+	struct dcn20_opp *oppn20 = TO_DCN20_OPP(opp);
+	uint32_t double_buffer_pending;
+	uint32_t dpg_en;
+
+	REG_GET(DPG_CONTROL, DPG_EN, &dpg_en);
+
+	REG_GET(DPG_STATUS, DPG_DOUBLE_BUFFER_PENDING, &double_buffer_pending);
+
+	return (dpg_en == 1 && double_buffer_pending == 1);
+}
+
 void opp2_program_left_edge_extra_pixel (
 		struct output_pixel_processor *opp,
 		bool count)
@@ -363,6 +376,7 @@ static struct opp_funcs dcn20_opp_funcs = {
 		.opp_set_disp_pattern_generator = opp2_set_disp_pattern_generator,
 		.opp_program_dpg_dimensions = opp2_program_dpg_dimensions,
 		.dpg_is_blanked = opp2_dpg_is_blanked,
+		.dpg_is_pending = opp2_dpg_is_pending,
 		.opp_dpg_set_blank_color = opp2_dpg_set_blank_color,
 		.opp_destroy = opp1_destroy,
 		.opp_program_left_edge_extra_pixel = opp2_program_left_edge_extra_pixel,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.h
index 3ab221bdd27dd..8f186abd558db 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.h
@@ -159,6 +159,8 @@ void opp2_program_dpg_dimensions(
 
 bool opp2_dpg_is_blanked(struct output_pixel_processor *opp);
 
+bool opp2_dpg_is_pending(struct output_pixel_processor *opp);
+
 void opp2_dpg_set_blank_color(
 		struct output_pixel_processor *opp,
 		const struct tg_color *color);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c
index 8e77db46a4090..6a71ba3dfc632 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c
@@ -50,6 +50,7 @@ static struct opp_funcs dcn201_opp_funcs = {
 		.opp_set_disp_pattern_generator = opp2_set_disp_pattern_generator,
 		.opp_program_dpg_dimensions = opp2_program_dpg_dimensions,
 		.dpg_is_blanked = opp2_dpg_is_blanked,
+		.dpg_is_pending = opp2_dpg_is_pending,
 		.opp_dpg_set_blank_color = opp2_dpg_set_blank_color,
 		.opp_destroy = opp1_destroy,
 		.opp_program_left_edge_extra_pixel = opp2_program_left_edge_extra_pixel,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 40098d9f70cbc..8b3536c380b8d 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -2452,7 +2452,7 @@ bool dcn20_wait_for_blank_complete(
 	int counter;
 
 	for (counter = 0; counter < 1000; counter++) {
-		if (opp->funcs->dpg_is_blanked(opp))
+		if (!opp->funcs->dpg_is_pending(opp))
 			break;
 
 		udelay(100);
@@ -2463,7 +2463,7 @@ bool dcn20_wait_for_blank_complete(
 		return false;
 	}
 
-	return true;
+	return opp->funcs->dpg_is_blanked(opp);
 }
 
 bool dcn20_dmdata_status_done(struct pipe_ctx *pipe_ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/opp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/opp.h
index aee5372e292c5..d89c92370d5b3 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/opp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/opp.h
@@ -337,6 +337,9 @@ struct opp_funcs {
 	bool (*dpg_is_blanked)(
 			struct output_pixel_processor *opp);
 
+	bool (*dpg_is_pending)(struct output_pixel_processor *opp);
+
+
 	void (*opp_dpg_set_blank_color)(
 			struct output_pixel_processor *opp,
 			const struct tg_color *color);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
index d98d72f35be5b..ffad8fe16c54d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
@@ -331,6 +331,7 @@ struct timing_generator_funcs {
 
 	void (*init_odm)(struct timing_generator *tg);
 	void (*wait_drr_doublebuffer_pending_clear)(struct timing_generator *tg);
+	void (*wait_odm_doublebuffer_pending_clear)(struct timing_generator *tg);
 };
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h
index ab81594a7fadc..6c2e84d3967fc 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h
@@ -557,7 +557,8 @@ struct dcn_optc_registers {
 	type OTG_CRC_DATA_STREAM_SPLIT_MODE;\
 	type OTG_CRC_DATA_FORMAT;\
 	type OTG_V_TOTAL_LAST_USED_BY_DRR;\
-	type OTG_DRR_TIMING_DBUF_UPDATE_PENDING;
+	type OTG_DRR_TIMING_DBUF_UPDATE_PENDING;\
+	type OTG_H_TIMING_DIV_MODE_DB_UPDATE_PENDING;
 
 #define TG_REG_FIELD_LIST_DCN3_2(type) \
 	type OTG_H_TIMING_DIV_MODE_MANUAL;
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
index 8234935433254..f07a4c7e48bc2 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
@@ -122,6 +122,13 @@ void optc32_get_odm_combine_segments(struct timing_generator *tg, int *odm_combi
 	}
 }
 
+void optc32_wait_odm_doublebuffer_pending_clear(struct timing_generator *tg)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(tg);
+
+	REG_WAIT(OTG_DOUBLE_BUFFER_CONTROL, OTG_H_TIMING_DIV_MODE_DB_UPDATE_PENDING, 0, 2, 50000);
+}
+
 void optc32_set_h_timing_div_manual_mode(struct timing_generator *optc, bool manual_mode)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
@@ -345,6 +352,7 @@ static struct timing_generator_funcs dcn32_tg_funcs = {
 		.set_odm_bypass = optc32_set_odm_bypass,
 		.set_odm_combine = optc32_set_odm_combine,
 		.get_odm_combine_segments = optc32_get_odm_combine_segments,
+		.wait_odm_doublebuffer_pending_clear = optc32_wait_odm_doublebuffer_pending_clear,
 		.set_h_timing_div_manual_mode = optc32_set_h_timing_div_manual_mode,
 		.get_optc_source = optc2_get_optc_source,
 		.set_out_mux = optc3_set_out_mux,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h
index 8ce3b178cab06..0c2c146955619 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h
@@ -183,5 +183,6 @@ void optc32_set_h_timing_div_manual_mode(struct timing_generator *optc, bool man
 void optc32_get_odm_combine_segments(struct timing_generator *tg, int *odm_combine_segments);
 void optc32_set_odm_bypass(struct timing_generator *optc,
 		const struct dc_crtc_timing *dc_crtc_timing);
+void optc32_wait_odm_doublebuffer_pending_clear(struct timing_generator *tg);
 
 #endif /* __DC_OPTC_DCN32_H__ */
-- 
2.43.0





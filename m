Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3646A36AC
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Feb 2023 03:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0B910E2A5;
	Mon, 27 Feb 2023 02:03:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE3610E295;
 Mon, 27 Feb 2023 02:03:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77DAF60CFA;
 Mon, 27 Feb 2023 02:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332F7C4339B;
 Mon, 27 Feb 2023 02:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463422;
 bh=evSKf+g6FfKT5ycXth9R2zqOmzfES6JKtu2kvL91xZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lD795nHykP24vkiKZG+/nl51Dwcb6uPYC0wOfyCFx00SEH/hVwwg0JYnBe05DtJhi
 4y1FQ1S+peBQlJvPUetM/vPnoSlo1kHZpHtPi2rc+m3vII2xYP3ub7L/t3AkVQS6y7
 NMVmQcwVFcpAiT9hn5Q1zTfbKNJcJzUwErr4NCyfb4SzX5H1V4MgvaQ8xMkil2RJP1
 88B9SOWDKiciTzEBkAqmx/bZIVo4Q7M9TGMTGmRHNU9jGpJ75tPkBlnHrRlP3s5+LI
 hj/c6JH2C36aQ/kUe/fl19p8BDX057IBwUQBOYglKKnV6oymibNf6fUUe1sdIHszoE
 9oaVe2Ou0RHoA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 46/60] drm/amd/display: Do not commit pipe when
 updating DRR
Date: Sun, 26 Feb 2023 21:00:31 -0500
Message-Id: <20230227020045.1045105-46-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: felipe.clark@amd.com, aric.cyr@amd.com, samson.tam@amd.com,
 Jun Lei <Jun.Lei@amd.com>, Josip.Pavic@amd.com,
 Sasha Levin <sashal@kernel.org>, jiapeng.chong@linux.alibaba.com,
 airlied@gmail.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, Alvin.Lee2@amd.com, jdhillon@amd.com,
 harry.wentland@amd.com, HaoPing.Liu@amd.com, sunpeng.li@amd.com,
 Duncan.Ma@amd.com, harry.vanzylldejong@amd.com, Dillon.Varone@amd.com,
 dri-devel@lists.freedesktop.org, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com, daniel@ffwll.ch,
 Wayne.Lin@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wesley Chalmers <Wesley.Chalmers@amd.com>

[ Upstream commit 8f0d304d21b351d65e8c434c5399a40231876ba1 ]

[WHY]
DRR and Pipe cannot be updated on
the same frame, or else underflow will
occur.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Wesley Chalmers <Wesley.Chalmers@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c          | 15 +++++++++++++++
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h |  3 ++-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c |  9 +++++++++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h |  2 ++
 .../drm/amd/display/dc/inc/hw/timing_generator.h  |  1 +
 5 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index c03e86e49fea3..698ef50e83f3f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3335,6 +3335,21 @@ static void commit_planes_for_stream(struct dc *dc,
 
 	dc_z10_restore(dc);
 
+	if (update_type == UPDATE_TYPE_FULL) {
+		/* wait for all double-buffer activity to clear on all pipes */
+		int pipe_idx;
+
+		for (pipe_idx = 0; pipe_idx < dc->res_pool->pipe_count; pipe_idx++) {
+			struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[pipe_idx];
+
+			if (!pipe_ctx->stream)
+				continue;
+
+			if (pipe_ctx->stream_res.tg->funcs->wait_drr_doublebuffer_pending_clear)
+				pipe_ctx->stream_res.tg->funcs->wait_drr_doublebuffer_pending_clear(pipe_ctx->stream_res.tg);
+		}
+	}
+
 	if (get_seamless_boot_stream_count(context) > 0 && surface_count > 0) {
 		/* Optimize seamless boot flag keeps clocks and watermarks high until
 		 * first flip. After first flip, optimization is required to lower
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
index 88ac5f6f4c96c..0b37bb0e184b2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
@@ -519,7 +519,8 @@ struct dcn_optc_registers {
 	type OTG_CRC_DATA_STREAM_COMBINE_MODE;\
 	type OTG_CRC_DATA_STREAM_SPLIT_MODE;\
 	type OTG_CRC_DATA_FORMAT;\
-	type OTG_V_TOTAL_LAST_USED_BY_DRR;
+	type OTG_V_TOTAL_LAST_USED_BY_DRR;\
+	type OTG_DRR_TIMING_DBUF_UPDATE_PENDING;
 
 #define TG_REG_FIELD_LIST_DCN3_2(type) \
 	type OTG_H_TIMING_DIV_MODE_MANUAL;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
index 867d60151aebb..08b92715e2e64 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
@@ -291,6 +291,14 @@ static void optc3_set_timing_double_buffer(struct timing_generator *optc, bool e
 		   OTG_DRR_TIMING_DBUF_UPDATE_MODE, mode);
 }
 
+void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_WAIT(OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_PENDING, 0, 2, 100000); /* 1 vupdate at 5hz */
+
+}
+
 void optc3_set_vtotal_min_max(struct timing_generator *optc, int vtotal_min, int vtotal_max)
 {
 	optc1_set_vtotal_min_max(optc, vtotal_min, vtotal_max);
@@ -360,6 +368,7 @@ static struct timing_generator_funcs dcn30_tg_funcs = {
 		.program_manual_trigger = optc2_program_manual_trigger,
 		.setup_manual_trigger = optc2_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
+		.wait_drr_doublebuffer_pending_clear = optc3_wait_drr_doublebuffer_pending_clear,
 };
 
 void dcn30_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
index dd45a5499b078..fb06dc9a48937 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
@@ -279,6 +279,7 @@
 	SF(OTG0_OTG_DRR_TRIGGER_WINDOW, OTG_DRR_TRIGGER_WINDOW_END_X, mask_sh),\
 	SF(OTG0_OTG_DRR_V_TOTAL_CHANGE, OTG_DRR_V_TOTAL_CHANGE_LIMIT, mask_sh),\
 	SF(OTG0_OTG_H_TIMING_CNTL, OTG_H_TIMING_DIV_BY2, mask_sh),\
+	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_PENDING, mask_sh),\
 	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_MODE, mask_sh),\
 	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_BLANK_DATA_DOUBLE_BUFFER_EN, mask_sh)
 
@@ -317,6 +318,7 @@
 	SF(OTG0_OTG_DRR_TRIGGER_WINDOW, OTG_DRR_TRIGGER_WINDOW_END_X, mask_sh),\
 	SF(OTG0_OTG_DRR_V_TOTAL_CHANGE, OTG_DRR_V_TOTAL_CHANGE_LIMIT, mask_sh),\
 	SF(OTG0_OTG_H_TIMING_CNTL, OTG_H_TIMING_DIV_MODE, mask_sh),\
+	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_PENDING, mask_sh),\
 	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_MODE, mask_sh)
 
 void dcn30_timing_generator_init(struct optc *optc1);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
index 0e42e721dd15a..1d9f9c53d2bd6 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
@@ -331,6 +331,7 @@ struct timing_generator_funcs {
 			uint32_t vtotal_change_limit);
 
 	void (*init_odm)(struct timing_generator *tg);
+	void (*wait_drr_doublebuffer_pending_clear)(struct timing_generator *tg);
 };
 
 #endif
-- 
2.39.0


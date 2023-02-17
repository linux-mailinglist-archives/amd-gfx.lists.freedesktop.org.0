Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0443269B239
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Feb 2023 19:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8148710E1E5;
	Fri, 17 Feb 2023 18:15:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5380610E1E5;
 Fri, 17 Feb 2023 18:15:25 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PJKjm4mVWzDsQM;
 Fri, 17 Feb 2023 18:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1676657725; bh=RIdk4vMAi400PDFsREF0E6TNStzaxIt888KOAWi7c24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Iqc/vA5DXRKXKnUCJoGSpjT996Y0xxaSP8zsijUXX+jVZhpNY39brf74pa3r3cccy
 V3WQNoAaXgMk0VWpPDVG1jCN+9ICrJferaggOykK/6teWZUNt6MMi7iH9R26kr9zvC
 h5XKD28eNCoLnjHPxzRZk4UoWdgCPVE7dfEL73GA=
X-Riseup-User-ID: 2117E8E506705711E1DB2B3B2F4F5DB4FAFC869B3061256CCB3561CA07B77A11
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PJKjb4gwgz1y8Z;
 Fri, 17 Feb 2023 18:15:14 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/amd/display: Remove unused local variables
Date: Fri, 17 Feb 2023 15:14:08 -0300
Message-Id: <20230217181409.218008-3-arthurgrillo@riseup.net>
In-Reply-To: <20230217181409.218008-1-arthurgrillo@riseup.net>
References: <20230217181409.218008-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Arthur Grillo <arthurgrillo@riseup.net>,
 mairacanal@riseup.net, daniel@ffwll.ch, harry.wentland@amd.com,
 alexander.deucher@amd.com, andrealmeid@riseup.net, airlied@gmail.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Remove local variables that were just set but were never used. This
decrease the number of -Wunused-but-set-variable warnings.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c  | 3 +--
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c         | 7 -------
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c       | 2 --
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c          | 2 --
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c          | 4 ----
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c         | 3 ---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c      | 5 +----
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c  | 4 ----
 .../drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c  | 2 --
 .../drm/amd/display/dc/link/protocols/link_dp_capability.c | 4 ----
 10 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
index c4287147b853..ee08b545aaea 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
@@ -1219,7 +1219,6 @@ void dcn10_link_encoder_update_mst_stream_allocation_table(
 	const struct link_mst_stream_allocation_table *table)
 {
 	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
-	uint32_t value0 = 0;
 	uint32_t value1 = 0;
 	uint32_t value2 = 0;
 	uint32_t slots = 0;
@@ -1321,7 +1320,7 @@ void dcn10_link_encoder_update_mst_stream_allocation_table(
 	do {
 		udelay(10);
 
-		value0 = REG_READ(DP_MSE_SAT_UPDATE);
+		REG_READ(DP_MSE_SAT_UPDATE);
 
 		REG_GET(DP_MSE_SAT_UPDATE,
 				DP_MSE_SAT_UPDATE, &value1);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
index f50ab961bc17..a7268027a472 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
@@ -185,13 +185,6 @@ static bool dpp201_get_optimal_number_of_taps(
 		struct scaler_data *scl_data,
 		const struct scaling_taps *in_taps)
 {
-	uint32_t pixel_width;
-
-	if (scl_data->viewport.width > scl_data->recout.width)
-		pixel_width = scl_data->recout.width;
-	else
-		pixel_width = scl_data->viewport.width;
-
 	if (scl_data->viewport.width  != scl_data->h_active &&
 		scl_data->viewport.height != scl_data->v_active &&
 		dpp->caps->dscl_data_proc_format == DSCL_DATA_PRCESSING_FIXED_FORMAT &&
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
index 61bcfa03c4e7..1aeb04fbd89d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
@@ -541,8 +541,6 @@ void dcn201_pipe_control_lock(
 	bool lock)
 {
 	struct dce_hwseq *hws = dc->hwseq;
-	struct hubp *hubp = NULL;
-	hubp = dc->res_pool->hubps[pipe->pipe_idx];
 	/* use TG master update lock to lock everything on the TG
 	 * therefore only top pipe need to lock
 	 */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
index 95528e5ef89e..55e388c4c98b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
@@ -123,7 +123,6 @@ void afmt3_se_audio_setup(
 {
 	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
 
-	uint32_t speakers = 0;
 	uint32_t channels = 0;
 
 	ASSERT(audio_info);
@@ -131,7 +130,6 @@ void afmt3_se_audio_setup(
 	if (audio_info == NULL)
 		return;
 
-	speakers = audio_info->flags.info.ALLSPEAKERS;
 	channels = speakers_to_channels(audio_info->flags.speaker_flags).all;
 
 	/* setup the audio stream source select (audio -> dig mapping) */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
index dc3e8df706b3..e46bbe7ddcc9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
@@ -47,13 +47,9 @@ void hubp3_set_vm_system_aperture_settings(struct hubp *hubp,
 {
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
 
-	PHYSICAL_ADDRESS_LOC mc_vm_apt_default;
 	PHYSICAL_ADDRESS_LOC mc_vm_apt_low;
 	PHYSICAL_ADDRESS_LOC mc_vm_apt_high;
 
-	// The format of default addr is 48:12 of the 48 bit addr
-	mc_vm_apt_default.quad_part = apt->sys_default.quad_part >> 12;
-
 	// The format of high/low are 48:18 of the 48 bit addr
 	mc_vm_apt_low.quad_part = apt->sys_low.quad_part >> 18;
 	mc_vm_apt_high.quad_part = apt->sys_high.quad_part >> 18;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 444f9fad3de6..1d848d14508b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -322,13 +322,10 @@ void dcn30_enable_writeback(
 {
 	struct dwbc *dwb;
 	struct mcif_wb *mcif_wb;
-	struct timing_generator *optc;
 
 	dwb = dc->res_pool->dwbc[wb_info->dwb_pipe_inst];
 	mcif_wb = dc->res_pool->mcif_wb[wb_info->dwb_pipe_inst];
 
-	/* set the OPTC source mux */
-	optc = dc->res_pool->timing_generators[dwb->otg_inst];
 	DC_LOG_DWB("%s dwb_pipe_inst = %d, mpcc_inst = %d",\
 		__func__, wb_info->dwb_pipe_inst,\
 		wb_info->mpcc_inst);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 74e50c09bb62..e997bb98b43d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -1611,7 +1611,6 @@ bool dcn32_acquire_post_bldn_3dlut(
 		struct dc_transfer_func **shaper)
 {
 	bool ret = false;
-	union dc_3dlut_state *state;
 
 	ASSERT(*lut == NULL && *shaper == NULL);
 	*lut = NULL;
@@ -1620,7 +1619,6 @@ bool dcn32_acquire_post_bldn_3dlut(
 	if (!res_ctx->is_mpc_3dlut_acquired[mpcc_id]) {
 		*lut = pool->mpc_lut[mpcc_id];
 		*shaper = pool->mpc_shaper[mpcc_id];
-		state = &pool->mpc_lut[mpcc_id]->state;
 		res_ctx->is_mpc_3dlut_acquired[mpcc_id] = true;
 		ret = true;
 	}
@@ -1913,7 +1911,6 @@ int dcn32_populate_dml_pipes_from_context(
 	struct resource_context *res_ctx = &context->res_ctx;
 	struct pipe_ctx *pipe;
 	bool subvp_in_use = false;
-	uint8_t is_pipe_split_expected[MAX_PIPES] = {0};
 	struct dc_crtc_timing *timing;
 
 	dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
@@ -2002,7 +1999,7 @@ int dcn32_populate_dml_pipes_from_context(
 		}
 
 		DC_FP_START();
-		is_pipe_split_expected[i] = dcn32_predict_pipe_split(context, &pipes[pipe_cnt]);
+		dcn32_predict_pipe_split(context, &pipes[pipe_cnt]);
 		DC_FP_END();
 
 		pipe_cnt++;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index 3a2d7bcc4b6d..a616cf078cf4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -59,25 +59,21 @@ uint32_t dcn32_helper_calculate_mall_bytes_for_cursor(
 {
 	struct hubp *hubp = pipe_ctx->plane_res.hubp;
 	uint32_t cursor_size = hubp->curs_attr.pitch * hubp->curs_attr.height;
-	uint32_t cursor_bpp = 4;
 	uint32_t cursor_mall_size_bytes = 0;
 
 	switch (pipe_ctx->stream->cursor_attributes.color_format) {
 	case CURSOR_MODE_MONO:
 		cursor_size /= 2;
-		cursor_bpp = 4;
 		break;
 	case CURSOR_MODE_COLOR_1BIT_AND:
 	case CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA:
 	case CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA:
 		cursor_size *= 4;
-		cursor_bpp = 4;
 		break;
 
 	case CURSOR_MODE_COLOR_64BIT_FP_PRE_MULTIPLIED:
 	case CURSOR_MODE_COLOR_64BIT_FP_UN_PRE_MULTIPLIED:
 		cursor_size *= 8;
-		cursor_bpp = 8;
 		break;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
index 35d10b4d018b..2244e4fb8c96 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
@@ -902,7 +902,6 @@ static void dml_rq_dlg_get_dlg_params(
 	double hratio_c;
 	double vratio_l;
 	double vratio_c;
-	bool scl_enable;
 
 	unsigned int swath_width_ub_l;
 	unsigned int dpte_groups_per_row_ub_l;
@@ -1020,7 +1019,6 @@ static void dml_rq_dlg_get_dlg_params(
 	hratio_c = scl->hscl_ratio_c;
 	vratio_l = scl->vscl_ratio;
 	vratio_c = scl->vscl_ratio_c;
-	scl_enable = scl->scl_enable;
 
 	swath_width_ub_l = rq_dlg_param->rq_l.swath_width_ub;
 	dpte_groups_per_row_ub_l = rq_dlg_param->rq_l.dpte_groups_per_row_ub;
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 138e5684c7fd..1c2ce08bdece 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -276,7 +276,6 @@ static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
 		int length)
 {
 	int retry = 0;
-	union dp_downstream_port_present ds_port = { 0 };
 
 	if (!link->dpcd_caps.dpcd_rev.raw) {
 		do {
@@ -289,9 +288,6 @@ static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
 		} while (retry++ < 4 && !link->dpcd_caps.dpcd_rev.raw);
 	}
 
-	ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
-				 DP_DPCD_REV];
-
 	if (link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_VGA_CONVERTER) {
 		switch (link->dpcd_caps.branch_dev_id) {
 		/* 0010FA active dongles (DP-VGA, DP-DLDVI converters) power down
-- 
2.39.2


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D98731EABFA
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679616E370;
	Mon,  1 Jun 2020 18:29:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C106E370
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:29:40 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id n141so10066893qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w0SED8LkxYwOBjq/v+P9RIVhsfa6hq3xHcScHcCxrFs=;
 b=FQpx/vQNGUPaO/6KUdKa0n7aR/5wh9kUa7WDH1qb0Yp46mgk2Yl16LeN+wwtX8lXpC
 KojzW+X5557nUR3iHhPRZwhONz/J9x/85raosyxqMfyxYuthF0HLTZNXQPLe/V+8mvpC
 /m8d8Ocn+dv3Qec4t2eqh/SnxTGFHFMrPG24QntWbZqG+2S0BcGhn3SOsvyyiZMj4l1R
 gYut6LYUgJtW8zt6LRTn1eVrS/2SFrHkcAVwbha0ixL1xgdsyYiYvpoW9ObAvPmf8v1t
 vefJp6BuJUOrR430Nxv3F/C1Ifmcwnf/LVnnmzg9ALGBuRCH9Bd+FN5E1OYW1Mhwtbqo
 XiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w0SED8LkxYwOBjq/v+P9RIVhsfa6hq3xHcScHcCxrFs=;
 b=CzuOfKbuMX7tFM7VMTUJHeVQ7V60bfnirwCcSMxzD1LwiMt8PyO7l4zvRI/fzlXiL1
 rwx1LO/RGj2C2wf0APnhiK3Vub7jaQFWNS7Y8lkBGYB4ilYOCPra5dwmZIuUFNYdiQmp
 pk+uPjFxnJnWulYB02U4g8gRgqyFjsEyVpJak2C/SriO7/h6bd+46mNWuJ3pLrtRsDIj
 zB1IKUS5x/YGHrUwwNVoKjMEgW++b9oaiWDg8NerqDCuyP6vr+JGyTqycVoeACm6vjWO
 wir9RyaoKOgK2TPipdLP+ZvMJLsGOdnPFSke55AU0RKLmS6j8vELUTlOsF41sQeN59xX
 tZUg==
X-Gm-Message-State: AOAM532EOjZNMe25581+/ERtc37UJ711/EhR1Fwu5MclAf0uoMQ6SRUZ
 2uDZBcWIP9p3CYIqLv/FAxsKRtmD
X-Google-Smtp-Source: ABdhPJwuv4vq+yzaxBF7dSYvL4Tfky0+hekzrI8XisaqJSSLk4/UETc43CebEy5RhmjWm/RzyfhM6w==
X-Received: by 2002:a37:a847:: with SMTP id r68mr22372962qke.45.1591036178380; 
 Mon, 01 Jun 2020 11:29:38 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:29:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 180/207] drm/amd/display: Add DCN3 DIO
Date: Mon,  1 Jun 2020 14:28:59 -0400
Message-Id: <20200601182926.1267958-2-alexander.deucher@amd.com>
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

Add support for the DIO (Display IO)  block of DCN3, which entails our
stream and link encoders.

HW Blocks:

    +--------+
    |  DIO   |
    +--------+

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  14 +
 .../amd/display/dc/dcn10/dcn10_link_encoder.h |   6 +
 .../display/dc/dcn10/dcn10_stream_encoder.h   |  42 +
 .../amd/display/dc/dcn20/dcn20_link_encoder.h |   4 +
 .../display/dc/dcn30/dcn30_dio_link_encoder.c | 205 +++++
 .../display/dc/dcn30/dcn30_dio_link_encoder.h |  76 ++
 .../dc/dcn30/dcn30_dio_stream_encoder.c       | 851 ++++++++++++++++++
 .../dc/dcn30/dcn30_dio_stream_encoder.h       | 269 ++++++
 .../amd/display/dc/inc/hw/stream_encoder.h    |   4 +
 9 files changed, 1471 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.h

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index c00f656e22ff..cb5491fb326c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3133,6 +3133,11 @@ void core_link_enable_stream(
 
 	pipe_ctx->stream->link->link_state_valid = true;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+		if (pipe_ctx->stream_res.tg->funcs->set_out_mux)
+					pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, OUT_MUX_DIO);
+#endif
+
 	if (dc_is_dvi_signal(pipe_ctx->stream->signal))
 		pipe_ctx->stream_res.stream_enc->funcs->dvi_set_stream_attribute(
 			pipe_ctx->stream_res.stream_enc,
@@ -3215,6 +3220,15 @@ void core_link_enable_stream(
 					CONTROLLER_DP_TEST_PATTERN_VIDEOMODE,
 					COLOR_DEPTH_UNDEFINED);
 
+		/* This second call is needed to reconfigure the DIG
+		 * as a workaround for the incorrect value being applied
+		 * from transmitter control.
+		 */
+		if (!dc_is_virtual_signal(pipe_ctx->stream->signal))
+			stream->link->link_enc->funcs->setup(
+				stream->link->link_enc,
+				pipe_ctx->stream->signal);
+
 		dc->hwss.enable_stream(pipe_ctx);
 
 		/* Set DPS PPS SDP (AKA "info frames") */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
index 68395bcc24fd..cf59ab0034dc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
@@ -153,6 +153,12 @@ struct dcn10_link_enc_registers {
 	uint32_t RAWLANE2_DIG_PCS_XF_RX_OVRD_IN_3;
 	uint32_t RAWLANE3_DIG_PCS_XF_RX_OVRD_IN_2;
 	uint32_t RAWLANE3_DIG_PCS_XF_RX_OVRD_IN_3;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	uint32_t TMDS_DCBALANCER_CONTROL;
+	uint32_t PHYA_LINK_CNTL2;
+	uint32_t PHYB_LINK_CNTL2;
+	uint32_t PHYC_LINK_CNTL2;
+#endif
 };
 
 #define LE_SF(reg_name, field_name, post_fix)\
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
index f9b9e221c698..ed385b1477be 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
@@ -169,6 +169,14 @@ struct dcn10_stream_enc_registers {
 	uint32_t DP_SEC_METADATA_TRANSMISSION;
 	uint32_t HDMI_METADATA_PACKET_CONTROL;
 	uint32_t DP_SEC_FRAMING4;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	uint32_t DP_GSP11_CNTL;
+	uint32_t HDMI_GENERIC_PACKET_CONTROL6;
+	uint32_t HDMI_GENERIC_PACKET_CONTROL7;
+	uint32_t HDMI_GENERIC_PACKET_CONTROL8;
+	uint32_t HDMI_GENERIC_PACKET_CONTROL9;
+	uint32_t HDMI_GENERIC_PACKET_CONTROL10;
+#endif
 	uint32_t DIG_CLOCK_PATTERN;
 };
 
@@ -483,14 +491,48 @@ struct dcn10_stream_enc_registers {
 	type DP_PIXEL_COMBINE;\
 	type DP_SST_SDP_SPLITTING
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define SE_REG_FIELD_LIST_DCN3_0(type) \
+	type HDMI_GENERIC8_CONT;\
+	type HDMI_GENERIC8_SEND;\
+	type HDMI_GENERIC8_LINE;\
+	type HDMI_GENERIC9_CONT;\
+	type HDMI_GENERIC9_SEND;\
+	type HDMI_GENERIC9_LINE;\
+	type HDMI_GENERIC10_CONT;\
+	type HDMI_GENERIC10_SEND;\
+	type HDMI_GENERIC10_LINE;\
+	type HDMI_GENERIC11_CONT;\
+	type HDMI_GENERIC11_SEND;\
+	type HDMI_GENERIC11_LINE;\
+	type HDMI_GENERIC12_CONT;\
+	type HDMI_GENERIC12_SEND;\
+	type HDMI_GENERIC12_LINE;\
+	type HDMI_GENERIC13_CONT;\
+	type HDMI_GENERIC13_SEND;\
+	type HDMI_GENERIC13_LINE;\
+	type HDMI_GENERIC14_CONT;\
+	type HDMI_GENERIC14_SEND;\
+	type HDMI_GENERIC14_LINE;\
+	type DP_SEC_GSP11_PPS;\
+	type DP_SEC_GSP11_ENABLE;\
+	type DP_SEC_GSP11_LINE_NUM
+#endif
+
 struct dcn10_stream_encoder_shift {
 	SE_REG_FIELD_LIST_DCN1_0(uint8_t);
 	SE_REG_FIELD_LIST_DCN2_0(uint8_t);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	SE_REG_FIELD_LIST_DCN3_0(uint8_t);
+#endif
 };
 
 struct dcn10_stream_encoder_mask {
 	SE_REG_FIELD_LIST_DCN1_0(uint32_t);
 	SE_REG_FIELD_LIST_DCN2_0(uint32_t);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	SE_REG_FIELD_LIST_DCN3_0(uint32_t);
+#endif
 };
 
 struct dcn10_stream_encoder {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.h
index 284a1ee4d249..a6c8493001a6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.h
@@ -274,6 +274,10 @@ struct mpll_cfg {
 	bool dp_tx1_vergdrv_byp;
 	bool dp_tx2_vergdrv_byp;
 	bool dp_tx3_vergdrv_byp;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	uint32_t tx_peaking_lvl;
+	uint32_t ctr_reqs_pll;
+#endif
 
 
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.c
new file mode 100644
index 000000000000..c29326e9856a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.c
@@ -0,0 +1,205 @@
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
+#include "reg_helper.h"
+
+#include "core_types.h"
+#include "link_encoder.h"
+#include "dcn30_dio_link_encoder.h"
+#include "stream_encoder.h"
+#include "i2caux_interface.h"
+#include "dc_bios_types.h"
+/* #include "dcn3ag/dcn3ag_phy_fw.h" */
+
+#include "gpio_service_interface.h"
+
+#define CTX \
+	enc10->base.ctx
+#define DC_LOGGER \
+	enc10->base.ctx->logger
+
+#define REG(reg)\
+	(enc10->link_regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	enc10->link_shift->field_name, enc10->link_mask->field_name
+
+#define IND_REG(index) \
+	(enc10->link_regs->index)
+
+
+static bool dcn30_link_encoder_validate_output_with_stream(
+	struct link_encoder *enc,
+	const struct dc_stream_state *stream)
+{
+		return dcn10_link_encoder_validate_output_with_stream(enc, stream);
+}
+
+static const struct link_encoder_funcs dcn30_link_enc_funcs = {
+	.read_state = link_enc2_read_state,
+	.validate_output_with_stream =
+			dcn30_link_encoder_validate_output_with_stream,
+	.hw_init = enc2_hw_init,
+	.setup = dcn10_link_encoder_setup,
+	.enable_tmds_output = dcn10_link_encoder_enable_tmds_output,
+	.enable_dp_output = dcn20_link_encoder_enable_dp_output,
+	.enable_dp_mst_output = dcn10_link_encoder_enable_dp_mst_output,
+	.disable_output = dcn10_link_encoder_disable_output,
+	.dp_set_lane_settings = dcn10_link_encoder_dp_set_lane_settings,
+	.dp_set_phy_pattern = dcn10_link_encoder_dp_set_phy_pattern,
+	.update_mst_stream_allocation_table =
+		dcn10_link_encoder_update_mst_stream_allocation_table,
+	.psr_program_dp_dphy_fast_training =
+			dcn10_psr_program_dp_dphy_fast_training,
+	.psr_program_secondary_packet = dcn10_psr_program_secondary_packet,
+	.connect_dig_be_to_fe = dcn10_link_encoder_connect_dig_be_to_fe,
+	.enable_hpd = dcn10_link_encoder_enable_hpd,
+	.disable_hpd = dcn10_link_encoder_disable_hpd,
+	.is_dig_enabled = dcn10_is_dig_enabled,
+	.destroy = dcn10_link_encoder_destroy,
+	.fec_set_enable = enc2_fec_set_enable,
+	.fec_set_ready = enc2_fec_set_ready,
+	.fec_is_active = enc2_fec_is_active,
+	.get_dig_frontend = dcn10_get_dig_frontend,
+	.get_dig_mode = dcn10_get_dig_mode,
+	.is_in_alt_mode = dcn20_link_encoder_is_in_alt_mode,
+	.get_max_link_cap = dcn20_link_encoder_get_max_link_cap,
+};
+
+void dcn30_link_encoder_construct(
+	struct dcn20_link_encoder *enc20,
+	const struct encoder_init_data *init_data,
+	const struct encoder_feature_support *enc_features,
+	const struct dcn10_link_enc_registers *link_regs,
+	const struct dcn10_link_enc_aux_registers *aux_regs,
+	const struct dcn10_link_enc_hpd_registers *hpd_regs,
+	const struct dcn10_link_enc_shift *link_shift,
+	const struct dcn10_link_enc_mask *link_mask)
+{
+	struct bp_encoder_cap_info bp_cap_info = {0};
+	const struct dc_vbios_funcs *bp_funcs = init_data->ctx->dc_bios->funcs;
+	enum bp_result result = BP_RESULT_OK;
+	struct dcn10_link_encoder *enc10 = &enc20->enc10;
+
+	enc10->base.funcs = &dcn30_link_enc_funcs;
+	enc10->base.ctx = init_data->ctx;
+	enc10->base.id = init_data->encoder;
+
+	enc10->base.hpd_source = init_data->hpd_source;
+	enc10->base.connector = init_data->connector;
+
+	enc10->base.preferred_engine = ENGINE_ID_UNKNOWN;
+
+	enc10->base.features = *enc_features;
+
+	enc10->base.transmitter = init_data->transmitter;
+
+	/* set the flag to indicate whether driver poll the I2C data pin
+	 * while doing the DP sink detect
+	 */
+
+/*	if (dal_adapter_service_is_feature_supported(as,
+		FEATURE_DP_SINK_DETECT_POLL_DATA_PIN))
+		enc10->base.features.flags.bits.
+			DP_SINK_DETECT_POLL_DATA_PIN = true;*/
+
+	enc10->base.output_signals =
+		SIGNAL_TYPE_DVI_SINGLE_LINK |
+		SIGNAL_TYPE_DVI_DUAL_LINK |
+		SIGNAL_TYPE_LVDS |
+		SIGNAL_TYPE_DISPLAY_PORT |
+		SIGNAL_TYPE_DISPLAY_PORT_MST |
+		SIGNAL_TYPE_EDP |
+		SIGNAL_TYPE_HDMI_TYPE_A;
+
+	/* For DCE 8.0 and 8.1, by design, UNIPHY is hardwired to DIG_BE.
+	 * SW always assign DIG_FE 1:1 mapped to DIG_FE for non-MST UNIPHY.
+	 * SW assign DIG_FE to non-MST UNIPHY first and MST last. So prefer
+	 * DIG is per UNIPHY and used by SST DP, eDP, HDMI, DVI and LVDS.
+	 * Prefer DIG assignment is decided by board design.
+	 * For DCE 8.0, there are only max 6 UNIPHYs, we assume board design
+	 * and VBIOS will filter out 7 UNIPHY for DCE 8.0.
+	 * By this, adding DIGG should not hurt DCE 8.0.
+	 * This will let DCE 8.1 share DCE 8.0 as much as possible
+	 */
+
+	enc10->link_regs = link_regs;
+	enc10->aux_regs = aux_regs;
+	enc10->hpd_regs = hpd_regs;
+	enc10->link_shift = link_shift;
+	enc10->link_mask = link_mask;
+
+	switch (enc10->base.transmitter) {
+	case TRANSMITTER_UNIPHY_A:
+		enc10->base.preferred_engine = ENGINE_ID_DIGA;
+	break;
+	case TRANSMITTER_UNIPHY_B:
+		enc10->base.preferred_engine = ENGINE_ID_DIGB;
+	break;
+	case TRANSMITTER_UNIPHY_C:
+		enc10->base.preferred_engine = ENGINE_ID_DIGC;
+	break;
+	case TRANSMITTER_UNIPHY_D:
+		enc10->base.preferred_engine = ENGINE_ID_DIGD;
+	break;
+	case TRANSMITTER_UNIPHY_E:
+		enc10->base.preferred_engine = ENGINE_ID_DIGE;
+	break;
+	case TRANSMITTER_UNIPHY_F:
+		enc10->base.preferred_engine = ENGINE_ID_DIGF;
+	break;
+	case TRANSMITTER_UNIPHY_G:
+		enc10->base.preferred_engine = ENGINE_ID_DIGG;
+	break;
+	default:
+		ASSERT_CRITICAL(false);
+		enc10->base.preferred_engine = ENGINE_ID_UNKNOWN;
+	}
+
+	/* default to one to mirror Windows behavior */
+	enc10->base.features.flags.bits.HDMI_6GB_EN = 1;
+
+	result = bp_funcs->get_encoder_cap_info(enc10->base.ctx->dc_bios,
+						enc10->base.id, &bp_cap_info);
+
+	/* Override features with DCE-specific values */
+	if (result == BP_RESULT_OK) {
+		enc10->base.features.flags.bits.IS_HBR2_CAPABLE =
+				bp_cap_info.DP_HBR2_EN;
+		enc10->base.features.flags.bits.IS_HBR3_CAPABLE =
+				bp_cap_info.DP_HBR3_EN;
+		enc10->base.features.flags.bits.HDMI_6GB_EN = bp_cap_info.HDMI_6GB_EN;
+		enc10->base.features.flags.bits.DP_IS_USB_C =
+				bp_cap_info.DP_IS_USB_C;
+	} else {
+		DC_LOG_WARNING("%s: Failed to get encoder_cap_info from VBIOS with error code %d!\n",
+				__func__,
+				result);
+	}
+	if (enc10->base.ctx->dc->debug.hdmi20_disable) {
+		enc10->base.features.flags.bits.HDMI_6GB_EN = 0;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.h
new file mode 100644
index 000000000000..585d1ce63db1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.h
@@ -0,0 +1,76 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+#ifndef __DC_LINK_ENCODER__DCN30_H__
+#define __DC_LINK_ENCODER__DCN30_H__
+
+#include "dcn20/dcn20_link_encoder.h"
+
+#define LE_DCN3_REG_LIST(id)\
+	SRI(DIG_BE_CNTL, DIG, id), \
+	SRI(DIG_BE_EN_CNTL, DIG, id), \
+	SRI(TMDS_CTL_BITS, DIG, id), \
+	SRI(TMDS_DCBALANCER_CONTROL, DIG, id), \
+	SRI(DP_CONFIG, DP, id), \
+	SRI(DP_DPHY_CNTL, DP, id), \
+	SRI(DP_DPHY_PRBS_CNTL, DP, id), \
+	SRI(DP_DPHY_SCRAM_CNTL, DP, id),\
+	SRI(DP_DPHY_SYM0, DP, id), \
+	SRI(DP_DPHY_SYM1, DP, id), \
+	SRI(DP_DPHY_SYM2, DP, id), \
+	SRI(DP_DPHY_TRAINING_PATTERN_SEL, DP, id), \
+	SRI(DP_LINK_CNTL, DP, id), \
+	SRI(DP_LINK_FRAMING_CNTL, DP, id), \
+	SRI(DP_MSE_SAT0, DP, id), \
+	SRI(DP_MSE_SAT1, DP, id), \
+	SRI(DP_MSE_SAT2, DP, id), \
+	SRI(DP_MSE_SAT_UPDATE, DP, id), \
+	SRI(DP_SEC_CNTL, DP, id), \
+	SRI(DP_VID_STREAM_CNTL, DP, id), \
+	SRI(DP_DPHY_FAST_TRAINING, DP, id), \
+	SRI(DP_SEC_CNTL1, DP, id), \
+	SRI(DP_DPHY_BS_SR_SWAP_CNTL, DP, id), \
+	SRI(DP_DPHY_HBR2_PATTERN_CONTROL, DP, id)
+
+#define LINK_ENCODER_MASK_SH_LIST_DCN30(mask_sh) \
+	LINK_ENCODER_MASK_SH_LIST_DCN20(mask_sh)
+
+#define DPCS_DCN3_MASK_SH_LIST(mask_sh)\
+	DPCS_DCN2_MASK_SH_LIST(mask_sh),\
+	LE_SF(DPCSTX0_DPCSTX_TX_CNTL, DPCS_TX_DATA_ORDER_INVERT_18_BIT, mask_sh),\
+	LE_SF(RDPCSTX0_RDPCSTX_PHY_CNTL0, RDPCS_PHY_TX_VBOOST_LVL, mask_sh),\
+	LE_SF(RDPCSTX0_RDPCSTX_CLOCK_CNTL, RDPCS_TX_CLK_EN, mask_sh)
+
+void dcn30_link_encoder_construct(
+	struct dcn20_link_encoder *enc20,
+	const struct encoder_init_data *init_data,
+	const struct encoder_feature_support *enc_features,
+	const struct dcn10_link_enc_registers *link_regs,
+	const struct dcn10_link_enc_aux_registers *aux_regs,
+	const struct dcn10_link_enc_hpd_registers *hpd_regs,
+	const struct dcn10_link_enc_shift *link_shift,
+	const struct dcn10_link_enc_mask *link_mask);
+
+#endif /* __DC_LINK_ENCODER__DCN30_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
new file mode 100644
index 000000000000..f5e80a0db72b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
@@ -0,0 +1,851 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+#include "dc_bios_types.h"
+#include "dcn30_dio_stream_encoder.h"
+#include "reg_helper.h"
+#include "hw_shared.h"
+#include "core_types.h"
+#include <linux/delay.h>
+
+
+#define DC_LOGGER \
+		enc1->base.ctx->logger
+
+
+#define REG(reg)\
+	(enc1->regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	enc1->se_shift->field_name, enc1->se_mask->field_name
+
+#define VBI_LINE_0 0
+#define HDMI_CLOCK_CHANNEL_RATE_MORE_340M 340000
+
+#define CTX \
+	enc1->base.ctx
+
+
+void convert_dc_info_packet_to_128(
+	const struct dc_info_packet *info_packet,
+	struct dc_info_packet_128 *info_packet_128)
+{
+	unsigned int i;
+
+	info_packet_128->hb0 = info_packet->hb0;
+	info_packet_128->hb1 = info_packet->hb1;
+	info_packet_128->hb2 = info_packet->hb2;
+	info_packet_128->hb3 = info_packet->hb3;
+
+	for (i = 0; i < 32; i++) {
+		info_packet_128->sb[i] = info_packet->sb[i];
+	}
+
+}
+static void enc3_update_hdmi_info_packet(
+	struct dcn10_stream_encoder *enc1,
+	uint32_t packet_index,
+	const struct dc_info_packet *info_packet)
+{
+	uint32_t cont, send, line;
+
+	if (info_packet->valid) {
+		enc1->base.vpg->funcs->update_generic_info_packet(
+				enc1->base.vpg,
+				packet_index,
+				info_packet);
+
+		/* enable transmission of packet(s) -
+		 * packet transmission begins on the next frame */
+		cont = 1;
+		/* send packet(s) every frame */
+		send = 1;
+		/* select line number to send packets on */
+		line = 2;
+	} else {
+		cont = 0;
+		send = 0;
+		line = 0;
+	}
+
+	/* DP_SEC_GSP[x]_LINE_REFERENCE - keep default value REFER_TO_DP_SOF */
+
+	/* choose which generic packet control to use */
+	switch (packet_index) {
+	case 0:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL0,
+				HDMI_GENERIC0_CONT, cont,
+				HDMI_GENERIC0_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL1,
+				HDMI_GENERIC0_LINE, line);
+		break;
+	case 1:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL0,
+				HDMI_GENERIC1_CONT, cont,
+				HDMI_GENERIC1_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL1,
+				HDMI_GENERIC1_LINE, line);
+		break;
+	case 2:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL0,
+				HDMI_GENERIC2_CONT, cont,
+				HDMI_GENERIC2_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL2,
+				HDMI_GENERIC2_LINE, line);
+		break;
+	case 3:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL0,
+				HDMI_GENERIC3_CONT, cont,
+				HDMI_GENERIC3_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL2,
+				HDMI_GENERIC3_LINE, line);
+		break;
+	case 4:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL0,
+				HDMI_GENERIC4_CONT, cont,
+				HDMI_GENERIC4_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL3,
+				HDMI_GENERIC4_LINE, line);
+		break;
+	case 5:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL0,
+				HDMI_GENERIC5_CONT, cont,
+				HDMI_GENERIC5_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL3,
+				HDMI_GENERIC5_LINE, line);
+		break;
+	case 6:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL0,
+				HDMI_GENERIC6_CONT, cont,
+				HDMI_GENERIC6_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL4,
+				HDMI_GENERIC6_LINE, line);
+		break;
+	case 7:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL0,
+				HDMI_GENERIC7_CONT, cont,
+				HDMI_GENERIC7_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL4,
+				HDMI_GENERIC7_LINE, line);
+		break;
+	case 8:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL6,
+				HDMI_GENERIC8_CONT, cont,
+				HDMI_GENERIC8_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL7,
+				HDMI_GENERIC8_LINE, line);
+		break;
+	case 9:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL6,
+				HDMI_GENERIC9_CONT, cont,
+				HDMI_GENERIC9_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL7,
+				HDMI_GENERIC9_LINE, line);
+		break;
+	case 10:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL6,
+				HDMI_GENERIC10_CONT, cont,
+				HDMI_GENERIC10_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL8,
+				HDMI_GENERIC10_LINE, line);
+		break;
+	case 11:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL6,
+				HDMI_GENERIC11_CONT, cont,
+				HDMI_GENERIC11_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL8,
+				HDMI_GENERIC11_LINE, line);
+		break;
+	case 12:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL6,
+				HDMI_GENERIC12_CONT, cont,
+				HDMI_GENERIC12_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL9,
+				HDMI_GENERIC12_LINE, line);
+		break;
+	case 13:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL6,
+				HDMI_GENERIC13_CONT, cont,
+				HDMI_GENERIC13_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL9,
+				HDMI_GENERIC13_LINE, line);
+		break;
+	case 14:
+		REG_UPDATE_2(HDMI_GENERIC_PACKET_CONTROL6,
+				HDMI_GENERIC14_CONT, cont,
+				HDMI_GENERIC14_SEND, send);
+		REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL10,
+				HDMI_GENERIC14_LINE, line);
+		break;
+	default:
+		/* invalid HW packet index */
+		DC_LOG_WARNING(
+			"Invalid HW packet index: %s()\n",
+			__func__);
+		return;
+	}
+}
+
+static void enc3_stream_encoder_update_hdmi_info_packets(
+	struct stream_encoder *enc,
+	const struct encoder_info_frame *info_frame)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	/* for bring up, disable dp double  TODO */
+	REG_UPDATE(HDMI_DB_CONTROL, HDMI_DB_DISABLE, 1);
+	REG_UPDATE(AFMT_CNTL, AFMT_AUDIO_CLOCK_EN, 1);
+
+	/*Always add mandatory packets first followed by optional ones*/
+	enc3_update_hdmi_info_packet(enc1, 0, &info_frame->avi);
+	enc3_update_hdmi_info_packet(enc1, 5, &info_frame->hfvsif);
+	enc3_update_hdmi_info_packet(enc1, 2, &info_frame->gamut);
+	enc3_update_hdmi_info_packet(enc1, 1, &info_frame->vendor);
+	enc3_update_hdmi_info_packet(enc1, 3, &info_frame->spd);
+	enc3_update_hdmi_info_packet(enc1, 4, &info_frame->hdrsmd);
+}
+
+static void enc3_stream_encoder_stop_hdmi_info_packets(
+	struct stream_encoder *enc)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	/* stop generic packets 0,1 on HDMI */
+	REG_SET_4(HDMI_GENERIC_PACKET_CONTROL0, 0,
+		HDMI_GENERIC0_CONT, 0,
+		HDMI_GENERIC0_SEND, 0,
+		HDMI_GENERIC1_CONT, 0,
+		HDMI_GENERIC1_SEND, 0);
+	REG_SET_2(HDMI_GENERIC_PACKET_CONTROL1, 0,
+		HDMI_GENERIC0_LINE, 0,
+		HDMI_GENERIC1_LINE, 0);
+
+	/* stop generic packets 2,3 on HDMI */
+	REG_SET_4(HDMI_GENERIC_PACKET_CONTROL0, 0,
+		HDMI_GENERIC2_CONT, 0,
+		HDMI_GENERIC2_SEND, 0,
+		HDMI_GENERIC3_CONT, 0,
+		HDMI_GENERIC3_SEND, 0);
+	REG_SET_2(HDMI_GENERIC_PACKET_CONTROL2, 0,
+		HDMI_GENERIC2_LINE, 0,
+		HDMI_GENERIC3_LINE, 0);
+
+	/* stop generic packets 4,5 on HDMI */
+	REG_SET_4(HDMI_GENERIC_PACKET_CONTROL0, 0,
+		HDMI_GENERIC4_CONT, 0,
+		HDMI_GENERIC4_SEND, 0,
+		HDMI_GENERIC5_CONT, 0,
+		HDMI_GENERIC5_SEND, 0);
+	REG_SET_2(HDMI_GENERIC_PACKET_CONTROL3, 0,
+		HDMI_GENERIC4_LINE, 0,
+		HDMI_GENERIC5_LINE, 0);
+
+	/* stop generic packets 6,7 on HDMI */
+	REG_SET_4(HDMI_GENERIC_PACKET_CONTROL0, 0,
+		HDMI_GENERIC6_CONT, 0,
+		HDMI_GENERIC6_SEND, 0,
+		HDMI_GENERIC7_CONT, 0,
+		HDMI_GENERIC7_SEND, 0);
+	REG_SET_2(HDMI_GENERIC_PACKET_CONTROL4, 0,
+		HDMI_GENERIC6_LINE, 0,
+		HDMI_GENERIC7_LINE, 0);
+
+	/* stop generic packets 8,9 on HDMI */
+	REG_SET_4(HDMI_GENERIC_PACKET_CONTROL6, 0,
+		HDMI_GENERIC8_CONT, 0,
+		HDMI_GENERIC8_SEND, 0,
+		HDMI_GENERIC9_CONT, 0,
+		HDMI_GENERIC9_SEND, 0);
+	REG_SET_2(HDMI_GENERIC_PACKET_CONTROL7, 0,
+		HDMI_GENERIC8_LINE, 0,
+		HDMI_GENERIC9_LINE, 0);
+
+	/* stop generic packets 10,11 on HDMI */
+	REG_SET_4(HDMI_GENERIC_PACKET_CONTROL6, 0,
+		HDMI_GENERIC10_CONT, 0,
+		HDMI_GENERIC10_SEND, 0,
+		HDMI_GENERIC11_CONT, 0,
+		HDMI_GENERIC11_SEND, 0);
+	REG_SET_2(HDMI_GENERIC_PACKET_CONTROL8, 0,
+		HDMI_GENERIC10_LINE, 0,
+		HDMI_GENERIC11_LINE, 0);
+
+	/* stop generic packets 12,13 on HDMI */
+	REG_SET_4(HDMI_GENERIC_PACKET_CONTROL6, 0,
+		HDMI_GENERIC12_CONT, 0,
+		HDMI_GENERIC12_SEND, 0,
+		HDMI_GENERIC13_CONT, 0,
+		HDMI_GENERIC13_SEND, 0);
+	REG_SET_2(HDMI_GENERIC_PACKET_CONTROL9, 0,
+		HDMI_GENERIC12_LINE, 0,
+		HDMI_GENERIC13_LINE, 0);
+
+	/* stop generic packet 14 on HDMI */
+	REG_SET_2(HDMI_GENERIC_PACKET_CONTROL6, 0,
+		HDMI_GENERIC14_CONT, 0,
+		HDMI_GENERIC14_SEND, 0);
+	REG_UPDATE(HDMI_GENERIC_PACKET_CONTROL10,
+		HDMI_GENERIC14_LINE, 0);
+}
+
+/* Set DSC-related configuration.
+ *   dsc_mode: 0 disables DSC, other values enable DSC in specified format
+ *   sc_bytes_per_pixel: Bytes per pixel in u3.28 format
+ *   dsc_slice_width: Slice width in pixels
+ */
+static void enc3_dp_set_dsc_config(struct stream_encoder *enc,
+					enum optc_dsc_mode dsc_mode,
+					uint32_t dsc_bytes_per_pixel,
+					uint32_t dsc_slice_width)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	REG_UPDATE_2(DP_DSC_CNTL,
+			DP_DSC_MODE, dsc_mode,
+			DP_DSC_SLICE_WIDTH, dsc_slice_width);
+
+	REG_SET(DP_DSC_BYTES_PER_PIXEL, 0,
+		DP_DSC_BYTES_PER_PIXEL, dsc_bytes_per_pixel);
+}
+
+
+static void enc3_dp_set_dsc_pps_info_packet(struct stream_encoder *enc,
+					bool enable,
+					uint8_t *dsc_packed_pps)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	if (enable) {
+		struct dc_info_packet pps_sdp;
+		int i;
+
+		/* Configure for PPS packet size (128 bytes) */
+		REG_UPDATE(DP_SEC_CNTL2, DP_SEC_GSP11_PPS, 1);
+
+		/* We need turn on clock before programming AFMT block
+		 *
+		 * TODO: We may not need this here anymore since update_generic_info_packet
+		 * no longer touches AFMT
+		 */
+		REG_UPDATE(AFMT_CNTL, AFMT_AUDIO_CLOCK_EN, 1);
+
+		/* Load PPS into infoframe (SDP) registers */
+		pps_sdp.valid = true;
+		pps_sdp.hb0 = 0;
+		pps_sdp.hb1 = DC_DP_INFOFRAME_TYPE_PPS;
+		pps_sdp.hb2 = 127;
+		pps_sdp.hb3 = 0;
+
+		for (i = 0; i < 4; i++) {
+			memcpy(pps_sdp.sb, &dsc_packed_pps[i * 32], 32);
+			enc1->base.vpg->funcs->update_generic_info_packet(
+							enc1->base.vpg,
+							11 + i,
+							&pps_sdp);
+		}
+
+		/* SW should make sure VBID[6] update line number is bigger
+		 * than PPS transmit line number
+		 */
+		REG_UPDATE(DP_GSP11_CNTL,
+				DP_SEC_GSP11_LINE_NUM, 2);
+		REG_UPDATE_2(DP_MSA_VBID_MISC,
+				DP_VBID6_LINE_REFERENCE, 0,
+				DP_VBID6_LINE_NUM, 3);
+
+		/* Send PPS data at the line number specified above.
+		 * DP spec requires PPS to be sent only when it changes, however since
+		 * decoder has to be able to handle its change on every frame, we're
+		 * sending it always (i.e. on every frame) to reduce the chance it'd be
+		 * missed by decoder. If it turns out required to send PPS only when it
+		 * changes, we can use DP_SEC_GSP11_SEND register.
+		 */
+		REG_UPDATE(DP_GSP11_CNTL,
+			DP_SEC_GSP11_ENABLE, 1);
+		REG_UPDATE(DP_SEC_CNTL,
+			DP_SEC_STREAM_ENABLE, 1);
+	} else {
+		/* Disable Generic Stream Packet 11 (GSP) transmission */
+		REG_UPDATE(DP_GSP11_CNTL, DP_SEC_GSP11_ENABLE, 0);
+		REG_UPDATE(DP_SEC_CNTL2, DP_SEC_GSP11_PPS, 0);
+	}
+}
+
+
+/* this function read dsc related register fields to be logged later in dcn10_log_hw_state
+ * into a dcn_dsc_state struct.
+ */
+static void enc3_read_state(struct stream_encoder *enc, struct enc_state *s)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	//if dsc is enabled, continue to read
+	REG_GET(DP_DSC_CNTL, DP_DSC_MODE, &s->dsc_mode);
+	if (s->dsc_mode) {
+		REG_GET(DP_DSC_CNTL, DP_DSC_SLICE_WIDTH, &s->dsc_slice_width);
+		REG_GET(DP_GSP11_CNTL, DP_SEC_GSP11_LINE_NUM, &s->sec_gsp_pps_line_num);
+
+		REG_GET(DP_MSA_VBID_MISC, DP_VBID6_LINE_REFERENCE, &s->vbid6_line_reference);
+		REG_GET(DP_MSA_VBID_MISC, DP_VBID6_LINE_NUM, &s->vbid6_line_num);
+
+		REG_GET(DP_GSP11_CNTL, DP_SEC_GSP11_ENABLE, &s->sec_gsp_pps_enable);
+		REG_GET(DP_SEC_CNTL, DP_SEC_STREAM_ENABLE, &s->sec_stream_enable);
+	}
+}
+
+static void enc3_stream_encoder_update_dp_info_packets(
+	struct stream_encoder *enc,
+	const struct encoder_info_frame *info_frame)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+	uint32_t value = 0;
+	uint32_t dmdata_packet_enabled = 0;
+
+	if (info_frame->vsc.valid) {
+		enc->vpg->funcs->update_generic_info_packet(
+				enc->vpg,
+				0,  /* packetIndex */
+				&info_frame->vsc);
+	}
+	if (info_frame->spd.valid) {
+		enc->vpg->funcs->update_generic_info_packet(
+				enc->vpg,
+				2,  /* packetIndex */
+				&info_frame->spd);
+	}
+	if (info_frame->hdrsmd.valid) {
+		enc->vpg->funcs->update_generic_info_packet(
+				enc->vpg,
+				3,  /* packetIndex */
+				&info_frame->hdrsmd);
+	}
+	/* packetIndex 4 is used for send immediate sdp message, and please
+	 * use other packetIndex (such as 5,6) for other info packet
+	 */
+
+	/* enable/disable transmission of packet(s).
+	 * If enabled, packet transmission begins on the next frame
+	 */
+	REG_UPDATE(DP_SEC_CNTL, DP_SEC_GSP0_ENABLE, info_frame->vsc.valid);
+	REG_UPDATE(DP_SEC_CNTL, DP_SEC_GSP2_ENABLE, info_frame->spd.valid);
+	REG_UPDATE(DP_SEC_CNTL, DP_SEC_GSP3_ENABLE, info_frame->hdrsmd.valid);
+
+
+	/* This bit is the master enable bit.
+	 * When enabling secondary stream engine,
+	 * this master bit must also be set.
+	 * This register shared with audio info frame.
+	 * Therefore we need to enable master bit
+	 * if at least on of the fields is not 0
+	 */
+	value = REG_READ(DP_SEC_CNTL);
+	if (value)
+		REG_UPDATE(DP_SEC_CNTL, DP_SEC_STREAM_ENABLE, 1);
+
+	/* check if dynamic metadata packet transmission is enabled */
+	REG_GET(DP_SEC_METADATA_TRANSMISSION,
+			DP_SEC_METADATA_PACKET_ENABLE, &dmdata_packet_enabled);
+
+	if (dmdata_packet_enabled)
+		REG_UPDATE(DP_SEC_CNTL, DP_SEC_STREAM_ENABLE, 1);
+}
+
+static void enc3_dp_set_odm_combine(
+	struct stream_encoder *enc,
+	bool odm_combine)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	REG_UPDATE(DP_PIXEL_FORMAT, DP_PIXEL_COMBINE, odm_combine);
+}
+
+/* setup stream encoder in dvi mode */
+void enc3_stream_encoder_dvi_set_stream_attribute(
+	struct stream_encoder *enc,
+	struct dc_crtc_timing *crtc_timing,
+	bool is_dual_link)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	if (!enc->ctx->dc->debug.avoid_vbios_exec_table) {
+		struct bp_encoder_control cntl = {0};
+
+		cntl.action = ENCODER_CONTROL_SETUP;
+		cntl.engine_id = enc1->base.id;
+		cntl.signal = is_dual_link ?
+			SIGNAL_TYPE_DVI_DUAL_LINK : SIGNAL_TYPE_DVI_SINGLE_LINK;
+		cntl.enable_dp_audio = false;
+		cntl.pixel_clock = crtc_timing->pix_clk_100hz / 10;
+		cntl.lanes_number = (is_dual_link) ? LANE_COUNT_EIGHT : LANE_COUNT_FOUR;
+
+		if (enc1->base.bp->funcs->encoder_control(
+				enc1->base.bp, &cntl) != BP_RESULT_OK)
+			return;
+
+	} else {
+
+		//Set pattern for clock channel, default vlue 0x63 does not work
+		REG_UPDATE(DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, 0x1F);
+
+		//DIG_BE_TMDS_DVI_MODE : TMDS-DVI mode is already set in link_encoder_setup
+
+		//DIG_SOURCE_SELECT is already set in dig_connect_to_otg
+
+		/* set DIG_START to 0x1 to reset FIFO */
+		REG_UPDATE(DIG_FE_CNTL, DIG_START, 1);
+		udelay(1);
+
+		/* write 0 to take the FIFO out of reset */
+		REG_UPDATE(DIG_FE_CNTL, DIG_START, 0);
+		udelay(1);
+	}
+
+	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT(crtc_timing->display_color_depth == COLOR_DEPTH_888);
+	enc1_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
+}
+
+/* setup stream encoder in hdmi mode */
+static void enc3_stream_encoder_hdmi_set_stream_attribute(
+	struct stream_encoder *enc,
+	struct dc_crtc_timing *crtc_timing,
+	int actual_pix_clk_khz,
+	bool enable_audio)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	if (!enc->ctx->dc->debug.avoid_vbios_exec_table) {
+		struct bp_encoder_control cntl = {0};
+
+		cntl.action = ENCODER_CONTROL_SETUP;
+		cntl.engine_id = enc1->base.id;
+		cntl.signal = SIGNAL_TYPE_HDMI_TYPE_A;
+		cntl.enable_dp_audio = enable_audio;
+		cntl.pixel_clock = actual_pix_clk_khz;
+		cntl.lanes_number = LANE_COUNT_FOUR;
+
+		if (enc1->base.bp->funcs->encoder_control(
+				enc1->base.bp, &cntl) != BP_RESULT_OK)
+			return;
+
+	} else {
+
+		//Set pattern for clock channel, default vlue 0x63 does not work
+		REG_UPDATE(DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, 0x1F);
+
+		//DIG_BE_TMDS_HDMI_MODE : TMDS-HDMI mode is already set in link_encoder_setup
+
+		//DIG_SOURCE_SELECT is already set in dig_connect_to_otg
+
+		/* set DIG_START to 0x1 to reset FIFO */
+		REG_UPDATE(DIG_FE_CNTL, DIG_START, 1);
+		udelay(1);
+
+		/* write 0 to take the FIFO out of reset */
+		REG_UPDATE(DIG_FE_CNTL, DIG_START, 0);
+		udelay(1);
+	}
+
+	/* Configure pixel encoding */
+	enc1_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
+
+	/* setup HDMI engine */
+	REG_UPDATE_6(HDMI_CONTROL,
+		HDMI_PACKET_GEN_VERSION, 1,
+		HDMI_KEEPOUT_MODE, 1,
+		HDMI_DEEP_COLOR_ENABLE, 0,
+		HDMI_DATA_SCRAMBLE_EN, 0,
+		HDMI_NO_EXTRA_NULL_PACKET_FILLED, 1,
+		HDMI_CLOCK_CHANNEL_RATE, 0);
+
+	/* Configure color depth */
+	switch (crtc_timing->display_color_depth) {
+	case COLOR_DEPTH_888:
+		REG_UPDATE(HDMI_CONTROL, HDMI_DEEP_COLOR_DEPTH, 0);
+		break;
+	case COLOR_DEPTH_101010:
+		if (crtc_timing->pixel_encoding == PIXEL_ENCODING_YCBCR422) {
+			REG_UPDATE_2(HDMI_CONTROL,
+					HDMI_DEEP_COLOR_DEPTH, 1,
+					HDMI_DEEP_COLOR_ENABLE, 0);
+		} else {
+			REG_UPDATE_2(HDMI_CONTROL,
+					HDMI_DEEP_COLOR_DEPTH, 1,
+					HDMI_DEEP_COLOR_ENABLE, 1);
+			}
+		break;
+	case COLOR_DEPTH_121212:
+		if (crtc_timing->pixel_encoding == PIXEL_ENCODING_YCBCR422) {
+			REG_UPDATE_2(HDMI_CONTROL,
+					HDMI_DEEP_COLOR_DEPTH, 2,
+					HDMI_DEEP_COLOR_ENABLE, 0);
+		} else {
+			REG_UPDATE_2(HDMI_CONTROL,
+					HDMI_DEEP_COLOR_DEPTH, 2,
+					HDMI_DEEP_COLOR_ENABLE, 1);
+			}
+		break;
+	case COLOR_DEPTH_161616:
+		REG_UPDATE_2(HDMI_CONTROL,
+				HDMI_DEEP_COLOR_DEPTH, 3,
+				HDMI_DEEP_COLOR_ENABLE, 1);
+		break;
+	default:
+		break;
+	}
+
+	if (actual_pix_clk_khz >= HDMI_CLOCK_CHANNEL_RATE_MORE_340M) {
+		/* enable HDMI data scrambler
+		 * HDMI_CLOCK_CHANNEL_RATE_MORE_340M
+		 * Clock channel frequency is 1/4 of character rate.
+		 */
+		REG_UPDATE_2(HDMI_CONTROL,
+			HDMI_DATA_SCRAMBLE_EN, 1,
+			HDMI_CLOCK_CHANNEL_RATE, 1);
+	} else if (crtc_timing->flags.LTE_340MCSC_SCRAMBLE) {
+
+		/* TODO: New feature for DCE11, still need to implement */
+
+		/* enable HDMI data scrambler
+		 * HDMI_CLOCK_CHANNEL_FREQ_EQUAL_TO_CHAR_RATE
+		 * Clock channel frequency is the same
+		 * as character rate
+		 */
+		REG_UPDATE_2(HDMI_CONTROL,
+			HDMI_DATA_SCRAMBLE_EN, 1,
+			HDMI_CLOCK_CHANNEL_RATE, 0);
+	}
+
+
+	/* Enable transmission of General Control packet on every frame */
+	REG_UPDATE_3(HDMI_VBI_PACKET_CONTROL,
+		HDMI_GC_CONT, 1,
+		HDMI_GC_SEND, 1,
+		HDMI_NULL_SEND, 1);
+
+	/* following belongs to audio */
+	/* Enable Audio InfoFrame packet transmission. */
+	REG_UPDATE(HDMI_INFOFRAME_CONTROL0, HDMI_AUDIO_INFO_SEND, 1);
+
+	/* update double-buffered AUDIO_INFO registers immediately */
+	ASSERT (enc->afmt);
+	enc->afmt->funcs->audio_info_immediate_update(enc->afmt);
+
+	/* Select line number on which to send Audio InfoFrame packets */
+	REG_UPDATE(HDMI_INFOFRAME_CONTROL1, HDMI_AUDIO_INFO_LINE,
+				VBI_LINE_0 + 2);
+
+	/* set HDMI GC AVMUTE */
+	REG_UPDATE(HDMI_GC, HDMI_GC_AVMUTE, 0);
+}
+
+static void enc3_audio_mute_control(
+	struct stream_encoder *enc,
+	bool mute)
+{
+	ASSERT (enc->afmt);
+	enc->afmt->funcs->audio_mute_control(enc->afmt, mute);
+}
+
+static void enc3_se_dp_audio_setup(
+	struct stream_encoder *enc,
+	unsigned int az_inst,
+	struct audio_info *info)
+{
+	ASSERT (enc->afmt);
+	enc->afmt->funcs->se_audio_setup(enc->afmt, az_inst, info);
+}
+
+#define DP_SEC_AUD_N__DP_SEC_AUD_N__DEFAULT 0x8000
+#define DP_SEC_TIMESTAMP__DP_SEC_TIMESTAMP_MODE__AUTO_CALC 1
+
+static void enc3_se_setup_dp_audio(
+	struct stream_encoder *enc)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	/* --- DP Audio packet configurations --- */
+
+	/* ATP Configuration */
+	REG_SET(DP_SEC_AUD_N, 0,
+			DP_SEC_AUD_N, DP_SEC_AUD_N__DP_SEC_AUD_N__DEFAULT);
+
+	/* Async/auto-calc timestamp mode */
+	REG_SET(DP_SEC_TIMESTAMP, 0, DP_SEC_TIMESTAMP_MODE,
+			DP_SEC_TIMESTAMP__DP_SEC_TIMESTAMP_MODE__AUTO_CALC);
+
+	ASSERT (enc->afmt);
+	enc->afmt->funcs->setup_dp_audio(enc->afmt);
+}
+
+static void enc3_se_dp_audio_enable(
+	struct stream_encoder *enc)
+{
+	enc1_se_enable_audio_clock(enc, true);
+	enc3_se_setup_dp_audio(enc);
+	enc1_se_enable_dp_audio(enc);
+}
+
+static void enc3_se_setup_hdmi_audio(
+	struct stream_encoder *enc,
+	const struct audio_crtc_info *crtc_info)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	struct audio_clock_info audio_clock_info = {0};
+
+	/* Setup audio in AFMT - program AFMT block associated with DIO */
+	ASSERT (enc->afmt);
+	enc->afmt->funcs->setup_hdmi_audio(enc->afmt);
+
+	/* HDMI_AUDIO_PACKET_CONTROL */
+	REG_UPDATE(HDMI_AUDIO_PACKET_CONTROL,
+			HDMI_AUDIO_DELAY_EN, 1);
+
+	/* HDMI_ACR_PACKET_CONTROL */
+	REG_UPDATE_3(HDMI_ACR_PACKET_CONTROL,
+			HDMI_ACR_AUTO_SEND, 1,
+			HDMI_ACR_SOURCE, 0,
+			HDMI_ACR_AUDIO_PRIORITY, 0);
+
+	/* Program audio clock sample/regeneration parameters */
+	get_audio_clock_info(crtc_info->color_depth,
+			     crtc_info->requested_pixel_clock_100Hz,
+			     crtc_info->calculated_pixel_clock_100Hz,
+			     &audio_clock_info);
+	DC_LOG_HW_AUDIO(
+			"\n%s:Input::requested_pixel_clock_100Hz = %d"	\
+			"calculated_pixel_clock_100Hz = %d \n", __func__,	\
+			crtc_info->requested_pixel_clock_100Hz,		\
+			crtc_info->calculated_pixel_clock_100Hz);
+
+	/* HDMI_ACR_32_0__HDMI_ACR_CTS_32_MASK */
+	REG_UPDATE(HDMI_ACR_32_0, HDMI_ACR_CTS_32, audio_clock_info.cts_32khz);
+
+	/* HDMI_ACR_32_1__HDMI_ACR_N_32_MASK */
+	REG_UPDATE(HDMI_ACR_32_1, HDMI_ACR_N_32, audio_clock_info.n_32khz);
+
+	/* HDMI_ACR_44_0__HDMI_ACR_CTS_44_MASK */
+	REG_UPDATE(HDMI_ACR_44_0, HDMI_ACR_CTS_44, audio_clock_info.cts_44khz);
+
+	/* HDMI_ACR_44_1__HDMI_ACR_N_44_MASK */
+	REG_UPDATE(HDMI_ACR_44_1, HDMI_ACR_N_44, audio_clock_info.n_44khz);
+
+	/* HDMI_ACR_48_0__HDMI_ACR_CTS_48_MASK */
+	REG_UPDATE(HDMI_ACR_48_0, HDMI_ACR_CTS_48, audio_clock_info.cts_48khz);
+
+	/* HDMI_ACR_48_1__HDMI_ACR_N_48_MASK */
+	REG_UPDATE(HDMI_ACR_48_1, HDMI_ACR_N_48, audio_clock_info.n_48khz);
+
+	/* Video driver cannot know in advance which sample rate will
+	 * be used by HD Audio driver
+	 * HDMI_ACR_PACKET_CONTROL__HDMI_ACR_N_MULTIPLE field is
+	 * programmed below in interruppt callback
+	 */
+}
+
+static void enc3_se_hdmi_audio_setup(
+	struct stream_encoder *enc,
+	unsigned int az_inst,
+	struct audio_info *info,
+	struct audio_crtc_info *audio_crtc_info)
+{
+	enc1_se_enable_audio_clock(enc, true);
+	enc3_se_setup_hdmi_audio(enc, audio_crtc_info);
+	ASSERT (enc->afmt);
+	enc->afmt->funcs->se_audio_setup(enc->afmt, az_inst, info);
+}
+
+
+static const struct stream_encoder_funcs dcn30_str_enc_funcs = {
+	.dp_set_odm_combine =
+		enc3_dp_set_odm_combine,
+	.dp_set_stream_attribute =
+		enc2_stream_encoder_dp_set_stream_attribute,
+	.hdmi_set_stream_attribute =
+		enc3_stream_encoder_hdmi_set_stream_attribute,
+	.dvi_set_stream_attribute =
+		enc3_stream_encoder_dvi_set_stream_attribute,
+	.set_mst_bandwidth =
+		enc1_stream_encoder_set_mst_bandwidth,
+	.update_hdmi_info_packets =
+		enc3_stream_encoder_update_hdmi_info_packets,
+	.stop_hdmi_info_packets =
+		enc3_stream_encoder_stop_hdmi_info_packets,
+	.update_dp_info_packets =
+		enc3_stream_encoder_update_dp_info_packets,
+	.stop_dp_info_packets =
+		enc1_stream_encoder_stop_dp_info_packets,
+	.dp_blank =
+		enc1_stream_encoder_dp_blank,
+	.dp_unblank =
+		enc2_stream_encoder_dp_unblank,
+	.audio_mute_control = enc3_audio_mute_control,
+
+	.dp_audio_setup = enc3_se_dp_audio_setup,
+	.dp_audio_enable = enc3_se_dp_audio_enable,
+	.dp_audio_disable = enc1_se_dp_audio_disable,
+
+	.hdmi_audio_setup = enc3_se_hdmi_audio_setup,
+	.hdmi_audio_disable = enc1_se_hdmi_audio_disable,
+	.setup_stereo_sync  = enc1_setup_stereo_sync,
+	.set_avmute = enc1_stream_encoder_set_avmute,
+	.dig_connect_to_otg = enc1_dig_connect_to_otg,
+	.dig_source_otg = enc1_dig_source_otg,
+
+	.dp_get_pixel_format  = enc1_stream_encoder_dp_get_pixel_format,
+
+	.enc_read_state = enc3_read_state,
+	.dp_set_dsc_config = enc3_dp_set_dsc_config,
+	.dp_set_dsc_pps_info_packet = enc3_dp_set_dsc_pps_info_packet,
+	.set_dynamic_metadata = enc2_set_dynamic_metadata,
+	.hdmi_reset_stream_attribute = enc1_reset_hdmi_stream_attribute,
+};
+
+void dcn30_dio_stream_encoder_construct(
+	struct dcn10_stream_encoder *enc1,
+	struct dc_context *ctx,
+	struct dc_bios *bp,
+	enum engine_id eng_id,
+	struct vpg *vpg,
+	struct afmt *afmt,
+	const struct dcn10_stream_enc_registers *regs,
+	const struct dcn10_stream_encoder_shift *se_shift,
+	const struct dcn10_stream_encoder_mask *se_mask)
+{
+	enc1->base.funcs = &dcn30_str_enc_funcs;
+	enc1->base.ctx = ctx;
+	enc1->base.id = eng_id;
+	enc1->base.bp = bp;
+	enc1->base.vpg = vpg;
+	enc1->base.afmt = afmt;
+	enc1->regs = regs;
+	enc1->se_shift = se_shift;
+	enc1->se_mask = se_mask;
+	enc1->base.stream_enc_inst = vpg->inst;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.h
new file mode 100644
index 000000000000..8db6d76a1131
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.h
@@ -0,0 +1,269 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+#ifndef __DC_DIO_STREAM_ENCODER_DCN30_H__
+#define __DC_DIO_STREAM_ENCODER_DCN30_H__
+
+#include "dcn30/dcn30_vpg.h"
+#include "dcn30/dcn30_afmt.h"
+#include "stream_encoder.h"
+#include "dcn20/dcn20_stream_encoder.h"
+
+/* Register bit field name change */
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
+
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
+
+
+#define SE_DCN3_REG_LIST(id)\
+	SRI(AFMT_CNTL, DIG, id), \
+	SRI(DIG_FE_CNTL, DIG, id), \
+	SRI(HDMI_CONTROL, DIG, id), \
+	SRI(HDMI_DB_CONTROL, DIG, id), \
+	SRI(HDMI_GC, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL0, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL1, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL2, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL3, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL4, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL5, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL6, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL7, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL8, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL9, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL10, DIG, id), \
+	SRI(HDMI_INFOFRAME_CONTROL0, DIG, id), \
+	SRI(HDMI_INFOFRAME_CONTROL1, DIG, id), \
+	SRI(HDMI_VBI_PACKET_CONTROL, DIG, id), \
+	SRI(HDMI_AUDIO_PACKET_CONTROL, DIG, id),\
+	SRI(HDMI_ACR_PACKET_CONTROL, DIG, id),\
+	SRI(HDMI_ACR_32_0, DIG, id),\
+	SRI(HDMI_ACR_32_1, DIG, id),\
+	SRI(HDMI_ACR_44_0, DIG, id),\
+	SRI(HDMI_ACR_44_1, DIG, id),\
+	SRI(HDMI_ACR_48_0, DIG, id),\
+	SRI(HDMI_ACR_48_1, DIG, id),\
+	SRI(DP_DB_CNTL, DP, id), \
+	SRI(DP_MSA_MISC, DP, id), \
+	SRI(DP_MSA_VBID_MISC, DP, id), \
+	SRI(DP_MSA_COLORIMETRY, DP, id), \
+	SRI(DP_MSA_TIMING_PARAM1, DP, id), \
+	SRI(DP_MSA_TIMING_PARAM2, DP, id), \
+	SRI(DP_MSA_TIMING_PARAM3, DP, id), \
+	SRI(DP_MSA_TIMING_PARAM4, DP, id), \
+	SRI(DP_MSE_RATE_CNTL, DP, id), \
+	SRI(DP_MSE_RATE_UPDATE, DP, id), \
+	SRI(DP_PIXEL_FORMAT, DP, id), \
+	SRI(DP_SEC_CNTL, DP, id), \
+	SRI(DP_SEC_CNTL2, DP, id), \
+	SRI(DP_SEC_CNTL6, DP, id), \
+	SRI(DP_STEER_FIFO, DP, id), \
+	SRI(DP_VID_M, DP, id), \
+	SRI(DP_VID_N, DP, id), \
+	SRI(DP_VID_STREAM_CNTL, DP, id), \
+	SRI(DP_VID_TIMING, DP, id), \
+	SRI(DP_SEC_AUD_N, DP, id), \
+	SRI(DP_SEC_TIMESTAMP, DP, id), \
+	SRI(DP_DSC_CNTL, DP, id), \
+	SRI(DP_DSC_BYTES_PER_PIXEL, DP, id), \
+	SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
+	SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
+	SRI(DP_SEC_FRAMING4, DP, id), \
+	SRI(DP_GSP11_CNTL, DP, id), \
+	SRI(DME_CONTROL, DME, id),\
+	SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
+	SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
+	SRI(DIG_FE_CNTL, DIG, id), \
+	SRI(DIG_CLOCK_PATTERN, DIG, id)
+
+
+#define SE_COMMON_MASK_SH_LIST_DCN30_BASE(mask_sh)\
+	SE_SF(DP0_DP_PIXEL_FORMAT, DP_PIXEL_ENCODING, mask_sh),\
+	SE_SF(DP0_DP_PIXEL_FORMAT, DP_COMPONENT_DEPTH, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_PACKET_GEN_VERSION, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_KEEPOUT_MODE, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_DEEP_COLOR_ENABLE, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_DEEP_COLOR_DEPTH, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_DATA_SCRAMBLE_EN, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_NO_EXTRA_NULL_PACKET_FILLED, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_GC_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_GC_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_NULL_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_INFOFRAME_CONTROL0, HDMI_AUDIO_INFO_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_INFOFRAME_CONTROL1, HDMI_AUDIO_INFO_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GC, HDMI_GC_AVMUTE, mask_sh),\
+	SE_SF(DP0_DP_MSE_RATE_CNTL, DP_MSE_RATE_X, mask_sh),\
+	SE_SF(DP0_DP_MSE_RATE_CNTL, DP_MSE_RATE_Y, mask_sh),\
+	SE_SF(DP0_DP_MSE_RATE_UPDATE, DP_MSE_RATE_UPDATE_PENDING, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP0_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_STREAM_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP1_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP2_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP3_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_MPG_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP4_SEND, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP4_SEND_PENDING, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL4, DP_SEC_GSP4_LINE_NUM, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP4_SEND_ANY_LINE, mask_sh),\
+	SE_SF(DP0_DP_VID_STREAM_CNTL, DP_VID_STREAM_DIS_DEFER, mask_sh),\
+	SE_SF(DP0_DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_VID_STREAM_CNTL, DP_VID_STREAM_STATUS, mask_sh),\
+	SE_SF(DP0_DP_STEER_FIFO, DP_STEER_FIFO_RESET, mask_sh),\
+	SE_SF(DP0_DP_VID_TIMING, DP_VID_M_N_GEN_EN, mask_sh),\
+	SE_SF(DP0_DP_VID_N, DP_VID_N, mask_sh),\
+	SE_SF(DP0_DP_VID_M, DP_VID_M, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, DIG_START, mask_sh),\
+	SE_SF(DIG0_HDMI_AUDIO_PACKET_CONTROL, HDMI_AUDIO_DELAY_EN, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_PACKET_CONTROL, HDMI_ACR_AUTO_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_PACKET_CONTROL, HDMI_ACR_SOURCE, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_PACKET_CONTROL, HDMI_ACR_AUDIO_PRIORITY, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_32_0, HDMI_ACR_CTS_32, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_32_1, HDMI_ACR_N_32, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_44_0, HDMI_ACR_CTS_44, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_44_1, HDMI_ACR_N_44, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_48_0, HDMI_ACR_CTS_48, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_48_1, HDMI_ACR_N_48, mask_sh),\
+	SE_SF(DP0_DP_SEC_AUD_N, DP_SEC_AUD_N, mask_sh),\
+	SE_SF(DP0_DP_SEC_TIMESTAMP, DP_SEC_TIMESTAMP_MODE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_ASP_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_ATP_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_AIP_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_ACM_ENABLE, mask_sh),\
+	SE_SF(DIG0_AFMT_CNTL, AFMT_AUDIO_CLOCK_EN, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_CLOCK_CHANNEL_RATE, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, TMDS_PIXEL_ENCODING, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, TMDS_COLOR_FORMAT, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, DIG_STEREOSYNC_SELECT, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, DIG_STEREOSYNC_GATE_EN, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP4_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP5_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP6_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP7_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP7_SEND, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL6, DP_SEC_GSP7_LINE_NUM, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP11_PPS, mask_sh),\
+	SE_SF(DP0_DP_GSP11_CNTL, DP_SEC_GSP11_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_GSP11_CNTL, DP_SEC_GSP11_LINE_NUM, mask_sh),\
+	SE_SF(DP0_DP_DB_CNTL, DP_DB_DISABLE, mask_sh),\
+	SE_SF(DP0_DP_MSA_COLORIMETRY, DP_MSA_MISC0, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM1, DP_MSA_HTOTAL, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM1, DP_MSA_VTOTAL, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM2, DP_MSA_HSTART, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM2, DP_MSA_VSTART, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM3, DP_MSA_HSYNCWIDTH, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM3, DP_MSA_HSYNCPOLARITY, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM3, DP_MSA_VSYNCWIDTH, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM3, DP_MSA_VSYNCPOLARITY, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM4, DP_MSA_HWIDTH, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM4, DP_MSA_VHEIGHT, mask_sh),\
+	SE_SF(DIG0_HDMI_DB_CONTROL, HDMI_DB_DISABLE, mask_sh),\
+	SE_SF(DP0_DP_VID_TIMING, DP_VID_N_MUL, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, DIG_SOURCE_SELECT, mask_sh), \
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC0_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC0_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC1_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC1_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC2_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC2_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC3_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC3_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC4_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC4_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC5_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC5_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC6_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC6_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC7_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC7_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC8_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC8_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC9_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC9_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC10_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC10_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC11_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC11_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC12_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC12_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC13_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC13_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC14_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC14_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL1, HDMI_GENERIC0_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL1, HDMI_GENERIC1_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL2, HDMI_GENERIC2_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL2, HDMI_GENERIC3_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL3, HDMI_GENERIC4_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL3, HDMI_GENERIC5_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL4, HDMI_GENERIC6_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL4, HDMI_GENERIC7_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL7, HDMI_GENERIC8_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL7, HDMI_GENERIC9_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL8, HDMI_GENERIC10_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL8, HDMI_GENERIC11_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL9, HDMI_GENERIC12_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL9, HDMI_GENERIC13_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL10, HDMI_GENERIC14_LINE, mask_sh),\
+	SE_SF(DP0_DP_DSC_CNTL, DP_DSC_MODE, mask_sh),\
+	SE_SF(DP0_DP_DSC_CNTL, DP_DSC_SLICE_WIDTH, mask_sh),\
+	SE_SF(DP0_DP_DSC_BYTES_PER_PIXEL, DP_DSC_BYTES_PER_PIXEL, mask_sh),\
+	SE_SF(DP0_DP_MSA_VBID_MISC, DP_VBID6_LINE_REFERENCE, mask_sh),\
+	SE_SF(DP0_DP_MSA_VBID_MISC, DP_VBID6_LINE_NUM, mask_sh),\
+	SE_SF(DME0_DME_CONTROL, METADATA_ENGINE_EN, mask_sh),\
+	SE_SF(DME0_DME_CONTROL, METADATA_HUBP_REQUESTOR_ID, mask_sh),\
+	SE_SF(DME0_DME_CONTROL, METADATA_STREAM_TYPE, mask_sh),\
+	SE_SF(DP0_DP_SEC_METADATA_TRANSMISSION, DP_SEC_METADATA_PACKET_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_METADATA_TRANSMISSION, DP_SEC_METADATA_PACKET_LINE_REFERENCE, mask_sh),\
+	SE_SF(DP0_DP_SEC_METADATA_TRANSMISSION, DP_SEC_METADATA_PACKET_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_METADATA_PACKET_CONTROL, HDMI_METADATA_PACKET_ENABLE, mask_sh),\
+	SE_SF(DIG0_HDMI_METADATA_PACKET_CONTROL, HDMI_METADATA_PACKET_LINE_REFERENCE, mask_sh),\
+	SE_SF(DIG0_HDMI_METADATA_PACKET_CONTROL, HDMI_METADATA_PACKET_LINE, mask_sh),\
+	SE_SF(DP0_DP_PIXEL_FORMAT, DP_PIXEL_COMBINE, mask_sh),\
+	SE_SF(DP0_DP_SEC_FRAMING4, DP_SST_SDP_SPLITTING, mask_sh),\
+	SE_SF(DIG0_DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, mask_sh)
+
+#define SE_COMMON_MASK_SH_LIST_DCN30(mask_sh)\
+	SE_COMMON_MASK_SH_LIST_DCN30_BASE(mask_sh)
+
+void dcn30_dio_stream_encoder_construct(
+	struct dcn10_stream_encoder *enc1,
+	struct dc_context *ctx,
+	struct dc_bios *bp,
+	enum engine_id eng_id,
+	struct vpg *vpg,
+	struct afmt *afmt,
+	const struct dcn10_stream_enc_registers *regs,
+	const struct dcn10_stream_encoder_shift *se_shift,
+	const struct dcn10_stream_encoder_mask *se_mask);
+
+#endif /* __DC_DIO_STREAM_ENCODER_DCN30_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
index ac6523c0828e..11ce06e69d3f 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
@@ -104,6 +104,10 @@ struct stream_encoder {
 	struct dc_bios *bp;
 	enum engine_id id;
 	uint32_t stream_enc_inst;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	struct vpg *vpg;
+	struct afmt *afmt;
+#endif
 };
 
 struct enc_state {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

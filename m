Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188281EABFD
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEB46E93B;
	Mon,  1 Jun 2020 18:29:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F54C6E5B0
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:29:45 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c14so9002766qka.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UnZJDu514q1nzhwz1jkIH/x96UXj/QF4glEDIcMMuFs=;
 b=jpUL3LdUxsmKFPhhMdWhogm9hXDsn0r6j+wo24fL1cTBFLOEAxGXOhx+ZwLGM1nWrg
 YvX9vrG1WvG6rTBucAq6ox+i4mtFD0f+LLkUwr+wjUV74ku5CGfmdrUCSdn9OF3azYxo
 lWj9UQXZ7Rb4suZbHm4NIPy5LgbWCJngfH2RzjgnUFl/qlOxnccBLIhTA1BsZC9WN2Q6
 oWwLXzoLmmlyp2qSb+sGs7ABUmfIKHta8WB/4AMVsggpIjaxzTUnUArMu1H1rjdDW5c/
 IRkR0U15g0EW8xU2/9m4WqniBW5og50WY0P+a9H6Agcxp9ZNbBObGBhe6GknYM9YdNis
 3NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UnZJDu514q1nzhwz1jkIH/x96UXj/QF4glEDIcMMuFs=;
 b=BmIrRfC9s0wt38ypQpu2XV11Kv7Zt+su1UnLQthyffkhsLMLl7WBipSaXjqy37qKQG
 V+j7QVUIGaX6T6XuwW7ZL4wIqFbPGTeE2JKjFg8v+lANSvCfNWOBBMcITIeXvA1qBMln
 P9Jowx728UniQ8zmA3k3ACMGDmTarlas0NTI3gs+g9vCW57pdy1I/YMs9DqSZz1moCV2
 hL80pTGMa4Nuak9EYGQ3MKLdQKEbeQHYkTIBNZ8Nyloow6NrXO6MC818v1wdeuggQpvm
 zLxjg91jIwdXLQdM6CU9FC8MhTbWKpxStCATY1I6+WpepdcOy8PwnALR1F8uhQAg1PYr
 ARQg==
X-Gm-Message-State: AOAM532PAOdY/Q8VN58U23xx030EXMqbelZeWpNbmPbGNUH2lwJq8idG
 uImcnBm/NSCE1cGKNNrJf3HaTW+0
X-Google-Smtp-Source: ABdhPJycW3JDk5LY5dvbA6ObAbFqONqiq5Do03J43TlKpoQ3u6z2qh0/ynx1wn2OSJrJ1nv6moaoBg==
X-Received: by 2002:a37:9401:: with SMTP id w1mr6609847qkd.308.1591036183180; 
 Mon, 01 Jun 2020 11:29:43 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:29:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 183/207] drm/amd/display: Add DCN3 OPTC
Date: Mon,  1 Jun 2020 14:29:02 -0400
Message-Id: <20200601182926.1267958-5-alexander.deucher@amd.com>
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

Add support for programming the DCN3 OPTC (Output Timing Controller)

HW Blocks:

    +--------+
    |  OPTC  |
    +--------+
        |
        v
    +--------+       +--------+
    |  DIO   |       |  DCCG  |
    +--------+       +--------+

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 .../gpu/drm/amd/display/dc/dcn10/dcn10_optc.c |  10 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_optc.h |  62 +++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_optc.c | 365 ++++++++++++++++++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_optc.h | 333 ++++++++++++++++
 .../amd/display/dc/inc/hw/timing_generator.h  |  19 +
 5 files changed, 788 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
index ec0ab42becba..43d0b4e53b5d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
@@ -288,8 +288,16 @@ void optc1_program_timing(
 	if (optc1_is_two_pixels_per_containter(&patched_crtc_timing) || optc1->opp_count == 2)
 		h_div = H_TIMING_DIV_BY2;
 
-	REG_UPDATE(OTG_H_TIMING_CNTL,
+	if (optc1->tg_mask->OTG_H_TIMING_DIV_MODE != 0) {
+		if (optc1->opp_count == 4)
+			h_div = H_TIMING_DIV_BY4;
+
+		REG_UPDATE(OTG_H_TIMING_CNTL,
+		OTG_H_TIMING_DIV_MODE, h_div);
+	} else {
+		REG_UPDATE(OTG_H_TIMING_CNTL,
 		OTG_H_TIMING_DIV_BY2, h_div);
+	}
 }
 
 void optc1_set_vtg_params(struct timing_generator *optc,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
index 8d1e52fb0393..b38475285835 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
@@ -171,6 +171,15 @@ struct dcn_optc_registers {
 	uint32_t OPTC_DATA_FORMAT_CONTROL;
 	uint32_t OPTC_BYTES_PER_PIXEL;
 	uint32_t OPTC_WIDTH_CONTROL;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	uint32_t OTG_BLANK_DATA_COLOR;
+	uint32_t OTG_BLANK_DATA_COLOR_EXT;
+	uint32_t OTG_DRR_TRIGGER_WINDOW;
+	uint32_t OTG_M_CONST_DTO0;
+	uint32_t OTG_M_CONST_DTO1;
+	uint32_t OTG_DRR_V_TOTAL_CHANGE;
+	uint32_t OTG_GLOBAL_CONTROL4;
+#endif
 };
 
 #define TG_COMMON_MASK_SH_LIST_DCN(mask_sh)\
@@ -296,6 +305,8 @@ struct dcn_optc_registers {
 	SF(GSL_SOURCE_SELECT, GSL2_READY_SOURCE_SEL, mask_sh),\
 	SF(OTG0_OTG_GLOBAL_CONTROL2, MANUAL_FLOW_CONTROL_SEL, mask_sh)
 
+
+
 #define TG_COMMON_MASK_SH_LIST_DCN1_0(mask_sh)\
 	TG_COMMON_MASK_SH_LIST_DCN(mask_sh),\
 	SF(OTG0_OTG_TEST_PATTERN_PARAMETERS, OTG_TEST_PATTERN_INC0, mask_sh),\
@@ -385,6 +396,13 @@ struct dcn_optc_registers {
 	type OTG_BLACK_COLOR_B_CB;\
 	type OTG_BLACK_COLOR_G_Y;\
 	type OTG_BLACK_COLOR_R_CR;\
+	type OTG_BLANK_DATA_COLOR_BLUE_CB;\
+	type OTG_BLANK_DATA_COLOR_GREEN_Y;\
+	type OTG_BLANK_DATA_COLOR_RED_CR;\
+	type OTG_BLANK_DATA_COLOR_BLUE_CB_EXT;\
+	type OTG_BLANK_DATA_COLOR_GREEN_Y_EXT;\
+	type OTG_BLANK_DATA_COLOR_RED_CR_EXT;\
+	type OTG_VTOTAL_MID_REPLACING_MIN_EN;\
 	type OTG_TEST_PATTERN_INC0;\
 	type OTG_TEST_PATTERN_INC1;\
 	type OTG_TEST_PATTERN_VRES;\
@@ -456,9 +474,17 @@ struct dcn_optc_registers {
 	type MANUAL_FLOW_CONTROL;\
 	type MANUAL_FLOW_CONTROL_SEL;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 
 #define TG_REG_FIELD_LIST(type) \
 	TG_REG_FIELD_LIST_DCN1_0(type)\
+	type OTG_V_SYNC_MODE;\
+	type OTG_DRR_TRIGGER_WINDOW_START_X;\
+	type OTG_DRR_TRIGGER_WINDOW_END_X;\
+	type OTG_DRR_V_TOTAL_CHANGE_LIMIT;\
+	type OTG_OUT_MUX;\
+	type OTG_M_CONST_DTO_PHASE;\
+	type OTG_M_CONST_DTO_MODULO;\
 	type MASTER_UPDATE_LOCK_DB_X;\
 	type MASTER_UPDATE_LOCK_DB_Y;\
 	type MASTER_UPDATE_LOCK_DB_EN;\
@@ -469,6 +495,8 @@ struct dcn_optc_registers {
 	type OPTC_NUM_OF_INPUT_SEGMENT;\
 	type OPTC_SEG0_SRC_SEL;\
 	type OPTC_SEG1_SRC_SEL;\
+	type OPTC_SEG2_SRC_SEL;\
+	type OPTC_SEG3_SRC_SEL;\
 	type OPTC_MEM_SEL;\
 	type OPTC_DATA_FORMAT;\
 	type OPTC_DSC_MODE;\
@@ -477,11 +505,45 @@ struct dcn_optc_registers {
 	type OPTC_SEGMENT_WIDTH;\
 	type OPTC_DWB0_SOURCE_SELECT;\
 	type OPTC_DWB1_SOURCE_SELECT;\
+	type MASTER_UPDATE_LOCK_DB_START_X;\
+	type MASTER_UPDATE_LOCK_DB_END_X;\
+	type MASTER_UPDATE_LOCK_DB_START_Y;\
+	type MASTER_UPDATE_LOCK_DB_END_Y;\
+	type DIG_UPDATE_POSITION_X;\
+	type DIG_UPDATE_POSITION_Y;\
+	type OTG_H_TIMING_DIV_MODE;\
+	type OTG_DRR_TIMING_DBUF_UPDATE_MODE;\
 	type OTG_CRC_DSC_MODE;\
 	type OTG_CRC_DATA_STREAM_COMBINE_MODE;\
 	type OTG_CRC_DATA_STREAM_SPLIT_MODE;\
 	type OTG_CRC_DATA_FORMAT;
+#else
 
+#define TG_REG_FIELD_LIST(type) \
+	TG_REG_FIELD_LIST_DCN1_0(type)\
+	type MASTER_UPDATE_LOCK_DB_X;\
+	type MASTER_UPDATE_LOCK_DB_Y;\
+	type MASTER_UPDATE_LOCK_DB_EN;\
+	type GLOBAL_UPDATE_LOCK_EN;\
+	type DIG_UPDATE_LOCATION;\
+	type OTG_DSC_START_POSITION_X;\
+	type OTG_DSC_START_POSITION_LINE_NUM;\
+	type OPTC_NUM_OF_INPUT_SEGMENT;\
+	type OPTC_SEG0_SRC_SEL;\
+	type OPTC_SEG1_SRC_SEL;\
+	type OPTC_MEM_SEL;\
+	type OPTC_DATA_FORMAT;\
+	type OPTC_DSC_MODE;\
+	type OPTC_DSC_BYTES_PER_PIXEL;\
+	type OPTC_DSC_SLICE_WIDTH;\
+	type OPTC_SEGMENT_WIDTH;\
+	type OPTC_DWB0_SOURCE_SELECT;\
+	type OPTC_DWB1_SOURCE_SELECT;\
+	type OTG_CRC_DSC_MODE;\
+	type OTG_CRC_DATA_STREAM_COMBINE_MODE;\
+	type OTG_CRC_DATA_STREAM_SPLIT_MODE;\
+	type OTG_CRC_DATA_FORMAT;
+#endif
 
 
 struct dcn_optc_shift {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
new file mode 100644
index 000000000000..224c8d145eba
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
@@ -0,0 +1,365 @@
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
+#include "dcn30_optc.h"
+#include "dc.h"
+#include "dcn_calc_math.h"
+
+#define REG(reg)\
+	optc1->tg_regs->reg
+
+#define CTX \
+	optc1->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	optc1->tg_shift->field_name, optc1->tg_mask->field_name
+
+void optc3_triplebuffer_lock(struct timing_generator *optc)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_UPDATE(OTG_GLOBAL_CONTROL2,
+		OTG_MASTER_UPDATE_LOCK_SEL, optc->inst);
+
+	REG_SET(OTG_VUPDATE_KEEPOUT, 0,
+		OTG_MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_EN, 1);
+
+	REG_SET(OTG_MASTER_UPDATE_LOCK, 0,
+		OTG_MASTER_UPDATE_LOCK, 1);
+
+	if (optc->ctx->dce_environment != DCE_ENV_FPGA_MAXIMUS)
+		REG_WAIT(OTG_MASTER_UPDATE_LOCK,
+				UPDATE_LOCK_STATUS, 1,
+				1, 10);
+}
+
+void optc3_lock_doublebuffer_enable(struct timing_generator *optc)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	uint32_t v_blank_start = 0;
+	uint32_t v_blank_end = 0;
+	uint32_t h_blank_start = 0;
+	uint32_t h_blank_end = 0;
+
+	REG_GET_2(OTG_V_BLANK_START_END,
+		OTG_V_BLANK_START, &v_blank_start,
+		OTG_V_BLANK_END, &v_blank_end);
+	REG_GET_2(OTG_H_BLANK_START_END,
+		OTG_H_BLANK_START, &h_blank_start,
+		OTG_H_BLANK_END, &h_blank_end);
+
+	REG_UPDATE_2(OTG_GLOBAL_CONTROL1,
+		MASTER_UPDATE_LOCK_DB_START_Y, v_blank_start,
+		MASTER_UPDATE_LOCK_DB_END_Y, v_blank_end);
+	REG_UPDATE_2(OTG_GLOBAL_CONTROL4,
+		DIG_UPDATE_POSITION_X, 20,
+		DIG_UPDATE_POSITION_Y, v_blank_start);
+	REG_UPDATE_3(OTG_GLOBAL_CONTROL0,
+		MASTER_UPDATE_LOCK_DB_START_X, h_blank_start - 200 - 1,
+		MASTER_UPDATE_LOCK_DB_END_X, h_blank_end,
+		MASTER_UPDATE_LOCK_DB_EN, 1);
+	REG_UPDATE(OTG_GLOBAL_CONTROL2, GLOBAL_UPDATE_LOCK_EN, 1);
+}
+
+void optc3_lock_doublebuffer_disable(struct timing_generator *optc)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_UPDATE_2(OTG_GLOBAL_CONTROL0,
+		MASTER_UPDATE_LOCK_DB_START_X, 0,
+		MASTER_UPDATE_LOCK_DB_END_X, 0);
+	REG_UPDATE_2(OTG_GLOBAL_CONTROL1,
+		MASTER_UPDATE_LOCK_DB_START_Y, 0,
+		MASTER_UPDATE_LOCK_DB_END_Y, 0);
+
+	REG_UPDATE(OTG_GLOBAL_CONTROL2, GLOBAL_UPDATE_LOCK_EN, 0);
+	REG_UPDATE(OTG_GLOBAL_CONTROL0, MASTER_UPDATE_LOCK_DB_EN, 1);
+}
+
+void optc3_lock(struct timing_generator *optc)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_UPDATE(OTG_GLOBAL_CONTROL2,
+		OTG_MASTER_UPDATE_LOCK_SEL, optc->inst);
+	REG_SET(OTG_MASTER_UPDATE_LOCK, 0,
+		OTG_MASTER_UPDATE_LOCK, 1);
+
+	/* Should be fast, status does not update on maximus */
+	if (optc->ctx->dce_environment != DCE_ENV_FPGA_MAXIMUS)
+		REG_WAIT(OTG_MASTER_UPDATE_LOCK,
+				UPDATE_LOCK_STATUS, 1,
+				1, 10);
+}
+
+void optc3_set_out_mux(struct timing_generator *optc, enum otg_out_mux_dest dest)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_UPDATE(OTG_CONTROL, OTG_OUT_MUX, dest);
+}
+
+void optc3_program_blank_color(struct timing_generator *optc,
+		const struct tg_color *blank_color)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_SET_3(OTG_BLANK_DATA_COLOR, 0,
+		OTG_BLANK_DATA_COLOR_BLUE_CB, blank_color->color_b_cb,
+		OTG_BLANK_DATA_COLOR_GREEN_Y, blank_color->color_g_y,
+		OTG_BLANK_DATA_COLOR_RED_CR, blank_color->color_r_cr);
+
+	REG_SET_3(OTG_BLANK_DATA_COLOR_EXT, 0,
+		OTG_BLANK_DATA_COLOR_BLUE_CB_EXT, blank_color->color_b_cb >> 10,
+		OTG_BLANK_DATA_COLOR_GREEN_Y_EXT, blank_color->color_g_y >> 10,
+		OTG_BLANK_DATA_COLOR_RED_CR_EXT, blank_color->color_r_cr >> 10);
+}
+
+void optc3_set_drr_trigger_window(struct timing_generator *optc,
+		uint32_t window_start, uint32_t window_end)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_SET_2(OTG_DRR_TRIGGER_WINDOW, 0,
+		OTG_DRR_TRIGGER_WINDOW_START_X, window_start,
+		OTG_DRR_TRIGGER_WINDOW_END_X, window_end);
+}
+
+void optc3_set_vtotal_change_limit(struct timing_generator *optc,
+		uint32_t limit)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+
+	REG_SET(OTG_DRR_V_TOTAL_CHANGE, 0,
+		OTG_DRR_V_TOTAL_CHANGE_LIMIT, limit);
+}
+
+
+/* Set DSC-related configuration.
+ *   dsc_mode: 0 disables DSC, other values enable DSC in specified format
+ *   sc_bytes_per_pixel: Bytes per pixel in u3.28 format
+ *   dsc_slice_width: Slice width in pixels
+ */
+void optc3_set_dsc_config(struct timing_generator *optc,
+		enum optc_dsc_mode dsc_mode,
+		uint32_t dsc_bytes_per_pixel,
+		uint32_t dsc_slice_width)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	optc2_set_dsc_config(optc, dsc_mode, dsc_bytes_per_pixel,
+		dsc_slice_width);
+
+		REG_UPDATE(OTG_V_SYNC_A_CNTL, OTG_V_SYNC_MODE, 0);
+
+}
+
+
+static void optc3_set_odm_bypass(struct timing_generator *optc,
+		const struct dc_crtc_timing *dc_crtc_timing)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	enum h_timing_div_mode h_div = H_TIMING_NO_DIV;
+
+	REG_SET_5(OPTC_DATA_SOURCE_SELECT, 0,
+			OPTC_NUM_OF_INPUT_SEGMENT, 0,
+			OPTC_SEG0_SRC_SEL, optc->inst,
+			OPTC_SEG1_SRC_SEL, 0xf,
+			OPTC_SEG2_SRC_SEL, 0xf,
+			OPTC_SEG3_SRC_SEL, 0xf
+			);
+
+	h_div = optc1_is_two_pixels_per_containter(dc_crtc_timing);
+	REG_SET(OTG_H_TIMING_CNTL, 0,
+			OTG_H_TIMING_DIV_MODE, h_div);
+
+	REG_SET(OPTC_MEMORY_CONFIG, 0,
+			OPTC_MEM_SEL, 0);
+	optc1->opp_count = 1;
+}
+
+static void optc3_set_odm_combine(struct timing_generator *optc, int *opp_id, int opp_cnt,
+		struct dc_crtc_timing *timing)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	int mpcc_hactive = (timing->h_addressable + timing->h_border_left + timing->h_border_right)
+			/ opp_cnt;
+	uint32_t memory_mask = 0;
+	uint32_t data_fmt = 0;
+
+	/* TODO: In pseudocode but does not affect maximus, delete comment if we dont need on asic
+	 * REG_SET(OTG_GLOBAL_CONTROL2, 0, GLOBAL_UPDATE_LOCK_EN, 1);
+	 * Program OTG register MASTER_UPDATE_LOCK_DB_X/Y to the position before DP frame start
+	 * REG_SET_2(OTG_GLOBAL_CONTROL1, 0,
+	 *		MASTER_UPDATE_LOCK_DB_X, 160,
+	 *		MASTER_UPDATE_LOCK_DB_Y, 240);
+	 */
+
+	ASSERT(opp_cnt == 2 || opp_cnt == 4);
+
+	/* 2 pieces of memory required for up to 5120 displays, 4 for up to 8192,
+	 * however, for ODM combine we can simplify by always using 4.
+	 */
+	if (opp_cnt == 2) {
+		/* To make sure there's no memory overlap, each instance "reserves" 2
+		 * memories and they are uniquely combined here.
+		 */
+		memory_mask = 0x3 << (opp_id[0] * 2) | 0x3 << (opp_id[1] * 2);
+	} else if (opp_cnt == 4) {
+		/* To make sure there's no memory overlap, each instance "reserves" 1
+		 * memory and they are uniquely combined here.
+		 */
+		memory_mask = 0x1 << (opp_id[0] * 2) | 0x1 << (opp_id[1] * 2) | 0x1 << (opp_id[2] * 2) | 0x1 << (opp_id[3] * 2);
+	}
+
+	if (REG(OPTC_MEMORY_CONFIG))
+		REG_SET(OPTC_MEMORY_CONFIG, 0,
+			OPTC_MEM_SEL, memory_mask);
+
+	if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
+		data_fmt = 1;
+	else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
+		data_fmt = 2;
+
+	REG_UPDATE(OPTC_DATA_FORMAT_CONTROL, OPTC_DATA_FORMAT, data_fmt);
+
+	if (opp_cnt == 2) {
+		REG_SET_3(OPTC_DATA_SOURCE_SELECT, 0,
+				OPTC_NUM_OF_INPUT_SEGMENT, 1,
+				OPTC_SEG0_SRC_SEL, opp_id[0],
+				OPTC_SEG1_SRC_SEL, opp_id[1]);
+	} else if (opp_cnt == 4) {
+		REG_SET_5(OPTC_DATA_SOURCE_SELECT, 0,
+				OPTC_NUM_OF_INPUT_SEGMENT, 3,
+				OPTC_SEG0_SRC_SEL, opp_id[0],
+				OPTC_SEG1_SRC_SEL, opp_id[1],
+				OPTC_SEG2_SRC_SEL, opp_id[2],
+				OPTC_SEG3_SRC_SEL, opp_id[3]);
+	}
+
+	REG_UPDATE(OPTC_WIDTH_CONTROL,
+			OPTC_SEGMENT_WIDTH, mpcc_hactive);
+
+	REG_SET(OTG_H_TIMING_CNTL, 0, OTG_H_TIMING_DIV_MODE, opp_cnt - 1);
+	optc1->opp_count = opp_cnt;
+}
+
+/**
+ * optc3_set_timing_double_buffer() - DRR double buffering control
+ *
+ * Sets double buffer point for V_TOTAL, H_TOTAL, VTOTAL_MIN,
+ * VTOTAL_MAX, VTOTAL_MIN_SEL and VTOTAL_MAX_SEL registers.
+ *
+ * Options: any time,  start of frame, dp start of frame (range timing)
+ */
+void optc3_set_timing_double_buffer(struct timing_generator *optc, bool enable)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	uint32_t mode = enable ? 2 : 0;
+
+	REG_UPDATE(OTG_DOUBLE_BUFFER_CONTROL,
+		   OTG_DRR_TIMING_DBUF_UPDATE_MODE, mode);
+}
+
+void optc3_tg_init(struct timing_generator *optc)
+{
+	optc3_set_timing_double_buffer(optc, true);
+	optc1_clear_optc_underflow(optc);
+}
+
+static struct timing_generator_funcs dcn30_tg_funcs = {
+		.validate_timing = optc1_validate_timing,
+		.program_timing = optc1_program_timing,
+		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
+		.setup_vertical_interrupt1 = optc1_setup_vertical_interrupt1,
+		.setup_vertical_interrupt2 = optc1_setup_vertical_interrupt2,
+		.program_global_sync = optc1_program_global_sync,
+		.enable_crtc = optc2_enable_crtc,
+		.disable_crtc = optc1_disable_crtc,
+		/* used by enable_timing_synchronization. Not need for FPGA */
+		.is_counter_moving = optc1_is_counter_moving,
+		.get_position = optc1_get_position,
+		.get_frame_count = optc1_get_vblank_counter,
+		.get_scanoutpos = optc1_get_crtc_scanoutpos,
+		.get_otg_active_size = optc1_get_otg_active_size,
+		.set_early_control = optc1_set_early_control,
+		/* used by enable_timing_synchronization. Not need for FPGA */
+		.wait_for_state = optc1_wait_for_state,
+		.set_blank_color = optc3_program_blank_color,
+		.did_triggered_reset_occur = optc1_did_triggered_reset_occur,
+		.triplebuffer_lock = optc3_triplebuffer_lock,
+		.triplebuffer_unlock = optc2_triplebuffer_unlock,
+		.enable_reset_trigger = optc1_enable_reset_trigger,
+		.enable_crtc_reset = optc1_enable_crtc_reset,
+		.disable_reset_trigger = optc1_disable_reset_trigger,
+		.lock = optc3_lock,
+		.unlock = optc1_unlock,
+		.lock_doublebuffer_enable = optc3_lock_doublebuffer_enable,
+		.lock_doublebuffer_disable = optc3_lock_doublebuffer_disable,
+		.enable_optc_clock = optc1_enable_optc_clock,
+		.set_drr = optc1_set_drr,
+		.set_static_screen_control = optc1_set_static_screen_control,
+		.program_stereo = optc1_program_stereo,
+		.is_stereo_left_eye = optc1_is_stereo_left_eye,
+		.tg_init = optc3_tg_init,
+		.is_tg_enabled = optc1_is_tg_enabled,
+		.is_optc_underflow_occurred = optc1_is_optc_underflow_occurred,
+		.clear_optc_underflow = optc1_clear_optc_underflow,
+		.setup_global_swap_lock = NULL,
+		.get_crc = optc1_get_crc,
+		.configure_crc = optc2_configure_crc,
+		.set_dsc_config = optc3_set_dsc_config,
+		.set_dwb_source = NULL,
+		.set_odm_bypass = optc3_set_odm_bypass,
+		.set_odm_combine = optc3_set_odm_combine,
+		.get_optc_source = optc2_get_optc_source,
+		.set_out_mux = optc3_set_out_mux,
+		.set_drr_trigger_window = optc3_set_drr_trigger_window,
+		.set_vtotal_change_limit = optc3_set_vtotal_change_limit,
+		.set_gsl = optc2_set_gsl,
+		.set_gsl_source_select = optc2_set_gsl_source_select,
+		.set_vtg_params = optc1_set_vtg_params,
+		.program_manual_trigger = optc2_program_manual_trigger,
+		.setup_manual_trigger = optc2_setup_manual_trigger,
+		.get_hw_timing = optc1_get_hw_timing,
+};
+
+void dcn30_timing_generator_init(struct optc *optc1)
+{
+	optc1->base.funcs = &dcn30_tg_funcs;
+
+	optc1->max_h_total = optc1->tg_mask->OTG_H_TOTAL + 1;
+	optc1->max_v_total = optc1->tg_mask->OTG_V_TOTAL + 1;
+
+	optc1->min_h_blank = 32;
+	optc1->min_v_blank = 3;
+	optc1->min_v_blank_interlace = 5;
+	optc1->min_h_sync_width = 8;
+	optc1->min_v_sync_width = 1;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
new file mode 100644
index 000000000000..d4106dd5a9b0
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
@@ -0,0 +1,333 @@
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
+#ifndef __DC_OPTC_DCN30_H__
+#define __DC_OPTC_DCN30_H__
+
+#include "dcn20/dcn20_optc.h"
+
+
+#define OPTC_COMMON_REG_LIST_DCN3_BASE(inst) \
+	SRI(OTG_VSTARTUP_PARAM, OTG, inst),\
+	SRI(OTG_VUPDATE_PARAM, OTG, inst),\
+	SRI(OTG_VREADY_PARAM, OTG, inst),\
+	SRI(OTG_MASTER_UPDATE_LOCK, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL0, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL1, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL2, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL4, OTG, inst),\
+	SRI(OTG_DOUBLE_BUFFER_CONTROL, OTG, inst),\
+	SRI(OTG_H_TOTAL, OTG, inst),\
+	SRI(OTG_H_BLANK_START_END, OTG, inst),\
+	SRI(OTG_H_SYNC_A, OTG, inst),\
+	SRI(OTG_H_SYNC_A_CNTL, OTG, inst),\
+	SRI(OTG_H_TIMING_CNTL, OTG, inst),\
+	SRI(OTG_V_TOTAL, OTG, inst),\
+	SRI(OTG_V_BLANK_START_END, OTG, inst),\
+	SRI(OTG_V_SYNC_A, OTG, inst),\
+	SRI(OTG_V_SYNC_A_CNTL, OTG, inst),\
+	SRI(OTG_CONTROL, OTG, inst),\
+	SRI(OTG_STEREO_CONTROL, OTG, inst),\
+	SRI(OTG_3D_STRUCTURE_CONTROL, OTG, inst),\
+	SRI(OTG_STEREO_STATUS, OTG, inst),\
+	SRI(OTG_V_TOTAL_MAX, OTG, inst),\
+	SRI(OTG_V_TOTAL_MIN, OTG, inst),\
+	SRI(OTG_V_TOTAL_CONTROL, OTG, inst),\
+	SRI(OTG_TRIGA_CNTL, OTG, inst),\
+	SRI(OTG_FORCE_COUNT_NOW_CNTL, OTG, inst),\
+	SRI(OTG_STATIC_SCREEN_CONTROL, OTG, inst),\
+	SRI(OTG_STATUS_FRAME_COUNT, OTG, inst),\
+	SRI(OTG_STATUS, OTG, inst),\
+	SRI(OTG_STATUS_POSITION, OTG, inst),\
+	SRI(OTG_NOM_VERT_POSITION, OTG, inst),\
+	SRI(OTG_BLANK_DATA_COLOR, OTG, inst),\
+	SRI(OTG_BLANK_DATA_COLOR_EXT, OTG, inst),\
+	SRI(OTG_M_CONST_DTO0, OTG, inst),\
+	SRI(OTG_M_CONST_DTO1, OTG, inst),\
+	SRI(OTG_CLOCK_CONTROL, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT0_CONTROL, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT0_POSITION, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT1_CONTROL, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT1_POSITION, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT2_CONTROL, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT2_POSITION, OTG, inst),\
+	SRI(OPTC_INPUT_CLOCK_CONTROL, ODM, inst),\
+	SRI(OPTC_DATA_SOURCE_SELECT, ODM, inst),\
+	SRI(OPTC_INPUT_GLOBAL_CONTROL, ODM, inst),\
+	SRI(CONTROL, VTG, inst),\
+	SRI(OTG_VERT_SYNC_CONTROL, OTG, inst),\
+	SRI(OTG_GSL_CONTROL, OTG, inst),\
+	SRI(OTG_CRC_CNTL, OTG, inst),\
+	SRI(OTG_CRC0_DATA_RG, OTG, inst),\
+	SRI(OTG_CRC0_DATA_B, OTG, inst),\
+	SRI(OTG_CRC0_WINDOWA_X_CONTROL, OTG, inst),\
+	SRI(OTG_CRC0_WINDOWA_Y_CONTROL, OTG, inst),\
+	SRI(OTG_CRC0_WINDOWB_X_CONTROL, OTG, inst),\
+	SRI(OTG_CRC0_WINDOWB_Y_CONTROL, OTG, inst),\
+	SR(GSL_SOURCE_SELECT),\
+	SRI(OTG_TRIGA_MANUAL_TRIG, OTG, inst)
+
+
+#define OPTC_COMMON_REG_LIST_DCN3_0(inst) \
+	OPTC_COMMON_REG_LIST_DCN3_BASE(inst),\
+	SRI(OTG_GLOBAL_CONTROL1, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL2, OTG, inst),\
+	SRI(OTG_GSL_WINDOW_X, OTG, inst),\
+	SRI(OTG_GSL_WINDOW_Y, OTG, inst),\
+	SRI(OTG_VUPDATE_KEEPOUT, OTG, inst),\
+	SRI(OTG_DSC_START_POSITION, OTG, inst),\
+	SRI(OTG_DRR_TRIGGER_WINDOW, OTG, inst),\
+	SRI(OTG_DRR_V_TOTAL_CHANGE, OTG, inst),\
+	SRI(OPTC_DATA_FORMAT_CONTROL, ODM, inst),\
+	SRI(OPTC_BYTES_PER_PIXEL, ODM, inst),\
+	SRI(OPTC_WIDTH_CONTROL, ODM, inst),\
+	SRI(OPTC_MEMORY_CONFIG, ODM, inst),\
+	SR(DWB_SOURCE_SELECT)
+
+
+#define OPTC_COMMON_MASK_SH_LIST_DCN3_BASE(mask_sh)\
+	SF(OTG0_OTG_VSTARTUP_PARAM, VSTARTUP_START, mask_sh),\
+	SF(OTG0_OTG_VUPDATE_PARAM, VUPDATE_OFFSET, mask_sh),\
+	SF(OTG0_OTG_VUPDATE_PARAM, VUPDATE_WIDTH, mask_sh),\
+	SF(OTG0_OTG_VREADY_PARAM, VREADY_OFFSET, mask_sh),\
+	SF(OTG0_OTG_MASTER_UPDATE_LOCK, OTG_MASTER_UPDATE_LOCK, mask_sh),\
+	SF(OTG0_OTG_MASTER_UPDATE_LOCK, UPDATE_LOCK_STATUS, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL0, MASTER_UPDATE_LOCK_DB_START_X, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL0, MASTER_UPDATE_LOCK_DB_END_X, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL0, MASTER_UPDATE_LOCK_DB_EN, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL1, MASTER_UPDATE_LOCK_DB_START_Y, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL1, MASTER_UPDATE_LOCK_DB_END_Y, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL2, OTG_MASTER_UPDATE_LOCK_SEL, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL4, DIG_UPDATE_POSITION_X, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL4, DIG_UPDATE_POSITION_Y, mask_sh),\
+	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_UPDATE_PENDING, mask_sh),\
+	SF(OTG0_OTG_H_TOTAL, OTG_H_TOTAL, mask_sh),\
+	SF(OTG0_OTG_H_BLANK_START_END, OTG_H_BLANK_START, mask_sh),\
+	SF(OTG0_OTG_H_BLANK_START_END, OTG_H_BLANK_END, mask_sh),\
+	SF(OTG0_OTG_H_SYNC_A, OTG_H_SYNC_A_START, mask_sh),\
+	SF(OTG0_OTG_H_SYNC_A, OTG_H_SYNC_A_END, mask_sh),\
+	SF(OTG0_OTG_H_SYNC_A_CNTL, OTG_H_SYNC_A_POL, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL, OTG_V_TOTAL, mask_sh),\
+	SF(OTG0_OTG_V_BLANK_START_END, OTG_V_BLANK_START, mask_sh),\
+	SF(OTG0_OTG_V_BLANK_START_END, OTG_V_BLANK_END, mask_sh),\
+	SF(OTG0_OTG_V_SYNC_A, OTG_V_SYNC_A_START, mask_sh),\
+	SF(OTG0_OTG_V_SYNC_A, OTG_V_SYNC_A_END, mask_sh),\
+	SF(OTG0_OTG_V_SYNC_A_CNTL, OTG_V_SYNC_A_POL, mask_sh),\
+	SF(OTG0_OTG_V_SYNC_A_CNTL, OTG_V_SYNC_MODE, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_MASTER_EN, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_START_POINT_CNTL, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_DISABLE_POINT_CNTL, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_FIELD_NUMBER_CNTL, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_OUT_MUX, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_STEREO_EN, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_STEREO_SYNC_OUTPUT_LINE_NUM, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_STEREO_SYNC_OUTPUT_POLARITY, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_STEREO_EYE_FLAG_POLARITY, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP, mask_sh),\
+	SF(OTG0_OTG_STEREO_STATUS, OTG_STEREO_CURRENT_EYE, mask_sh),\
+	SF(OTG0_OTG_3D_STRUCTURE_CONTROL, OTG_3D_STRUCTURE_EN, mask_sh),\
+	SF(OTG0_OTG_3D_STRUCTURE_CONTROL, OTG_3D_STRUCTURE_V_UPDATE_MODE, mask_sh),\
+	SF(OTG0_OTG_3D_STRUCTURE_CONTROL, OTG_3D_STRUCTURE_STEREO_SEL_OVR, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_MAX, OTG_V_TOTAL_MAX, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_MIN, OTG_V_TOTAL_MIN, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_V_TOTAL_MIN_SEL, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_V_TOTAL_MAX_SEL, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_FORCE_LOCK_ON_EVENT, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_SET_V_TOTAL_MIN_MASK_EN, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_SET_V_TOTAL_MIN_MASK, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_VTOTAL_MID_REPLACING_MIN_EN, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_VTOTAL_MID_REPLACING_MAX_EN, mask_sh),\
+	SF(OTG0_OTG_FORCE_COUNT_NOW_CNTL, OTG_FORCE_COUNT_NOW_CLEAR, mask_sh),\
+	SF(OTG0_OTG_FORCE_COUNT_NOW_CNTL, OTG_FORCE_COUNT_NOW_MODE, mask_sh),\
+	SF(OTG0_OTG_FORCE_COUNT_NOW_CNTL, OTG_FORCE_COUNT_NOW_OCCURRED, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_SOURCE_SELECT, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_SOURCE_PIPE_SELECT, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_RISING_EDGE_DETECT_CNTL, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_FALLING_EDGE_DETECT_CNTL, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_POLARITY_SELECT, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_FREQUENCY_SELECT, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_DELAY, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_CLEAR, mask_sh),\
+	SF(OTG0_OTG_STATIC_SCREEN_CONTROL, OTG_STATIC_SCREEN_EVENT_MASK, mask_sh),\
+	SF(OTG0_OTG_STATIC_SCREEN_CONTROL, OTG_STATIC_SCREEN_FRAME_COUNT, mask_sh),\
+	SF(OTG0_OTG_STATUS_FRAME_COUNT, OTG_FRAME_COUNT, mask_sh),\
+	SF(OTG0_OTG_STATUS, OTG_V_BLANK, mask_sh),\
+	SF(OTG0_OTG_STATUS, OTG_V_ACTIVE_DISP, mask_sh),\
+	SF(OTG0_OTG_STATUS_POSITION, OTG_HORZ_COUNT, mask_sh),\
+	SF(OTG0_OTG_STATUS_POSITION, OTG_VERT_COUNT, mask_sh),\
+	SF(OTG0_OTG_NOM_VERT_POSITION, OTG_VERT_COUNT_NOM, mask_sh),\
+	SF(OTG0_OTG_BLANK_DATA_COLOR, OTG_BLANK_DATA_COLOR_BLUE_CB, mask_sh),\
+	SF(OTG0_OTG_BLANK_DATA_COLOR, OTG_BLANK_DATA_COLOR_GREEN_Y, mask_sh),\
+	SF(OTG0_OTG_BLANK_DATA_COLOR, OTG_BLANK_DATA_COLOR_RED_CR, mask_sh),\
+	SF(OTG0_OTG_BLANK_DATA_COLOR_EXT, OTG_BLANK_DATA_COLOR_BLUE_CB_EXT, mask_sh),\
+	SF(OTG0_OTG_BLANK_DATA_COLOR_EXT, OTG_BLANK_DATA_COLOR_GREEN_Y_EXT, mask_sh),\
+	SF(OTG0_OTG_BLANK_DATA_COLOR_EXT, OTG_BLANK_DATA_COLOR_RED_CR_EXT, mask_sh),\
+	SF(OTG0_OTG_M_CONST_DTO0, OTG_M_CONST_DTO_PHASE, mask_sh),\
+	SF(OTG0_OTG_M_CONST_DTO1, OTG_M_CONST_DTO_MODULO, mask_sh),\
+	SF(OTG0_OTG_CLOCK_CONTROL, OTG_BUSY, mask_sh),\
+	SF(OTG0_OTG_CLOCK_CONTROL, OTG_CLOCK_EN, mask_sh),\
+	SF(OTG0_OTG_CLOCK_CONTROL, OTG_CLOCK_ON, mask_sh),\
+	SF(OTG0_OTG_CLOCK_CONTROL, OTG_CLOCK_GATE_DIS, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT0_CONTROL, OTG_VERTICAL_INTERRUPT0_INT_ENABLE, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT0_POSITION, OTG_VERTICAL_INTERRUPT0_LINE_START, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT0_POSITION, OTG_VERTICAL_INTERRUPT0_LINE_END, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT1_CONTROL, OTG_VERTICAL_INTERRUPT1_INT_ENABLE, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT1_POSITION, OTG_VERTICAL_INTERRUPT1_LINE_START, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT2_CONTROL, OTG_VERTICAL_INTERRUPT2_INT_ENABLE, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT2_POSITION, OTG_VERTICAL_INTERRUPT2_LINE_START, mask_sh),\
+	SF(ODM0_OPTC_INPUT_CLOCK_CONTROL, OPTC_INPUT_CLK_EN, mask_sh),\
+	SF(ODM0_OPTC_INPUT_CLOCK_CONTROL, OPTC_INPUT_CLK_ON, mask_sh),\
+	SF(ODM0_OPTC_INPUT_CLOCK_CONTROL, OPTC_INPUT_CLK_GATE_DIS, mask_sh),\
+	SF(ODM0_OPTC_INPUT_GLOBAL_CONTROL, OPTC_UNDERFLOW_OCCURRED_STATUS, mask_sh),\
+	SF(ODM0_OPTC_INPUT_GLOBAL_CONTROL, OPTC_UNDERFLOW_CLEAR, mask_sh),\
+	SF(VTG0_CONTROL, VTG0_ENABLE, mask_sh),\
+	SF(VTG0_CONTROL, VTG0_FP2, mask_sh),\
+	SF(VTG0_CONTROL, VTG0_VCOUNT_INIT, mask_sh),\
+	SF(OTG0_OTG_VERT_SYNC_CONTROL, OTG_FORCE_VSYNC_NEXT_LINE_OCCURRED, mask_sh),\
+	SF(OTG0_OTG_VERT_SYNC_CONTROL, OTG_FORCE_VSYNC_NEXT_LINE_CLEAR, mask_sh),\
+	SF(OTG0_OTG_VERT_SYNC_CONTROL, OTG_AUTO_FORCE_VSYNC_MODE, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL0_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL1_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL2_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL_MASTER_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL_FORCE_DELAY, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL_CHECK_ALL_FIELDS, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL, OTG_CRC_CONT_EN, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL, OTG_CRC0_SELECT, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL, OTG_CRC_EN, mask_sh),\
+	SF(OTG0_OTG_CRC0_DATA_RG, CRC0_R_CR, mask_sh),\
+	SF(OTG0_OTG_CRC0_DATA_RG, CRC0_G_Y, mask_sh),\
+	SF(OTG0_OTG_CRC0_DATA_B, CRC0_B_CB, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWA_X_CONTROL, OTG_CRC0_WINDOWA_X_START, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWA_X_CONTROL, OTG_CRC0_WINDOWA_X_END, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWA_Y_CONTROL, OTG_CRC0_WINDOWA_Y_START, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWA_Y_CONTROL, OTG_CRC0_WINDOWA_Y_END, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWB_X_CONTROL, OTG_CRC0_WINDOWB_X_START, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWB_X_CONTROL, OTG_CRC0_WINDOWB_X_END, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWB_Y_CONTROL, OTG_CRC0_WINDOWB_Y_START, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWB_Y_CONTROL, OTG_CRC0_WINDOWB_Y_END, mask_sh),\
+	SF(OTG0_OTG_TRIGA_MANUAL_TRIG, OTG_TRIGA_MANUAL_TRIG, mask_sh),\
+	SF(GSL_SOURCE_SELECT, GSL0_READY_SOURCE_SEL, mask_sh),\
+	SF(GSL_SOURCE_SELECT, GSL1_READY_SOURCE_SEL, mask_sh),\
+	SF(GSL_SOURCE_SELECT, GSL2_READY_SOURCE_SEL, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL2, MANUAL_FLOW_CONTROL_SEL, mask_sh)
+
+#define OPTC_COMMON_MASK_SH_LIST_DCN3_0(mask_sh)\
+	OPTC_COMMON_MASK_SH_LIST_DCN3_BASE(mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL2, GLOBAL_UPDATE_LOCK_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_WINDOW_X, OTG_GSL_WINDOW_START_X, mask_sh),\
+	SF(OTG0_OTG_GSL_WINDOW_X, OTG_GSL_WINDOW_END_X, mask_sh), \
+	SF(OTG0_OTG_GSL_WINDOW_Y, OTG_GSL_WINDOW_START_Y, mask_sh),\
+	SF(OTG0_OTG_GSL_WINDOW_Y, OTG_GSL_WINDOW_END_Y, mask_sh),\
+	SF(OTG0_OTG_VUPDATE_KEEPOUT, OTG_MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_EN, mask_sh), \
+	SF(OTG0_OTG_VUPDATE_KEEPOUT, MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_START_OFFSET, mask_sh), \
+	SF(OTG0_OTG_VUPDATE_KEEPOUT, MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_END_OFFSET, mask_sh), \
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL_MASTER_MODE, mask_sh), \
+	SF(OTG0_OTG_GSL_CONTROL, OTG_MASTER_UPDATE_LOCK_GSL_EN, mask_sh), \
+	SF(OTG0_OTG_DSC_START_POSITION, OTG_DSC_START_POSITION_X, mask_sh), \
+	SF(OTG0_OTG_DSC_START_POSITION, OTG_DSC_START_POSITION_LINE_NUM, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG0_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG1_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_NUM_OF_INPUT_SEGMENT, mask_sh),\
+	SF(ODM0_OPTC_MEMORY_CONFIG, OPTC_MEM_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_FORMAT_CONTROL, OPTC_DATA_FORMAT, mask_sh),\
+	SF(ODM0_OPTC_DATA_FORMAT_CONTROL, OPTC_DSC_MODE, mask_sh),\
+	SF(ODM0_OPTC_BYTES_PER_PIXEL, OPTC_DSC_BYTES_PER_PIXEL, mask_sh),\
+	SF(ODM0_OPTC_WIDTH_CONTROL, OPTC_DSC_SLICE_WIDTH, mask_sh),\
+	SF(ODM0_OPTC_WIDTH_CONTROL, OPTC_SEGMENT_WIDTH, mask_sh),\
+	SF(DWB_SOURCE_SELECT, OPTC_DWB0_SOURCE_SELECT, mask_sh),\
+	SF(DWB_SOURCE_SELECT, OPTC_DWB1_SOURCE_SELECT, mask_sh),\
+	SF(OTG0_OTG_DRR_TRIGGER_WINDOW, OTG_DRR_TRIGGER_WINDOW_START_X, mask_sh),\
+	SF(OTG0_OTG_DRR_TRIGGER_WINDOW, OTG_DRR_TRIGGER_WINDOW_END_X, mask_sh),\
+	SF(OTG0_OTG_DRR_V_TOTAL_CHANGE, OTG_DRR_V_TOTAL_CHANGE_LIMIT, mask_sh),\
+	SF(OTG0_OTG_H_TIMING_CNTL, OTG_H_TIMING_DIV_BY2, mask_sh),\
+	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_MODE, mask_sh),\
+	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_BLANK_DATA_DOUBLE_BUFFER_EN, mask_sh)
+
+#define OPTC_COMMON_MASK_SH_LIST_DCN30(mask_sh)\
+	OPTC_COMMON_MASK_SH_LIST_DCN3_BASE(mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL2, GLOBAL_UPDATE_LOCK_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_WINDOW_X, OTG_GSL_WINDOW_START_X, mask_sh),\
+	SF(OTG0_OTG_GSL_WINDOW_X, OTG_GSL_WINDOW_END_X, mask_sh), \
+	SF(OTG0_OTG_GSL_WINDOW_Y, OTG_GSL_WINDOW_START_Y, mask_sh),\
+	SF(OTG0_OTG_GSL_WINDOW_Y, OTG_GSL_WINDOW_END_Y, mask_sh),\
+	SF(OTG0_OTG_VUPDATE_KEEPOUT, OTG_MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_EN, mask_sh), \
+	SF(OTG0_OTG_VUPDATE_KEEPOUT, MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_START_OFFSET, mask_sh), \
+	SF(OTG0_OTG_VUPDATE_KEEPOUT, MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_END_OFFSET, mask_sh), \
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL_MASTER_MODE, mask_sh), \
+	SF(OTG0_OTG_GSL_CONTROL, OTG_MASTER_UPDATE_LOCK_GSL_EN, mask_sh), \
+	SF(OTG0_OTG_DSC_START_POSITION, OTG_DSC_START_POSITION_X, mask_sh), \
+	SF(OTG0_OTG_DSC_START_POSITION, OTG_DSC_START_POSITION_LINE_NUM, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG0_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG1_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG2_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG3_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_NUM_OF_INPUT_SEGMENT, mask_sh),\
+	SF(ODM0_OPTC_MEMORY_CONFIG, OPTC_MEM_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_FORMAT_CONTROL, OPTC_DATA_FORMAT, mask_sh),\
+	SF(ODM0_OPTC_DATA_FORMAT_CONTROL, OPTC_DSC_MODE, mask_sh),\
+	SF(ODM0_OPTC_BYTES_PER_PIXEL, OPTC_DSC_BYTES_PER_PIXEL, mask_sh),\
+	SF(ODM0_OPTC_WIDTH_CONTROL, OPTC_DSC_SLICE_WIDTH, mask_sh),\
+	SF(ODM0_OPTC_WIDTH_CONTROL, OPTC_SEGMENT_WIDTH, mask_sh),\
+	SF(DWB_SOURCE_SELECT, OPTC_DWB0_SOURCE_SELECT, mask_sh),\
+	SF(DWB_SOURCE_SELECT, OPTC_DWB1_SOURCE_SELECT, mask_sh),\
+	SF(OTG0_OTG_DRR_TRIGGER_WINDOW, OTG_DRR_TRIGGER_WINDOW_START_X, mask_sh),\
+	SF(OTG0_OTG_DRR_TRIGGER_WINDOW, OTG_DRR_TRIGGER_WINDOW_END_X, mask_sh),\
+	SF(OTG0_OTG_DRR_V_TOTAL_CHANGE, OTG_DRR_V_TOTAL_CHANGE_LIMIT, mask_sh),\
+	SF(OTG0_OTG_H_TIMING_CNTL, OTG_H_TIMING_DIV_MODE, mask_sh),\
+	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_MODE, mask_sh)
+
+void dcn30_timing_generator_init(struct optc *optc1);
+
+void optc3_set_out_mux(struct timing_generator *optc, enum otg_out_mux_dest dest);
+
+void optc3_lock(struct timing_generator *optc);
+
+void optc3_lock_doublebuffer_enable(struct timing_generator *optc);
+
+void optc3_lock_doublebuffer_disable(struct timing_generator *optc);
+
+void optc3_set_vrr_m_const(struct timing_generator *optc,
+		double vtotal_avg);
+
+void optc3_set_drr_trigger_window(struct timing_generator *optc,
+		uint32_t window_start, uint32_t window_end);
+
+void optc3_triplebuffer_lock(struct timing_generator *optc);
+
+void optc3_program_blank_color(struct timing_generator *optc,
+		const struct tg_color *blank_color);
+
+void optc3_set_vtotal_change_limit(struct timing_generator *optc,
+		uint32_t limit);
+
+void optc3_set_dsc_config(struct timing_generator *optc,
+		enum optc_dsc_mode dsc_mode,
+		uint32_t dsc_bytes_per_pixel,
+		uint32_t dsc_slice_width);
+
+void optc3_set_timing_db_mode(struct timing_generator *optc, bool enable);
+
+#endif /* __DC_OPTC_DCN30_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
index f803191e3134..084432132b16 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
@@ -98,9 +98,19 @@ enum crc_selection {
 	INTERSECT_WINDOW_NOT_A_NOT_B,
 };
 
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+enum otg_out_mux_dest {
+	OUT_MUX_DIO = 0,
+};
+#endif
+
 enum h_timing_div_mode {
 	H_TIMING_NO_DIV,
 	H_TIMING_DIV_BY2,
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	H_TIMING_RESERVED,
+	H_TIMING_DIV_BY4,
+#endif
 };
 
 struct crc_params {
@@ -278,6 +288,15 @@ struct timing_generator_funcs {
 	void (*set_gsl_source_select)(struct timing_generator *optc,
 			int group_idx,
 			uint32_t gsl_ready_signal);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	void (*set_out_mux)(struct timing_generator *tg, enum otg_out_mux_dest dest);
+	void (*set_vrr_m_const)(struct timing_generator *optc,
+			double vtotal_avg);
+	void (*set_drr_trigger_window)(struct timing_generator *optc,
+			uint32_t window_start, uint32_t window_end);
+	void (*set_vtotal_change_limit)(struct timing_generator *optc,
+			uint32_t limit);
+#endif
 };
 
 #endif
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

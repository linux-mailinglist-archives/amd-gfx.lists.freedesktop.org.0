Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF01EAC03
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CB96E945;
	Mon,  1 Jun 2020 18:29:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41256E9D7
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:29:55 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x29so8523371qtv.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OyUuuqV1SUTAvwytQOPYay4tj32WqzlAXs75Xy8src=;
 b=ZHgr10s2iIWgTpDVa1aEaMhLrEtBL8MV5JxVu7ExjLY4irVJohTJKD+MVNIwyiYab1
 uwmGFjDtXowT46qlIvwFYcwhgrQlFfkV1cryQkqxD/ZvRJZpNE14dTVJH6LE1L8+9FqF
 oe1vWiTQoXMH5o3aXK4pKMRJAcx+XViGB4JYRf9rCPrwFVEwpkx2lVMuE/mPkKll2iuV
 NrnwWDJnJq25Mp3OpESx7xVFL16kB0tPJSDzfVYDxcFIBQ0f8Yxpk8qNrgWPJxx4dBQ4
 DXGkC73/XRJr/VY0NxsrTjxatKeaxj5DzzXZ6+FolcXRixG0Y3FODJaCP/woIeNVAgGA
 5wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OyUuuqV1SUTAvwytQOPYay4tj32WqzlAXs75Xy8src=;
 b=Okco5cHO0tAjnHIO3wh7WVC8SKHc8MnT9CfNA6X7fF1Q4OAkSDbkgmgtRSRCyzp17m
 AutiHOLrG7XjnO7SFV2My+NppeSWO36ip5V6ioji5IGhkXtr0UHYnVgBCSiCSpsXPDso
 /QDT0Oc5EJ1z5v4+SXxfiB18/gmPH8gB9jI+4+RTsytIQ25XKetnqlNxFPeBNSoHXtz9
 /jp69GT2D5zzH3qepLE0HW5nQKRcnQA3q5V2nDbDTHNIkWNe/trTLWX57915D34fSFF6
 GHnHd4mVpK2PGNecIi78saqdEa8ZZVh14Y2mjylWY/+SWav1wKmsn33RBvEBQj/wmwsN
 7kMQ==
X-Gm-Message-State: AOAM531JhHWS7BoLyhOZ+Gipo/IpW4T/XVsMuGnZHRVRdvy4ZjKmWS3N
 ibZ1Gd0+yy9mzDthuZ1A72xvj1Dd
X-Google-Smtp-Source: ABdhPJzUDTnIvjOyoofs4qsxBjcUytkvkahLASJhPJFW4CDJAC2EZOjC09NNlFbALTG3w+hNiuwrKQ==
X-Received: by 2002:aed:312a:: with SMTP id 39mr23498736qtg.6.1591036194199;
 Mon, 01 Jun 2020 11:29:54 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:29:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 189/207] drm/amd/display: Add DCN3 MMHUBHUB
Date: Mon,  1 Jun 2020 14:29:08 -0400
Message-Id: <20200601182926.1267958-11-alexander.deucher@amd.com>
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

Add support to program the DCN3 MMHUBBUB (Multimedia HUB interface)

HW Blocks:

 +--------++------+       +----------+
 | HUBBUB || HUBP |  <--  | MMHUBBUB |
 +--------++------+       +----------+
        |
        v
    +--------+
    |  DPP   |
    +--------+
        |
        v
    +--------+
    |  MPC   |
    +--------+
        |
        v
    +-------+
    |  OPP  |
    +-------+
        |
        v
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
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h  |  36 ++
 .../drm/amd/display/dc/dcn30/dcn30_mmhubbub.c | 239 +++++++++
 .../drm/amd/display/dc/dcn30/dcn30_mmhubbub.h | 463 ++++++++++++++++++
 .../gpu/drm/amd/display/dc/inc/hw/mcif_wb.h   |   3 +
 4 files changed, 741 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h

diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index 7bc0be839c9e..a31c75d6d2cf 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -848,6 +848,42 @@ enum dwb_stereo_type {
 	DWB_STEREO_TYPE_FRAME_SEQUENTIAL = 3,	/* Frame sequential */
 };
 
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+
+enum dwb_out_format {
+	DWB_OUT_FORMAT_32BPP_ARGB = 0,
+	DWB_OUT_FORMAT_32BPP_RGBA = 1,
+	DWB_OUT_FORMAT_64BPP_ARGB = 2,
+	DWB_OUT_FORMAT_64BPP_RGBA = 3
+};
+
+enum dwb_out_denorm {
+	DWB_OUT_DENORM_10BPC = 0,
+	DWB_OUT_DENORM_8BPC = 1,
+	DWB_OUT_DENORM_BYPASS = 2
+};
+
+enum cm_gamut_remap_select {
+	CM_GAMUT_REMAP_MODE_BYPASS = 0,
+	CM_GAMUT_REMAP_MODE_RAMA_COEFF,
+	CM_GAMUT_REMAP_MODE_RAMB_COEFF,
+	CM_GAMUT_REMAP_MODE_RESERVED
+};
+
+enum cm_gamut_coef_format {
+	CM_GAMUT_REMAP_COEF_FORMAT_S2_13 = 0,
+	CM_GAMUT_REMAP_COEF_FORMAT_S3_12 = 1
+};
+
+struct mcif_warmup_params {
+	union large_integer	start_address;
+	unsigned int		address_increment;
+	unsigned int		region_size;
+	unsigned int		p_vmid;
+};
+
+#endif
+
 #define MCIF_BUF_COUNT	4
 
 struct mcif_buf_params {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
new file mode 100644
index 000000000000..1c4b171c68ad
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
@@ -0,0 +1,239 @@
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
+#include "reg_helper.h"
+#include "resource.h"
+#include "mcif_wb.h"
+#include "dcn30_mmhubbub.h"
+
+
+#define REG(reg)\
+	mcif_wb30->mcif_wb_regs->reg
+
+#define CTX \
+	mcif_wb30->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	mcif_wb30->mcif_wb_shift->field_name, mcif_wb30->mcif_wb_mask->field_name
+
+#define MCIF_ADDR(addr) (((unsigned long long)addr & 0xffffffffff) + 0xFE) >> 8
+#define MCIF_ADDR_HIGH(addr) (unsigned long long)addr >> 40
+
+/* wbif programming guide:
+ * 1. set up wbif parameter:
+ *    unsigned long long   luma_address[4];       //4 frame buffer
+ *    unsigned long long   chroma_address[4];
+ *    unsigned int	   luma_pitch;
+ *    unsigned int	   chroma_pitch;
+ *    unsigned int         warmup_pitch=0x10;     //256B align, the page size is 4KB when it is 0x10
+ *    unsigned int	   slice_lines;           //slice size
+ *    unsigned int         time_per_pixel;        // time per pixel, in ns
+ *    unsigned int         arbitration_slice;     // 0: 2048 bytes 1: 4096 bytes 2: 8192 Bytes
+ *    unsigned int         max_scaled_time;       // used for QOS generation
+ *    unsigned int         swlock=0x0;
+ *    unsigned int         cli_watermark[4];      //4 group urgent watermark
+ *    unsigned int         pstate_watermark[4];   //4 group pstate watermark
+ *    unsigned int         sw_int_en;             // Software interrupt enable, frame end and overflow
+ *    unsigned int         sw_slice_int_en;       // slice end interrupt enable
+ *    unsigned int         sw_overrun_int_en;     // overrun error interrupt enable
+ *    unsigned int         vce_int_en;            // VCE interrupt enable, frame end and overflow
+ *    unsigned int         vce_slice_int_en;      // VCE slice end interrupt enable, frame end and overflow
+ *
+ * 2. configure wbif register
+ *    a. call mmhubbub_config_wbif()
+ *
+ * 3. Enable wbif
+ *    call set_wbif_bufmgr_enable();
+ *
+ * 4. wbif_dump_status(), option, for debug purpose
+ *    the bufmgr status can show the progress of write back, can be used for debug purpose
+ */
+
+static void mmhubbub3_warmup_mcif(struct mcif_wb *mcif_wb,
+		struct mcif_warmup_params *params)
+{
+	struct dcn30_mmhubbub *mcif_wb30 = TO_DCN30_MMHUBBUB(mcif_wb);
+	union large_integer start_address_shift = {.quad_part = params->start_address.quad_part >> 5};
+
+	/* Set base address and region size for warmup */
+	REG_SET(MMHUBBUB_WARMUP_BASE_ADDR_HIGH, 0, MMHUBBUB_WARMUP_BASE_ADDR_HIGH, start_address_shift.high_part);
+	REG_SET(MMHUBBUB_WARMUP_BASE_ADDR_LOW, 0, MMHUBBUB_WARMUP_BASE_ADDR_LOW, start_address_shift.low_part);
+	REG_SET(MMHUBBUB_WARMUP_ADDR_REGION, 0, MMHUBBUB_WARMUP_ADDR_REGION, params->region_size >> 5);
+//	REG_SET(MMHUBBUB_WARMUP_P_VMID, 0, MMHUBBUB_WARMUP_P_VMID, params->p_vmid);
+
+	/* Set address increment and enable warmup */
+	REG_SET_3(MMHUBBUB_WARMUP_CONTROL_STATUS, 0, MMHUBBUB_WARMUP_EN, true,
+			MMHUBBUB_WARMUP_SW_INT_EN, true,
+			MMHUBBUB_WARMUP_INC_ADDR, params->address_increment >> 5);
+
+	/* Wait for an interrupt to signal warmup is completed */
+	REG_WAIT(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_STATUS, 1, 20, 100);
+
+	/* Acknowledge interrupt */
+	REG_UPDATE(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_ACK, 1);
+
+	/* Disable warmup */
+	REG_UPDATE(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_EN, false);
+}
+
+void mmhubbub3_config_mcif_buf(struct mcif_wb *mcif_wb,
+		struct mcif_buf_params *params,
+		unsigned int dest_height)
+{
+	struct dcn30_mmhubbub *mcif_wb30 = TO_DCN30_MMHUBBUB(mcif_wb);
+
+	/* buffer address for packing mode or Luma in planar mode */
+	REG_UPDATE(MCIF_WB_BUF_1_ADDR_Y, MCIF_WB_BUF_1_ADDR_Y, MCIF_ADDR(params->luma_address[0]));
+	REG_UPDATE(MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_ADDR_HIGH(params->luma_address[0]));
+
+	/* buffer address for Chroma in planar mode (unused in packing mode) */
+	REG_UPDATE(MCIF_WB_BUF_1_ADDR_C, MCIF_WB_BUF_1_ADDR_C, MCIF_ADDR(params->chroma_address[0]));
+	REG_UPDATE(MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_ADDR_HIGH(params->chroma_address[0]));
+
+	/* buffer address for packing mode or Luma in planar mode */
+	REG_UPDATE(MCIF_WB_BUF_2_ADDR_Y, MCIF_WB_BUF_2_ADDR_Y, MCIF_ADDR(params->luma_address[1]));
+	REG_UPDATE(MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_ADDR_HIGH(params->luma_address[1]));
+
+	/* buffer address for Chroma in planar mode (unused in packing mode) */
+	REG_UPDATE(MCIF_WB_BUF_2_ADDR_C, MCIF_WB_BUF_2_ADDR_C, MCIF_ADDR(params->chroma_address[1]));
+	REG_UPDATE(MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_ADDR_HIGH(params->chroma_address[1]));
+
+	/* buffer address for packing mode or Luma in planar mode */
+	REG_UPDATE(MCIF_WB_BUF_3_ADDR_Y, MCIF_WB_BUF_3_ADDR_Y, MCIF_ADDR(params->luma_address[2]));
+	REG_UPDATE(MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_ADDR_HIGH(params->luma_address[2]));
+
+	/* buffer address for Chroma in planar mode (unused in packing mode) */
+	REG_UPDATE(MCIF_WB_BUF_3_ADDR_C, MCIF_WB_BUF_3_ADDR_C, MCIF_ADDR(params->chroma_address[2]));
+	REG_UPDATE(MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_ADDR_HIGH(params->chroma_address[2]));
+
+	/* buffer address for packing mode or Luma in planar mode */
+	REG_UPDATE(MCIF_WB_BUF_4_ADDR_Y, MCIF_WB_BUF_4_ADDR_Y, MCIF_ADDR(params->luma_address[3]));
+	REG_UPDATE(MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_ADDR_HIGH(params->luma_address[3]));
+
+	/* buffer address for Chroma in planar mode (unused in packing mode) */
+	REG_UPDATE(MCIF_WB_BUF_4_ADDR_C, MCIF_WB_BUF_4_ADDR_C, MCIF_ADDR(params->chroma_address[3]));
+	REG_UPDATE(MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_ADDR_HIGH(params->chroma_address[3]));
+
+	/* setup luma & chroma size
+	 * should be enough to contain a whole frame Luma data,
+	 * the programmed value is frame buffer size [27:8], 256-byte aligned
+	 */
+	REG_UPDATE(MCIF_WB_BUF_LUMA_SIZE, MCIF_WB_BUF_LUMA_SIZE, (params->luma_pitch>>8) * dest_height);
+	REG_UPDATE(MCIF_WB_BUF_CHROMA_SIZE, MCIF_WB_BUF_CHROMA_SIZE, (params->chroma_pitch>>8) * dest_height);
+
+	/* enable address fence */
+	REG_UPDATE(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUF_ADDR_FENCE_EN, 1);
+
+	/* setup pitch, the programmed value is [15:8], 256B align */
+	REG_UPDATE_2(MCIF_WB_BUF_PITCH, MCIF_WB_BUF_LUMA_PITCH, params->luma_pitch >> 8,
+			MCIF_WB_BUF_CHROMA_PITCH, params->chroma_pitch >> 8);
+}
+
+static void mmhubbub3_config_mcif_arb(struct mcif_wb *mcif_wb,
+		struct mcif_arb_params *params)
+{
+	struct dcn30_mmhubbub *mcif_wb30 = TO_DCN30_MMHUBBUB(mcif_wb);
+
+	/* Programmed by the video driver based on the CRTC timing (for DWB) */
+	REG_UPDATE(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_TIME_PER_PIXEL, params->time_per_pixel);
+
+	/* Programming dwb watermark */
+	/* Watermark to generate urgent in MCIF_WB_CLI, value is determined by MCIF_WB_CLI_WATERMARK_MASK. */
+	/* Program in ns. A formula will be provided in the pseudo code to calculate the value. */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, 0x0);
+	/* urgent_watermarkA */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK,  params->cli_watermark[0]);
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, 0x1);
+	/* urgent_watermarkB */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK,  params->cli_watermark[1]);
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, 0x2);
+	/* urgent_watermarkC */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK,  params->cli_watermark[2]);
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, 0x3);
+	/* urgent_watermarkD */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK,  params->cli_watermark[3]);
+
+	/* Programming nb pstate watermark */
+	/* nbp_state_change_watermarkA */
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, 0x0);
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK,
+			NB_PSTATE_CHANGE_REFRESH_WATERMARK, params->pstate_watermark[0]);
+	/* nbp_state_change_watermarkB */
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, 0x1);
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK,
+			NB_PSTATE_CHANGE_REFRESH_WATERMARK, params->pstate_watermark[1]);
+	/* nbp_state_change_watermarkC */
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, 0x2);
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK,
+			NB_PSTATE_CHANGE_REFRESH_WATERMARK, params->pstate_watermark[2]);
+	/* nbp_state_change_watermarkD */
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, 0x3);
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK,
+			NB_PSTATE_CHANGE_REFRESH_WATERMARK, params->pstate_watermark[3]);
+
+	/* dram_speed_change_duration */
+	REG_UPDATE(MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI,
+			MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI, params->dram_speed_change_duration);
+
+	/* max_scaled_time */
+	REG_UPDATE(MULTI_LEVEL_QOS_CTRL, MAX_SCALED_TIME_TO_URGENT, params->max_scaled_time);
+
+	/* slice_lines */
+	REG_UPDATE(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_SLICE_SIZE, params->slice_lines-1);
+
+	/* Set arbitration unit for Luma/Chroma */
+	/* arb_unit=2 should be chosen for more efficiency */
+	/* Arbitration size, 0: 2048 bytes 1: 4096 bytes 2: 8192 Bytes */
+	REG_UPDATE(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE,  params->arbitration_slice);
+}
+
+const struct mcif_wb_funcs dcn30_mmhubbub_funcs = {
+	.warmup_mcif		= mmhubbub3_warmup_mcif,
+	.enable_mcif		= mmhubbub2_enable_mcif,
+	.disable_mcif		= mmhubbub2_disable_mcif,
+	.config_mcif_buf	= mmhubbub3_config_mcif_buf,
+	.config_mcif_arb	= mmhubbub3_config_mcif_arb,
+	.config_mcif_irq	= mmhubbub2_config_mcif_irq,
+	.dump_frame		= mcifwb2_dump_frame,
+};
+
+void dcn30_mmhubbub_construct(struct dcn30_mmhubbub *mcif_wb30,
+		struct dc_context *ctx,
+		const struct dcn30_mmhubbub_registers *mcif_wb_regs,
+		const struct dcn30_mmhubbub_shift *mcif_wb_shift,
+		const struct dcn30_mmhubbub_mask *mcif_wb_mask,
+		int inst)
+{
+	mcif_wb30->base.ctx = ctx;
+
+	mcif_wb30->base.inst = inst;
+	mcif_wb30->base.funcs = &dcn30_mmhubbub_funcs;
+
+	mcif_wb30->mcif_wb_regs = mcif_wb_regs;
+	mcif_wb30->mcif_wb_shift = mcif_wb_shift;
+	mcif_wb30->mcif_wb_mask = mcif_wb_mask;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h
new file mode 100644
index 000000000000..f2580e65196c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h
@@ -0,0 +1,463 @@
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
+#ifndef __DC_MCIF_WB_DCN30_H__
+#define __DC_MCIF_WB_DCN30_H__
+
+#include "dcn20/dcn20_mmhubbub.h"
+
+#define TO_DCN30_MMHUBBUB(mcif_wb_base) \
+	container_of(mcif_wb_base, struct dcn30_mmhubbub, base)
+
+/* DCN */
+#define BASE_INNER(seg) \
+	DCE_BASE__INST0_SEG ## seg
+
+#define BASE(seg) \
+	BASE_INNER(seg)
+
+#define MCIF_WB_COMMON_REG_LIST_DCN3_0(inst) \
+	SRI(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUFMGR_STATUS, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_PITCH, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_1_STATUS, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_1_STATUS2, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_2_STATUS, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_2_STATUS2, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_3_STATUS, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_3_STATUS2, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_4_STATUS, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_4_STATUS2, MCIF_WB, inst),\
+	SRI(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB, inst),\
+	SRI(MCIF_WB_SCLK_CHANGE, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_1_ADDR_Y, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_1_ADDR_C, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_2_ADDR_Y, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_2_ADDR_C, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_3_ADDR_Y, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_3_ADDR_C, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_4_ADDR_Y, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_4_ADDR_C, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, MMHUBBUB, inst),\
+	SRI(MCIF_WB_NB_PSTATE_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_WATERMARK, MMHUBBUB, inst),\
+	SRI(MCIF_WB_CLOCK_GATER_CONTROL, MCIF_WB, inst),\
+	SRI(MCIF_WB_SELF_REFRESH_CONTROL, MCIF_WB, inst),\
+	SRI(MULTI_LEVEL_QOS_CTRL, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_LUMA_SIZE, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_CHROMA_SIZE, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_1_RESOLUTION, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_2_RESOLUTION, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_3_RESOLUTION, MCIF_WB, inst),\
+	SRI(MCIF_WB_BUF_4_RESOLUTION, MCIF_WB, inst),\
+	SRI2(MMHUBBUB_MEM_PWR_CNTL, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_ADDR_REGION, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_BASE_ADDR_HIGH, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_BASE_ADDR_LOW, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_P_VMID, MMHUBBUB, inst),\
+	SRI(MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI, MCIF_WB, inst)
+
+#define MCIF_WB_COMMON_REG_LIST_DCN30(inst) \
+	SRI2(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUFMGR_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_PITCH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_STATUS2, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_STATUS2, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_STATUS2, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_STATUS2, MCIF_WB, inst),\
+	SRI2(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_SCLK_CHANGE, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_ADDR_Y, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_ADDR_C, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_ADDR_Y, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_ADDR_C, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_ADDR_Y, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_ADDR_C, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_ADDR_Y, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_ADDR_C, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, MMHUBBUB, inst),\
+	SRI2(MCIF_WB_NB_PSTATE_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_WATERMARK, MMHUBBUB, inst),\
+	SRI2(MCIF_WB_CLOCK_GATER_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_SELF_REFRESH_CONTROL, MCIF_WB, inst),\
+	SRI2(MULTI_LEVEL_QOS_CTRL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_LUMA_SIZE, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_CHROMA_SIZE, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_RESOLUTION, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_RESOLUTION, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_RESOLUTION, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_RESOLUTION, MCIF_WB, inst),\
+	SRI2(MMHUBBUB_MEM_PWR_CNTL, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_ADDR_REGION, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_BASE_ADDR_HIGH, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_BASE_ADDR_LOW, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB, inst),\
+	SRI2(MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI, MCIF_WB, inst)
+
+#define MCIF_WB_COMMON_MASK_SH_LIST_DCN3_0(mask_sh) \
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_ENABLE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_INT_EN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_INT_ACK, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_SLICE_INT_EN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_OVERRUN_INT_EN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_LOCK, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUF_ADDR_FENCE_EN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_VCE_INT_STATUS, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_SW_INT_STATUS, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_SW_OVERRUN_INT_STATUS, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_CUR_BUF, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_BUFTAG, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_NEXT_BUF, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_PITCH, MCIF_WB_BUF_LUMA_PITCH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_PITCH, MCIF_WB_BUF_CHROMA_PITCH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_ACTIVE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_OVERFLOW, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_DISABLE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_MODE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_BUFTAG, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_NXT_BUF, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_TMZ, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_ACTIVE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_OVERFLOW, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_DISABLE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_MODE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_BUFTAG, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_NXT_BUF, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_TMZ, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_ACTIVE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_OVERFLOW, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_DISABLE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_MODE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_BUFTAG, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_NXT_BUF, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_TMZ, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_ACTIVE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_OVERFLOW, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_DISABLE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_MODE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_BUFTAG, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_NXT_BUF, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_TMZ, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_TIME_PER_PIXEL, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_SCLK_CHANGE, WM_CHANGE_ACK_FORCE_ON, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_ADDR_Y, MCIF_WB_BUF_1_ADDR_Y, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_ADDR_C, MCIF_WB_BUF_1_ADDR_C, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_ADDR_Y, MCIF_WB_BUF_2_ADDR_Y, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_ADDR_C, MCIF_WB_BUF_2_ADDR_C, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_ADDR_Y, MCIF_WB_BUF_3_ADDR_Y, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_ADDR_C, MCIF_WB_BUF_3_ADDR_C, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_ADDR_Y, MCIF_WB_BUF_4_ADDR_Y, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_ADDR_C, MCIF_WB_BUF_4_ADDR_C, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_LOCK_IGNORE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_INT_EN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_INT_ACK, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_SLICE_INT_EN, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_LOCK, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_SLICE_SIZE, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_REFRESH_WATERMARK, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_NB_PSTATE_CONTROL, NB_PSTATE_CHANGE_URGENT_DURING_REQUEST, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_NB_PSTATE_CONTROL, NB_PSTATE_CHANGE_FORCE_ON, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_NB_PSTATE_CONTROL, NB_PSTATE_ALLOW_FOR_URGENT, mask_sh),\
+	SF(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK, mask_sh),\
+	SF(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_CLOCK_GATER_CONTROL, MCIF_WB_CLI_CLOCK_GATER_OVERRIDE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_SELF_REFRESH_CONTROL, DIS_REFRESH_UNDER_NBPREQ, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_SELF_REFRESH_CONTROL, PERFRAME_SELF_REFRESH, mask_sh),\
+	SF(MCIF_WB0_MULTI_LEVEL_QOS_CTRL, MAX_SCALED_TIME_TO_URGENT, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_LUMA_SIZE, MCIF_WB_BUF_LUMA_SIZE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_CHROMA_SIZE, MCIF_WB_BUF_CHROMA_SIZE, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_WB_BUF_1_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_WB_BUF_1_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_WB_BUF_2_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_WB_BUF_2_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_WB_BUF_3_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_WB_BUF_3_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_WB_BUF_4_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_WB_BUF_4_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_RESOLUTION, MCIF_WB_BUF_1_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_1_RESOLUTION, MCIF_WB_BUF_1_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_RESOLUTION, MCIF_WB_BUF_2_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_2_RESOLUTION, MCIF_WB_BUF_2_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_RESOLUTION, MCIF_WB_BUF_3_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_3_RESOLUTION, MCIF_WB_BUF_3_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_RESOLUTION, MCIF_WB_BUF_4_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_BUF_4_RESOLUTION, MCIF_WB_BUF_4_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MMHUBBUB_MEM_PWR_CNTL, WBIF_WHOLE_BUF_MODE, mask_sh),\
+	SF(MMHUBBUB_WARMUP_ADDR_REGION, MMHUBBUB_WARMUP_ADDR_REGION, mask_sh),\
+	SF(MMHUBBUB_WARMUP_BASE_ADDR_HIGH, MMHUBBUB_WARMUP_BASE_ADDR_HIGH, mask_sh),\
+	SF(MMHUBBUB_WARMUP_BASE_ADDR_LOW, MMHUBBUB_WARMUP_BASE_ADDR_LOW, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_EN, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_EN, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_STATUS, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_ACK, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_INC_ADDR, mask_sh),\
+	SF(MMHUBBUB_WARMUP_P_VMID, MMHUBBUB_WARMUP_P_VMID, mask_sh),\
+	SF(MCIF_WB0_MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI, MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI, mask_sh)
+
+
+#define MCIF_WB_COMMON_MASK_SH_LIST_DCN30(mask_sh) \
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_ENABLE, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_INT_ACK, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_SLICE_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_OVERRUN_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_LOCK, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUF_ADDR_FENCE_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_VCE_INT_STATUS, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_SW_INT_STATUS, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_SW_OVERRUN_INT_STATUS, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_CUR_BUF, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_NEXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_PITCH, MCIF_WB_BUF_LUMA_PITCH, mask_sh),\
+	SF(MCIF_WB_BUF_PITCH, MCIF_WB_BUF_CHROMA_PITCH, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_ACTIVE, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_OVERFLOW, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_DISABLE, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_MODE, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_NXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_TMZ, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_ACTIVE, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_OVERFLOW, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_DISABLE, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_MODE, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_NXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_TMZ, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_ACTIVE, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_OVERFLOW, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_DISABLE, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_MODE, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_NXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_TMZ, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_ACTIVE, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_OVERFLOW, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_DISABLE, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_MODE, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_NXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_TMZ, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE, mask_sh),\
+	SF(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_TIME_PER_PIXEL, mask_sh),\
+	SF(MCIF_WB_SCLK_CHANGE, WM_CHANGE_ACK_FORCE_ON, mask_sh),\
+	SF(MCIF_WB_BUF_1_ADDR_Y, MCIF_WB_BUF_1_ADDR_Y, mask_sh),\
+	SF(MCIF_WB_BUF_1_ADDR_C, MCIF_WB_BUF_1_ADDR_C, mask_sh),\
+	SF(MCIF_WB_BUF_2_ADDR_Y, MCIF_WB_BUF_2_ADDR_Y, mask_sh),\
+	SF(MCIF_WB_BUF_2_ADDR_C, MCIF_WB_BUF_2_ADDR_C, mask_sh),\
+	SF(MCIF_WB_BUF_3_ADDR_Y, MCIF_WB_BUF_3_ADDR_Y, mask_sh),\
+	SF(MCIF_WB_BUF_3_ADDR_C, MCIF_WB_BUF_3_ADDR_C, mask_sh),\
+	SF(MCIF_WB_BUF_4_ADDR_Y, MCIF_WB_BUF_4_ADDR_Y, mask_sh),\
+	SF(MCIF_WB_BUF_4_ADDR_C, MCIF_WB_BUF_4_ADDR_C, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_LOCK_IGNORE, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_INT_ACK, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_SLICE_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_LOCK, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_SLICE_SIZE, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_REFRESH_WATERMARK, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_CONTROL, NB_PSTATE_CHANGE_URGENT_DURING_REQUEST, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_CONTROL, NB_PSTATE_CHANGE_FORCE_ON, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_CONTROL, NB_PSTATE_ALLOW_FOR_URGENT, mask_sh),\
+	SF(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK, mask_sh),\
+	SF(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, mask_sh),\
+	SF(MCIF_WB_CLOCK_GATER_CONTROL, MCIF_WB_CLI_CLOCK_GATER_OVERRIDE, mask_sh),\
+	SF(MCIF_WB_SELF_REFRESH_CONTROL, DIS_REFRESH_UNDER_NBPREQ, mask_sh),\
+	SF(MCIF_WB_SELF_REFRESH_CONTROL, PERFRAME_SELF_REFRESH, mask_sh),\
+	SF(MULTI_LEVEL_QOS_CTRL, MAX_SCALED_TIME_TO_URGENT, mask_sh),\
+	SF(MCIF_WB_BUF_LUMA_SIZE, MCIF_WB_BUF_LUMA_SIZE, mask_sh),\
+	SF(MCIF_WB_BUF_CHROMA_SIZE, MCIF_WB_BUF_CHROMA_SIZE, mask_sh),\
+	SF(MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_WB_BUF_1_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_WB_BUF_1_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_WB_BUF_2_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_WB_BUF_2_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_WB_BUF_3_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_WB_BUF_3_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_WB_BUF_4_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_WB_BUF_4_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_1_RESOLUTION, MCIF_WB_BUF_1_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB_BUF_1_RESOLUTION, MCIF_WB_BUF_1_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MCIF_WB_BUF_2_RESOLUTION, MCIF_WB_BUF_2_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB_BUF_2_RESOLUTION, MCIF_WB_BUF_2_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MCIF_WB_BUF_3_RESOLUTION, MCIF_WB_BUF_3_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB_BUF_3_RESOLUTION, MCIF_WB_BUF_3_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MCIF_WB_BUF_4_RESOLUTION, MCIF_WB_BUF_4_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB_BUF_4_RESOLUTION, MCIF_WB_BUF_4_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MMHUBBUB_WARMUP_ADDR_REGION, MMHUBBUB_WARMUP_ADDR_REGION, mask_sh),\
+	SF(MMHUBBUB_WARMUP_BASE_ADDR_HIGH, MMHUBBUB_WARMUP_BASE_ADDR_HIGH, mask_sh),\
+	SF(MMHUBBUB_WARMUP_BASE_ADDR_LOW, MMHUBBUB_WARMUP_BASE_ADDR_LOW, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_EN, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_EN, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_STATUS, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_ACK, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_INC_ADDR, mask_sh),\
+	SF(MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI, MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI, mask_sh)
+
+
+#define MCIF_WB_REG_FIELD_LIST_DCN3_0(type) \
+	MCIF_WB_REG_FIELD_LIST_DCN2_0(type);\
+	type WBIF_WHOLE_BUF_MODE;\
+	type MMHUBBUB_WARMUP_ADDR_REGION;\
+	type MMHUBBUB_WARMUP_BASE_ADDR_HIGH;\
+	type MMHUBBUB_WARMUP_BASE_ADDR_LOW;\
+	type MMHUBBUB_WARMUP_EN;\
+	type MMHUBBUB_WARMUP_SW_INT_EN;\
+	type MMHUBBUB_WARMUP_SW_INT_STATUS;\
+	type MMHUBBUB_WARMUP_SW_INT_ACK;\
+	type MMHUBBUB_WARMUP_INC_ADDR;\
+	type MMHUBBUB_WARMUP_P_VMID;\
+	type MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI
+
+#define MCIF_WB_REG_VARIABLE_LIST_DCN3_0 \
+	MCIF_WB_REG_VARIABLE_LIST_DCN2_0; \
+	uint32_t MMHUBBUB_MEM_PWR_CNTL;\
+	uint32_t MMHUBBUB_WARMUP_ADDR_REGION;\
+	uint32_t MMHUBBUB_WARMUP_BASE_ADDR_HIGH;\
+	uint32_t MMHUBBUB_WARMUP_BASE_ADDR_LOW;\
+	uint32_t MMHUBBUB_WARMUP_CONTROL_STATUS;\
+	uint32_t MMHUBBUB_WARMUP_P_VMID;\
+	uint32_t MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI
+
+struct dcn30_mmhubbub_registers {
+	MCIF_WB_REG_VARIABLE_LIST_DCN3_0;
+};
+
+
+struct dcn30_mmhubbub_mask {
+	MCIF_WB_REG_FIELD_LIST_DCN3_0(uint32_t);
+};
+
+struct dcn30_mmhubbub_shift {
+	MCIF_WB_REG_FIELD_LIST_DCN3_0(uint8_t);
+};
+
+struct dcn30_mmhubbub {
+	struct mcif_wb base;
+	const struct dcn30_mmhubbub_registers *mcif_wb_regs;
+	const struct dcn30_mmhubbub_shift *mcif_wb_shift;
+	const struct dcn30_mmhubbub_mask *mcif_wb_mask;
+};
+
+void dcn30_mmhubbub_construct(struct dcn30_mmhubbub *mcif_wb30,
+	struct dc_context *ctx,
+	const struct dcn30_mmhubbub_registers *mcif_wb_regs,
+	const struct dcn30_mmhubbub_shift *mcif_wb_shift,
+	const struct dcn30_mmhubbub_mask *mcif_wb_mask,
+	int inst);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h
index a5c8d92fc5c2..553f81c731f7 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h
@@ -43,6 +43,9 @@ struct mcif_arb_params {
 	unsigned int		arbitration_slice;
 	unsigned int		slice_lines;
 	unsigned int		max_scaled_time;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	unsigned int		dram_speed_change_duration;
+#endif
 };
 
 struct mcif_irq_params {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D591EAC01
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327D76E5BB;
	Mon,  1 Jun 2020 18:29:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D682A6E5BB
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:29:53 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id g7so482371qvx.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WiAYXHr9GgUg+nayeU4bPpsm+c3S1V6kEpAFfZXcw4M=;
 b=ZYTB5sqKP8G+fLoJmRF6nydPo+aFOypmZ25oE9Ar0rV/7R2RYBSSBg6LatBMiQXX8g
 vlocDj1kORX+AAfEVmtNZ9/Of/ODDrKvYdnKNoBvauRqBE4p+72jnEVrzXZ5VDAhrKcg
 GoqqT/jblKquwZ7zEo4Rto4sybNvSU1Wp9IststV7gYDBG7QoLOyGHS+fHRIDR1oZ2Hi
 I1RZJM7ZBXDJ50ymWfbaMkT+BepaHqWbV0ZsbEJojYqWsdVWpyLaodyxPNCrcqManh+4
 9FYvZ5DaSrzIsNa3OGpcVOMVl7W3wuOHsHhON3pn+2DJI895MwEhpbJ3kvIzNV0slUdw
 /bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WiAYXHr9GgUg+nayeU4bPpsm+c3S1V6kEpAFfZXcw4M=;
 b=KlxJ7bMX5eofldmoQDaeQJWjGySY+lVMBCurxWe0ZuoLa8K/kQh4nKPPJFBUvXuTTw
 mP0p7leZL9MYbI4HLtVCqXXK3RnzU0u5ZpXES0S7t05a33x6CIpczNHgJAmJFsExgwXp
 AAvioBUgnYli/AEufDVTDx+kOTqx3UV+48N/lA5wIGx81U51TsqU5A0bJY+qfeyiFOP3
 xaBUUMTK7QLQCH0iU9h2KiytFaigml4DA1yQWGygevTurUm3BJTL4Z3BqZSNwe0kgZzq
 H73TzousRCbBGZiTJT/N4YcE601Rj7NprMCZMEaYrkCrPJLUi/xuYCv+KZfpWos8C3sw
 X6lA==
X-Gm-Message-State: AOAM533v1Pjr8RAhtonGviWKN4EdRmUTtXE1NHQpeVss7sTIJcaBg3QU
 wvtHOvtQpHwNOmU0iHOUN/MaTVkV
X-Google-Smtp-Source: ABdhPJwoMjbSMUK/VbQyVUe9if8KE+bgR8d6J3WJlwrgXQYf/0WOwDlRK3ilmF1yZgU6cSH3kI3XkA==
X-Received: by 2002:a05:6214:18c9:: with SMTP id
 cy9mr21266211qvb.77.1591036189960; 
 Mon, 01 Jun 2020 11:29:49 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:29:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 186/207] drm/amd/display: Add DCN3 DPP
Date: Mon,  1 Jun 2020 14:29:05 -0400
Message-Id: <20200601182926.1267958-8-alexander.deucher@amd.com>
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

Add support to program the DCN3 DPP (Multiple pipe and plane combine)

HW Blocks:

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
 .../amd/display/dc/dcn30/dcn30_cm_common.c    |  640 ++++++++
 .../amd/display/dc/dcn30/dcn30_cm_common.h    |   78 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  | 1414 +++++++++++++++++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h  |  608 +++++++
 .../drm/amd/display/dc/dcn30/dcn30_dpp_cm.c   |  410 +++++
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |    7 +
 6 files changed, 3157 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
new file mode 100644
index 000000000000..a139a87a1a81
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
@@ -0,0 +1,640 @@
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
+#include "dm_services.h"
+#include "core_types.h"
+#include "reg_helper.h"
+#include "dcn30_dpp.h"
+#include "basics/conversion.h"
+#include "dcn30_cm_common.h"
+#include "custom_float.h"
+
+#define REG(reg) reg
+
+#define CTX \
+	ctx //dpp->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	reg->shifts.field_name, reg->masks.field_name
+
+void cm_helper_program_gamcor_xfer_func(
+		struct dc_context *ctx,
+		const struct pwl_params *params,
+		const struct dcn3_xfer_func_reg *reg)
+{
+	uint32_t reg_region_cur;
+	unsigned int i = 0;
+
+	REG_SET_2(reg->start_cntl_b, 0,
+		exp_region_start, params->corner_points[0].blue.custom_float_x,
+		exp_resion_start_segment, 0);
+	REG_SET_2(reg->start_cntl_g, 0,
+		exp_region_start, params->corner_points[0].green.custom_float_x,
+		exp_resion_start_segment, 0);
+	REG_SET_2(reg->start_cntl_r, 0,
+		exp_region_start, params->corner_points[0].red.custom_float_x,
+		exp_resion_start_segment, 0);
+
+	REG_SET(reg->start_slope_cntl_b, 0, //linear slope at start of curve
+		field_region_linear_slope, params->corner_points[0].blue.custom_float_slope);
+	REG_SET(reg->start_slope_cntl_g, 0,
+		field_region_linear_slope, params->corner_points[0].green.custom_float_slope);
+	REG_SET(reg->start_slope_cntl_r, 0,
+		field_region_linear_slope, params->corner_points[0].red.custom_float_slope);
+
+	REG_SET(reg->start_end_cntl1_b, 0,
+		field_region_end_base, params->corner_points[1].blue.custom_float_y);
+	REG_SET(reg->start_end_cntl1_g, 0,
+		field_region_end_base, params->corner_points[1].green.custom_float_y);
+	REG_SET(reg->start_end_cntl1_r, 0,
+		field_region_end_base, params->corner_points[1].red.custom_float_y);
+
+	REG_SET_2(reg->start_end_cntl2_b, 0,
+		field_region_end_slope, params->corner_points[1].blue.custom_float_slope,
+		field_region_end, params->corner_points[1].blue.custom_float_x);
+	REG_SET_2(reg->start_end_cntl2_g, 0,
+		field_region_end_slope, params->corner_points[1].green.custom_float_slope,
+		field_region_end, params->corner_points[1].green.custom_float_x);
+	REG_SET_2(reg->start_end_cntl2_r, 0,
+		field_region_end_slope, params->corner_points[1].red.custom_float_slope,
+		field_region_end, params->corner_points[1].red.custom_float_x);
+
+	for (reg_region_cur = reg->region_start;
+		reg_region_cur <= reg->region_end;
+		reg_region_cur++) {
+
+		const struct gamma_curve *curve0 = &(params->arr_curve_points[2 * i]);
+		const struct gamma_curve *curve1 = &(params->arr_curve_points[(2 * i) + 1]);
+
+		REG_SET_4(reg_region_cur, 0,
+			exp_region0_lut_offset, curve0->offset,
+			exp_region0_num_segments, curve0->segments_num,
+			exp_region1_lut_offset, curve1->offset,
+			exp_region1_num_segments, curve1->segments_num);
+
+		i++;
+	}
+}
+
+/* driver uses 32 regions or less, but DCN HW has 34, extra 2 are set to 0 */
+#define MAX_REGIONS_NUMBER 34
+#define MAX_LOW_POINT      25
+#define NUMBER_REGIONS     32
+#define NUMBER_SW_SEGMENTS 16
+
+bool cm3_helper_translate_curve_to_hw_format(
+				const struct dc_transfer_func *output_tf,
+				struct pwl_params *lut_params, bool fixpoint)
+{
+	struct curve_points3 *corner_points;
+	struct pwl_result_data *rgb_resulted;
+	struct pwl_result_data *rgb;
+	struct pwl_result_data *rgb_plus_1;
+	struct fixed31_32 end_value;
+
+	int32_t region_start, region_end;
+	int32_t i;
+	uint32_t j, k, seg_distr[MAX_REGIONS_NUMBER], increment, start_index, hw_points;
+
+	if (output_tf == NULL || lut_params == NULL || output_tf->type == TF_TYPE_BYPASS)
+		return false;
+
+	PERF_TRACE_CTX(output_tf->ctx);
+
+	corner_points = lut_params->corner_points;
+	rgb_resulted = lut_params->rgb_resulted;
+	hw_points = 0;
+
+	memset(lut_params, 0, sizeof(struct pwl_params));
+	memset(seg_distr, 0, sizeof(seg_distr));
+
+	if (output_tf->tf == TRANSFER_FUNCTION_PQ || output_tf->tf == TRANSFER_FUNCTION_GAMMA22 ||
+		output_tf->tf == TRANSFER_FUNCTION_HLG) {
+		/* 32 segments
+		 * segments are from 2^-25 to 2^7
+		 */
+		for (i = 0; i < NUMBER_REGIONS ; i++)
+			seg_distr[i] = 3;
+
+		region_start = -MAX_LOW_POINT;
+		region_end   = NUMBER_REGIONS - MAX_LOW_POINT;
+	} else {
+		/* 10 segments
+		 * segment is from 2^-10 to 2^0
+		 * There are less than 256 points, for optimization
+		 */
+		seg_distr[0] = 3;
+		seg_distr[1] = 4;
+		seg_distr[2] = 4;
+		seg_distr[3] = 4;
+		seg_distr[4] = 4;
+		seg_distr[5] = 4;
+		seg_distr[6] = 4;
+		seg_distr[7] = 4;
+		seg_distr[8] = 4;
+		seg_distr[9] = 4;
+
+		region_start = -10;
+		region_end = 0;
+	}
+
+	for (i = region_end - region_start; i < MAX_REGIONS_NUMBER ; i++)
+		seg_distr[i] = -1;
+
+	for (k = 0; k < MAX_REGIONS_NUMBER; k++) {
+		if (seg_distr[k] != -1)
+			hw_points += (1 << seg_distr[k]);
+	}
+
+	j = 0;
+	for (k = 0; k < (region_end - region_start); k++) {
+		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
+		start_index = (region_start + k + MAX_LOW_POINT) *
+				NUMBER_SW_SEGMENTS;
+		for (i = start_index; i < start_index + NUMBER_SW_SEGMENTS;
+				i += increment) {
+			if (j == hw_points - 1)
+				break;
+			rgb_resulted[j].red = output_tf->tf_pts.red[i];
+			rgb_resulted[j].green = output_tf->tf_pts.green[i];
+			rgb_resulted[j].blue = output_tf->tf_pts.blue[i];
+			j++;
+		}
+	}
+
+	/* last point */
+	start_index = (region_end + MAX_LOW_POINT) * NUMBER_SW_SEGMENTS;
+	rgb_resulted[hw_points - 1].red = output_tf->tf_pts.red[start_index];
+	rgb_resulted[hw_points - 1].green = output_tf->tf_pts.green[start_index];
+	rgb_resulted[hw_points - 1].blue = output_tf->tf_pts.blue[start_index];
+
+	// All 3 color channels have same x
+	corner_points[0].red.x = dc_fixpt_pow(dc_fixpt_from_int(2),
+					     dc_fixpt_from_int(region_start));
+	corner_points[0].green.x = corner_points[0].red.x;
+	corner_points[0].blue.x = corner_points[0].red.x;
+
+	corner_points[1].red.x = dc_fixpt_pow(dc_fixpt_from_int(2),
+					     dc_fixpt_from_int(region_end));
+	corner_points[1].green.x = corner_points[1].red.x;
+	corner_points[1].blue.x = corner_points[1].red.x;
+
+	corner_points[0].red.y = rgb_resulted[0].red;
+	corner_points[0].green.y = rgb_resulted[0].green;
+	corner_points[0].blue.y = rgb_resulted[0].blue;
+
+	corner_points[0].red.slope = dc_fixpt_div(corner_points[0].red.y,
+			corner_points[0].red.x);
+	corner_points[0].green.slope = dc_fixpt_div(corner_points[0].green.y,
+			corner_points[0].green.x);
+	corner_points[0].blue.slope = dc_fixpt_div(corner_points[0].blue.y,
+			corner_points[0].blue.x);
+
+	/* see comment above, m_arrPoints[1].y should be the Y value for the
+	 * region end (m_numOfHwPoints), not last HW point(m_numOfHwPoints - 1)
+	 */
+	corner_points[1].red.y = rgb_resulted[hw_points - 1].red;
+	corner_points[1].green.y = rgb_resulted[hw_points - 1].green;
+	corner_points[1].blue.y = rgb_resulted[hw_points - 1].blue;
+	corner_points[1].red.slope = dc_fixpt_zero;
+	corner_points[1].green.slope = dc_fixpt_zero;
+	corner_points[1].blue.slope = dc_fixpt_zero;
+
+	if (output_tf->tf == TRANSFER_FUNCTION_PQ || output_tf->tf == TRANSFER_FUNCTION_HLG) {
+		/* for PQ/HLG, we want to have a straight line from last HW X point,
+		 * and the slope to be such that we hit 1.0 at 10000/1000 nits.
+		 */
+
+		if (output_tf->tf == TRANSFER_FUNCTION_PQ)
+			end_value = dc_fixpt_from_int(125);
+		else
+			end_value = dc_fixpt_from_fraction(125, 10);
+
+		corner_points[1].red.slope = dc_fixpt_div(
+			dc_fixpt_sub(dc_fixpt_one, corner_points[1].red.y),
+			dc_fixpt_sub(end_value, corner_points[1].red.x));
+		corner_points[1].green.slope = dc_fixpt_div(
+			dc_fixpt_sub(dc_fixpt_one, corner_points[1].green.y),
+			dc_fixpt_sub(end_value, corner_points[1].green.x));
+		corner_points[1].blue.slope = dc_fixpt_div(
+			dc_fixpt_sub(dc_fixpt_one, corner_points[1].blue.y),
+			dc_fixpt_sub(end_value, corner_points[1].blue.x));
+	}
+	lut_params->hw_points_num = hw_points;
+
+	k = 0;
+	for (i = 1; i < MAX_REGIONS_NUMBER; i++) {
+		if (seg_distr[k] != -1) {
+			lut_params->arr_curve_points[k].segments_num =
+					seg_distr[k];
+			lut_params->arr_curve_points[i].offset =
+					lut_params->arr_curve_points[k].offset + (1 << seg_distr[k]);
+		}
+		k++;
+	}
+
+	if (seg_distr[k] != -1)
+		lut_params->arr_curve_points[k].segments_num = seg_distr[k];
+
+	rgb = rgb_resulted;
+	rgb_plus_1 = rgb_resulted + 1;
+
+	i = 1;
+	while (i != hw_points + 1) {
+		if (dc_fixpt_lt(rgb_plus_1->red, rgb->red))
+			rgb_plus_1->red = rgb->red;
+		if (dc_fixpt_lt(rgb_plus_1->green, rgb->green))
+			rgb_plus_1->green = rgb->green;
+		if (dc_fixpt_lt(rgb_plus_1->blue, rgb->blue))
+			rgb_plus_1->blue = rgb->blue;
+
+		rgb->delta_red   = dc_fixpt_sub(rgb_plus_1->red,   rgb->red);
+		rgb->delta_green = dc_fixpt_sub(rgb_plus_1->green, rgb->green);
+		rgb->delta_blue  = dc_fixpt_sub(rgb_plus_1->blue,  rgb->blue);
+
+		if (fixpoint == true) {
+			rgb->delta_red_reg   = dc_fixpt_clamp_u0d10(rgb->delta_red);
+			rgb->delta_green_reg = dc_fixpt_clamp_u0d10(rgb->delta_green);
+			rgb->delta_blue_reg  = dc_fixpt_clamp_u0d10(rgb->delta_blue);
+			rgb->red_reg         = dc_fixpt_clamp_u0d14(rgb->red);
+			rgb->green_reg       = dc_fixpt_clamp_u0d14(rgb->green);
+			rgb->blue_reg        = dc_fixpt_clamp_u0d14(rgb->blue);
+		}
+
+		++rgb_plus_1;
+		++rgb;
+		++i;
+	}
+	cm3_helper_convert_to_custom_float(rgb_resulted,
+						lut_params->corner_points,
+						hw_points, fixpoint);
+
+	return true;
+}
+
+#define NUM_DEGAMMA_REGIONS    12
+
+
+bool cm3_helper_translate_curve_to_degamma_hw_format(
+				const struct dc_transfer_func *output_tf,
+				struct pwl_params *lut_params)
+{
+	struct curve_points3 *corner_points;
+	struct pwl_result_data *rgb_resulted;
+	struct pwl_result_data *rgb;
+	struct pwl_result_data *rgb_plus_1;
+
+	int32_t region_start, region_end;
+	int32_t i;
+	uint32_t j, k, seg_distr[MAX_REGIONS_NUMBER], increment, start_index, hw_points;
+
+	if (output_tf == NULL || lut_params == NULL || output_tf->type == TF_TYPE_BYPASS)
+		return false;
+
+	PERF_TRACE_CTX(output_tf->ctx);
+
+	corner_points = lut_params->corner_points;
+	rgb_resulted = lut_params->rgb_resulted;
+	hw_points = 0;
+
+	memset(lut_params, 0, sizeof(struct pwl_params));
+	memset(seg_distr, 0, sizeof(seg_distr));
+
+	region_start = -NUM_DEGAMMA_REGIONS;
+	region_end   = 0;
+
+
+	for (i = region_end - region_start; i < MAX_REGIONS_NUMBER ; i++)
+		seg_distr[i] = -1;
+	/* 12 segments
+	 * segments are from 2^-12 to 0
+	 */
+	for (i = 0; i < NUM_DEGAMMA_REGIONS ; i++)
+		seg_distr[i] = 4;
+
+	for (k = 0; k < MAX_REGIONS_NUMBER; k++) {
+		if (seg_distr[k] != -1)
+			hw_points += (1 << seg_distr[k]);
+	}
+
+	j = 0;
+	for (k = 0; k < (region_end - region_start); k++) {
+		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
+		start_index = (region_start + k + MAX_LOW_POINT) *
+				NUMBER_SW_SEGMENTS;
+		for (i = start_index; i < start_index + NUMBER_SW_SEGMENTS;
+				i += increment) {
+			if (j == hw_points - 1)
+				break;
+			rgb_resulted[j].red = output_tf->tf_pts.red[i];
+			rgb_resulted[j].green = output_tf->tf_pts.green[i];
+			rgb_resulted[j].blue = output_tf->tf_pts.blue[i];
+			j++;
+		}
+	}
+
+	/* last point */
+	start_index = (region_end + MAX_LOW_POINT) * NUMBER_SW_SEGMENTS;
+	rgb_resulted[hw_points - 1].red = output_tf->tf_pts.red[start_index];
+	rgb_resulted[hw_points - 1].green = output_tf->tf_pts.green[start_index];
+	rgb_resulted[hw_points - 1].blue = output_tf->tf_pts.blue[start_index];
+
+	corner_points[0].red.x = dc_fixpt_pow(dc_fixpt_from_int(2),
+					     dc_fixpt_from_int(region_start));
+	corner_points[0].green.x = corner_points[0].red.x;
+	corner_points[0].blue.x = corner_points[0].red.x;
+	corner_points[1].red.x = dc_fixpt_pow(dc_fixpt_from_int(2),
+					     dc_fixpt_from_int(region_end));
+	corner_points[1].green.x = corner_points[1].red.x;
+	corner_points[1].blue.x = corner_points[1].red.x;
+
+	corner_points[0].red.y = rgb_resulted[0].red;
+	corner_points[0].green.y = rgb_resulted[0].green;
+	corner_points[0].blue.y = rgb_resulted[0].blue;
+
+	/* see comment above, m_arrPoints[1].y should be the Y value for the
+	 * region end (m_numOfHwPoints), not last HW point(m_numOfHwPoints - 1)
+	 */
+	corner_points[1].red.y = rgb_resulted[hw_points - 1].red;
+	corner_points[1].green.y = rgb_resulted[hw_points - 1].green;
+	corner_points[1].blue.y = rgb_resulted[hw_points - 1].blue;
+	corner_points[1].red.slope = dc_fixpt_zero;
+	corner_points[1].green.slope = dc_fixpt_zero;
+	corner_points[1].blue.slope = dc_fixpt_zero;
+
+	if (output_tf->tf == TRANSFER_FUNCTION_PQ) {
+		/* for PQ, we want to have a straight line from last HW X point,
+		 * and the slope to be such that we hit 1.0 at 10000 nits.
+		 */
+		const struct fixed31_32 end_value =
+				dc_fixpt_from_int(125);
+
+		corner_points[1].red.slope = dc_fixpt_div(
+			dc_fixpt_sub(dc_fixpt_one, corner_points[1].red.y),
+			dc_fixpt_sub(end_value, corner_points[1].red.x));
+		corner_points[1].green.slope = dc_fixpt_div(
+			dc_fixpt_sub(dc_fixpt_one, corner_points[1].green.y),
+			dc_fixpt_sub(end_value, corner_points[1].green.x));
+		corner_points[1].blue.slope = dc_fixpt_div(
+			dc_fixpt_sub(dc_fixpt_one, corner_points[1].blue.y),
+			dc_fixpt_sub(end_value, corner_points[1].blue.x));
+	}
+
+	lut_params->hw_points_num = hw_points;
+
+	k = 0;
+	for (i = 1; i < MAX_REGIONS_NUMBER; i++) {
+		if (seg_distr[k] != -1) {
+			lut_params->arr_curve_points[k].segments_num =
+					seg_distr[k];
+			lut_params->arr_curve_points[i].offset =
+					lut_params->arr_curve_points[k].offset + (1 << seg_distr[k]);
+		}
+		k++;
+	}
+
+	if (seg_distr[k] != -1)
+		lut_params->arr_curve_points[k].segments_num = seg_distr[k];
+
+	rgb = rgb_resulted;
+	rgb_plus_1 = rgb_resulted + 1;
+
+	i = 1;
+	while (i != hw_points + 1) {
+		if (dc_fixpt_lt(rgb_plus_1->red, rgb->red))
+			rgb_plus_1->red = rgb->red;
+		if (dc_fixpt_lt(rgb_plus_1->green, rgb->green))
+			rgb_plus_1->green = rgb->green;
+		if (dc_fixpt_lt(rgb_plus_1->blue, rgb->blue))
+			rgb_plus_1->blue = rgb->blue;
+
+		rgb->delta_red   = dc_fixpt_sub(rgb_plus_1->red,   rgb->red);
+		rgb->delta_green = dc_fixpt_sub(rgb_plus_1->green, rgb->green);
+		rgb->delta_blue  = dc_fixpt_sub(rgb_plus_1->blue,  rgb->blue);
+
+		++rgb_plus_1;
+		++rgb;
+		++i;
+	}
+	cm3_helper_convert_to_custom_float(rgb_resulted,
+						lut_params->corner_points,
+						hw_points, false);
+
+	return true;
+}
+
+bool cm3_helper_convert_to_custom_float(
+		struct pwl_result_data *rgb_resulted,
+		struct curve_points3 *corner_points,
+		uint32_t hw_points_num,
+		bool fixpoint)
+{
+	struct custom_float_format fmt;
+
+	struct pwl_result_data *rgb = rgb_resulted;
+
+	uint32_t i = 0;
+
+	fmt.exponenta_bits = 6;
+	fmt.mantissa_bits = 12;
+	fmt.sign = false;
+
+	/* corner_points[0] - beginning base, slope offset for R,G,B
+	 * corner_points[1] - end base, slope offset for R,G,B
+	 */
+	if (!convert_to_custom_float_format(corner_points[0].red.x, &fmt,
+				&corner_points[0].red.custom_float_x)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[0].green.x, &fmt,
+				&corner_points[0].green.custom_float_x)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[0].blue.x, &fmt,
+				&corner_points[0].blue.custom_float_x)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+
+	if (!convert_to_custom_float_format(corner_points[0].red.offset, &fmt,
+				&corner_points[0].red.custom_float_offset)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[0].green.offset, &fmt,
+				&corner_points[0].green.custom_float_offset)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[0].blue.offset, &fmt,
+				&corner_points[0].blue.custom_float_offset)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+
+	if (!convert_to_custom_float_format(corner_points[0].red.slope, &fmt,
+				&corner_points[0].red.custom_float_slope)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[0].green.slope, &fmt,
+				&corner_points[0].green.custom_float_slope)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[0].blue.slope, &fmt,
+				&corner_points[0].blue.custom_float_slope)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+
+	if (fixpoint == true) {
+		corner_points[1].red.custom_float_y =
+				dc_fixpt_clamp_u0d14(corner_points[1].red.y);
+		corner_points[1].green.custom_float_y =
+				dc_fixpt_clamp_u0d14(corner_points[1].green.y);
+		corner_points[1].blue.custom_float_y =
+				dc_fixpt_clamp_u0d14(corner_points[1].blue.y);
+	} else {
+		if (!convert_to_custom_float_format(corner_points[1].red.y,
+				&fmt, &corner_points[1].red.custom_float_y)) {
+			BREAK_TO_DEBUGGER();
+			return false;
+		}
+		if (!convert_to_custom_float_format(corner_points[1].green.y,
+				&fmt, &corner_points[1].green.custom_float_y)) {
+			BREAK_TO_DEBUGGER();
+			return false;
+		}
+		if (!convert_to_custom_float_format(corner_points[1].blue.y,
+				&fmt, &corner_points[1].blue.custom_float_y)) {
+			BREAK_TO_DEBUGGER();
+			return false;
+		}
+	}
+
+	fmt.mantissa_bits = 10;
+	fmt.sign = false;
+
+	if (!convert_to_custom_float_format(corner_points[1].red.x, &fmt,
+				&corner_points[1].red.custom_float_x)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[1].green.x, &fmt,
+				&corner_points[1].green.custom_float_x)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[1].blue.x, &fmt,
+				&corner_points[1].blue.custom_float_x)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+
+	if (!convert_to_custom_float_format(corner_points[1].red.slope, &fmt,
+				&corner_points[1].red.custom_float_slope)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[1].green.slope, &fmt,
+				&corner_points[1].green.custom_float_slope)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+	if (!convert_to_custom_float_format(corner_points[1].blue.slope, &fmt,
+				&corner_points[1].blue.custom_float_slope)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+
+	if (hw_points_num == 0 || rgb_resulted == NULL || fixpoint == true)
+		return true;
+
+	fmt.mantissa_bits = 12;
+
+	while (i != hw_points_num) {
+		if (!convert_to_custom_float_format(rgb->red, &fmt,
+						    &rgb->red_reg)) {
+			BREAK_TO_DEBUGGER();
+			return false;
+		}
+
+		if (!convert_to_custom_float_format(rgb->green, &fmt,
+						    &rgb->green_reg)) {
+			BREAK_TO_DEBUGGER();
+			return false;
+		}
+
+		if (!convert_to_custom_float_format(rgb->blue, &fmt,
+						    &rgb->blue_reg)) {
+			BREAK_TO_DEBUGGER();
+			return false;
+		}
+
+		if (!convert_to_custom_float_format(rgb->delta_red, &fmt,
+						    &rgb->delta_red_reg)) {
+			BREAK_TO_DEBUGGER();
+			return false;
+		}
+
+		if (!convert_to_custom_float_format(rgb->delta_green, &fmt,
+						    &rgb->delta_green_reg)) {
+			BREAK_TO_DEBUGGER();
+			return false;
+		}
+
+		if (!convert_to_custom_float_format(rgb->delta_blue, &fmt,
+						    &rgb->delta_blue_reg)) {
+			BREAK_TO_DEBUGGER();
+			return false;
+		}
+
+		++rgb;
+		++i;
+	}
+
+	return true;
+}
+
+bool is_rgb_equal(const struct pwl_result_data *rgb, uint32_t num)
+{
+	uint32_t i;
+	bool ret = true;
+
+	for (i = 0 ; i < num; i++) {
+		if (rgb[i].red_reg != rgb[i].green_reg ||
+		rgb[i].blue_reg != rgb[i].red_reg  ||
+		rgb[i].blue_reg != rgb[i].green_reg) {
+			ret = false;
+			break;
+		}
+	}
+	return ret;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.h
new file mode 100644
index 000000000000..bd98b327a6c7
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.h
@@ -0,0 +1,78 @@
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
+#include "dcn10/dcn10_cm_common.h"
+
+#ifndef __DAL_DCN30_CM_COMMON_H__
+#define __DAL_DCN30_CM_COMMON_H__
+
+#define TF_HELPER_REG_FIELD_LIST_DCN3(type) \
+	TF_HELPER_REG_FIELD_LIST(type);\
+	type field_region_start_base;\
+	type field_offset
+
+struct DCN3_xfer_func_shift {
+	TF_HELPER_REG_FIELD_LIST_DCN3(uint8_t);
+};
+
+struct DCN3_xfer_func_mask {
+	TF_HELPER_REG_FIELD_LIST_DCN3(uint32_t);
+};
+
+struct dcn3_xfer_func_reg {
+	struct DCN3_xfer_func_shift shifts;
+	struct DCN3_xfer_func_mask masks;
+
+	TF_HELPER_REG_LIST;
+	uint32_t offset_b;
+	uint32_t offset_g;
+	uint32_t offset_r;
+	uint32_t start_base_cntl_b;
+	uint32_t start_base_cntl_g;
+	uint32_t start_base_cntl_r;
+};
+
+void cm_helper_program_gamcor_xfer_func(
+	struct dc_context *ctx,
+	const struct pwl_params *params,
+	const struct dcn3_xfer_func_reg *reg);
+
+bool cm3_helper_translate_curve_to_hw_format(
+	const struct dc_transfer_func *output_tf,
+	struct pwl_params *lut_params, bool fixpoint);
+
+bool cm3_helper_translate_curve_to_degamma_hw_format(
+				const struct dc_transfer_func *output_tf,
+				struct pwl_params *lut_params);
+
+bool cm3_helper_convert_to_custom_float(
+		struct pwl_result_data *rgb_resulted,
+		struct curve_points3 *corner_points,
+		uint32_t hw_points_num,
+		bool fixpoint);
+
+bool is_rgb_equal(const struct pwl_result_data *rgb, uint32_t num);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
new file mode 100644
index 000000000000..0eb881f2e0d6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -0,0 +1,1414 @@
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
+#include "dm_services.h"
+#include "core_types.h"
+#include "reg_helper.h"
+#include "dcn30_dpp.h"
+#include "basics/conversion.h"
+#include "dcn30_cm_common.h"
+
+#define REG(reg)\
+	dpp->tf_regs->reg
+
+#define CTX \
+	dpp->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	dpp->tf_shift->field_name, dpp->tf_mask->field_name
+
+
+void dpp30_read_state(struct dpp *dpp_base,
+		struct dcn_dpp_state *s)
+{
+	struct dcn20_dpp *dpp = TO_DCN20_DPP(dpp_base);
+
+	REG_GET(DPP_CONTROL,
+			DPP_CLOCK_ENABLE, &s->is_enabled);
+
+	// TODO: Implement for DCN3
+}
+/*program post scaler scs block in dpp CM*/
+void dpp3_program_post_csc(
+		struct dpp *dpp_base,
+		enum dc_color_space color_space,
+		enum dcn10_input_csc_select input_select,
+		const struct out_csc_color_matrix *tbl_entry)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	int i;
+	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
+	const uint16_t *regval = NULL;
+	uint32_t cur_select = 0;
+	enum dcn10_input_csc_select select;
+	struct color_matrices_reg gam_regs;
+
+	if (input_select == INPUT_CSC_SELECT_BYPASS) {
+		REG_SET(CM_POST_CSC_CONTROL, 0, CM_POST_CSC_MODE, 0);
+		return;
+	}
+
+	if (tbl_entry == NULL) {
+		for (i = 0; i < arr_size; i++)
+			if (dpp_input_csc_matrix[i].color_space == color_space) {
+				regval = dpp_input_csc_matrix[i].regval;
+				break;
+			}
+
+		if (regval == NULL) {
+			BREAK_TO_DEBUGGER();
+			return;
+		}
+	} else {
+		regval = tbl_entry->regval;
+	}
+
+	/* determine which CSC matrix (icsc or coma) we are using
+	 * currently.  select the alternate set to double buffer
+	 * the CSC update so CSC is updated on frame boundary
+	 */
+	REG_GET(CM_POST_CSC_CONTROL,
+			CM_POST_CSC_MODE_CURRENT, &cur_select);
+
+	if (cur_select != INPUT_CSC_SELECT_ICSC)
+		select = INPUT_CSC_SELECT_ICSC;
+	else
+		select = INPUT_CSC_SELECT_COMA;
+
+	gam_regs.shifts.csc_c11 = dpp->tf_shift->CM_POST_CSC_C11;
+	gam_regs.masks.csc_c11  = dpp->tf_mask->CM_POST_CSC_C11;
+	gam_regs.shifts.csc_c12 = dpp->tf_shift->CM_POST_CSC_C12;
+	gam_regs.masks.csc_c12 = dpp->tf_mask->CM_POST_CSC_C12;
+
+	if (select == INPUT_CSC_SELECT_ICSC) {
+
+		gam_regs.csc_c11_c12 = REG(CM_POST_CSC_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_POST_CSC_C33_C34);
+
+	} else {
+
+		gam_regs.csc_c11_c12 = REG(CM_POST_CSC_B_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_POST_CSC_B_C33_C34);
+
+	}
+
+	cm_helper_program_color_matrices(
+			dpp->base.ctx,
+			regval,
+			&gam_regs);
+
+	REG_SET(CM_POST_CSC_CONTROL, 0,
+			CM_POST_CSC_MODE, select);
+}
+
+
+/*CNVC degam unit has read only LUTs*/
+void dpp3_set_pre_degam(struct dpp *dpp_base, enum dc_transfer_func_predefined tr)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	int pre_degam_en = 1;
+	int degamma_lut_selection = 0;
+
+	switch (tr) {
+	case TRANSFER_FUNCTION_LINEAR:
+	case TRANSFER_FUNCTION_UNITY:
+		pre_degam_en = 0; //bypass
+		break;
+	case TRANSFER_FUNCTION_SRGB:
+		degamma_lut_selection = 0;
+		break;
+	case TRANSFER_FUNCTION_BT709:
+		degamma_lut_selection = 4;
+		break;
+	case TRANSFER_FUNCTION_PQ:
+		degamma_lut_selection = 5;
+		break;
+	case TRANSFER_FUNCTION_HLG:
+		degamma_lut_selection = 6;
+		break;
+	case TRANSFER_FUNCTION_GAMMA22:
+		degamma_lut_selection = 1;
+		break;
+	case TRANSFER_FUNCTION_GAMMA24:
+		degamma_lut_selection = 2;
+		break;
+	case TRANSFER_FUNCTION_GAMMA26:
+		degamma_lut_selection = 3;
+		break;
+	default:
+		pre_degam_en = 0;
+		break;
+	}
+
+	REG_SET_2(PRE_DEGAM, 0,
+			PRE_DEGAM_MODE, pre_degam_en,
+			PRE_DEGAM_SELECT, degamma_lut_selection);
+}
+
+static void dpp3_cnv_setup (
+		struct dpp *dpp_base,
+		enum surface_pixel_format format,
+		enum expansion_mode mode,
+		struct dc_csc_transform input_csc_color_matrix,
+		enum dc_color_space input_color_space,
+		struct cnv_alpha_2bit_lut *alpha_2bit_lut)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	uint32_t pixel_format = 0;
+	uint32_t alpha_en = 1;
+	enum dc_color_space color_space = COLOR_SPACE_SRGB;
+	enum dcn10_input_csc_select select = INPUT_CSC_SELECT_BYPASS;
+	bool force_disable_cursor = false;
+	uint32_t is_2bit = 0;
+	uint32_t alpha_plane_enable = 0;
+	uint32_t dealpha_en = 0, dealpha_ablnd_en = 0;
+	uint32_t realpha_en = 0, realpha_ablnd_en = 0;
+	uint32_t program_prealpha_dealpha = 0;
+	struct out_csc_color_matrix tbl_entry;
+	int i;
+
+	REG_SET_2(FORMAT_CONTROL, 0,
+		CNVC_BYPASS, 0,
+		FORMAT_EXPANSION_MODE, mode);
+
+	REG_UPDATE(FORMAT_CONTROL, FORMAT_CNV16, 0);
+	REG_UPDATE(FORMAT_CONTROL, CNVC_BYPASS_MSB_ALIGN, 0);
+	REG_UPDATE(FORMAT_CONTROL, CLAMP_POSITIVE, 0);
+	REG_UPDATE(FORMAT_CONTROL, CLAMP_POSITIVE_C, 0);
+
+	REG_UPDATE(FORMAT_CONTROL, FORMAT_CROSSBAR_R, 0);
+	REG_UPDATE(FORMAT_CONTROL, FORMAT_CROSSBAR_G, 1);
+	REG_UPDATE(FORMAT_CONTROL, FORMAT_CROSSBAR_B, 2);
+
+	switch (format) {
+	case SURFACE_PIXEL_FORMAT_GRPH_ARGB1555:
+		pixel_format = 1;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_RGB565:
+		pixel_format = 3;
+		alpha_en = 0;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_ARGB8888:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR8888:
+		pixel_format = 8;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_ARGB2101010:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010:
+		pixel_format = 10;
+		is_2bit = 1;
+		break;
+	case SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr:
+		force_disable_cursor = false;
+		pixel_format = 65;
+		color_space = COLOR_SPACE_YCBCR709;
+		select = INPUT_CSC_SELECT_ICSC;
+		break;
+	case SURFACE_PIXEL_FORMAT_VIDEO_420_YCrCb:
+		force_disable_cursor = true;
+		pixel_format = 64;
+		color_space = COLOR_SPACE_YCBCR709;
+		select = INPUT_CSC_SELECT_ICSC;
+		break;
+	case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCbCr:
+		force_disable_cursor = true;
+		pixel_format = 67;
+		color_space = COLOR_SPACE_YCBCR709;
+		select = INPUT_CSC_SELECT_ICSC;
+		break;
+	case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCrCb:
+		force_disable_cursor = true;
+		pixel_format = 66;
+		color_space = COLOR_SPACE_YCBCR709;
+		select = INPUT_CSC_SELECT_ICSC;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+		pixel_format = 22;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
+		pixel_format = 24;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
+		pixel_format = 25;
+		break;
+	case SURFACE_PIXEL_FORMAT_VIDEO_AYCrCb8888:
+		pixel_format = 12;
+		color_space = COLOR_SPACE_YCBCR709;
+		select = INPUT_CSC_SELECT_ICSC;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_RGB111110_FIX:
+		pixel_format = 112;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_BGR101111_FIX:
+		pixel_format = 113;
+		break;
+	case SURFACE_PIXEL_FORMAT_VIDEO_ACrYCb2101010:
+		pixel_format = 114;
+		color_space = COLOR_SPACE_YCBCR709;
+		select = INPUT_CSC_SELECT_ICSC;
+		is_2bit = 1;
+		break;
+	case SURFACE_PIXEL_FORMAT_VIDEO_CrYCbA1010102:
+		pixel_format = 115;
+		color_space = COLOR_SPACE_YCBCR709;
+		select = INPUT_CSC_SELECT_ICSC;
+		is_2bit = 1;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_RGBE:
+		pixel_format = 116;
+		alpha_plane_enable = 0;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
+		pixel_format = 116;
+		alpha_plane_enable = 1;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_RGB111110_FLOAT:
+		pixel_format = 118;
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_BGR101111_FLOAT:
+		pixel_format = 119;
+		break;
+	default:
+		break;
+	}
+
+	if (is_2bit == 1 && alpha_2bit_lut != NULL) {
+		REG_UPDATE(ALPHA_2BIT_LUT, ALPHA_2BIT_LUT0, alpha_2bit_lut->lut0);
+		REG_UPDATE(ALPHA_2BIT_LUT, ALPHA_2BIT_LUT1, alpha_2bit_lut->lut1);
+		REG_UPDATE(ALPHA_2BIT_LUT, ALPHA_2BIT_LUT2, alpha_2bit_lut->lut2);
+		REG_UPDATE(ALPHA_2BIT_LUT, ALPHA_2BIT_LUT3, alpha_2bit_lut->lut3);
+	}
+
+	REG_SET_2(CNVC_SURFACE_PIXEL_FORMAT, 0,
+			CNVC_SURFACE_PIXEL_FORMAT, pixel_format,
+			CNVC_ALPHA_PLANE_ENABLE, alpha_plane_enable);
+	REG_UPDATE(FORMAT_CONTROL, FORMAT_CONTROL__ALPHA_EN, alpha_en);
+
+	if (program_prealpha_dealpha) {
+		dealpha_en = 1;
+		realpha_en = 1;
+	}
+	REG_SET_2(PRE_DEALPHA, 0,
+			PRE_DEALPHA_EN, dealpha_en,
+			PRE_DEALPHA_ABLND_EN, dealpha_ablnd_en);
+	REG_SET_2(PRE_REALPHA, 0,
+			PRE_REALPHA_EN, realpha_en,
+			PRE_REALPHA_ABLND_EN, realpha_ablnd_en);
+
+	/* If input adjustment exists, program the ICSC with those values. */
+	if (input_csc_color_matrix.enable_adjustment == true) {
+		for (i = 0; i < 12; i++)
+			tbl_entry.regval[i] = input_csc_color_matrix.matrix[i];
+
+		tbl_entry.color_space = input_color_space;
+
+		if (color_space >= COLOR_SPACE_YCBCR601)
+			select = INPUT_CSC_SELECT_ICSC;
+		else
+			select = INPUT_CSC_SELECT_BYPASS;
+
+		dpp3_program_post_csc(dpp_base, color_space, select,
+				      &tbl_entry);
+	} else {
+		dpp3_program_post_csc(dpp_base, color_space, select, NULL);
+	}
+
+	if (force_disable_cursor) {
+		REG_UPDATE(CURSOR_CONTROL,
+				CURSOR_ENABLE, 0);
+		REG_UPDATE(CURSOR0_CONTROL,
+				CUR0_ENABLE, 0);
+	}
+}
+
+#define IDENTITY_RATIO(ratio) (dc_fixpt_u3d19(ratio) == (1 << 19))
+
+void dpp3_set_cursor_attributes(
+		struct dpp *dpp_base,
+		struct dc_cursor_attributes *cursor_attributes)
+{
+	enum dc_cursor_color_format color_format = cursor_attributes->color_format;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	int cur_rom_en = 0;
+
+	if (color_format == CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA ||
+		color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA)
+		cur_rom_en = 1;
+
+	REG_UPDATE_3(CURSOR0_CONTROL,
+			CUR0_MODE, color_format,
+			CUR0_EXPANSION_MODE, 0,
+			CUR0_ROM_EN, cur_rom_en);
+
+	if (color_format == CURSOR_MODE_MONO) {
+		/* todo: clarify what to program these to */
+		REG_UPDATE(CURSOR0_COLOR0,
+				CUR0_COLOR0, 0x00000000);
+		REG_UPDATE(CURSOR0_COLOR1,
+				CUR0_COLOR1, 0xFFFFFFFF);
+	}
+}
+
+
+bool dpp3_get_optimal_number_of_taps(
+		struct dpp *dpp,
+		struct scaler_data *scl_data,
+		const struct scaling_taps *in_taps)
+{
+	int num_part_y, num_part_c;
+	int max_taps_y, max_taps_c;
+	int min_taps_y, min_taps_c;
+	enum lb_memory_config lb_config;
+
+	/* Some ASICs does not support  FP16 scaling, so we reject modes require this*/
+	if (scl_data->viewport.width  != scl_data->h_active &&
+		scl_data->viewport.height != scl_data->v_active &&
+		dpp->caps->dscl_data_proc_format == DSCL_DATA_PRCESSING_FIXED_FORMAT &&
+		scl_data->format == PIXEL_FORMAT_FP16)
+		return false;
+
+	if (scl_data->viewport.width > scl_data->h_active &&
+		dpp->ctx->dc->debug.max_downscale_src_width != 0 &&
+		scl_data->viewport.width > dpp->ctx->dc->debug.max_downscale_src_width)
+		return false;
+
+	/*
+	 * Set default taps if none are provided
+	 * From programming guide: taps = min{ ceil(2*H_RATIO,1), 8} for downscaling
+	 * taps = 4 for upscaling
+	 */
+	if (in_taps->h_taps == 0) {
+		if (dc_fixpt_ceil(scl_data->ratios.horz) > 1)
+			scl_data->taps.h_taps = min(2 * dc_fixpt_ceil(scl_data->ratios.horz), 8);
+		else
+			scl_data->taps.h_taps = 4;
+	} else
+		scl_data->taps.h_taps = in_taps->h_taps;
+	if (in_taps->v_taps == 0) {
+		if (dc_fixpt_ceil(scl_data->ratios.vert) > 1)
+			scl_data->taps.v_taps = min(dc_fixpt_ceil(dc_fixpt_mul_int(scl_data->ratios.vert, 2)), 8);
+		else
+			scl_data->taps.v_taps = 4;
+	} else
+		scl_data->taps.v_taps = in_taps->v_taps;
+	if (in_taps->v_taps_c == 0) {
+		if (dc_fixpt_ceil(scl_data->ratios.vert_c) > 1)
+			scl_data->taps.v_taps_c = min(dc_fixpt_ceil(dc_fixpt_mul_int(scl_data->ratios.vert_c, 2)), 8);
+		else
+			scl_data->taps.v_taps_c = 4;
+	} else
+		scl_data->taps.v_taps_c = in_taps->v_taps_c;
+	if (in_taps->h_taps_c == 0) {
+		if (dc_fixpt_ceil(scl_data->ratios.horz_c) > 1)
+			scl_data->taps.h_taps_c = min(2 * dc_fixpt_ceil(scl_data->ratios.horz_c), 8);
+		else
+			scl_data->taps.h_taps_c = 4;
+	} else if ((in_taps->h_taps_c % 2) != 0 && in_taps->h_taps_c != 1)
+		/* Only 1 and even h_taps_c are supported by hw */
+		scl_data->taps.h_taps_c = in_taps->h_taps_c - 1;
+	else
+		scl_data->taps.h_taps_c = in_taps->h_taps_c;
+
+	/*Ensure we can support the requested number of vtaps*/
+	min_taps_y = dc_fixpt_ceil(scl_data->ratios.vert);
+	min_taps_c = dc_fixpt_ceil(scl_data->ratios.vert_c);
+
+	/* Use LB_MEMORY_CONFIG_3 for 4:2:0 */
+	if ((scl_data->format == PIXEL_FORMAT_420BPP8) || (scl_data->format == PIXEL_FORMAT_420BPP10))
+		lb_config = LB_MEMORY_CONFIG_3;
+	else
+		lb_config = LB_MEMORY_CONFIG_0;
+
+	dpp->caps->dscl_calc_lb_num_partitions(
+			scl_data, lb_config, &num_part_y, &num_part_c);
+
+	/* MAX_V_TAPS = MIN (NUM_LINES - MAX(CEILING(V_RATIO,1)-2, 0), 8) */
+	if (dc_fixpt_ceil(scl_data->ratios.vert) > 2)
+		max_taps_y = num_part_y - (dc_fixpt_ceil(scl_data->ratios.vert) - 2);
+	else
+		max_taps_y = num_part_y;
+
+	if (dc_fixpt_ceil(scl_data->ratios.vert_c) > 2)
+		max_taps_c = num_part_c - (dc_fixpt_ceil(scl_data->ratios.vert_c) - 2);
+	else
+		max_taps_c = num_part_c;
+
+	if (max_taps_y < min_taps_y)
+		return false;
+	else if (max_taps_c < min_taps_c)
+		return false;
+
+	if (scl_data->taps.v_taps > max_taps_y)
+		scl_data->taps.v_taps = max_taps_y;
+
+	if (scl_data->taps.v_taps_c > max_taps_c)
+		scl_data->taps.v_taps_c = max_taps_c;
+
+	if (!dpp->ctx->dc->debug.always_scale) {
+		if (IDENTITY_RATIO(scl_data->ratios.horz))
+			scl_data->taps.h_taps = 1;
+		if (IDENTITY_RATIO(scl_data->ratios.vert))
+			scl_data->taps.v_taps = 1;
+		if (IDENTITY_RATIO(scl_data->ratios.horz_c))
+			scl_data->taps.h_taps_c = 1;
+		if (IDENTITY_RATIO(scl_data->ratios.vert_c))
+			scl_data->taps.v_taps_c = 1;
+	}
+
+	return true;
+}
+
+void dpp3_cnv_set_bias_scale(
+		struct dpp *dpp_base,
+		struct  dc_bias_and_scale *bias_and_scale)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_UPDATE(FCNV_FP_BIAS_R, FCNV_FP_BIAS_R, bias_and_scale->bias_red);
+	REG_UPDATE(FCNV_FP_BIAS_G, FCNV_FP_BIAS_G, bias_and_scale->bias_green);
+	REG_UPDATE(FCNV_FP_BIAS_B, FCNV_FP_BIAS_B, bias_and_scale->bias_blue);
+	REG_UPDATE(FCNV_FP_SCALE_R, FCNV_FP_SCALE_R, bias_and_scale->scale_red);
+	REG_UPDATE(FCNV_FP_SCALE_G, FCNV_FP_SCALE_G, bias_and_scale->scale_green);
+	REG_UPDATE(FCNV_FP_SCALE_B, FCNV_FP_SCALE_B, bias_and_scale->scale_blue);
+}
+
+static void dpp3_power_on_blnd_lut(
+	struct dpp *dpp_base,
+	bool power_on)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_SET(CM_MEM_PWR_CTRL, 0,
+			BLNDGAM_MEM_PWR_FORCE, power_on == true ? 0:1);
+
+}
+
+static void dpp3_configure_blnd_lut(
+		struct dpp *dpp_base,
+		bool is_ram_a)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_UPDATE_2(CM_BLNDGAM_LUT_CONTROL,
+			CM_BLNDGAM_LUT_WRITE_COLOR_MASK, 7,
+			CM_BLNDGAM_LUT_HOST_SEL, is_ram_a == true ? 0 : 1);
+
+	REG_SET(CM_BLNDGAM_LUT_INDEX, 0, CM_BLNDGAM_LUT_INDEX, 0);
+}
+
+static void dpp3_program_blnd_pwl(
+		struct dpp *dpp_base,
+		const struct pwl_result_data *rgb,
+		uint32_t num)
+{
+	uint32_t i;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	uint32_t last_base_value_red = rgb[num-1].red_reg + rgb[num-1].delta_red_reg;
+	uint32_t last_base_value_green = rgb[num-1].green_reg + rgb[num-1].delta_green_reg;
+	uint32_t last_base_value_blue = rgb[num-1].blue_reg + rgb[num-1].delta_blue_reg;
+
+	if (is_rgb_equal(rgb, num)) {
+		for (i = 0 ; i < num; i++)
+			REG_SET(CM_BLNDGAM_LUT_DATA, 0, CM_BLNDGAM_LUT_DATA, rgb[i].red_reg);
+		REG_SET(CM_BLNDGAM_LUT_DATA, 0, CM_BLNDGAM_LUT_DATA, last_base_value_red);
+	} else {
+		REG_UPDATE(CM_BLNDGAM_LUT_CONTROL, CM_BLNDGAM_LUT_WRITE_COLOR_MASK, 4);
+		for (i = 0 ; i < num; i++)
+			REG_SET(CM_BLNDGAM_LUT_DATA, 0, CM_BLNDGAM_LUT_DATA, rgb[i].red_reg);
+		REG_SET(CM_BLNDGAM_LUT_DATA, 0, CM_BLNDGAM_LUT_DATA, last_base_value_red);
+
+		REG_UPDATE(CM_BLNDGAM_LUT_CONTROL, CM_BLNDGAM_LUT_WRITE_COLOR_MASK, 2);
+		for (i = 0 ; i < num; i++)
+			REG_SET(CM_BLNDGAM_LUT_DATA, 0, CM_BLNDGAM_LUT_DATA, rgb[i].green_reg);
+		REG_SET(CM_BLNDGAM_LUT_DATA, 0, CM_BLNDGAM_LUT_DATA, last_base_value_green);
+
+		REG_UPDATE(CM_BLNDGAM_LUT_CONTROL, CM_BLNDGAM_LUT_WRITE_COLOR_MASK, 1);
+		for (i = 0 ; i < num; i++)
+			REG_SET(CM_BLNDGAM_LUT_DATA, 0, CM_BLNDGAM_LUT_DATA, rgb[i].blue_reg);
+		REG_SET(CM_BLNDGAM_LUT_DATA, 0, CM_BLNDGAM_LUT_DATA, last_base_value_blue);
+	}
+}
+
+static void dcn3_dpp_cm_get_reg_field(
+		struct dcn3_dpp *dpp,
+		struct dcn3_xfer_func_reg *reg)
+{
+	reg->shifts.exp_region0_lut_offset = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION0_LUT_OFFSET;
+	reg->masks.exp_region0_lut_offset = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION0_LUT_OFFSET;
+	reg->shifts.exp_region0_num_segments = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION0_NUM_SEGMENTS;
+	reg->masks.exp_region0_num_segments = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION0_NUM_SEGMENTS;
+	reg->shifts.exp_region1_lut_offset = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION1_LUT_OFFSET;
+	reg->masks.exp_region1_lut_offset = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION1_LUT_OFFSET;
+	reg->shifts.exp_region1_num_segments = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION1_NUM_SEGMENTS;
+	reg->masks.exp_region1_num_segments = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION1_NUM_SEGMENTS;
+
+	reg->shifts.field_region_end = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION_END_B;
+	reg->masks.field_region_end = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION_END_B;
+	reg->shifts.field_region_end_slope = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION_END_SLOPE_B;
+	reg->masks.field_region_end_slope = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION_END_SLOPE_B;
+	reg->shifts.field_region_end_base = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION_END_BASE_B;
+	reg->masks.field_region_end_base = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION_END_BASE_B;
+	reg->shifts.field_region_linear_slope = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION_START_SLOPE_B;
+	reg->masks.field_region_linear_slope = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION_START_SLOPE_B;
+	reg->shifts.exp_region_start = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION_START_B;
+	reg->masks.exp_region_start = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION_START_B;
+	reg->shifts.exp_resion_start_segment = dpp->tf_shift->CM_BLNDGAM_RAMA_EXP_REGION_START_SEGMENT_B;
+	reg->masks.exp_resion_start_segment = dpp->tf_mask->CM_BLNDGAM_RAMA_EXP_REGION_START_SEGMENT_B;
+}
+
+/*program blnd lut RAM A*/
+static void dpp3_program_blnd_luta_settings(
+		struct dpp *dpp_base,
+		const struct pwl_params *params)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	struct dcn3_xfer_func_reg gam_regs;
+
+	dcn3_dpp_cm_get_reg_field(dpp, &gam_regs);
+
+	gam_regs.start_cntl_b = REG(CM_BLNDGAM_RAMA_START_CNTL_B);
+	gam_regs.start_cntl_g = REG(CM_BLNDGAM_RAMA_START_CNTL_G);
+	gam_regs.start_cntl_r = REG(CM_BLNDGAM_RAMA_START_CNTL_R);
+	gam_regs.start_slope_cntl_b = REG(CM_BLNDGAM_RAMA_START_SLOPE_CNTL_B);
+	gam_regs.start_slope_cntl_g = REG(CM_BLNDGAM_RAMA_START_SLOPE_CNTL_G);
+	gam_regs.start_slope_cntl_r = REG(CM_BLNDGAM_RAMA_START_SLOPE_CNTL_R);
+	gam_regs.start_end_cntl1_b = REG(CM_BLNDGAM_RAMA_END_CNTL1_B);
+	gam_regs.start_end_cntl2_b = REG(CM_BLNDGAM_RAMA_END_CNTL2_B);
+	gam_regs.start_end_cntl1_g = REG(CM_BLNDGAM_RAMA_END_CNTL1_G);
+	gam_regs.start_end_cntl2_g = REG(CM_BLNDGAM_RAMA_END_CNTL2_G);
+	gam_regs.start_end_cntl1_r = REG(CM_BLNDGAM_RAMA_END_CNTL1_R);
+	gam_regs.start_end_cntl2_r = REG(CM_BLNDGAM_RAMA_END_CNTL2_R);
+	gam_regs.region_start = REG(CM_BLNDGAM_RAMA_REGION_0_1);
+	gam_regs.region_end = REG(CM_BLNDGAM_RAMA_REGION_32_33);
+
+	cm_helper_program_gamcor_xfer_func(dpp->base.ctx, params, &gam_regs);
+}
+
+/*program blnd lut RAM B*/
+static void dpp3_program_blnd_lutb_settings(
+		struct dpp *dpp_base,
+		const struct pwl_params *params)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	struct dcn3_xfer_func_reg gam_regs;
+
+	dcn3_dpp_cm_get_reg_field(dpp, &gam_regs);
+
+	gam_regs.start_cntl_b = REG(CM_BLNDGAM_RAMB_START_CNTL_B);
+	gam_regs.start_cntl_g = REG(CM_BLNDGAM_RAMB_START_CNTL_G);
+	gam_regs.start_cntl_r = REG(CM_BLNDGAM_RAMB_START_CNTL_R);
+	gam_regs.start_slope_cntl_b = REG(CM_BLNDGAM_RAMB_START_SLOPE_CNTL_B);
+	gam_regs.start_slope_cntl_g = REG(CM_BLNDGAM_RAMB_START_SLOPE_CNTL_G);
+	gam_regs.start_slope_cntl_r = REG(CM_BLNDGAM_RAMB_START_SLOPE_CNTL_R);
+	gam_regs.start_end_cntl1_b = REG(CM_BLNDGAM_RAMB_END_CNTL1_B);
+	gam_regs.start_end_cntl2_b = REG(CM_BLNDGAM_RAMB_END_CNTL2_B);
+	gam_regs.start_end_cntl1_g = REG(CM_BLNDGAM_RAMB_END_CNTL1_G);
+	gam_regs.start_end_cntl2_g = REG(CM_BLNDGAM_RAMB_END_CNTL2_G);
+	gam_regs.start_end_cntl1_r = REG(CM_BLNDGAM_RAMB_END_CNTL1_R);
+	gam_regs.start_end_cntl2_r = REG(CM_BLNDGAM_RAMB_END_CNTL2_R);
+	gam_regs.region_start = REG(CM_BLNDGAM_RAMB_REGION_0_1);
+	gam_regs.region_end = REG(CM_BLNDGAM_RAMB_REGION_32_33);
+
+	cm_helper_program_gamcor_xfer_func(dpp->base.ctx, params, &gam_regs);
+}
+
+static enum dc_lut_mode dpp3_get_blndgam_current(struct dpp *dpp_base)
+{
+	enum dc_lut_mode mode;
+	uint32_t mode_current = 0;
+	uint32_t in_use = 0;
+
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_GET(CM_BLNDGAM_CONTROL,
+			CM_BLNDGAM_MODE_CURRENT, &mode_current);
+	REG_GET(CM_BLNDGAM_CONTROL,
+			CM_BLNDGAM_SELECT_CURRENT, &in_use);
+
+		switch (mode_current) {
+		case 0:
+		case 1:
+			mode = LUT_BYPASS;
+			break;
+
+		case 2:
+			if (in_use == 0)
+				mode = LUT_RAM_A;
+			else
+				mode = LUT_RAM_B;
+			break;
+		default:
+			mode = LUT_BYPASS;
+			break;
+		}
+		return mode;
+}
+
+bool dpp3_program_blnd_lut(
+	struct dpp *dpp_base, const struct pwl_params *params)
+{
+	enum dc_lut_mode current_mode;
+	enum dc_lut_mode next_mode;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	if (params == NULL) {
+		REG_SET(CM_BLNDGAM_CONTROL, 0, CM_BLNDGAM_MODE, 0);
+		return false;
+	}
+
+	current_mode = dpp3_get_blndgam_current(dpp_base);
+	if (current_mode == LUT_BYPASS || current_mode == LUT_RAM_B)
+		next_mode = LUT_RAM_A;
+	else
+		next_mode = LUT_RAM_B;
+
+	dpp3_power_on_blnd_lut(dpp_base, true);
+	dpp3_configure_blnd_lut(dpp_base, next_mode == LUT_RAM_A ? true:false);
+
+	if (next_mode == LUT_RAM_A)
+		dpp3_program_blnd_luta_settings(dpp_base, params);
+	else
+		dpp3_program_blnd_lutb_settings(dpp_base, params);
+
+	dpp3_program_blnd_pwl(
+			dpp_base, params->rgb_resulted, params->hw_points_num);
+
+	REG_UPDATE_2(CM_BLNDGAM_CONTROL,
+			CM_BLNDGAM_MODE, 2,
+			CM_BLNDGAM_SELECT, next_mode == LUT_RAM_A ? 0 : 1);
+
+	return true;
+}
+
+
+static void dpp3_program_shaper_lut(
+		struct dpp *dpp_base,
+		const struct pwl_result_data *rgb,
+		uint32_t num)
+{
+	uint32_t i, red, green, blue;
+	uint32_t  red_delta, green_delta, blue_delta;
+	uint32_t  red_value, green_value, blue_value;
+
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	for (i = 0 ; i < num; i++) {
+
+		red   = rgb[i].red_reg;
+		green = rgb[i].green_reg;
+		blue  = rgb[i].blue_reg;
+
+		red_delta   = rgb[i].delta_red_reg;
+		green_delta = rgb[i].delta_green_reg;
+		blue_delta  = rgb[i].delta_blue_reg;
+
+		red_value   = ((red_delta   & 0x3ff) << 14) | (red   & 0x3fff);
+		green_value = ((green_delta & 0x3ff) << 14) | (green & 0x3fff);
+		blue_value  = ((blue_delta  & 0x3ff) << 14) | (blue  & 0x3fff);
+
+		REG_SET(CM_SHAPER_LUT_DATA, 0, CM_SHAPER_LUT_DATA, red_value);
+		REG_SET(CM_SHAPER_LUT_DATA, 0, CM_SHAPER_LUT_DATA, green_value);
+		REG_SET(CM_SHAPER_LUT_DATA, 0, CM_SHAPER_LUT_DATA, blue_value);
+	}
+
+}
+
+static enum dc_lut_mode dpp3_get_shaper_current(struct dpp *dpp_base)
+{
+	enum dc_lut_mode mode;
+	uint32_t state_mode;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_GET(CM_SHAPER_CONTROL,
+			CM_SHAPER_MODE_CURRENT, &state_mode);
+
+		switch (state_mode) {
+		case 0:
+			mode = LUT_BYPASS;
+			break;
+		case 1:
+			mode = LUT_RAM_A;
+			break;
+		case 2:
+			mode = LUT_RAM_B;
+			break;
+		default:
+			mode = LUT_BYPASS;
+			break;
+		}
+		return mode;
+}
+
+static void dpp3_configure_shaper_lut(
+		struct dpp *dpp_base,
+		bool is_ram_a)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_UPDATE(CM_SHAPER_LUT_WRITE_EN_MASK,
+			CM_SHAPER_LUT_WRITE_EN_MASK, 7);
+	REG_UPDATE(CM_SHAPER_LUT_WRITE_EN_MASK,
+			CM_SHAPER_LUT_WRITE_SEL, is_ram_a == true ? 0:1);
+	REG_SET(CM_SHAPER_LUT_INDEX, 0, CM_SHAPER_LUT_INDEX, 0);
+}
+
+/*program shaper RAM A*/
+
+static void dpp3_program_shaper_luta_settings(
+		struct dpp *dpp_base,
+		const struct pwl_params *params)
+{
+	const struct gamma_curve *curve;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_SET_2(CM_SHAPER_RAMA_START_CNTL_B, 0,
+		CM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].blue.custom_float_x,
+		CM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
+	REG_SET_2(CM_SHAPER_RAMA_START_CNTL_G, 0,
+		CM_SHAPER_RAMA_EXP_REGION_START_G, params->corner_points[0].green.custom_float_x,
+		CM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_G, 0);
+	REG_SET_2(CM_SHAPER_RAMA_START_CNTL_R, 0,
+		CM_SHAPER_RAMA_EXP_REGION_START_R, params->corner_points[0].red.custom_float_x,
+		CM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_R, 0);
+
+	REG_SET_2(CM_SHAPER_RAMA_END_CNTL_B, 0,
+		CM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].blue.custom_float_x,
+		CM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].blue.custom_float_y);
+
+	REG_SET_2(CM_SHAPER_RAMA_END_CNTL_G, 0,
+		CM_SHAPER_RAMA_EXP_REGION_END_G, params->corner_points[1].green.custom_float_x,
+		CM_SHAPER_RAMA_EXP_REGION_END_BASE_G, params->corner_points[1].green.custom_float_y);
+
+	REG_SET_2(CM_SHAPER_RAMA_END_CNTL_R, 0,
+		CM_SHAPER_RAMA_EXP_REGION_END_R, params->corner_points[1].red.custom_float_x,
+		CM_SHAPER_RAMA_EXP_REGION_END_BASE_R, params->corner_points[1].red.custom_float_y);
+
+	curve = params->arr_curve_points;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_0_1, 0,
+		CM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_2_3, 0,
+		CM_SHAPER_RAMA_EXP_REGION2_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION2_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION3_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION3_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_4_5, 0,
+		CM_SHAPER_RAMA_EXP_REGION4_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION4_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION5_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION5_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_6_7, 0,
+		CM_SHAPER_RAMA_EXP_REGION6_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION6_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION7_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION7_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_8_9, 0,
+		CM_SHAPER_RAMA_EXP_REGION8_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION8_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION9_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION9_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_10_11, 0,
+		CM_SHAPER_RAMA_EXP_REGION10_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION10_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION11_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION11_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_12_13, 0,
+		CM_SHAPER_RAMA_EXP_REGION12_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION12_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION13_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION13_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_14_15, 0,
+		CM_SHAPER_RAMA_EXP_REGION14_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION14_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION15_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION15_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_16_17, 0,
+		CM_SHAPER_RAMA_EXP_REGION16_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION16_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION17_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION17_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_18_19, 0,
+		CM_SHAPER_RAMA_EXP_REGION18_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION18_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION19_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION19_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_20_21, 0,
+		CM_SHAPER_RAMA_EXP_REGION20_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION20_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION21_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION21_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_22_23, 0,
+		CM_SHAPER_RAMA_EXP_REGION22_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION22_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION23_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION23_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_24_25, 0,
+		CM_SHAPER_RAMA_EXP_REGION24_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION24_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION25_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION25_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_26_27, 0,
+		CM_SHAPER_RAMA_EXP_REGION26_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION26_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION27_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION27_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_28_29, 0,
+		CM_SHAPER_RAMA_EXP_REGION28_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION28_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION29_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION29_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_30_31, 0,
+		CM_SHAPER_RAMA_EXP_REGION30_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION30_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION31_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION31_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMA_REGION_32_33, 0,
+		CM_SHAPER_RAMA_EXP_REGION32_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMA_EXP_REGION32_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMA_EXP_REGION33_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMA_EXP_REGION33_NUM_SEGMENTS, curve[1].segments_num);
+}
+
+/*program shaper RAM B*/
+static void dpp3_program_shaper_lutb_settings(
+		struct dpp *dpp_base,
+		const struct pwl_params *params)
+{
+	const struct gamma_curve *curve;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_SET_2(CM_SHAPER_RAMB_START_CNTL_B, 0,
+		CM_SHAPER_RAMB_EXP_REGION_START_B, params->corner_points[0].blue.custom_float_x,
+		CM_SHAPER_RAMB_EXP_REGION_START_SEGMENT_B, 0);
+	REG_SET_2(CM_SHAPER_RAMB_START_CNTL_G, 0,
+		CM_SHAPER_RAMB_EXP_REGION_START_G, params->corner_points[0].green.custom_float_x,
+		CM_SHAPER_RAMB_EXP_REGION_START_SEGMENT_G, 0);
+	REG_SET_2(CM_SHAPER_RAMB_START_CNTL_R, 0,
+		CM_SHAPER_RAMB_EXP_REGION_START_R, params->corner_points[0].red.custom_float_x,
+		CM_SHAPER_RAMB_EXP_REGION_START_SEGMENT_R, 0);
+
+	REG_SET_2(CM_SHAPER_RAMB_END_CNTL_B, 0,
+		CM_SHAPER_RAMB_EXP_REGION_END_B, params->corner_points[1].blue.custom_float_x,
+		CM_SHAPER_RAMB_EXP_REGION_END_BASE_B, params->corner_points[1].blue.custom_float_y);
+
+	REG_SET_2(CM_SHAPER_RAMB_END_CNTL_G, 0,
+		CM_SHAPER_RAMB_EXP_REGION_END_G, params->corner_points[1].green.custom_float_x,
+		CM_SHAPER_RAMB_EXP_REGION_END_BASE_G, params->corner_points[1].green.custom_float_y);
+
+	REG_SET_2(CM_SHAPER_RAMB_END_CNTL_R, 0,
+		CM_SHAPER_RAMB_EXP_REGION_END_R, params->corner_points[1].red.custom_float_x,
+		CM_SHAPER_RAMB_EXP_REGION_END_BASE_R, params->corner_points[1].red.custom_float_y);
+
+	curve = params->arr_curve_points;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_0_1, 0,
+		CM_SHAPER_RAMB_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_2_3, 0,
+		CM_SHAPER_RAMB_EXP_REGION2_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION2_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION3_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION3_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_4_5, 0,
+		CM_SHAPER_RAMB_EXP_REGION4_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION4_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION5_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION5_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_6_7, 0,
+		CM_SHAPER_RAMB_EXP_REGION6_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION6_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION7_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION7_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_8_9, 0,
+		CM_SHAPER_RAMB_EXP_REGION8_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION8_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION9_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION9_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_10_11, 0,
+		CM_SHAPER_RAMB_EXP_REGION10_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION10_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION11_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION11_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_12_13, 0,
+		CM_SHAPER_RAMB_EXP_REGION12_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION12_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION13_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION13_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_14_15, 0,
+		CM_SHAPER_RAMB_EXP_REGION14_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION14_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION15_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION15_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_16_17, 0,
+		CM_SHAPER_RAMB_EXP_REGION16_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION16_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION17_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION17_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_18_19, 0,
+		CM_SHAPER_RAMB_EXP_REGION18_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION18_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION19_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION19_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_20_21, 0,
+		CM_SHAPER_RAMB_EXP_REGION20_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION20_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION21_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION21_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_22_23, 0,
+		CM_SHAPER_RAMB_EXP_REGION22_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION22_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION23_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION23_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_24_25, 0,
+		CM_SHAPER_RAMB_EXP_REGION24_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION24_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION25_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION25_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_26_27, 0,
+		CM_SHAPER_RAMB_EXP_REGION26_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION26_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION27_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION27_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_28_29, 0,
+		CM_SHAPER_RAMB_EXP_REGION28_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION28_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION29_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION29_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_30_31, 0,
+		CM_SHAPER_RAMB_EXP_REGION30_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION30_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION31_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION31_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(CM_SHAPER_RAMB_REGION_32_33, 0,
+		CM_SHAPER_RAMB_EXP_REGION32_LUT_OFFSET, curve[0].offset,
+		CM_SHAPER_RAMB_EXP_REGION32_NUM_SEGMENTS, curve[0].segments_num,
+		CM_SHAPER_RAMB_EXP_REGION33_LUT_OFFSET, curve[1].offset,
+		CM_SHAPER_RAMB_EXP_REGION33_NUM_SEGMENTS, curve[1].segments_num);
+
+}
+
+
+bool dpp3_program_shaper(
+		struct dpp *dpp_base,
+		const struct pwl_params *params)
+{
+	enum dc_lut_mode current_mode;
+	enum dc_lut_mode next_mode;
+
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	if (params == NULL) {
+		REG_SET(CM_SHAPER_CONTROL, 0, CM_SHAPER_LUT_MODE, 0);
+		return false;
+	}
+	current_mode = dpp3_get_shaper_current(dpp_base);
+
+	if (current_mode == LUT_BYPASS || current_mode == LUT_RAM_A)
+		next_mode = LUT_RAM_B;
+	else
+		next_mode = LUT_RAM_A;
+
+	dpp3_configure_shaper_lut(dpp_base, next_mode == LUT_RAM_A ? true:false);
+
+	if (next_mode == LUT_RAM_A)
+		dpp3_program_shaper_luta_settings(dpp_base, params);
+	else
+		dpp3_program_shaper_lutb_settings(dpp_base, params);
+
+	dpp3_program_shaper_lut(
+			dpp_base, params->rgb_resulted, params->hw_points_num);
+
+	REG_SET(CM_SHAPER_CONTROL, 0, CM_SHAPER_LUT_MODE, next_mode == LUT_RAM_A ? 1:2);
+
+	return true;
+
+}
+
+static enum dc_lut_mode get3dlut_config(
+			struct dpp *dpp_base,
+			bool *is_17x17x17,
+			bool *is_12bits_color_channel)
+{
+	uint32_t i_mode, i_enable_10bits, lut_size;
+	enum dc_lut_mode mode;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_GET(CM_3DLUT_READ_WRITE_CONTROL,
+			CM_3DLUT_30BIT_EN, &i_enable_10bits);
+	REG_GET(CM_3DLUT_MODE,
+			CM_3DLUT_MODE_CURRENT, &i_mode);
+
+	switch (i_mode) {
+	case 0:
+		mode = LUT_BYPASS;
+		break;
+	case 1:
+		mode = LUT_RAM_A;
+		break;
+	case 2:
+		mode = LUT_RAM_B;
+		break;
+	default:
+		mode = LUT_BYPASS;
+		break;
+	}
+	if (i_enable_10bits > 0)
+		*is_12bits_color_channel = false;
+	else
+		*is_12bits_color_channel = true;
+
+	REG_GET(CM_3DLUT_MODE, CM_3DLUT_SIZE, &lut_size);
+
+	if (lut_size == 0)
+		*is_17x17x17 = true;
+	else
+		*is_17x17x17 = false;
+
+	return mode;
+}
+/*
+ * select ramA or ramB, or bypass
+ * select color channel size 10 or 12 bits
+ * select 3dlut size 17x17x17 or 9x9x9
+ */
+static void dpp3_set_3dlut_mode(
+		struct dpp *dpp_base,
+		enum dc_lut_mode mode,
+		bool is_color_channel_12bits,
+		bool is_lut_size17x17x17)
+{
+	uint32_t lut_mode;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	if (mode == LUT_BYPASS)
+		lut_mode = 0;
+	else if (mode == LUT_RAM_A)
+		lut_mode = 1;
+	else
+		lut_mode = 2;
+
+	REG_UPDATE_2(CM_3DLUT_MODE,
+			CM_3DLUT_MODE, lut_mode,
+			CM_3DLUT_SIZE, is_lut_size17x17x17 == true ? 0 : 1);
+}
+
+static void dpp3_select_3dlut_ram(
+		struct dpp *dpp_base,
+		enum dc_lut_mode mode,
+		bool is_color_channel_12bits)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_UPDATE_2(CM_3DLUT_READ_WRITE_CONTROL,
+			CM_3DLUT_RAM_SEL, mode == LUT_RAM_A ? 0 : 1,
+			CM_3DLUT_30BIT_EN,
+			is_color_channel_12bits == true ? 0:1);
+}
+
+
+
+static void dpp3_set3dlut_ram12(
+		struct dpp *dpp_base,
+		const struct dc_rgb *lut,
+		uint32_t entries)
+{
+	uint32_t i, red, green, blue, red1, green1, blue1;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	for (i = 0 ; i < entries; i += 2) {
+		red   = lut[i].red<<4;
+		green = lut[i].green<<4;
+		blue  = lut[i].blue<<4;
+		red1   = lut[i+1].red<<4;
+		green1 = lut[i+1].green<<4;
+		blue1  = lut[i+1].blue<<4;
+
+		REG_SET_2(CM_3DLUT_DATA, 0,
+				CM_3DLUT_DATA0, red,
+				CM_3DLUT_DATA1, red1);
+
+		REG_SET_2(CM_3DLUT_DATA, 0,
+				CM_3DLUT_DATA0, green,
+				CM_3DLUT_DATA1, green1);
+
+		REG_SET_2(CM_3DLUT_DATA, 0,
+				CM_3DLUT_DATA0, blue,
+				CM_3DLUT_DATA1, blue1);
+
+	}
+}
+
+/*
+ * load selected lut with 10 bits color channels
+ */
+static void dpp3_set3dlut_ram10(
+		struct dpp *dpp_base,
+		const struct dc_rgb *lut,
+		uint32_t entries)
+{
+	uint32_t i, red, green, blue, value;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	for (i = 0; i < entries; i++) {
+		red   = lut[i].red;
+		green = lut[i].green;
+		blue  = lut[i].blue;
+
+		value = (red<<20) | (green<<10) | blue;
+
+		REG_SET(CM_3DLUT_DATA_30BIT, 0, CM_3DLUT_DATA_30BIT, value);
+	}
+
+}
+
+
+static void dpp3_select_3dlut_ram_mask(
+		struct dpp *dpp_base,
+		uint32_t ram_selection_mask)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_UPDATE(CM_3DLUT_READ_WRITE_CONTROL, CM_3DLUT_WRITE_EN_MASK,
+			ram_selection_mask);
+	REG_SET(CM_3DLUT_INDEX, 0, CM_3DLUT_INDEX, 0);
+}
+
+bool dpp3_program_3dlut(
+		struct dpp *dpp_base,
+		struct tetrahedral_params *params)
+{
+	enum dc_lut_mode mode;
+	bool is_17x17x17;
+	bool is_12bits_color_channel;
+	struct dc_rgb *lut0;
+	struct dc_rgb *lut1;
+	struct dc_rgb *lut2;
+	struct dc_rgb *lut3;
+	int lut_size0;
+	int lut_size;
+
+	if (params == NULL) {
+		dpp3_set_3dlut_mode(dpp_base, LUT_BYPASS, false, false);
+		return false;
+	}
+	mode = get3dlut_config(dpp_base, &is_17x17x17, &is_12bits_color_channel);
+
+	if (mode == LUT_BYPASS || mode == LUT_RAM_B)
+		mode = LUT_RAM_A;
+	else
+		mode = LUT_RAM_B;
+
+	is_17x17x17 = !params->use_tetrahedral_9;
+	is_12bits_color_channel = params->use_12bits;
+	if (is_17x17x17) {
+		lut0 = params->tetrahedral_17.lut0;
+		lut1 = params->tetrahedral_17.lut1;
+		lut2 = params->tetrahedral_17.lut2;
+		lut3 = params->tetrahedral_17.lut3;
+		lut_size0 = sizeof(params->tetrahedral_17.lut0)/
+					sizeof(params->tetrahedral_17.lut0[0]);
+		lut_size  = sizeof(params->tetrahedral_17.lut1)/
+					sizeof(params->tetrahedral_17.lut1[0]);
+	} else {
+		lut0 = params->tetrahedral_9.lut0;
+		lut1 = params->tetrahedral_9.lut1;
+		lut2 = params->tetrahedral_9.lut2;
+		lut3 = params->tetrahedral_9.lut3;
+		lut_size0 = sizeof(params->tetrahedral_9.lut0)/
+				sizeof(params->tetrahedral_9.lut0[0]);
+		lut_size  = sizeof(params->tetrahedral_9.lut1)/
+				sizeof(params->tetrahedral_9.lut1[0]);
+		}
+
+	dpp3_select_3dlut_ram(dpp_base, mode,
+				is_12bits_color_channel);
+	dpp3_select_3dlut_ram_mask(dpp_base, 0x1);
+	if (is_12bits_color_channel)
+		dpp3_set3dlut_ram12(dpp_base, lut0, lut_size0);
+	else
+		dpp3_set3dlut_ram10(dpp_base, lut0, lut_size0);
+
+	dpp3_select_3dlut_ram_mask(dpp_base, 0x2);
+	if (is_12bits_color_channel)
+		dpp3_set3dlut_ram12(dpp_base, lut1, lut_size);
+	else
+		dpp3_set3dlut_ram10(dpp_base, lut1, lut_size);
+
+	dpp3_select_3dlut_ram_mask(dpp_base, 0x4);
+	if (is_12bits_color_channel)
+		dpp3_set3dlut_ram12(dpp_base, lut2, lut_size);
+	else
+		dpp3_set3dlut_ram10(dpp_base, lut2, lut_size);
+
+	dpp3_select_3dlut_ram_mask(dpp_base, 0x8);
+	if (is_12bits_color_channel)
+		dpp3_set3dlut_ram12(dpp_base, lut3, lut_size);
+	else
+		dpp3_set3dlut_ram10(dpp_base, lut3, lut_size);
+
+
+	dpp3_set_3dlut_mode(dpp_base, mode, is_12bits_color_channel,
+					is_17x17x17);
+
+	return true;
+}
+static struct dpp_funcs dcn30_dpp_funcs = {
+	.dpp_program_gamcor_lut = dpp3_program_gamcor_lut,
+	.dpp_read_state			= dpp30_read_state,
+	.dpp_reset			= dpp_reset,
+	.dpp_set_scaler			= dpp1_dscl_set_scaler_manual_scale,
+	.dpp_get_optimal_number_of_taps	= dpp3_get_optimal_number_of_taps,
+	.dpp_set_gamut_remap		= dpp3_cm_set_gamut_remap,
+	.dpp_set_csc_adjustment		= NULL,
+	.dpp_set_csc_default		= NULL,
+	.dpp_program_regamma_pwl	= NULL,
+	.dpp_set_pre_degam		= dpp3_set_pre_degam,
+	.dpp_program_input_lut		= NULL,
+	.dpp_full_bypass		= dpp1_full_bypass,
+	.dpp_setup			= dpp3_cnv_setup,
+	.dpp_program_degamma_pwl	= NULL,
+	.dpp_program_cm_dealpha = dpp3_program_cm_dealpha,
+	.dpp_program_cm_bias = dpp3_program_cm_bias,
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	.dpp_program_blnd_lut = dpp3_program_blnd_lut,
+	.dpp_program_shaper_lut = dpp3_program_shaper,
+	.dpp_program_3dlut = dpp3_program_3dlut,
+#else
+	.dpp_program_blnd_lut		= NULL,
+	.dpp_program_shaper_lut		= NULL,
+	.dpp_program_3dlut		= NULL,
+#endif
+
+	.dpp_program_bias_and_scale	= NULL,
+	.dpp_cnv_set_alpha_keyer	= dpp2_cnv_set_alpha_keyer,
+	.set_cursor_attributes		= dpp3_set_cursor_attributes,
+	.set_cursor_position		= dpp1_set_cursor_position,
+	.set_optional_cursor_attributes	= dpp1_cnv_set_optional_cursor_attributes,
+	.dpp_dppclk_control		= dpp1_dppclk_control,
+	.dpp_set_hdr_multiplier		= dpp3_set_hdr_multiplier,
+};
+
+
+static struct dpp_caps dcn30_dpp_cap = {
+	.dscl_data_proc_format = DSCL_DATA_PRCESSING_FLOAT_FORMAT,
+	.dscl_calc_lb_num_partitions = dscl2_calc_lb_num_partitions,
+};
+
+bool dpp3_construct(
+	struct dcn3_dpp *dpp,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn3_dpp_registers *tf_regs,
+	const struct dcn3_dpp_shift *tf_shift,
+	const struct dcn3_dpp_mask *tf_mask)
+{
+	dpp->base.ctx = ctx;
+
+	dpp->base.inst = inst;
+	dpp->base.funcs = &dcn30_dpp_funcs;
+	dpp->base.caps = &dcn30_dpp_cap;
+
+	dpp->tf_regs = tf_regs;
+	dpp->tf_shift = tf_shift;
+	dpp->tf_mask = tf_mask;
+
+	dpp->lb_pixel_depth_supported =
+		LB_PIXEL_DEPTH_18BPP |
+		LB_PIXEL_DEPTH_24BPP |
+		LB_PIXEL_DEPTH_30BPP;
+
+	dpp->lb_bits_per_entry = LB_BITS_PER_ENTRY;
+	dpp->lb_memory_size = LB_TOTAL_NUMBER_OF_ENTRIES; /*0x1404*/
+
+	return true;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
new file mode 100644
index 000000000000..7f6bedbc1ff1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
@@ -0,0 +1,608 @@
+/* Copyright 2020 Advanced Micro Devices, Inc.
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
+#ifndef __DCN30_DPP_H__
+#define __DCN30_DPP_H__
+
+#include "dcn20/dcn20_dpp.h"
+
+#define TO_DCN30_DPP(dpp)\
+	container_of(dpp, struct dcn3_dpp, base)
+
+#define DPP_REG_LIST_DCN30_COMMON(id)\
+	SRI(CM_DEALPHA, CM, id),\
+	SRI(CM_MEM_PWR_STATUS, CM, id),\
+	SRI(CM_BIAS_CR_R, CM, id),\
+	SRI(CM_BIAS_Y_G_CB_B, CM, id),\
+	SRI(PRE_DEGAM, CNVC_CFG, id),\
+	SRI(CM_GAMCOR_CONTROL, CM, id),\
+	SRI(CM_GAMCOR_LUT_CONTROL, CM, id),\
+	SRI(CM_GAMCOR_LUT_INDEX, CM, id),\
+	SRI(CM_GAMCOR_LUT_INDEX, CM, id),\
+	SRI(CM_GAMCOR_LUT_DATA, CM, id),\
+	SRI(CM_GAMCOR_RAMB_START_CNTL_B, CM, id),\
+	SRI(CM_GAMCOR_RAMB_START_CNTL_G, CM, id),\
+	SRI(CM_GAMCOR_RAMB_START_CNTL_R, CM, id),\
+	SRI(CM_GAMCOR_RAMB_START_SLOPE_CNTL_B, CM, id),\
+	SRI(CM_GAMCOR_RAMB_START_SLOPE_CNTL_G, CM, id),\
+	SRI(CM_GAMCOR_RAMB_START_SLOPE_CNTL_R, CM, id),\
+	SRI(CM_GAMCOR_RAMB_END_CNTL1_B, CM, id),\
+	SRI(CM_GAMCOR_RAMB_END_CNTL2_B, CM, id),\
+	SRI(CM_GAMCOR_RAMB_END_CNTL1_G, CM, id),\
+	SRI(CM_GAMCOR_RAMB_END_CNTL2_G, CM, id),\
+	SRI(CM_GAMCOR_RAMB_END_CNTL1_R, CM, id),\
+	SRI(CM_GAMCOR_RAMB_END_CNTL2_R, CM, id),\
+	SRI(CM_GAMCOR_RAMB_REGION_0_1, CM, id),\
+	SRI(CM_GAMCOR_RAMB_REGION_32_33, CM, id),\
+	SRI(CM_GAMCOR_RAMB_OFFSET_B, CM, id),\
+	SRI(CM_GAMCOR_RAMB_OFFSET_G, CM, id),\
+	SRI(CM_GAMCOR_RAMB_OFFSET_R, CM, id),\
+	SRI(CM_GAMCOR_RAMB_START_BASE_CNTL_B, CM, id),\
+	SRI(CM_GAMCOR_RAMB_START_BASE_CNTL_G, CM, id),\
+	SRI(CM_GAMCOR_RAMB_START_BASE_CNTL_R, CM, id),\
+	SRI(CM_GAMCOR_RAMA_START_CNTL_B, CM, id),\
+	SRI(CM_GAMCOR_RAMA_START_CNTL_G, CM, id),\
+	SRI(CM_GAMCOR_RAMA_START_CNTL_R, CM, id),\
+	SRI(CM_GAMCOR_RAMA_START_SLOPE_CNTL_B, CM, id),\
+	SRI(CM_GAMCOR_RAMA_START_SLOPE_CNTL_G, CM, id),\
+	SRI(CM_GAMCOR_RAMA_START_SLOPE_CNTL_R, CM, id),\
+	SRI(CM_GAMCOR_RAMA_END_CNTL1_B, CM, id),\
+	SRI(CM_GAMCOR_RAMA_END_CNTL2_B, CM, id),\
+	SRI(CM_GAMCOR_RAMA_END_CNTL1_G, CM, id),\
+	SRI(CM_GAMCOR_RAMA_END_CNTL2_G, CM, id),\
+	SRI(CM_GAMCOR_RAMA_END_CNTL1_R, CM, id),\
+	SRI(CM_GAMCOR_RAMA_END_CNTL2_R, CM, id),\
+	SRI(CM_GAMCOR_RAMA_REGION_0_1, CM, id),\
+	SRI(CM_GAMCOR_RAMA_REGION_32_33, CM, id),\
+	SRI(CM_GAMCOR_RAMA_OFFSET_B, CM, id),\
+	SRI(CM_GAMCOR_RAMA_OFFSET_G, CM, id),\
+	SRI(CM_GAMCOR_RAMA_OFFSET_R, CM, id),\
+	SRI(CM_GAMCOR_RAMA_START_BASE_CNTL_B, CM, id),\
+	SRI(CM_GAMCOR_RAMA_START_BASE_CNTL_G, CM, id),\
+	SRI(CM_GAMCOR_RAMA_START_BASE_CNTL_R, CM, id),\
+	SRI(CM_GAMUT_REMAP_CONTROL, CM, id),\
+	SRI(CM_GAMUT_REMAP_C11_C12, CM, id),\
+	SRI(CM_GAMUT_REMAP_C13_C14, CM, id),\
+	SRI(CM_GAMUT_REMAP_C21_C22, CM, id),\
+	SRI(CM_GAMUT_REMAP_C23_C24, CM, id),\
+	SRI(CM_GAMUT_REMAP_C31_C32, CM, id),\
+	SRI(CM_GAMUT_REMAP_C33_C34, CM, id),\
+	SRI(CM_GAMUT_REMAP_B_C11_C12, CM, id),\
+	SRI(CM_GAMUT_REMAP_B_C13_C14, CM, id),\
+	SRI(CM_GAMUT_REMAP_B_C21_C22, CM, id),\
+	SRI(CM_GAMUT_REMAP_B_C23_C24, CM, id),\
+	SRI(CM_GAMUT_REMAP_B_C31_C32, CM, id),\
+	SRI(CM_GAMUT_REMAP_B_C33_C34, CM, id),\
+	SRI(DSCL_EXT_OVERSCAN_LEFT_RIGHT, DSCL, id), \
+	SRI(DSCL_EXT_OVERSCAN_TOP_BOTTOM, DSCL, id), \
+	SRI(OTG_H_BLANK, DSCL, id), \
+	SRI(OTG_V_BLANK, DSCL, id), \
+	SRI(SCL_MODE, DSCL, id), \
+	SRI(LB_DATA_FORMAT, DSCL, id), \
+	SRI(LB_MEMORY_CTRL, DSCL, id), \
+	SRI(DSCL_AUTOCAL, DSCL, id), \
+	SRI(SCL_TAP_CONTROL, DSCL, id), \
+	SRI(SCL_COEF_RAM_TAP_SELECT, DSCL, id), \
+	SRI(SCL_COEF_RAM_TAP_DATA, DSCL, id), \
+	SRI(DSCL_2TAP_CONTROL, DSCL, id), \
+	SRI(MPC_SIZE, DSCL, id), \
+	SRI(SCL_HORZ_FILTER_SCALE_RATIO, DSCL, id), \
+	SRI(SCL_VERT_FILTER_SCALE_RATIO, DSCL, id), \
+	SRI(SCL_HORZ_FILTER_SCALE_RATIO_C, DSCL, id), \
+	SRI(SCL_VERT_FILTER_SCALE_RATIO_C, DSCL, id), \
+	SRI(SCL_HORZ_FILTER_INIT, DSCL, id), \
+	SRI(SCL_HORZ_FILTER_INIT_C, DSCL, id), \
+	SRI(SCL_VERT_FILTER_INIT, DSCL, id), \
+	SRI(SCL_VERT_FILTER_INIT_C, DSCL, id), \
+	SRI(RECOUT_START, DSCL, id), \
+	SRI(RECOUT_SIZE, DSCL, id), \
+	SRI(PRE_DEALPHA, CNVC_CFG, id), \
+	SRI(PRE_REALPHA, CNVC_CFG, id), \
+	SRI(PRE_CSC_MODE, CNVC_CFG, id), \
+	SRI(PRE_CSC_C11_C12, CNVC_CFG, id), \
+	SRI(PRE_CSC_C33_C34, CNVC_CFG, id), \
+	SRI(PRE_CSC_B_C11_C12, CNVC_CFG, id), \
+	SRI(PRE_CSC_B_C33_C34, CNVC_CFG, id), \
+	SRI(CM_POST_CSC_CONTROL, CM, id), \
+	SRI(CM_POST_CSC_C11_C12, CM, id), \
+	SRI(CM_POST_CSC_C33_C34, CM, id), \
+	SRI(CM_POST_CSC_B_C11_C12, CM, id), \
+	SRI(CM_POST_CSC_B_C33_C34, CM, id), \
+	SRI(CM_MEM_PWR_CTRL, CM, id), \
+	SRI(CM_CONTROL, CM, id), \
+	SRI(FORMAT_CONTROL, CNVC_CFG, id), \
+	SRI(CNVC_SURFACE_PIXEL_FORMAT, CNVC_CFG, id), \
+	SRI(CURSOR0_CONTROL, CNVC_CUR, id), \
+	SRI(CURSOR0_COLOR0, CNVC_CUR, id), \
+	SRI(CURSOR0_COLOR1, CNVC_CUR, id), \
+	SRI(CURSOR0_FP_SCALE_BIAS, CNVC_CUR, id), \
+	SRI(DPP_CONTROL, DPP_TOP, id), \
+	SRI(CM_HDR_MULT_COEF, CM, id), \
+	SRI(CURSOR_CONTROL, CURSOR0_, id), \
+	SRI(ALPHA_2BIT_LUT, CNVC_CFG, id), \
+	SRI(FCNV_FP_BIAS_R, CNVC_CFG, id), \
+	SRI(FCNV_FP_BIAS_G, CNVC_CFG, id), \
+	SRI(FCNV_FP_BIAS_B, CNVC_CFG, id), \
+	SRI(FCNV_FP_SCALE_R, CNVC_CFG, id), \
+	SRI(FCNV_FP_SCALE_G, CNVC_CFG, id), \
+	SRI(FCNV_FP_SCALE_B, CNVC_CFG, id), \
+	SRI(COLOR_KEYER_CONTROL, CNVC_CFG, id), \
+	SRI(COLOR_KEYER_ALPHA, CNVC_CFG, id), \
+	SRI(COLOR_KEYER_RED, CNVC_CFG, id), \
+	SRI(COLOR_KEYER_GREEN, CNVC_CFG, id), \
+	SRI(COLOR_KEYER_BLUE, CNVC_CFG, id), \
+	SRI(CURSOR_CONTROL, CURSOR0_, id),\
+	SRI(OBUF_MEM_PWR_CTRL, DSCL, id),\
+	SRI(DSCL_MEM_PWR_CTRL, DSCL, id)
+
+#define DPP_REG_LIST_DCN30(id)\
+	DPP_REG_LIST_DCN30_COMMON(id), \
+	TF_REG_LIST_DCN20_COMMON(id), \
+	SRI(CM_BLNDGAM_CONTROL, CM, id), \
+	SRI(CM_SHAPER_LUT_DATA, CM, id),\
+	SRI(CM_BLNDGAM_RAMA_START_SLOPE_CNTL_B, CM, id),\
+	SRI(CM_BLNDGAM_RAMA_START_SLOPE_CNTL_G, CM, id),\
+	SRI(CM_BLNDGAM_RAMA_START_SLOPE_CNTL_R, CM, id),\
+	SRI(CM_BLNDGAM_RAMB_START_SLOPE_CNTL_B, CM, id),\
+	SRI(CM_BLNDGAM_RAMB_START_SLOPE_CNTL_G, CM, id),\
+	SRI(CM_BLNDGAM_RAMB_START_SLOPE_CNTL_R, CM, id),\
+	SRI(CM_BLNDGAM_LUT_CONTROL, CM, id)
+
+
+
+#define DPP_REG_LIST_SH_MASK_DCN30_COMMON(mask_sh)\
+	TF_SF(CM0_CM_MEM_PWR_STATUS, GAMCOR_MEM_PWR_STATE, mask_sh),\
+	TF_SF(CM0_CM_DEALPHA, CM_DEALPHA_EN, mask_sh),\
+	TF_SF(CM0_CM_DEALPHA, CM_DEALPHA_ABLND, mask_sh),\
+	TF_SF(CM0_CM_BIAS_CR_R, CM_BIAS_CR_R, mask_sh),\
+	TF_SF(CM0_CM_BIAS_Y_G_CB_B, CM_BIAS_Y_G, mask_sh),\
+	TF_SF(CM0_CM_BIAS_Y_G_CB_B, CM_BIAS_CB_B, mask_sh),\
+	TF_SF(CM0_CM_MEM_PWR_CTRL, GAMCOR_MEM_PWR_DIS, mask_sh),\
+	TF_SF(CM0_CM_MEM_PWR_CTRL, GAMCOR_MEM_PWR_FORCE, mask_sh),\
+	TF_SF(CNVC_CFG0_PRE_DEGAM, PRE_DEGAM_MODE, mask_sh),\
+	TF_SF(CNVC_CFG0_PRE_DEGAM, PRE_DEGAM_SELECT, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_CONTROL, CM_GAMCOR_MODE, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_CONTROL, CM_GAMCOR_SELECT, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_CONTROL, CM_GAMCOR_PWL_DISABLE, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_CONTROL, CM_GAMCOR_MODE_CURRENT, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_CONTROL, CM_GAMCOR_SELECT_CURRENT, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_LUT_INDEX, CM_GAMCOR_LUT_INDEX, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_LUT_DATA, CM_GAMCOR_LUT_DATA, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_LUT_CONTROL, CM_GAMCOR_LUT_WRITE_COLOR_MASK, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_LUT_CONTROL, CM_GAMCOR_LUT_READ_COLOR_SEL, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_LUT_CONTROL, CM_GAMCOR_LUT_READ_DBG, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_LUT_CONTROL, CM_GAMCOR_LUT_HOST_SEL, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_LUT_CONTROL, CM_GAMCOR_LUT_CONFIG_MODE, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_START_CNTL_B, CM_GAMCOR_RAMA_EXP_REGION_START_B, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_START_CNTL_B, CM_GAMCOR_RAMA_EXP_REGION_START_SEGMENT_B, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_START_SLOPE_CNTL_B, CM_GAMCOR_RAMA_EXP_REGION_START_SLOPE_B, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_START_BASE_CNTL_B, CM_GAMCOR_RAMA_EXP_REGION_START_BASE_B, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_END_CNTL1_B, CM_GAMCOR_RAMA_EXP_REGION_END_BASE_B, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_END_CNTL2_B, CM_GAMCOR_RAMA_EXP_REGION_END_B, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_END_CNTL2_B, CM_GAMCOR_RAMA_EXP_REGION_END_SLOPE_B, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_OFFSET_B, CM_GAMCOR_RAMA_OFFSET_B, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_REGION_0_1, CM_GAMCOR_RAMA_EXP_REGION0_LUT_OFFSET, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_REGION_0_1, CM_GAMCOR_RAMA_EXP_REGION0_NUM_SEGMENTS, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_REGION_0_1, CM_GAMCOR_RAMA_EXP_REGION1_LUT_OFFSET, mask_sh),\
+	TF_SF(CM0_CM_GAMCOR_RAMA_REGION_0_1, CM_GAMCOR_RAMA_EXP_REGION1_NUM_SEGMENTS, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_CONTROL, CM_GAMUT_REMAP_MODE, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_CONTROL, CM_GAMUT_REMAP_MODE_CURRENT, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C11_C12, CM_GAMUT_REMAP_C11, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C11_C12, CM_GAMUT_REMAP_C12, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C13_C14, CM_GAMUT_REMAP_C13, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C13_C14, CM_GAMUT_REMAP_C14, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C21_C22, CM_GAMUT_REMAP_C21, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C21_C22, CM_GAMUT_REMAP_C22, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C23_C24, CM_GAMUT_REMAP_C23, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C23_C24, CM_GAMUT_REMAP_C24, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C31_C32, CM_GAMUT_REMAP_C31, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C31_C32, CM_GAMUT_REMAP_C32, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C33_C34, CM_GAMUT_REMAP_C33, mask_sh),\
+	TF_SF(CM0_CM_GAMUT_REMAP_C33_C34, CM_GAMUT_REMAP_C34, mask_sh),\
+	TF_SF(DSCL0_DSCL_EXT_OVERSCAN_LEFT_RIGHT, EXT_OVERSCAN_LEFT, mask_sh),\
+	TF_SF(DSCL0_DSCL_EXT_OVERSCAN_LEFT_RIGHT, EXT_OVERSCAN_RIGHT, mask_sh),\
+	TF_SF(DSCL0_DSCL_EXT_OVERSCAN_TOP_BOTTOM, EXT_OVERSCAN_BOTTOM, mask_sh),\
+	TF_SF(DSCL0_DSCL_EXT_OVERSCAN_TOP_BOTTOM, EXT_OVERSCAN_TOP, mask_sh),\
+	TF_SF(DSCL0_OTG_H_BLANK, OTG_H_BLANK_START, mask_sh),\
+	TF_SF(DSCL0_OTG_H_BLANK, OTG_H_BLANK_END, mask_sh),\
+	TF_SF(DSCL0_OTG_V_BLANK, OTG_V_BLANK_START, mask_sh),\
+	TF_SF(DSCL0_OTG_V_BLANK, OTG_V_BLANK_END, mask_sh),\
+	TF_SF(DSCL0_LB_DATA_FORMAT, INTERLEAVE_EN, mask_sh),\
+	TF2_SF(DSCL0, LB_DATA_FORMAT__ALPHA_EN, mask_sh),\
+	TF_SF(DSCL0_LB_MEMORY_CTRL, MEMORY_CONFIG, mask_sh),\
+	TF_SF(DSCL0_LB_MEMORY_CTRL, LB_MAX_PARTITIONS, mask_sh),\
+	TF_SF(DSCL0_DSCL_AUTOCAL, AUTOCAL_MODE, mask_sh),\
+	TF_SF(DSCL0_DSCL_AUTOCAL, AUTOCAL_NUM_PIPE, mask_sh),\
+	TF_SF(DSCL0_DSCL_AUTOCAL, AUTOCAL_PIPE_ID, mask_sh),\
+	TF_SF(DSCL0_SCL_TAP_CONTROL, SCL_V_NUM_TAPS, mask_sh),\
+	TF_SF(DSCL0_SCL_TAP_CONTROL, SCL_H_NUM_TAPS, mask_sh),\
+	TF_SF(DSCL0_SCL_TAP_CONTROL, SCL_V_NUM_TAPS_C, mask_sh),\
+	TF_SF(DSCL0_SCL_TAP_CONTROL, SCL_H_NUM_TAPS_C, mask_sh),\
+	TF_SF(DSCL0_SCL_COEF_RAM_TAP_SELECT, SCL_COEF_RAM_TAP_PAIR_IDX, mask_sh),\
+	TF_SF(DSCL0_SCL_COEF_RAM_TAP_SELECT, SCL_COEF_RAM_PHASE, mask_sh),\
+	TF_SF(DSCL0_SCL_COEF_RAM_TAP_SELECT, SCL_COEF_RAM_FILTER_TYPE, mask_sh),\
+	TF_SF(DSCL0_SCL_COEF_RAM_TAP_DATA, SCL_COEF_RAM_EVEN_TAP_COEF, mask_sh),\
+	TF_SF(DSCL0_SCL_COEF_RAM_TAP_DATA, SCL_COEF_RAM_EVEN_TAP_COEF_EN, mask_sh),\
+	TF_SF(DSCL0_SCL_COEF_RAM_TAP_DATA, SCL_COEF_RAM_ODD_TAP_COEF, mask_sh),\
+	TF_SF(DSCL0_SCL_COEF_RAM_TAP_DATA, SCL_COEF_RAM_ODD_TAP_COEF_EN, mask_sh),\
+	TF_SF(DSCL0_DSCL_2TAP_CONTROL, SCL_H_2TAP_HARDCODE_COEF_EN, mask_sh),\
+	TF_SF(DSCL0_DSCL_2TAP_CONTROL, SCL_H_2TAP_SHARP_EN, mask_sh),\
+	TF_SF(DSCL0_DSCL_2TAP_CONTROL, SCL_H_2TAP_SHARP_FACTOR, mask_sh),\
+	TF_SF(DSCL0_DSCL_2TAP_CONTROL, SCL_V_2TAP_HARDCODE_COEF_EN, mask_sh),\
+	TF_SF(DSCL0_DSCL_2TAP_CONTROL, SCL_V_2TAP_SHARP_EN, mask_sh),\
+	TF_SF(DSCL0_DSCL_2TAP_CONTROL, SCL_V_2TAP_SHARP_FACTOR, mask_sh),\
+	TF_SF(DSCL0_SCL_MODE, SCL_COEF_RAM_SELECT, mask_sh),\
+	TF_SF(DSCL0_SCL_MODE, DSCL_MODE, mask_sh),\
+	TF_SF(DSCL0_RECOUT_START, RECOUT_START_X, mask_sh),\
+	TF_SF(DSCL0_RECOUT_START, RECOUT_START_Y, mask_sh),\
+	TF_SF(DSCL0_RECOUT_SIZE, RECOUT_WIDTH, mask_sh),\
+	TF_SF(DSCL0_RECOUT_SIZE, RECOUT_HEIGHT, mask_sh),\
+	TF_SF(DSCL0_MPC_SIZE, MPC_WIDTH, mask_sh),\
+	TF_SF(DSCL0_MPC_SIZE, MPC_HEIGHT, mask_sh),\
+	TF_SF(DSCL0_SCL_HORZ_FILTER_SCALE_RATIO, SCL_H_SCALE_RATIO, mask_sh),\
+	TF_SF(DSCL0_SCL_VERT_FILTER_SCALE_RATIO, SCL_V_SCALE_RATIO, mask_sh),\
+	TF_SF(DSCL0_SCL_HORZ_FILTER_SCALE_RATIO_C, SCL_H_SCALE_RATIO_C, mask_sh),\
+	TF_SF(DSCL0_SCL_VERT_FILTER_SCALE_RATIO_C, SCL_V_SCALE_RATIO_C, mask_sh),\
+	TF_SF(DSCL0_SCL_HORZ_FILTER_INIT, SCL_H_INIT_FRAC, mask_sh),\
+	TF_SF(DSCL0_SCL_HORZ_FILTER_INIT, SCL_H_INIT_INT, mask_sh),\
+	TF_SF(DSCL0_SCL_HORZ_FILTER_INIT_C, SCL_H_INIT_FRAC_C, mask_sh),\
+	TF_SF(DSCL0_SCL_HORZ_FILTER_INIT_C, SCL_H_INIT_INT_C, mask_sh),\
+	TF_SF(DSCL0_SCL_VERT_FILTER_INIT, SCL_V_INIT_FRAC, mask_sh),\
+	TF_SF(DSCL0_SCL_VERT_FILTER_INIT, SCL_V_INIT_INT, mask_sh),\
+	TF_SF(DSCL0_SCL_VERT_FILTER_INIT_C, SCL_V_INIT_FRAC_C, mask_sh),\
+	TF_SF(DSCL0_SCL_VERT_FILTER_INIT_C, SCL_V_INIT_INT_C, mask_sh),\
+	TF_SF(DSCL0_SCL_MODE, SCL_CHROMA_COEF_MODE, mask_sh),\
+	TF_SF(DSCL0_SCL_MODE, SCL_COEF_RAM_SELECT_CURRENT, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_DEALPHA, PRE_DEALPHA_EN, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_DEALPHA, PRE_DEALPHA_ABLND_EN, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_REALPHA, PRE_REALPHA_EN, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_REALPHA, PRE_REALPHA_ABLND_EN, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_CSC_MODE, PRE_CSC_MODE, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_CSC_MODE, PRE_CSC_MODE_CURRENT, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_CSC_C11_C12, PRE_CSC_C11, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_CSC_C11_C12, PRE_CSC_C12, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_CSC_C33_C34, PRE_CSC_C33, mask_sh), \
+	TF_SF(CNVC_CFG0_PRE_CSC_C33_C34, PRE_CSC_C34, mask_sh), \
+	TF_SF(CM0_CM_POST_CSC_CONTROL, CM_POST_CSC_MODE, mask_sh), \
+	TF_SF(CM0_CM_POST_CSC_CONTROL, CM_POST_CSC_MODE_CURRENT, mask_sh), \
+	TF_SF(CM0_CM_POST_CSC_C11_C12, CM_POST_CSC_C11, mask_sh), \
+	TF_SF(CM0_CM_POST_CSC_C11_C12, CM_POST_CSC_C12, mask_sh), \
+	TF_SF(CM0_CM_POST_CSC_C33_C34, CM_POST_CSC_C33, mask_sh), \
+	TF_SF(CM0_CM_POST_CSC_C33_C34, CM_POST_CSC_C34, mask_sh), \
+	TF_SF(CNVC_CFG0_FORMAT_CONTROL, CNVC_BYPASS, mask_sh), \
+	TF2_SF(CNVC_CFG0, FORMAT_CONTROL__ALPHA_EN, mask_sh), \
+	TF_SF(CNVC_CFG0_FORMAT_CONTROL, FORMAT_EXPANSION_MODE, mask_sh), \
+	TF_SF(CNVC_CFG0_CNVC_SURFACE_PIXEL_FORMAT, CNVC_SURFACE_PIXEL_FORMAT, mask_sh), \
+	TF_SF(CNVC_CFG0_CNVC_SURFACE_PIXEL_FORMAT, CNVC_ALPHA_PLANE_ENABLE, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_CONTROL, CUR0_MODE, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_CONTROL, CUR0_EXPANSION_MODE, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_CONTROL, CUR0_ENABLE, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_COLOR0, CUR0_COLOR0, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_COLOR1, CUR0_COLOR1, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_FP_SCALE_BIAS, CUR0_FP_BIAS, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_FP_SCALE_BIAS, CUR0_FP_SCALE, mask_sh), \
+	TF_SF(DPP_TOP0_DPP_CONTROL, DPP_CLOCK_ENABLE, mask_sh), \
+	TF_SF(CM0_CM_HDR_MULT_COEF, CM_HDR_MULT_COEF, mask_sh), \
+	TF_SF(CM0_CM_CONTROL, CM_BYPASS, mask_sh), \
+	TF_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_MODE, mask_sh), \
+	TF_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_PITCH, mask_sh), \
+	TF_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_LINES_PER_CHUNK, mask_sh), \
+	TF_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_ENABLE, mask_sh), \
+	TF_SF(CNVC_CFG0_FORMAT_CONTROL, FORMAT_CNV16, mask_sh), \
+	TF_SF(CNVC_CFG0_FORMAT_CONTROL, CNVC_BYPASS_MSB_ALIGN, mask_sh), \
+	TF_SF(CNVC_CFG0_FORMAT_CONTROL, CLAMP_POSITIVE, mask_sh), \
+	TF_SF(CNVC_CFG0_FORMAT_CONTROL, CLAMP_POSITIVE_C, mask_sh), \
+	TF_SF(CNVC_CFG0_FORMAT_CONTROL, FORMAT_CROSSBAR_R, mask_sh), \
+	TF_SF(CNVC_CFG0_FORMAT_CONTROL, FORMAT_CROSSBAR_G, mask_sh), \
+	TF_SF(CNVC_CFG0_FORMAT_CONTROL, FORMAT_CROSSBAR_B, mask_sh), \
+	TF_SF(CNVC_CFG0_ALPHA_2BIT_LUT, ALPHA_2BIT_LUT0, mask_sh), \
+	TF_SF(CNVC_CFG0_ALPHA_2BIT_LUT, ALPHA_2BIT_LUT1, mask_sh), \
+	TF_SF(CNVC_CFG0_ALPHA_2BIT_LUT, ALPHA_2BIT_LUT2, mask_sh), \
+	TF_SF(CNVC_CFG0_ALPHA_2BIT_LUT, ALPHA_2BIT_LUT3, mask_sh), \
+	TF_SF(CNVC_CFG0_FCNV_FP_BIAS_R, FCNV_FP_BIAS_R, mask_sh), \
+	TF_SF(CNVC_CFG0_FCNV_FP_BIAS_G, FCNV_FP_BIAS_G, mask_sh), \
+	TF_SF(CNVC_CFG0_FCNV_FP_BIAS_B, FCNV_FP_BIAS_B, mask_sh), \
+	TF_SF(CNVC_CFG0_FCNV_FP_SCALE_R, FCNV_FP_SCALE_R, mask_sh), \
+	TF_SF(CNVC_CFG0_FCNV_FP_SCALE_G, FCNV_FP_SCALE_G, mask_sh), \
+	TF_SF(CNVC_CFG0_FCNV_FP_SCALE_B, FCNV_FP_SCALE_B, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_CONTROL, COLOR_KEYER_EN, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_CONTROL, COLOR_KEYER_MODE, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_ALPHA, COLOR_KEYER_ALPHA_LOW, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_ALPHA, COLOR_KEYER_ALPHA_HIGH, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_RED, COLOR_KEYER_RED_LOW, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_RED, COLOR_KEYER_RED_HIGH, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_GREEN, COLOR_KEYER_GREEN_LOW, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_GREEN, COLOR_KEYER_GREEN_HIGH, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_BLUE, COLOR_KEYER_BLUE_LOW, mask_sh), \
+	TF_SF(CNVC_CFG0_COLOR_KEYER_BLUE, COLOR_KEYER_BLUE_HIGH, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_CONTROL, CUR0_PIX_INV_MODE, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_CONTROL, CUR0_PIXEL_ALPHA_MOD_EN, mask_sh), \
+	TF_SF(CNVC_CUR0_CURSOR0_CONTROL, CUR0_ROM_EN, mask_sh),\
+	TF_SF(DSCL0_OBUF_MEM_PWR_CTRL, OBUF_MEM_PWR_FORCE, mask_sh),\
+	TF_SF(DSCL0_DSCL_MEM_PWR_CTRL, LUT_MEM_PWR_FORCE, mask_sh)
+
+#define DPP_REG_LIST_SH_MASK_DCN30_UPDATED(mask_sh)\
+	TF_SF(CM0_CM_BLNDGAM_CONTROL, CM_BLNDGAM_MODE, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_CONTROL, CM_BLNDGAM_MODE_CURRENT, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_CONTROL, CM_BLNDGAM_SELECT_CURRENT, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_CONTROL, CM_BLNDGAM_SELECT, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMB_START_SLOPE_CNTL_B, CM_BLNDGAM_RAMB_EXP_REGION_START_SLOPE_B, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMB_START_SLOPE_CNTL_G, CM_BLNDGAM_RAMB_EXP_REGION_START_SLOPE_G, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMB_START_SLOPE_CNTL_R, CM_BLNDGAM_RAMB_EXP_REGION_START_SLOPE_R, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMB_END_CNTL1_B, CM_BLNDGAM_RAMB_EXP_REGION_END_BASE_B, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMB_END_CNTL1_G, CM_BLNDGAM_RAMB_EXP_REGION_END_BASE_G, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMB_END_CNTL1_R, CM_BLNDGAM_RAMB_EXP_REGION_END_BASE_R, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMA_START_SLOPE_CNTL_B, CM_BLNDGAM_RAMA_EXP_REGION_START_SLOPE_B, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMA_START_SLOPE_CNTL_G, CM_BLNDGAM_RAMA_EXP_REGION_START_SLOPE_G, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMA_START_SLOPE_CNTL_R, CM_BLNDGAM_RAMA_EXP_REGION_START_SLOPE_R, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMA_END_CNTL1_B, CM_BLNDGAM_RAMA_EXP_REGION_END_BASE_B, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMA_END_CNTL1_G, CM_BLNDGAM_RAMA_EXP_REGION_END_BASE_G, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMA_END_CNTL1_R, CM_BLNDGAM_RAMA_EXP_REGION_END_BASE_R, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMA_END_CNTL2_B, CM_BLNDGAM_RAMA_EXP_REGION_END_B, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMA_END_CNTL2_G, CM_BLNDGAM_RAMA_EXP_REGION_END_G, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_RAMA_END_CNTL2_R, CM_BLNDGAM_RAMA_EXP_REGION_END_R, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_LUT_CONTROL, CM_BLNDGAM_LUT_WRITE_COLOR_MASK, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_LUT_CONTROL, CM_BLNDGAM_LUT_HOST_SEL, mask_sh), \
+	TF_SF(CM0_CM_BLNDGAM_LUT_CONTROL, CM_BLNDGAM_LUT_CONFIG_MODE, mask_sh), \
+	TF_SF(CM0_CM_3DLUT_MODE, CM_3DLUT_MODE_CURRENT, mask_sh), \
+	TF_SF(CM0_CM_SHAPER_CONTROL, CM_SHAPER_MODE_CURRENT, mask_sh)
+
+
+#define DPP_REG_LIST_SH_MASK_DCN30(mask_sh)\
+	DPP_REG_LIST_SH_MASK_DCN30_COMMON(mask_sh), \
+	TF_REG_LIST_SH_MASK_DCN20_COMMON(mask_sh), \
+	DPP_REG_LIST_SH_MASK_DCN30_UPDATED(mask_sh)
+
+#define DPP_REG_FIELD_LIST_DCN3(type) \
+	TF_REG_FIELD_LIST_DCN2_0(type); \
+	type FORMAT_CROSSBAR_R; \
+	type FORMAT_CROSSBAR_G; \
+	type FORMAT_CROSSBAR_B; \
+	type CM_DEALPHA_EN;\
+	type CM_DEALPHA_ABLND;\
+	type CM_BIAS_Y_G;\
+	type CM_BIAS_CB_B;\
+	type CM_BIAS_CR_R;\
+	type GAMCOR_MEM_PWR_DIS; \
+	type GAMCOR_MEM_PWR_FORCE; \
+	type PRE_DEGAM_MODE;\
+	type PRE_DEGAM_SELECT;\
+	type CNVC_ALPHA_PLANE_ENABLE; \
+	type PRE_DEALPHA_EN; \
+	type PRE_DEALPHA_ABLND_EN; \
+	type PRE_REALPHA_EN; \
+	type PRE_REALPHA_ABLND_EN; \
+	type PRE_CSC_MODE; \
+	type PRE_CSC_MODE_CURRENT; \
+	type PRE_CSC_C11; \
+	type PRE_CSC_C12; \
+	type PRE_CSC_C33; \
+	type PRE_CSC_C34; \
+	type CM_POST_CSC_MODE; \
+	type CM_POST_CSC_MODE_CURRENT; \
+	type CM_POST_CSC_C11; \
+	type CM_POST_CSC_C12; \
+	type CM_POST_CSC_C33; \
+	type CM_POST_CSC_C34; \
+	type CM_GAMCOR_MODE; \
+	type CM_GAMCOR_SELECT; \
+	type CM_GAMCOR_PWL_DISABLE; \
+	type CM_GAMCOR_MODE_CURRENT; \
+	type CM_GAMCOR_SELECT_CURRENT; \
+	type CM_GAMCOR_LUT_INDEX; \
+	type CM_GAMCOR_LUT_DATA; \
+	type CM_GAMCOR_LUT_WRITE_COLOR_MASK; \
+	type CM_GAMCOR_LUT_READ_COLOR_SEL; \
+	type CM_GAMCOR_LUT_READ_DBG; \
+	type CM_GAMCOR_LUT_HOST_SEL; \
+	type CM_GAMCOR_LUT_CONFIG_MODE; \
+	type CM_GAMCOR_LUT_STATUS; \
+	type CM_GAMCOR_RAMA_EXP_REGION_START_B; \
+	type CM_GAMCOR_RAMA_EXP_REGION_START_SEGMENT_B; \
+	type CM_GAMCOR_RAMA_EXP_REGION_START_SLOPE_B; \
+	type CM_GAMCOR_RAMA_EXP_REGION_START_BASE_B; \
+	type CM_GAMCOR_RAMA_EXP_REGION_END_BASE_B; \
+	type CM_GAMCOR_RAMA_EXP_REGION_END_B; \
+	type CM_GAMCOR_RAMA_EXP_REGION_END_SLOPE_B; \
+	type CM_GAMCOR_RAMA_OFFSET_B; \
+	type CM_GAMCOR_RAMA_EXP_REGION0_LUT_OFFSET; \
+	type CM_GAMCOR_RAMA_EXP_REGION0_NUM_SEGMENTS; \
+	type CM_GAMCOR_RAMA_EXP_REGION1_LUT_OFFSET; \
+	type CM_GAMCOR_RAMA_EXP_REGION1_NUM_SEGMENTS;\
+	type CM_GAMUT_REMAP_MODE_CURRENT;\
+	type CM_BLNDGAM_RAMB_EXP_REGION_START_SLOPE_B; \
+	type CM_BLNDGAM_RAMB_EXP_REGION_START_SLOPE_G; \
+	type CM_BLNDGAM_RAMB_EXP_REGION_START_SLOPE_R; \
+	type CM_BLNDGAM_RAMA_EXP_REGION_START_SLOPE_B; \
+	type CM_BLNDGAM_RAMA_EXP_REGION_START_SLOPE_G; \
+	type CM_BLNDGAM_RAMA_EXP_REGION_START_SLOPE_R; \
+	type CM_BLNDGAM_LUT_WRITE_COLOR_MASK; \
+	type CM_BLNDGAM_LUT_HOST_SEL; \
+	type CM_BLNDGAM_LUT_CONFIG_MODE; \
+	type CM_3DLUT_MODE_CURRENT; \
+	type CM_SHAPER_MODE_CURRENT; \
+	type CM_BLNDGAM_MODE; \
+	type CM_BLNDGAM_MODE_CURRENT; \
+	type CM_BLNDGAM_SELECT_CURRENT; \
+	type CM_BLNDGAM_SELECT; \
+	type GAMCOR_MEM_PWR_STATE
+
+struct dcn3_dpp_shift {
+	DPP_REG_FIELD_LIST_DCN3(uint8_t);
+};
+
+struct dcn3_dpp_mask {
+	DPP_REG_FIELD_LIST_DCN3(uint32_t);
+};
+
+#define DPP_DCN3_REG_VARIABLE_LIST_COMMON \
+	DPP_DCN2_REG_VARIABLE_LIST; \
+	uint32_t CM_MEM_PWR_STATUS;\
+	uint32_t CM_DEALPHA;\
+	uint32_t CM_BIAS_CR_R;\
+	uint32_t CM_BIAS_Y_G_CB_B;\
+	uint32_t PRE_DEGAM;\
+	uint32_t PRE_DEALPHA; \
+	uint32_t PRE_REALPHA; \
+	uint32_t PRE_CSC_MODE; \
+	uint32_t PRE_CSC_C11_C12; \
+	uint32_t PRE_CSC_C33_C34; \
+	uint32_t PRE_CSC_B_C11_C12; \
+	uint32_t PRE_CSC_B_C33_C34; \
+	uint32_t CM_POST_CSC_CONTROL; \
+	uint32_t CM_POST_CSC_C11_C12; \
+	uint32_t CM_POST_CSC_C33_C34; \
+	uint32_t CM_POST_CSC_B_C11_C12; \
+	uint32_t CM_POST_CSC_B_C33_C34; \
+	uint32_t CM_GAMUT_REMAP_B_C11_C12; \
+	uint32_t CM_GAMUT_REMAP_B_C13_C14; \
+	uint32_t CM_GAMUT_REMAP_B_C21_C22; \
+	uint32_t CM_GAMUT_REMAP_B_C23_C24; \
+	uint32_t CM_GAMUT_REMAP_B_C31_C32; \
+	uint32_t CM_GAMUT_REMAP_B_C33_C34; \
+	uint32_t CM_GAMCOR_CONTROL; \
+	uint32_t CM_GAMCOR_LUT_CONTROL; \
+	uint32_t CM_GAMCOR_LUT_INDEX; \
+	uint32_t CM_GAMCOR_LUT_DATA; \
+	uint32_t CM_GAMCOR_RAMB_START_CNTL_B; \
+	uint32_t CM_GAMCOR_RAMB_START_CNTL_G; \
+	uint32_t CM_GAMCOR_RAMB_START_CNTL_R; \
+	uint32_t CM_GAMCOR_RAMB_START_SLOPE_CNTL_B; \
+	uint32_t CM_GAMCOR_RAMB_START_SLOPE_CNTL_G; \
+	uint32_t CM_GAMCOR_RAMB_START_SLOPE_CNTL_R; \
+	uint32_t CM_GAMCOR_RAMB_END_CNTL1_B; \
+	uint32_t CM_GAMCOR_RAMB_END_CNTL2_B; \
+	uint32_t CM_GAMCOR_RAMB_END_CNTL1_G; \
+	uint32_t CM_GAMCOR_RAMB_END_CNTL2_G; \
+	uint32_t CM_GAMCOR_RAMB_END_CNTL1_R; \
+	uint32_t CM_GAMCOR_RAMB_END_CNTL2_R; \
+	uint32_t CM_GAMCOR_RAMB_REGION_0_1; \
+	uint32_t CM_GAMCOR_RAMB_REGION_32_33; \
+	uint32_t CM_GAMCOR_RAMB_OFFSET_B; \
+	uint32_t CM_GAMCOR_RAMB_OFFSET_G; \
+	uint32_t CM_GAMCOR_RAMB_OFFSET_R; \
+	uint32_t CM_GAMCOR_RAMB_START_BASE_CNTL_B; \
+	uint32_t CM_GAMCOR_RAMB_START_BASE_CNTL_G; \
+	uint32_t CM_GAMCOR_RAMB_START_BASE_CNTL_R; \
+	uint32_t CM_GAMCOR_RAMA_START_CNTL_B; \
+	uint32_t CM_GAMCOR_RAMA_START_CNTL_G; \
+	uint32_t CM_GAMCOR_RAMA_START_CNTL_R; \
+	uint32_t CM_GAMCOR_RAMA_START_SLOPE_CNTL_B; \
+	uint32_t CM_GAMCOR_RAMA_START_SLOPE_CNTL_G; \
+	uint32_t CM_GAMCOR_RAMA_START_SLOPE_CNTL_R; \
+	uint32_t CM_GAMCOR_RAMA_END_CNTL1_B; \
+	uint32_t CM_GAMCOR_RAMA_END_CNTL2_B; \
+	uint32_t CM_GAMCOR_RAMA_END_CNTL1_G; \
+	uint32_t CM_GAMCOR_RAMA_END_CNTL2_G; \
+	uint32_t CM_GAMCOR_RAMA_END_CNTL1_R; \
+	uint32_t CM_GAMCOR_RAMA_END_CNTL2_R; \
+	uint32_t CM_GAMCOR_RAMA_REGION_0_1; \
+	uint32_t CM_GAMCOR_RAMA_REGION_32_33; \
+	uint32_t CM_GAMCOR_RAMA_OFFSET_B; \
+	uint32_t CM_GAMCOR_RAMA_OFFSET_G; \
+	uint32_t CM_GAMCOR_RAMA_OFFSET_R; \
+	uint32_t CM_GAMCOR_RAMA_START_BASE_CNTL_B; \
+	uint32_t CM_GAMCOR_RAMA_START_BASE_CNTL_G; \
+	uint32_t CM_GAMCOR_RAMA_START_BASE_CNTL_R; \
+	uint32_t CM_BLNDGAM_RAMA_START_SLOPE_CNTL_B; \
+	uint32_t CM_BLNDGAM_RAMA_START_SLOPE_CNTL_G; \
+	uint32_t CM_BLNDGAM_RAMA_START_SLOPE_CNTL_R; \
+	uint32_t CM_BLNDGAM_RAMB_START_SLOPE_CNTL_B; \
+	uint32_t CM_BLNDGAM_RAMB_START_SLOPE_CNTL_G; \
+	uint32_t CM_BLNDGAM_RAMB_START_SLOPE_CNTL_R; \
+	uint32_t CM_BLNDGAM_LUT_CONTROL
+
+
+struct dcn3_dpp_registers {
+	DPP_DCN3_REG_VARIABLE_LIST_COMMON;
+};
+
+
+struct dcn3_dpp {
+	struct dpp base;
+
+	const struct dcn3_dpp_registers *tf_regs;
+	const struct dcn3_dpp_shift *tf_shift;
+	const struct dcn3_dpp_mask *tf_mask;
+
+	const uint16_t *filter_v;
+	const uint16_t *filter_h;
+	const uint16_t *filter_v_c;
+	const uint16_t *filter_h_c;
+	int lb_pixel_depth_supported;
+	int lb_memory_size;
+	int lb_bits_per_entry;
+	bool is_write_to_ram_a_safe;
+	struct scaler_data scl_data;
+	struct pwl_params pwl_data;
+};
+
+bool dpp3_construct(struct dcn3_dpp *dpp3,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn3_dpp_registers *tf_regs,
+	const struct dcn3_dpp_shift *tf_shift,
+	const struct dcn3_dpp_mask *tf_mask);
+
+bool dpp3_program_gamcor_lut(
+	struct dpp *dpp_base, const struct pwl_params *params);
+
+void dpp3_program_CM_dealpha(
+		struct dpp *dpp_base,
+		uint32_t enable, uint32_t additive_blending);
+
+void dpp3_program_CM_bias(
+		struct dpp *dpp_base,
+		struct CM_bias_params *bias_params);
+
+void dpp3_set_hdr_multiplier(
+		struct dpp *dpp_base,
+		uint32_t multiplier);
+
+void dpp3_cm_set_gamut_remap(
+		struct dpp *dpp_base,
+		const struct dpp_grph_csc_adjustment *adjust);
+
+void dpp3_set_pre_degam(struct dpp *dpp_base,
+		uint32_t degamma_lut_selection);
+
+void dpp3_set_cursor_attributes(
+		struct dpp *dpp_base,
+		struct dc_cursor_attributes *cursor_attributes);
+
+void dpp3_program_post_csc(
+		struct dpp *dpp_base,
+		enum dc_color_space color_space,
+		enum dcn10_input_csc_select input_select,
+		const struct out_csc_color_matrix *tbl_entry);
+
+void dpp3_program_cm_bias(
+	struct dpp *dpp_base,
+	struct CM_bias_params *bias_params);
+
+void dpp3_program_cm_dealpha(
+		struct dpp *dpp_base,
+	uint32_t enable, uint32_t additive_blending);
+
+#endif /* __DC_HWSS_DCN30_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
new file mode 100644
index 000000000000..9ab63c72f21c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
@@ -0,0 +1,410 @@
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
+#include "dm_services.h"
+#include "core_types.h"
+#include "reg_helper.h"
+#include "dcn30_dpp.h"
+#include "basics/conversion.h"
+#include "dcn30_cm_common.h"
+
+#define REG(reg)\
+	dpp->tf_regs->reg
+
+#define CTX \
+	dpp->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	dpp->tf_shift->field_name, dpp->tf_mask->field_name
+
+static void dpp3_enable_cm_block(
+		struct dpp *dpp_base)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	unsigned int cm_bypass_mode = 0;
+
+	// debug option: put CM in bypass mode
+	if (dpp_base->ctx->dc->debug.cm_in_bypass)
+		cm_bypass_mode = 1;
+
+	REG_UPDATE(CM_CONTROL, CM_BYPASS, cm_bypass_mode);
+}
+
+static enum dc_lut_mode dpp30_get_gamcor_current(struct dpp *dpp_base)
+{
+	enum dc_lut_mode mode;
+	uint32_t state_mode;
+	uint32_t lut_mode;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_GET(CM_GAMCOR_CONTROL,
+			CM_GAMCOR_MODE_CURRENT, &state_mode);
+
+		if (state_mode == 0)
+			mode = LUT_BYPASS;
+
+		if (state_mode == 2) {//Programmable RAM LUT
+			REG_GET(CM_GAMCOR_CONTROL,
+					CM_GAMCOR_SELECT_CURRENT, &lut_mode);
+
+			if (lut_mode == 0)
+				mode = LUT_RAM_A;
+			else
+				mode = LUT_RAM_B;
+		}
+
+		return mode;
+}
+
+static void dpp3_program_gammcor_lut(
+		struct dpp *dpp_base,
+		const struct pwl_result_data *rgb,
+		uint32_t num,
+		bool is_ram_a)
+{
+	uint32_t i;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	uint32_t last_base_value_red = rgb[num-1].red_reg + rgb[num-1].delta_red_reg;
+	uint32_t last_base_value_green = rgb[num-1].green_reg + rgb[num-1].delta_green_reg;
+	uint32_t last_base_value_blue = rgb[num-1].blue_reg + rgb[num-1].delta_blue_reg;
+
+	/*fill in the LUT with all base values to be used by pwl module
+	 * HW auto increments the LUT index: back-to-back write
+	 */
+	if (is_rgb_equal(rgb,  num)) {
+		for (i = 0 ; i < num; i++)
+			REG_SET(CM_GAMCOR_LUT_DATA, 0, CM_GAMCOR_LUT_DATA, rgb[i].red_reg);
+
+		REG_SET(CM_GAMCOR_LUT_DATA, 0, CM_GAMCOR_LUT_DATA, last_base_value_red);
+
+	} else {
+		REG_UPDATE(CM_GAMCOR_LUT_CONTROL,
+				CM_GAMCOR_LUT_WRITE_COLOR_MASK, 4);
+		for (i = 0 ; i < num; i++)
+			REG_SET(CM_GAMCOR_LUT_DATA, 0, CM_GAMCOR_LUT_DATA, rgb[i].red_reg);
+
+		REG_SET(CM_GAMCOR_LUT_DATA, 0, CM_GAMCOR_LUT_DATA, last_base_value_red);
+
+		REG_SET(CM_GAMCOR_LUT_INDEX, 0, CM_GAMCOR_LUT_INDEX, 0);
+
+		REG_UPDATE(CM_GAMCOR_LUT_CONTROL,
+				CM_GAMCOR_LUT_WRITE_COLOR_MASK, 2);
+		for (i = 0 ; i < num; i++)
+			REG_SET(CM_GAMCOR_LUT_DATA, 0, CM_GAMCOR_LUT_DATA, rgb[i].green_reg);
+
+		REG_SET(CM_GAMCOR_LUT_DATA, 0, CM_GAMCOR_LUT_DATA, last_base_value_green);
+
+		REG_SET(CM_GAMCOR_LUT_INDEX, 0, CM_GAMCOR_LUT_INDEX, 0);
+
+		REG_UPDATE(CM_GAMCOR_LUT_CONTROL,
+				CM_GAMCOR_LUT_WRITE_COLOR_MASK, 1);
+		for (i = 0 ; i < num; i++)
+			REG_SET(CM_GAMCOR_LUT_DATA, 0, CM_GAMCOR_LUT_DATA, rgb[i].blue_reg);
+
+		REG_SET(CM_GAMCOR_LUT_DATA, 0, CM_GAMCOR_LUT_DATA, last_base_value_blue);
+	}
+}
+
+static void dpp3_power_on_gamcor_lut(
+		struct dpp *dpp_base,
+	bool power_on)
+{
+	uint32_t power_status;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+
+	REG_SET(CM_MEM_PWR_CTRL, 0,
+			GAMCOR_MEM_PWR_DIS, power_on == true ? 0:1);
+
+	REG_GET(CM_MEM_PWR_STATUS, GAMCOR_MEM_PWR_STATE, &power_status);
+	if (power_status != 0)
+		BREAK_TO_DEBUGGER();
+
+
+}
+
+void dpp3_program_cm_dealpha(
+		struct dpp *dpp_base,
+	uint32_t enable, uint32_t additive_blending)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_SET_2(CM_DEALPHA, 0,
+			CM_DEALPHA_EN, enable,
+			CM_DEALPHA_ABLND, additive_blending);
+}
+
+void dpp3_program_cm_bias(
+	struct dpp *dpp_base,
+	struct CM_bias_params *bias_params)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_SET(CM_BIAS_CR_R, 0, CM_BIAS_CR_R, bias_params->cm_bias_cr_r);
+	REG_SET_2(CM_BIAS_Y_G_CB_B, 0,
+			CM_BIAS_Y_G, bias_params->cm_bias_y_g,
+			CM_BIAS_CB_B, bias_params->cm_bias_cb_b);
+}
+
+static void dpp3_gamcor_reg_field(
+		struct dcn3_dpp *dpp,
+		struct dcn3_xfer_func_reg *reg)
+{
+
+	reg->shifts.field_region_start_base = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION_START_BASE_B;
+	reg->masks.field_region_start_base = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION_START_BASE_B;
+	reg->shifts.field_offset = dpp->tf_shift->CM_GAMCOR_RAMA_OFFSET_B;
+	reg->masks.field_offset = dpp->tf_mask->CM_GAMCOR_RAMA_OFFSET_B;
+
+	reg->shifts.exp_region0_lut_offset = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION0_LUT_OFFSET;
+	reg->masks.exp_region0_lut_offset = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION0_LUT_OFFSET;
+	reg->shifts.exp_region0_num_segments = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION0_NUM_SEGMENTS;
+	reg->masks.exp_region0_num_segments = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION0_NUM_SEGMENTS;
+	reg->shifts.exp_region1_lut_offset = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION1_LUT_OFFSET;
+	reg->masks.exp_region1_lut_offset = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION1_LUT_OFFSET;
+	reg->shifts.exp_region1_num_segments = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION1_NUM_SEGMENTS;
+	reg->masks.exp_region1_num_segments = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION1_NUM_SEGMENTS;
+
+	reg->shifts.field_region_end = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION_END_B;
+	reg->masks.field_region_end = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION_END_B;
+	reg->shifts.field_region_end_slope = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION_END_SLOPE_B;
+	reg->masks.field_region_end_slope = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION_END_SLOPE_B;
+	reg->shifts.field_region_end_base = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION_END_BASE_B;
+	reg->masks.field_region_end_base = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION_END_BASE_B;
+	reg->shifts.field_region_linear_slope = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION_START_SLOPE_B;
+	reg->masks.field_region_linear_slope = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION_START_SLOPE_B;
+	reg->shifts.exp_region_start = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION_START_B;
+	reg->masks.exp_region_start = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION_START_B;
+	reg->shifts.exp_resion_start_segment = dpp->tf_shift->CM_GAMCOR_RAMA_EXP_REGION_START_SEGMENT_B;
+	reg->masks.exp_resion_start_segment = dpp->tf_mask->CM_GAMCOR_RAMA_EXP_REGION_START_SEGMENT_B;
+}
+
+static void dpp3_configure_gamcor_lut(
+		struct dpp *dpp_base,
+		bool is_ram_a)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_UPDATE(CM_GAMCOR_LUT_CONTROL,
+			CM_GAMCOR_LUT_WRITE_COLOR_MASK, 7);
+	REG_UPDATE(CM_GAMCOR_LUT_CONTROL,
+			CM_GAMCOR_LUT_HOST_SEL, is_ram_a == true ? 0:1);
+	REG_SET(CM_GAMCOR_LUT_INDEX, 0, CM_GAMCOR_LUT_INDEX, 0);
+}
+
+
+bool dpp3_program_gamcor_lut(
+	struct dpp *dpp_base, const struct pwl_params *params)
+{
+	enum dc_lut_mode current_mode;
+	enum dc_lut_mode next_mode;
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	struct dcn3_xfer_func_reg gam_regs;
+
+	dpp3_enable_cm_block(dpp_base);
+
+	if (params == NULL) { //bypass if we have no pwl data
+		REG_SET(CM_GAMCOR_CONTROL, 0, CM_GAMCOR_MODE, 0);
+		return false;
+	}
+	dpp3_power_on_gamcor_lut(dpp_base, true);
+	REG_SET(CM_GAMCOR_CONTROL, 0, CM_GAMCOR_MODE, 2);
+
+	current_mode = dpp30_get_gamcor_current(dpp_base);
+	if (current_mode == LUT_BYPASS || current_mode == LUT_RAM_A)
+		next_mode = LUT_RAM_B;
+	else
+		next_mode = LUT_RAM_A;
+
+	dpp3_power_on_gamcor_lut(dpp_base, true);
+	dpp3_configure_gamcor_lut(dpp_base, next_mode == LUT_RAM_A ? true:false);
+
+	if (next_mode == LUT_RAM_B) {
+		gam_regs.start_cntl_b = REG(CM_GAMCOR_RAMB_START_CNTL_B);
+		gam_regs.start_cntl_g = REG(CM_GAMCOR_RAMB_START_CNTL_G);
+		gam_regs.start_cntl_r = REG(CM_GAMCOR_RAMB_START_CNTL_R);
+		gam_regs.start_slope_cntl_b = REG(CM_GAMCOR_RAMB_START_SLOPE_CNTL_B);
+		gam_regs.start_slope_cntl_g = REG(CM_GAMCOR_RAMB_START_SLOPE_CNTL_G);
+		gam_regs.start_slope_cntl_r = REG(CM_GAMCOR_RAMB_START_SLOPE_CNTL_R);
+		gam_regs.start_end_cntl1_b = REG(CM_GAMCOR_RAMB_END_CNTL1_B);
+		gam_regs.start_end_cntl2_b = REG(CM_GAMCOR_RAMB_END_CNTL2_B);
+		gam_regs.start_end_cntl1_g = REG(CM_GAMCOR_RAMB_END_CNTL1_G);
+		gam_regs.start_end_cntl2_g = REG(CM_GAMCOR_RAMB_END_CNTL2_G);
+		gam_regs.start_end_cntl1_r = REG(CM_GAMCOR_RAMB_END_CNTL1_R);
+		gam_regs.start_end_cntl2_r = REG(CM_GAMCOR_RAMB_END_CNTL2_R);
+		gam_regs.region_start = REG(CM_GAMCOR_RAMB_REGION_0_1);
+		gam_regs.region_end = REG(CM_GAMCOR_RAMB_REGION_32_33);
+		//New registers in DCN3AG/DCN GAMCOR block
+		gam_regs.offset_b =  REG(CM_GAMCOR_RAMB_OFFSET_B);
+		gam_regs.offset_g =  REG(CM_GAMCOR_RAMB_OFFSET_G);
+		gam_regs.offset_r =  REG(CM_GAMCOR_RAMB_OFFSET_R);
+		gam_regs.start_base_cntl_b = REG(CM_GAMCOR_RAMB_START_BASE_CNTL_B);
+		gam_regs.start_base_cntl_g = REG(CM_GAMCOR_RAMB_START_BASE_CNTL_G);
+		gam_regs.start_base_cntl_r = REG(CM_GAMCOR_RAMB_START_BASE_CNTL_R);
+	} else {
+		gam_regs.start_cntl_b = REG(CM_GAMCOR_RAMA_START_CNTL_B);
+		gam_regs.start_cntl_g = REG(CM_GAMCOR_RAMA_START_CNTL_G);
+		gam_regs.start_cntl_r = REG(CM_GAMCOR_RAMA_START_CNTL_R);
+		gam_regs.start_slope_cntl_b = REG(CM_GAMCOR_RAMA_START_SLOPE_CNTL_B);
+		gam_regs.start_slope_cntl_g = REG(CM_GAMCOR_RAMA_START_SLOPE_CNTL_G);
+		gam_regs.start_slope_cntl_r = REG(CM_GAMCOR_RAMA_START_SLOPE_CNTL_R);
+		gam_regs.start_end_cntl1_b = REG(CM_GAMCOR_RAMA_END_CNTL1_B);
+		gam_regs.start_end_cntl2_b = REG(CM_GAMCOR_RAMA_END_CNTL2_B);
+		gam_regs.start_end_cntl1_g = REG(CM_GAMCOR_RAMA_END_CNTL1_G);
+		gam_regs.start_end_cntl2_g = REG(CM_GAMCOR_RAMA_END_CNTL2_G);
+		gam_regs.start_end_cntl1_r = REG(CM_GAMCOR_RAMA_END_CNTL1_R);
+		gam_regs.start_end_cntl2_r = REG(CM_GAMCOR_RAMA_END_CNTL2_R);
+		gam_regs.region_start = REG(CM_GAMCOR_RAMA_REGION_0_1);
+		gam_regs.region_end = REG(CM_GAMCOR_RAMA_REGION_32_33);
+		//New registers in DCN3AG/DCN GAMCOR block
+		gam_regs.offset_b =  REG(CM_GAMCOR_RAMA_OFFSET_B);
+		gam_regs.offset_g =  REG(CM_GAMCOR_RAMA_OFFSET_G);
+		gam_regs.offset_r =  REG(CM_GAMCOR_RAMA_OFFSET_R);
+		gam_regs.start_base_cntl_b = REG(CM_GAMCOR_RAMA_START_BASE_CNTL_B);
+		gam_regs.start_base_cntl_g = REG(CM_GAMCOR_RAMA_START_BASE_CNTL_G);
+		gam_regs.start_base_cntl_r = REG(CM_GAMCOR_RAMA_START_BASE_CNTL_R);
+	}
+
+	//get register fields
+	dpp3_gamcor_reg_field(dpp, &gam_regs);
+
+	//program register set for LUTA/LUTB
+	cm_helper_program_gamcor_xfer_func(dpp_base->ctx, params, &gam_regs);
+
+	dpp3_program_gammcor_lut(dpp_base, params->rgb_resulted, params->hw_points_num,
+			next_mode == LUT_RAM_A ? true:false);
+
+	//select Gamma LUT to use for next frame
+	REG_UPDATE(CM_GAMCOR_CONTROL, CM_GAMCOR_SELECT, next_mode == LUT_RAM_A ? 0:1);
+
+	return true;
+}
+
+void dpp3_set_hdr_multiplier(
+		struct dpp *dpp_base,
+		uint32_t multiplier)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+
+	REG_UPDATE(CM_HDR_MULT_COEF, CM_HDR_MULT_COEF, multiplier);
+}
+
+
+static void program_gamut_remap(
+		struct dcn3_dpp *dpp,
+		const uint16_t *regval,
+		int select)
+{
+	uint16_t selection = 0;
+	struct color_matrices_reg gam_regs;
+
+	if (regval == NULL || select == GAMUT_REMAP_BYPASS) {
+		REG_SET(CM_GAMUT_REMAP_CONTROL, 0,
+				CM_GAMUT_REMAP_MODE, 0);
+		return;
+	}
+	switch (select) {
+	case GAMUT_REMAP_COEFF:
+		selection = 1;
+		break;
+		/*this corresponds to GAMUT_REMAP coefficients set B
+		 *we don't have common coefficient sets in dcn3ag/dcn3
+		 */
+	case GAMUT_REMAP_COMA_COEFF:
+		selection = 2;
+		break;
+	default:
+		break;
+	}
+
+	gam_regs.shifts.csc_c11 = dpp->tf_shift->CM_GAMUT_REMAP_C11;
+	gam_regs.masks.csc_c11  = dpp->tf_mask->CM_GAMUT_REMAP_C11;
+	gam_regs.shifts.csc_c12 = dpp->tf_shift->CM_GAMUT_REMAP_C12;
+	gam_regs.masks.csc_c12 = dpp->tf_mask->CM_GAMUT_REMAP_C12;
+
+
+	if (select == GAMUT_REMAP_COEFF) {
+		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_C33_C34);
+
+		cm_helper_program_color_matrices(
+				dpp->base.ctx,
+				regval,
+				&gam_regs);
+
+	} else  if (select == GAMUT_REMAP_COMA_COEFF) {
+
+		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_B_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_B_C33_C34);
+
+		cm_helper_program_color_matrices(
+				dpp->base.ctx,
+				regval,
+				&gam_regs);
+
+	}
+	//select coefficient set to use
+	REG_SET(
+			CM_GAMUT_REMAP_CONTROL, 0,
+			CM_GAMUT_REMAP_MODE, selection);
+}
+
+void dpp3_cm_set_gamut_remap(
+	struct dpp *dpp_base,
+	const struct dpp_grph_csc_adjustment *adjust)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	int i = 0;
+	int gamut_mode;
+
+	if (adjust->gamut_adjust_type != GRAPHICS_GAMUT_ADJUST_TYPE_SW)
+		/* Bypass if type is bypass or hw */
+		program_gamut_remap(dpp, NULL, GAMUT_REMAP_BYPASS);
+	else {
+		struct fixed31_32 arr_matrix[12];
+		uint16_t arr_reg_val[12];
+
+		for (i = 0; i < 12; i++)
+			arr_matrix[i] = adjust->temperature_matrix[i];
+
+		convert_float_matrix(
+			arr_reg_val, arr_matrix, 12);
+
+		//current coefficient set in use
+		REG_GET(CM_GAMUT_REMAP_CONTROL, CM_GAMUT_REMAP_MODE_CURRENT, &gamut_mode);
+
+		if (gamut_mode == 0)
+			gamut_mode = 1; //use coefficient set A
+		else if (gamut_mode == 1)
+			gamut_mode = 2;
+		else
+			gamut_mode = 1;
+
+		//follow dcn2 approach for now - using only coefficient set A
+		program_gamut_remap(dpp, arr_reg_val, GAMUT_REMAP_COEFF);
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index 45ef390ae052..0491720c5fe9 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -121,6 +121,13 @@ struct CM_bias_params {
 };
 
 struct dpp_funcs {
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	bool (*dpp_program_gamcor_lut)(
+		struct dpp *dpp_base, const struct pwl_params *params);
+
+	void (*dpp_set_pre_degam)(struct dpp *dpp_base,
+			enum dc_transfer_func_predefined tr);
+#endif
 
 	void (*dpp_program_cm_dealpha)(struct dpp *dpp_base,
 		uint32_t enable, uint32_t additive_blending);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A91EAC04
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C016E59F;
	Mon,  1 Jun 2020 18:29:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359A16E59F
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:29:58 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id i16so1861529qtr.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xth1LnC6uN7fGm6+JnidGYwHacwNlfKbwOZHPHHRD68=;
 b=EF2U3SzaKC4LBMf+tGvze6+wZW+r+2g1QknioCUBTd+SMoIZs5JaPxnXsLOB+3ajE8
 TClykvxFUa2fhJig6rDOgdVERF8ldw8m64RcS1yxJHkI2rNWsos2nN20RQ8AJagtOKUx
 YQ4qlsD6HmX8tVrLW7NL7NW4Ey3fphnZA+tkh8z+BK6Bf07oPyjO7INcIMSdrguKgZLl
 KWithZ3X/GWfHRMBD/W4rbQLMxJIzNMImhQiwP3ZBFK9MHULcP9rMFLABZNuKSgfikRO
 ATGT2M4XjBXYVMkEk+7j/yfZF7qGuTb9ZDnKGS8O9xJLv69sGYGugs9zY8se/adwtfqn
 URBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xth1LnC6uN7fGm6+JnidGYwHacwNlfKbwOZHPHHRD68=;
 b=WFVzIZgVxUEB3rVSNyUPN2iNf8eustE80V5VSMOgyUANVdMZxMkeb/X/t1DMHoxiFw
 skS1XKeZztFw8kfmx6C6U4aLh98OnEW8W6OSqIM/Whw2fn2R7B5jP0M3cjluX5VVOEjN
 OYyW3y49U8GtVRrKL6UaJDCjI5S/yCpag7l/XoO99uew7zTKVNPKvR6T/tI/rb9bOe+Y
 WrWxNtfJF8ECEhEL1qdp+86N+62eexb+ioNJAxvcuV0K/09NPDQOW+hWA1QLWDb6Jsbw
 Dz/blE7kvrdMfcMSJ/b1cWQKJQ9IHabT7C6EULj0kyZHlRbY8YF/lJeqOLDQn3/fBgZt
 tAQw==
X-Gm-Message-State: AOAM532VKxxUErCvGmK6NY27UYEgidNRIN105jQ0ZyoKCm4oqhKsEKQV
 BL97Y9gYeX2u4WpRgDJLUol66vPb
X-Google-Smtp-Source: ABdhPJykPfNAxS+peryZ/3yj6OP0z28TQkxKfV9BVSBcDGDpIl+eOMU1IR3/Ts3WQZ1vlRVpZBunRg==
X-Received: by 2002:ac8:3036:: with SMTP id f51mr23709785qte.226.1591036195966; 
 Mon, 01 Jun 2020 11:29:55 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:29:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 190/207] drm/amd/display: Add DCN3 DWB
Date: Mon,  1 Jun 2020 14:29:09 -0400
Message-Id: <20200601182926.1267958-12-alexander.deucher@amd.com>
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

Add support to program the DCN3 DWB (Display Writeback)

HW Blocks:

 +--------++------+       +----------+
 | HUBBUB || HUBP |  <--  | MMHUBBUB |
 +--------++------+       +----------+
        |                     ^
        v                     |
    +--------+            +--------+
    |  DPP   |            |  DWB   |
    +--------+            +--------+
        |
        v                      ^
    +--------+                 |
    |  MPC   |                 |
    +--------+                 |
        |                      |
        v                      |
    +-------+                  |
    |  OPP  |                  |
    +-------+                  |
        |                      |
        v                      |
    +--------+                /
    |  OPTC  |  --------------
    +--------+
        |
        v
    +--------+       +--------+
    |  DIO   |       |  DCCG  |
    +--------+       +--------+

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc_types.h     |  25 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c  | 264 +++++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h  | 923 ++++++++++++++++++
 .../drm/amd/display/dc/dcn30/dcn30_dwb_cm.c   | 354 +++++++
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h   |  83 ++
 5 files changed, 1649 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c

diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index f236da1c1859..c726fb0695da 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -475,6 +475,19 @@ enum display_content_type {
 	DISPLAY_CONTENT_TYPE_GAME = 8
 };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+enum cm_gamut_adjust_type {
+	CM_GAMUT_ADJUST_TYPE_BYPASS = 0,
+	CM_GAMUT_ADJUST_TYPE_HW, /* without adjustments */
+	CM_GAMUT_ADJUST_TYPE_SW /* use adjustments */
+};
+
+struct cm_grph_csc_adjustment {
+	struct fixed31_32 temperature_matrix[12];
+	enum cm_gamut_adjust_type gamut_adjust_type;
+	enum cm_gamut_coef_format gamut_coef_format;
+};
+#endif
 /* writeback */
 struct dwb_stereo_params {
 	bool				stereo_enabled;		/* false: normal mode, true: 3D stereo */
@@ -492,9 +505,21 @@ struct dc_dwb_cnv_params {
 	unsigned int		crop_x;		/* cropped window start x value at cnv output */
 	unsigned int		crop_y;		/* cropped window start y value at cnv output */
 	enum dwb_cnv_out_bpc cnv_out_bpc;	/* cnv output pixel depth - 8bpc or 10bpc */
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	enum dwb_out_format	fc_out_format;	/* dwb output pixel format - 2101010 or 16161616 and ARGB or RGBA */
+	enum dwb_out_denorm	out_denorm_mode;/* dwb output denormalization mode */
+	unsigned int		out_max_pix_val;/* pixel values greater than out_max_pix_val are clamped to out_max_pix_val */
+	unsigned int		out_min_pix_val;/* pixel values less than out_min_pix_val are clamped to out_min_pix_val */
+#endif
 };
 
 struct dc_dwb_params {
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	unsigned int			dwbscl_black_color; /* must be in FP1.5.10 */
+	unsigned int			hdr_mult;	/* must be in FP1.6.12 */
+	struct cm_grph_csc_adjustment	csc_params;
+	struct dwb_stereo_params	stereo_params;
+#endif
 	struct dc_dwb_cnv_params	cnv_params;	/* CNV source size and cropping window parameters */
 	unsigned int			dest_width;	/* Destination width */
 	unsigned int			dest_height;	/* Destination height */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
new file mode 100644
index 000000000000..f14f69616692
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
@@ -0,0 +1,264 @@
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
+#include "dwb.h"
+#include "dcn30_dwb.h"
+
+
+#define REG(reg)\
+	dwbc30->dwbc_regs->reg
+
+#define CTX \
+	dwbc30->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	dwbc30->dwbc_shift->field_name, dwbc30->dwbc_mask->field_name
+
+#define DC_LOGGER \
+	dwbc30->base.ctx->logger
+
+static bool dwb3_get_caps(struct dwbc *dwbc, struct dwb_caps *caps)
+{
+	if (caps) {
+		caps->adapter_id = 0;	/* we only support 1 adapter currently */
+		caps->hw_version = DCN_VERSION_3_0;
+		caps->num_pipes = 2;
+		memset(&caps->reserved, 0, sizeof(caps->reserved));
+		memset(&caps->reserved2, 0, sizeof(caps->reserved2));
+		caps->sw_version = dwb_ver_2_0;
+		caps->caps.support_dwb = true;
+		caps->caps.support_ogam = true;
+		caps->caps.support_wbscl = true;
+		caps->caps.support_ocsc = false;
+		caps->caps.support_stereo = true;
+		return true;
+	} else {
+		return false;
+	}
+}
+
+void dwb3_config_fc(struct dwbc *dwbc, struct dc_dwb_params *params)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+
+	/* Set DWB source size */
+	REG_UPDATE_2(FC_SOURCE_SIZE, FC_SOURCE_WIDTH, params->cnv_params.src_width,
+			FC_SOURCE_HEIGHT, params->cnv_params.src_height);
+
+	/* source size is not equal the source size, then enable cropping. */
+	if (params->cnv_params.crop_en) {
+		REG_UPDATE(FC_MODE_CTRL,    FC_WINDOW_CROP_EN, 1);
+		REG_UPDATE(FC_WINDOW_START, FC_WINDOW_START_X, params->cnv_params.crop_x);
+		REG_UPDATE(FC_WINDOW_START, FC_WINDOW_START_Y, params->cnv_params.crop_y);
+		REG_UPDATE(FC_WINDOW_SIZE,  FC_WINDOW_WIDTH,   params->cnv_params.crop_width);
+		REG_UPDATE(FC_WINDOW_SIZE,  FC_WINDOW_HEIGHT,  params->cnv_params.crop_height);
+	} else {
+		REG_UPDATE(FC_MODE_CTRL,    FC_WINDOW_CROP_EN, 0);
+	}
+
+	/* Set CAPTURE_RATE */
+	REG_UPDATE(FC_MODE_CTRL, FC_FRAME_CAPTURE_RATE, params->capture_rate);
+
+	dwb3_set_stereo(dwbc, &params->stereo_params);
+}
+
+bool dwb3_enable(struct dwbc *dwbc, struct dc_dwb_params *params)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+	DC_LOG_DWB("%s dwb3_enabled at inst = %d", __func__, dwbc->inst);
+
+	/* Set WB_ENABLE (not double buffered; capture not enabled) */
+	REG_UPDATE(DWB_ENABLE_CLK_CTRL, DWB_ENABLE, 1);
+
+	/* Set FC parameters */
+	dwb3_config_fc(dwbc, params);
+
+	/* Program color processing unit */
+	dwb3_program_hdr_mult(dwbc, params);
+	dwb3_set_gamut_remap(dwbc, params);
+	dwb3_ogam_set_input_transfer_func(dwbc, params->out_transfer_func);
+
+	/* Program output denorm */
+	dwb3_set_denorm(dwbc, params);
+
+	/* Enable DWB capture enable (double buffered) */
+	REG_UPDATE(FC_MODE_CTRL, FC_FRAME_CAPTURE_EN, DWB_FRAME_CAPTURE_ENABLE);
+
+	/* First pixel count */
+	REG_UPDATE(FC_FLOW_CTRL, FC_FIRST_PIXEL_DELAY_COUNT, 96);
+
+	return true;
+}
+
+bool dwb3_disable(struct dwbc *dwbc)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+
+	/* disable FC */
+	REG_UPDATE(FC_MODE_CTRL, FC_FRAME_CAPTURE_EN, DWB_FRAME_CAPTURE_DISABLE);
+
+	/* disable WB */
+	REG_UPDATE(DWB_ENABLE_CLK_CTRL, DWB_ENABLE, 0);
+
+	DC_LOG_DWB("%s dwb3_disabled at inst = %d", __func__, dwbc->inst);
+	return true;
+}
+
+bool dwb3_update(struct dwbc *dwbc, struct dc_dwb_params *params)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+	unsigned int pre_locked;
+
+	/*
+	 * Check if the caller has already locked DWB registers.
+	 * If so: assume the caller will unlock, so don't touch the lock.
+	 * If not: lock them for this update, then unlock after the
+	 * update is complete.
+	 */
+	REG_GET(DWB_UPDATE_CTRL, DWB_UPDATE_LOCK, &pre_locked);
+	DC_LOG_DWB("%s dwb update, inst = %d", __func__, dwbc->inst);
+
+	if (pre_locked == 0) {
+		/* Lock DWB registers */
+		REG_UPDATE(DWB_UPDATE_CTRL, DWB_UPDATE_LOCK, 1);
+	}
+
+	/* Set FC parameters */
+	dwb3_config_fc(dwbc, params);
+
+	/* Program color processing unit */
+	dwb3_program_hdr_mult(dwbc, params);
+	dwb3_set_gamut_remap(dwbc, params);
+	dwb3_ogam_set_input_transfer_func(dwbc, params->out_transfer_func);
+
+	/* Program output denorm */
+	dwb3_set_denorm(dwbc, params);
+
+	if (pre_locked == 0) {
+		/* Unlock DWB registers */
+		REG_UPDATE(DWB_UPDATE_CTRL, DWB_UPDATE_LOCK, 0);
+	}
+
+	return true;
+}
+
+bool dwb3_is_enabled(struct dwbc *dwbc)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+	unsigned int dwb_enabled = 0;
+	unsigned int fc_frame_capture_en = 0;
+
+	REG_GET(DWB_ENABLE_CLK_CTRL, DWB_ENABLE, &dwb_enabled);
+	REG_GET(FC_MODE_CTRL, FC_FRAME_CAPTURE_EN, &fc_frame_capture_en);
+
+	return ((dwb_enabled != 0) && (fc_frame_capture_en != 0));
+}
+
+void dwb3_set_stereo(struct dwbc *dwbc,
+		struct dwb_stereo_params *stereo_params)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+
+	if (stereo_params->stereo_enabled) {
+		REG_UPDATE(FC_MODE_CTRL, FC_EYE_SELECTION,       stereo_params->stereo_eye_select);
+		REG_UPDATE(FC_MODE_CTRL, FC_STEREO_EYE_POLARITY, stereo_params->stereo_polarity);
+		DC_LOG_DWB("%s dwb stereo enabled", __func__);
+	} else {
+		REG_UPDATE(FC_MODE_CTRL, FC_EYE_SELECTION, 0);
+		DC_LOG_DWB("%s dwb stereo disabled", __func__);
+	}
+}
+
+void dwb3_set_new_content(struct dwbc *dwbc,
+						bool is_new_content)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+
+	REG_UPDATE(FC_MODE_CTRL, FC_NEW_CONTENT, is_new_content);
+}
+
+void dwb3_set_denorm(struct dwbc *dwbc, struct dc_dwb_params *params)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+
+	/* Set output format*/
+	REG_UPDATE(DWB_OUT_CTRL, OUT_FORMAT, params->cnv_params.fc_out_format);
+
+	/* Set output denorm */
+	if (params->cnv_params.fc_out_format == DWB_OUT_FORMAT_32BPP_ARGB ||
+			params->cnv_params.fc_out_format == DWB_OUT_FORMAT_32BPP_RGBA) {
+		REG_UPDATE(DWB_OUT_CTRL, OUT_DENORM, params->cnv_params.out_denorm_mode);
+		REG_UPDATE(DWB_OUT_CTRL, OUT_MAX,    params->cnv_params.out_max_pix_val);
+		REG_UPDATE(DWB_OUT_CTRL, OUT_MIN,    params->cnv_params.out_min_pix_val);
+	}
+}
+
+
+const struct dwbc_funcs dcn30_dwbc_funcs = {
+	.get_caps		= dwb3_get_caps,
+	.enable			= dwb3_enable,
+	.disable		= dwb3_disable,
+	.update			= dwb3_update,
+	.is_enabled		= dwb3_is_enabled,
+	.set_stereo		= dwb3_set_stereo,
+	.set_new_content	= dwb3_set_new_content,
+	.dwb_program_output_csc	= NULL,
+	.dwb_ogam_set_input_transfer_func	= dwb3_ogam_set_input_transfer_func, //TODO: rename
+	.dwb_set_scaler		= NULL,
+};
+
+void dcn30_dwbc_construct(struct dcn30_dwbc *dwbc30,
+		struct dc_context *ctx,
+		const struct dcn30_dwbc_registers *dwbc_regs,
+		const struct dcn30_dwbc_shift *dwbc_shift,
+		const struct dcn30_dwbc_mask *dwbc_mask,
+		int inst)
+{
+	dwbc30->base.ctx = ctx;
+
+	dwbc30->base.inst = inst;
+	dwbc30->base.funcs = &dcn30_dwbc_funcs;
+
+	dwbc30->dwbc_regs = dwbc_regs;
+	dwbc30->dwbc_shift = dwbc_shift;
+	dwbc30->dwbc_mask = dwbc_mask;
+}
+
+void dwb3_set_host_read_rate_control(struct dwbc *dwbc, bool host_read_delay)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+
+	/*
+	 * Set maximum delay of host read access to DWBSCL LUT or OGAM LUT if there are no
+	 * idle cycles in HW pipeline (in number of clock cycles times 4)
+	 */
+	REG_UPDATE(DWB_HOST_READ_CONTROL, DWB_HOST_READ_RATE_CONTROL, host_read_delay);
+
+	DC_LOG_DWB("%s dwb3_rate_control at inst = %d", __func__, dwbc->inst);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h
new file mode 100644
index 000000000000..1010930cf071
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h
@@ -0,0 +1,923 @@
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
+#ifndef __DC_DWBC_DCN30_H__
+#define __DC_DWBC_DCN30_H__
+
+#define TO_DCN30_DWBC(dwbc_base) \
+	container_of(dwbc_base, struct dcn30_dwbc, base)
+
+/* DCN */
+#define BASE_INNER(seg) \
+	DCE_BASE__INST0_SEG ## seg
+
+#define BASE(seg) \
+	BASE_INNER(seg)
+
+#define SF_DWB(reg_name, block, id, field_name, post_fix)\
+	.field_name = block ## id ## _ ## reg_name ## __ ## field_name ## post_fix
+
+ /* set field name */
+#define SF_DWB2(reg_name, block, id, field_name, post_fix)\
+	.field_name = reg_name ## __ ## field_name ## post_fix
+
+
+#define DWBC_COMMON_REG_LIST_DCN30(inst) \
+	SR(DWB_ENABLE_CLK_CTRL),\
+	SR(DWB_MEM_PWR_CTRL),\
+	SR(FC_MODE_CTRL),\
+	SR(FC_FLOW_CTRL),\
+	SR(FC_WINDOW_START),\
+	SR(FC_WINDOW_SIZE),\
+	SR(FC_SOURCE_SIZE),\
+	SR(DWB_UPDATE_CTRL),\
+	SR(DWB_CRC_CTRL),\
+	SR(DWB_CRC_MASK_R_G),\
+	SR(DWB_CRC_MASK_B_A),\
+	SR(DWB_CRC_VAL_R_G),\
+	SR(DWB_CRC_VAL_B_A),\
+	SR(DWB_OUT_CTRL),\
+	SR(DWB_MMHUBBUB_BACKPRESSURE_CNT_EN),\
+	SR(DWB_MMHUBBUB_BACKPRESSURE_CNT),\
+	SR(DWB_HOST_READ_CONTROL),\
+	SR(DWB_SOFT_RESET),\
+	SR(DWB_HDR_MULT_COEF),\
+	SR(DWB_GAMUT_REMAP_MODE),\
+	SR(DWB_GAMUT_REMAP_COEF_FORMAT),\
+	SR(DWB_GAMUT_REMAPA_C11_C12),\
+	SR(DWB_GAMUT_REMAPA_C13_C14),\
+	SR(DWB_GAMUT_REMAPA_C21_C22),\
+	SR(DWB_GAMUT_REMAPA_C23_C24),\
+	SR(DWB_GAMUT_REMAPA_C31_C32),\
+	SR(DWB_GAMUT_REMAPA_C33_C34),\
+	SR(DWB_GAMUT_REMAPB_C11_C12),\
+	SR(DWB_GAMUT_REMAPB_C13_C14),\
+	SR(DWB_GAMUT_REMAPB_C21_C22),\
+	SR(DWB_GAMUT_REMAPB_C23_C24),\
+	SR(DWB_GAMUT_REMAPB_C31_C32),\
+	SR(DWB_GAMUT_REMAPB_C33_C34),\
+	SR(DWB_OGAM_CONTROL),\
+	SR(DWB_OGAM_LUT_INDEX),\
+	SR(DWB_OGAM_LUT_DATA),\
+	SR(DWB_OGAM_LUT_CONTROL),\
+	SR(DWB_OGAM_RAMA_START_CNTL_B),\
+	SR(DWB_OGAM_RAMA_START_CNTL_G),\
+	SR(DWB_OGAM_RAMA_START_CNTL_R),\
+	SR(DWB_OGAM_RAMA_START_BASE_CNTL_B),\
+	SR(DWB_OGAM_RAMA_START_SLOPE_CNTL_B),\
+	SR(DWB_OGAM_RAMA_START_BASE_CNTL_G),\
+	SR(DWB_OGAM_RAMA_START_SLOPE_CNTL_G),\
+	SR(DWB_OGAM_RAMA_START_BASE_CNTL_R),\
+	SR(DWB_OGAM_RAMA_START_SLOPE_CNTL_R),\
+	SR(DWB_OGAM_RAMA_END_CNTL1_B),\
+	SR(DWB_OGAM_RAMA_END_CNTL2_B),\
+	SR(DWB_OGAM_RAMA_END_CNTL1_G),\
+	SR(DWB_OGAM_RAMA_END_CNTL2_G),\
+	SR(DWB_OGAM_RAMA_END_CNTL1_R),\
+	SR(DWB_OGAM_RAMA_END_CNTL2_R),\
+	SR(DWB_OGAM_RAMA_OFFSET_B),\
+	SR(DWB_OGAM_RAMA_OFFSET_G),\
+	SR(DWB_OGAM_RAMA_OFFSET_R),\
+	SR(DWB_OGAM_RAMA_REGION_0_1),\
+	SR(DWB_OGAM_RAMA_REGION_2_3),\
+	SR(DWB_OGAM_RAMA_REGION_4_5),\
+	SR(DWB_OGAM_RAMA_REGION_6_7),\
+	SR(DWB_OGAM_RAMA_REGION_8_9),\
+	SR(DWB_OGAM_RAMA_REGION_10_11),\
+	SR(DWB_OGAM_RAMA_REGION_12_13),\
+	SR(DWB_OGAM_RAMA_REGION_14_15),\
+	SR(DWB_OGAM_RAMA_REGION_16_17),\
+	SR(DWB_OGAM_RAMA_REGION_18_19),\
+	SR(DWB_OGAM_RAMA_REGION_20_21),\
+	SR(DWB_OGAM_RAMA_REGION_22_23),\
+	SR(DWB_OGAM_RAMA_REGION_24_25),\
+	SR(DWB_OGAM_RAMA_REGION_26_27),\
+	SR(DWB_OGAM_RAMA_REGION_28_29),\
+	SR(DWB_OGAM_RAMA_REGION_30_31),\
+	SR(DWB_OGAM_RAMA_REGION_32_33),\
+	SR(DWB_OGAM_RAMB_START_CNTL_B),\
+	SR(DWB_OGAM_RAMB_START_CNTL_G),\
+	SR(DWB_OGAM_RAMB_START_CNTL_R),\
+	SR(DWB_OGAM_RAMB_START_BASE_CNTL_B),\
+	SR(DWB_OGAM_RAMB_START_SLOPE_CNTL_B),\
+	SR(DWB_OGAM_RAMB_START_BASE_CNTL_G),\
+	SR(DWB_OGAM_RAMB_START_SLOPE_CNTL_G),\
+	SR(DWB_OGAM_RAMB_START_BASE_CNTL_R),\
+	SR(DWB_OGAM_RAMB_START_SLOPE_CNTL_R),\
+	SR(DWB_OGAM_RAMB_END_CNTL1_B),\
+	SR(DWB_OGAM_RAMB_END_CNTL2_B),\
+	SR(DWB_OGAM_RAMB_END_CNTL1_G),\
+	SR(DWB_OGAM_RAMB_END_CNTL2_G),\
+	SR(DWB_OGAM_RAMB_END_CNTL1_R),\
+	SR(DWB_OGAM_RAMB_END_CNTL2_R),\
+	SR(DWB_OGAM_RAMB_OFFSET_B),\
+	SR(DWB_OGAM_RAMB_OFFSET_G),\
+	SR(DWB_OGAM_RAMB_OFFSET_R),\
+	SR(DWB_OGAM_RAMB_REGION_0_1),\
+	SR(DWB_OGAM_RAMB_REGION_2_3),\
+	SR(DWB_OGAM_RAMB_REGION_4_5),\
+	SR(DWB_OGAM_RAMB_REGION_6_7),\
+	SR(DWB_OGAM_RAMB_REGION_8_9),\
+	SR(DWB_OGAM_RAMB_REGION_10_11),\
+	SR(DWB_OGAM_RAMB_REGION_12_13),\
+	SR(DWB_OGAM_RAMB_REGION_14_15),\
+	SR(DWB_OGAM_RAMB_REGION_16_17),\
+	SR(DWB_OGAM_RAMB_REGION_18_19),\
+	SR(DWB_OGAM_RAMB_REGION_20_21),\
+	SR(DWB_OGAM_RAMB_REGION_22_23),\
+	SR(DWB_OGAM_RAMB_REGION_24_25),\
+	SR(DWB_OGAM_RAMB_REGION_26_27),\
+	SR(DWB_OGAM_RAMB_REGION_28_29),\
+	SR(DWB_OGAM_RAMB_REGION_30_31),\
+	SR(DWB_OGAM_RAMB_REGION_32_33)
+
+
+#define DWBC_COMMON_MASK_SH_LIST_DCN30(mask_sh) \
+	SF_DWB2(DWB_ENABLE_CLK_CTRL, DWB_TOP, 0, DWB_ENABLE, mask_sh),\
+	SF_DWB2(DWB_ENABLE_CLK_CTRL, DWB_TOP, 0, DISPCLK_R_DWB_GATE_DIS, mask_sh),\
+	SF_DWB2(DWB_ENABLE_CLK_CTRL, DWB_TOP, 0, DISPCLK_G_DWB_GATE_DIS, mask_sh),\
+	SF_DWB2(DWB_ENABLE_CLK_CTRL, DWB_TOP, 0, DWB_TEST_CLK_SEL, mask_sh),\
+	SF_DWB2(DWB_MEM_PWR_CTRL, DWB_TOP, 0, DWB_OGAM_LUT_MEM_PWR_FORCE, mask_sh),\
+	SF_DWB2(DWB_MEM_PWR_CTRL, DWB_TOP, 0, DWB_OGAM_LUT_MEM_PWR_DIS, mask_sh),\
+	SF_DWB2(DWB_MEM_PWR_CTRL, DWB_TOP, 0, DWB_OGAM_LUT_MEM_PWR_STATE, mask_sh),\
+	SF_DWB2(FC_MODE_CTRL, DWB_TOP, 0, FC_FRAME_CAPTURE_EN, mask_sh),\
+	SF_DWB2(FC_MODE_CTRL, DWB_TOP, 0, FC_FRAME_CAPTURE_RATE, mask_sh),\
+	SF_DWB2(FC_MODE_CTRL, DWB_TOP, 0, FC_WINDOW_CROP_EN, mask_sh),\
+	SF_DWB2(FC_MODE_CTRL, DWB_TOP, 0, FC_EYE_SELECTION, mask_sh),\
+	SF_DWB2(FC_MODE_CTRL, DWB_TOP, 0, FC_STEREO_EYE_POLARITY, mask_sh),\
+	SF_DWB2(FC_MODE_CTRL, DWB_TOP, 0, FC_NEW_CONTENT, mask_sh),\
+	SF_DWB2(FC_MODE_CTRL, DWB_TOP, 0, FC_FRAME_CAPTURE_EN_CURRENT, mask_sh),\
+	SF_DWB2(FC_FLOW_CTRL, DWB_TOP, 0, FC_FIRST_PIXEL_DELAY_COUNT, mask_sh),\
+	SF_DWB2(FC_WINDOW_START, DWB_TOP, 0, FC_WINDOW_START_X, mask_sh),\
+	SF_DWB2(FC_WINDOW_START, DWB_TOP, 0, FC_WINDOW_START_Y, mask_sh),\
+	SF_DWB2(FC_WINDOW_SIZE, DWB_TOP, 0, FC_WINDOW_WIDTH, mask_sh),\
+	SF_DWB2(FC_WINDOW_SIZE, DWB_TOP, 0, FC_WINDOW_HEIGHT, mask_sh),\
+	SF_DWB2(FC_SOURCE_SIZE, DWB_TOP, 0, FC_SOURCE_WIDTH, mask_sh),\
+	SF_DWB2(FC_SOURCE_SIZE, DWB_TOP, 0, FC_SOURCE_HEIGHT, mask_sh),\
+	SF_DWB2(DWB_UPDATE_CTRL, DWB_TOP, 0, DWB_UPDATE_LOCK, mask_sh),\
+	SF_DWB2(DWB_UPDATE_CTRL, DWB_TOP, 0, DWB_UPDATE_PENDING, mask_sh),\
+	SF_DWB2(DWB_CRC_CTRL, DWB_TOP, 0, DWB_CRC_EN, mask_sh),\
+	SF_DWB2(DWB_CRC_CTRL, DWB_TOP, 0, DWB_CRC_CONT_EN, mask_sh),\
+	SF_DWB2(DWB_CRC_CTRL, DWB_TOP, 0, DWB_CRC_SRC_SEL, mask_sh),\
+	SF_DWB2(DWB_CRC_MASK_R_G, DWB_TOP, 0, DWB_CRC_RED_MASK, mask_sh),\
+	SF_DWB2(DWB_CRC_MASK_R_G, DWB_TOP, 0, DWB_CRC_GREEN_MASK, mask_sh),\
+	SF_DWB2(DWB_CRC_MASK_B_A, DWB_TOP, 0, DWB_CRC_BLUE_MASK, mask_sh),\
+	SF_DWB2(DWB_CRC_MASK_B_A, DWB_TOP, 0, DWB_CRC_A_MASK, mask_sh),\
+	SF_DWB2(DWB_CRC_VAL_R_G, DWB_TOP, 0, DWB_CRC_SIG_RED, mask_sh),\
+	SF_DWB2(DWB_CRC_VAL_R_G, DWB_TOP, 0, DWB_CRC_SIG_GREEN, mask_sh),\
+	SF_DWB2(DWB_CRC_VAL_B_A, DWB_TOP, 0, DWB_CRC_SIG_BLUE, mask_sh),\
+	SF_DWB2(DWB_CRC_VAL_B_A, DWB_TOP, 0, DWB_CRC_SIG_A, mask_sh),\
+	SF_DWB2(DWB_OUT_CTRL, DWB_TOP, 0, OUT_FORMAT, mask_sh),\
+	SF_DWB2(DWB_OUT_CTRL, DWB_TOP, 0, OUT_DENORM, mask_sh),\
+	SF_DWB2(DWB_OUT_CTRL, DWB_TOP, 0, OUT_MAX, mask_sh),\
+	SF_DWB2(DWB_OUT_CTRL, DWB_TOP, 0, OUT_MIN, mask_sh),\
+	SF_DWB2(DWB_MMHUBBUB_BACKPRESSURE_CNT_EN, DWB_TOP, 0, DWB_MMHUBBUB_BACKPRESSURE_CNT_EN, mask_sh),\
+	SF_DWB2(DWB_MMHUBBUB_BACKPRESSURE_CNT, DWB_TOP, 0, DWB_MMHUBBUB_MAX_BACKPRESSURE, mask_sh),\
+	SF_DWB2(DWB_HOST_READ_CONTROL, DWB_TOP, 0, DWB_HOST_READ_RATE_CONTROL, mask_sh),\
+	SF_DWB2(DWB_SOFT_RESET, DWB_TOP, 0, DWB_SOFT_RESET, mask_sh),\
+	SF_DWB2(DWB_HDR_MULT_COEF, DWBCP, 0, DWB_HDR_MULT_COEF, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAP_MODE, DWBCP, 0, DWB_GAMUT_REMAP_MODE, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAP_MODE, DWBCP, 0, DWB_GAMUT_REMAP_MODE_CURRENT, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAP_COEF_FORMAT, DWBCP, 0, DWB_GAMUT_REMAP_COEF_FORMAT, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C11_C12, DWBCP, 0, DWB_GAMUT_REMAPA_C11, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C11_C12, DWBCP, 0, DWB_GAMUT_REMAPA_C12, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C13_C14, DWBCP, 0, DWB_GAMUT_REMAPA_C13, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C13_C14, DWBCP, 0, DWB_GAMUT_REMAPA_C14, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C21_C22, DWBCP, 0, DWB_GAMUT_REMAPA_C21, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C21_C22, DWBCP, 0, DWB_GAMUT_REMAPA_C22, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C23_C24, DWBCP, 0, DWB_GAMUT_REMAPA_C23, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C23_C24, DWBCP, 0, DWB_GAMUT_REMAPA_C24, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C31_C32, DWBCP, 0, DWB_GAMUT_REMAPA_C31, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C31_C32, DWBCP, 0, DWB_GAMUT_REMAPA_C32, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C33_C34, DWBCP, 0, DWB_GAMUT_REMAPA_C33, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPA_C33_C34, DWBCP, 0, DWB_GAMUT_REMAPA_C34, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C11_C12, DWBCP, 0, DWB_GAMUT_REMAPB_C11, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C11_C12, DWBCP, 0, DWB_GAMUT_REMAPB_C12, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C13_C14, DWBCP, 0, DWB_GAMUT_REMAPB_C13, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C13_C14, DWBCP, 0, DWB_GAMUT_REMAPB_C14, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C21_C22, DWBCP, 0, DWB_GAMUT_REMAPB_C21, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C21_C22, DWBCP, 0, DWB_GAMUT_REMAPB_C22, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C23_C24, DWBCP, 0, DWB_GAMUT_REMAPB_C23, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C23_C24, DWBCP, 0, DWB_GAMUT_REMAPB_C24, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C31_C32, DWBCP, 0, DWB_GAMUT_REMAPB_C31, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C31_C32, DWBCP, 0, DWB_GAMUT_REMAPB_C32, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C33_C34, DWBCP, 0, DWB_GAMUT_REMAPB_C33, mask_sh),\
+	SF_DWB2(DWB_GAMUT_REMAPB_C33_C34, DWBCP, 0, DWB_GAMUT_REMAPB_C34, mask_sh),\
+	SF_DWB2(DWB_OGAM_CONTROL, DWBCP, 0, DWB_OGAM_MODE, mask_sh),\
+	SF_DWB2(DWB_OGAM_CONTROL, DWBCP, 0, DWB_OGAM_SELECT, mask_sh),\
+	SF_DWB2(DWB_OGAM_CONTROL, DWBCP, 0, DWB_OGAM_PWL_DISABLE, mask_sh),\
+	SF_DWB2(DWB_OGAM_CONTROL, DWBCP, 0, DWB_OGAM_MODE_CURRENT, mask_sh),\
+	SF_DWB2(DWB_OGAM_CONTROL, DWBCP, 0, DWB_OGAM_SELECT_CURRENT, mask_sh),\
+	SF_DWB2(DWB_OGAM_LUT_INDEX, DWBCP, 0, DWB_OGAM_LUT_INDEX, mask_sh),\
+	SF_DWB2(DWB_OGAM_LUT_DATA, DWBCP, 0, DWB_OGAM_LUT_DATA, mask_sh),\
+	SF_DWB2(DWB_OGAM_LUT_CONTROL, DWBCP, 0, DWB_OGAM_LUT_WRITE_COLOR_MASK, mask_sh),\
+	SF_DWB2(DWB_OGAM_LUT_CONTROL, DWBCP, 0, DWB_OGAM_LUT_READ_COLOR_SEL, mask_sh),\
+	SF_DWB2(DWB_OGAM_LUT_CONTROL, DWBCP, 0, DWB_OGAM_LUT_READ_DBG, mask_sh),\
+	SF_DWB2(DWB_OGAM_LUT_CONTROL, DWBCP, 0, DWB_OGAM_LUT_HOST_SEL, mask_sh),\
+	SF_DWB2(DWB_OGAM_LUT_CONTROL, DWBCP, 0, DWB_OGAM_LUT_CONFIG_MODE, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_CNTL_B, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_CNTL_B, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_SEGMENT_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_CNTL_G, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_CNTL_G, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_SEGMENT_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_CNTL_R, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_CNTL_R, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_SEGMENT_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_BASE_CNTL_B, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_BASE_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_SLOPE_CNTL_B, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_SLOPE_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_BASE_CNTL_G, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_BASE_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_SLOPE_CNTL_G, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_SLOPE_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_BASE_CNTL_R, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_BASE_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_START_SLOPE_CNTL_R, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_START_SLOPE_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_END_CNTL1_B, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_END_BASE_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_END_CNTL2_B, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_END_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_END_CNTL2_B, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_END_SLOPE_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_END_CNTL1_G, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_END_BASE_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_END_CNTL2_G, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_END_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_END_CNTL2_G, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_END_SLOPE_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_END_CNTL1_R, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_END_BASE_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_END_CNTL2_R, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_END_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_END_CNTL2_R, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION_END_SLOPE_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_OFFSET_B, DWBCP, 0, DWB_OGAM_RAMA_OFFSET_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_OFFSET_G, DWBCP, 0, DWB_OGAM_RAMA_OFFSET_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_OFFSET_R, DWBCP, 0, DWB_OGAM_RAMA_OFFSET_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_0_1, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION0_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_0_1, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION0_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_0_1, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION1_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_0_1, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION1_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_2_3, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION2_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_2_3, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION2_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_2_3, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION3_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_2_3, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION3_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_4_5, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION4_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_4_5, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION4_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_4_5, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION5_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_4_5, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION5_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_6_7, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION6_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_6_7, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION6_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_6_7, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION7_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_6_7, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION7_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_8_9, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION8_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_8_9, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION8_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_8_9, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION9_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_8_9, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION9_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_10_11, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION10_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_10_11, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION10_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_10_11, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION11_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_10_11, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION11_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_12_13, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION12_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_12_13, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION12_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_12_13, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION13_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_12_13, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION13_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_14_15, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION14_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_14_15, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION14_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_14_15, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION15_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_14_15, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION15_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_16_17, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION16_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_16_17, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION16_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_16_17, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION17_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_16_17, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION17_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_18_19, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION18_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_18_19, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION18_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_18_19, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION19_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_18_19, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION19_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_20_21, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION20_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_20_21, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION20_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_20_21, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION21_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_20_21, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION21_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_22_23, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION22_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_22_23, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION22_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_22_23, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION23_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_22_23, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION23_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_24_25, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION24_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_24_25, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION24_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_24_25, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION25_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_24_25, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION25_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_26_27, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION26_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_26_27, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION26_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_26_27, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION27_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_26_27, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION27_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_28_29, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION28_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_28_29, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION28_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_28_29, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION29_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_28_29, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION29_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_30_31, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION30_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_30_31, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION30_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_30_31, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION31_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_30_31, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION31_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_32_33, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION32_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_32_33, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION32_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_32_33, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION33_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMA_REGION_32_33, DWBCP, 0, DWB_OGAM_RAMA_EXP_REGION33_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_CNTL_B, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_CNTL_B, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_SEGMENT_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_CNTL_G, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_CNTL_G, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_SEGMENT_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_CNTL_R, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_CNTL_R, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_SEGMENT_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_BASE_CNTL_B, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_BASE_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_SLOPE_CNTL_B, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_SLOPE_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_BASE_CNTL_G, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_BASE_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_SLOPE_CNTL_G, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_SLOPE_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_BASE_CNTL_R, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_BASE_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_START_SLOPE_CNTL_R, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_START_SLOPE_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_END_CNTL1_B, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_END_BASE_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_END_CNTL2_B, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_END_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_END_CNTL2_B, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_END_SLOPE_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_END_CNTL1_G, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_END_BASE_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_END_CNTL2_G, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_END_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_END_CNTL2_G, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_END_SLOPE_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_END_CNTL1_R, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_END_BASE_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_END_CNTL2_R, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_END_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_END_CNTL2_R, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION_END_SLOPE_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_OFFSET_B, DWBCP, 0, DWB_OGAM_RAMB_OFFSET_B, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_OFFSET_G, DWBCP, 0, DWB_OGAM_RAMB_OFFSET_G, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_OFFSET_R, DWBCP, 0, DWB_OGAM_RAMB_OFFSET_R, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_0_1, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION0_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_0_1, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION0_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_0_1, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION1_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_0_1, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION1_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_2_3, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION2_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_2_3, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION2_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_2_3, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION3_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_2_3, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION3_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_4_5, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION4_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_4_5, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION4_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_4_5, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION5_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_4_5, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION5_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_6_7, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION6_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_6_7, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION6_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_6_7, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION7_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_6_7, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION7_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_8_9, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION8_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_8_9, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION8_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_8_9, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION9_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_8_9, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION9_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_10_11, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION10_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_10_11, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION10_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_10_11, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION11_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_10_11, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION11_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_12_13, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION12_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_12_13, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION12_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_12_13, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION13_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_12_13, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION13_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_14_15, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION14_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_14_15, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION14_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_14_15, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION15_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_14_15, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION15_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_16_17, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION16_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_16_17, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION16_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_16_17, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION17_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_16_17, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION17_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_18_19, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION18_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_18_19, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION18_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_18_19, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION19_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_18_19, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION19_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_20_21, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION20_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_20_21, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION20_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_20_21, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION21_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_20_21, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION21_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_22_23, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION22_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_22_23, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION22_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_22_23, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION23_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_22_23, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION23_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_24_25, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION24_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_24_25, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION24_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_24_25, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION25_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_24_25, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION25_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_26_27, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION26_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_26_27, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION26_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_26_27, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION27_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_26_27, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION27_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_28_29, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION28_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_28_29, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION28_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_28_29, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION29_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_28_29, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION29_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_30_31, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION30_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_30_31, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION30_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_30_31, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION31_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_30_31, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION31_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_32_33, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION32_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_32_33, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION32_NUM_SEGMENTS, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_32_33, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION33_LUT_OFFSET, mask_sh),\
+	SF_DWB2(DWB_OGAM_RAMB_REGION_32_33, DWBCP, 0, DWB_OGAM_RAMB_EXP_REGION33_NUM_SEGMENTS, mask_sh)
+
+
+#define DWBC_REG_FIELD_LIST_DCN3_0(type) \
+	type DWB_ENABLE;\
+	type DISPCLK_R_DWB_GATE_DIS;\
+	type DISPCLK_G_DWB_GATE_DIS;\
+	type DWB_TEST_CLK_SEL;\
+	type DWBSCL_LUT_MEM_PWR_FORCE;\
+	type DWBSCL_LUT_MEM_PWR_DIS;\
+	type DWBSCL_LUT_MEM_PWR_STATE;\
+	type DWBSCL_LB_MEM_PWR_FORCE;\
+	type DWBSCL_LB_MEM_PWR_DIS;\
+	type DWBSCL_LB_MEM_PWR_STATE;\
+	type DWB_OGAM_LUT_MEM_PWR_FORCE;\
+	type DWB_OGAM_LUT_MEM_PWR_DIS;\
+	type DWB_OGAM_LUT_MEM_PWR_STATE;\
+	type FC_FRAME_CAPTURE_EN;\
+	type FC_FRAME_CAPTURE_RATE;\
+	type FC_WINDOW_CROP_EN;\
+	type FC_EYE_SELECTION;\
+	type FC_STEREO_EYE_POLARITY;\
+	type FC_NEW_CONTENT;\
+	type FC_FI_EN;\
+	type FC_FI_PHASE;\
+	type FC_FRAME_CAPTURE_EN_CURRENT;\
+	type FC_FIRST_PIXEL_DELAY_COUNT;\
+	type FC_WINDOW_START_X;\
+	type FC_WINDOW_START_Y;\
+	type FC_WINDOW_WIDTH;\
+	type FC_WINDOW_HEIGHT;\
+	type FC_SOURCE_WIDTH;\
+	type FC_SOURCE_HEIGHT;\
+	type DWB_UPDATE_LOCK;\
+	type DWB_UPDATE_PENDING;\
+	type DWB_CRC_EN;\
+	type DWB_CRC_CONT_EN;\
+	type DWB_CRC_SRC_SEL;\
+	type DWB_CRC_RED_MASK;\
+	type DWB_CRC_GREEN_MASK;\
+	type DWB_CRC_BLUE_MASK;\
+	type DWB_CRC_A_MASK;\
+	type DWB_CRC_SIG_RED;\
+	type DWB_CRC_SIG_GREEN;\
+	type DWB_CRC_SIG_BLUE;\
+	type DWB_CRC_SIG_A;\
+	type OUT_FORMAT;\
+	type OUT_DENORM;\
+	type OUT_MAX;\
+	type OUT_MIN;\
+	type DWB_MMHUBBUB_BACKPRESSURE_CNT_EN;\
+	type DWB_MMHUBBUB_MAX_BACKPRESSURE;\
+	type DWB_HOST_READ_RATE_CONTROL;\
+	type DWBSCL_DATA_OVERFLOW_FLAG;\
+	type DWBSCL_DATA_OVERFLOW_ACK;\
+	type DWBSCL_DATA_OVERFLOW_MASK;\
+	type DWBSCL_DATA_OVERFLOW_INT_STATUS;\
+	type DWBSCL_DATA_OVERFLOW_INT_TYPE;\
+	type DWBSCL_DATA_OVERFLOW_TYPE;\
+	type DWBSCL_DATA_OVERFLOW_OUT_X_CNT;\
+	type DWBSCL_DATA_OVERFLOW_OUT_Y_CNT;\
+	type DWB_SOFT_RESET;\
+	type DWBSCL_COEF_RAM_TAP_PAIR_IDX;\
+	type DWBSCL_COEF_RAM_PHASE;\
+	type DWBSCL_COEF_RAM_FILTER_TYPE;\
+	type DWBSCL_COEF_RAM_SELECT_RD;\
+	type DWBSCL_COEF_RAM_EVEN_TAP_COEF;\
+	type DWBSCL_COEF_RAM_EVEN_TAP_COEF_EN;\
+	type DWBSCL_COEF_RAM_ODD_TAP_COEF;\
+	type DWBSCL_COEF_RAM_ODD_TAP_COEF_EN;\
+	type DWBSCL_MODE;\
+	type DWBSCL_COEF_RAM_SELECT;\
+	type DWBSCL_COEF_RAM_SELECT_CURRENT;\
+	type DWBSCL_H_NUM_OF_TAPS;\
+	type DWBSCL_V_NUM_OF_TAPS;\
+	type DWBSCL_H_SCALE_RATIO;\
+	type DWBSCL_H_INIT_FRAC;\
+	type DWBSCL_H_INIT_INT;\
+	type DWBSCL_V_SCALE_RATIO;\
+	type DWBSCL_V_INIT_FRAC;\
+	type DWBSCL_V_INIT_INT;\
+	type DWBSCL_BOUNDARY_MODE;\
+	type DWBSCL_BLACK_COLOR_RGB;\
+	type DWBSCL_DEST_WIDTH;\
+	type DWBSCL_DEST_HEIGHT;\
+	type DWB_HDR_MULT_COEF;\
+	type DWB_GAMUT_REMAP_MODE;\
+	type DWB_GAMUT_REMAP_MODE_CURRENT;\
+	type DWB_GAMUT_REMAP_COEF_FORMAT;\
+	type DWB_GAMUT_REMAPA_C11;\
+	type DWB_GAMUT_REMAPA_C12;\
+	type DWB_GAMUT_REMAPA_C13;\
+	type DWB_GAMUT_REMAPA_C14;\
+	type DWB_GAMUT_REMAPA_C21;\
+	type DWB_GAMUT_REMAPA_C22;\
+	type DWB_GAMUT_REMAPA_C23;\
+	type DWB_GAMUT_REMAPA_C24;\
+	type DWB_GAMUT_REMAPA_C31;\
+	type DWB_GAMUT_REMAPA_C32;\
+	type DWB_GAMUT_REMAPA_C33;\
+	type DWB_GAMUT_REMAPA_C34;\
+	type DWB_GAMUT_REMAPB_C11;\
+	type DWB_GAMUT_REMAPB_C12;\
+	type DWB_GAMUT_REMAPB_C13;\
+	type DWB_GAMUT_REMAPB_C14;\
+	type DWB_GAMUT_REMAPB_C21;\
+	type DWB_GAMUT_REMAPB_C22;\
+	type DWB_GAMUT_REMAPB_C23;\
+	type DWB_GAMUT_REMAPB_C24;\
+	type DWB_GAMUT_REMAPB_C31;\
+	type DWB_GAMUT_REMAPB_C32;\
+	type DWB_GAMUT_REMAPB_C33;\
+	type DWB_GAMUT_REMAPB_C34;\
+	type DWB_OGAM_MODE;\
+	type DWB_OGAM_SELECT;\
+	type DWB_OGAM_PWL_DISABLE;\
+	type DWB_OGAM_MODE_CURRENT;\
+	type DWB_OGAM_SELECT_CURRENT;\
+	type DWB_OGAM_LUT_INDEX;\
+	type DWB_OGAM_LUT_DATA;\
+	type DWB_OGAM_LUT_WRITE_COLOR_MASK;\
+	type DWB_OGAM_LUT_READ_COLOR_SEL;\
+	type DWB_OGAM_LUT_READ_DBG;\
+	type DWB_OGAM_LUT_HOST_SEL;\
+	type DWB_OGAM_LUT_CONFIG_MODE;\
+	type DWB_OGAM_LUT_STATUS;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_B;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_SEGMENT_B;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_G;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_SEGMENT_G;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_R;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_SEGMENT_R;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_BASE_B;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_SLOPE_B;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_BASE_G;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_SLOPE_G;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_BASE_R;\
+	type DWB_OGAM_RAMA_EXP_REGION_START_SLOPE_R;\
+	type DWB_OGAM_RAMA_EXP_REGION_END_BASE_B;\
+	type DWB_OGAM_RAMA_EXP_REGION_END_B;\
+	type DWB_OGAM_RAMA_EXP_REGION_END_SLOPE_B;\
+	type DWB_OGAM_RAMA_EXP_REGION_END_BASE_G;\
+	type DWB_OGAM_RAMA_EXP_REGION_END_G;\
+	type DWB_OGAM_RAMA_EXP_REGION_END_SLOPE_G;\
+	type DWB_OGAM_RAMA_EXP_REGION_END_BASE_R;\
+	type DWB_OGAM_RAMA_EXP_REGION_END_R;\
+	type DWB_OGAM_RAMA_EXP_REGION_END_SLOPE_R;\
+	type DWB_OGAM_RAMA_OFFSET_B;\
+	type DWB_OGAM_RAMA_OFFSET_G;\
+	type DWB_OGAM_RAMA_OFFSET_R;\
+	type DWB_OGAM_RAMA_EXP_REGION0_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION0_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION1_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION1_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION2_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION2_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION3_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION3_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION4_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION4_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION5_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION5_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION6_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION6_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION7_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION7_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION8_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION8_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION9_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION9_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION10_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION10_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION11_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION11_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION12_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION12_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION13_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION13_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION14_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION14_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION15_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION15_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION16_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION16_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION17_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION17_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION18_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION18_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION19_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION19_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION20_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION20_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION21_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION21_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION22_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION22_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION23_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION23_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION24_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION24_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION25_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION25_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION26_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION26_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION27_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION27_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION28_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION28_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION29_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION29_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION30_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION30_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION31_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION31_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION32_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION32_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMA_EXP_REGION33_LUT_OFFSET;\
+	type DWB_OGAM_RAMA_EXP_REGION33_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_B;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_SEGMENT_B;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_G;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_SEGMENT_G;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_R;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_SEGMENT_R;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_BASE_B;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_SLOPE_B;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_BASE_G;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_SLOPE_G;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_BASE_R;\
+	type DWB_OGAM_RAMB_EXP_REGION_START_SLOPE_R;\
+	type DWB_OGAM_RAMB_EXP_REGION_END_BASE_B;\
+	type DWB_OGAM_RAMB_EXP_REGION_END_B;\
+	type DWB_OGAM_RAMB_EXP_REGION_END_SLOPE_B;\
+	type DWB_OGAM_RAMB_EXP_REGION_END_BASE_G;\
+	type DWB_OGAM_RAMB_EXP_REGION_END_G;\
+	type DWB_OGAM_RAMB_EXP_REGION_END_SLOPE_G;\
+	type DWB_OGAM_RAMB_EXP_REGION_END_BASE_R;\
+	type DWB_OGAM_RAMB_EXP_REGION_END_R;\
+	type DWB_OGAM_RAMB_EXP_REGION_END_SLOPE_R;\
+	type DWB_OGAM_RAMB_OFFSET_B;\
+	type DWB_OGAM_RAMB_OFFSET_G;\
+	type DWB_OGAM_RAMB_OFFSET_R;\
+	type DWB_OGAM_RAMB_EXP_REGION0_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION0_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION1_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION1_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION2_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION2_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION3_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION3_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION4_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION4_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION5_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION5_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION6_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION6_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION7_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION7_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION8_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION8_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION9_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION9_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION10_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION10_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION11_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION11_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION12_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION12_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION13_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION13_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION14_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION14_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION15_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION15_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION16_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION16_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION17_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION17_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION18_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION18_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION19_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION19_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION20_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION20_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION21_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION21_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION22_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION22_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION23_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION23_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION24_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION24_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION25_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION25_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION26_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION26_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION27_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION27_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION28_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION28_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION29_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION29_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION30_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION30_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION31_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION31_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION32_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION32_NUM_SEGMENTS;\
+	type DWB_OGAM_RAMB_EXP_REGION33_LUT_OFFSET;\
+	type DWB_OGAM_RAMB_EXP_REGION33_NUM_SEGMENTS;
+
+struct dcn30_dwbc_registers {
+	/* DCN3AG */
+	/* DWB_TOP */
+	uint32_t DWB_ENABLE_CLK_CTRL;
+	uint32_t DWB_MEM_PWR_CTRL;
+	uint32_t FC_MODE_CTRL;
+	uint32_t FC_FLOW_CTRL;
+	uint32_t FC_WINDOW_START;
+	uint32_t FC_WINDOW_SIZE;
+	uint32_t FC_SOURCE_SIZE;
+	uint32_t DWB_UPDATE_CTRL;
+	uint32_t DWB_CRC_CTRL;
+	uint32_t DWB_CRC_MASK_R_G;
+	uint32_t DWB_CRC_MASK_B_A;
+	uint32_t DWB_CRC_VAL_R_G;
+	uint32_t DWB_CRC_VAL_B_A;
+	uint32_t DWB_OUT_CTRL;
+	uint32_t DWB_MMHUBBUB_BACKPRESSURE_CNT_EN;
+	uint32_t DWB_MMHUBBUB_BACKPRESSURE_CNT;
+	uint32_t DWB_HOST_READ_CONTROL;
+	uint32_t DWB_SOFT_RESET;
+
+	/* DWBSCL */
+	uint32_t DWBSCL_COEF_RAM_TAP_SELECT;
+	uint32_t DWBSCL_COEF_RAM_TAP_DATA;
+	uint32_t DWBSCL_MODE;
+	uint32_t DWBSCL_TAP_CONTROL;
+	uint32_t DWBSCL_HORZ_FILTER_SCALE_RATIO;
+	uint32_t DWBSCL_HORZ_FILTER_INIT;
+	uint32_t DWBSCL_VERT_FILTER_SCALE_RATIO;
+	uint32_t DWBSCL_VERT_FILTER_INIT;
+	uint32_t DWBSCL_BOUNDARY_CTRL;
+	uint32_t DWBSCL_DEST_SIZE;
+	uint32_t DWBSCL_OVERFLOW_STATUS;
+	uint32_t DWBSCL_OVERFLOW_COUNTER;
+
+	/* DWBCP */
+	uint32_t DWB_HDR_MULT_COEF;
+	uint32_t DWB_GAMUT_REMAP_MODE;
+	uint32_t DWB_GAMUT_REMAP_COEF_FORMAT;
+	uint32_t DWB_GAMUT_REMAPA_C11_C12;
+	uint32_t DWB_GAMUT_REMAPA_C13_C14;
+	uint32_t DWB_GAMUT_REMAPA_C21_C22;
+	uint32_t DWB_GAMUT_REMAPA_C23_C24;
+	uint32_t DWB_GAMUT_REMAPA_C31_C32;
+	uint32_t DWB_GAMUT_REMAPA_C33_C34;
+	uint32_t DWB_GAMUT_REMAPB_C11_C12;
+	uint32_t DWB_GAMUT_REMAPB_C13_C14;
+	uint32_t DWB_GAMUT_REMAPB_C21_C22;
+	uint32_t DWB_GAMUT_REMAPB_C23_C24;
+	uint32_t DWB_GAMUT_REMAPB_C31_C32;
+	uint32_t DWB_GAMUT_REMAPB_C33_C34;
+	uint32_t DWB_OGAM_CONTROL;
+	uint32_t DWB_OGAM_LUT_INDEX;
+	uint32_t DWB_OGAM_LUT_DATA;
+	uint32_t DWB_OGAM_LUT_CONTROL;
+	uint32_t DWB_OGAM_RAMA_START_CNTL_B;
+	uint32_t DWB_OGAM_RAMA_START_CNTL_G;
+	uint32_t DWB_OGAM_RAMA_START_CNTL_R;
+	uint32_t DWB_OGAM_RAMA_START_BASE_CNTL_B;
+	uint32_t DWB_OGAM_RAMA_START_SLOPE_CNTL_B;
+	uint32_t DWB_OGAM_RAMA_START_BASE_CNTL_G;
+	uint32_t DWB_OGAM_RAMA_START_SLOPE_CNTL_G;
+	uint32_t DWB_OGAM_RAMA_START_BASE_CNTL_R;
+	uint32_t DWB_OGAM_RAMA_START_SLOPE_CNTL_R;
+	uint32_t DWB_OGAM_RAMA_END_CNTL1_B;
+	uint32_t DWB_OGAM_RAMA_END_CNTL2_B;
+	uint32_t DWB_OGAM_RAMA_END_CNTL1_G;
+	uint32_t DWB_OGAM_RAMA_END_CNTL2_G;
+	uint32_t DWB_OGAM_RAMA_END_CNTL1_R;
+	uint32_t DWB_OGAM_RAMA_END_CNTL2_R;
+	uint32_t DWB_OGAM_RAMA_OFFSET_B;
+	uint32_t DWB_OGAM_RAMA_OFFSET_G;
+	uint32_t DWB_OGAM_RAMA_OFFSET_R;
+	uint32_t DWB_OGAM_RAMA_REGION_0_1;
+	uint32_t DWB_OGAM_RAMA_REGION_2_3;
+	uint32_t DWB_OGAM_RAMA_REGION_4_5;
+	uint32_t DWB_OGAM_RAMA_REGION_6_7;
+	uint32_t DWB_OGAM_RAMA_REGION_8_9;
+	uint32_t DWB_OGAM_RAMA_REGION_10_11;
+	uint32_t DWB_OGAM_RAMA_REGION_12_13;
+	uint32_t DWB_OGAM_RAMA_REGION_14_15;
+	uint32_t DWB_OGAM_RAMA_REGION_16_17;
+	uint32_t DWB_OGAM_RAMA_REGION_18_19;
+	uint32_t DWB_OGAM_RAMA_REGION_20_21;
+	uint32_t DWB_OGAM_RAMA_REGION_22_23;
+	uint32_t DWB_OGAM_RAMA_REGION_24_25;
+	uint32_t DWB_OGAM_RAMA_REGION_26_27;
+	uint32_t DWB_OGAM_RAMA_REGION_28_29;
+	uint32_t DWB_OGAM_RAMA_REGION_30_31;
+	uint32_t DWB_OGAM_RAMA_REGION_32_33;
+	uint32_t DWB_OGAM_RAMB_START_CNTL_B;
+	uint32_t DWB_OGAM_RAMB_START_CNTL_G;
+	uint32_t DWB_OGAM_RAMB_START_CNTL_R;
+	uint32_t DWB_OGAM_RAMB_START_BASE_CNTL_B;
+	uint32_t DWB_OGAM_RAMB_START_SLOPE_CNTL_B;
+	uint32_t DWB_OGAM_RAMB_START_BASE_CNTL_G;
+	uint32_t DWB_OGAM_RAMB_START_SLOPE_CNTL_G;
+	uint32_t DWB_OGAM_RAMB_START_BASE_CNTL_R;
+	uint32_t DWB_OGAM_RAMB_START_SLOPE_CNTL_R;
+	uint32_t DWB_OGAM_RAMB_END_CNTL1_B;
+	uint32_t DWB_OGAM_RAMB_END_CNTL2_B;
+	uint32_t DWB_OGAM_RAMB_END_CNTL1_G;
+	uint32_t DWB_OGAM_RAMB_END_CNTL2_G;
+	uint32_t DWB_OGAM_RAMB_END_CNTL1_R;
+	uint32_t DWB_OGAM_RAMB_END_CNTL2_R;
+	uint32_t DWB_OGAM_RAMB_OFFSET_B;
+	uint32_t DWB_OGAM_RAMB_OFFSET_G;
+	uint32_t DWB_OGAM_RAMB_OFFSET_R;
+	uint32_t DWB_OGAM_RAMB_REGION_0_1;
+	uint32_t DWB_OGAM_RAMB_REGION_2_3;
+	uint32_t DWB_OGAM_RAMB_REGION_4_5;
+	uint32_t DWB_OGAM_RAMB_REGION_6_7;
+	uint32_t DWB_OGAM_RAMB_REGION_8_9;
+	uint32_t DWB_OGAM_RAMB_REGION_10_11;
+	uint32_t DWB_OGAM_RAMB_REGION_12_13;
+	uint32_t DWB_OGAM_RAMB_REGION_14_15;
+	uint32_t DWB_OGAM_RAMB_REGION_16_17;
+	uint32_t DWB_OGAM_RAMB_REGION_18_19;
+	uint32_t DWB_OGAM_RAMB_REGION_20_21;
+	uint32_t DWB_OGAM_RAMB_REGION_22_23;
+	uint32_t DWB_OGAM_RAMB_REGION_24_25;
+	uint32_t DWB_OGAM_RAMB_REGION_26_27;
+	uint32_t DWB_OGAM_RAMB_REGION_28_29;
+	uint32_t DWB_OGAM_RAMB_REGION_30_31;
+	uint32_t DWB_OGAM_RAMB_REGION_32_33;
+};
+
+/* Internal enums / structs */
+enum dwbscl_coef_filter_type_sel {
+	DWBSCL_COEF_RAM_FILTER_TYPE_VERT_RGB = 0,
+	DWBSCL_COEF_RAM_FILTER_TYPE_HORZ_RGB = 1
+};
+
+
+struct dcn30_dwbc_mask {
+	DWBC_REG_FIELD_LIST_DCN3_0(uint32_t);
+};
+
+struct dcn30_dwbc_shift {
+	DWBC_REG_FIELD_LIST_DCN3_0(uint8_t);
+};
+
+struct dcn30_dwbc {
+	struct dwbc base;
+	const struct dcn30_dwbc_registers *dwbc_regs;
+	const struct dcn30_dwbc_shift *dwbc_shift;
+	const struct dcn30_dwbc_mask *dwbc_mask;
+};
+
+void dcn30_dwbc_construct(struct dcn30_dwbc *dwbc30,
+	struct dc_context *ctx,
+	const struct dcn30_dwbc_registers *dwbc_regs,
+	const struct dcn30_dwbc_shift *dwbc_shift,
+	const struct dcn30_dwbc_mask *dwbc_mask,
+	int inst);
+
+bool dwb3_enable(struct dwbc *dwbc, struct dc_dwb_params *params);
+
+bool dwb3_disable(struct dwbc *dwbc);
+
+bool dwb3_update(struct dwbc *dwbc, struct dc_dwb_params *params);
+
+bool dwb3_is_enabled(struct dwbc *dwbc);
+
+void dwb3_set_stereo(struct dwbc *dwbc,
+	struct dwb_stereo_params *stereo_params);
+
+void dwb3_set_new_content(struct dwbc *dwbc,
+	bool is_new_content);
+
+void dwb3_config_fc(struct dwbc *dwbc,
+	struct dc_dwb_params *params);
+
+void dwb3_set_denorm(struct dwbc *dwbc, struct dc_dwb_params *params);
+
+void dwb3_program_hdr_mult(
+	struct dwbc *dwbc,
+	const struct dc_dwb_params *params);
+
+void dwb3_set_gamut_remap(
+	struct dwbc *dwbc,
+	const struct dc_dwb_params *params);
+
+bool dwb3_ogam_set_input_transfer_func(
+	struct dwbc *dwbc,
+	const struct dc_transfer_func *in_transfer_func_dwb_ogam);
+
+void dwb3_set_host_read_rate_control(struct dwbc *dwbc, bool host_read_delay);
+#endif
+
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
new file mode 100644
index 000000000000..8593145379d9
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
@@ -0,0 +1,354 @@
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
+#include "fixed31_32.h"
+#include "resource.h"
+#include "basics/conversion.h"
+#include "dwb.h"
+#include "dcn30_dwb.h"
+#include "dcn30_cm_common.h"
+#include "dcn10/dcn10_cm_common.h"
+
+
+#define REG(reg)\
+	dwbc30->dwbc_regs->reg
+
+#define CTX \
+	dwbc30->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	dwbc30->dwbc_shift->field_name, dwbc30->dwbc_mask->field_name
+
+#define TO_DCN30_DWBC(dwbc_base) \
+	container_of(dwbc_base, struct dcn30_dwbc, base)
+
+static void dwb3_get_reg_field_ogam(struct dcn30_dwbc *dwbc30,
+	struct dcn3_xfer_func_reg *reg)
+{
+	reg->shifts.exp_region0_lut_offset = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION0_LUT_OFFSET;
+	reg->masks.exp_region0_lut_offset = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION0_LUT_OFFSET;
+	reg->shifts.exp_region0_num_segments = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION0_NUM_SEGMENTS;
+	reg->masks.exp_region0_num_segments = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION0_NUM_SEGMENTS;
+	reg->shifts.exp_region1_lut_offset = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION1_LUT_OFFSET;
+	reg->masks.exp_region1_lut_offset = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION1_LUT_OFFSET;
+	reg->shifts.exp_region1_num_segments = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION1_NUM_SEGMENTS;
+	reg->masks.exp_region1_num_segments = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION1_NUM_SEGMENTS;
+
+	reg->shifts.field_region_end = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION_END_B;
+	reg->masks.field_region_end = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION_END_B;
+	reg->shifts.field_region_end_slope = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION_END_SLOPE_B;
+	reg->masks.field_region_end_slope = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION_END_SLOPE_B;
+	reg->shifts.field_region_end_base = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION_END_BASE_B;
+	reg->masks.field_region_end_base = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION_END_BASE_B;
+	reg->shifts.field_region_linear_slope = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION_START_SLOPE_B;
+	reg->masks.field_region_linear_slope = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION_START_SLOPE_B;
+	reg->masks.field_offset = dwbc30->dwbc_mask->DWB_OGAM_RAMA_OFFSET_B;
+	reg->shifts.field_offset = dwbc30->dwbc_shift->DWB_OGAM_RAMA_OFFSET_B;
+	reg->shifts.exp_region_start = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION_START_B;
+	reg->masks.exp_region_start = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION_START_B;
+	reg->shifts.exp_resion_start_segment = dwbc30->dwbc_shift->DWB_OGAM_RAMA_EXP_REGION_START_SEGMENT_B;
+	reg->masks.exp_resion_start_segment = dwbc30->dwbc_mask->DWB_OGAM_RAMA_EXP_REGION_START_SEGMENT_B;
+}
+
+/*program dwb ogam RAM A*/
+static void dwb3_program_ogam_luta_settings(
+	struct dcn30_dwbc *dwbc30,
+	const struct pwl_params *params)
+{
+	struct dcn3_xfer_func_reg gam_regs;
+
+	dwb3_get_reg_field_ogam(dwbc30, &gam_regs);
+
+	gam_regs.start_cntl_b = REG(DWB_OGAM_RAMA_START_CNTL_B);
+	gam_regs.start_cntl_g = REG(DWB_OGAM_RAMA_START_CNTL_G);
+	gam_regs.start_cntl_r = REG(DWB_OGAM_RAMA_START_CNTL_R);
+	gam_regs.start_base_cntl_b = REG(DWB_OGAM_RAMA_START_BASE_CNTL_B);
+	gam_regs.start_base_cntl_g = REG(DWB_OGAM_RAMA_START_BASE_CNTL_G);
+	gam_regs.start_base_cntl_r = REG(DWB_OGAM_RAMA_START_BASE_CNTL_R);
+	gam_regs.start_slope_cntl_b = REG(DWB_OGAM_RAMA_START_SLOPE_CNTL_B);
+	gam_regs.start_slope_cntl_g = REG(DWB_OGAM_RAMA_START_SLOPE_CNTL_G);
+	gam_regs.start_slope_cntl_r = REG(DWB_OGAM_RAMA_START_SLOPE_CNTL_R);
+	gam_regs.start_end_cntl1_b = REG(DWB_OGAM_RAMA_END_CNTL1_B);
+	gam_regs.start_end_cntl2_b = REG(DWB_OGAM_RAMA_END_CNTL2_B);
+	gam_regs.start_end_cntl1_g = REG(DWB_OGAM_RAMA_END_CNTL1_G);
+	gam_regs.start_end_cntl2_g = REG(DWB_OGAM_RAMA_END_CNTL2_G);
+	gam_regs.start_end_cntl1_r = REG(DWB_OGAM_RAMA_END_CNTL1_R);
+	gam_regs.start_end_cntl2_r = REG(DWB_OGAM_RAMA_END_CNTL2_R);
+	gam_regs.offset_b = REG(DWB_OGAM_RAMA_OFFSET_B);
+	gam_regs.offset_g = REG(DWB_OGAM_RAMA_OFFSET_G);
+	gam_regs.offset_r = REG(DWB_OGAM_RAMA_OFFSET_R);
+	gam_regs.region_start = REG(DWB_OGAM_RAMA_REGION_0_1);
+	gam_regs.region_end = REG(DWB_OGAM_RAMA_REGION_32_33);
+	/*todo*/
+	cm_helper_program_gamcor_xfer_func(dwbc30->base.ctx, params, &gam_regs);
+}
+
+/*program dwb ogam RAM B*/
+static void dwb3_program_ogam_lutb_settings(
+	struct dcn30_dwbc *dwbc30,
+	const struct pwl_params *params)
+{
+	struct dcn3_xfer_func_reg gam_regs;
+
+	dwb3_get_reg_field_ogam(dwbc30, &gam_regs);
+
+	gam_regs.start_cntl_b = REG(DWB_OGAM_RAMB_START_CNTL_B);
+	gam_regs.start_cntl_g = REG(DWB_OGAM_RAMB_START_CNTL_G);
+	gam_regs.start_cntl_r = REG(DWB_OGAM_RAMB_START_CNTL_R);
+	gam_regs.start_base_cntl_b = REG(DWB_OGAM_RAMB_START_BASE_CNTL_B);
+	gam_regs.start_base_cntl_g = REG(DWB_OGAM_RAMB_START_BASE_CNTL_G);
+	gam_regs.start_base_cntl_r = REG(DWB_OGAM_RAMB_START_BASE_CNTL_R);
+	gam_regs.start_slope_cntl_b = REG(DWB_OGAM_RAMB_START_SLOPE_CNTL_B);
+	gam_regs.start_slope_cntl_g = REG(DWB_OGAM_RAMB_START_SLOPE_CNTL_G);
+	gam_regs.start_slope_cntl_r = REG(DWB_OGAM_RAMB_START_SLOPE_CNTL_R);
+	gam_regs.start_end_cntl1_b = REG(DWB_OGAM_RAMB_END_CNTL1_B);
+	gam_regs.start_end_cntl2_b = REG(DWB_OGAM_RAMB_END_CNTL2_B);
+	gam_regs.start_end_cntl1_g = REG(DWB_OGAM_RAMB_END_CNTL1_G);
+	gam_regs.start_end_cntl2_g = REG(DWB_OGAM_RAMB_END_CNTL2_G);
+	gam_regs.start_end_cntl1_r = REG(DWB_OGAM_RAMB_END_CNTL1_R);
+	gam_regs.start_end_cntl2_r = REG(DWB_OGAM_RAMB_END_CNTL2_R);
+	gam_regs.offset_b = REG(DWB_OGAM_RAMB_OFFSET_B);
+	gam_regs.offset_g = REG(DWB_OGAM_RAMB_OFFSET_G);
+	gam_regs.offset_r = REG(DWB_OGAM_RAMB_OFFSET_R);
+	gam_regs.region_start = REG(DWB_OGAM_RAMB_REGION_0_1);
+	gam_regs.region_end = REG(DWB_OGAM_RAMB_REGION_32_33);
+
+	cm_helper_program_gamcor_xfer_func(dwbc30->base.ctx, params, &gam_regs);
+}
+
+static enum dc_lut_mode dwb3_get_ogam_current(
+	struct dcn30_dwbc *dwbc30)
+{
+	enum dc_lut_mode mode;
+	uint32_t state_mode;
+	uint32_t ram_select;
+
+	REG_GET(DWB_OGAM_CONTROL,
+		DWB_OGAM_MODE, &state_mode);
+	REG_GET(DWB_OGAM_CONTROL,
+		DWB_OGAM_SELECT, &ram_select);
+
+	if (state_mode == 0) {
+		mode = LUT_BYPASS;
+	} else if (state_mode == 2) {
+		if (ram_select == 0)
+			mode = LUT_RAM_A;
+		else
+			mode = LUT_RAM_B;
+	} else {
+		// Reserved value
+		mode = LUT_BYPASS;
+		BREAK_TO_DEBUGGER();
+		return mode;
+	}
+	return mode;
+}
+
+static void dwb3_configure_ogam_lut(
+	struct dcn30_dwbc *dwbc30,
+	bool is_ram_a)
+{
+	REG_UPDATE(DWB_OGAM_LUT_CONTROL,
+		DWB_OGAM_LUT_READ_COLOR_SEL, 7);
+	REG_UPDATE(DWB_OGAM_CONTROL,
+		DWB_OGAM_SELECT, is_ram_a == true ? 0 : 1);
+	REG_SET(DWB_OGAM_LUT_INDEX, 0, DWB_OGAM_LUT_INDEX, 0);
+}
+
+static void dwb3_program_ogam_pwl(struct dcn30_dwbc *dwbc30,
+	const struct pwl_result_data *rgb,
+	uint32_t num)
+{
+	uint32_t i;
+
+    // triple base implementation
+	for (i = 0; i < num/2; i++) {
+		REG_SET(DWB_OGAM_LUT_DATA, 0, DWB_OGAM_LUT_DATA, rgb[2*i+0].red_reg);
+		REG_SET(DWB_OGAM_LUT_DATA, 0, DWB_OGAM_LUT_DATA, rgb[2*i+0].green_reg);
+		REG_SET(DWB_OGAM_LUT_DATA, 0, DWB_OGAM_LUT_DATA, rgb[2*i+0].blue_reg);
+		REG_SET(DWB_OGAM_LUT_DATA, 0, DWB_OGAM_LUT_DATA, rgb[2*i+1].red_reg);
+		REG_SET(DWB_OGAM_LUT_DATA, 0, DWB_OGAM_LUT_DATA, rgb[2*i+1].green_reg);
+		REG_SET(DWB_OGAM_LUT_DATA, 0, DWB_OGAM_LUT_DATA, rgb[2*i+1].blue_reg);
+		REG_SET(DWB_OGAM_LUT_DATA, 0, DWB_OGAM_LUT_DATA, rgb[2*i+2].red_reg);
+		REG_SET(DWB_OGAM_LUT_DATA, 0, DWB_OGAM_LUT_DATA, rgb[2*i+2].green_reg);
+		REG_SET(DWB_OGAM_LUT_DATA, 0, DWB_OGAM_LUT_DATA, rgb[2*i+2].blue_reg);
+	}
+}
+
+static bool dwb3_program_ogam_lut(
+	struct dcn30_dwbc *dwbc30,
+	const struct pwl_params *params)
+{
+	enum dc_lut_mode current_mode;
+	enum dc_lut_mode next_mode;
+
+	if (params == NULL) {
+		REG_SET(DWB_OGAM_CONTROL, 0, DWB_OGAM_MODE, 0);
+		return false;
+	}
+
+	current_mode = dwb3_get_ogam_current(dwbc30);
+	if (current_mode == LUT_BYPASS || current_mode == LUT_RAM_A)
+		next_mode = LUT_RAM_B;
+	else
+		next_mode = LUT_RAM_A;
+
+	dwb3_configure_ogam_lut(dwbc30, next_mode == LUT_RAM_A ? true : false);
+
+	if (next_mode == LUT_RAM_A)
+		dwb3_program_ogam_luta_settings(dwbc30, params);
+	else
+		dwb3_program_ogam_lutb_settings(dwbc30, params);
+
+	dwb3_program_ogam_pwl(
+		dwbc30, params->rgb_resulted, params->hw_points_num);
+
+	REG_SET(DWB_OGAM_CONTROL, 0, DWB_OGAM_MODE, 2);
+	REG_SET(DWB_OGAM_CONTROL, 0, DWB_OGAM_SELECT, next_mode == LUT_RAM_A ? 0 : 1);
+
+	return true;
+}
+
+bool dwb3_ogam_set_input_transfer_func(
+	struct dwbc *dwbc,
+	const struct dc_transfer_func *in_transfer_func_dwb_ogam)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+	bool result = false;
+	struct pwl_params *dwb_ogam_lut = NULL;
+
+	if (in_transfer_func_dwb_ogam == NULL)
+		return result;
+
+	dwb_ogam_lut = kzalloc(sizeof(*dwb_ogam_lut), GFP_KERNEL);
+
+	if (dwb_ogam_lut) {
+		cm_helper_translate_curve_to_hw_format(
+			in_transfer_func_dwb_ogam,
+			dwb_ogam_lut, false);
+
+		result = dwb3_program_ogam_lut(
+			dwbc30,
+			dwb_ogam_lut);
+		kfree(dwb_ogam_lut);
+		dwb_ogam_lut = NULL;
+	}
+
+	return result;
+}
+
+static void dwb3_program_gamut_remap(
+		struct dwbc *dwbc,
+		const uint16_t *regval,
+		enum cm_gamut_coef_format coef_format,
+		enum cm_gamut_remap_select select)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+
+	struct color_matrices_reg gam_regs;
+
+	REG_UPDATE(DWB_GAMUT_REMAP_COEF_FORMAT, DWB_GAMUT_REMAP_COEF_FORMAT, coef_format);
+
+	if (regval == NULL || select == CM_GAMUT_REMAP_MODE_BYPASS) {
+		REG_SET(DWB_GAMUT_REMAP_MODE, 0,
+				DWB_GAMUT_REMAP_MODE, 0);
+		return;
+	}
+
+	switch (select) {
+	case CM_GAMUT_REMAP_MODE_RAMA_COEFF:
+		gam_regs.csc_c11_c12 = REG(DWB_GAMUT_REMAPA_C11_C12);
+		gam_regs.csc_c33_c34 = REG(DWB_GAMUT_REMAPA_C33_C34);
+
+		cm_helper_program_color_matrices(
+				dwbc30->base.ctx,
+				regval,
+				&gam_regs);
+		break;
+	case CM_GAMUT_REMAP_MODE_RAMB_COEFF:
+		gam_regs.csc_c11_c12 = REG(DWB_GAMUT_REMAPB_C11_C12);
+		gam_regs.csc_c33_c34 = REG(DWB_GAMUT_REMAPB_C33_C34);
+
+		cm_helper_program_color_matrices(
+				dwbc30->base.ctx,
+				regval,
+				&gam_regs);
+		break;
+	case CM_GAMUT_REMAP_MODE_RESERVED:
+		/* should never happen, bug */
+		BREAK_TO_DEBUGGER();
+		return;
+	default:
+		break;
+	}
+
+	REG_SET(DWB_GAMUT_REMAP_MODE, 0,
+			DWB_GAMUT_REMAP_MODE, select);
+
+}
+
+void dwb3_set_gamut_remap(
+	struct dwbc *dwbc,
+	const struct dc_dwb_params *params)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+	struct cm_grph_csc_adjustment adjust = params->csc_params;
+	int i = 0;
+
+	if (adjust.gamut_adjust_type != CM_GAMUT_ADJUST_TYPE_SW) {
+		/* Bypass if type is bypass or hw */
+		dwb3_program_gamut_remap(dwbc, NULL, adjust.gamut_coef_format, CM_GAMUT_REMAP_MODE_BYPASS);
+	} else {
+		struct fixed31_32 arr_matrix[12];
+		uint16_t arr_reg_val[12];
+		unsigned int current_mode;
+
+		for (i = 0; i < 12; i++)
+			arr_matrix[i] = adjust.temperature_matrix[i];
+
+		convert_float_matrix(arr_reg_val, arr_matrix, 12);
+
+		REG_GET(DWB_GAMUT_REMAP_MODE, DWB_GAMUT_REMAP_MODE_CURRENT, &current_mode);
+
+		if (current_mode == CM_GAMUT_REMAP_MODE_RAMA_COEFF) {
+			dwb3_program_gamut_remap(dwbc, arr_reg_val,
+					adjust.gamut_coef_format, CM_GAMUT_REMAP_MODE_RAMB_COEFF);
+		} else {
+			dwb3_program_gamut_remap(dwbc, arr_reg_val,
+					adjust.gamut_coef_format, CM_GAMUT_REMAP_MODE_RAMA_COEFF);
+		}
+	}
+}
+
+void dwb3_program_hdr_mult(
+	struct dwbc *dwbc,
+	const struct dc_dwb_params *params)
+{
+	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
+
+	REG_UPDATE(DWB_HDR_MULT_COEF, DWB_HDR_MULT_COEF, params->hdr_mult);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h
index f30ab4916242..3407e5da5534 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h
@@ -72,6 +72,67 @@ enum wbscl_coef_filter_type_sel {
 };
 
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+enum dwb_boundary_mode {
+	DWBSCL_BOUNDARY_MODE_EDGE  = 0,
+	DWBSCL_BOUNDARY_MODE_BLACK = 1
+};
+#endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+enum dwb_output_csc_mode {
+	DWB_OUTPUT_CSC_DISABLE = 0,
+	DWB_OUTPUT_CSC_COEF_A = 1,
+	DWB_OUTPUT_CSC_COEF_B = 2
+};
+
+enum dwb_ogam_lut_mode {
+	DWB_OGAM_MODE_BYPASS,
+	DWB_OGAM_RAMA_LUT,
+	DWB_OGAM_RAMB_LUT
+};
+
+enum dwb_color_volume {
+	DWB_SRGB_BT709 = 0,	//SDR
+	DWB_PQ = 1,	//HDR
+	DWB_HLG = 2,	//HDR
+};
+
+enum dwb_color_space {
+	DWB_SRGB = 0,	//SDR
+	DWB_BT709 = 1,	//SDR
+	DWB_BT2020 = 2,	//HDR
+};
+
+struct dwb_efc_hdr_metadata {
+	/*display chromaticities and white point in units of 0.00001 */
+	unsigned int	chromaticity_green_x;
+	unsigned int	chromaticity_green_y;
+	unsigned int	chromaticity_blue_x;
+	unsigned int	chromaticity_blue_y;
+	unsigned int	chromaticity_red_x;
+	unsigned int	chromaticity_red_y;
+	unsigned int	chromaticity_white_point_x;
+	unsigned int	chromaticity_white_point_y;
+
+	/*in units of candelas per square meter */
+	unsigned int	min_luminance;
+	unsigned int	max_luminance;
+
+	/*in units of nits */
+	unsigned int	maximum_content_light_level;
+	unsigned int	maximum_frame_average_light_level;
+};
+
+struct dwb_efc_display_settings {
+	unsigned int	inputColorVolume;
+	unsigned int	inputColorSpace;
+	unsigned int	inputBitDepthMinus8;
+	struct dwb_efc_hdr_metadata	hdr_metadata;
+	unsigned int	dwbOutputBlack;	// 0 - Normal, 1 - Output Black
+};
+
+#endif
 struct dwb_warmup_params {
 	bool	warmup_en;	/* false: normal mode, true: enable pattern generator */
 	bool	warmup_mode;	/* false: 420, true: 444 */
@@ -148,6 +209,28 @@ struct dwbc_funcs {
 		struct dwb_warmup_params *warmup_params);
 
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+
+	void (*dwb_program_output_csc)(
+		struct dwbc *dwbc,
+		enum dc_color_space color_space,
+		enum dwb_output_csc_mode mode);
+
+	bool (*dwb_ogam_set_output_transfer_func)(
+		struct dwbc *dwbc,
+		const struct dc_transfer_func *in_transfer_func_dwb_ogam);
+
+	void (*get_privacy_mask)(
+		struct dwbc *dwbc, uint32_t *mask_id);
+
+	void (*set_privacy_mask)(
+		struct dwbc *dwbc, uint32_t mask_id);
+
+	//TODO: merge with output_transfer_func?
+	bool (*dwb_ogam_set_input_transfer_func)(
+		struct dwbc *dwbc,
+		const struct dc_transfer_func *in_transfer_func_dwb_ogam);
+#endif
 	bool (*get_dwb_status)(
 		struct dwbc *dwbc);
 	void (*dwb_set_scaler)(
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

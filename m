Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B3F4C7B6C
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Feb 2022 22:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991F010E8D9;
	Mon, 28 Feb 2022 21:11:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9810E8D9;
 Mon, 28 Feb 2022 21:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hlxuHAMRU3IMg6hj7WJxf5M11wcx0ijnT9+HHKNCJmY=; b=obQcFpsBHStgolqorqjWeQ4+Bo
 dXzFLLVuEKqbAFgwEib3HJ8yHcdiLk6GQafUZkwZCbg311p9psRwTkoiDNGZDzqVwgH4mB43qAffI
 wgkft3zSyMGjVhI7uN5KL5KXbp8P9Lyk2GVEDopiXcD/wu4gjBIjXGS6wuySB3aXBh7FAjpO69o1I
 OX/VrbntjRoQ5w+G5ML18oJnElP9XyxqL0+ywMPy+pl9h5t0K4kN3MU/7RDyvR371hCIUJBza2Deu
 B6bMOXgiOfvhwSrvMtaR+t7PNs39lSB+fs7FS4ViQq72Ph1zV4PNQ/z+3EeEbGzQkvXg/jlYCoxSb
 lePgc7Mw==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nOnJ7-000CFy-Gv; Mon, 28 Feb 2022 22:11:49 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/2] drm/amd/display: move FPU code from dcn10 to dml/dcn10
 folder
Date: Mon, 28 Feb 2022 20:10:47 -0100
Message-Id: <20220228211047.3957945-3-mwen@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228211047.3957945-1-mwen@igalia.com>
References: <20220228211047.3957945-1-mwen@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, linux-kernel@vger.kernel.org,
 Jasdeep Dhillon <jdhillon@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

FPU operations in dcn10 was already moved to dml folder via calcs code.
However, dcn1_0_ip and dcn_1_0_soc with FPU componentd remains on dcn10.
Following previous changes to isolate FPU, this patch creates dcn10_fpu
files to isolate FPU-specific code and moves those structs to it.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/dc/dcn10/dcn10_resource.c |  62 ---------
 .../drm/amd/display/dc/dcn10/dcn10_resource.h |   4 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |   2 +
 .../drm/amd/display/dc/dml/dcn10/dcn10_fpu.c  | 124 ++++++++++++++++++
 .../drm/amd/display/dc/dml/dcn10/dcn10_fpu.h  |  30 +++++
 5 files changed, 160 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index 858b72149897..ac96242cc474 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -70,68 +70,6 @@
 #include "dce/dce_aux.h"
 #include "dce/dce_i2c.h"
 
-const struct _vcs_dpi_ip_params_st dcn1_0_ip = {
-	.rob_buffer_size_kbytes = 64,
-	.det_buffer_size_kbytes = 164,
-	.dpte_buffer_size_in_pte_reqs_luma = 42,
-	.dpp_output_buffer_pixels = 2560,
-	.opp_output_buffer_lines = 1,
-	.pixel_chunk_size_kbytes = 8,
-	.pte_enable = 1,
-	.pte_chunk_size_kbytes = 2,
-	.meta_chunk_size_kbytes = 2,
-	.writeback_chunk_size_kbytes = 2,
-	.line_buffer_size_bits = 589824,
-	.max_line_buffer_lines = 12,
-	.IsLineBufferBppFixed = 0,
-	.LineBufferFixedBpp = -1,
-	.writeback_luma_buffer_size_kbytes = 12,
-	.writeback_chroma_buffer_size_kbytes = 8,
-	.max_num_dpp = 4,
-	.max_num_wb = 2,
-	.max_dchub_pscl_bw_pix_per_clk = 4,
-	.max_pscl_lb_bw_pix_per_clk = 2,
-	.max_lb_vscl_bw_pix_per_clk = 4,
-	.max_vscl_hscl_bw_pix_per_clk = 4,
-	.max_hscl_ratio = 4,
-	.max_vscl_ratio = 4,
-	.hscl_mults = 4,
-	.vscl_mults = 4,
-	.max_hscl_taps = 8,
-	.max_vscl_taps = 8,
-	.dispclk_ramp_margin_percent = 1,
-	.underscan_factor = 1.10,
-	.min_vblank_lines = 14,
-	.dppclk_delay_subtotal = 90,
-	.dispclk_delay_subtotal = 42,
-	.dcfclk_cstate_latency = 10,
-	.max_inter_dcn_tile_repeaters = 8,
-	.can_vstartup_lines_exceed_vsync_plus_back_porch_lines_minus_one = 0,
-	.bug_forcing_LC_req_same_size_fixed = 0,
-};
-
-const struct _vcs_dpi_soc_bounding_box_st dcn1_0_soc = {
-	.sr_exit_time_us = 9.0,
-	.sr_enter_plus_exit_time_us = 11.0,
-	.urgent_latency_us = 4.0,
-	.writeback_latency_us = 12.0,
-	.ideal_dram_bw_after_urgent_percent = 80.0,
-	.max_request_size_bytes = 256,
-	.downspread_percent = 0.5,
-	.dram_page_open_time_ns = 50.0,
-	.dram_rw_turnaround_time_ns = 17.5,
-	.dram_return_buffer_per_channel_bytes = 8192,
-	.round_trip_ping_latency_dcfclk_cycles = 128,
-	.urgent_out_of_order_return_per_channel_bytes = 256,
-	.channel_interleave_bytes = 256,
-	.num_banks = 8,
-	.num_chans = 2,
-	.vmm_page_size_bytes = 4096,
-	.dram_clock_change_latency_us = 17.0,
-	.writeback_dram_clock_change_latency_us = 23.0,
-	.return_bus_width_bytes = 64,
-};
-
 #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
 	#define mmDP0_DP_DPHY_INTERNAL_CTRL		0x210f
 	#define mmDP0_DP_DPHY_INTERNAL_CTRL_BASE_IDX	2
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.h
index 633025ccb870..bf8e33cd8147 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.h
@@ -27,6 +27,7 @@
 #define __DC_RESOURCE_DCN10_H__
 
 #include "core_types.h"
+#include "dml/dcn10/dcn10_fpu.h"
 
 #define TO_DCN10_RES_POOL(pool)\
 	container_of(pool, struct dcn10_resource_pool, base)
@@ -35,6 +36,9 @@ struct dc;
 struct resource_pool;
 struct _vcs_dpi_display_pipe_params_st;
 
+extern struct _vcs_dpi_ip_params_st dcn1_0_ip;
+extern struct _vcs_dpi_soc_bounding_box_st dcn1_0_soc;
+
 struct dcn10_resource_pool {
 	struct resource_pool base;
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index b16c492593e2..6b7f8b62a56f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -58,6 +58,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
 
 ifdef CONFIG_DRM_AMD_DC_DCN
 CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn10/dcn10_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/dcn20_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
@@ -105,6 +106,7 @@ DML = calcs/dce_calcs.o calcs/custom_float.o calcs/bw_fixed.o
 
 ifdef CONFIG_DRM_AMD_DC_DCN
 DML += display_mode_lib.o display_rq_dlg_helpers.o dml1_display_rq_dlg_calc.o
+DML += dcn10/dcn10_fpu.o
 DML += dcn20/dcn20_fpu.o
 DML += display_mode_vba.o dcn20/display_rq_dlg_calc_20.o dcn20/display_mode_vba_20.o
 DML += dcn20/display_rq_dlg_calc_20v2.o dcn20/display_mode_vba_20v2.o
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c
new file mode 100644
index 000000000000..7f08f49eb7b1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
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
+#include "dcn10/dcn10_resource.h"
+
+#include "dcn10_fpu.h"
+
+/**
+ * DOC: DCN10 FPU manipulation Overview
+ *
+ * The DCN architecture relies on FPU operations, which require special
+ * compilation flags and the use of kernel_fpu_begin/end functions; ideally, we
+ * want to avoid spreading FPU access across multiple files. With this idea in
+ * mind, this file aims to centralize DCN10 functions that require FPU access
+ * in a single place. Code in this file follows the following code pattern:
+ *
+ * 1. Functions that use FPU operations should be isolated in static functions.
+ * 2. The FPU functions should have the noinline attribute to ensure anything
+ *    that deals with FP register is contained within this call.
+ * 3. All function that needs to be accessed outside this file requires a
+ *    public interface that not uses any FPU reference.
+ * 4. Developers **must not** use DC_FP_START/END in this file, but they need
+ *    to ensure that the caller invokes it before access any function available
+ *    in this file. For this reason, public functions in this file must invoke
+ *    dc_assert_fp_enabled();
+ *
+ * Let's expand a little bit more the idea in the code pattern. To fully
+ * isolate FPU operations in a single place, we must avoid situations where
+ * compilers spill FP values to registers due to FP enable in a specific C
+ * file. Note that even if we isolate all FPU functions in a single file and
+ * call its interface from other files, the compiler might enable the use of
+ * FPU before we call DC_FP_START. Nevertheless, it is the programmer's
+ * responsibility to invoke DC_FP_START/END in the correct place. To highlight
+ * situations where developers forgot to use the FP protection before calling
+ * the DC FPU interface functions, we introduce a helper that checks if the
+ * function is invoked under FP protection. If not, it will trigger a kernel
+ * warning.
+ */
+
+struct _vcs_dpi_ip_params_st dcn1_0_ip = {
+	.rob_buffer_size_kbytes = 64,
+	.det_buffer_size_kbytes = 164,
+	.dpte_buffer_size_in_pte_reqs_luma = 42,
+	.dpp_output_buffer_pixels = 2560,
+	.opp_output_buffer_lines = 1,
+	.pixel_chunk_size_kbytes = 8,
+	.pte_enable = 1,
+	.pte_chunk_size_kbytes = 2,
+	.meta_chunk_size_kbytes = 2,
+	.writeback_chunk_size_kbytes = 2,
+	.line_buffer_size_bits = 589824,
+	.max_line_buffer_lines = 12,
+	.IsLineBufferBppFixed = 0,
+	.LineBufferFixedBpp = -1,
+	.writeback_luma_buffer_size_kbytes = 12,
+	.writeback_chroma_buffer_size_kbytes = 8,
+	.max_num_dpp = 4,
+	.max_num_wb = 2,
+	.max_dchub_pscl_bw_pix_per_clk = 4,
+	.max_pscl_lb_bw_pix_per_clk = 2,
+	.max_lb_vscl_bw_pix_per_clk = 4,
+	.max_vscl_hscl_bw_pix_per_clk = 4,
+	.max_hscl_ratio = 4,
+	.max_vscl_ratio = 4,
+	.hscl_mults = 4,
+	.vscl_mults = 4,
+	.max_hscl_taps = 8,
+	.max_vscl_taps = 8,
+	.dispclk_ramp_margin_percent = 1,
+	.underscan_factor = 1.10,
+	.min_vblank_lines = 14,
+	.dppclk_delay_subtotal = 90,
+	.dispclk_delay_subtotal = 42,
+	.dcfclk_cstate_latency = 10,
+	.max_inter_dcn_tile_repeaters = 8,
+	.can_vstartup_lines_exceed_vsync_plus_back_porch_lines_minus_one = 0,
+	.bug_forcing_LC_req_same_size_fixed = 0,
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn1_0_soc = {
+	.sr_exit_time_us = 9.0,
+	.sr_enter_plus_exit_time_us = 11.0,
+	.urgent_latency_us = 4.0,
+	.writeback_latency_us = 12.0,
+	.ideal_dram_bw_after_urgent_percent = 80.0,
+	.max_request_size_bytes = 256,
+	.downspread_percent = 0.5,
+	.dram_page_open_time_ns = 50.0,
+	.dram_rw_turnaround_time_ns = 17.5,
+	.dram_return_buffer_per_channel_bytes = 8192,
+	.round_trip_ping_latency_dcfclk_cycles = 128,
+	.urgent_out_of_order_return_per_channel_bytes = 256,
+	.channel_interleave_bytes = 256,
+	.num_banks = 8,
+	.num_chans = 2,
+	.vmm_page_size_bytes = 4096,
+	.dram_clock_change_latency_us = 17.0,
+	.writeback_dram_clock_change_latency_us = 23.0,
+	.return_bus_width_bytes = 64,
+};
+
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h
new file mode 100644
index 000000000000..e74ed4b4ce5b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
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
+#ifndef __DCN10_FPU_H__
+#define __DCN10_FPU_H__
+
+#endif /* __DCN20_FPU_H__ */
-- 
2.34.1


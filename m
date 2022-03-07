Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C02644D0355
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Mar 2022 16:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4F810E063;
	Mon,  7 Mar 2022 15:48:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1112710E052;
 Mon,  7 Mar 2022 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SUYyjzJa+Ccqw8POIwaRZM01873mllmmbE+fQkBB8Mk=; b=eMIVIH1+qSZtUy81y54xdnprS1
 /EdxKG82Th/BKZ2WZNVTRFzDlCmGKvPMqwTTUL4AGVx6YrqVndX6A2plLio91WFMgHbWTy+hoE4RW
 H6qjTYR9rlZdx1eDd5hQlG/1RHOQ00iHZmkntL6ZAKRJyMBWzsPBTlUcu8y/ZBxhGuZi84N4SyNOt
 9ulRXrp/LCh/jPllNPsRpTCgf7lQmR/lHBOlibCLglKemeFWuV2yofCzD9Eq9jrU0kovzD4phRtPh
 Jt8fa8fsfy0BnOvfFb8iCeHHGKvz5R4IXM/MZIIC1Tl0DTECjvhlpBm62XhecoERqfBEd5A8RUa10
 wpJMEIWA==;
Received: from [192.168.12.191] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nRFaw-0002rG-OK; Mon, 07 Mar 2022 16:48:22 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/3] drm/amd/display: move FPU related code from dcn315 to
 dml/dcn31 folder
Date: Mon,  7 Mar 2022 14:48:00 -0100
Message-Id: <20220307154801.2196284-3-mwen@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307154801.2196284-1-mwen@igalia.com>
References: <20220307154801.2196284-1-mwen@igalia.com>
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

Moves related structs and dcn315_update_bw_bounding_box from dcn315
driver code to dml/dcn31_fpu that centralizes FPU code for DCN 3.1x.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/dcn315/Makefile    |  26 --
 .../amd/display/dc/dcn315/dcn315_resource.c   | 232 +-----------------
 .../amd/display/dc/dcn315/dcn315_resource.h   |   3 +
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  | 228 +++++++++++++++++
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  |   3 +
 5 files changed, 235 insertions(+), 257 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
index c831ad46e81c..59381d24800b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
@@ -25,32 +25,6 @@
 
 DCN315 = dcn315_resource.o
 
-ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -msse
-endif
-
-ifdef CONFIG_PPC64
-CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -mhard-float -maltivec
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)
-IS_OLD_GCC = 1
-endif
-CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o += -mhard-float
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o += -mpreferred-stack-boundary=4
-else
-CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o += -msse2
-endif
-endif
-
 AMD_DAL_DCN315 = $(addprefix $(AMDDALPATH)/dc/dcn315/,$(DCN315))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN315)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
index 756fec81b9ad..51a712958dbd 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
@@ -66,6 +66,7 @@
 #include "virtual/virtual_stream_encoder.h"
 #include "dce110/dce110_resource.h"
 #include "dml/display_mode_vba.h"
+#include "dml/dcn31/dcn31_fpu.h"
 #include "dcn31/dcn31_dccg.h"
 #include "dcn10/dcn10_resource.h"
 #include "dcn31/dcn31_panel_cntl.h"
@@ -133,158 +134,9 @@
 
 #include "link_enc_cfg.h"
 
-#define DC_LOGGER_INIT(logger)
-
-#define DCN3_15_DEFAULT_DET_SIZE 192
 #define DCN3_15_MAX_DET_SIZE 384
-#define DCN3_15_MIN_COMPBUF_SIZE_KB 128
 #define DCN3_15_CRB_SEGMENT_SIZE_KB 64
 
-struct _vcs_dpi_ip_params_st dcn3_15_ip = {
-	.gpuvm_enable = 1,
-	.gpuvm_max_page_table_levels = 1,
-	.hostvm_enable = 1,
-	.hostvm_max_page_table_levels = 2,
-	.rob_buffer_size_kbytes = 64,
-	.det_buffer_size_kbytes = DCN3_15_DEFAULT_DET_SIZE,
-	.min_comp_buffer_size_kbytes = DCN3_15_MIN_COMPBUF_SIZE_KB,
-	.config_return_buffer_size_in_kbytes = 1024,
-	.compressed_buffer_segment_size_in_kbytes = 64,
-	.meta_fifo_size_in_kentries = 32,
-	.zero_size_buffer_entries = 512,
-	.compbuf_reserved_space_64b = 256,
-	.compbuf_reserved_space_zs = 64,
-	.dpp_output_buffer_pixels = 2560,
-	.opp_output_buffer_lines = 1,
-	.pixel_chunk_size_kbytes = 8,
-	.meta_chunk_size_kbytes = 2,
-	.min_meta_chunk_size_bytes = 256,
-	.writeback_chunk_size_kbytes = 8,
-	.ptoi_supported = false,
-	.num_dsc = 3,
-	.maximum_dsc_bits_per_component = 10,
-	.dsc422_native_support = false,
-	.is_line_buffer_bpp_fixed = true,
-	.line_buffer_fixed_bpp = 49,
-	.line_buffer_size_bits = 789504,
-	.max_line_buffer_lines = 12,
-	.writeback_interface_buffer_size_kbytes = 90,
-	.max_num_dpp = 4,
-	.max_num_otg = 4,
-	.max_num_hdmi_frl_outputs = 1,
-	.max_num_wb = 1,
-	.max_dchub_pscl_bw_pix_per_clk = 4,
-	.max_pscl_lb_bw_pix_per_clk = 2,
-	.max_lb_vscl_bw_pix_per_clk = 4,
-	.max_vscl_hscl_bw_pix_per_clk = 4,
-	.max_hscl_ratio = 6,
-	.max_vscl_ratio = 6,
-	.max_hscl_taps = 8,
-	.max_vscl_taps = 8,
-	.dpte_buffer_size_in_pte_reqs_luma = 64,
-	.dpte_buffer_size_in_pte_reqs_chroma = 34,
-	.dispclk_ramp_margin_percent = 1,
-	.max_inter_dcn_tile_repeaters = 9,
-	.cursor_buffer_size = 16,
-	.cursor_chunk_size = 2,
-	.writeback_line_buffer_buffer_size = 0,
-	.writeback_min_hscl_ratio = 1,
-	.writeback_min_vscl_ratio = 1,
-	.writeback_max_hscl_ratio = 1,
-	.writeback_max_vscl_ratio = 1,
-	.writeback_max_hscl_taps = 1,
-	.writeback_max_vscl_taps = 1,
-	.dppclk_delay_subtotal = 46,
-	.dppclk_delay_scl = 50,
-	.dppclk_delay_scl_lb_only = 16,
-	.dppclk_delay_cnvc_formatter = 27,
-	.dppclk_delay_cnvc_cursor = 6,
-	.dispclk_delay_subtotal = 119,
-	.dynamic_metadata_vm_enabled = false,
-	.odm_combine_4to1_supported = false,
-	.dcc_supported = true,
-};
-
-struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc = {
-		/*TODO: correct dispclk/dppclk voltage level determination*/
-	.clock_limits = {
-		{
-			.state = 0,
-			.dispclk_mhz = 1372.0,
-			.dppclk_mhz = 1372.0,
-			.phyclk_mhz = 810.0,
-			.phyclk_d18_mhz = 667.0,
-			.dscclk_mhz = 417.0,
-			.dtbclk_mhz = 600.0,
-		},
-		{
-			.state = 1,
-			.dispclk_mhz = 1372.0,
-			.dppclk_mhz = 1372.0,
-			.phyclk_mhz = 810.0,
-			.phyclk_d18_mhz = 667.0,
-			.dscclk_mhz = 417.0,
-			.dtbclk_mhz = 600.0,
-		},
-		{
-			.state = 2,
-			.dispclk_mhz = 1372.0,
-			.dppclk_mhz = 1372.0,
-			.phyclk_mhz = 810.0,
-			.phyclk_d18_mhz = 667.0,
-			.dscclk_mhz = 417.0,
-			.dtbclk_mhz = 600.0,
-		},
-		{
-			.state = 3,
-			.dispclk_mhz = 1372.0,
-			.dppclk_mhz = 1372.0,
-			.phyclk_mhz = 810.0,
-			.phyclk_d18_mhz = 667.0,
-			.dscclk_mhz = 417.0,
-			.dtbclk_mhz = 600.0,
-		},
-		{
-			.state = 4,
-			.dispclk_mhz = 1372.0,
-			.dppclk_mhz = 1372.0,
-			.phyclk_mhz = 810.0,
-			.phyclk_d18_mhz = 667.0,
-			.dscclk_mhz = 417.0,
-			.dtbclk_mhz = 600.0,
-		},
-	},
-	.num_states = 5,
-	.sr_exit_time_us = 9.0,
-	.sr_enter_plus_exit_time_us = 11.0,
-	.sr_exit_z8_time_us = 50.0,
-	.sr_enter_plus_exit_z8_time_us = 50.0,
-	.writeback_latency_us = 12.0,
-	.dram_channel_width_bytes = 4,
-	.round_trip_ping_latency_dcfclk_cycles = 106,
-	.urgent_latency_pixel_data_only_us = 4.0,
-	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
-	.urgent_latency_vm_data_only_us = 4.0,
-	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
-	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
-	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
-	.pct_ideal_sdp_bw_after_urgent = 80.0,
-	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 65.0,
-	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0,
-	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 30.0,
-	.max_avg_sdp_bw_use_normal_percent = 60.0,
-	.max_avg_dram_bw_use_normal_percent = 60.0,
-	.fabric_datapath_to_dcn_data_return_bytes = 32,
-	.return_bus_width_bytes = 64,
-	.downspread_percent = 0.38,
-	.dcn_downspread_percent = 0.38,
-	.gpuvm_min_page_size_bytes = 4096,
-	.hostvm_min_page_size_bytes = 4096,
-	.do_urgent_latency_adjustment = false,
-	.urgent_latency_adjustment_fabric_clock_component_us = 0,
-	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
-};
-
 enum dcn31_clk_src_array_id {
 	DCN31_CLK_SRC_PLL0,
 	DCN31_CLK_SRC_PLL1,
@@ -1859,88 +1711,6 @@ static struct dc_cap_funcs cap_funcs = {
 	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
 };
 
-static void dcn315_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
-{
-	struct clk_limit_table *clk_table = &bw_params->clk_table;
-	struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
-	unsigned int i, closest_clk_lvl;
-	int max_dispclk_mhz = 0, max_dppclk_mhz = 0;
-	int j;
-
-	// Default clock levels are used for diags, which may lead to overclocking.
-	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
-
-		dcn3_15_ip.max_num_otg = dc->res_pool->res_cap->num_timing_generator;
-		dcn3_15_ip.max_num_dpp = dc->res_pool->pipe_count;
-		dcn3_15_soc.num_chans = bw_params->num_channels;
-
-		ASSERT(clk_table->num_entries);
-
-		/* Prepass to find max clocks independent of voltage level. */
-		for (i = 0; i < clk_table->num_entries; ++i) {
-			if (clk_table->entries[i].dispclk_mhz > max_dispclk_mhz)
-				max_dispclk_mhz = clk_table->entries[i].dispclk_mhz;
-			if (clk_table->entries[i].dppclk_mhz > max_dppclk_mhz)
-				max_dppclk_mhz = clk_table->entries[i].dppclk_mhz;
-		}
-
-		for (i = 0; i < clk_table->num_entries; i++) {
-			/* loop backwards*/
-			for (closest_clk_lvl = 0, j = dcn3_15_soc.num_states - 1; j >= 0; j--) {
-				if ((unsigned int) dcn3_15_soc.clock_limits[j].dcfclk_mhz <= clk_table->entries[i].dcfclk_mhz) {
-					closest_clk_lvl = j;
-					break;
-				}
-			}
-			if (clk_table->num_entries == 1) {
-				/*smu gives one DPM level, let's take the highest one*/
-				closest_clk_lvl = dcn3_15_soc.num_states - 1;
-			}
-
-			clock_limits[i].state = i;
-
-			/* Clocks dependent on voltage level. */
-			clock_limits[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
-			if (clk_table->num_entries == 1 &&
-				clock_limits[i].dcfclk_mhz < dcn3_15_soc.clock_limits[closest_clk_lvl].dcfclk_mhz) {
-				/*SMU fix not released yet*/
-				clock_limits[i].dcfclk_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].dcfclk_mhz;
-			}
-			clock_limits[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
-			clock_limits[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
-			clock_limits[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2 * clk_table->entries[i].wck_ratio;
-
-			/* Clocks independent of voltage level. */
-			clock_limits[i].dispclk_mhz = max_dispclk_mhz ? max_dispclk_mhz :
-				dcn3_15_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
-
-			clock_limits[i].dppclk_mhz = max_dppclk_mhz ? max_dppclk_mhz :
-				dcn3_15_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
-
-			clock_limits[i].dram_bw_per_chan_gbps = dcn3_15_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
-			clock_limits[i].dscclk_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
-			clock_limits[i].dtbclk_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
-			clock_limits[i].phyclk_d18_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
-			clock_limits[i].phyclk_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
-		}
-		for (i = 0; i < clk_table->num_entries; i++)
-			dcn3_15_soc.clock_limits[i] = clock_limits[i];
-		if (clk_table->num_entries) {
-			dcn3_15_soc.num_states = clk_table->num_entries;
-		}
-	}
-
-	if (max_dispclk_mhz) {
-		dcn3_15_soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
-		dc->dml.soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
-	}
-
-	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
-		dml_init_instance(&dc->dml, &dcn3_15_soc, &dcn3_15_ip, DML_PROJECT_DCN31);
-	else
-		dml_init_instance(&dc->dml, &dcn3_15_soc, &dcn3_15_ip, DML_PROJECT_DCN31_FPGA);
-}
-
 static struct resource_funcs dcn315_res_pool_funcs = {
 	.destroy = dcn315_destroy_resource_pool,
 	.link_enc_create = dcn31_link_encoder_create,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
index f3a36820a31f..39929fa67a51 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
@@ -31,6 +31,9 @@
 #define TO_DCN315_RES_POOL(pool)\
 	container_of(pool, struct dcn315_resource_pool, base)
 
+extern struct _vcs_dpi_ip_params_st dcn3_15_ip;
+extern struct _vcs_dpi_ip_params_st dcn3_15_soc;
+
 struct dcn315_resource_pool {
 	struct resource_pool base;
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index 7ff8fe9e8712..f70b47ef850c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -194,6 +194,150 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_1_soc = {
 	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
 };
 
+struct _vcs_dpi_ip_params_st dcn3_15_ip = {
+	.gpuvm_enable = 1,
+	.gpuvm_max_page_table_levels = 1,
+	.hostvm_enable = 1,
+	.hostvm_max_page_table_levels = 2,
+	.rob_buffer_size_kbytes = 64,
+	.det_buffer_size_kbytes = DCN3_15_DEFAULT_DET_SIZE,
+	.min_comp_buffer_size_kbytes = DCN3_15_MIN_COMPBUF_SIZE_KB,
+	.config_return_buffer_size_in_kbytes = 1024,
+	.compressed_buffer_segment_size_in_kbytes = 64,
+	.meta_fifo_size_in_kentries = 32,
+	.zero_size_buffer_entries = 512,
+	.compbuf_reserved_space_64b = 256,
+	.compbuf_reserved_space_zs = 64,
+	.dpp_output_buffer_pixels = 2560,
+	.opp_output_buffer_lines = 1,
+	.pixel_chunk_size_kbytes = 8,
+	.meta_chunk_size_kbytes = 2,
+	.min_meta_chunk_size_bytes = 256,
+	.writeback_chunk_size_kbytes = 8,
+	.ptoi_supported = false,
+	.num_dsc = 3,
+	.maximum_dsc_bits_per_component = 10,
+	.dsc422_native_support = false,
+	.is_line_buffer_bpp_fixed = true,
+	.line_buffer_fixed_bpp = 49,
+	.line_buffer_size_bits = 789504,
+	.max_line_buffer_lines = 12,
+	.writeback_interface_buffer_size_kbytes = 90,
+	.max_num_dpp = 4,
+	.max_num_otg = 4,
+	.max_num_hdmi_frl_outputs = 1,
+	.max_num_wb = 1,
+	.max_dchub_pscl_bw_pix_per_clk = 4,
+	.max_pscl_lb_bw_pix_per_clk = 2,
+	.max_lb_vscl_bw_pix_per_clk = 4,
+	.max_vscl_hscl_bw_pix_per_clk = 4,
+	.max_hscl_ratio = 6,
+	.max_vscl_ratio = 6,
+	.max_hscl_taps = 8,
+	.max_vscl_taps = 8,
+	.dpte_buffer_size_in_pte_reqs_luma = 64,
+	.dpte_buffer_size_in_pte_reqs_chroma = 34,
+	.dispclk_ramp_margin_percent = 1,
+	.max_inter_dcn_tile_repeaters = 9,
+	.cursor_buffer_size = 16,
+	.cursor_chunk_size = 2,
+	.writeback_line_buffer_buffer_size = 0,
+	.writeback_min_hscl_ratio = 1,
+	.writeback_min_vscl_ratio = 1,
+	.writeback_max_hscl_ratio = 1,
+	.writeback_max_vscl_ratio = 1,
+	.writeback_max_hscl_taps = 1,
+	.writeback_max_vscl_taps = 1,
+	.dppclk_delay_subtotal = 46,
+	.dppclk_delay_scl = 50,
+	.dppclk_delay_scl_lb_only = 16,
+	.dppclk_delay_cnvc_formatter = 27,
+	.dppclk_delay_cnvc_cursor = 6,
+	.dispclk_delay_subtotal = 119,
+	.dynamic_metadata_vm_enabled = false,
+	.odm_combine_4to1_supported = false,
+	.dcc_supported = true,
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc = {
+		/*TODO: correct dispclk/dppclk voltage level determination*/
+	.clock_limits = {
+		{
+			.state = 0,
+			.dispclk_mhz = 1372.0,
+			.dppclk_mhz = 1372.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 417.0,
+			.dtbclk_mhz = 600.0,
+		},
+		{
+			.state = 1,
+			.dispclk_mhz = 1372.0,
+			.dppclk_mhz = 1372.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 417.0,
+			.dtbclk_mhz = 600.0,
+		},
+		{
+			.state = 2,
+			.dispclk_mhz = 1372.0,
+			.dppclk_mhz = 1372.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 417.0,
+			.dtbclk_mhz = 600.0,
+		},
+		{
+			.state = 3,
+			.dispclk_mhz = 1372.0,
+			.dppclk_mhz = 1372.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 417.0,
+			.dtbclk_mhz = 600.0,
+		},
+		{
+			.state = 4,
+			.dispclk_mhz = 1372.0,
+			.dppclk_mhz = 1372.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 417.0,
+			.dtbclk_mhz = 600.0,
+		},
+	},
+	.num_states = 5,
+	.sr_exit_time_us = 9.0,
+	.sr_enter_plus_exit_time_us = 11.0,
+	.sr_exit_z8_time_us = 50.0,
+	.sr_enter_plus_exit_z8_time_us = 50.0,
+	.writeback_latency_us = 12.0,
+	.dram_channel_width_bytes = 4,
+	.round_trip_ping_latency_dcfclk_cycles = 106,
+	.urgent_latency_pixel_data_only_us = 4.0,
+	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+	.urgent_latency_vm_data_only_us = 4.0,
+	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+	.pct_ideal_sdp_bw_after_urgent = 80.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 65.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 30.0,
+	.max_avg_sdp_bw_use_normal_percent = 60.0,
+	.max_avg_dram_bw_use_normal_percent = 60.0,
+	.fabric_datapath_to_dcn_data_return_bytes = 32,
+	.return_bus_width_bytes = 64,
+	.downspread_percent = 0.38,
+	.dcn_downspread_percent = 0.38,
+	.gpuvm_min_page_size_bytes = 4096,
+	.hostvm_min_page_size_bytes = 4096,
+	.do_urgent_latency_adjustment = false,
+	.urgent_latency_adjustment_fabric_clock_component_us = 0,
+	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
+};
 
 void dcn31_calculate_wm_and_dlg_fp(
 		struct dc *dc, struct dc_state *context,
@@ -404,3 +548,87 @@ void dcn31_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 	else
 		dml_init_instance(&dc->dml, &dcn3_1_soc, &dcn3_1_ip, DML_PROJECT_DCN31_FPGA);
 }
+
+void dcn315_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
+{
+	struct clk_limit_table *clk_table = &bw_params->clk_table;
+	struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
+	unsigned int i, closest_clk_lvl;
+	int max_dispclk_mhz = 0, max_dppclk_mhz = 0;
+	int j;
+
+	dc_assert_fp_enabled();
+
+	// Default clock levels are used for diags, which may lead to overclocking.
+	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
+
+		dcn3_15_ip.max_num_otg = dc->res_pool->res_cap->num_timing_generator;
+		dcn3_15_ip.max_num_dpp = dc->res_pool->pipe_count;
+		dcn3_15_soc.num_chans = bw_params->num_channels;
+
+		ASSERT(clk_table->num_entries);
+
+		/* Prepass to find max clocks independent of voltage level. */
+		for (i = 0; i < clk_table->num_entries; ++i) {
+			if (clk_table->entries[i].dispclk_mhz > max_dispclk_mhz)
+				max_dispclk_mhz = clk_table->entries[i].dispclk_mhz;
+			if (clk_table->entries[i].dppclk_mhz > max_dppclk_mhz)
+				max_dppclk_mhz = clk_table->entries[i].dppclk_mhz;
+		}
+
+		for (i = 0; i < clk_table->num_entries; i++) {
+			/* loop backwards*/
+			for (closest_clk_lvl = 0, j = dcn3_15_soc.num_states - 1; j >= 0; j--) {
+				if ((unsigned int) dcn3_15_soc.clock_limits[j].dcfclk_mhz <= clk_table->entries[i].dcfclk_mhz) {
+					closest_clk_lvl = j;
+					break;
+				}
+			}
+			if (clk_table->num_entries == 1) {
+				/*smu gives one DPM level, let's take the highest one*/
+				closest_clk_lvl = dcn3_15_soc.num_states - 1;
+			}
+
+			clock_limits[i].state = i;
+
+			/* Clocks dependent on voltage level. */
+			clock_limits[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
+			if (clk_table->num_entries == 1 &&
+				clock_limits[i].dcfclk_mhz < dcn3_15_soc.clock_limits[closest_clk_lvl].dcfclk_mhz) {
+				/*SMU fix not released yet*/
+				clock_limits[i].dcfclk_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].dcfclk_mhz;
+			}
+			clock_limits[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
+			clock_limits[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
+			clock_limits[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2 * clk_table->entries[i].wck_ratio;
+
+			/* Clocks independent of voltage level. */
+			clock_limits[i].dispclk_mhz = max_dispclk_mhz ? max_dispclk_mhz :
+				dcn3_15_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
+
+			clock_limits[i].dppclk_mhz = max_dppclk_mhz ? max_dppclk_mhz :
+				dcn3_15_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
+
+			clock_limits[i].dram_bw_per_chan_gbps = dcn3_15_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
+			clock_limits[i].dscclk_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
+			clock_limits[i].dtbclk_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
+			clock_limits[i].phyclk_d18_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
+			clock_limits[i].phyclk_mhz = dcn3_15_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
+		}
+		for (i = 0; i < clk_table->num_entries; i++)
+			dcn3_15_soc.clock_limits[i] = clock_limits[i];
+		if (clk_table->num_entries) {
+			dcn3_15_soc.num_states = clk_table->num_entries;
+		}
+	}
+
+	if (max_dispclk_mhz) {
+		dcn3_15_soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
+		dc->dml.soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
+	}
+
+	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
+		dml_init_instance(&dc->dml, &dcn3_15_soc, &dcn3_15_ip, DML_PROJECT_DCN31);
+	else
+		dml_init_instance(&dc->dml, &dcn3_15_soc, &dcn3_15_ip, DML_PROJECT_DCN31_FPGA);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
index baadb5150e7d..b15b587cf8c4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
@@ -27,6 +27,8 @@
 #define __DCN31_FPU_H__
 
 #define DCN3_1_DEFAULT_DET_SIZE 384
+#define DCN3_15_DEFAULT_DET_SIZE 192
+#define DCN3_15_MIN_COMPBUF_SIZE_KB 128
 
 void dcn31_calculate_wm_and_dlg_fp(
 		struct dc *dc, struct dc_state *context,
@@ -35,5 +37,6 @@ void dcn31_calculate_wm_and_dlg_fp(
 		int vlevel);
 
 void dcn31_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params);
+void dcn315_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params);
 
 #endif /* __DCN31_FPU_H__*/
-- 
2.34.1


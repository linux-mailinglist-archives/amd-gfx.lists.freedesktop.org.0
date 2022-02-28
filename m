Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E3C4C7B6A
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Feb 2022 22:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AD510E442;
	Mon, 28 Feb 2022 21:11:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20D610E442;
 Mon, 28 Feb 2022 21:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vFXJVU/zkUlvWZ15xcOen8+g6QF5if2TYI4v/ng6ZkQ=; b=iyaXGiXUD04oqZrIYyem791UAj
 gEnbaEzEppTEOadZpvCUpeXm9kdRSOuY5BhOzEx3oHUlZCML2Ph0o3SrCAyQcfdhfvwqs2Hqt4qsk
 T+CfKLPMEkigRVcimAV+fNRohGqKD1SjWp1Ke7I8KtLd+KL6tCnBELreEdyR/zsYrwafUrPw5yFf9
 wRjFwYYySZB2+U8twZv01RI8LPZY+UvvZamknqot+fbVgh3FmbJ8OCXY7KYBY+qOfDcvzwJh+igGl
 BH7gWCPfXrn1//T9GXOSiERaB5DhpmJuKRR/BURxSejf6/98HbWCzAeZhG8QR6/fEx8uz5+VzFLQC
 augarS5g==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nOnIv-000CFy-Ao; Mon, 28 Feb 2022 22:11:37 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/2] drm/amd/display: move FPU operations from dcn21 to
 dml/dcn20 folder
Date: Mon, 28 Feb 2022 20:10:46 -0100
Message-Id: <20220228211047.3957945-2-mwen@igalia.com>
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

dml/dcn20_fpu file centralizes all DCN2x functions that require FPU access.
Therefore, this patch moves FPU-related code from dcn21 to dcn20_fpu. These
include:
- dcn21_populate_dml_pipes_from_context()
- dcn21_validate_bandwidth_fp() and related:
  - dcn21_calculate_wm(),
  - patch_bounding_box(),
  - calculate_wm_set_for_vlevel()
- renaming update_bw_bounding_box() to dcn21_update_bw_bounding_box(), move
to dcn20_fpu with related static function construct_low_pstate_lvl()

Also, make dcn21_fast_validate_bw() public in dcn21_resource as it is called
by dcn21_validate_bandwidth_fp() now in dcn20_fpu.

Reuse dcn20_fpu_adjust_dppclk() in dcn21_fast_validate_bw() as it isolates
the same FPU operation.

Include dchubbub.h as it is required in dcn21_populate_dml_pipes_from_context()

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile |  25 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c | 566 +-----------------
 .../drm/amd/display/dc/dcn21/dcn21_resource.h |  11 +
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 538 ++++++++++++++++-
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.h  |   9 +
 5 files changed, 571 insertions(+), 578 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
index bb8c95141082..0dc06e428999 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
@@ -5,31 +5,6 @@
 DCN21 = dcn21_init.o dcn21_hubp.o dcn21_hubbub.o dcn21_resource.o \
 	 dcn21_hwseq.o dcn21_link_encoder.o dcn21_dccg.o
 
-ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mhard-float -msse
-endif
-
-ifdef CONFIG_PPC64
-CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mhard-float -maltivec
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)
-IS_OLD_GCC = 1
-endif
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o += -mpreferred-stack-boundary=4
-else
-CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o += -msse2
-endif
-endif
-
 AMD_DAL_DCN21 = $(addprefix $(AMDDALPATH)/dc/dcn21/,$(DCN21))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN21)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index c1cd1a8ff1d7..612732656772 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -34,6 +34,7 @@
 #include "resource.h"
 #include "include/irq_service_interface.h"
 #include "dcn20/dcn20_resource.h"
+#include "dcn21/dcn21_resource.h"
 
 #include "dml/dcn20/dcn20_fpu.h"
 
@@ -89,230 +90,6 @@
 #include "dce/dmub_psr.h"
 #include "dce/dmub_abm.h"
 
-#define DC_LOGGER_INIT(logger)
-
-
-struct _vcs_dpi_ip_params_st dcn2_1_ip = {
-	.odm_capable = 1,
-	.gpuvm_enable = 1,
-	.hostvm_enable = 1,
-	.gpuvm_max_page_table_levels = 1,
-	.hostvm_max_page_table_levels = 4,
-	.hostvm_cached_page_table_levels = 2,
-	.num_dsc = 3,
-	.rob_buffer_size_kbytes = 168,
-	.det_buffer_size_kbytes = 164,
-	.dpte_buffer_size_in_pte_reqs_luma = 44,
-	.dpte_buffer_size_in_pte_reqs_chroma = 42,//todo
-	.dpp_output_buffer_pixels = 2560,
-	.opp_output_buffer_lines = 1,
-	.pixel_chunk_size_kbytes = 8,
-	.pte_enable = 1,
-	.max_page_table_levels = 4,
-	.pte_chunk_size_kbytes = 2,
-	.meta_chunk_size_kbytes = 2,
-	.min_meta_chunk_size_bytes = 256,
-	.writeback_chunk_size_kbytes = 2,
-	.line_buffer_size_bits = 789504,
-	.is_line_buffer_bpp_fixed = 0,
-	.line_buffer_fixed_bpp = 0,
-	.dcc_supported = true,
-	.max_line_buffer_lines = 12,
-	.writeback_luma_buffer_size_kbytes = 12,
-	.writeback_chroma_buffer_size_kbytes = 8,
-	.writeback_chroma_line_buffer_width_pixels = 4,
-	.writeback_max_hscl_ratio = 1,
-	.writeback_max_vscl_ratio = 1,
-	.writeback_min_hscl_ratio = 1,
-	.writeback_min_vscl_ratio = 1,
-	.writeback_max_hscl_taps = 12,
-	.writeback_max_vscl_taps = 12,
-	.writeback_line_buffer_luma_buffer_size = 0,
-	.writeback_line_buffer_chroma_buffer_size = 14643,
-	.cursor_buffer_size = 8,
-	.cursor_chunk_size = 2,
-	.max_num_otg = 4,
-	.max_num_dpp = 4,
-	.max_num_wb = 1,
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
-	.min_vblank_lines = 32, //
-	.dppclk_delay_subtotal = 77, //
-	.dppclk_delay_scl_lb_only = 16,
-	.dppclk_delay_scl = 50,
-	.dppclk_delay_cnvc_formatter = 8,
-	.dppclk_delay_cnvc_cursor = 6,
-	.dispclk_delay_subtotal = 87, //
-	.dcfclk_cstate_latency = 10, // SRExitTime
-	.max_inter_dcn_tile_repeaters = 8,
-
-	.xfc_supported = false,
-	.xfc_fill_bw_overhead_percent = 10.0,
-	.xfc_fill_constant_bytes = 0,
-	.ptoi_supported = 0,
-	.number_of_cursors = 1,
-};
-
-struct _vcs_dpi_soc_bounding_box_st dcn2_1_soc = {
-	.clock_limits = {
-			{
-				.state = 0,
-				.dcfclk_mhz = 400.0,
-				.fabricclk_mhz = 400.0,
-				.dispclk_mhz = 600.0,
-				.dppclk_mhz = 400.00,
-				.phyclk_mhz = 600.0,
-				.socclk_mhz = 278.0,
-				.dscclk_mhz = 205.67,
-				.dram_speed_mts = 1600.0,
-			},
-			{
-				.state = 1,
-				.dcfclk_mhz = 464.52,
-				.fabricclk_mhz = 800.0,
-				.dispclk_mhz = 654.55,
-				.dppclk_mhz = 626.09,
-				.phyclk_mhz = 600.0,
-				.socclk_mhz = 278.0,
-				.dscclk_mhz = 205.67,
-				.dram_speed_mts = 1600.0,
-			},
-			{
-				.state = 2,
-				.dcfclk_mhz = 514.29,
-				.fabricclk_mhz = 933.0,
-				.dispclk_mhz = 757.89,
-				.dppclk_mhz = 685.71,
-				.phyclk_mhz = 600.0,
-				.socclk_mhz = 278.0,
-				.dscclk_mhz = 287.67,
-				.dram_speed_mts = 1866.0,
-			},
-			{
-				.state = 3,
-				.dcfclk_mhz = 576.00,
-				.fabricclk_mhz = 1067.0,
-				.dispclk_mhz = 847.06,
-				.dppclk_mhz = 757.89,
-				.phyclk_mhz = 600.0,
-				.socclk_mhz = 715.0,
-				.dscclk_mhz = 318.334,
-				.dram_speed_mts = 2134.0,
-			},
-			{
-				.state = 4,
-				.dcfclk_mhz = 626.09,
-				.fabricclk_mhz = 1200.0,
-				.dispclk_mhz = 900.00,
-				.dppclk_mhz = 847.06,
-				.phyclk_mhz = 810.0,
-				.socclk_mhz = 953.0,
-				.dscclk_mhz = 489.0,
-				.dram_speed_mts = 2400.0,
-			},
-			{
-				.state = 5,
-				.dcfclk_mhz = 685.71,
-				.fabricclk_mhz = 1333.0,
-				.dispclk_mhz = 1028.57,
-				.dppclk_mhz = 960.00,
-				.phyclk_mhz = 810.0,
-				.socclk_mhz = 278.0,
-				.dscclk_mhz = 287.67,
-				.dram_speed_mts = 2666.0,
-			},
-			{
-				.state = 6,
-				.dcfclk_mhz = 757.89,
-				.fabricclk_mhz = 1467.0,
-				.dispclk_mhz = 1107.69,
-				.dppclk_mhz = 1028.57,
-				.phyclk_mhz = 810.0,
-				.socclk_mhz = 715.0,
-				.dscclk_mhz = 318.334,
-				.dram_speed_mts = 3200.0,
-			},
-			{
-				.state = 7,
-				.dcfclk_mhz = 847.06,
-				.fabricclk_mhz = 1600.0,
-				.dispclk_mhz = 1395.0,
-				.dppclk_mhz = 1285.00,
-				.phyclk_mhz = 1325.0,
-				.socclk_mhz = 953.0,
-				.dscclk_mhz = 489.0,
-				.dram_speed_mts = 4266.0,
-			},
-			/*Extra state, no dispclk ramping*/
-			{
-				.state = 8,
-				.dcfclk_mhz = 847.06,
-				.fabricclk_mhz = 1600.0,
-				.dispclk_mhz = 1395.0,
-				.dppclk_mhz = 1285.0,
-				.phyclk_mhz = 1325.0,
-				.socclk_mhz = 953.0,
-				.dscclk_mhz = 489.0,
-				.dram_speed_mts = 4266.0,
-			},
-
-		},
-
-	.sr_exit_time_us = 12.5,
-	.sr_enter_plus_exit_time_us = 17.0,
-	.urgent_latency_us = 4.0,
-	.urgent_latency_pixel_data_only_us = 4.0,
-	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
-	.urgent_latency_vm_data_only_us = 4.0,
-	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
-	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
-	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
-	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 80.0,
-	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 75.0,
-	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 40.0,
-	.max_avg_sdp_bw_use_normal_percent = 60.0,
-	.max_avg_dram_bw_use_normal_percent = 100.0,
-	.writeback_latency_us = 12.0,
-	.max_request_size_bytes = 256,
-	.dram_channel_width_bytes = 4,
-	.fabric_datapath_to_dcn_data_return_bytes = 32,
-	.dcn_downspread_percent = 0.5,
-	.downspread_percent = 0.38,
-	.dram_page_open_time_ns = 50.0,
-	.dram_rw_turnaround_time_ns = 17.5,
-	.dram_return_buffer_per_channel_bytes = 8192,
-	.round_trip_ping_latency_dcfclk_cycles = 128,
-	.urgent_out_of_order_return_per_channel_bytes = 4096,
-	.channel_interleave_bytes = 256,
-	.num_banks = 8,
-	.num_chans = 4,
-	.vmm_page_size_bytes = 4096,
-	.dram_clock_change_latency_us = 23.84,
-	.return_bus_width_bytes = 64,
-	.dispclk_dppclk_vco_speed_mhz = 3600,
-	.xfc_bus_transport_time_us = 4,
-	.xfc_xbuf_latency_tolerance_us = 4,
-	.use_urgent_burst_bw = 1,
-	.num_states = 8
-};
-
-#ifndef MAX
-#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
-#endif
-#ifndef MIN
-#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
-#endif
-
 /* begin *********************
  * macros to expend register list macro defined in HW object header file */
 
@@ -705,12 +482,6 @@ static const struct dcn10_stream_encoder_mask se_mask = {
 
 static void dcn21_pp_smu_destroy(struct pp_smu_funcs **pp_smu);
 
-static int dcn21_populate_dml_pipes_from_context(
-		struct dc *dc,
-		struct dc_state *context,
-		display_e2e_pipe_params_st *pipes,
-		bool fast_validate);
-
 static struct input_pixel_processor *dcn21_ipp_create(
 	struct dc_context *ctx, uint32_t inst)
 {
@@ -1029,163 +800,13 @@ static void dcn21_resource_destruct(struct dcn21_resource_pool *pool)
 		dcn21_pp_smu_destroy(&pool->base.pp_smu);
 }
 
-
-static void calculate_wm_set_for_vlevel(
-		int vlevel,
-		struct wm_range_table_entry *table_entry,
-		struct dcn_watermarks *wm_set,
-		struct display_mode_lib *dml,
-		display_e2e_pipe_params_st *pipes,
-		int pipe_cnt)
-{
-	double dram_clock_change_latency_cached = dml->soc.dram_clock_change_latency_us;
-
-	ASSERT(vlevel < dml->soc.num_states);
-	/* only pipe 0 is read for voltage and dcf/soc clocks */
-	pipes[0].clks_cfg.voltage = vlevel;
-	pipes[0].clks_cfg.dcfclk_mhz = dml->soc.clock_limits[vlevel].dcfclk_mhz;
-	pipes[0].clks_cfg.socclk_mhz = dml->soc.clock_limits[vlevel].socclk_mhz;
-
-	dml->soc.dram_clock_change_latency_us = table_entry->pstate_latency_us;
-	dml->soc.sr_exit_time_us = table_entry->sr_exit_time_us;
-	dml->soc.sr_enter_plus_exit_time_us = table_entry->sr_enter_plus_exit_time_us;
-
-	wm_set->urgent_ns = get_wm_urgent(dml, pipes, pipe_cnt) * 1000;
-	wm_set->cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(dml, pipes, pipe_cnt) * 1000;
-	wm_set->cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(dml, pipes, pipe_cnt) * 1000;
-	wm_set->cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(dml, pipes, pipe_cnt) * 1000;
-	wm_set->pte_meta_urgent_ns = get_wm_memory_trip(dml, pipes, pipe_cnt) * 1000;
-	wm_set->frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(dml, pipes, pipe_cnt) * 1000;
-	wm_set->frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(dml, pipes, pipe_cnt) * 1000;
-	wm_set->urgent_latency_ns = get_urgent_latency(dml, pipes, pipe_cnt) * 1000;
-	dml->soc.dram_clock_change_latency_us = dram_clock_change_latency_cached;
-
-}
-
-static void patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_st *bb)
-{
-	int i;
-
-	if (dc->bb_overrides.sr_exit_time_ns) {
-		for (i = 0; i < WM_SET_COUNT; i++) {
-			  dc->clk_mgr->bw_params->wm_table.entries[i].sr_exit_time_us =
-					  dc->bb_overrides.sr_exit_time_ns / 1000.0;
-		}
-	}
-
-	if (dc->bb_overrides.sr_enter_plus_exit_time_ns) {
-		for (i = 0; i < WM_SET_COUNT; i++) {
-			  dc->clk_mgr->bw_params->wm_table.entries[i].sr_enter_plus_exit_time_us =
-					  dc->bb_overrides.sr_enter_plus_exit_time_ns / 1000.0;
-		}
-	}
-
-	if (dc->bb_overrides.urgent_latency_ns) {
-		bb->urgent_latency_us = dc->bb_overrides.urgent_latency_ns / 1000.0;
-	}
-
-	if (dc->bb_overrides.dram_clock_change_latency_ns) {
-		for (i = 0; i < WM_SET_COUNT; i++) {
-			dc->clk_mgr->bw_params->wm_table.entries[i].pstate_latency_us =
-				dc->bb_overrides.dram_clock_change_latency_ns / 1000.0;
-		}
-	}
-}
-
-static void dcn21_calculate_wm(
-		struct dc *dc, struct dc_state *context,
-		display_e2e_pipe_params_st *pipes,
-		int *out_pipe_cnt,
-		int *pipe_split_from,
-		int vlevel_req,
-		bool fast_validate)
-{
-	int pipe_cnt, i, pipe_idx;
-	int vlevel, vlevel_max;
-	struct wm_range_table_entry *table_entry;
-	struct clk_bw_params *bw_params = dc->clk_mgr->bw_params;
-
-	ASSERT(bw_params);
-
-	patch_bounding_box(dc, &context->bw_ctx.dml.soc);
-
-	for (i = 0, pipe_idx = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
-			if (!context->res_ctx.pipe_ctx[i].stream)
-				continue;
-
-			pipes[pipe_cnt].clks_cfg.refclk_mhz = dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000.0;
-			pipes[pipe_cnt].clks_cfg.dispclk_mhz = context->bw_ctx.dml.vba.RequiredDISPCLK[vlevel_req][context->bw_ctx.dml.vba.maxMpcComb];
-
-			if (pipe_split_from[i] < 0) {
-				pipes[pipe_cnt].clks_cfg.dppclk_mhz =
-						context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel_req][context->bw_ctx.dml.vba.maxMpcComb][pipe_idx];
-				if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_idx] == pipe_idx)
-					pipes[pipe_cnt].pipe.dest.odm_combine =
-							context->bw_ctx.dml.vba.ODMCombineEnablePerState[vlevel_req][pipe_idx];
-				else
-					pipes[pipe_cnt].pipe.dest.odm_combine = 0;
-				pipe_idx++;
-			} else {
-				pipes[pipe_cnt].clks_cfg.dppclk_mhz =
-						context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel_req][context->bw_ctx.dml.vba.maxMpcComb][pipe_split_from[i]];
-				if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_split_from[i]] == pipe_split_from[i])
-					pipes[pipe_cnt].pipe.dest.odm_combine =
-							context->bw_ctx.dml.vba.ODMCombineEnablePerState[vlevel_req][pipe_split_from[i]];
-				else
-					pipes[pipe_cnt].pipe.dest.odm_combine = 0;
-			}
-			pipe_cnt++;
-	}
-
-	if (pipe_cnt != pipe_idx) {
-		if (dc->res_pool->funcs->populate_dml_pipes)
-			pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc,
-				context, pipes, fast_validate);
-		else
-			pipe_cnt = dcn21_populate_dml_pipes_from_context(dc,
-				context, pipes, fast_validate);
-	}
-
-	*out_pipe_cnt = pipe_cnt;
-
-	vlevel_max = bw_params->clk_table.num_entries - 1;
-
-
-	/* WM Set D */
-	table_entry = &bw_params->wm_table.entries[WM_D];
-	if (table_entry->wm_type == WM_TYPE_RETRAINING)
-		vlevel = 0;
-	else
-		vlevel = vlevel_max;
-	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.d,
-						&context->bw_ctx.dml, pipes, pipe_cnt);
-	/* WM Set C */
-	table_entry = &bw_params->wm_table.entries[WM_C];
-	vlevel = MIN(MAX(vlevel_req, 3), vlevel_max);
-	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.c,
-						&context->bw_ctx.dml, pipes, pipe_cnt);
-	/* WM Set B */
-	table_entry = &bw_params->wm_table.entries[WM_B];
-	vlevel = MIN(MAX(vlevel_req, 2), vlevel_max);
-	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.b,
-						&context->bw_ctx.dml, pipes, pipe_cnt);
-
-	/* WM Set A */
-	table_entry = &bw_params->wm_table.entries[WM_A];
-	vlevel = MIN(vlevel_req, vlevel_max);
-	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.a,
-						&context->bw_ctx.dml, pipes, pipe_cnt);
-}
-
-
-static bool dcn21_fast_validate_bw(
-		struct dc *dc,
-		struct dc_state *context,
-		display_e2e_pipe_params_st *pipes,
-		int *pipe_cnt_out,
-		int *pipe_split_from,
-		int *vlevel_out,
-		bool fast_validate)
+bool dcn21_fast_validate_bw(struct dc *dc,
+			    struct dc_state *context,
+			    display_e2e_pipe_params_st *pipes,
+			    int *pipe_cnt_out,
+			    int *pipe_split_from,
+			    int *vlevel_out,
+			    bool fast_validate)
 {
 	bool out = false;
 	int split[MAX_PIPES] = { 0 };
@@ -1197,7 +818,9 @@ static bool dcn21_fast_validate_bw(
 
 	dcn20_merge_pipes_for_validate(dc, context);
 
+	DC_FP_START();
 	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
+	DC_FP_END();
 
 	*pipe_cnt_out = pipe_cnt;
 
@@ -1287,7 +910,9 @@ static bool dcn21_fast_validate_bw(
 				hsplit_pipe = dcn20_find_secondary_pipe(dc, &context->res_ctx, dc->res_pool, pipe);
 				ASSERT(hsplit_pipe);
 				if (!hsplit_pipe) {
-					context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb][pipe_idx] *= 2;
+					DC_FP_START();
+					dcn20_fpu_adjust_dppclk(&context->bw_ctx.dml.vba, vlevel, context->bw_ctx.dml.vba.maxMpcComb, pipe_idx, true);
+					DC_FP_END();
 					continue;
 				}
 				if (context->bw_ctx.dml.vba.ODMCombineEnabled[pipe_idx]) {
@@ -1329,63 +954,6 @@ static bool dcn21_fast_validate_bw(
 	return out;
 }
 
-static noinline bool dcn21_validate_bandwidth_fp(struct dc *dc,
-		struct dc_state *context, bool fast_validate)
-{
-	bool out = false;
-
-	BW_VAL_TRACE_SETUP();
-
-	int vlevel = 0;
-	int pipe_split_from[MAX_PIPES];
-	int pipe_cnt = 0;
-	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
-	DC_LOGGER_INIT(dc->ctx->logger);
-
-	BW_VAL_TRACE_COUNT();
-
-	/*Unsafe due to current pipe merge and split logic*/
-	ASSERT(context != dc->current_state);
-
-	out = dcn21_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_split_from, &vlevel, fast_validate);
-
-	if (pipe_cnt == 0)
-		goto validate_out;
-
-	if (!out)
-		goto validate_fail;
-
-	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
-
-	if (fast_validate) {
-		BW_VAL_TRACE_SKIP(fast);
-		goto validate_out;
-	}
-
-	dcn21_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, fast_validate);
-	DC_FP_START();
-	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
-	DC_FP_END();
-
-	BW_VAL_TRACE_END_WATERMARKS();
-
-	goto validate_out;
-
-validate_fail:
-	DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
-		dml_get_status_message(context->bw_ctx.dml.vba.ValidationStatus[context->bw_ctx.dml.vba.soc.num_states]));
-
-	BW_VAL_TRACE_SKIP(fail);
-	out = false;
-
-validate_out:
-	kfree(pipes);
-
-	BW_VAL_TRACE_FINISH();
-
-	return out;
-}
-
 /*
  * Some of the functions further below use the FPU, so we need to wrap this
  * with DC_FP_START()/DC_FP_END(). Use the same approach as for
@@ -1560,94 +1128,6 @@ static struct display_stream_compressor *dcn21_dsc_create(struct dc_context *ctx
 	return &dsc->base;
 }
 
-static struct _vcs_dpi_voltage_scaling_st construct_low_pstate_lvl(struct clk_limit_table *clk_table, unsigned int high_voltage_lvl)
-{
-	struct _vcs_dpi_voltage_scaling_st low_pstate_lvl;
-	int i;
-
-	low_pstate_lvl.state = 1;
-	low_pstate_lvl.dcfclk_mhz = clk_table->entries[0].dcfclk_mhz;
-	low_pstate_lvl.fabricclk_mhz = clk_table->entries[0].fclk_mhz;
-	low_pstate_lvl.socclk_mhz = clk_table->entries[0].socclk_mhz;
-	low_pstate_lvl.dram_speed_mts = clk_table->entries[0].memclk_mhz * 2;
-
-	low_pstate_lvl.dispclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].dispclk_mhz;
-	low_pstate_lvl.dppclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].dppclk_mhz;
-	low_pstate_lvl.dram_bw_per_chan_gbps = dcn2_1_soc.clock_limits[high_voltage_lvl].dram_bw_per_chan_gbps;
-	low_pstate_lvl.dscclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].dscclk_mhz;
-	low_pstate_lvl.dtbclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].dtbclk_mhz;
-	low_pstate_lvl.phyclk_d18_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].phyclk_d18_mhz;
-	low_pstate_lvl.phyclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].phyclk_mhz;
-
-	for (i = clk_table->num_entries; i > 1; i--)
-		clk_table->entries[i] = clk_table->entries[i-1];
-	clk_table->entries[1] = clk_table->entries[0];
-	clk_table->num_entries++;
-
-	return low_pstate_lvl;
-}
-
-static void update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
-{
-	struct dcn21_resource_pool *pool = TO_DCN21_RES_POOL(dc->res_pool);
-	struct clk_limit_table *clk_table = &bw_params->clk_table;
-	struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
-	unsigned int i, closest_clk_lvl = 0, k = 0;
-	int j;
-
-	dcn2_1_ip.max_num_otg = pool->base.res_cap->num_timing_generator;
-	dcn2_1_ip.max_num_dpp = pool->base.pipe_count;
-	dcn2_1_soc.num_chans = bw_params->num_channels;
-
-	ASSERT(clk_table->num_entries);
-	/* Copy dcn2_1_soc.clock_limits to clock_limits to avoid copying over null states later */
-	for (i = 0; i < dcn2_1_soc.num_states + 1; i++) {
-		clock_limits[i] = dcn2_1_soc.clock_limits[i];
-	}
-
-	for (i = 0; i < clk_table->num_entries; i++) {
-		/* loop backwards*/
-		for (closest_clk_lvl = 0, j = dcn2_1_soc.num_states - 1; j >= 0; j--) {
-			if ((unsigned int) dcn2_1_soc.clock_limits[j].dcfclk_mhz <= clk_table->entries[i].dcfclk_mhz) {
-				closest_clk_lvl = j;
-				break;
-			}
-		}
-
-		/* clk_table[1] is reserved for min DF PState.  skip here to fill in later. */
-		if (i == 1)
-			k++;
-
-		clock_limits[k].state = k;
-		clock_limits[k].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
-		clock_limits[k].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
-		clock_limits[k].socclk_mhz = clk_table->entries[i].socclk_mhz;
-		clock_limits[k].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2;
-
-		clock_limits[k].dispclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
-		clock_limits[k].dppclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
-		clock_limits[k].dram_bw_per_chan_gbps = dcn2_1_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
-		clock_limits[k].dscclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
-		clock_limits[k].dtbclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
-		clock_limits[k].phyclk_d18_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
-		clock_limits[k].phyclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
-
-		k++;
-	}
-	for (i = 0; i < clk_table->num_entries + 1; i++)
-		dcn2_1_soc.clock_limits[i] = clock_limits[i];
-	if (clk_table->num_entries) {
-		dcn2_1_soc.num_states = clk_table->num_entries + 1;
-		/* fill in min DF PState */
-		dcn2_1_soc.clock_limits[1] = construct_low_pstate_lvl(clk_table, closest_clk_lvl);
-		/* duplicate last level */
-		dcn2_1_soc.clock_limits[dcn2_1_soc.num_states] = dcn2_1_soc.clock_limits[dcn2_1_soc.num_states - 1];
-		dcn2_1_soc.clock_limits[dcn2_1_soc.num_states].state = dcn2_1_soc.num_states;
-	}
-
-	dml_init_instance(&dc->dml, &dcn2_1_soc, &dcn2_1_ip, DML_PROJECT_DCN21);
-}
-
 static struct pp_smu_funcs *dcn21_pp_smu_create(struct dc_context *ctx)
 {
 	struct pp_smu_funcs *pp_smu = kzalloc(sizeof(*pp_smu), GFP_KERNEL);
@@ -1898,24 +1378,6 @@ static uint32_t read_pipe_fuses(struct dc_context *ctx)
 	return value;
 }
 
-static int dcn21_populate_dml_pipes_from_context(
-		struct dc *dc,
-		struct dc_state *context,
-		display_e2e_pipe_params_st *pipes,
-		bool fast_validate)
-{
-	uint32_t pipe_cnt = dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
-	int i;
-
-	for (i = 0; i < pipe_cnt; i++) {
-
-		pipes[i].pipe.src.hostvm = dc->res_pool->hubbub->riommu_active;
-		pipes[i].pipe.src.gpuvm = 1;
-	}
-
-	return pipe_cnt;
-}
-
 static enum dc_status dcn21_patch_unknown_plane_state(struct dc_plane_state *plane_state)
 {
 	enum dc_status result = DC_OK;
@@ -1943,7 +1405,7 @@ static const struct resource_funcs dcn21_res_pool_funcs = {
 	.patch_unknown_plane_state = dcn21_patch_unknown_plane_state,
 	.set_mcif_arb_params = dcn20_set_mcif_arb_params,
 	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
-	.update_bw_bounding_box = update_bw_bounding_box
+	.update_bw_bounding_box = dcn21_update_bw_bounding_box,
 };
 
 static bool dcn21_resource_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.h b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.h
index a27355171bca..f7ecc002c2f7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.h
@@ -35,11 +35,22 @@ struct dc;
 struct resource_pool;
 struct _vcs_dpi_display_pipe_params_st;
 
+extern struct _vcs_dpi_ip_params_st dcn2_1_ip;
+extern struct _vcs_dpi_soc_bounding_box_st dcn2_1_soc;
+
 struct dcn21_resource_pool {
 	struct resource_pool base;
 };
 struct resource_pool *dcn21_create_resource_pool(
 		const struct dc_init_data *init_data,
 		struct dc *dc);
+bool dcn21_fast_validate_bw(
+		struct dc *dc,
+		struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int *pipe_cnt_out,
+		int *pipe_split_from,
+		int *vlevel_out,
+		bool fast_validate);
 
 #endif /* _DCN21_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index b7adc9b6a543..bfdb4b78f571 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -27,10 +27,21 @@
 #include "resource.h"
 #include "clk_mgr.h"
 #include "dc_link_dp.h"
+#include "dchubbub.h"
 #include "dcn20/dcn20_resource.h"
+#include "dcn21/dcn21_resource.h"
 
 #include "dcn20_fpu.h"
 
+#define DC_LOGGER_INIT(logger)
+
+#ifndef MAX
+#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
+#endif
+#ifndef MIN
+#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
+#endif
+
 /**
  * DOC: DCN2x FPU manipulation Overview
  *
@@ -426,7 +437,219 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc = {
 
 struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc = { 0 };
 
-#define DC_LOGGER_INIT(logger)
+struct _vcs_dpi_ip_params_st dcn2_1_ip = {
+	.odm_capable = 1,
+	.gpuvm_enable = 1,
+	.hostvm_enable = 1,
+	.gpuvm_max_page_table_levels = 1,
+	.hostvm_max_page_table_levels = 4,
+	.hostvm_cached_page_table_levels = 2,
+	.num_dsc = 3,
+	.rob_buffer_size_kbytes = 168,
+	.det_buffer_size_kbytes = 164,
+	.dpte_buffer_size_in_pte_reqs_luma = 44,
+	.dpte_buffer_size_in_pte_reqs_chroma = 42,//todo
+	.dpp_output_buffer_pixels = 2560,
+	.opp_output_buffer_lines = 1,
+	.pixel_chunk_size_kbytes = 8,
+	.pte_enable = 1,
+	.max_page_table_levels = 4,
+	.pte_chunk_size_kbytes = 2,
+	.meta_chunk_size_kbytes = 2,
+	.min_meta_chunk_size_bytes = 256,
+	.writeback_chunk_size_kbytes = 2,
+	.line_buffer_size_bits = 789504,
+	.is_line_buffer_bpp_fixed = 0,
+	.line_buffer_fixed_bpp = 0,
+	.dcc_supported = true,
+	.max_line_buffer_lines = 12,
+	.writeback_luma_buffer_size_kbytes = 12,
+	.writeback_chroma_buffer_size_kbytes = 8,
+	.writeback_chroma_line_buffer_width_pixels = 4,
+	.writeback_max_hscl_ratio = 1,
+	.writeback_max_vscl_ratio = 1,
+	.writeback_min_hscl_ratio = 1,
+	.writeback_min_vscl_ratio = 1,
+	.writeback_max_hscl_taps = 12,
+	.writeback_max_vscl_taps = 12,
+	.writeback_line_buffer_luma_buffer_size = 0,
+	.writeback_line_buffer_chroma_buffer_size = 14643,
+	.cursor_buffer_size = 8,
+	.cursor_chunk_size = 2,
+	.max_num_otg = 4,
+	.max_num_dpp = 4,
+	.max_num_wb = 1,
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
+	.min_vblank_lines = 32, //
+	.dppclk_delay_subtotal = 77, //
+	.dppclk_delay_scl_lb_only = 16,
+	.dppclk_delay_scl = 50,
+	.dppclk_delay_cnvc_formatter = 8,
+	.dppclk_delay_cnvc_cursor = 6,
+	.dispclk_delay_subtotal = 87, //
+	.dcfclk_cstate_latency = 10, // SRExitTime
+	.max_inter_dcn_tile_repeaters = 8,
+
+	.xfc_supported = false,
+	.xfc_fill_bw_overhead_percent = 10.0,
+	.xfc_fill_constant_bytes = 0,
+	.ptoi_supported = 0,
+	.number_of_cursors = 1,
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn2_1_soc = {
+	.clock_limits = {
+			{
+				.state = 0,
+				.dcfclk_mhz = 400.0,
+				.fabricclk_mhz = 400.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.00,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 278.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.state = 1,
+				.dcfclk_mhz = 464.52,
+				.fabricclk_mhz = 800.0,
+				.dispclk_mhz = 654.55,
+				.dppclk_mhz = 626.09,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 278.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.state = 2,
+				.dcfclk_mhz = 514.29,
+				.fabricclk_mhz = 933.0,
+				.dispclk_mhz = 757.89,
+				.dppclk_mhz = 685.71,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 278.0,
+				.dscclk_mhz = 287.67,
+				.dram_speed_mts = 1866.0,
+			},
+			{
+				.state = 3,
+				.dcfclk_mhz = 576.00,
+				.fabricclk_mhz = 1067.0,
+				.dispclk_mhz = 847.06,
+				.dppclk_mhz = 757.89,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 715.0,
+				.dscclk_mhz = 318.334,
+				.dram_speed_mts = 2134.0,
+			},
+			{
+				.state = 4,
+				.dcfclk_mhz = 626.09,
+				.fabricclk_mhz = 1200.0,
+				.dispclk_mhz = 900.00,
+				.dppclk_mhz = 847.06,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 953.0,
+				.dscclk_mhz = 489.0,
+				.dram_speed_mts = 2400.0,
+			},
+			{
+				.state = 5,
+				.dcfclk_mhz = 685.71,
+				.fabricclk_mhz = 1333.0,
+				.dispclk_mhz = 1028.57,
+				.dppclk_mhz = 960.00,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 278.0,
+				.dscclk_mhz = 287.67,
+				.dram_speed_mts = 2666.0,
+			},
+			{
+				.state = 6,
+				.dcfclk_mhz = 757.89,
+				.fabricclk_mhz = 1467.0,
+				.dispclk_mhz = 1107.69,
+				.dppclk_mhz = 1028.57,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 715.0,
+				.dscclk_mhz = 318.334,
+				.dram_speed_mts = 3200.0,
+			},
+			{
+				.state = 7,
+				.dcfclk_mhz = 847.06,
+				.fabricclk_mhz = 1600.0,
+				.dispclk_mhz = 1395.0,
+				.dppclk_mhz = 1285.00,
+				.phyclk_mhz = 1325.0,
+				.socclk_mhz = 953.0,
+				.dscclk_mhz = 489.0,
+				.dram_speed_mts = 4266.0,
+			},
+			/*Extra state, no dispclk ramping*/
+			{
+				.state = 8,
+				.dcfclk_mhz = 847.06,
+				.fabricclk_mhz = 1600.0,
+				.dispclk_mhz = 1395.0,
+				.dppclk_mhz = 1285.0,
+				.phyclk_mhz = 1325.0,
+				.socclk_mhz = 953.0,
+				.dscclk_mhz = 489.0,
+				.dram_speed_mts = 4266.0,
+			},
+
+		},
+
+	.sr_exit_time_us = 12.5,
+	.sr_enter_plus_exit_time_us = 17.0,
+	.urgent_latency_us = 4.0,
+	.urgent_latency_pixel_data_only_us = 4.0,
+	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+	.urgent_latency_vm_data_only_us = 4.0,
+	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 80.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 75.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 40.0,
+	.max_avg_sdp_bw_use_normal_percent = 60.0,
+	.max_avg_dram_bw_use_normal_percent = 100.0,
+	.writeback_latency_us = 12.0,
+	.max_request_size_bytes = 256,
+	.dram_channel_width_bytes = 4,
+	.fabric_datapath_to_dcn_data_return_bytes = 32,
+	.dcn_downspread_percent = 0.5,
+	.downspread_percent = 0.38,
+	.dram_page_open_time_ns = 50.0,
+	.dram_rw_turnaround_time_ns = 17.5,
+	.dram_return_buffer_per_channel_bytes = 8192,
+	.round_trip_ping_latency_dcfclk_cycles = 128,
+	.urgent_out_of_order_return_per_channel_bytes = 4096,
+	.channel_interleave_bytes = 256,
+	.num_banks = 8,
+	.num_chans = 4,
+	.vmm_page_size_bytes = 4096,
+	.dram_clock_change_latency_us = 23.84,
+	.return_bus_width_bytes = 64,
+	.dispclk_dppclk_vco_speed_mhz = 3600,
+	.xfc_bus_transport_time_us = 4,
+	.xfc_xbuf_latency_tolerance_us = 4,
+	.use_urgent_burst_bw = 1,
+	.num_states = 8
+};
 
 void dcn20_populate_dml_writeback_from_context(struct dc *dc,
 					       struct resource_context *res_ctx,
@@ -1485,3 +1708,316 @@ void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,
 	else
 		v->RequiredDPPCLK[vlevel][max_mpc_comb][pipe_idx] /= 2;
 }
+
+int dcn21_populate_dml_pipes_from_context(struct dc *dc,
+					  struct dc_state *context,
+					  display_e2e_pipe_params_st *pipes,
+					  bool fast_validate)
+{
+	uint32_t pipe_cnt;
+	int i;
+
+	dc_assert_fp_enabled();
+
+	pipe_cnt = dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+
+	for (i = 0; i < pipe_cnt; i++) {
+
+		pipes[i].pipe.src.hostvm = dc->res_pool->hubbub->riommu_active;
+		pipes[i].pipe.src.gpuvm = 1;
+	}
+
+	return pipe_cnt;
+}
+
+static void patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_st *bb)
+{
+	int i;
+
+	if (dc->bb_overrides.sr_exit_time_ns) {
+		for (i = 0; i < WM_SET_COUNT; i++) {
+			  dc->clk_mgr->bw_params->wm_table.entries[i].sr_exit_time_us =
+					  dc->bb_overrides.sr_exit_time_ns / 1000.0;
+		}
+	}
+
+	if (dc->bb_overrides.sr_enter_plus_exit_time_ns) {
+		for (i = 0; i < WM_SET_COUNT; i++) {
+			  dc->clk_mgr->bw_params->wm_table.entries[i].sr_enter_plus_exit_time_us =
+					  dc->bb_overrides.sr_enter_plus_exit_time_ns / 1000.0;
+		}
+	}
+
+	if (dc->bb_overrides.urgent_latency_ns) {
+		bb->urgent_latency_us = dc->bb_overrides.urgent_latency_ns / 1000.0;
+	}
+
+	if (dc->bb_overrides.dram_clock_change_latency_ns) {
+		for (i = 0; i < WM_SET_COUNT; i++) {
+			dc->clk_mgr->bw_params->wm_table.entries[i].pstate_latency_us =
+				dc->bb_overrides.dram_clock_change_latency_ns / 1000.0;
+		}
+	}
+}
+
+static void calculate_wm_set_for_vlevel(int vlevel,
+					struct wm_range_table_entry *table_entry,
+					struct dcn_watermarks *wm_set,
+					struct display_mode_lib *dml,
+					display_e2e_pipe_params_st *pipes,
+					int pipe_cnt)
+{
+	double dram_clock_change_latency_cached = dml->soc.dram_clock_change_latency_us;
+
+	ASSERT(vlevel < dml->soc.num_states);
+	/* only pipe 0 is read for voltage and dcf/soc clocks */
+	pipes[0].clks_cfg.voltage = vlevel;
+	pipes[0].clks_cfg.dcfclk_mhz = dml->soc.clock_limits[vlevel].dcfclk_mhz;
+	pipes[0].clks_cfg.socclk_mhz = dml->soc.clock_limits[vlevel].socclk_mhz;
+
+	dml->soc.dram_clock_change_latency_us = table_entry->pstate_latency_us;
+	dml->soc.sr_exit_time_us = table_entry->sr_exit_time_us;
+	dml->soc.sr_enter_plus_exit_time_us = table_entry->sr_enter_plus_exit_time_us;
+
+	wm_set->urgent_ns = get_wm_urgent(dml, pipes, pipe_cnt) * 1000;
+	wm_set->cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(dml, pipes, pipe_cnt) * 1000;
+	wm_set->cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(dml, pipes, pipe_cnt) * 1000;
+	wm_set->cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(dml, pipes, pipe_cnt) * 1000;
+	wm_set->pte_meta_urgent_ns = get_wm_memory_trip(dml, pipes, pipe_cnt) * 1000;
+	wm_set->frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(dml, pipes, pipe_cnt) * 1000;
+	wm_set->frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(dml, pipes, pipe_cnt) * 1000;
+	wm_set->urgent_latency_ns = get_urgent_latency(dml, pipes, pipe_cnt) * 1000;
+	dml->soc.dram_clock_change_latency_us = dram_clock_change_latency_cached;
+}
+
+static void dcn21_calculate_wm(struct dc *dc, struct dc_state *context,
+			display_e2e_pipe_params_st *pipes,
+			int *out_pipe_cnt,
+			int *pipe_split_from,
+			int vlevel_req,
+			bool fast_validate)
+{
+	int pipe_cnt, i, pipe_idx;
+	int vlevel, vlevel_max;
+	struct wm_range_table_entry *table_entry;
+	struct clk_bw_params *bw_params = dc->clk_mgr->bw_params;
+
+	ASSERT(bw_params);
+
+	patch_bounding_box(dc, &context->bw_ctx.dml.soc);
+
+	for (i = 0, pipe_idx = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
+			if (!context->res_ctx.pipe_ctx[i].stream)
+				continue;
+
+			pipes[pipe_cnt].clks_cfg.refclk_mhz = dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000.0;
+			pipes[pipe_cnt].clks_cfg.dispclk_mhz = context->bw_ctx.dml.vba.RequiredDISPCLK[vlevel_req][context->bw_ctx.dml.vba.maxMpcComb];
+
+			if (pipe_split_from[i] < 0) {
+				pipes[pipe_cnt].clks_cfg.dppclk_mhz =
+						context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel_req][context->bw_ctx.dml.vba.maxMpcComb][pipe_idx];
+				if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_idx] == pipe_idx)
+					pipes[pipe_cnt].pipe.dest.odm_combine =
+							context->bw_ctx.dml.vba.ODMCombineEnablePerState[vlevel_req][pipe_idx];
+				else
+					pipes[pipe_cnt].pipe.dest.odm_combine = 0;
+				pipe_idx++;
+			} else {
+				pipes[pipe_cnt].clks_cfg.dppclk_mhz =
+						context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel_req][context->bw_ctx.dml.vba.maxMpcComb][pipe_split_from[i]];
+				if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_split_from[i]] == pipe_split_from[i])
+					pipes[pipe_cnt].pipe.dest.odm_combine =
+							context->bw_ctx.dml.vba.ODMCombineEnablePerState[vlevel_req][pipe_split_from[i]];
+				else
+					pipes[pipe_cnt].pipe.dest.odm_combine = 0;
+			}
+			pipe_cnt++;
+	}
+
+	if (pipe_cnt != pipe_idx) {
+		if (dc->res_pool->funcs->populate_dml_pipes)
+			pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc,
+				context, pipes, fast_validate);
+		else
+			pipe_cnt = dcn21_populate_dml_pipes_from_context(dc,
+				context, pipes, fast_validate);
+	}
+
+	*out_pipe_cnt = pipe_cnt;
+
+	vlevel_max = bw_params->clk_table.num_entries - 1;
+
+
+	/* WM Set D */
+	table_entry = &bw_params->wm_table.entries[WM_D];
+	if (table_entry->wm_type == WM_TYPE_RETRAINING)
+		vlevel = 0;
+	else
+		vlevel = vlevel_max;
+	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.d,
+						&context->bw_ctx.dml, pipes, pipe_cnt);
+	/* WM Set C */
+	table_entry = &bw_params->wm_table.entries[WM_C];
+	vlevel = MIN(MAX(vlevel_req, 3), vlevel_max);
+	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.c,
+						&context->bw_ctx.dml, pipes, pipe_cnt);
+	/* WM Set B */
+	table_entry = &bw_params->wm_table.entries[WM_B];
+	vlevel = MIN(MAX(vlevel_req, 2), vlevel_max);
+	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.b,
+						&context->bw_ctx.dml, pipes, pipe_cnt);
+
+	/* WM Set A */
+	table_entry = &bw_params->wm_table.entries[WM_A];
+	vlevel = MIN(vlevel_req, vlevel_max);
+	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.a,
+						&context->bw_ctx.dml, pipes, pipe_cnt);
+}
+
+bool dcn21_validate_bandwidth_fp(struct dc *dc,
+				 struct dc_state *context,
+				 bool fast_validate)
+{
+	bool out = false;
+
+	BW_VAL_TRACE_SETUP();
+
+	int vlevel = 0;
+	int pipe_split_from[MAX_PIPES];
+	int pipe_cnt = 0;
+	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	BW_VAL_TRACE_COUNT();
+
+	dc_assert_fp_enabled();
+
+	/*Unsafe due to current pipe merge and split logic*/
+	ASSERT(context != dc->current_state);
+
+	out = dcn21_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_split_from, &vlevel, fast_validate);
+
+	if (pipe_cnt == 0)
+		goto validate_out;
+
+	if (!out)
+		goto validate_fail;
+
+	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
+
+	if (fast_validate) {
+		BW_VAL_TRACE_SKIP(fast);
+		goto validate_out;
+	}
+
+	dcn21_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, fast_validate);
+	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
+
+	BW_VAL_TRACE_END_WATERMARKS();
+
+	goto validate_out;
+
+validate_fail:
+	DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
+			dml_get_status_message(context->bw_ctx.dml.vba.ValidationStatus[context->bw_ctx.dml.vba.soc.num_states]));
+
+	BW_VAL_TRACE_SKIP(fail);
+	out = false;
+
+validate_out:
+	kfree(pipes);
+
+	BW_VAL_TRACE_FINISH();
+
+	return out;
+}
+
+static struct _vcs_dpi_voltage_scaling_st construct_low_pstate_lvl(struct clk_limit_table *clk_table, unsigned int high_voltage_lvl)
+{
+	struct _vcs_dpi_voltage_scaling_st low_pstate_lvl;
+	int i;
+
+	low_pstate_lvl.state = 1;
+	low_pstate_lvl.dcfclk_mhz = clk_table->entries[0].dcfclk_mhz;
+	low_pstate_lvl.fabricclk_mhz = clk_table->entries[0].fclk_mhz;
+	low_pstate_lvl.socclk_mhz = clk_table->entries[0].socclk_mhz;
+	low_pstate_lvl.dram_speed_mts = clk_table->entries[0].memclk_mhz * 2;
+
+	low_pstate_lvl.dispclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].dispclk_mhz;
+	low_pstate_lvl.dppclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].dppclk_mhz;
+	low_pstate_lvl.dram_bw_per_chan_gbps = dcn2_1_soc.clock_limits[high_voltage_lvl].dram_bw_per_chan_gbps;
+	low_pstate_lvl.dscclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].dscclk_mhz;
+	low_pstate_lvl.dtbclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].dtbclk_mhz;
+	low_pstate_lvl.phyclk_d18_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].phyclk_d18_mhz;
+	low_pstate_lvl.phyclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].phyclk_mhz;
+
+	for (i = clk_table->num_entries; i > 1; i--)
+		clk_table->entries[i] = clk_table->entries[i-1];
+	clk_table->entries[1] = clk_table->entries[0];
+	clk_table->num_entries++;
+
+	return low_pstate_lvl;
+}
+
+void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
+{
+	struct dcn21_resource_pool *pool = TO_DCN21_RES_POOL(dc->res_pool);
+	struct clk_limit_table *clk_table = &bw_params->clk_table;
+	struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
+	unsigned int i, closest_clk_lvl = 0, k = 0;
+	int j;
+
+	dc_assert_fp_enabled();
+
+	dcn2_1_ip.max_num_otg = pool->base.res_cap->num_timing_generator;
+	dcn2_1_ip.max_num_dpp = pool->base.pipe_count;
+	dcn2_1_soc.num_chans = bw_params->num_channels;
+
+	ASSERT(clk_table->num_entries);
+	/* Copy dcn2_1_soc.clock_limits to clock_limits to avoid copying over null states later */
+	for (i = 0; i < dcn2_1_soc.num_states + 1; i++) {
+		clock_limits[i] = dcn2_1_soc.clock_limits[i];
+	}
+
+	for (i = 0; i < clk_table->num_entries; i++) {
+		/* loop backwards*/
+		for (closest_clk_lvl = 0, j = dcn2_1_soc.num_states - 1; j >= 0; j--) {
+			if ((unsigned int) dcn2_1_soc.clock_limits[j].dcfclk_mhz <= clk_table->entries[i].dcfclk_mhz) {
+				closest_clk_lvl = j;
+				break;
+			}
+		}
+
+		/* clk_table[1] is reserved for min DF PState.  skip here to fill in later. */
+		if (i == 1)
+			k++;
+
+		clock_limits[k].state = k;
+		clock_limits[k].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
+		clock_limits[k].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
+		clock_limits[k].socclk_mhz = clk_table->entries[i].socclk_mhz;
+		clock_limits[k].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2;
+
+		clock_limits[k].dispclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
+		clock_limits[k].dppclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
+		clock_limits[k].dram_bw_per_chan_gbps = dcn2_1_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
+		clock_limits[k].dscclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
+		clock_limits[k].dtbclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
+		clock_limits[k].phyclk_d18_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
+		clock_limits[k].phyclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
+
+		k++;
+	}
+	for (i = 0; i < clk_table->num_entries + 1; i++)
+		dcn2_1_soc.clock_limits[i] = clock_limits[i];
+	if (clk_table->num_entries) {
+		dcn2_1_soc.num_states = clk_table->num_entries + 1;
+		/* fill in min DF PState */
+		dcn2_1_soc.clock_limits[1] = construct_low_pstate_lvl(clk_table, closest_clk_lvl);
+		/* duplicate last level */
+		dcn2_1_soc.clock_limits[dcn2_1_soc.num_states] = dcn2_1_soc.clock_limits[dcn2_1_soc.num_states - 1];
+		dcn2_1_soc.clock_limits[dcn2_1_soc.num_states].state = dcn2_1_soc.num_states;
+	}
+
+	dml_init_instance(&dc->dml, &dcn2_1_soc, &dcn2_1_ip, DML_PROJECT_DCN21);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
index 6b1f4126bc88..da38fa10f077 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
@@ -71,4 +71,13 @@ void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,
 			     int max_mpc_comb,
 			     int pipe_idx,
 			     bool is_validating_bw);
+
+int dcn21_populate_dml_pipes_from_context(struct dc *dc,
+					  struct dc_state *context,
+					  display_e2e_pipe_params_st *pipes,
+					  bool fast_validate);
+bool dcn21_validate_bandwidth_fp(struct dc *dc,
+				 struct dc_state *context,
+				 bool fast_validate);
+void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params);
 #endif /* __DCN20_FPU_H__ */
-- 
2.34.1


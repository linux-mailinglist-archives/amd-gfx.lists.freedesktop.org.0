Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C4526BE8
	for <lists+amd-gfx@lfdr.de>; Fri, 13 May 2022 22:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E5C10E9A3;
	Fri, 13 May 2022 20:51:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C126310E9A3
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 May 2022 20:51:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RL+CQK+zX/D+j8FEIRdvRxjkhpWtaoDGH2H2wyrHwO6ZMFKwg2SajYCc7LY+AZQ8LBmThNHnD3WgKn0VttdP4l4dhbZR0fn6nr5sqoH16YzgYla7ZHP6PenR4rKyluQvHS7NXG2w2X+CpKpxZmh/Zpm6As8IVlD7jZp0NDtOJgvzgz7tMfaZpVYoshTHlKFrZAKwrp8OOrhuhXs2b15u0hBLv19zlEHhad+TVD3vTwLhkgACkSY9vB2/JagReHjG4hubFr4y4Kh6scZUTtYCn5ljCNQVSJmAKDGOsCZKZnPu8du5S0maJpcKO2qp6MI7NtoJKN/xE1AzDK5F/nufMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2vDtcTWqIzpfvpPTB5xZo40puJEkyWHVznuVYoOsqg=;
 b=k+hFS1EAhq7sdDqdnbSjlxCnWRGZ6WEJxlA2X+sOtL7V5/rHDJiAXBAnbEwkknuMb+fAItrN7S66pYjYpbIg2uvPXcxS+RqJHm/D5ZZsFNLy66zXE66xhsnaGy+XnQTV1mRhOAuX2kZI+OYHLyhb6nPQu0O9xTWGj0OdsbOToH++ww6I40+K+WjuLNLuMpWr4egWhedqcd9puY6aPiNe2GSsSK0tzVSCK7cyKyQ2XjAhXZqvJa7VkF+aqaoOedotJlRoEPDtE9qsWHkuYwIoW0G2EdnKWdYt2lqTv9OP11Rj+g3KZQwXnHYSp73w9rNo0j3Ds/mQXhqvD9NePQBLJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2vDtcTWqIzpfvpPTB5xZo40puJEkyWHVznuVYoOsqg=;
 b=DbylSnoNGdJCta2GcNXsURRbXBhxkk4y6aRNbNL6qFzGmAeqHq6PzAzidVt2Zh/mlBvMexJiPHHrm3FrGVzN22l/zIB1UvE/On76wdKfIHRpj6OZ/r3wmD36GGJdBrmCsKCPqVeDv3QTyJ10qP0tyZ1iy1i4gOm5fvrsXiXGWiA=
Received: from MW4PR03CA0295.namprd03.prod.outlook.com (2603:10b6:303:b5::30)
 by BYAPR12MB3397.namprd12.prod.outlook.com (2603:10b6:a03:db::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 20:51:32 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::1a) by MW4PR03CA0295.outlook.office365.com
 (2603:10b6:303:b5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Fri, 13 May 2022 20:51:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 20:51:32 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 13 May
 2022 15:51:30 -0500
From: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/11] drm/amd/display: Move FPU associated DCN30 code to DML
 folder
Date: Fri, 13 May 2022 16:50:38 -0400
Message-ID: <20220513205041.1311639-9-qingqing.zhuo@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513205041.1311639-1-qingqing.zhuo@amd.com>
References: <20220513205041.1311639-1-qingqing.zhuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62655ed3-4ced-4a93-f014-08da35225c69
X-MS-TrafficTypeDiagnostic: BYAPR12MB3397:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3397124A95FF8B50B8A55C8DFBCA9@BYAPR12MB3397.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1buNuMGfuFf2hiXd2CAYnCQh7mtEubvuxeM49jTGO0LCu4noOWsvIwh9auAqcAvE86i6lt/fwFX2EUXqQB87D6wM2lc/WNypKjhUdooQUgi34+xLg1W55uVSKyUgOB/Qt48P1zQXAA3N93RD1HbGIe1JlrvGcgxeBmJZVOPcrjAm4/gv5Dsvkz55dGQrUPnqLN2YAQ23S0zdDoRMIrOyH1T40gR/DEwv5HLqtfLJGkp3Q2bYiJuiFCrS+ej7/uiPJQcYGOOVU+nklMVGNFUy7c8t4NVWQtfWeBD5tCI1t1D673SR5eKtP3YNowz7UdI7un896tl0Cu/Hnoik25BHyRcBxLPrxFSyyomu4EGlDQ5FhGkUKHWc/kv4XplXRRGF3vgFMEdc0HFU2o4tXsy8s5dtIg6rkZto8KogiH8ue60XmNbTuGc0dxOILsLADe5qKkbNU5QODaD5ggcTFK+gDN4J8Zvg4Uio6iW+gAWoUc++F2xsUWVAqU3UQxKVGBna15S4et/b2kxRSF8trQ6kGvb4UAWxn+RdDNaHh8Fyw5lQvLfoob5SlzAPcNc+Idv0pqB+/05woVwpUj1DwJsm20Bp7Yu3yv1Kv9FMYBaspecCw+Wlv1VUFGK09d6YACDULXIEyG1LG2fPFWWIzxjYzspQsi6g6BaJqV4O8SJojilIPtg/Q6lSqRIjiOzZmc7uxlFs5clF0qEPWSIoEvAWyg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(36860700001)(426003)(336012)(47076005)(40460700003)(966005)(83380400001)(30864003)(186003)(44832011)(82310400005)(5660300002)(16526019)(36756003)(316002)(8676002)(1076003)(2616005)(4326008)(86362001)(70206006)(8936002)(70586007)(6916009)(54906003)(81166007)(26005)(508600001)(356005)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 20:51:32.0078 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62655ed3-4ced-4a93-f014-08da35225c69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3397
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
Cc: stylon.wang@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, Jasdeep Dhillon <jdhillon@amd.com>,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jasdeep Dhillon <jdhillon@amd.com>

[why & how]
As part of the FPU isolation work documented in
https://patchwork.freedesktop.org/series/93042/, isolate
code that uses FPU in DCN30 to DML, where all FPU code
should locate.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Jasdeep Dhillon <jdhillon@amd.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_optc.c |  10 +
 .../drm/amd/display/dc/dcn30/dcn30_resource.c | 516 ++-------------
 .../drm/amd/display/dc/dcn30/dcn30_resource.h |   5 +
 .../amd/display/dc/dcn301/dcn301_resource.c   |   2 +
 .../amd/display/dc/dcn302/dcn302_resource.c   |   2 +
 .../amd/display/dc/dcn303/dcn303_resource.c   |   2 +
 .../drm/amd/display/dc/dcn31/dcn31_resource.c |   2 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |   3 +-
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  | 617 ++++++++++++++++++
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.h  |  67 ++
 .../gpu/drm/amd/display/dc/inc/core_types.h   |   7 +
 11 files changed, 756 insertions(+), 477 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
index f5e8916601d3..b604fb26f288 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
@@ -28,6 +28,8 @@
 #include "dc.h"
 #include "dcn_calc_math.h"
 
+#include "dml/dcn30/dcn30_fpu.h"
+
 #define REG(reg)\
 	optc1->tg_regs->reg
 
@@ -184,6 +186,14 @@ void optc3_set_dsc_config(struct timing_generator *optc,
 
 }
 
+void optc3_set_vrr_m_const(struct timing_generator *optc,
+		double vtotal_avg)
+{
+	DC_FP_START();
+	optc3_fpu_set_vrr_m_const(optc, vtotal_avg);
+	DC_FP_END();
+}
+
 void optc3_set_odm_bypass(struct timing_generator *optc,
 		const struct dc_crtc_timing *dc_crtc_timing)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index 336b2ce6a636..1c1a67c4cec1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -84,6 +84,7 @@
 #include "dce/dce_aux.h"
 #include "dce/dce_i2c.h"
 
+#include "dml/dcn30/dcn30_fpu.h"
 #include "dml/dcn30/display_mode_vba_30.h"
 #include "vm_helper.h"
 #include "dcn20/dcn20_vmid.h"
@@ -91,137 +92,6 @@
 
 #define DC_LOGGER_INIT(logger)
 
-struct _vcs_dpi_ip_params_st dcn3_0_ip = {
-	.use_min_dcfclk = 0,
-	.clamp_min_dcfclk = 0,
-	.odm_capable = 1,
-	.gpuvm_enable = 0,
-	.hostvm_enable = 0,
-	.gpuvm_max_page_table_levels = 4,
-	.hostvm_max_page_table_levels = 4,
-	.hostvm_cached_page_table_levels = 0,
-	.pte_group_size_bytes = 2048,
-	.num_dsc = 6,
-	.rob_buffer_size_kbytes = 184,
-	.det_buffer_size_kbytes = 184,
-	.dpte_buffer_size_in_pte_reqs_luma = 84,
-	.pde_proc_buffer_size_64k_reqs = 48,
-	.dpp_output_buffer_pixels = 2560,
-	.opp_output_buffer_lines = 1,
-	.pixel_chunk_size_kbytes = 8,
-	.pte_enable = 1,
-	.max_page_table_levels = 2,
-	.pte_chunk_size_kbytes = 2,  // ?
-	.meta_chunk_size_kbytes = 2,
-	.writeback_chunk_size_kbytes = 8,
-	.line_buffer_size_bits = 789504,
-	.is_line_buffer_bpp_fixed = 0,  // ?
-	.line_buffer_fixed_bpp = 0,     // ?
-	.dcc_supported = true,
-	.writeback_interface_buffer_size_kbytes = 90,
-	.writeback_line_buffer_buffer_size = 0,
-	.max_line_buffer_lines = 12,
-	.writeback_luma_buffer_size_kbytes = 12,  // writeback_line_buffer_buffer_size = 656640
-	.writeback_chroma_buffer_size_kbytes = 8,
-	.writeback_chroma_line_buffer_width_pixels = 4,
-	.writeback_max_hscl_ratio = 1,
-	.writeback_max_vscl_ratio = 1,
-	.writeback_min_hscl_ratio = 1,
-	.writeback_min_vscl_ratio = 1,
-	.writeback_max_hscl_taps = 1,
-	.writeback_max_vscl_taps = 1,
-	.writeback_line_buffer_luma_buffer_size = 0,
-	.writeback_line_buffer_chroma_buffer_size = 14643,
-	.cursor_buffer_size = 8,
-	.cursor_chunk_size = 2,
-	.max_num_otg = 6,
-	.max_num_dpp = 6,
-	.max_num_wb = 1,
-	.max_dchub_pscl_bw_pix_per_clk = 4,
-	.max_pscl_lb_bw_pix_per_clk = 2,
-	.max_lb_vscl_bw_pix_per_clk = 4,
-	.max_vscl_hscl_bw_pix_per_clk = 4,
-	.max_hscl_ratio = 6,
-	.max_vscl_ratio = 6,
-	.hscl_mults = 4,
-	.vscl_mults = 4,
-	.max_hscl_taps = 8,
-	.max_vscl_taps = 8,
-	.dispclk_ramp_margin_percent = 1,
-	.underscan_factor = 1.11,
-	.min_vblank_lines = 32,
-	.dppclk_delay_subtotal = 46,
-	.dynamic_metadata_vm_enabled = true,
-	.dppclk_delay_scl_lb_only = 16,
-	.dppclk_delay_scl = 50,
-	.dppclk_delay_cnvc_formatter = 27,
-	.dppclk_delay_cnvc_cursor = 6,
-	.dispclk_delay_subtotal = 119,
-	.dcfclk_cstate_latency = 5.2, // SRExitTime
-	.max_inter_dcn_tile_repeaters = 8,
-	.odm_combine_4to1_supported = true,
-
-	.xfc_supported = false,
-	.xfc_fill_bw_overhead_percent = 10.0,
-	.xfc_fill_constant_bytes = 0,
-	.gfx7_compat_tiling_supported = 0,
-	.number_of_cursors = 1,
-};
-
-struct _vcs_dpi_soc_bounding_box_st dcn3_0_soc = {
-	.clock_limits = {
-			{
-				.state = 0,
-				.dispclk_mhz = 562.0,
-				.dppclk_mhz = 300.0,
-				.phyclk_mhz = 300.0,
-				.phyclk_d18_mhz = 667.0,
-				.dscclk_mhz = 405.6,
-			},
-		},
-	.min_dcfclk = 500.0, /* TODO: set this to actual min DCFCLK */
-	.num_states = 1,
-	.sr_exit_time_us = 15.5,
-	.sr_enter_plus_exit_time_us = 20,
-	.urgent_latency_us = 4.0,
-	.urgent_latency_pixel_data_only_us = 4.0,
-	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
-	.urgent_latency_vm_data_only_us = 4.0,
-	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
-	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
-	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
-	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 80.0,
-	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0,
-	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 40.0,
-	.max_avg_sdp_bw_use_normal_percent = 60.0,
-	.max_avg_dram_bw_use_normal_percent = 40.0,
-	.writeback_latency_us = 12.0,
-	.max_request_size_bytes = 256,
-	.fabric_datapath_to_dcn_data_return_bytes = 64,
-	.dcn_downspread_percent = 0.5,
-	.downspread_percent = 0.38,
-	.dram_page_open_time_ns = 50.0,
-	.dram_rw_turnaround_time_ns = 17.5,
-	.dram_return_buffer_per_channel_bytes = 8192,
-	.round_trip_ping_latency_dcfclk_cycles = 191,
-	.urgent_out_of_order_return_per_channel_bytes = 4096,
-	.channel_interleave_bytes = 256,
-	.num_banks = 8,
-	.gpuvm_min_page_size_bytes = 4096,
-	.hostvm_min_page_size_bytes = 4096,
-	.dram_clock_change_latency_us = 404,
-	.dummy_pstate_latency_us = 5,
-	.writeback_dram_clock_change_latency_us = 23.0,
-	.return_bus_width_bytes = 64,
-	.dispclk_dppclk_vco_speed_mhz = 3650,
-	.xfc_bus_transport_time_us = 20,      // ?
-	.xfc_xbuf_latency_tolerance_us = 4,  // ?
-	.use_urgent_burst_bw = 1,            // ?
-	.do_urgent_latency_adjustment = true,
-	.urgent_latency_adjustment_fabric_clock_component_us = 1.0,
-	.urgent_latency_adjustment_fabric_clock_reference_mhz = 1000,
-};
-
 enum dcn30_clk_src_array_id {
 	DCN30_CLK_SRC_PLL0,
 	DCN30_CLK_SRC_PLL1,
@@ -1480,90 +1350,9 @@ int dcn30_populate_dml_pipes_from_context(
 void dcn30_populate_dml_writeback_from_context(
 	struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
 {
-	int pipe_cnt, i, j;
-	double max_calc_writeback_dispclk;
-	double writeback_dispclk;
-	struct writeback_st dout_wb;
-
-	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
-		struct dc_stream_state *stream = res_ctx->pipe_ctx[i].stream;
-
-		if (!stream)
-			continue;
-		max_calc_writeback_dispclk = 0;
-
-		/* Set writeback information */
-		pipes[pipe_cnt].dout.wb_enable = 0;
-		pipes[pipe_cnt].dout.num_active_wb = 0;
-		for (j = 0; j < stream->num_wb_info; j++) {
-			struct dc_writeback_info *wb_info = &stream->writeback_info[j];
-
-			if (wb_info->wb_enabled && wb_info->writeback_source_plane &&
-					(wb_info->writeback_source_plane == res_ctx->pipe_ctx[i].plane_state)) {
-				pipes[pipe_cnt].dout.wb_enable = 1;
-				pipes[pipe_cnt].dout.num_active_wb++;
-				dout_wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_en ?
-					wb_info->dwb_params.cnv_params.crop_height :
-					wb_info->dwb_params.cnv_params.src_height;
-				dout_wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_en ?
-					wb_info->dwb_params.cnv_params.crop_width :
-					wb_info->dwb_params.cnv_params.src_width;
-				dout_wb.wb_dst_width = wb_info->dwb_params.dest_width;
-				dout_wb.wb_dst_height = wb_info->dwb_params.dest_height;
-
-				/* For IP that doesn't support WB scaling, set h/v taps to 1 to avoid DML validation failure */
-				if (dc->dml.ip.writeback_max_hscl_taps > 1) {
-					dout_wb.wb_htaps_luma = wb_info->dwb_params.scaler_taps.h_taps;
-					dout_wb.wb_vtaps_luma = wb_info->dwb_params.scaler_taps.v_taps;
-				} else {
-					dout_wb.wb_htaps_luma = 1;
-					dout_wb.wb_vtaps_luma = 1;
-				}
-				dout_wb.wb_htaps_chroma = 0;
-				dout_wb.wb_vtaps_chroma = 0;
-				dout_wb.wb_hratio = wb_info->dwb_params.cnv_params.crop_en ?
-					(double)wb_info->dwb_params.cnv_params.crop_width /
-						(double)wb_info->dwb_params.dest_width :
-					(double)wb_info->dwb_params.cnv_params.src_width /
-						(double)wb_info->dwb_params.dest_width;
-				dout_wb.wb_vratio = wb_info->dwb_params.cnv_params.crop_en ?
-					(double)wb_info->dwb_params.cnv_params.crop_height /
-						(double)wb_info->dwb_params.dest_height :
-					(double)wb_info->dwb_params.cnv_params.src_height /
-						(double)wb_info->dwb_params.dest_height;
-				if (wb_info->dwb_params.cnv_params.fc_out_format == DWB_OUT_FORMAT_64BPP_ARGB ||
-					wb_info->dwb_params.cnv_params.fc_out_format == DWB_OUT_FORMAT_64BPP_RGBA)
-					dout_wb.wb_pixel_format = dm_444_64;
-				else
-					dout_wb.wb_pixel_format = dm_444_32;
-
-				/* Workaround for cases where multiple writebacks are connected to same plane
-				 * In which case, need to compute worst case and set the associated writeback parameters
-				 * This workaround is necessary due to DML computation assuming only 1 set of writeback
-				 * parameters per pipe
-				 */
-				writeback_dispclk = dml30_CalculateWriteBackDISPCLK(
-						dout_wb.wb_pixel_format,
-						pipes[pipe_cnt].pipe.dest.pixel_rate_mhz,
-						dout_wb.wb_hratio,
-						dout_wb.wb_vratio,
-						dout_wb.wb_htaps_luma,
-						dout_wb.wb_vtaps_luma,
-						dout_wb.wb_src_width,
-						dout_wb.wb_dst_width,
-						pipes[pipe_cnt].pipe.dest.htotal,
-						dc->current_state->bw_ctx.dml.ip.writeback_line_buffer_buffer_size);
-
-				if (writeback_dispclk > max_calc_writeback_dispclk) {
-					max_calc_writeback_dispclk = writeback_dispclk;
-					pipes[pipe_cnt].dout.wb = dout_wb;
-				}
-			}
-		}
-
-		pipe_cnt++;
-	}
-
+	DC_FP_START();
+	dcn30_fpu_populate_dml_writeback_from_context(dc, res_ctx, pipes);
+	DC_FP_END();
 }
 
 unsigned int dcn30_calc_max_scaled_time(
@@ -1598,7 +1387,7 @@ void dcn30_set_mcif_arb_params(
 	enum mmhubbub_wbif_mode wbif_mode;
 	struct display_mode_lib *dml = &context->bw_ctx.dml;
 	struct mcif_arb_params *wb_arb_params;
-	int i, j, k, dwb_pipe;
+	int i, j, dwb_pipe;
 
 	/* Writeback MCIF_WB arbitration parameters */
 	dwb_pipe = 0;
@@ -1622,17 +1411,15 @@ void dcn30_set_mcif_arb_params(
 			else
 				wbif_mode = PACKED_444;
 
-			for (k = 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_params->cli_watermark[0]); k++) {
-				wb_arb_params->cli_watermark[k] = get_wm_writeback_urgent(dml, pipes, pipe_cnt) * 1000;
-				wb_arb_params->pstate_watermark[k] = get_wm_writeback_dram_clock_change(dml, pipes, pipe_cnt) * 1000;
-			}
+			DC_FP_START();
+			dcn30_fpu_set_mcif_arb_params(wb_arb_params, dml, pipes, pipe_cnt, j);
+			DC_FP_END();
 			wb_arb_params->time_per_pixel = (1000000 << 6) / context->res_ctx.pipe_ctx[i].stream->phy_pix_clk; /* time_per_pixel should be in u6.6 format */
 			wb_arb_params->slice_lines = 32;
 			wb_arb_params->arbitration_slice = 2; /* irrelevant since there is no YUV output */
 			wb_arb_params->max_scaled_time = dcn30_calc_max_scaled_time(wb_arb_params->time_per_pixel,
 					wbif_mode,
 					wb_arb_params->cli_watermark[0]); /* assume 4 watermark sets have the same value */
-			wb_arb_params->dram_speed_change_duration = dml->vba.WritebackAllowDRAMClockChangeEndPosition[j] * pipes[0].clks_cfg.refclk_mhz; /* num_clock_cycles = us * MHz */
 
 			dwb_pipe++;
 
@@ -2111,178 +1898,11 @@ noinline bool dcn30_internal_validate_bw(
 	return out;
 }
 
-/*
- * This must be noinline to ensure anything that deals with FP registers
- * is contained within this call; previously our compiling with hard-float
- * would result in fp instructions being emitted outside of the boundaries
- * of the DC_FP_START/END macros, which makes sense as the compiler has no
- * idea about what is wrapped and what is not
- *
- * This is largely just a workaround to avoid breakage introduced with 5.6,
- * ideally all fp-using code should be moved into its own file, only that
- * should be compiled with hard-float, and all code exported from there
- * should be strictly wrapped with DC_FP_START/END
- */
-static noinline void dcn30_calculate_wm_and_dlg_fp(
-		struct dc *dc, struct dc_state *context,
-		display_e2e_pipe_params_st *pipes,
-		int pipe_cnt,
-		int vlevel)
+void dcn30_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
 {
-	int maxMpcComb = context->bw_ctx.dml.vba.maxMpcComb;
-	int i, pipe_idx;
-	double dcfclk = context->bw_ctx.dml.vba.DCFCLKState[vlevel][maxMpcComb];
-	bool pstate_en = context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][maxMpcComb] != dm_dram_clock_change_unsupported;
-
-	if (context->bw_ctx.dml.soc.min_dcfclk > dcfclk)
-		dcfclk = context->bw_ctx.dml.soc.min_dcfclk;
-
-	pipes[0].clks_cfg.voltage = vlevel;
-	pipes[0].clks_cfg.dcfclk_mhz = dcfclk;
-	pipes[0].clks_cfg.socclk_mhz = context->bw_ctx.dml.soc.clock_limits[vlevel].socclk_mhz;
-
-	/* Set B:
-	 * DCFCLK: 1GHz or min required above 1GHz
-	 * FCLK/UCLK: Max
-	 */
-	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].valid) {
-		if (vlevel == 0) {
-			pipes[0].clks_cfg.voltage = 1;
-			pipes[0].clks_cfg.dcfclk_mhz = context->bw_ctx.dml.soc.clock_limits[0].dcfclk_mhz;
-		}
-		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us;
-		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us;
-		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us;
-	}
-	context->bw_ctx.bw.dcn.watermarks.b.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.b.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.b.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-
-	pipes[0].clks_cfg.voltage = vlevel;
-	pipes[0].clks_cfg.dcfclk_mhz = dcfclk;
-
-	/* Set D:
-	 * DCFCLK: Min Required
-	 * FCLK(proportional to UCLK): 1GHz or Max
-	 * MALL stutter, sr_enter_exit = 4, sr_exit = 2us
-	 */
-	/*
-	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].valid) {
-		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.pstate_latency_us;
-		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_enter_plus_exit_time_us;
-		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_exit_time_us;
-	}
-	context->bw_ctx.bw.dcn.watermarks.d.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.d.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.d.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	*/
-
-	/* Set C:
-	 * DCFCLK: Min Required
-	 * FCLK(proportional to UCLK): 1GHz or Max
-	 * pstate latency overridden to 5us
-	 */
-	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].valid) {
-		unsigned int min_dram_speed_mts = context->bw_ctx.dml.vba.DRAMSpeed;
-		unsigned int min_dram_speed_mts_margin = 160;
-
-		if (context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb] == dm_dram_clock_change_unsupported)
-			min_dram_speed_mts = dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz * 16;
-
-		/* find largest table entry that is lower than dram speed, but lower than DPM0 still uses DPM0 */
-		for (i = 3; i > 0; i--)
-			if (min_dram_speed_mts + min_dram_speed_mts_margin > dc->clk_mgr->bw_params->dummy_pstate_table[i].dram_speed_mts)
-				break;
-
-		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->dummy_pstate_table[i].dummy_pstate_latency_us;
-		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us;
-		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us;
-	}
-
-	context->bw_ctx.bw.dcn.watermarks.c.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.c.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	context->bw_ctx.bw.dcn.watermarks.c.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-
-	if (!pstate_en) {
-		/* The only difference between A and C is p-state latency, if p-state is not supported we want to
-		 * calculate DLG based on dummy p-state latency, and max out the set A p-state watermark
-		 */
-		context->bw_ctx.bw.dcn.watermarks.a = context->bw_ctx.bw.dcn.watermarks.c;
-		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = 0;
-	} else {
-		/* Set A:
-		 * DCFCLK: Min Required
-		 * FCLK(proportional to UCLK): 1GHz or Max
-		 *
-		 * Set A calculated last so that following calculations are based on Set A
-		 */
-		dc->res_pool->funcs->update_soc_for_wm_a(dc, context);
-		context->bw_ctx.bw.dcn.watermarks.a.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-		context->bw_ctx.bw.dcn.watermarks.a.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-		context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-		context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-		context->bw_ctx.bw.dcn.watermarks.a.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	}
-
-	context->perf_params.stutter_period_us = context->bw_ctx.dml.vba.StutterPeriod;
-
-	/* Make set D = set A until set D is enabled */
-	context->bw_ctx.bw.dcn.watermarks.d = context->bw_ctx.bw.dcn.watermarks.a;
-
-	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
-		if (!context->res_ctx.pipe_ctx[i].stream)
-			continue;
-
-		pipes[pipe_idx].clks_cfg.dispclk_mhz = get_dispclk_calculated(&context->bw_ctx.dml, pipes, pipe_cnt);
-		pipes[pipe_idx].clks_cfg.dppclk_mhz = get_dppclk_calculated(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
-
-		if (dc->config.forced_clocks) {
-			pipes[pipe_idx].clks_cfg.dispclk_mhz = context->bw_ctx.dml.soc.clock_limits[0].dispclk_mhz;
-			pipes[pipe_idx].clks_cfg.dppclk_mhz = context->bw_ctx.dml.soc.clock_limits[0].dppclk_mhz;
-		}
-		if (dc->debug.min_disp_clk_khz > pipes[pipe_idx].clks_cfg.dispclk_mhz * 1000)
-			pipes[pipe_idx].clks_cfg.dispclk_mhz = dc->debug.min_disp_clk_khz / 1000.0;
-		if (dc->debug.min_dpp_clk_khz > pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000)
-			pipes[pipe_idx].clks_cfg.dppclk_mhz = dc->debug.min_dpp_clk_khz / 1000.0;
-
-		pipe_idx++;
-	}
-
 	DC_FP_START();
-	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
+	dcn30_fpu_update_soc_for_wm_a(dc, context);
 	DC_FP_END();
-
-	if (!pstate_en)
-		/* Restore full p-state latency */
-		context->bw_ctx.dml.soc.dram_clock_change_latency_us =
-				dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
-}
-
-void dcn30_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
-{
-	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].valid) {
-		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
-		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us;
-		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us;
-	}
 }
 
 void dcn30_calculate_wm_and_dlg(
@@ -2292,7 +1912,7 @@ void dcn30_calculate_wm_and_dlg(
 		int vlevel)
 {
 	DC_FP_START();
-	dcn30_calculate_wm_and_dlg_fp(dc, context, pipes, pipe_cnt, vlevel);
+	dcn30_fpu_calculate_wm_and_dlg(dc, context, pipes, pipe_cnt, vlevel);
 	DC_FP_END();
 }
 
@@ -2351,40 +1971,6 @@ bool dcn30_validate_bandwidth(struct dc *dc,
 	return out;
 }
 
-/*
- * This must be noinline to ensure anything that deals with FP registers
- * is contained within this call; previously our compiling with hard-float
- * would result in fp instructions being emitted outside of the boundaries
- * of the DC_FP_START/END macros, which makes sense as the compiler has no
- * idea about what is wrapped and what is not
- *
- * This is largely just a workaround to avoid breakage introduced with 5.6,
- * ideally all fp-using code should be moved into its own file, only that
- * should be compiled with hard-float, and all code exported from there
- * should be strictly wrapped with DC_FP_START/END
- */
-static noinline void dcn30_get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
-		unsigned int *optimal_dcfclk,
-		unsigned int *optimal_fclk)
-{
-       double bw_from_dram, bw_from_dram1, bw_from_dram2;
-
-       bw_from_dram1 = uclk_mts * dcn3_0_soc.num_chans *
-		dcn3_0_soc.dram_channel_width_bytes * (dcn3_0_soc.max_avg_dram_bw_use_normal_percent / 100);
-       bw_from_dram2 = uclk_mts * dcn3_0_soc.num_chans *
-		dcn3_0_soc.dram_channel_width_bytes * (dcn3_0_soc.max_avg_sdp_bw_use_normal_percent / 100);
-
-       bw_from_dram = (bw_from_dram1 < bw_from_dram2) ? bw_from_dram1 : bw_from_dram2;
-
-       if (optimal_fclk)
-               *optimal_fclk = bw_from_dram /
-               (dcn3_0_soc.fabric_datapath_to_dcn_data_return_bytes * (dcn3_0_soc.max_avg_sdp_bw_use_normal_percent / 100));
-
-       if (optimal_dcfclk)
-               *optimal_dcfclk =  bw_from_dram /
-               (dcn3_0_soc.return_bus_width_bytes * (dcn3_0_soc.max_avg_sdp_bw_use_normal_percent / 100));
-}
-
 void dcn30_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
 {
 	unsigned int i, j;
@@ -2399,47 +1985,43 @@ void dcn30_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 	unsigned int num_dcfclk_sta_targets = 4;
 	unsigned int num_uclk_states;
 
+	struct dc_bounding_box_max_clk dcn30_bb_max_clk;
+
+	memset(&dcn30_bb_max_clk, 0, sizeof(dcn30_bb_max_clk));
+
 	if (dc->ctx->dc_bios->vram_info.num_chans)
 		dcn3_0_soc.num_chans = dc->ctx->dc_bios->vram_info.num_chans;
 
-	if (dc->ctx->dc_bios->vram_info.dram_channel_width_bytes)
-		dcn3_0_soc.dram_channel_width_bytes = dc->ctx->dc_bios->vram_info.dram_channel_width_bytes;
-
-	dcn3_0_soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
-	dc->dml.soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
+	DC_FP_START();
+	dcn30_fpu_update_dram_channel_width_bytes(dc);
+	DC_FP_END();
 
 	if (bw_params->clk_table.entries[0].memclk_mhz) {
-		int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0, max_phyclk_mhz = 0;
 
 		for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
-			if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
-				max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
-			if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
-				max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
-			if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
-				max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
-			if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
-				max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
+			if (bw_params->clk_table.entries[i].dcfclk_mhz > dcn30_bb_max_clk.max_dcfclk_mhz)
+				dcn30_bb_max_clk.max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
+			if (bw_params->clk_table.entries[i].dispclk_mhz > dcn30_bb_max_clk.max_dispclk_mhz)
+				dcn30_bb_max_clk.max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
+			if (bw_params->clk_table.entries[i].dppclk_mhz > dcn30_bb_max_clk.max_dppclk_mhz)
+				dcn30_bb_max_clk.max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
+			if (bw_params->clk_table.entries[i].phyclk_mhz > dcn30_bb_max_clk.max_phyclk_mhz)
+				dcn30_bb_max_clk.max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
 		}
 
-		if (!max_dcfclk_mhz)
-			max_dcfclk_mhz = dcn3_0_soc.clock_limits[0].dcfclk_mhz;
-		if (!max_dispclk_mhz)
-			max_dispclk_mhz = dcn3_0_soc.clock_limits[0].dispclk_mhz;
-		if (!max_dppclk_mhz)
-			max_dppclk_mhz = dcn3_0_soc.clock_limits[0].dppclk_mhz;
-		if (!max_phyclk_mhz)
-			max_phyclk_mhz = dcn3_0_soc.clock_limits[0].phyclk_mhz;
+		DC_FP_START();
+		dcn30_fpu_update_max_clk(&dcn30_bb_max_clk);
+		DC_FP_END();
 
-		if (max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+		if (dcn30_bb_max_clk.max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
 			// If max DCFCLK is greater than the max DCFCLK STA target, insert into the DCFCLK STA target array
-			dcfclk_sta_targets[num_dcfclk_sta_targets] = max_dcfclk_mhz;
+			dcfclk_sta_targets[num_dcfclk_sta_targets] = dcn30_bb_max_clk.max_dcfclk_mhz;
 			num_dcfclk_sta_targets++;
-		} else if (max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+		} else if (dcn30_bb_max_clk.max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
 			// If max DCFCLK is less than the max DCFCLK STA target, cap values and remove duplicates
 			for (i = 0; i < num_dcfclk_sta_targets; i++) {
-				if (dcfclk_sta_targets[i] > max_dcfclk_mhz) {
-					dcfclk_sta_targets[i] = max_dcfclk_mhz;
+				if (dcfclk_sta_targets[i] > dcn30_bb_max_clk.max_dcfclk_mhz) {
+					dcfclk_sta_targets[i] = dcn30_bb_max_clk.max_dcfclk_mhz;
 					break;
 				}
 			}
@@ -2452,7 +2034,7 @@ void dcn30_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 		// Calculate optimal dcfclk for each uclk
 		for (i = 0; i < num_uclk_states; i++) {
 			DC_FP_START();
-			dcn30_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
+			dcn30_fpu_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
 					&optimal_dcfclk_for_uclk[i], NULL);
 			DC_FP_END();
 			if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
@@ -2479,7 +2061,7 @@ void dcn30_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 				dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
 				dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
 			} else {
-				if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+				if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= dcn30_bb_max_clk.max_dcfclk_mhz) {
 					dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
 					dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
 				} else {
@@ -2494,33 +2076,15 @@ void dcn30_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 		}
 
 		while (j < num_uclk_states && num_states < DC__VOLTAGE_STATES &&
-				optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+				optimal_dcfclk_for_uclk[j] <= dcn30_bb_max_clk.max_dcfclk_mhz) {
 			dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
 			dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
 		}
 
 		dcn3_0_soc.num_states = num_states;
-		for (i = 0; i < dcn3_0_soc.num_states; i++) {
-			dcn3_0_soc.clock_limits[i].state = i;
-			dcn3_0_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
-			dcn3_0_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
-			dcn3_0_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
-
-			/* Fill all states with max values of all other clocks */
-			dcn3_0_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
-			dcn3_0_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
-			dcn3_0_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
-			dcn3_0_soc.clock_limits[i].dtbclk_mhz = dcn3_0_soc.clock_limits[0].dtbclk_mhz;
-			/* These clocks cannot come from bw_params, always fill from dcn3_0_soc[1] */
-			/* FCLK, PHYCLK_D18, SOCCLK, DSCCLK */
-			dcn3_0_soc.clock_limits[i].phyclk_d18_mhz = dcn3_0_soc.clock_limits[0].phyclk_d18_mhz;
-			dcn3_0_soc.clock_limits[i].socclk_mhz = dcn3_0_soc.clock_limits[0].socclk_mhz;
-			dcn3_0_soc.clock_limits[i].dscclk_mhz = dcn3_0_soc.clock_limits[0].dscclk_mhz;
-		}
-		/* re-init DML with updated bb */
-		dml_init_instance(&dc->dml, &dcn3_0_soc, &dcn3_0_ip, DML_PROJECT_DCN30);
-		if (dc->current_state)
-			dml_init_instance(&dc->current_state->bw_ctx.dml, &dcn3_0_soc, &dcn3_0_ip, DML_PROJECT_DCN30);
+		DC_FP_START();
+		dcn30_fpu_update_bw_bounding_box(dc, bw_params, &dcn30_bb_max_clk, dcfclk_mhz, dram_speed_mts);
+		DC_FP_END();
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.h
index b92e4cc0232f..3330a1026fa5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.h
@@ -35,6 +35,9 @@ struct dc;
 struct resource_pool;
 struct _vcs_dpi_display_pipe_params_st;
 
+extern struct _vcs_dpi_ip_params_st dcn3_0_ip;
+extern struct _vcs_dpi_soc_bounding_box_st dcn3_0_soc;
+
 struct dcn30_resource_pool {
 	struct resource_pool base;
 };
@@ -96,4 +99,6 @@ enum dc_status dcn30_add_stream_to_ctx(
 
 void dcn30_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params);
 
+void dcn30_setup_mclk_switch_using_fw_based_vblank_stretch(struct dc *dc, struct dc_state *context);
+
 #endif /* _DCN30_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
index 4daf8931aa7c..a5df74110284 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
@@ -81,6 +81,8 @@
 #include "dce/dce_aux.h"
 #include "dce/dce_i2c.h"
 
+#include "dml/dcn30/dcn30_fpu.h"
+
 #include "dml/dcn30/display_mode_vba_30.h"
 #include "dml/dcn301/dcn301_fpu.h"
 #include "vm_helper.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
index f0938653bb88..f537888f4fa6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
@@ -43,6 +43,8 @@
 #include "dcn20/dcn20_dsc.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "dml/dcn30/dcn30_fpu.h"
+
 #include "dcn10/dcn10_resource.h"
 
 #include "dce/dce_abm.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
index 4fcbc0502808..76f863eb86ef 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
@@ -25,6 +25,8 @@
 #include "dcn20/dcn20_dsc.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "dml/dcn30/dcn30_fpu.h"
+
 #include "dcn10/dcn10_resource.h"
 
 #include "dc_link_ddc.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index ccf1b71a8269..3d9f07d4770b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -36,6 +36,8 @@
 #include "dcn20/dcn20_resource.h"
 #include "dcn30/dcn30_resource.h"
 
+#include "dml/dcn30/dcn30_fpu.h"
+
 #include "dcn10/dcn10_ipp.h"
 #include "dcn30/dcn30_hubbub.h"
 #include "dcn31/dcn31_hubbub.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index ee911452c048..a64b88ca01a9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -71,6 +71,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) $(fram
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/dcn30_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/dcn31_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn302/dcn302_fpu.o := $(dml_ccflags)
@@ -113,7 +114,7 @@ DML += dcn20/dcn20_fpu.o
 DML += display_mode_vba.o dcn20/display_rq_dlg_calc_20.o dcn20/display_mode_vba_20.o
 DML += dcn20/display_rq_dlg_calc_20v2.o dcn20/display_mode_vba_20v2.o
 DML += dcn21/display_rq_dlg_calc_21.o dcn21/display_mode_vba_21.o
-DML += dcn30/display_mode_vba_30.o dcn30/display_rq_dlg_calc_30.o
+DML += dcn30/dcn30_fpu.o dcn30/display_mode_vba_30.o dcn30/display_rq_dlg_calc_30.o
 DML += dcn31/display_mode_vba_31.o dcn31/display_rq_dlg_calc_31.o
 DML += dcn31/dcn31_fpu.o
 DML += dcn301/dcn301_fpu.o
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
new file mode 100644
index 000000000000..574676a0711a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
@@ -0,0 +1,617 @@
+/*
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
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
+#include "resource.h"
+#include "clk_mgr.h"
+#include "reg_helper.h"
+#include "dcn_calc_math.h"
+#include "dcn20/dcn20_resource.h"
+#include "dcn30/dcn30_resource.h"
+
+
+#include "display_mode_vba_30.h"
+#include "dcn30_fpu.h"
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
+
+struct _vcs_dpi_ip_params_st dcn3_0_ip = {
+	.use_min_dcfclk = 0,
+	.clamp_min_dcfclk = 0,
+	.odm_capable = 1,
+	.gpuvm_enable = 0,
+	.hostvm_enable = 0,
+	.gpuvm_max_page_table_levels = 4,
+	.hostvm_max_page_table_levels = 4,
+	.hostvm_cached_page_table_levels = 0,
+	.pte_group_size_bytes = 2048,
+	.num_dsc = 6,
+	.rob_buffer_size_kbytes = 184,
+	.det_buffer_size_kbytes = 184,
+	.dpte_buffer_size_in_pte_reqs_luma = 84,
+	.pde_proc_buffer_size_64k_reqs = 48,
+	.dpp_output_buffer_pixels = 2560,
+	.opp_output_buffer_lines = 1,
+	.pixel_chunk_size_kbytes = 8,
+	.pte_enable = 1,
+	.max_page_table_levels = 2,
+	.pte_chunk_size_kbytes = 2,  // ?
+	.meta_chunk_size_kbytes = 2,
+	.writeback_chunk_size_kbytes = 8,
+	.line_buffer_size_bits = 789504,
+	.is_line_buffer_bpp_fixed = 0,  // ?
+	.line_buffer_fixed_bpp = 0,     // ?
+	.dcc_supported = true,
+	.writeback_interface_buffer_size_kbytes = 90,
+	.writeback_line_buffer_buffer_size = 0,
+	.max_line_buffer_lines = 12,
+	.writeback_luma_buffer_size_kbytes = 12,  // writeback_line_buffer_buffer_size = 656640
+	.writeback_chroma_buffer_size_kbytes = 8,
+	.writeback_chroma_line_buffer_width_pixels = 4,
+	.writeback_max_hscl_ratio = 1,
+	.writeback_max_vscl_ratio = 1,
+	.writeback_min_hscl_ratio = 1,
+	.writeback_min_vscl_ratio = 1,
+	.writeback_max_hscl_taps = 1,
+	.writeback_max_vscl_taps = 1,
+	.writeback_line_buffer_luma_buffer_size = 0,
+	.writeback_line_buffer_chroma_buffer_size = 14643,
+	.cursor_buffer_size = 8,
+	.cursor_chunk_size = 2,
+	.max_num_otg = 6,
+	.max_num_dpp = 6,
+	.max_num_wb = 1,
+	.max_dchub_pscl_bw_pix_per_clk = 4,
+	.max_pscl_lb_bw_pix_per_clk = 2,
+	.max_lb_vscl_bw_pix_per_clk = 4,
+	.max_vscl_hscl_bw_pix_per_clk = 4,
+	.max_hscl_ratio = 6,
+	.max_vscl_ratio = 6,
+	.hscl_mults = 4,
+	.vscl_mults = 4,
+	.max_hscl_taps = 8,
+	.max_vscl_taps = 8,
+	.dispclk_ramp_margin_percent = 1,
+	.underscan_factor = 1.11,
+	.min_vblank_lines = 32,
+	.dppclk_delay_subtotal = 46,
+	.dynamic_metadata_vm_enabled = true,
+	.dppclk_delay_scl_lb_only = 16,
+	.dppclk_delay_scl = 50,
+	.dppclk_delay_cnvc_formatter = 27,
+	.dppclk_delay_cnvc_cursor = 6,
+	.dispclk_delay_subtotal = 119,
+	.dcfclk_cstate_latency = 5.2, // SRExitTime
+	.max_inter_dcn_tile_repeaters = 8,
+	.max_num_hdmi_frl_outputs = 1,
+	.odm_combine_4to1_supported = true,
+
+	.xfc_supported = false,
+	.xfc_fill_bw_overhead_percent = 10.0,
+	.xfc_fill_constant_bytes = 0,
+	.gfx7_compat_tiling_supported = 0,
+	.number_of_cursors = 1,
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn3_0_soc = {
+	.clock_limits = {
+			{
+				.state = 0,
+				.dispclk_mhz = 562.0,
+				.dppclk_mhz = 300.0,
+				.phyclk_mhz = 300.0,
+				.phyclk_d18_mhz = 667.0,
+				.dscclk_mhz = 405.6,
+			},
+		},
+
+	.min_dcfclk = 500.0, /* TODO: set this to actual min DCFCLK */
+	.num_states = 1,
+	.sr_exit_time_us = 15.5,
+	.sr_enter_plus_exit_time_us = 20,
+	.urgent_latency_us = 4.0,
+	.urgent_latency_pixel_data_only_us = 4.0,
+	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+	.urgent_latency_vm_data_only_us = 4.0,
+	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 80.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 40.0,
+	.max_avg_sdp_bw_use_normal_percent = 60.0,
+	.max_avg_dram_bw_use_normal_percent = 40.0,
+	.writeback_latency_us = 12.0,
+	.max_request_size_bytes = 256,
+	.fabric_datapath_to_dcn_data_return_bytes = 64,
+	.dcn_downspread_percent = 0.5,
+	.downspread_percent = 0.38,
+	.dram_page_open_time_ns = 50.0,
+	.dram_rw_turnaround_time_ns = 17.5,
+	.dram_return_buffer_per_channel_bytes = 8192,
+	.round_trip_ping_latency_dcfclk_cycles = 191,
+	.urgent_out_of_order_return_per_channel_bytes = 4096,
+	.channel_interleave_bytes = 256,
+	.num_banks = 8,
+	.gpuvm_min_page_size_bytes = 4096,
+	.hostvm_min_page_size_bytes = 4096,
+	.dram_clock_change_latency_us = 404,
+	.dummy_pstate_latency_us = 5,
+	.writeback_dram_clock_change_latency_us = 23.0,
+	.return_bus_width_bytes = 64,
+	.dispclk_dppclk_vco_speed_mhz = 3650,
+	.xfc_bus_transport_time_us = 20,      // ?
+	.xfc_xbuf_latency_tolerance_us = 4,  // ?
+	.use_urgent_burst_bw = 1,            // ?
+	.do_urgent_latency_adjustment = true,
+	.urgent_latency_adjustment_fabric_clock_component_us = 1.0,
+	.urgent_latency_adjustment_fabric_clock_reference_mhz = 1000,
+};
+
+
+void optc3_fpu_set_vrr_m_const(struct timing_generator *optc,
+		double vtotal_avg)
+{
+struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	double vtotal_min, vtotal_max;
+	double ratio, modulo, phase;
+	uint32_t vblank_start;
+	uint32_t v_total_mask_value = 0;
+
+	dc_assert_fp_enabled();
+
+	/* Compute VTOTAL_MIN and VTOTAL_MAX, so that
+	 * VOTAL_MAX - VTOTAL_MIN = 1
+	 */
+	v_total_mask_value = 16;
+	vtotal_min = dcn_bw_floor(vtotal_avg);
+	vtotal_max = dcn_bw_ceil(vtotal_avg);
+
+	/* Check that bottom VBLANK is at least 2 lines tall when running with
+	 * VTOTAL_MIN. Note that VTOTAL registers are defined as 'total number
+	 * of lines in a frame - 1'.
+	 */
+	REG_GET(OTG_V_BLANK_START_END, OTG_V_BLANK_START,
+		&vblank_start);
+	ASSERT(vtotal_min >= vblank_start + 1);
+
+	/* Special case where the average frame rate can be achieved
+	 * without using the DTO
+	 */
+	if (vtotal_min == vtotal_max) {
+		REG_SET(OTG_V_TOTAL, 0, OTG_V_TOTAL, (uint32_t)vtotal_min);
+
+		optc->funcs->set_vtotal_min_max(optc, 0, 0);
+		REG_SET(OTG_M_CONST_DTO0, 0, OTG_M_CONST_DTO_PHASE, 0);
+		REG_SET(OTG_M_CONST_DTO1, 0, OTG_M_CONST_DTO_MODULO, 0);
+		REG_UPDATE_3(OTG_V_TOTAL_CONTROL,
+			OTG_V_TOTAL_MIN_SEL, 0,
+			OTG_V_TOTAL_MAX_SEL, 0,
+			OTG_SET_V_TOTAL_MIN_MASK_EN, 0);
+		return;
+	}
+
+	ratio = vtotal_max - vtotal_avg;
+	modulo = 65536.0 * 65536.0 - 1.0; /* 2^32 - 1 */
+	phase = ratio * modulo;
+
+	/* Special cases where the DTO phase gets rounded to 0 or
+	 * to DTO modulo
+	 */
+	if (phase <= 0 || phase >= modulo) {
+		REG_SET(OTG_V_TOTAL, 0, OTG_V_TOTAL,
+			phase <= 0 ?
+				(uint32_t)vtotal_max : (uint32_t)vtotal_min);
+		REG_SET(OTG_V_TOTAL_MIN, 0, OTG_V_TOTAL_MIN, 0);
+		REG_SET(OTG_V_TOTAL_MAX, 0, OTG_V_TOTAL_MAX, 0);
+		REG_SET(OTG_M_CONST_DTO0, 0, OTG_M_CONST_DTO_PHASE, 0);
+		REG_SET(OTG_M_CONST_DTO1, 0, OTG_M_CONST_DTO_MODULO, 0);
+		REG_UPDATE_3(OTG_V_TOTAL_CONTROL,
+			OTG_V_TOTAL_MIN_SEL, 0,
+			OTG_V_TOTAL_MAX_SEL, 0,
+			OTG_SET_V_TOTAL_MIN_MASK_EN, 0);
+		return;
+	}
+	REG_UPDATE_6(OTG_V_TOTAL_CONTROL,
+		OTG_V_TOTAL_MIN_SEL, 1,
+		OTG_V_TOTAL_MAX_SEL, 1,
+		OTG_SET_V_TOTAL_MIN_MASK_EN, 1,
+		OTG_SET_V_TOTAL_MIN_MASK, v_total_mask_value,
+		OTG_VTOTAL_MID_REPLACING_MIN_EN, 0,
+		OTG_VTOTAL_MID_REPLACING_MAX_EN, 0);
+	REG_SET(OTG_V_TOTAL, 0, OTG_V_TOTAL, (uint32_t)vtotal_min);
+	optc->funcs->set_vtotal_min_max(optc, vtotal_min, vtotal_max);
+	REG_SET(OTG_M_CONST_DTO0, 0, OTG_M_CONST_DTO_PHASE, (uint32_t)phase);
+	REG_SET(OTG_M_CONST_DTO1, 0, OTG_M_CONST_DTO_MODULO, (uint32_t)modulo);
+}
+
+void dcn30_fpu_populate_dml_writeback_from_context(
+		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
+{
+	int pipe_cnt, i, j;
+	double max_calc_writeback_dispclk;
+	double writeback_dispclk;
+	struct writeback_st dout_wb;
+
+	dc_assert_fp_enabled();
+
+	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
+		struct dc_stream_state *stream = res_ctx->pipe_ctx[i].stream;
+
+		if (!stream)
+			continue;
+		max_calc_writeback_dispclk = 0;
+
+		/* Set writeback information */
+		pipes[pipe_cnt].dout.wb_enable = 0;
+		pipes[pipe_cnt].dout.num_active_wb = 0;
+		for (j = 0; j < stream->num_wb_info; j++) {
+			struct dc_writeback_info *wb_info = &stream->writeback_info[j];
+
+			if (wb_info->wb_enabled && wb_info->writeback_source_plane &&
+					(wb_info->writeback_source_plane == res_ctx->pipe_ctx[i].plane_state)) {
+				pipes[pipe_cnt].dout.wb_enable = 1;
+				pipes[pipe_cnt].dout.num_active_wb++;
+				dout_wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_en ?
+					wb_info->dwb_params.cnv_params.crop_height :
+					wb_info->dwb_params.cnv_params.src_height;
+				dout_wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_en ?
+					wb_info->dwb_params.cnv_params.crop_width :
+					wb_info->dwb_params.cnv_params.src_width;
+				dout_wb.wb_dst_width = wb_info->dwb_params.dest_width;
+				dout_wb.wb_dst_height = wb_info->dwb_params.dest_height;
+
+				/* For IP that doesn't support WB scaling, set h/v taps to 1 to avoid DML validation failure */
+				if (dc->dml.ip.writeback_max_hscl_taps > 1) {
+					dout_wb.wb_htaps_luma = wb_info->dwb_params.scaler_taps.h_taps;
+					dout_wb.wb_vtaps_luma = wb_info->dwb_params.scaler_taps.v_taps;
+				} else {
+					dout_wb.wb_htaps_luma = 1;
+					dout_wb.wb_vtaps_luma = 1;
+				}
+				dout_wb.wb_htaps_chroma = 0;
+				dout_wb.wb_vtaps_chroma = 0;
+				dout_wb.wb_hratio = wb_info->dwb_params.cnv_params.crop_en ?
+					(double)wb_info->dwb_params.cnv_params.crop_width /
+						(double)wb_info->dwb_params.dest_width :
+					(double)wb_info->dwb_params.cnv_params.src_width /
+						(double)wb_info->dwb_params.dest_width;
+				dout_wb.wb_vratio = wb_info->dwb_params.cnv_params.crop_en ?
+					(double)wb_info->dwb_params.cnv_params.crop_height /
+						(double)wb_info->dwb_params.dest_height :
+					(double)wb_info->dwb_params.cnv_params.src_height /
+						(double)wb_info->dwb_params.dest_height;
+				if (wb_info->dwb_params.cnv_params.fc_out_format == DWB_OUT_FORMAT_64BPP_ARGB ||
+					wb_info->dwb_params.cnv_params.fc_out_format == DWB_OUT_FORMAT_64BPP_RGBA)
+					dout_wb.wb_pixel_format = dm_444_64;
+				else
+					dout_wb.wb_pixel_format = dm_444_32;
+
+				/* Workaround for cases where multiple writebacks are connected to same plane
+				 * In which case, need to compute worst case and set the associated writeback parameters
+				 * This workaround is necessary due to DML computation assuming only 1 set of writeback
+				 * parameters per pipe
+				 */
+				writeback_dispclk = dml30_CalculateWriteBackDISPCLK(
+						dout_wb.wb_pixel_format,
+						pipes[pipe_cnt].pipe.dest.pixel_rate_mhz,
+						dout_wb.wb_hratio,
+						dout_wb.wb_vratio,
+						dout_wb.wb_htaps_luma,
+						dout_wb.wb_vtaps_luma,
+						dout_wb.wb_src_width,
+						dout_wb.wb_dst_width,
+						pipes[pipe_cnt].pipe.dest.htotal,
+						dc->current_state->bw_ctx.dml.ip.writeback_line_buffer_buffer_size);
+
+				if (writeback_dispclk > max_calc_writeback_dispclk) {
+					max_calc_writeback_dispclk = writeback_dispclk;
+					pipes[pipe_cnt].dout.wb = dout_wb;
+				}
+			}
+		}
+
+		pipe_cnt++;
+	}
+}
+
+void dcn30_fpu_set_mcif_arb_params(struct mcif_arb_params *wb_arb_params,
+	struct display_mode_lib *dml,
+	display_e2e_pipe_params_st *pipes,
+	int pipe_cnt,
+	int cur_pipe)
+{
+    int i;
+
+	dc_assert_fp_enabled();
+
+    for (i = 0; i < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_params->cli_watermark[0]); i++) {
+		wb_arb_params->cli_watermark[i] = get_wm_writeback_urgent(dml, pipes, pipe_cnt) * 1000;
+		wb_arb_params->pstate_watermark[i] = get_wm_writeback_dram_clock_change(dml, pipes, pipe_cnt) * 1000;
+    }
+
+    wb_arb_params->dram_speed_change_duration = dml->vba.WritebackAllowDRAMClockChangeEndPosition[cur_pipe] * pipes[0].clks_cfg.refclk_mhz; /* num_clock_cycles = us * MHz */
+}
+
+void dcn30_fpu_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
+{
+
+dc_assert_fp_enabled();
+
+if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].valid) {
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
+		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us;
+		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us;
+	}
+}
+
+void dcn30_fpu_calculate_wm_and_dlg(
+		struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt,
+		int vlevel)
+{
+int maxMpcComb = context->bw_ctx.dml.vba.maxMpcComb;
+	int i, pipe_idx;
+	double dcfclk = context->bw_ctx.dml.vba.DCFCLKState[vlevel][maxMpcComb];
+	bool pstate_en = context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][maxMpcComb] != dm_dram_clock_change_unsupported;
+
+dc_assert_fp_enabled();
+
+	if (context->bw_ctx.dml.soc.min_dcfclk > dcfclk)
+		dcfclk = context->bw_ctx.dml.soc.min_dcfclk;
+
+	pipes[0].clks_cfg.voltage = vlevel;
+	pipes[0].clks_cfg.dcfclk_mhz = dcfclk;
+	pipes[0].clks_cfg.socclk_mhz = context->bw_ctx.dml.soc.clock_limits[vlevel].socclk_mhz;
+
+	/* Set B:
+	 * DCFCLK: 1GHz or min required above 1GHz
+	 * FCLK/UCLK: Max
+	 */
+	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].valid) {
+		if (vlevel == 0) {
+			pipes[0].clks_cfg.voltage = 1;
+			pipes[0].clks_cfg.dcfclk_mhz = context->bw_ctx.dml.soc.clock_limits[0].dcfclk_mhz;
+		}
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us;
+		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us;
+		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us;
+	}
+	context->bw_ctx.bw.dcn.watermarks.b.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+
+	pipes[0].clks_cfg.voltage = vlevel;
+	pipes[0].clks_cfg.dcfclk_mhz = dcfclk;
+
+	/* Set D:
+	 * DCFCLK: Min Required
+	 * FCLK(proportional to UCLK): 1GHz or Max
+	 * MALL stutter, sr_enter_exit = 4, sr_exit = 2us
+	 */
+	/*
+	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].valid) {
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.pstate_latency_us;
+		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_enter_plus_exit_time_us;
+		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_exit_time_us;
+	}
+	context->bw_ctx.bw.dcn.watermarks.d.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	*/
+
+	/* Set C:
+	 * DCFCLK: Min Required
+	 * FCLK(proportional to UCLK): 1GHz or Max
+	 * pstate latency overridden to 5us
+	 */
+	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].valid) {
+		unsigned int min_dram_speed_mts = context->bw_ctx.dml.vba.DRAMSpeed;
+		unsigned int min_dram_speed_mts_margin = 160;
+
+		if (context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb] == dm_dram_clock_change_unsupported)
+			min_dram_speed_mts = dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz * 16;
+
+		/* find largest table entry that is lower than dram speed, but lower than DPM0 still uses DPM0 */
+		for (i = 3; i > 0; i--)
+			if (min_dram_speed_mts + min_dram_speed_mts_margin > dc->clk_mgr->bw_params->dummy_pstate_table[i].dram_speed_mts)
+				break;
+
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->dummy_pstate_table[i].dummy_pstate_latency_us;
+
+		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us;
+		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us;
+	}
+
+	context->bw_ctx.bw.dcn.watermarks.c.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+
+	if (!pstate_en) {
+		/* The only difference between A and C is p-state latency, if p-state is not supported we want to
+		 * calculate DLG based on dummy p-state latency, and max out the set A p-state watermark
+		 */
+		context->bw_ctx.bw.dcn.watermarks.a = context->bw_ctx.bw.dcn.watermarks.c;
+		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = 0;
+	} else {
+		/* Set A:
+		 * DCFCLK: Min Required
+		 * FCLK(proportional to UCLK): 1GHz or Max
+		 *
+		 * Set A calculated last so that following calculations are based on Set A
+		 */
+		dc->res_pool->funcs->update_soc_for_wm_a(dc, context);
+		context->bw_ctx.bw.dcn.watermarks.a.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	}
+
+	context->perf_params.stutter_period_us = context->bw_ctx.dml.vba.StutterPeriod;
+
+	/* Make set D = set A until set D is enabled */
+	context->bw_ctx.bw.dcn.watermarks.d = context->bw_ctx.bw.dcn.watermarks.a;
+
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		if (!context->res_ctx.pipe_ctx[i].stream)
+			continue;
+
+		pipes[pipe_idx].clks_cfg.dispclk_mhz = get_dispclk_calculated(&context->bw_ctx.dml, pipes, pipe_cnt);
+		pipes[pipe_idx].clks_cfg.dppclk_mhz = get_dppclk_calculated(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
+
+		if (dc->config.forced_clocks) {
+			pipes[pipe_idx].clks_cfg.dispclk_mhz = context->bw_ctx.dml.soc.clock_limits[0].dispclk_mhz;
+			pipes[pipe_idx].clks_cfg.dppclk_mhz = context->bw_ctx.dml.soc.clock_limits[0].dppclk_mhz;
+		}
+		if (dc->debug.min_disp_clk_khz > pipes[pipe_idx].clks_cfg.dispclk_mhz * 1000)
+			pipes[pipe_idx].clks_cfg.dispclk_mhz = dc->debug.min_disp_clk_khz / 1000.0;
+		if (dc->debug.min_dpp_clk_khz > pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000)
+			pipes[pipe_idx].clks_cfg.dppclk_mhz = dc->debug.min_dpp_clk_khz / 1000.0;
+
+		pipe_idx++;
+	}
+
+	DC_FP_START();
+	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
+	DC_FP_END();
+
+	if (!pstate_en)
+		/* Restore full p-state latency */
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us =
+				dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
+
+}
+
+void dcn30_fpu_update_dram_channel_width_bytes(struct dc *dc)
+{
+	dc_assert_fp_enabled();
+
+	if (dc->ctx->dc_bios->vram_info.dram_channel_width_bytes)
+		dcn3_0_soc.dram_channel_width_bytes = dc->ctx->dc_bios->vram_info.dram_channel_width_bytes;
+}
+
+void dcn30_fpu_update_max_clk(struct dc_bounding_box_max_clk *dcn30_bb_max_clk)
+{
+		dc_assert_fp_enabled();
+
+		if (!dcn30_bb_max_clk->max_dcfclk_mhz)
+			dcn30_bb_max_clk->max_dcfclk_mhz = dcn3_0_soc.clock_limits[0].dcfclk_mhz;
+		if (!dcn30_bb_max_clk->max_dispclk_mhz)
+			dcn30_bb_max_clk->max_dispclk_mhz = dcn3_0_soc.clock_limits[0].dispclk_mhz;
+		if (!dcn30_bb_max_clk->max_dppclk_mhz)
+			dcn30_bb_max_clk->max_dppclk_mhz = dcn3_0_soc.clock_limits[0].dppclk_mhz;
+		if (!dcn30_bb_max_clk->max_phyclk_mhz)
+			dcn30_bb_max_clk->max_phyclk_mhz = dcn3_0_soc.clock_limits[0].phyclk_mhz;
+}
+
+void dcn30_fpu_get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
+		unsigned int *optimal_dcfclk,
+		unsigned int *optimal_fclk)
+{
+	double bw_from_dram, bw_from_dram1, bw_from_dram2;
+
+	dc_assert_fp_enabled();
+
+	bw_from_dram1 = uclk_mts * dcn3_0_soc.num_chans *
+		dcn3_0_soc.dram_channel_width_bytes * (dcn3_0_soc.max_avg_dram_bw_use_normal_percent / 100);
+	bw_from_dram2 = uclk_mts * dcn3_0_soc.num_chans *
+		dcn3_0_soc.dram_channel_width_bytes * (dcn3_0_soc.max_avg_sdp_bw_use_normal_percent / 100);
+
+	bw_from_dram = (bw_from_dram1 < bw_from_dram2) ? bw_from_dram1 : bw_from_dram2;
+
+	if (optimal_fclk)
+		*optimal_fclk = bw_from_dram /
+		(dcn3_0_soc.fabric_datapath_to_dcn_data_return_bytes * (dcn3_0_soc.max_avg_sdp_bw_use_normal_percent / 100));
+
+	if (optimal_dcfclk)
+		*optimal_dcfclk =  bw_from_dram /
+		(dcn3_0_soc.return_bus_width_bytes * (dcn3_0_soc.max_avg_sdp_bw_use_normal_percent / 100));
+}
+
+void dcn30_fpu_update_bw_bounding_box(struct dc *dc,
+	struct clk_bw_params *bw_params,
+	struct dc_bounding_box_max_clk *dcn30_bb_max_clk,
+	unsigned int *dcfclk_mhz,
+	unsigned int *dram_speed_mts)
+{
+	unsigned int i;
+
+	dc_assert_fp_enabled();
+
+	dcn3_0_soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
+	dc->dml.soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
+
+	for (i = 0; i < dcn3_0_soc.num_states; i++) {
+		dcn3_0_soc.clock_limits[i].state = i;
+		dcn3_0_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
+		dcn3_0_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
+		dcn3_0_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
+
+		/* Fill all states with max values of all other clocks */
+		dcn3_0_soc.clock_limits[i].dispclk_mhz = dcn30_bb_max_clk->max_dispclk_mhz;
+		dcn3_0_soc.clock_limits[i].dppclk_mhz  = dcn30_bb_max_clk->max_dppclk_mhz;
+		dcn3_0_soc.clock_limits[i].phyclk_mhz  = dcn30_bb_max_clk->max_phyclk_mhz;
+		dcn3_0_soc.clock_limits[i].dtbclk_mhz = dcn3_0_soc.clock_limits[0].dtbclk_mhz;
+		/* These clocks cannot come from bw_params, always fill from dcn3_0_soc[1] */
+		/* FCLK, PHYCLK_D18, SOCCLK, DSCCLK */
+		dcn3_0_soc.clock_limits[i].phyclk_d18_mhz = dcn3_0_soc.clock_limits[0].phyclk_d18_mhz;
+		dcn3_0_soc.clock_limits[i].socclk_mhz = dcn3_0_soc.clock_limits[0].socclk_mhz;
+		dcn3_0_soc.clock_limits[i].dscclk_mhz = dcn3_0_soc.clock_limits[0].dscclk_mhz;
+	}
+	/* re-init DML with updated bb */
+	dml_init_instance(&dc->dml, &dcn3_0_soc, &dcn3_0_ip, DML_PROJECT_DCN30);
+	if (dc->current_state)
+		dml_init_instance(&dc->current_state->bw_ctx.dml, &dcn3_0_soc, &dcn3_0_ip, DML_PROJECT_DCN30);
+
+}
+
+
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
new file mode 100644
index 000000000000..dedfe7b5f173
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
@@ -0,0 +1,67 @@
+/*
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
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
+#ifndef __DCN30_FPU_H__
+#define __DCN30_FPU_H__
+
+#include "core_types.h"
+#include "dcn20/dcn20_optc.h"
+
+void optc3_fpu_set_vrr_m_const(struct timing_generator *optc,
+		double vtotal_avg);
+
+void dcn30_fpu_populate_dml_writeback_from_context(
+		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
+
+void dcn30_fpu_set_mcif_arb_params(struct mcif_arb_params *wb_arb_params,
+	struct display_mode_lib *dml,
+	display_e2e_pipe_params_st *pipes,
+	int pipe_cnt,
+	int cur_pipe);
+
+void dcn30_fpu_update_soc_for_wm_a(struct dc *dc, struct dc_state *context);
+
+void dcn30_fpu_calculate_wm_and_dlg(
+		struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt,
+		int vlevel);
+
+void dcn30_fpu_update_dram_channel_width_bytes(struct dc *dc);
+
+void dcn30_fpu_update_max_clk(struct dc_bounding_box_max_clk *dcn30_bb_max_clk);
+
+void dcn30_fpu_get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
+		unsigned int *optimal_dcfclk,
+		unsigned int *optimal_fclk);
+
+void dcn30_fpu_update_bw_bounding_box(struct dc *dc,
+	struct clk_bw_params *bw_params,
+	struct dc_bounding_box_max_clk *dcn30_bb_max_clk,
+	unsigned int *dcfclk_mhz,
+	unsigned int *dram_speed_mts);
+
+
+#endif /* __DCN30_FPU_H__*/
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 26f3a55c35d7..555d4d9e1454 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -486,4 +486,11 @@ struct dc_state {
 	} perf_params;
 };
 
+struct dc_bounding_box_max_clk {
+	int max_dcfclk_mhz;
+	int max_dispclk_mhz;
+	int max_dppclk_mhz;
+	int max_phyclk_mhz;
+};
+
 #endif /* _CORE_TYPES_H_ */
-- 
2.25.1


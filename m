Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6286B9BC
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Feb 2024 22:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C8B10E377;
	Wed, 28 Feb 2024 21:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EZlNG5/S";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3B10E3A8
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Feb 2024 21:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjMiegp9LlN/JWExGFXPNJJ1wbGPitpmy2YrkQYUlt6AXwfYgf7NjbaGzBL3PIf/h3GFDXv2q4pfVmNJcJWngnGzaVcViX78A69/KTOfnAqrxMQmFvJmFRkKycKWy3BjATCWjImx8i9qgl0/+h+Usb7HyeqjN8BPpuKafLtuXW/DBNjisn+IsGdKaJkGEzqRJFSHIQK6XIee7yOeF9/gPd0c0FRuWIB8+b+sLtNhSkuWqVvW5CjZILSFm9Vl82g1mb48a6yuVtYKTqfj9sGK/KYIsNz2jW8lgD1v+O5X/yj2u9QSN9reH07lAISTpRLZaR9wZgIv3hTktMcrTXSHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPr5lsHk1z0yd1dogMRSyEFYJCaLdGGk8BTGdFMfjUY=;
 b=oXmggL+LBuGi/xe4VNwXs+Lh+FJ7c32dfa90ARW4efmSZ43TypASAZ+bxeXs7YNSHeggxXz234ZwXCSsKEjrqCWPATF0Q2xt5UaIPHk+kDbfURQ4z/HJVMGe4av0uyJLhI4/Qrvfd0z0rtWkQBEkiEIYO29GA1Y7R8cJWxuwRSqb5hsf4ro1GYYDjRx16MTUZP9JyTHJ6K7dWuFtqnVMwrXmgh+KY9H751Oq/zMbZtTZm+R18SVIUo7yB5gYl77ERLB1ND7tnItswMUOPGiOspJR3q8KlpSoD79ec14x/s1iduKtfy49HKtAG8aVk6vOfstemroLaMLRdovq04OHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPr5lsHk1z0yd1dogMRSyEFYJCaLdGGk8BTGdFMfjUY=;
 b=EZlNG5/Spg/TIjHno2lpIN1YCSN19hRiYDoN16scjguXh72VL97sQjM4zN17POnvMWYeC1TI7HvUonp7XriL0zBCRQZKqoIGXe1Ix2XP75cHu9/Mmf+J3Ze/D/EdKPQ5E00G6r9Jbg4sEdNOnM6QOHGZb02yzMLdqv4XRSY1S5k=
Received: from BN0PR04CA0005.namprd04.prod.outlook.com (2603:10b6:408:ee::10)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Wed, 28 Feb
 2024 21:17:04 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::a1) by BN0PR04CA0005.outlook.office365.com
 (2603:10b6:408:ee::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Wed, 28 Feb 2024 21:17:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 21:17:04 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 15:17:02 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [PATCH 5/6] drm/amd/display: add DC changes for DCN351
Date: Wed, 28 Feb 2024 16:16:36 -0500
Message-ID: <20240228211638.36109-5-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228211638.36109-1-hamza.mahfooz@amd.com>
References: <20240228211638.36109-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 4208a0ec-d588-4787-e2f7-08dc38a29cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRWQlZcCdY/PlcYQB4UmyAZa0cgHsSaBnrVLYG338LmtTareFz779tcEF02lJdRSO063SNa+KHZwarwDdYnZdbvUpQwI7+zr/Ccw3B8fLrMb6Ne7lOcbPHwm7jluEp8z4LxU2GFrpOYnUyJWNLBzRdLFpVQWnAEW2rB8Y4pPYnEyP9mvS5NQHgax2JTa3Lis/e3O/5xHXfpY735+TN9xV/9e3bsMugA3tI9zuGi5L6UKIwA6+3PB8TpuDNWUroycLkNKnokLohcn6qCSd7VwJcwMFFMIZMdzoHOIQuyeRascYwZ721fLULFQdvxCBISkKTE3vbZT+8iJ2pUnlUJFEI5hKDLMk6JFgVi5Ed7hey+2f79ay6mJx4mesP6d+EPM/qf5d/II4hiSKLPBJtXuziP6T1eass7x0c0blYcGiKoBGmtf7oXorXqUMG++u1Cw3vY/aalZJ09UdxrdkV+LdulW+FtLXsFPzMT+iP7lsFMq8SvOz4xpJCHB/C3e7HQk+xzxwc7pUnwiHrCQa5XXlGmKt28lD3L9eYJALFUk0u7ulbkriWxmIn0aLX91uxtuGLAJUylBDD5cDWKylYgvuMRijDvJJ+BUwodgE9sVNXIRtXIUF/ObEhEkZy06kyL6bt9UbEoxCufXJPksh79JAEsVNyW6WvqnQEtxc9N+P4r+hTId6dBaBIuf9GLDZkn9HX9zC5HuTveMWyeGH/GFo4dWhaI8q74ZIOBfZN+xhYkMU/XMSx3JBPK8Xmvxumnj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 21:17:04.4080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4208a0ec-d588-4787-e2f7-08dc38a29cc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add DC support for DCN 3.5.1.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../display/dc/bios/command_table_helper2.c   |    1 +
 .../gpu/drm/amd/display/dc/core/dc_resource.c |    6 +
 .../dc/dcn35/dcn35_dio_stream_encoder.h       |    1 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |    3 +
 .../amd/display/dc/dml/dcn351/dcn351_fpu.c    |  574 +++++
 .../amd/display/dc/dml/dcn351/dcn351_fpu.h    |   19 +
 .../gpu/drm/amd/display/dc/gpio/hw_factory.c  |    1 +
 .../drm/amd/display/dc/gpio/hw_translate.c    |    1 +
 drivers/gpu/drm/amd/display/dc/hwss/Makefile  |    8 +
 .../amd/display/dc/hwss/dcn351/CMakeLists.txt |    4 -
 .../gpu/drm/amd/display/dc/resource/Makefile  |    8 +
 .../dc/resource/dcn351/dcn351_resource.c      | 2156 +++++++++++++++++
 .../dc/resource/dcn351/dcn351_resource.h      |   23 +
 13 files changed, 2801 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/CMakeLists.txt
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.h

diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
index 9d347960e2b0..117fc6d4c1de 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
@@ -81,6 +81,7 @@ bool dal_bios_parser_init_cmd_tbl_helper2(
 	case DCN_VERSION_3_2:
 	case DCN_VERSION_3_21:
 	case DCN_VERSION_3_5:
+	case DCN_VERSION_3_51:
 		*h = dal_cmd_tbl_helper_dce112_get_table2();
 		return true;
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 1b7765bc5e5e..ec4bf9432bdb 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -73,6 +73,7 @@
 #include "dcn32/dcn32_resource.h"
 #include "dcn321/dcn321_resource.h"
 #include "dcn35/dcn35_resource.h"
+#include "dcn351/dcn351_resource.h"
 
 #define VISUAL_CONFIRM_BASE_DEFAULT 3
 #define VISUAL_CONFIRM_BASE_MIN 1
@@ -195,6 +196,8 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
 		break;
 	case AMDGPU_FAMILY_GC_11_5_0:
 		dc_version = DCN_VERSION_3_5;
+		if (ASICREV_IS_GC_11_0_4(asic_id.hw_internal_rev))
+			dc_version = DCN_VERSION_3_51;
 		break;
 	default:
 		dc_version = DCE_VERSION_UNKNOWN;
@@ -303,6 +306,9 @@ struct resource_pool *dc_create_resource_pool(struct dc  *dc,
 	case DCN_VERSION_3_5:
 		res_pool = dcn35_create_resource_pool(init_data, dc);
 		break;
+	case DCN_VERSION_3_51:
+		res_pool = dcn351_create_resource_pool(init_data, dc);
+		break;
 #endif /* CONFIG_DRM_AMD_DC_FP */
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_stream_encoder.h
index 1212fcee38f2..499052329ebb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_stream_encoder.h
@@ -28,6 +28,7 @@
 #include "dcn30/dcn30_vpg.h"
 #include "dcn30/dcn30_afmt.h"
 #include "stream_encoder.h"
+#include "dcn10/dcn10_link_encoder.h"
 #include "dcn20/dcn20_stream_encoder.h"
 
 /* Register bit field name change */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 59ade76ffb18..c4a5efd2dda5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -92,6 +92,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_rq_dlg_calc_32.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_util_32.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn321/dcn321_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn35/dcn35_fpu.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn351/dcn351_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/dcn31_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn302/dcn302_fpu.o := $(dml_ccflags)
@@ -126,6 +127,7 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/dcn30_fpu.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn32/dcn32_fpu.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn321/dcn321_fpu.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn35/dcn35_fpu.o := $(dml_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn351/dcn351_fpu.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/dcn31_fpu.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn302/dcn302_fpu.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn303/dcn303_fpu.o := $(dml_rcflags)
@@ -157,6 +159,7 @@ DML += dcn302/dcn302_fpu.o
 DML += dcn303/dcn303_fpu.o
 DML += dcn314/dcn314_fpu.o
 DML += dcn35/dcn35_fpu.o
+DML += dcn351/dcn351_fpu.o
 DML += dsc/rc_calc_fpu.o
 DML += calcs/dcn_calcs.o calcs/dcn_calc_math.o calcs/dcn_calc_auto.o
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
new file mode 100644
index 000000000000..dc9e1b758ed6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
@@ -0,0 +1,574 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+#include "resource.h"
+#include "dcn351_fpu.h"
+#include "dcn31/dcn31_resource.h"
+#include "dcn32/dcn32_resource.h"
+#include "dcn35/dcn35_resource.h"
+#include "dcn351/dcn351_resource.h"
+#include "dml/dcn31/dcn31_fpu.h"
+#include "dml/dcn35/dcn35_fpu.h"
+#include "dml/dml_inline_defs.h"
+
+#include "link.h"
+
+#define DC_LOGGER_INIT(logger)
+
+struct _vcs_dpi_ip_params_st dcn3_51_ip = {
+	.VBlankNomDefaultUS = 668,
+	.gpuvm_enable = 1,
+	.gpuvm_max_page_table_levels = 1,
+	.hostvm_enable = 1,
+	.hostvm_max_page_table_levels = 2,
+	.rob_buffer_size_kbytes = 64,
+	.det_buffer_size_kbytes = 1536,
+	.config_return_buffer_size_in_kbytes = 1792,
+	.compressed_buffer_segment_size_in_kbytes = 64,
+	.meta_fifo_size_in_kentries = 32,
+	.zero_size_buffer_entries = 512,
+	.compbuf_reserved_space_64b = 256,
+	.compbuf_reserved_space_zs = 64,
+	.dpp_output_buffer_pixels = 2560,/*not used*/
+	.opp_output_buffer_lines = 1,/*not used*/
+	.pixel_chunk_size_kbytes = 8,
+	//.alpha_pixel_chunk_size_kbytes = 4;/*new*/
+	//.min_pixel_chunk_size_bytes = 1024;/*new*/
+	.meta_chunk_size_kbytes = 2,
+	.min_meta_chunk_size_bytes = 256,
+	.writeback_chunk_size_kbytes = 8,
+	.ptoi_supported = false,
+	.num_dsc = 4,
+	.maximum_dsc_bits_per_component = 12,/*delta from 10*/
+	.dsc422_native_support = true,/*delta from false*/
+	.is_line_buffer_bpp_fixed = true,/*new*/
+	.line_buffer_fixed_bpp = 32,/*delta from 48*/
+	.line_buffer_size_bits = 986880,/*delta from 789504*/
+	.max_line_buffer_lines = 32,/*delta from 12*/
+	.writeback_interface_buffer_size_kbytes = 90,
+	.max_num_dpp = 4,
+	.max_num_otg = 4,
+	.max_num_hdmi_frl_outputs = 1,
+	.max_num_wb = 1,
+	/*.max_num_hdmi_frl_outputs = 1; new in dml2*/
+	/*.max_num_dp2p0_outputs = 2; new in dml2*/
+	/*.max_num_dp2p0_streams = 4; new in dml2*/
+	.max_dchub_pscl_bw_pix_per_clk = 4,
+	.max_pscl_lb_bw_pix_per_clk = 2,
+	.max_lb_vscl_bw_pix_per_clk = 4,
+	.max_vscl_hscl_bw_pix_per_clk = 4,
+	.max_hscl_ratio = 6,
+	.max_vscl_ratio = 6,
+	.max_hscl_taps = 8,
+	.max_vscl_taps = 8,
+	.dpte_buffer_size_in_pte_reqs_luma = 68,/*changed from 64,*/
+	.dpte_buffer_size_in_pte_reqs_chroma = 36,/*changed from 34*/
+	/*.dcc_meta_buffer_size_bytes = 6272; new to dml2*/
+	.dispclk_ramp_margin_percent = 1.11,/*delta from 1*/
+	/*.dppclk_delay_subtotal = 47;
+	.dppclk_delay_scl = 50;
+	.dppclk_delay_scl_lb_only = 16;
+	.dppclk_delay_cnvc_formatter = 28;
+	.dppclk_delay_cnvc_cursor = 6;
+	.dispclk_delay_subtotal = 125;*/ /*new to dml2*/
+	.max_inter_dcn_tile_repeaters = 8,
+	.cursor_buffer_size = 16,
+	.cursor_chunk_size = 2,
+	.writeback_line_buffer_buffer_size = 0,
+	.writeback_min_hscl_ratio = 1,
+	.writeback_min_vscl_ratio = 1,
+	.writeback_max_hscl_ratio = 1,
+	.writeback_max_vscl_ratio = 1,
+	.writeback_max_hscl_taps = 1,
+	.writeback_max_vscl_taps = 1,
+	.dppclk_delay_subtotal = 47, /* changed from 46,*/
+	.dppclk_delay_scl = 50,
+	.dppclk_delay_scl_lb_only = 16,
+	.dppclk_delay_cnvc_formatter = 28,/*changed from 27,*/
+	.dppclk_delay_cnvc_cursor = 6,
+	.dispclk_delay_subtotal = 125, /*changed from 119,*/
+	.dynamic_metadata_vm_enabled = false,
+	.odm_combine_4to1_supported = false,
+	.dcc_supported = true,
+//	.config_return_buffer_segment_size_in_kbytes = 64;/*required, hard coded in dml2_translate_ip_params*/
+
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn3_51_soc = {
+		/*TODO: correct dispclk/dppclk voltage level determination*/
+	.clock_limits = {
+		{
+			.state = 0,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
+			.phyclk_mhz = 600.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 186.0,
+			.dtbclk_mhz = 600.0,
+		},
+		{
+			.state = 1,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 209.0,
+			.dtbclk_mhz = 600.0,
+		},
+		{
+			.state = 2,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 209.0,
+			.dtbclk_mhz = 600.0,
+		},
+		{
+			.state = 3,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 371.0,
+			.dtbclk_mhz = 600.0,
+		},
+		{
+			.state = 4,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 417.0,
+			.dtbclk_mhz = 600.0,
+		},
+	},
+	.num_states = 5,
+	.sr_exit_time_us = 28.0,
+	.sr_enter_plus_exit_time_us = 30.0,
+	.sr_exit_z8_time_us = 210.0,
+	.sr_enter_plus_exit_z8_time_us = 320.0,
+	.fclk_change_latency_us = 24.0,
+	.usr_retraining_latency_us = 2,
+	.writeback_latency_us = 12.0,
+
+	.dram_channel_width_bytes = 4,/*not exist in dml2*/
+	.round_trip_ping_latency_dcfclk_cycles = 106,/*not exist in dml2*/
+	.urgent_latency_pixel_data_only_us = 4.0,
+	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+	.urgent_latency_vm_data_only_us = 4.0,
+	.dram_clock_change_latency_us = 11.72,
+	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+
+	.pct_ideal_sdp_bw_after_urgent = 80.0,
+	.pct_ideal_fabric_bw_after_urgent = 80.0, /*new to dml2*/
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 65.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 30.0,
+	.max_avg_sdp_bw_use_normal_percent = 60.0,
+	.max_avg_dram_bw_use_normal_percent = 60.0,
+	.fabric_datapath_to_dcn_data_return_bytes = 32,
+	.return_bus_width_bytes = 64,
+	.downspread_percent = 0.38,
+	.dcn_downspread_percent = 0.5,
+	.gpuvm_min_page_size_bytes = 4096,
+	.hostvm_min_page_size_bytes = 4096,
+	.do_urgent_latency_adjustment = 0,
+	.urgent_latency_adjustment_fabric_clock_component_us = 0,
+	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
+};
+
+/*
+ * dcn351_update_bw_bounding_box
+ *
+ * This would override some dcn3_51 ip_or_soc initial parameters hardcoded from
+ * spreadsheet with actual values as per dGPU SKU:
+ * - with passed few options from dc->config
+ * - with dentist_vco_frequency from Clk Mgr (currently hardcoded, but might
+ *   need to get it from PM FW)
+ * - with passed latency values (passed in ns units) in dc-> bb override for
+ *   debugging purposes
+ * - with passed latencies from VBIOS (in 100_ns units) if available for
+ *   certain dGPU SKU
+ * - with number of DRAM channels from VBIOS (which differ for certain dGPU SKU
+ *   of the same ASIC)
+ * - clocks levels with passed clk_table entries from Clk Mgr as reported by PM
+ *   FW for different clocks (which might differ for certain dGPU SKU of the
+ *   same ASIC)
+ */
+void dcn351_update_bw_bounding_box_fpu(struct dc *dc,
+				      struct clk_bw_params *bw_params)
+{
+	unsigned int i, closest_clk_lvl;
+	int j;
+	struct clk_limit_table *clk_table = &bw_params->clk_table;
+	struct _vcs_dpi_voltage_scaling_st *clock_limits =
+		dc->scratch.update_bw_bounding_box.clock_limits;
+	int max_dispclk_mhz = 0, max_dppclk_mhz = 0;
+
+	dc_assert_fp_enabled();
+
+	dcn3_51_ip.max_num_otg =
+		dc->res_pool->res_cap->num_timing_generator;
+	dcn3_51_ip.max_num_dpp = dc->res_pool->pipe_count;
+	dcn3_51_soc.num_chans = bw_params->num_channels;
+
+	ASSERT(clk_table->num_entries);
+
+	/* Prepass to find max clocks independent of voltage level. */
+	for (i = 0; i < clk_table->num_entries; ++i) {
+		if (clk_table->entries[i].dispclk_mhz > max_dispclk_mhz)
+			max_dispclk_mhz = clk_table->entries[i].dispclk_mhz;
+		if (clk_table->entries[i].dppclk_mhz > max_dppclk_mhz)
+			max_dppclk_mhz = clk_table->entries[i].dppclk_mhz;
+	}
+
+	for (i = 0; i < clk_table->num_entries; i++) {
+		/* loop backwards*/
+		for (closest_clk_lvl = 0, j = dcn3_51_soc.num_states - 1;
+			j >= 0; j--) {
+			if (dcn3_51_soc.clock_limits[j].dcfclk_mhz <=
+				clk_table->entries[i].dcfclk_mhz) {
+				closest_clk_lvl = j;
+				break;
+			}
+		}
+		if (clk_table->num_entries == 1) {
+			/*smu gives one DPM level, let's take the highest one*/
+			closest_clk_lvl = dcn3_51_soc.num_states - 1;
+		}
+
+		clock_limits[i].state = i;
+
+		/* Clocks dependent on voltage level. */
+		clock_limits[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
+		if (clk_table->num_entries == 1 &&
+			clock_limits[i].dcfclk_mhz <
+			dcn3_51_soc.clock_limits[closest_clk_lvl].dcfclk_mhz) {
+			/*SMU fix not released yet*/
+			clock_limits[i].dcfclk_mhz =
+				dcn3_51_soc.clock_limits[closest_clk_lvl].dcfclk_mhz;
+		}
+
+		clock_limits[i].fabricclk_mhz =
+			clk_table->entries[i].fclk_mhz;
+		clock_limits[i].socclk_mhz =
+			clk_table->entries[i].socclk_mhz;
+
+		if (clk_table->entries[i].memclk_mhz &&
+			clk_table->entries[i].wck_ratio)
+			clock_limits[i].dram_speed_mts =
+				clk_table->entries[i].memclk_mhz * 2 *
+				clk_table->entries[i].wck_ratio;
+
+		/* Clocks independent of voltage level. */
+		clock_limits[i].dispclk_mhz = max_dispclk_mhz ?
+			max_dispclk_mhz :
+			dcn3_51_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
+
+		clock_limits[i].dppclk_mhz = max_dppclk_mhz ?
+			max_dppclk_mhz :
+			dcn3_51_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
+
+		clock_limits[i].dram_bw_per_chan_gbps =
+			dcn3_51_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
+		clock_limits[i].dscclk_mhz =
+			dcn3_51_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
+		clock_limits[i].dtbclk_mhz =
+			dcn3_51_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
+		clock_limits[i].phyclk_d18_mhz =
+			dcn3_51_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
+		clock_limits[i].phyclk_mhz =
+			dcn3_51_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
+	}
+
+	memcpy(dcn3_51_soc.clock_limits, clock_limits,
+		sizeof(dcn3_51_soc.clock_limits));
+
+	if (clk_table->num_entries)
+		dcn3_51_soc.num_states = clk_table->num_entries;
+
+	if (max_dispclk_mhz) {
+		dcn3_51_soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
+		dc->dml.soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
+	}
+	if ((int)(dcn3_51_soc.dram_clock_change_latency_us * 1000)
+				!= dc->debug.dram_clock_change_latency_ns
+			&& dc->debug.dram_clock_change_latency_ns) {
+		dcn3_51_soc.dram_clock_change_latency_us =
+			dc->debug.dram_clock_change_latency_ns / 1000.0;
+	}
+
+	if (dc->bb_overrides.dram_clock_change_latency_ns > 0)
+		dcn3_51_soc.dram_clock_change_latency_us =
+			dc->bb_overrides.dram_clock_change_latency_ns / 1000.0;
+
+	if (dc->bb_overrides.sr_exit_time_ns > 0)
+		dcn3_51_soc.sr_exit_time_us = dc->bb_overrides.sr_exit_time_ns / 1000.0;
+
+	if (dc->bb_overrides.sr_enter_plus_exit_time_ns > 0)
+		dcn3_51_soc.sr_enter_plus_exit_time_us =
+			dc->bb_overrides.sr_enter_plus_exit_time_ns / 1000.0;
+
+	if (dc->bb_overrides.sr_exit_z8_time_ns > 0)
+		dcn3_51_soc.sr_exit_z8_time_us = dc->bb_overrides.sr_exit_z8_time_ns / 1000.0;
+
+	if (dc->bb_overrides.sr_enter_plus_exit_z8_time_ns > 0)
+		dcn3_51_soc.sr_enter_plus_exit_z8_time_us =
+			dc->bb_overrides.sr_enter_plus_exit_z8_time_ns / 1000.0;
+
+	/*temp till dml2 fully work without dml1*/
+	dml_init_instance(&dc->dml, &dcn3_51_soc, &dcn3_51_ip,
+			  DML_PROJECT_DCN31);
+
+	/*copy to dml2, before dml2_create*/
+	if (clk_table->num_entries > 2) {
+
+		for (i = 0; i < clk_table->num_entries; i++) {
+			dc->dml2_options.bbox_overrides.clks_table.num_states =
+				clk_table->num_entries;
+			dc->dml2_options.bbox_overrides.clks_table.clk_entries[i].dcfclk_mhz =
+				clock_limits[i].dcfclk_mhz;
+			dc->dml2_options.bbox_overrides.clks_table.clk_entries[i].fclk_mhz =
+				clock_limits[i].fabricclk_mhz;
+			dc->dml2_options.bbox_overrides.clks_table.clk_entries[i].dispclk_mhz =
+				clock_limits[i].dispclk_mhz;
+			dc->dml2_options.bbox_overrides.clks_table.clk_entries[i].dppclk_mhz =
+				clock_limits[i].dppclk_mhz;
+			dc->dml2_options.bbox_overrides.clks_table.clk_entries[i].socclk_mhz =
+				clock_limits[i].socclk_mhz;
+			dc->dml2_options.bbox_overrides.clks_table.clk_entries[i].memclk_mhz =
+				clk_table->entries[i].memclk_mhz * clk_table->entries[i].wck_ratio;
+			dc->dml2_options.bbox_overrides.clks_table.num_entries_per_clk.num_dcfclk_levels =
+				clk_table->num_entries;
+			dc->dml2_options.bbox_overrides.clks_table.num_entries_per_clk.num_fclk_levels =
+				clk_table->num_entries;
+			dc->dml2_options.bbox_overrides.clks_table.num_entries_per_clk.num_dispclk_levels =
+				clk_table->num_entries;
+			dc->dml2_options.bbox_overrides.clks_table.num_entries_per_clk.num_dppclk_levels =
+				clk_table->num_entries;
+			dc->dml2_options.bbox_overrides.clks_table.num_entries_per_clk.num_socclk_levels =
+				clk_table->num_entries;
+			dc->dml2_options.bbox_overrides.clks_table.num_entries_per_clk.num_memclk_levels =
+				clk_table->num_entries;
+		}
+	}
+
+	/* Update latency values */
+	dc->dml2_options.bbox_overrides.dram_clock_change_latency_us = dcn3_51_soc.dram_clock_change_latency_us;
+
+	dc->dml2_options.bbox_overrides.sr_exit_latency_us = dcn3_51_soc.sr_exit_time_us;
+	dc->dml2_options.bbox_overrides.sr_enter_plus_exit_latency_us = dcn3_51_soc.sr_enter_plus_exit_time_us;
+
+	dc->dml2_options.bbox_overrides.sr_exit_z8_time_us = dcn3_51_soc.sr_exit_z8_time_us;
+	dc->dml2_options.bbox_overrides.sr_enter_plus_exit_z8_time_us = dcn3_51_soc.sr_enter_plus_exit_z8_time_us;
+}
+
+static bool is_dual_plane(enum surface_pixel_format format)
+{
+	return format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN ||
+		format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA;
+}
+
+/*
+ * micro_sec_to_vert_lines () - converts time to number of vertical lines for a given timing
+ *
+ * @param: num_us: number of microseconds
+ * @return: number of vertical lines. If exact number of vertical lines is not found then
+ *          it will round up to next number of lines to guarantee num_us
+ */
+static unsigned int micro_sec_to_vert_lines(unsigned int num_us, struct dc_crtc_timing *timing)
+{
+	unsigned int num_lines = 0;
+	unsigned int lines_time_in_ns = 1000.0 *
+			(((float)timing->h_total * 1000.0) /
+			 ((float)timing->pix_clk_100hz / 10.0));
+
+	num_lines = dml_ceil(1000.0 * num_us / lines_time_in_ns, 1.0);
+
+	return num_lines;
+}
+
+static unsigned int get_vertical_back_porch(struct dc_crtc_timing *timing)
+{
+	unsigned int v_active = 0, v_blank = 0, v_back_porch = 0;
+
+	v_active = timing->v_border_top + timing->v_addressable + timing->v_border_bottom;
+	v_blank = timing->v_total - v_active;
+	v_back_porch = v_blank - timing->v_front_porch - timing->v_sync_width;
+
+	return v_back_porch;
+}
+
+int dcn351_populate_dml_pipes_from_context_fpu(struct dc *dc,
+					      struct dc_state *context,
+					      display_e2e_pipe_params_st *pipes,
+					      bool fast_validate)
+{
+	int i, pipe_cnt;
+	struct resource_context *res_ctx = &context->res_ctx;
+	struct pipe_ctx *pipe;
+	bool upscaled = false;
+	const unsigned int max_allowed_vblank_nom = 1023;
+
+	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
+					      fast_validate);
+
+	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
+		struct dc_crtc_timing *timing;
+		unsigned int num_lines = 0;
+		unsigned int v_back_porch = 0;
+
+		if (!res_ctx->pipe_ctx[i].stream)
+			continue;
+
+		pipe = &res_ctx->pipe_ctx[i];
+		timing = &pipe->stream->timing;
+
+		num_lines = micro_sec_to_vert_lines(dcn3_51_ip.VBlankNomDefaultUS, timing);
+		v_back_porch  = get_vertical_back_porch(timing);
+
+		if (pipe->stream->adjust.v_total_max ==
+		    pipe->stream->adjust.v_total_min &&
+		    pipe->stream->adjust.v_total_min > timing->v_total) {
+			pipes[pipe_cnt].pipe.dest.vtotal =
+				pipe->stream->adjust.v_total_min;
+			pipes[pipe_cnt].pipe.dest.vblank_nom = timing->v_total -
+				pipes[pipe_cnt].pipe.dest.vactive;
+		}
+
+		pipes[pipe_cnt].pipe.dest.vblank_nom = timing->v_total - pipes[pipe_cnt].pipe.dest.vactive;
+		pipes[pipe_cnt].pipe.dest.vblank_nom = min(pipes[pipe_cnt].pipe.dest.vblank_nom, num_lines);
+		// vblank_nom should not smaller than (VSync (timing->v_sync_width + v_back_porch) + 2)
+		// + 2 is because
+		// 1 -> VStartup_start should be 1 line before VSync
+		// 1 -> always reserve 1 line between start of vblank to vstartup signal
+		pipes[pipe_cnt].pipe.dest.vblank_nom =
+			max(pipes[pipe_cnt].pipe.dest.vblank_nom, timing->v_sync_width + v_back_porch + 2);
+		pipes[pipe_cnt].pipe.dest.vblank_nom = min(pipes[pipe_cnt].pipe.dest.vblank_nom, max_allowed_vblank_nom);
+
+		if (pipe->plane_state &&
+		    (pipe->plane_state->src_rect.height <
+		     pipe->plane_state->dst_rect.height ||
+		     pipe->plane_state->src_rect.width <
+		     pipe->plane_state->dst_rect.width))
+			upscaled = true;
+
+		/*
+		 * Immediate flip can be set dynamically after enabling the
+		 * plane. We need to require support for immediate flip or
+		 * underflow can be intermittently experienced depending on peak
+		 * b/w requirements.
+		 */
+		pipes[pipe_cnt].pipe.src.immediate_flip = true;
+
+		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
+
+		DC_FP_START();
+		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
+		DC_FP_END();
+
+		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
+		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
+		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
+		pipes[pipe_cnt].pipe.src.gpuvm_min_page_size_kbytes = 256;
+
+		if (pipes[pipe_cnt].dout.dsc_enable) {
+			switch (timing->display_color_depth) {
+			case COLOR_DEPTH_888:
+				pipes[pipe_cnt].dout.dsc_input_bpc = 8;
+				break;
+			case COLOR_DEPTH_101010:
+				pipes[pipe_cnt].dout.dsc_input_bpc = 10;
+				break;
+			case COLOR_DEPTH_121212:
+				pipes[pipe_cnt].dout.dsc_input_bpc = 12;
+				break;
+			default:
+				ASSERT(0);
+				break;
+			}
+		}
+
+		pipe_cnt++;
+	}
+
+	context->bw_ctx.dml.ip.det_buffer_size_kbytes = 384;/*per guide*/
+	dc->config.enable_4to1MPC = false;
+
+	if (pipe_cnt == 1 && pipe->plane_state && !dc->debug.disable_z9_mpc) {
+		if (is_dual_plane(pipe->plane_state->format)
+				&& pipe->plane_state->src_rect.width <= 1920 &&
+				pipe->plane_state->src_rect.height <= 1080) {
+			dc->config.enable_4to1MPC = true;
+		} else if (!is_dual_plane(pipe->plane_state->format) &&
+			   pipe->plane_state->src_rect.width <= 5120) {
+			/*
+			 * Limit to 5k max to avoid forced pipe split when there
+			 * is not enough detile for swath
+			 */
+			context->bw_ctx.dml.ip.det_buffer_size_kbytes = 192;
+			pipes[0].pipe.src.unbounded_req_mode = true;
+		}
+	} else if (context->stream_count >=
+		   dc->debug.crb_alloc_policy_min_disp_count &&
+		   dc->debug.crb_alloc_policy > DET_SIZE_DEFAULT) {
+		context->bw_ctx.dml.ip.det_buffer_size_kbytes =
+			dc->debug.crb_alloc_policy * 64;
+	} else if (context->stream_count >= 3 && upscaled) {
+		context->bw_ctx.dml.ip.det_buffer_size_kbytes = 192;
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (!pipe->stream)
+			continue;
+
+		if (pipe->stream->signal == SIGNAL_TYPE_EDP &&
+		    dc->debug.seamless_boot_odm_combine &&
+		    pipe->stream->apply_seamless_boot_optimization) {
+
+			if (pipe->stream->apply_boot_odm_mode ==
+			    dm_odm_combine_policy_2to1) {
+				context->bw_ctx.dml.vba.ODMCombinePolicy =
+					dm_odm_combine_policy_2to1;
+				break;
+			}
+		}
+	}
+
+	return pipe_cnt;
+}
+
+void dcn351_decide_zstate_support(struct dc *dc, struct dc_state *context)
+{
+	enum dcn_zstate_support_state support = DCN_ZSTATE_SUPPORT_DISALLOW;
+	unsigned int i, plane_count = 0;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (context->res_ctx.pipe_ctx[i].plane_state)
+			plane_count++;
+	}
+	/*dcn351 does not support z9/z10*/
+	if (context->stream_count == 0 || plane_count == 0) {
+		support = DCN_ZSTATE_SUPPORT_ALLOW_Z8_ONLY;
+	} else if (context->stream_count == 1 && context->streams[0]->signal == SIGNAL_TYPE_EDP) {
+		struct dc_link *link = context->streams[0]->sink->link;
+		bool is_pwrseq0 = link && link->link_index == 0;
+		bool is_psr = (link && (link->psr_settings.psr_version == DC_PSR_VERSION_1 ||
+								link->psr_settings.psr_version == DC_PSR_VERSION_SU_1) && !link->panel_config.psr.disable_psr);
+		bool is_replay = link && link->replay_settings.replay_feature_enabled;
+		int minmum_z8_residency =
+			dc->debug.minimum_z8_residency_time > 0 ? dc->debug.minimum_z8_residency_time : 1000;
+		bool allow_z8 = context->bw_ctx.dml.vba.StutterPeriod > (double)minmum_z8_residency;
+
+
+		/*for psr1/psr-su, we allow z8 and z10 based on latency, for replay with IPS enabled, it will enter ips2*/
+		 if (is_pwrseq0 && (is_psr || is_replay))
+			support = allow_z8 ? allow_z8 : DCN_ZSTATE_SUPPORT_DISALLOW;
+
+	}
+	context->bw_ctx.bw.dcn.clk.zstate_support = support;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h
new file mode 100644
index 000000000000..f93efab9a668
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+
+#ifndef __DCN351_FPU_H__
+#define __DCN351_FPU_H__
+
+#include "clk_mgr.h"
+
+void dcn351_update_bw_bounding_box_fpu(struct dc *dc,
+				      struct clk_bw_params *bw_params);
+
+int dcn351_populate_dml_pipes_from_context_fpu(struct dc *dc,
+					      struct dc_state *context,
+					      display_e2e_pipe_params_st *pipes,
+					      bool fast_validate);
+
+void dcn351_decide_zstate_support(struct dc *dc, struct dc_state *context);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
index 279020535af7..8f1a95b77830 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
@@ -110,6 +110,7 @@ bool dal_hw_factory_init(
 	case DCN_VERSION_3_2:
 	case DCN_VERSION_3_21:
 	case DCN_VERSION_3_5:
+	case DCN_VERSION_3_51:
 		dal_hw_factory_dcn32_init(factory);
 		return true;
 	default:
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
index d6b0a1af7d3e..37166b2b3fee 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
@@ -111,6 +111,7 @@ bool dal_hw_translate_init(
 	case DCN_VERSION_3_2:
 	case DCN_VERSION_3_21:
 	case DCN_VERSION_3_5:
+	case DCN_VERSION_3_51:
 		dal_hw_translate_dcn32_init(translate);
 		return true;
 	default:
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/Makefile b/drivers/gpu/drm/amd/display/dc/hwss/Makefile
index 254136f8e3f9..9e8e9de51a92 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/hwss/Makefile
@@ -180,6 +180,14 @@ AMD_DISPLAY_FILES += $(AMD_DAL_HWSS_DCN35)
 
 ###############################################################################
 
+HWSS_DCN351 = dcn351_init.o
+
+AMD_DAL_HWSS_DCN351 = $(addprefix $(AMDDALPATH)/dc/hwss/dcn351/,$(HWSS_DCN351))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_HWSS_DCN351)
+
+###############################################################################
+
 ###############################################################################
 
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn351/CMakeLists.txt b/drivers/gpu/drm/amd/display/dc/hwss/dcn351/CMakeLists.txt
deleted file mode 100644
index 951ca2da4486..000000000000
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn351/CMakeLists.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-dal3_subdirectory_sources(
-  dcn351_init.c
-  dcn351_init.h
-)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/Makefile b/drivers/gpu/drm/amd/display/dc/resource/Makefile
index 0a75ed8962a5..184b1f23aa77 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/resource/Makefile
@@ -194,6 +194,14 @@ AMD_DISPLAY_FILES += $(AMD_DAL_RESOURCE_DCN35)
 
 ###############################################################################
 
+RESOURCE_DCN351 = dcn351_resource.o
+
+AMD_DAL_RESOURCE_DCN351 = $(addprefix $(AMDDALPATH)/dc/resource/dcn351/,$(RESOURCE_DCN351))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_RESOURCE_DCN351)
+
+###############################################################################
+
 ###############################################################################
 
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
new file mode 100644
index 000000000000..5b486400dfdb
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -0,0 +1,2156 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+
+
+#include "dm_services.h"
+#include "dc.h"
+
+#include "dcn31/dcn31_init.h"
+#include "dcn351/dcn351_init.h"
+
+#include "resource.h"
+#include "include/irq_service_interface.h"
+#include "dcn351_resource.h"
+
+#include "dcn20/dcn20_resource.h"
+#include "dcn30/dcn30_resource.h"
+#include "dcn31/dcn31_resource.h"
+#include "dcn32/dcn32_resource.h"
+#include "dcn35/dcn35_resource.h"
+
+#include "dcn10/dcn10_ipp.h"
+#include "dcn30/dcn30_hubbub.h"
+#include "dcn31/dcn31_hubbub.h"
+#include "dcn35/dcn35_hubbub.h"
+#include "dcn32/dcn32_mpc.h"
+#include "dcn35/dcn35_hubp.h"
+#include "irq/dcn351/irq_service_dcn351.h"
+#include "dcn35/dcn35_dpp.h"
+#include "dcn35/dcn35_optc.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dce110/dce110_hwseq.h"
+#include "dcn35/dcn35_opp.h"
+#include "dcn35/dcn35_dsc.h"
+#include "dcn30/dcn30_vpg.h"
+#include "dcn30/dcn30_afmt.h"
+
+#include "dcn31/dcn31_dio_link_encoder.h"
+#include "dcn35/dcn35_dio_stream_encoder.h"
+#include "dcn31/dcn31_hpo_dp_stream_encoder.h"
+#include "dcn31/dcn31_hpo_dp_link_encoder.h"
+#include "dcn32/dcn32_hpo_dp_link_encoder.h"
+#include "link.h"
+#include "dcn31/dcn31_apg.h"
+#include "dcn32/dcn32_dio_link_encoder.h"
+#include "dcn31/dcn31_vpg.h"
+#include "dcn31/dcn31_afmt.h"
+#include "dce/dce_clock_source.h"
+#include "dce/dce_audio.h"
+#include "dce/dce_hwseq.h"
+#include "clk_mgr.h"
+#include "virtual/virtual_stream_encoder.h"
+#include "dce110/dce110_resource.h"
+#include "dml/display_mode_vba.h"
+#include "dcn35/dcn35_dccg.h"
+#include "dcn35/dcn35_pg_cntl.h"
+#include "dcn10/dcn10_resource.h"
+#include "dcn31/dcn31_panel_cntl.h"
+#include "dcn35/dcn35_hwseq.h"
+#include "dcn35/dcn35_dio_link_encoder.h"
+#include "dml/dcn31/dcn31_fpu.h" /*todo*/
+#include "dml/dcn35/dcn35_fpu.h"
+#include "dml/dcn351/dcn351_fpu.h"
+#include "dcn35/dcn35_dwb.h"
+#include "dcn35/dcn35_mmhubbub.h"
+
+#include "dcn/dcn_3_5_1_offset.h"
+#include "dcn/dcn_3_5_1_sh_mask.h"
+#include "nbio/nbio_7_11_0_offset.h"
+#include "mmhub/mmhub_3_3_0_offset.h"
+#include "mmhub/mmhub_3_3_0_sh_mask.h"
+
+#define DSCC0_DSCC_CONFIG0__ICH_RESET_AT_END_OF_LINE__SHIFT                   0x0
+#define DSCC0_DSCC_CONFIG0__ICH_RESET_AT_END_OF_LINE_MASK                     0x0000000FL
+
+#include "reg_helper.h"
+#include "dce/dmub_abm.h"
+#include "dce/dmub_psr.h"
+#include "dce/dmub_replay.h"
+#include "dce/dce_aux.h"
+#include "dce/dce_i2c.h"
+#include "dml/dcn31/display_mode_vba_31.h" /*temp*/
+#include "vm_helper.h"
+#include "dcn20/dcn20_vmid.h"
+
+#include "dml2/dml2_wrapper.h"
+
+#include "link_enc_cfg.h"
+#define DC_LOGGER_INIT(logger)
+
+enum dcn351_clk_src_array_id {
+	DCN351_CLK_SRC_PLL0,
+	DCN351_CLK_SRC_PLL1,
+	DCN351_CLK_SRC_PLL2,
+	DCN351_CLK_SRC_PLL3,
+	DCN351_CLK_SRC_PLL4,
+	DCN351_CLK_SRC_TOTAL
+};
+
+/* begin *********************
+ * macros to expend register list macro defined in HW object header file
+ */
+
+/* DCN */
+/* TODO awful hack. fixup dcn20_dwb.h */
+#undef BASE_INNER
+#define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
+
+#define BASE(seg) BASE_INNER(seg)
+
+#define SR(reg_name)\
+		REG_STRUCT.reg_name = BASE(reg ## reg_name ## _BASE_IDX) +  \
+					reg ## reg_name
+
+#define SR_ARR(reg_name, id) \
+	REG_STRUCT[id].reg_name = BASE(reg##reg_name##_BASE_IDX) + reg##reg_name
+
+#define SR_ARR_INIT(reg_name, id, value) \
+	REG_STRUCT[id].reg_name = value
+
+#define SRI(reg_name, block, id)\
+	REG_STRUCT.reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRI_ARR(reg_name, block, id)\
+	REG_STRUCT[id].reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SR_ARR_I2C(reg_name, id) \
+	REG_STRUCT[id-1].reg_name = BASE(reg##reg_name##_BASE_IDX) + reg##reg_name
+
+#define SRI_ARR_I2C(reg_name, block, id)\
+	REG_STRUCT[id-1].reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SRI_ARR_ALPHABET(reg_name, block, index, id)\
+	REG_STRUCT[index].reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SRI2(reg_name, block, id)\
+	.reg_name = BASE(reg ## reg_name ## _BASE_IDX) + \
+					reg ## reg_name
+
+#define SRI2_ARR(reg_name, block, id)\
+	REG_STRUCT[id].reg_name = BASE(reg ## reg_name ## _BASE_IDX) +	\
+		reg ## reg_name
+
+#define SRIR(var_name, reg_name, block, id)\
+	.var_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRII(reg_name, block, id)\
+	REG_STRUCT.reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRII_ARR_2(reg_name, block, id, inst)\
+	REG_STRUCT[inst].reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SRII_MPC_RMU(reg_name, block, id)\
+	.RMU##_##reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRII_DWB(reg_name, temp_name, block, id)\
+	REG_STRUCT.reg_name[id] = BASE(reg ## block ## id ## _ ## temp_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## temp_name
+
+#define SF_DWB2(reg_name, block, id, field_name, post_fix) \
+	.field_name = reg_name ## __ ## field_name ## post_fix
+
+#define DCCG_SRII(reg_name, block, id)\
+	REG_STRUCT.block ## _ ## reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define VUPDATE_SRII(reg_name, block, id)\
+	REG_STRUCT.reg_name[id] = BASE(reg ## reg_name ## _ ## block ## id ## _BASE_IDX) + \
+		reg ## reg_name ## _ ## block ## id
+
+/* NBIO */
+#define NBIO_BASE_INNER(seg) ctx->nbio_reg_offsets[seg]
+
+#define NBIO_BASE(seg) \
+	NBIO_BASE_INNER(seg)
+
+#define NBIO_SR(reg_name)\
+	REG_STRUCT.reg_name = NBIO_BASE(regBIF_BX2_ ## reg_name ## _BASE_IDX) + \
+				regBIF_BX2_ ## reg_name
+
+#define NBIO_SR_ARR(reg_name, id)\
+	REG_STRUCT[id].reg_name = NBIO_BASE(regBIF_BX2_ ## reg_name ## _BASE_IDX) + \
+		regBIF_BX2_ ## reg_name
+
+#define bios_regs_init() \
+		( \
+		NBIO_SR(BIOS_SCRATCH_3),\
+		NBIO_SR(BIOS_SCRATCH_6)\
+		)
+
+static struct bios_registers bios_regs;
+
+#define clk_src_regs_init(index, pllid)\
+	CS_COMMON_REG_LIST_DCN3_0_RI(index, pllid)
+
+static struct dce110_clk_src_regs clk_src_regs[5];
+
+static const struct dce110_clk_src_shift cs_shift = {
+		CS_COMMON_MASK_SH_LIST_DCN3_1_4(__SHIFT)
+};
+
+static const struct dce110_clk_src_mask cs_mask = {
+		CS_COMMON_MASK_SH_LIST_DCN3_1_4(_MASK)
+};
+
+#define abm_regs_init(id)\
+		ABM_DCN32_REG_LIST_RI(id)
+
+static struct dce_abm_registers abm_regs[4];
+
+static const struct dce_abm_shift abm_shift = {
+		ABM_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dce_abm_mask abm_mask = {
+		ABM_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define audio_regs_init(id)\
+		AUD_COMMON_REG_LIST_RI(id)
+
+static struct dce_audio_registers audio_regs[7];
+
+
+#define DCE120_AUD_COMMON_MASK_SH_LIST(mask_sh)\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_INDEX, AZALIA_ENDPOINT_REG_INDEX, mask_sh),\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_DATA, AZALIA_ENDPOINT_REG_DATA, mask_sh),\
+		AUD_COMMON_MASK_SH_LIST_BASE(mask_sh)
+
+static const struct dce_audio_shift audio_shift = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_audio_mask audio_mask = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(_MASK)
+};
+
+#define vpg_regs_init(id)\
+	VPG_DCN31_REG_LIST_RI(id)
+
+static struct dcn31_vpg_registers vpg_regs[10];
+
+static const struct dcn31_vpg_shift vpg_shift = {
+	DCN31_VPG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_vpg_mask vpg_mask = {
+	DCN31_VPG_MASK_SH_LIST(_MASK)
+};
+
+#define afmt_regs_init(id)\
+	AFMT_DCN31_REG_LIST_RI(id)
+
+static struct dcn31_afmt_registers afmt_regs[6];
+
+static const struct dcn31_afmt_shift afmt_shift = {
+	DCN31_AFMT_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_afmt_mask afmt_mask = {
+	DCN31_AFMT_MASK_SH_LIST(_MASK)
+};
+
+#define apg_regs_init(id)\
+	APG_DCN31_REG_LIST_RI(id)
+
+static struct dcn31_apg_registers apg_regs[4];
+
+static const struct dcn31_apg_shift apg_shift = {
+	DCN31_APG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_apg_mask apg_mask = {
+	DCN31_APG_MASK_SH_LIST(_MASK)
+};
+
+#define stream_enc_regs_init(id)\
+	SE_DCN35_REG_LIST_RI(id)
+
+static struct dcn10_stream_enc_registers stream_enc_regs[5];
+
+static const struct dcn10_stream_encoder_shift se_shift = {
+		SE_COMMON_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn10_stream_encoder_mask se_mask = {
+		SE_COMMON_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define aux_regs_init(id)\
+	DCN2_AUX_REG_LIST_RI(id)
+
+static struct dcn10_link_enc_aux_registers link_enc_aux_regs[5];
+
+#define hpd_regs_init(id)\
+	HPD_REG_LIST_RI(id)
+
+static struct dcn10_link_enc_hpd_registers link_enc_hpd_regs[5];
+
+
+static const struct dce110_aux_registers_shift aux_shift = {
+	DCN_AUX_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce110_aux_registers_mask aux_mask = {
+	DCN_AUX_MASK_SH_LIST(_MASK)
+};
+
+#define link_regs_init(id, phyid)\
+	( \
+	LE_DCN35_REG_LIST_RI(id), \
+	UNIPHY_DCN2_REG_LIST_RI(id, phyid)\
+	)
+
+static struct dcn10_link_enc_registers link_enc_regs[5];
+
+static const struct dcn10_link_enc_shift le_shift = {
+	LINK_ENCODER_MASK_SH_LIST_DCN35(__SHIFT), \
+	//DPCS_DCN31_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn10_link_enc_mask le_mask = {
+	LINK_ENCODER_MASK_SH_LIST_DCN35(_MASK), \
+	//DPCS_DCN31_MASK_SH_LIST(_MASK)
+};
+
+#define hpo_dp_stream_encoder_reg_init(id)\
+	DCN3_1_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
+
+static struct dcn31_hpo_dp_stream_encoder_registers hpo_dp_stream_enc_regs[4];
+
+static const struct dcn31_hpo_dp_stream_encoder_shift hpo_dp_se_shift = {
+	DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_hpo_dp_stream_encoder_mask hpo_dp_se_mask = {
+	DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(_MASK)
+};
+
+#define hpo_dp_link_encoder_reg_init(id)\
+	DCN3_1_HPO_DP_LINK_ENC_REG_LIST_RI(id)
+	/*DCN3_1_RDPCSTX_REG_LIST(0),*/
+	/*DCN3_1_RDPCSTX_REG_LIST(1),*/
+	/*DCN3_1_RDPCSTX_REG_LIST(2),*/
+	/*DCN3_1_RDPCSTX_REG_LIST(3),*/
+
+static struct dcn31_hpo_dp_link_encoder_registers hpo_dp_link_enc_regs[2];
+
+static const struct dcn31_hpo_dp_link_encoder_shift hpo_dp_le_shift = {
+	DCN3_1_HPO_DP_LINK_ENC_COMMON_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_hpo_dp_link_encoder_mask hpo_dp_le_mask = {
+	DCN3_1_HPO_DP_LINK_ENC_COMMON_MASK_SH_LIST(_MASK)
+};
+
+#define dpp_regs_init(id)\
+	DPP_REG_LIST_DCN35_RI(id)
+
+static struct dcn3_dpp_registers dpp_regs[4];
+
+static const struct dcn35_dpp_shift tf_shift = {
+		DPP_REG_LIST_SH_MASK_DCN35(__SHIFT)
+};
+
+static const struct dcn35_dpp_mask tf_mask = {
+		DPP_REG_LIST_SH_MASK_DCN35(_MASK)
+};
+
+#define opp_regs_init(id)\
+	OPP_REG_LIST_DCN35_RI(id)
+
+static struct dcn35_opp_registers opp_regs[4];
+
+static const struct dcn35_opp_shift opp_shift = {
+	OPP_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn35_opp_mask opp_mask = {
+	OPP_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define aux_engine_regs_init(id)\
+	( \
+	AUX_COMMON_REG_LIST0_RI(id), \
+	SR_ARR_INIT(AUXN_IMPCAL, id, 0), \
+	SR_ARR_INIT(AUXP_IMPCAL, id, 0), \
+	SR_ARR_INIT(AUX_RESET_MASK, id, DP_AUX0_AUX_CONTROL__AUX_RESET_MASK) \
+	)
+
+static struct dce110_aux_registers aux_engine_regs[5];
+
+#define dwbc_regs_dcn3_init(id)\
+	DWBC_COMMON_REG_LIST_DCN30_RI(id)
+
+static struct dcn30_dwbc_registers dwbc35_regs[1];
+
+static const struct dcn35_dwbc_shift dwbc35_shift = {
+	DWBC_COMMON_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn35_dwbc_mask dwbc35_mask = {
+	DWBC_COMMON_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define mcif_wb_regs_dcn3_init(id)\
+	MCIF_WB_COMMON_REG_LIST_DCN3_5_RI(id)
+
+static struct dcn35_mmhubbub_registers mcif_wb35_regs[1];
+
+static const struct dcn35_mmhubbub_shift mcif_wb35_shift = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN3_5(__SHIFT)
+};
+
+static const struct dcn35_mmhubbub_mask mcif_wb35_mask = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN3_5(_MASK)
+};
+
+#define dsc_regsDCN35_init(id)\
+	DSC_REG_LIST_DCN20_RI(id)
+
+static struct dcn20_dsc_registers dsc_regs[4];
+
+static const struct dcn35_dsc_shift dsc_shift = {
+	DSC_REG_LIST_SH_MASK_DCN35(__SHIFT)
+};
+
+static const struct dcn35_dsc_mask dsc_mask = {
+	DSC_REG_LIST_SH_MASK_DCN35(_MASK)
+};
+
+static struct dcn30_mpc_registers mpc_regs;
+
+#define dcn_mpc_regs_init() \
+	MPC_REG_LIST_DCN3_2_RI(0),\
+	MPC_REG_LIST_DCN3_2_RI(1),\
+	MPC_REG_LIST_DCN3_2_RI(2),\
+	MPC_REG_LIST_DCN3_2_RI(3),\
+	MPC_OUT_MUX_REG_LIST_DCN3_0_RI(0),\
+	MPC_OUT_MUX_REG_LIST_DCN3_0_RI(1),\
+	MPC_OUT_MUX_REG_LIST_DCN3_0_RI(2),\
+	MPC_OUT_MUX_REG_LIST_DCN3_0_RI(3),\
+	MPC_DWB_MUX_REG_LIST_DCN3_0_RI(0)
+
+static const struct dcn30_mpc_shift mpc_shift = {
+	MPC_COMMON_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct dcn30_mpc_mask mpc_mask = {
+	MPC_COMMON_MASK_SH_LIST_DCN32(_MASK)
+};
+
+#define optc_regs_init(id)\
+	OPTC_COMMON_REG_LIST_DCN3_5_RI(id)
+
+static struct dcn_optc_registers optc_regs[4];
+
+static const struct dcn_optc_shift optc_shift = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_5(__SHIFT)
+};
+
+static const struct dcn_optc_mask optc_mask = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_5(_MASK)
+};
+
+#define hubp_regs_init(id)\
+	HUBP_REG_LIST_DCN30_RI(id)
+
+static struct dcn_hubp2_registers hubp_regs[4];
+
+
+static const struct dcn35_hubp2_shift hubp_shift = {
+		HUBP_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn35_hubp2_mask hubp_mask = {
+		HUBP_MASK_SH_LIST_DCN35(_MASK)
+};
+
+static struct dcn_hubbub_registers hubbub_reg;
+
+#define hubbub_reg_init()\
+		HUBBUB_REG_LIST_DCN35(0)
+
+static const struct dcn_hubbub_shift hubbub_shift = {
+		HUBBUB_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dcn_hubbub_mask hubbub_mask = {
+		HUBBUB_MASK_SH_LIST_DCN35(_MASK)
+};
+
+static struct dccg_registers dccg_regs;
+
+#define dccg_regs_init()\
+	DCCG_REG_LIST_DCN35()
+
+static const struct dccg_shift dccg_shift = {
+		DCCG_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dccg_mask dccg_mask = {
+		DCCG_MASK_SH_LIST_DCN35(_MASK)
+};
+
+static struct pg_cntl_registers pg_cntl_regs;
+
+#define pg_cntl_dcn35_regs_init() \
+	PG_CNTL_REG_LIST_DCN35()
+
+static const struct pg_cntl_shift pg_cntl_shift = {
+		PG_CNTL_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct pg_cntl_mask pg_cntl_mask = {
+		PG_CNTL_MASK_SH_LIST_DCN35(_MASK)
+};
+
+#define SRII2(reg_name_pre, reg_name_post, id)\
+	.reg_name_pre ## _ ##  reg_name_post[id] = BASE(reg ## reg_name_pre \
+			## id ## _ ## reg_name_post ## _BASE_IDX) + \
+			reg ## reg_name_pre ## id ## _ ## reg_name_post
+
+static struct dce_hwseq_registers hwseq_reg;
+
+#define hwseq_reg_init()\
+	HWSEQ_DCN35_REG_LIST()
+
+#define HWSEQ_DCN35_MASK_SH_LIST(mask_sh)\
+	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
+	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
+	HWS_SF(, DCHUBBUB_ARB_HOSTVM_CNTL, DISABLE_HOSTVM_FORCE_ALLOW_PSTATE, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN22_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN22_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN23_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN23_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN24_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN24_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN25_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN25_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN22_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN23_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN24_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN25_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
+	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh), \
+	HWS_SF(, HPO_TOP_CLOCK_CONTROL, HPO_HDMISTREAMCLK_G_GATE_DIS, mask_sh), \
+	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_UNASSIGNED_PWR_MODE, mask_sh), \
+	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_VBLANK_PWR_MODE, mask_sh), \
+	HWS_SF(, DIO_MEM_PWR_CTRL, I2C_LIGHT_SLEEP_FORCE, mask_sh), \
+	HWS_SF(, HPO_TOP_HW_CONTROL, HPO_IO_EN, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DISPCLK_R_DMU_GATE_DIS, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DISPCLK_G_RBBMIF_GATE_DIS, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, RBBMIF_FGCG_REP_DIS, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DPREFCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DISPCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DPPCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DTBCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DCFCLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, DPIACLK_ALLOW_DS_CLKSTOP, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, LONO_FGCG_REP_DIS, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, LONO_DISPCLK_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, LONO_SOCCLK_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DMU_CLK_CNTL, LONO_DMCUBCLK_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKA_FE_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKB_FE_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKC_FE_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKD_FE_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKE_FE_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, HDMICHARCLK0_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKA_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKB_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKC_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKD_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, SYMCLKE_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, PHYASYMCLK_ROOT_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, PHYBSYMCLK_ROOT_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, PHYCSYMCLK_ROOT_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, PHYDSYMCLK_ROOT_GATE_DISABLE, mask_sh), \
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL2, PHYESYMCLK_ROOT_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL5, DTBCLK_P0_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL5, DTBCLK_P1_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL5, DTBCLK_P2_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL5, DTBCLK_P3_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK0_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK1_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK2_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK3_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL4, DPIASYMCLK0_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL4, DPIASYMCLK1_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL4, DPIASYMCLK2_GATE_DISABLE, mask_sh),\
+	HWS_SF(, DCCG_GATE_DISABLE_CNTL4, DPIASYMCLK3_GATE_DISABLE, mask_sh)
+
+static const struct dce_hwseq_shift hwseq_shift = {
+		HWSEQ_DCN35_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_hwseq_mask hwseq_mask = {
+		HWSEQ_DCN35_MASK_SH_LIST(_MASK)
+};
+
+#define vmid_regs_init(id)\
+		DCN20_VMID_REG_LIST_RI(id)
+
+static struct dcn_vmid_registers vmid_regs[16];
+
+static const struct dcn20_vmid_shift vmid_shifts = {
+		DCN20_VMID_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn20_vmid_mask vmid_masks = {
+		DCN20_VMID_MASK_SH_LIST(_MASK)
+};
+
+static const struct resource_caps res_cap_dcn351 = {
+	.num_timing_generator = 4,
+	.num_opp = 4,
+	.num_video_plane = 4,
+	.num_audio = 5,
+	.num_stream_encoder = 5,
+	.num_dig_link_enc = 5,
+	.num_hpo_dp_stream_encoder = 4,
+	.num_hpo_dp_link_encoder = 2,
+	.num_pll = 4,/*1 c10 edp, 3xc20 combo PHY*/
+	.num_dwb = 1,
+	.num_ddc = 5,
+	.num_vmid = 16,
+	.num_mpc_3dlut = 2,
+	.num_dsc = 4,
+};
+
+static const struct dc_plane_cap plane_cap = {
+	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
+	.per_pixel_alpha = true,
+
+	.pixel_format_support = {
+			.argb8888 = true,
+			.nv12 = true,
+			.fp16 = true,
+			.p010 = true,
+			.ayuv = false,
+	},
+
+	.max_upscale_factor = {
+			.argb8888 = 16000,
+			.nv12 = 16000,
+			.fp16 = 16000
+	},
+
+	// 6:1 downscaling ratio: 1000/6 = 166.666
+	.max_downscale_factor = {
+			.argb8888 = 250,
+			.nv12 = 167,
+			.fp16 = 167
+	},
+	64,
+	64
+};
+
+static const struct dc_debug_options debug_defaults_drv = {
+	.disable_dmcu = true,
+	.force_abm_enable = false,
+	.timing_trace = false,
+	.clock_trace = true,
+	.disable_pplib_clock_request = false,
+	.pipe_split_policy = MPC_SPLIT_AVOID,
+	.force_single_disp_pipe_split = false,
+	.disable_dcc = DCC_ENABLE,
+	.disable_dpp_power_gate = true,
+	.disable_hubp_power_gate = true,
+	.disable_clock_gate = false,
+	.disable_dsc_power_gate = true,
+	.vsr_support = true,
+	.performance_trace = false,
+	.max_downscale_src_width = 4096,/*upto true 4k*/
+	.disable_pplib_wm_range = false,
+	.scl_reset_length10 = true,
+	.sanity_checks = false,
+	.underflow_assert_delay_us = 0xFFFFFFFF,
+	.dwb_fi_phase = -1, // -1 = disable,
+	.dmub_command_table = true,
+	.pstate_enabled = true,
+	.use_max_lb = true,
+	.enable_mem_low_power = {
+		.bits = {
+			.vga = false,
+			.i2c = true,
+			.dmcu = false, // This is previously known to cause hang on S3 cycles if enabled
+			.dscl = true,
+			.cm = true,
+			.mpc = true,
+			.optc = true,
+			.vpg = true,
+			.afmt = true,
+		}
+	},
+	.root_clock_optimization = {
+		.bits = {
+			.dpp = true,
+			.dsc = true,/*dscclk and dsc pg*/
+			.hdmistream = true,
+			.hdmichar = true,
+			.dpstream = true,
+			.symclk32_se = true,
+			.symclk32_le = true,
+			.symclk_fe = true,
+			.physymclk = true,
+			.dpiasymclk = true,
+		}
+	},
+	.seamless_boot_odm_combine = DML_FAIL_SOURCE_PIXEL_FORMAT,
+	.enable_z9_disable_interface = true, /* Allow support for the PMFW interface for disable Z9*/
+	.using_dml2 = true,
+	.support_eDP1_5 = true,
+	.enable_hpo_pg_support = false,
+	.enable_legacy_fast_update = true,
+	.enable_single_display_2to1_odm_policy = true,
+	.disable_idle_power_optimizations = true,
+	.dmcub_emulation = false,
+	.disable_boot_optimizations = false,
+	.disable_unbounded_requesting = false,
+	.disable_mem_low_power = false,
+	//must match enable_single_display_2to1_odm_policy to support dynamic ODM transitions
+	.enable_double_buffered_dsc_pg_support = true,
+	.enable_dp_dig_pixel_rate_div_policy = 1,
+	.disable_z10 = true,
+	.ignore_pg = true,
+	.psp_disabled_wa = true,
+	.ips2_eval_delay_us = 200,
+	.ips2_entry_delay_us = 400
+};
+
+static const struct dc_panel_config panel_config_defaults = {
+	.psr = {
+		.disable_psr = false,
+		.disallow_psrsu = false,
+		.disallow_replay = false,
+	},
+	.ilr = {
+		.optimize_edp_link_rate = true,
+	},
+};
+
+static void dcn35_dpp_destroy(struct dpp **dpp)
+{
+	kfree(TO_DCN20_DPP(*dpp));
+	*dpp = NULL;
+}
+
+static struct dpp *dcn35_dpp_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn3_dpp *dpp = kzalloc(sizeof(struct dcn3_dpp), GFP_KERNEL);
+	bool success = (dpp != NULL);
+
+	if (!success)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT dpp_regs
+	dpp_regs_init(0),
+	dpp_regs_init(1),
+	dpp_regs_init(2),
+	dpp_regs_init(3);
+
+	success = dpp35_construct(dpp, ctx, inst, &dpp_regs[inst], &tf_shift,
+				  &tf_mask);
+	if (success) {
+		dpp35_set_fgcg(
+			dpp,
+			ctx->dc->debug.enable_fine_grain_clock_gating.bits.dpp);
+		return &dpp->base;
+	}
+
+	BREAK_TO_DEBUGGER();
+	kfree(dpp);
+	return NULL;
+}
+
+static struct output_pixel_processor *dcn35_opp_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_opp *opp =
+		kzalloc(sizeof(struct dcn20_opp), GFP_KERNEL);
+
+	if (!opp) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT opp_regs
+	opp_regs_init(0),
+	opp_regs_init(1),
+	opp_regs_init(2),
+	opp_regs_init(3);
+
+	dcn35_opp_construct(opp, ctx, inst,
+			&opp_regs[inst], &opp_shift, &opp_mask);
+
+	dcn35_opp_set_fgcg(opp, ctx->dc->debug.enable_fine_grain_clock_gating.bits.opp);
+
+	return &opp->base;
+}
+
+static struct dce_aux *dcn31_aux_engine_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct aux_engine_dce110 *aux_engine =
+		kzalloc(sizeof(struct aux_engine_dce110), GFP_KERNEL);
+
+	if (!aux_engine)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT aux_engine_regs
+	aux_engine_regs_init(0),
+	aux_engine_regs_init(1),
+	aux_engine_regs_init(2),
+	aux_engine_regs_init(3),
+	aux_engine_regs_init(4);
+
+	dce110_aux_engine_construct(aux_engine, ctx, inst,
+				    SW_AUX_TIMEOUT_PERIOD_MULTIPLIER * AUX_TIMEOUT_PERIOD,
+				    &aux_engine_regs[inst],
+					&aux_mask,
+					&aux_shift,
+					ctx->dc->caps.extended_aux_timeout_support);
+
+	return &aux_engine->base;
+}
+
+#define i2c_inst_regs_init(id)\
+	I2C_HW_ENGINE_COMMON_REG_LIST_DCN30_RI(id)
+
+static struct dce_i2c_registers i2c_hw_regs[5];
+
+static const struct dce_i2c_shift i2c_shifts = {
+		I2C_COMMON_MASK_SH_LIST_DCN35(__SHIFT)
+};
+
+static const struct dce_i2c_mask i2c_masks = {
+		I2C_COMMON_MASK_SH_LIST_DCN35(_MASK)
+};
+
+/* ========================================================== */
+
+/*
+ * DPIA index | Preferred Encoder     |    Host Router
+ *   0        |      C                |       0
+ *   1        |      First Available  |       0
+ *   2        |      D                |       1
+ *   3        |      First Available  |       1
+ */
+/* ========================================================== */
+static const enum engine_id dpia_to_preferred_enc_id_table[] = {
+		ENGINE_ID_DIGC,
+		ENGINE_ID_DIGC,
+		ENGINE_ID_DIGD,
+		ENGINE_ID_DIGD
+};
+
+static enum engine_id dcn351_get_preferred_eng_id_dpia(unsigned int dpia_index)
+{
+	return dpia_to_preferred_enc_id_table[dpia_index];
+}
+
+static struct dce_i2c_hw *dcn31_i2c_hw_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dce_i2c_hw *dce_i2c_hw =
+		kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
+
+	if (!dce_i2c_hw)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT i2c_hw_regs
+	i2c_inst_regs_init(1),
+	i2c_inst_regs_init(2),
+	i2c_inst_regs_init(3),
+	i2c_inst_regs_init(4),
+	i2c_inst_regs_init(5);
+
+	dcn2_i2c_hw_construct(dce_i2c_hw, ctx, inst,
+				    &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
+
+	return dce_i2c_hw;
+}
+static struct mpc *dcn35_mpc_create(
+		struct dc_context *ctx,
+		int num_mpcc,
+		int num_rmu)
+{
+	struct dcn30_mpc *mpc30 = kzalloc(sizeof(struct dcn30_mpc), GFP_KERNEL);
+
+	if (!mpc30)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT mpc_regs
+	dcn_mpc_regs_init();
+
+	dcn32_mpc_construct(mpc30, ctx,
+			&mpc_regs,
+			&mpc_shift,
+			&mpc_mask,
+			num_mpcc,
+			num_rmu);
+
+	return &mpc30->base;
+}
+
+static struct hubbub *dcn35_hubbub_create(struct dc_context *ctx)
+{
+	int i;
+
+	struct dcn20_hubbub *hubbub3 = kzalloc(sizeof(struct dcn20_hubbub),
+					  GFP_KERNEL);
+
+	if (!hubbub3)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT hubbub_reg
+	hubbub_reg_init();
+
+#undef REG_STRUCT
+#define REG_STRUCT vmid_regs
+	vmid_regs_init(0),
+	vmid_regs_init(1),
+	vmid_regs_init(2),
+	vmid_regs_init(3),
+	vmid_regs_init(4),
+	vmid_regs_init(5),
+	vmid_regs_init(6),
+	vmid_regs_init(7),
+	vmid_regs_init(8),
+	vmid_regs_init(9),
+	vmid_regs_init(10),
+	vmid_regs_init(11),
+	vmid_regs_init(12),
+	vmid_regs_init(13),
+	vmid_regs_init(14),
+	vmid_regs_init(15);
+
+	hubbub35_construct(hubbub3, ctx,
+			&hubbub_reg,
+			&hubbub_shift,
+			&hubbub_mask,
+			384,/*ctx->dc->dml.ip.det_buffer_size_kbytes,*/
+			8, /*ctx->dc->dml.ip.pixel_chunk_size_kbytes,*/
+			1792 /*ctx->dc->dml.ip.config_return_buffer_size_in_kbytes*/);
+
+
+	for (i = 0; i < res_cap_dcn351.num_vmid; i++) {
+		struct dcn20_vmid *vmid = &hubbub3->vmid[i];
+
+		vmid->ctx = ctx;
+
+		vmid->regs = &vmid_regs[i];
+		vmid->shifts = &vmid_shifts;
+		vmid->masks = &vmid_masks;
+	}
+
+	return &hubbub3->base;
+}
+
+static struct timing_generator *dcn35_timing_generator_create(
+		struct dc_context *ctx,
+		uint32_t instance)
+{
+	struct optc *tgn10 =
+		kzalloc(sizeof(struct optc), GFP_KERNEL);
+
+	if (!tgn10)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT optc_regs
+	optc_regs_init(0),
+	optc_regs_init(1),
+	optc_regs_init(2),
+	optc_regs_init(3);
+
+	tgn10->base.inst = instance;
+	tgn10->base.ctx = ctx;
+
+	tgn10->tg_regs = &optc_regs[instance];
+	tgn10->tg_shift = &optc_shift;
+	tgn10->tg_mask = &optc_mask;
+
+	dcn35_timing_generator_init(tgn10);
+
+	return &tgn10->base;
+}
+
+static const struct encoder_feature_support link_enc_feature = {
+		.max_hdmi_deep_color = COLOR_DEPTH_121212,
+		.max_hdmi_pixel_clock = 600000,
+		.hdmi_ycbcr420_supported = true,
+		.dp_ycbcr420_supported = true,
+		.fec_supported = true,
+		.flags.bits.IS_HBR2_CAPABLE = true,
+		.flags.bits.IS_HBR3_CAPABLE = true,
+		.flags.bits.IS_TPS3_CAPABLE = true,
+		.flags.bits.IS_TPS4_CAPABLE = true
+};
+
+static struct link_encoder *dcn35_link_encoder_create(
+	struct dc_context *ctx,
+	const struct encoder_init_data *enc_init_data)
+{
+	struct dcn20_link_encoder *enc20 =
+		kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+
+	if (!enc20)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT link_enc_aux_regs
+	aux_regs_init(0),
+	aux_regs_init(1),
+	aux_regs_init(2),
+	aux_regs_init(3),
+	aux_regs_init(4);
+
+#undef REG_STRUCT
+#define REG_STRUCT link_enc_hpd_regs
+	hpd_regs_init(0),
+	hpd_regs_init(1),
+	hpd_regs_init(2),
+	hpd_regs_init(3),
+	hpd_regs_init(4);
+
+#undef REG_STRUCT
+#define REG_STRUCT link_enc_regs
+	link_regs_init(0, A),
+	link_regs_init(1, B),
+	link_regs_init(2, C),
+	link_regs_init(3, D),
+	link_regs_init(4, E);
+
+	dcn35_link_encoder_construct(enc20,
+			enc_init_data,
+			&link_enc_feature,
+			&link_enc_regs[enc_init_data->transmitter],
+			&link_enc_aux_regs[enc_init_data->channel - 1],
+			&link_enc_hpd_regs[enc_init_data->hpd_source],
+			&le_shift,
+			&le_mask);
+
+	return &enc20->enc10.base;
+}
+
+/* Create a minimal link encoder object not associated with a particular
+ * physical connector.
+ * resource_funcs.link_enc_create_minimal
+ */
+static struct link_encoder *dcn31_link_enc_create_minimal(
+		struct dc_context *ctx, enum engine_id eng_id)
+{
+	struct dcn20_link_encoder *enc20;
+
+	if ((eng_id - ENGINE_ID_DIGA) > ctx->dc->res_pool->res_cap->num_dig_link_enc)
+		return NULL;
+
+	enc20 = kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+	if (!enc20)
+		return NULL;
+
+	dcn31_link_encoder_construct_minimal(
+			enc20,
+			ctx,
+			&link_enc_feature,
+			&link_enc_regs[eng_id - ENGINE_ID_DIGA],
+			eng_id);
+
+	return &enc20->enc10.base;
+}
+
+static struct panel_cntl *dcn31_panel_cntl_create(const struct panel_cntl_init_data *init_data)
+{
+	struct dcn31_panel_cntl *panel_cntl =
+		kzalloc(sizeof(struct dcn31_panel_cntl), GFP_KERNEL);
+
+	if (!panel_cntl)
+		return NULL;
+
+	dcn31_panel_cntl_construct(panel_cntl, init_data);
+
+	return &panel_cntl->base;
+}
+
+static void read_dce_straps(
+	struct dc_context *ctx,
+	struct resource_straps *straps)
+{
+	generic_reg_get(ctx, regDC_PINSTRAPS + BASE(regDC_PINSTRAPS_BASE_IDX),
+		FN(DC_PINSTRAPS, DC_PINSTRAPS_AUDIO), &straps->dc_pinstraps_audio);
+
+}
+
+static struct audio *dcn31_create_audio(
+		struct dc_context *ctx, unsigned int inst)
+{
+
+#undef REG_STRUCT
+#define REG_STRUCT audio_regs
+	audio_regs_init(0),
+	audio_regs_init(1),
+	audio_regs_init(2),
+	audio_regs_init(3),
+	audio_regs_init(4);
+	audio_regs_init(5);
+	audio_regs_init(6);
+
+	return dce_audio_create(ctx, inst,
+			&audio_regs[inst], &audio_shift, &audio_mask);
+}
+
+static struct vpg *dcn31_vpg_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn31_vpg *vpg31 = kzalloc(sizeof(struct dcn31_vpg), GFP_KERNEL);
+
+	if (!vpg31)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT vpg_regs
+	vpg_regs_init(0),
+	vpg_regs_init(1),
+	vpg_regs_init(2),
+	vpg_regs_init(3),
+	vpg_regs_init(4),
+	vpg_regs_init(5),
+	vpg_regs_init(6),
+	vpg_regs_init(7),
+	vpg_regs_init(8),
+	vpg_regs_init(9);
+
+	vpg31_construct(vpg31, ctx, inst,
+			&vpg_regs[inst],
+			&vpg_shift,
+			&vpg_mask);
+
+	return &vpg31->base;
+}
+
+static struct afmt *dcn31_afmt_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn31_afmt *afmt31 = kzalloc(sizeof(struct dcn31_afmt), GFP_KERNEL);
+
+	if (!afmt31)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT afmt_regs
+	afmt_regs_init(0),
+	afmt_regs_init(1),
+	afmt_regs_init(2),
+	afmt_regs_init(3),
+	afmt_regs_init(4),
+	afmt_regs_init(5);
+
+	afmt31_construct(afmt31, ctx, inst,
+			&afmt_regs[inst],
+			&afmt_shift,
+			&afmt_mask);
+
+	// Light sleep by default, no need to power down here
+
+	return &afmt31->base;
+}
+
+static struct apg *dcn31_apg_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn31_apg *apg31 = kzalloc(sizeof(struct dcn31_apg), GFP_KERNEL);
+
+	if (!apg31)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT apg_regs
+	apg_regs_init(0),
+	apg_regs_init(1),
+	apg_regs_init(2),
+	apg_regs_init(3);
+
+	apg31_construct(apg31, ctx, inst,
+			&apg_regs[inst],
+			&apg_shift,
+			&apg_mask);
+
+	return &apg31->base;
+}
+
+static struct stream_encoder *dcn35_stream_encoder_create(
+	enum engine_id eng_id,
+	struct dc_context *ctx)
+{
+	struct dcn10_stream_encoder *enc1;
+	struct vpg *vpg;
+	struct afmt *afmt;
+	int vpg_inst;
+	int afmt_inst;
+
+	/* Mapping of VPG, AFMT, DME register blocks to DIO block instance */
+	if (eng_id <= ENGINE_ID_DIGF) {
+		vpg_inst = eng_id;
+		afmt_inst = eng_id;
+	} else
+		return NULL;
+
+	enc1 = kzalloc(sizeof(struct dcn10_stream_encoder), GFP_KERNEL);
+	vpg = dcn31_vpg_create(ctx, vpg_inst);
+	afmt = dcn31_afmt_create(ctx, afmt_inst);
+
+	if (!enc1 || !vpg || !afmt) {
+		kfree(enc1);
+		kfree(vpg);
+		kfree(afmt);
+		return NULL;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT stream_enc_regs
+	stream_enc_regs_init(0),
+	stream_enc_regs_init(1),
+	stream_enc_regs_init(2),
+	stream_enc_regs_init(3),
+	stream_enc_regs_init(4);
+
+	dcn35_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios,
+					eng_id, vpg, afmt,
+					&stream_enc_regs[eng_id],
+					&se_shift, &se_mask);
+
+	return &enc1->base;
+}
+
+static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
+	enum engine_id eng_id,
+	struct dc_context *ctx)
+{
+	struct dcn31_hpo_dp_stream_encoder *hpo_dp_enc31;
+	struct vpg *vpg;
+	struct apg *apg;
+	uint32_t hpo_dp_inst;
+	uint32_t vpg_inst;
+	uint32_t apg_inst;
+
+	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
+
+	/* Mapping of VPG register blocks to HPO DP block instance:
+	 * VPG[6] -> HPO_DP[0]
+	 * VPG[7] -> HPO_DP[1]
+	 * VPG[8] -> HPO_DP[2]
+	 * VPG[9] -> HPO_DP[3]
+	 */
+	vpg_inst = hpo_dp_inst + 6;
+
+	/* Mapping of APG register blocks to HPO DP block instance:
+	 * APG[0] -> HPO_DP[0]
+	 * APG[1] -> HPO_DP[1]
+	 * APG[2] -> HPO_DP[2]
+	 * APG[3] -> HPO_DP[3]
+	 */
+	apg_inst = hpo_dp_inst;
+
+	/* allocate HPO stream encoder and create VPG sub-block */
+	hpo_dp_enc31 = kzalloc(sizeof(struct dcn31_hpo_dp_stream_encoder), GFP_KERNEL);
+	vpg = dcn31_vpg_create(ctx, vpg_inst);
+	apg = dcn31_apg_create(ctx, apg_inst);
+
+	if (!hpo_dp_enc31 || !vpg || !apg) {
+		kfree(hpo_dp_enc31);
+		kfree(vpg);
+		kfree(apg);
+		return NULL;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT hpo_dp_stream_enc_regs
+	hpo_dp_stream_encoder_reg_init(0),
+	hpo_dp_stream_encoder_reg_init(1),
+	hpo_dp_stream_encoder_reg_init(2),
+	hpo_dp_stream_encoder_reg_init(3);
+
+	dcn31_hpo_dp_stream_encoder_construct(hpo_dp_enc31, ctx, ctx->dc_bios,
+					hpo_dp_inst, eng_id, vpg, apg,
+					&hpo_dp_stream_enc_regs[hpo_dp_inst],
+					&hpo_dp_se_shift, &hpo_dp_se_mask);
+
+	return &hpo_dp_enc31->base;
+}
+
+static struct hpo_dp_link_encoder *dcn31_hpo_dp_link_encoder_create(
+	uint8_t inst,
+	struct dc_context *ctx)
+{
+	struct dcn31_hpo_dp_link_encoder *hpo_dp_enc31;
+
+	/* allocate HPO link encoder */
+	hpo_dp_enc31 = kzalloc(sizeof(struct dcn31_hpo_dp_link_encoder), GFP_KERNEL);
+
+#undef REG_STRUCT
+#define REG_STRUCT hpo_dp_link_enc_regs
+	hpo_dp_link_encoder_reg_init(0),
+	hpo_dp_link_encoder_reg_init(1);
+
+	hpo_dp_link_encoder31_construct(hpo_dp_enc31, ctx, inst,
+					&hpo_dp_link_enc_regs[inst],
+					&hpo_dp_le_shift, &hpo_dp_le_mask);
+
+	return &hpo_dp_enc31->base;
+}
+
+static struct dce_hwseq *dcn351_hwseq_create(
+	struct dc_context *ctx)
+{
+	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
+
+#undef REG_STRUCT
+#define REG_STRUCT hwseq_reg
+	hwseq_reg_init();
+
+	if (hws) {
+		hws->ctx = ctx;
+		hws->regs = &hwseq_reg;
+		hws->shifts = &hwseq_shift;
+		hws->masks = &hwseq_mask;
+	}
+	return hws;
+}
+static const struct resource_create_funcs res_create_funcs = {
+	.read_dce_straps = read_dce_straps,
+	.create_audio = dcn31_create_audio,
+	.create_stream_encoder = dcn35_stream_encoder_create,
+	.create_hpo_dp_stream_encoder = dcn31_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn31_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn351_hwseq_create,
+};
+
+static void dcn351_resource_destruct(struct dcn351_resource_pool *pool)
+{
+	unsigned int i;
+
+	for (i = 0; i < pool->base.stream_enc_count; i++) {
+		if (pool->base.stream_enc[i] != NULL) {
+			if (pool->base.stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->base.stream_enc[i]->vpg));
+				pool->base.stream_enc[i]->vpg = NULL;
+			}
+			if (pool->base.stream_enc[i]->afmt != NULL) {
+				kfree(DCN30_AFMT_FROM_AFMT(pool->base.stream_enc[i]->afmt));
+				pool->base.stream_enc[i]->afmt = NULL;
+			}
+			kfree(DCN10STRENC_FROM_STRENC(pool->base.stream_enc[i]));
+			pool->base.stream_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.hpo_dp_stream_enc_count; i++) {
+		if (pool->base.hpo_dp_stream_enc[i] != NULL) {
+			if (pool->base.hpo_dp_stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->base.hpo_dp_stream_enc[i]->vpg));
+				pool->base.hpo_dp_stream_enc[i]->vpg = NULL;
+			}
+			if (pool->base.hpo_dp_stream_enc[i]->apg != NULL) {
+				kfree(DCN31_APG_FROM_APG(pool->base.hpo_dp_stream_enc[i]->apg));
+				pool->base.hpo_dp_stream_enc[i]->apg = NULL;
+			}
+			kfree(DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(pool->base.hpo_dp_stream_enc[i]));
+			pool->base.hpo_dp_stream_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.hpo_dp_link_enc_count; i++) {
+		if (pool->base.hpo_dp_link_enc[i] != NULL) {
+			kfree(DCN3_1_HPO_DP_LINK_ENC_FROM_HPO_LINK_ENC(pool->base.hpo_dp_link_enc[i]));
+			pool->base.hpo_dp_link_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		if (pool->base.dscs[i] != NULL)
+			dcn20_dsc_destroy(&pool->base.dscs[i]);
+	}
+
+	if (pool->base.mpc != NULL) {
+		kfree(TO_DCN20_MPC(pool->base.mpc));
+		pool->base.mpc = NULL;
+	}
+	if (pool->base.hubbub != NULL) {
+		kfree(pool->base.hubbub);
+		pool->base.hubbub = NULL;
+	}
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		if (pool->base.dpps[i] != NULL)
+			dcn35_dpp_destroy(&pool->base.dpps[i]);
+
+		if (pool->base.ipps[i] != NULL)
+			pool->base.ipps[i]->funcs->ipp_destroy(&pool->base.ipps[i]);
+
+		if (pool->base.hubps[i] != NULL) {
+			kfree(TO_DCN20_HUBP(pool->base.hubps[i]));
+			pool->base.hubps[i] = NULL;
+		}
+
+		if (pool->base.irqs != NULL) {
+			dal_irq_service_destroy(&pool->base.irqs);
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		if (pool->base.engines[i] != NULL)
+			dce110_engine_destroy(&pool->base.engines[i]);
+		if (pool->base.hw_i2cs[i] != NULL) {
+			kfree(pool->base.hw_i2cs[i]);
+			pool->base.hw_i2cs[i] = NULL;
+		}
+		if (pool->base.sw_i2cs[i] != NULL) {
+			kfree(pool->base.sw_i2cs[i]);
+			pool->base.sw_i2cs[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_opp; i++) {
+		if (pool->base.opps[i] != NULL)
+			pool->base.opps[i]->funcs->opp_destroy(&pool->base.opps[i]);
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		if (pool->base.timing_generators[i] != NULL)	{
+			kfree(DCN10TG_FROM_TG(pool->base.timing_generators[i]));
+			pool->base.timing_generators[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dwb; i++) {
+		if (pool->base.dwbc[i] != NULL) {
+			kfree(TO_DCN30_DWBC(pool->base.dwbc[i]));
+			pool->base.dwbc[i] = NULL;
+		}
+		if (pool->base.mcif_wb[i] != NULL) {
+			kfree(TO_DCN30_MMHUBBUB(pool->base.mcif_wb[i]));
+			pool->base.mcif_wb[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.audio_count; i++) {
+		if (pool->base.audios[i])
+			dce_aud_destroy(&pool->base.audios[i]);
+	}
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] != NULL) {
+			dcn20_clock_source_destroy(&pool->base.clock_sources[i]);
+			pool->base.clock_sources[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_mpc_3dlut; i++) {
+		if (pool->base.mpc_lut[i] != NULL) {
+			dc_3dlut_func_release(pool->base.mpc_lut[i]);
+			pool->base.mpc_lut[i] = NULL;
+		}
+		if (pool->base.mpc_shaper[i] != NULL) {
+			dc_transfer_func_release(pool->base.mpc_shaper[i]);
+			pool->base.mpc_shaper[i] = NULL;
+		}
+	}
+
+	if (pool->base.dp_clock_source != NULL) {
+		dcn20_clock_source_destroy(&pool->base.dp_clock_source);
+		pool->base.dp_clock_source = NULL;
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		if (pool->base.multiple_abms[i] != NULL)
+			dce_abm_destroy(&pool->base.multiple_abms[i]);
+	}
+
+	if (pool->base.psr != NULL)
+		dmub_psr_destroy(&pool->base.psr);
+
+	if (pool->base.replay != NULL)
+		dmub_replay_destroy(&pool->base.replay);
+
+	if (pool->base.pg_cntl != NULL)
+		dcn_pg_cntl_destroy(&pool->base.pg_cntl);
+
+	if (pool->base.dccg != NULL)
+		dcn_dccg_destroy(&pool->base.dccg);
+}
+
+static struct hubp *dcn35_hubp_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn20_hubp *hubp2 =
+		kzalloc(sizeof(struct dcn20_hubp), GFP_KERNEL);
+
+	if (!hubp2)
+		return NULL;
+
+#undef REG_STRUCT
+#define REG_STRUCT hubp_regs
+	hubp_regs_init(0),
+	hubp_regs_init(1),
+	hubp_regs_init(2),
+	hubp_regs_init(3);
+
+	if (hubp35_construct(hubp2, ctx, inst,
+			&hubp_regs[inst], &hubp_shift, &hubp_mask))
+		return &hubp2->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(hubp2);
+	return NULL;
+}
+
+static void dcn35_dwbc_init(struct dcn30_dwbc *dwbc30, struct dc_context *ctx)
+{
+	dcn35_dwbc_set_fgcg(
+		dwbc30, ctx->dc->debug.enable_fine_grain_clock_gating.bits.dwb);
+}
+
+static bool dcn35_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_dwbc *dwbc30 = kzalloc(sizeof(struct dcn30_dwbc),
+						    GFP_KERNEL);
+
+		if (!dwbc30) {
+			dm_error("DC: failed to create dwbc30!\n");
+			return false;
+		}
+
+#undef REG_STRUCT
+#define REG_STRUCT dwbc35_regs
+		dwbc_regs_dcn3_init(0);
+
+		dcn35_dwbc_construct(dwbc30, ctx,
+				&dwbc35_regs[i],
+				&dwbc35_shift,
+				&dwbc35_mask,
+				i);
+
+		pool->dwbc[i] = &dwbc30->base;
+
+		dcn35_dwbc_init(dwbc30, ctx);
+	}
+	return true;
+}
+
+static void dcn35_mmhubbub_init(struct dcn30_mmhubbub *mcif_wb30,
+				struct dc_context *ctx)
+{
+	dcn35_mmhubbub_set_fgcg(
+		mcif_wb30,
+		ctx->dc->debug.enable_fine_grain_clock_gating.bits.mmhubbub);
+}
+
+static bool dcn35_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_mmhubbub *mcif_wb30 = kzalloc(sizeof(struct dcn30_mmhubbub),
+						    GFP_KERNEL);
+
+		if (!mcif_wb30) {
+			dm_error("DC: failed to create mcif_wb30!\n");
+			return false;
+		}
+
+#undef REG_STRUCT
+#define REG_STRUCT mcif_wb35_regs
+		mcif_wb_regs_dcn3_init(0);
+
+		dcn35_mmhubbub_construct(mcif_wb30, ctx,
+				&mcif_wb35_regs[i],
+				&mcif_wb35_shift,
+				&mcif_wb35_mask,
+				i);
+
+		dcn35_mmhubbub_init(mcif_wb30, ctx);
+
+		pool->mcif_wb[i] = &mcif_wb30->base;
+	}
+	return true;
+}
+
+static struct display_stream_compressor *dcn35_dsc_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_dsc *dsc =
+		kzalloc(sizeof(struct dcn20_dsc), GFP_KERNEL);
+
+	if (!dsc) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT dsc_regs
+	dsc_regsDCN35_init(0),
+	dsc_regsDCN35_init(1),
+	dsc_regsDCN35_init(2),
+	dsc_regsDCN35_init(3);
+
+	dsc35_construct(dsc, ctx, inst, &dsc_regs[inst], &dsc_shift, &dsc_mask);
+	dsc35_set_fgcg(dsc,
+		       ctx->dc->debug.enable_fine_grain_clock_gating.bits.dsc);
+	return &dsc->base;
+}
+
+static void dcn351_destroy_resource_pool(struct resource_pool **pool)
+{
+	struct dcn351_resource_pool *dcn351_pool = TO_DCN351_RES_POOL(*pool);
+
+	dcn351_resource_destruct(dcn351_pool);
+	kfree(dcn351_pool);
+	*pool = NULL;
+}
+
+static struct clock_source *dcn35_clock_source_create(
+		struct dc_context *ctx,
+		struct dc_bios *bios,
+		enum clock_source_id id,
+		const struct dce110_clk_src_regs *regs,
+		bool dp_clk_src)
+{
+	struct dce110_clk_src *clk_src =
+		kzalloc(sizeof(struct dce110_clk_src), GFP_KERNEL);
+
+	if (!clk_src)
+		return NULL;
+
+	if (dcn31_clk_src_construct(clk_src, ctx, bios, id,
+			regs, &cs_shift, &cs_mask)) {
+		clk_src->base.dp_clk_src = dp_clk_src;
+		return &clk_src->base;
+	}
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static struct dc_cap_funcs cap_funcs = {
+	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
+};
+
+static void dcn35_get_panel_config_defaults(struct dc_panel_config *panel_config)
+{
+	*panel_config = panel_config_defaults;
+}
+
+
+static bool dcn351_validate_bandwidth(struct dc *dc,
+		struct dc_state *context,
+		bool fast_validate)
+{
+	bool out = false;
+
+	out = dml2_validate(dc, context, fast_validate);
+
+	if (fast_validate)
+		return out;
+
+	DC_FP_START();
+	dcn351_decide_zstate_support(dc, context);
+	DC_FP_END();
+
+	return out;
+}
+
+
+static struct resource_funcs dcn351_res_pool_funcs = {
+	.destroy = dcn351_destroy_resource_pool,
+	.link_enc_create = dcn35_link_encoder_create,
+	.link_enc_create_minimal = dcn31_link_enc_create_minimal,
+	.link_encs_assign = link_enc_cfg_link_encs_assign,
+	.link_enc_unassign = link_enc_cfg_link_enc_unassign,
+	.panel_cntl_create = dcn31_panel_cntl_create,
+	.validate_bandwidth = dcn351_validate_bandwidth,
+	.calculate_wm_and_dlg = NULL,
+	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
+	.populate_dml_pipes = dcn351_populate_dml_pipes_from_context_fpu,
+	.acquire_free_pipe_as_secondary_dpp_pipe = dcn20_acquire_free_pipe_for_layer,
+	.release_pipe = dcn20_release_pipe,
+	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
+	.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
+	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
+	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
+	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
+	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+	.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
+	.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
+	.update_bw_bounding_box = dcn351_update_bw_bounding_box_fpu,
+	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
+	.get_panel_config_defaults = dcn35_get_panel_config_defaults,
+	.get_preferred_eng_id_dpia = dcn351_get_preferred_eng_id_dpia,
+};
+
+static bool dcn351_resource_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dcn351_resource_pool *pool)
+{
+	int i;
+	struct dc_context *ctx = dc->ctx;
+	struct irq_service_init_data init_data;
+
+#undef REG_STRUCT
+#define REG_STRUCT bios_regs
+	bios_regs_init();
+
+#undef REG_STRUCT
+#define REG_STRUCT clk_src_regs
+	clk_src_regs_init(0, A),
+	clk_src_regs_init(1, B),
+	clk_src_regs_init(2, C),
+	clk_src_regs_init(3, D),
+	clk_src_regs_init(4, E);
+
+#undef REG_STRUCT
+#define REG_STRUCT abm_regs
+	abm_regs_init(0),
+	abm_regs_init(1),
+	abm_regs_init(2),
+	abm_regs_init(3);
+
+#undef REG_STRUCT
+#define REG_STRUCT dccg_regs
+	dccg_regs_init();
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap_dcn351;
+
+	pool->base.funcs = &dcn351_res_pool_funcs;
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->base.pipe_count = pool->base.res_cap->num_timing_generator;
+	pool->base.mpcc_count = pool->base.res_cap->num_timing_generator;
+	dc->caps.max_downscale_ratio = 600;
+	dc->caps.i2c_speed_in_khz = 100;
+	dc->caps.i2c_speed_in_khz_hdcp = 100;
+	dc->caps.max_cursor_size = 256;
+	dc->caps.min_horizontal_blanking_period = 80;
+	dc->caps.dmdata_alloc_size = 2048;
+	dc->caps.max_slave_planes = 2;
+	dc->caps.max_slave_yuv_planes = 2;
+	dc->caps.max_slave_rgb_planes = 2;
+	dc->caps.post_blend_color_processing = true;
+	dc->caps.force_dp_tps4_for_cp2520 = true;
+	if (dc->config.forceHBR2CP2520)
+		dc->caps.force_dp_tps4_for_cp2520 = false;
+	dc->caps.dp_hpo = true;
+	dc->caps.dp_hdmi21_pcon_support = true;
+
+	dc->caps.edp_dsc_support = true;
+	dc->caps.extended_aux_timeout_support = true;
+	dc->caps.dmcub_support = true;
+	dc->caps.is_apu = true;
+	dc->caps.seamless_odm = true;
+
+	dc->caps.zstate_support = true;
+	dc->caps.ips_support = true;
+	dc->caps.max_v_total = (1 << 15) - 1;
+
+	/* Color pipeline capabilities */
+	dc->caps.color.dpp.dcn_arch = 1;
+	dc->caps.color.dpp.input_lut_shared = 0;
+	dc->caps.color.dpp.icsc = 1;
+	dc->caps.color.dpp.dgam_ram = 0; // must use gamma_corr
+	dc->caps.color.dpp.dgam_rom_caps.srgb = 1;
+	dc->caps.color.dpp.dgam_rom_caps.bt2020 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.gamma2_2 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.pq = 1;
+	dc->caps.color.dpp.dgam_rom_caps.hlg = 1;
+	dc->caps.color.dpp.post_csc = 1;
+	dc->caps.color.dpp.gamma_corr = 1;
+	dc->caps.color.dpp.dgam_rom_for_yuv = 0;
+
+	dc->caps.color.dpp.hw_3d_lut = 1;
+	dc->caps.color.dpp.ogam_ram = 0;  // no OGAM in DPP since DCN1
+	// no OGAM ROM on DCN301
+	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
+	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.pq = 0;
+	dc->caps.color.dpp.ogam_rom_caps.hlg = 0;
+	dc->caps.color.dpp.ocsc = 0;
+
+	dc->caps.color.mpc.gamut_remap = 1;
+	dc->caps.color.mpc.num_3dluts = pool->base.res_cap->num_mpc_3dlut; //2
+	dc->caps.color.mpc.ogam_ram = 1;
+	dc->caps.color.mpc.ogam_rom_caps.srgb = 0;
+	dc->caps.color.mpc.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.pq = 0;
+	dc->caps.color.mpc.ogam_rom_caps.hlg = 0;
+	dc->caps.color.mpc.ocsc = 1;
+
+	/* max_disp_clock_khz_at_vmin is slightly lower than the STA value in order
+	 * to provide some margin.
+	 * It's expected for furture ASIC to have equal or higher value, in order to
+	 * have determinstic power improvement from generate to genration.
+	 * (i.e., we should not expect new ASIC generation with lower vmin rate)
+	 */
+	dc->caps.max_disp_clock_khz_at_vmin = 650000;
+
+	/* Use pipe context based otg sync logic */
+	dc->config.use_pipe_ctx_sync_logic = true;
+
+	/* read VBIOS LTTPR caps */
+	{
+		if (ctx->dc_bios->funcs->get_lttpr_caps) {
+			enum bp_result bp_query_result;
+			uint8_t is_vbios_lttpr_enable = 0;
+
+			bp_query_result = ctx->dc_bios->funcs->get_lttpr_caps(ctx->dc_bios, &is_vbios_lttpr_enable);
+			dc->caps.vbios_lttpr_enable = (bp_query_result == BP_RESULT_OK) && !!is_vbios_lttpr_enable;
+		}
+
+		/* interop bit is implicit */
+		{
+			dc->caps.vbios_lttpr_aware = true;
+		}
+	}
+
+	if (dc->ctx->dce_environment == DCE_ENV_PRODUCTION_DRV)
+		dc->debug = debug_defaults_drv;
+
+	// Init the vm_helper
+	if (dc->vm_helper)
+		vm_helper_init(dc->vm_helper, 16);
+
+	/*************************************************
+	 *  Create resources                             *
+	 *************************************************/
+
+	/* Clock Sources for Pixel Clock*/
+	pool->base.clock_sources[DCN351_CLK_SRC_PLL0] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL0,
+				&clk_src_regs[0], false);
+	pool->base.clock_sources[DCN351_CLK_SRC_PLL1] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL1,
+				&clk_src_regs[1], false);
+	pool->base.clock_sources[DCN351_CLK_SRC_PLL2] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL2,
+				&clk_src_regs[2], false);
+	pool->base.clock_sources[DCN351_CLK_SRC_PLL3] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL3,
+				&clk_src_regs[3], false);
+	pool->base.clock_sources[DCN351_CLK_SRC_PLL4] =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL4,
+				&clk_src_regs[4], false);
+
+	pool->base.clk_src_count = DCN351_CLK_SRC_TOTAL;
+
+	/* todo: not reuse phy_pll registers */
+	pool->base.dp_clock_source =
+			dcn35_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_ID_DP_DTO,
+				&clk_src_regs[0], true);
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] == NULL) {
+			dm_error("DC: failed to create clock sources!\n");
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+	/*temp till dml2 fully work without dml1*/
+	dml_init_instance(&dc->dml, &dcn3_5_soc, &dcn3_5_ip, DML_PROJECT_DCN31);
+
+	/* TODO: DCCG */
+	pool->base.dccg = dccg35_create(ctx, &dccg_regs, &dccg_shift, &dccg_mask);
+	if (pool->base.dccg == NULL) {
+		dm_error("DC: failed to create dccg!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+#undef REG_STRUCT
+#define REG_STRUCT pg_cntl_regs
+	pg_cntl_dcn35_regs_init();
+
+	pool->base.pg_cntl = pg_cntl35_create(ctx, &pg_cntl_regs, &pg_cntl_shift, &pg_cntl_mask);
+	if (pool->base.pg_cntl == NULL) {
+		dm_error("DC: failed to create power gate control!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* TODO: IRQ */
+	init_data.ctx = dc->ctx;
+	pool->base.irqs = dal_irq_service_dcn351_create(&init_data);
+	if (!pool->base.irqs)
+		goto create_fail;
+
+	/* HUBBUB */
+	pool->base.hubbub = dcn35_hubbub_create(ctx);
+	if (pool->base.hubbub == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create hubbub!\n");
+		goto create_fail;
+	}
+
+	/* HUBPs, DPPs, OPPs and TGs */
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		pool->base.hubps[i] = dcn35_hubp_create(ctx, i);
+		if (pool->base.hubps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create hubps!\n");
+			goto create_fail;
+		}
+
+		pool->base.dpps[i] = dcn35_dpp_create(ctx, i);
+		if (pool->base.dpps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create dpps!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_opp; i++) {
+		pool->base.opps[i] = dcn35_opp_create(ctx, i);
+		if (pool->base.opps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create output pixel processor!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		pool->base.timing_generators[i] = dcn35_timing_generator_create(
+				ctx, i);
+		if (pool->base.timing_generators[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto create_fail;
+		}
+	}
+	pool->base.timing_generator_count = i;
+
+	/* PSR */
+	pool->base.psr = dmub_psr_create(ctx);
+	if (pool->base.psr == NULL) {
+		dm_error("DC: failed to create psr obj!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* Replay */
+	pool->base.replay = dmub_replay_create(ctx);
+	if (pool->base.replay == NULL) {
+		dm_error("DC: failed to create replay obj!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* ABM */
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		pool->base.multiple_abms[i] = dmub_abm_create(ctx,
+				&abm_regs[i],
+				&abm_shift,
+				&abm_mask);
+		if (pool->base.multiple_abms[i] == NULL) {
+			dm_error("DC: failed to create abm for pipe %d!\n", i);
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* MPC and DSC */
+	pool->base.mpc = dcn35_mpc_create(ctx, pool->base.mpcc_count, pool->base.res_cap->num_mpc_3dlut);
+	if (pool->base.mpc == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mpc!\n");
+		goto create_fail;
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		pool->base.dscs[i] = dcn35_dsc_create(ctx, i);
+		if (pool->base.dscs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create display stream compressor %d!\n", i);
+			goto create_fail;
+		}
+	}
+
+	/* DWB and MMHUBBUB */
+	if (!dcn35_dwbc_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create dwbc!\n");
+		goto create_fail;
+	}
+
+	if (!dcn35_mmhubbub_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mcif_wb!\n");
+		goto create_fail;
+	}
+
+	/* AUX and I2C */
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		pool->base.engines[i] = dcn31_aux_engine_create(ctx, i);
+		if (pool->base.engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create aux engine!!\n");
+			goto create_fail;
+		}
+		pool->base.hw_i2cs[i] = dcn31_i2c_hw_create(ctx, i);
+		if (pool->base.hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create hw i2c!!\n");
+			goto create_fail;
+		}
+		pool->base.sw_i2cs[i] = NULL;
+	}
+
+	/* DCN3.5 has 6 DPIA */
+	pool->base.usb4_dpia_count = 4;
+	if (dc->debug.dpia_debug.bits.disable_dpia)
+		pool->base.usb4_dpia_count = 0;
+
+	/* Audio, Stream Encoders including HPO and virtual, MPC 3D LUTs */
+	if (!resource_construct(num_virtual_links, dc, &pool->base,
+			&res_create_funcs))
+		goto create_fail;
+
+	/* HW Sequencer and Plane caps */
+	dcn351_hw_sequencer_construct(dc);
+
+	dc->caps.max_planes =  pool->base.pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->cap_funcs = cap_funcs;
+
+
+	dc->dcn_ip->max_num_dpp = pool->base.pipe_count;
+
+	dc->dml2_options.dcn_pipe_count = pool->base.pipe_count;
+	dc->dml2_options.use_native_pstate_optimization = true;
+	dc->dml2_options.use_native_soc_bb_construction = true;
+	dc->dml2_options.minimize_dispclk_using_odm = false;
+	if (dc->config.EnableMinDispClkODM)
+		dc->dml2_options.minimize_dispclk_using_odm = true;
+	dc->dml2_options.enable_windowed_mpo_odm = dc->config.enable_windowed_mpo_odm;
+
+	dc->dml2_options.callbacks.dc = dc;
+	dc->dml2_options.callbacks.build_scaling_params = &resource_build_scaling_params;
+	dc->dml2_options.callbacks.can_support_mclk_switch_using_fw_based_vblank_stretch = &dcn30_can_support_mclk_switch_using_fw_based_vblank_stretch;
+	dc->dml2_options.callbacks.acquire_secondary_pipe_for_mpc_odm = &dc_resource_acquire_secondary_pipe_for_mpc_odm_legacy;
+	dc->dml2_options.callbacks.update_pipes_for_stream_with_slice_count = &resource_update_pipes_for_stream_with_slice_count;
+	dc->dml2_options.callbacks.update_pipes_for_plane_with_slice_count = &resource_update_pipes_for_plane_with_slice_count;
+	dc->dml2_options.callbacks.get_mpc_slice_index = &resource_get_mpc_slice_index;
+	dc->dml2_options.callbacks.get_odm_slice_index = &resource_get_odm_slice_index;
+	dc->dml2_options.callbacks.get_opp_head = &resource_get_opp_head;
+	dc->dml2_options.max_segments_per_hubp = 24;
+	dc->dml2_options.det_segment_size = DCN3_2_DET_SEG_SIZE;/*todo*/
+
+	if (dc->config.sdpif_request_limit_words_per_umc == 0)
+		dc->config.sdpif_request_limit_words_per_umc = 16;/*todo*/
+
+	return true;
+
+create_fail:
+
+	dcn351_resource_destruct(pool);
+
+	return false;
+}
+
+struct resource_pool *dcn351_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc)
+{
+	struct dcn351_resource_pool *pool =
+		kzalloc(sizeof(struct dcn351_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dcn351_resource_construct(init_data->num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(pool);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.h
new file mode 100644
index 000000000000..f3e045777a3d
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+
+#ifndef _DCN351_RESOURCE_H_
+#define _DCN351_RESOURCE_H_
+
+#include "core_types.h"
+
+extern struct _vcs_dpi_ip_params_st dcn3_51_ip;
+extern struct _vcs_dpi_soc_bounding_box_st dcn3_51_soc;
+
+#define TO_DCN351_RES_POOL(pool)\
+	container_of(pool, struct dcn351_resource_pool, base)
+
+struct dcn351_resource_pool {
+	struct resource_pool base;
+};
+
+struct resource_pool *dcn351_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc);
+
+#endif /* _DCN351_RESOURCE_H_ */
-- 
2.43.0


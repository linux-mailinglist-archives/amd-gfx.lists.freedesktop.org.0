Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1D83D44B7
	for <lists+amd-gfx@lfdr.de>; Sat, 24 Jul 2021 06:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397716FE5C;
	Sat, 24 Jul 2021 04:11:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E966FE5B
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Jul 2021 04:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an3R4B2ixYGC/F+S5j3TytVlwkGbGIdCCvY0oFQcqrV4hWnylKwXlDu/k0R0A4jelvq5woNGBQbhO/NtR2bDAhrnVY5iW5D9m7ZGAxglsFgtA74GaESWFjkfyg5vjGaaChaKSWLq/l8x+250D6DFi3+OolWW/bPkAOkFBu/O2rs/FhjDN2j2gq3GYuRnDSOShZpQKWQM4Xb6j2ZmDFCRKI6+xIWaeKXsS2P6JBTW5YdwRSUc7ef52BO2onM0Ta/wywtZLpwZmHq2SnB/Nm0YWHtWtm4xa9+00vysctq93MdTHWWnZzlP1j0/qyhuEyUu/GMfm2ed4JcoGxVCCg/WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqcsDAqRvgXJ0NfH9Hy891q9hxUCT3eIGpi4QjBsVlM=;
 b=ECBnvGmrRABeBi3CYfGY/tzm7Pz2g/3Q49PfrtkIaITAB4htZVlS2cbYdMQqqab3rOFJJD18ztyDaTkhyO1aKy5ckAtIMJsIQf1n8YCvUmBDPKcZXchOsWd9bthbjHT8UocPHq6cjuhcD18fVggHEugn2Xo33Z9p8FnTn6W3GEL7fMRZUb+DQLgr0SuIhQI930y70/h7VhPPQkKVynwrW9SkBmX3RdKSlAjSEoGqVn1Um05ERB6y7vfr9178Ft2DGl2Nr3SBwf/4uIUrb4ZUfaRChYaWkvyYnmOElJB9Nd+P+BvUviK2PEPrg7cFMS8hGzAvYmoTDwhqeWfE0EGH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqcsDAqRvgXJ0NfH9Hy891q9hxUCT3eIGpi4QjBsVlM=;
 b=aoRFQWNUIn6HckEjvRxFaRoGjs8eeVIYlCeSFaOJf4prGgoPi0BU0y7KwFKBpciyxbQYlFBzIMuHGxEQreLT9mUjYKoXYZNFrpgvH3eRuivwVW4difnCCsunz/SXY1tV7EIzayYNvsIrP8n1m+cdSE/52KgELHNi5YXyyK49prQ=
Received: from BN9PR03CA0275.namprd03.prod.outlook.com (2603:10b6:408:f5::10)
 by DM5PR12MB1420.namprd12.prod.outlook.com (2603:10b6:3:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Sat, 24 Jul
 2021 04:11:17 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::47) by BN9PR03CA0275.outlook.office365.com
 (2603:10b6:408:f5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29 via Frontend
 Transport; Sat, 24 Jul 2021 04:11:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Sat, 24 Jul 2021 04:11:17 +0000
Received: from solomon-t14.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 23 Jul
 2021 23:11:13 -0500
From: Solomon Chiu <solomon.chiu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/14] drm/amd/display: Fixed EdidUtility build errors
Date: Sat, 24 Jul 2021 12:09:53 +0800
Message-ID: <20210724041001.3875757-7-solomon.chiu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724041001.3875757-4-solomon.chiu@amd.com>
References: <20210724041001.3875757-4-solomon.chiu@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01cc1145-4868-4c86-c704-08d94e5915b9
X-MS-TrafficTypeDiagnostic: DM5PR12MB1420:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1420349150559E32FC98E7B597E69@DM5PR12MB1420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVp9wPQtSVh0u/FqUPQifCYSQQ/LLG2fOR6OPGbcdK53nqdRhjh6xUZcVRiFYTYC+VsGC1bGdlsE1fqy2SQGUM01e0EbayJubxIQqYWKLxGIhwh+FAL3j7W3N45m2HQXz/JfkbYwqqc1zpGcfCUg5/Lenwblc90diwRuUSJUcaa6Lc26tQJIMBVykGHoxMVo04wtPwJMV4CaLvRlq+aoL7ELRc+XiqADLSjLxh54bP25pDODQsIjybzn35dFjyDkhd3Je5QZnKE0xcHsXj9J/tu4YDLlZ5xc3V8gToFmc9d5JT6JR/67Iy8CMBc+vow90BmDiD18cMgLcl0kMr5ChyQ7dIMAq290ud70x0u+Q3cqNdhwCGHFjd1/FSdaZx1oVje8ffdzptyiAR7BGbSdI1nT7D+j5jzxy4YsQ/JXMxjoJpoquotz+hoEcH7xfZWl5ytN/iom/QwpVX0MzGzZW7gG7c6DClTBjBIKRuKDmC8WozAtPaVqj/toeH0df0PsW31RjSJy9PxDwd1HIE4fWaJeUEOdm0owziOADSxF7iMh/l/rOFbyniOuitAaRglCyP7PKwAmQoq25nTAfP6CaO+9YL8I08n3X74wKlExF3L9GMGQmw6hpUI0+QhSe4Dt3DLLl8IcB4GVuhBDZSjaj+RVUauVq/ChGQrHRZppaS0e1VzG/Q9tgBKPCaIBPAqJhHrRSHk2MD7GBhcO9EYfls2A9VotRhqXssslIcbHNbQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(54906003)(36756003)(16526019)(26005)(336012)(86362001)(508600001)(4326008)(44832011)(36860700001)(81166007)(30864003)(7696005)(47076005)(426003)(356005)(2906002)(82310400003)(186003)(8676002)(5660300002)(70586007)(316002)(1076003)(6666004)(2616005)(6916009)(83380400001)(8936002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 04:11:17.2658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cc1145-4868-4c86-c704-08d94e5915b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1420
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
Cc: Mark Morra <MarkAlbert.Morra@amd.com>, Solomon Chiu <solomon.chiu@amd.com>,
 Sunpeng.Li@amd.com, Harry.Wentland@amd.com, Qingqing.Zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, Anson.Jacob@amd.com, Aurabindo.Pillai@amd.com,
 Leung Martin <Martin.Leung@amd.com>, Bhawanpreet.Lakha@amd.com,
 bindu.r@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Mark Morra <MarkAlbert.Morra@amd.com>

[HOW]
Added #ifdefs and refactored various parts of dc to
allow dc_link to be built by AMD EDID UTILITY

[WHY]
dc_dsc was refactored moving some of the code that AMD EDID UTILITY needed
to dc_link, so now dc_link needs to be included by AMD EDID UTILITY

Reviewed-by: Leung Martin <Martin.Leung@amd.com>
Acked-by: Solomon Chiu <solomon.chiu@amd.com>
Signed-off-by: Mark Morra <MarkAlbert.Morra@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 108 +++--
 drivers/gpu/drm/amd/display/dc/dc.h           | 118 +++---
 drivers/gpu/drm/amd/display/dc/dc_types.h     |  81 ++--
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   | 393 ++++++++++--------
 4 files changed, 380 insertions(+), 320 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index f68a0d9543f4..5be9d6c70ea6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3517,61 +3517,6 @@ void dc_link_enable_hpd_filter(struct dc_link *link, bool enable)
 	}
 }
 
-uint32_t dc_bandwidth_in_kbps_from_timing(
-	const struct dc_crtc_timing *timing)
-{
-	uint32_t bits_per_channel = 0;
-	uint32_t kbps;
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-	if (timing->flags.DSC)
-		return dc_dsc_stream_bandwidth_in_kbps(timing,
-				timing->dsc_cfg.bits_per_pixel,
-				timing->dsc_cfg.num_slices_h,
-				timing->dsc_cfg.is_dp);
-#endif
-
-	switch (timing->display_color_depth) {
-	case COLOR_DEPTH_666:
-		bits_per_channel = 6;
-		break;
-	case COLOR_DEPTH_888:
-		bits_per_channel = 8;
-		break;
-	case COLOR_DEPTH_101010:
-		bits_per_channel = 10;
-		break;
-	case COLOR_DEPTH_121212:
-		bits_per_channel = 12;
-		break;
-	case COLOR_DEPTH_141414:
-		bits_per_channel = 14;
-		break;
-	case COLOR_DEPTH_161616:
-		bits_per_channel = 16;
-		break;
-	default:
-		ASSERT(bits_per_channel != 0);
-		bits_per_channel = 8;
-		break;
-	}
-
-	kbps = timing->pix_clk_100hz / 10;
-	kbps *= bits_per_channel;
-
-	if (timing->flags.Y_ONLY != 1) {
-		/*Only YOnly make reduce bandwidth by 1/3 compares to RGB*/
-		kbps *= 3;
-		if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
-			kbps /= 2;
-		else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
-			kbps = kbps * 2 / 3;
-	}
-
-	return kbps;
-
-}
-
 void dc_link_set_drive_settings(struct dc *dc,
 				struct link_training_settings *lt_settings,
 				const struct dc_link *link)
@@ -3777,3 +3722,56 @@ bool dc_link_should_enable_fec(const struct dc_link *link)
 
 	return ret;
 }
+
+uint32_t dc_bandwidth_in_kbps_from_timing(
+		const struct dc_crtc_timing *timing)
+{
+	uint32_t bits_per_channel = 0;
+	uint32_t kbps;
+
+	if (timing->flags.DSC)
+		return dc_dsc_stream_bandwidth_in_kbps(timing,
+				timing->dsc_cfg.bits_per_pixel,
+				timing->dsc_cfg.num_slices_h,
+				timing->dsc_cfg.is_dp);
+
+	switch (timing->display_color_depth) {
+	case COLOR_DEPTH_666:
+		bits_per_channel = 6;
+		break;
+	case COLOR_DEPTH_888:
+		bits_per_channel = 8;
+		break;
+	case COLOR_DEPTH_101010:
+		bits_per_channel = 10;
+		break;
+	case COLOR_DEPTH_121212:
+		bits_per_channel = 12;
+		break;
+	case COLOR_DEPTH_141414:
+		bits_per_channel = 14;
+		break;
+	case COLOR_DEPTH_161616:
+		bits_per_channel = 16;
+		break;
+	default:
+		ASSERT(bits_per_channel != 0);
+		bits_per_channel = 8;
+		break;
+	}
+
+	kbps = timing->pix_clk_100hz / 10;
+	kbps *= bits_per_channel;
+
+	if (timing->flags.Y_ONLY != 1) {
+		/*Only YOnly make reduce bandwidth by 1/3 compares to RGB*/
+		kbps *= 3;
+		if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
+			kbps /= 2;
+		else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
+			kbps = kbps * 2 / 3;
+	}
+
+	return kbps;
+
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 3f2a0f1807d2..2f3810f0510c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -458,7 +458,65 @@ union mem_low_power_enable_options {
 	uint32_t u32All;
 };
 
+struct dc_debug_data {
+	uint32_t ltFailCount;
+	uint32_t i2cErrorCount;
+	uint32_t auxErrorCount;
+};
+
+struct dc_phy_addr_space_config {
+	struct {
+		uint64_t start_addr;
+		uint64_t end_addr;
+		uint64_t fb_top;
+		uint64_t fb_offset;
+		uint64_t fb_base;
+		uint64_t agp_top;
+		uint64_t agp_bot;
+		uint64_t agp_base;
+	} system_aperture;
+
+	struct {
+		uint64_t page_table_start_addr;
+		uint64_t page_table_end_addr;
+		uint64_t page_table_base_addr;
+		bool base_addr_is_mc_addr;
+	} gart_config;
+
+	bool valid;
+	bool is_hvm_enabled;
+	uint64_t page_table_default_page_addr;
+};
+
+struct dc_virtual_addr_space_config {
+	uint64_t	page_table_base_addr;
+	uint64_t	page_table_start_addr;
+	uint64_t	page_table_end_addr;
+	uint32_t	page_table_block_size_in_bytes;
+	uint8_t		page_table_depth; // 1 = 1 level, 2 = 2 level, etc.  0 = invalid
+};
+
+struct dc_bounding_box_overrides {
+	int sr_exit_time_ns;
+	int sr_enter_plus_exit_time_ns;
+	int urgent_latency_ns;
+	int percent_of_ideal_drambw;
+	int dram_clock_change_latency_ns;
+	int dummy_clock_change_latency_ns;
+	/* This forces a hard min on the DCFCLK we use
+	 * for DML.  Unlike the debug option for forcing
+	 * DCFCLK, this override affects watermark calculations
+	 */
+	int min_dcfclk_mhz;
+};
+
+struct dc_state;
+struct resource_pool;
+struct dce_hwseq;
+
 struct dc_debug_options {
+	bool native422_support;
+	bool disable_dsc;
 	enum visual_confirm visual_confirm;
 	bool sanity_checks;
 	bool max_disp_clk;
@@ -484,7 +542,6 @@ struct dc_debug_options {
 	bool disable_dsc_power_gate;
 	int dsc_min_slice_height_override;
 	int dsc_bpp_increment_div;
-	bool native422_support;
 	bool disable_pplib_wm_range;
 	enum wm_report_mode pplib_wm_report_mode;
 	unsigned int min_disp_clk_khz;
@@ -554,7 +611,6 @@ struct dc_debug_options {
 	bool validate_dml_output;
 	bool enable_dmcub_surface_flip;
 	bool usbc_combo_phy_reset_wa;
-	bool disable_dsc;
 	bool enable_dram_clock_change_one_display_vactive;
 	union mem_low_power_enable_options enable_mem_low_power;
 	bool force_vblank_alignment;
@@ -572,69 +628,13 @@ struct dc_debug_options {
 #endif
 };
 
-struct dc_debug_data {
-	uint32_t ltFailCount;
-	uint32_t i2cErrorCount;
-	uint32_t auxErrorCount;
-};
-
-struct dc_phy_addr_space_config {
-	struct {
-		uint64_t start_addr;
-		uint64_t end_addr;
-		uint64_t fb_top;
-		uint64_t fb_offset;
-		uint64_t fb_base;
-		uint64_t agp_top;
-		uint64_t agp_bot;
-		uint64_t agp_base;
-	} system_aperture;
-
-	struct {
-		uint64_t page_table_start_addr;
-		uint64_t page_table_end_addr;
-		uint64_t page_table_base_addr;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-		bool base_addr_is_mc_addr;
-#endif
-	} gart_config;
-
-	bool valid;
-	bool is_hvm_enabled;
-	uint64_t page_table_default_page_addr;
-};
-
-struct dc_virtual_addr_space_config {
-	uint64_t	page_table_base_addr;
-	uint64_t	page_table_start_addr;
-	uint64_t	page_table_end_addr;
-	uint32_t	page_table_block_size_in_bytes;
-	uint8_t		page_table_depth; // 1 = 1 level, 2 = 2 level, etc.  0 = invalid
-};
-
-struct dc_bounding_box_overrides {
-	int sr_exit_time_ns;
-	int sr_enter_plus_exit_time_ns;
-	int urgent_latency_ns;
-	int percent_of_ideal_drambw;
-	int dram_clock_change_latency_ns;
-	int dummy_clock_change_latency_ns;
-	/* This forces a hard min on the DCFCLK we use
-	 * for DML.  Unlike the debug option for forcing
-	 * DCFCLK, this override affects watermark calculations
-	 */
-	int min_dcfclk_mhz;
-};
-
-struct resource_pool;
-struct dce_hwseq;
 struct gpu_info_soc_bounding_box_v1_0;
 struct dc {
+	struct dc_debug_options debug;
 	struct dc_versions versions;
 	struct dc_caps caps;
 	struct dc_cap_funcs cap_funcs;
 	struct dc_config config;
-	struct dc_debug_options debug;
 	struct dc_bounding_box_overrides bb_overrides;
 	struct dc_bug_wa work_arounds;
 	struct dc_context *ctx;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index d8e80107b7cc..c1532930169b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -75,18 +75,6 @@ enum dce_environment {
 #define IS_DIAG_DC(dce_environment) \
 	(IS_FPGA_MAXIMUS_DC(dce_environment) || (dce_environment == DCE_ENV_DIAG))
 
-struct hw_asic_id {
-	uint32_t chip_id;
-	uint32_t chip_family;
-	uint32_t pci_revision_id;
-	uint32_t hw_internal_rev;
-	uint32_t vram_type;
-	uint32_t vram_width;
-	uint32_t feature_flags;
-	uint32_t fake_paths_num;
-	void *atombios_base_address;
-};
-
 struct dc_perf_trace {
 	unsigned long read_count;
 	unsigned long write_count;
@@ -94,35 +82,6 @@ struct dc_perf_trace {
 	unsigned long last_entry_write;
 };
 
-struct dc_context {
-	struct dc *dc;
-
-	void *driver_context; /* e.g. amdgpu_device */
-	struct dc_perf_trace *perf_trace;
-	void *cgs_device;
-
-	enum dce_environment dce_environment;
-	struct hw_asic_id asic_id;
-
-	/* todo: below should probably move to dc.  to facilitate removal
-	 * of AS we will store these here
-	 */
-	enum dce_version dce_version;
-	struct dc_bios *dc_bios;
-	bool created_bios;
-	struct gpio_service *gpio_service;
-	uint32_t dc_sink_id_count;
-	uint32_t dc_stream_id_count;
-	uint32_t dc_edp_id_count;
-	uint64_t fbc_gpu_addr;
-	struct dc_dmub_srv *dmub_srv;
-
-#ifdef CONFIG_DRM_AMD_DC_HDCP
-	struct cp_psp cp_psp;
-#endif
-};
-
-
 #define DC_MAX_EDID_BUFFER_SIZE 2048
 #define DC_EDID_BLOCK_SIZE 128
 #define MAX_SURFACE_NUM 4
@@ -836,6 +795,46 @@ struct dc_clock_config {
 	uint32_t current_clock_khz;/*current clock in use*/
 };
 
+struct hw_asic_id {
+	uint32_t chip_id;
+	uint32_t chip_family;
+	uint32_t pci_revision_id;
+	uint32_t hw_internal_rev;
+	uint32_t vram_type;
+	uint32_t vram_width;
+	uint32_t feature_flags;
+	uint32_t fake_paths_num;
+	void *atombios_base_address;
+};
+
+struct dc_context {
+	struct dc *dc;
+
+	void *driver_context; /* e.g. amdgpu_device */
+	struct dc_perf_trace *perf_trace;
+	void *cgs_device;
+
+	enum dce_environment dce_environment;
+	struct hw_asic_id asic_id;
+
+	/* todo: below should probably move to dc.  to facilitate removal
+	 * of AS we will store these here
+	 */
+	enum dce_version dce_version;
+	struct dc_bios *dc_bios;
+	bool created_bios;
+	struct gpio_service *gpio_service;
+	uint32_t dc_sink_id_count;
+	uint32_t dc_stream_id_count;
+	uint32_t dc_edp_id_count;
+	uint64_t fbc_gpu_addr;
+	struct dc_dmub_srv *dmub_srv;
+#ifdef CONFIG_DRM_AMD_DC_HDCP
+	struct cp_psp cp_psp;
+#endif
+
+};
+
 /* DSC DPCD capabilities */
 union dsc_slice_caps1 {
 	struct {
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index f403d8e84a8c..f5b7da0e64c0 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -28,6 +28,7 @@
 #include <drm/drm_dp_helper.h>
 #include "dc.h"
 #include "rc_calc.h"
+#include "fixed31_32.h"
 
 /* This module's internal functions */
 
@@ -39,6 +40,47 @@ static bool dsc_policy_enable_dsc_when_not_needed;
 
 static bool dsc_policy_disable_dsc_stream_overhead;
 
+/* Forward Declerations */
+static void get_dsc_bandwidth_range(
+		const uint32_t min_bpp_x16,
+		const uint32_t max_bpp_x16,
+		const uint32_t num_slices_h,
+		const struct dsc_enc_caps *dsc_caps,
+		const struct dc_crtc_timing *timing,
+		struct dc_dsc_bw_range *range);
+
+static uint32_t compute_bpp_x16_from_target_bandwidth(
+		const uint32_t bandwidth_in_kbps,
+		const struct dc_crtc_timing *timing,
+		const uint32_t num_slices_h,
+		const uint32_t bpp_increment_div,
+		const bool is_dp);
+
+static void get_dsc_enc_caps(
+		const struct display_stream_compressor *dsc,
+		struct dsc_enc_caps *dsc_enc_caps,
+		int pixel_clock_100Hz);
+
+static bool intersect_dsc_caps(
+		const struct dsc_dec_dpcd_caps *dsc_sink_caps,
+		const struct dsc_enc_caps *dsc_enc_caps,
+		enum dc_pixel_encoding pixel_encoding,
+		struct dsc_enc_caps *dsc_common_caps);
+
+static bool setup_dsc_config(
+		const struct dsc_dec_dpcd_caps *dsc_sink_caps,
+		const struct dsc_enc_caps *dsc_enc_caps,
+		int target_bandwidth_kbps,
+		const struct dc_crtc_timing *timing,
+		int min_slice_height_override,
+		int max_dsc_target_bpp_limit_override_x16,
+		struct dc_dsc_config *dsc_cfg);
+
+static struct fixed31_32 compute_dsc_max_bandwidth_overhead(
+		const struct dc_crtc_timing *timing,
+		const int num_slices_h,
+		const bool is_dp);
+
 static bool dsc_buff_block_size_from_dpcd(int dpcd_buff_block_size, int *buff_block_size)
 {
 
@@ -171,10 +213,164 @@ static bool dsc_bpp_increment_div_from_dpcd(uint8_t bpp_increment_dpcd, uint32_t
 	return true;
 }
 
+
+
+bool dc_dsc_parse_dsc_dpcd(const struct dc *dc,
+		const uint8_t *dpcd_dsc_basic_data,
+		const uint8_t *dpcd_dsc_branch_decoder_caps,
+		struct dsc_dec_dpcd_caps *dsc_sink_caps)
+{
+	if (!dpcd_dsc_basic_data)
+		return false;
+
+	dsc_sink_caps->is_dsc_supported =
+		(dpcd_dsc_basic_data[DP_DSC_SUPPORT - DP_DSC_SUPPORT] & DP_DSC_DECOMPRESSION_IS_SUPPORTED) != 0;
+	if (!dsc_sink_caps->is_dsc_supported)
+		return false;
+
+	dsc_sink_caps->dsc_version = dpcd_dsc_basic_data[DP_DSC_REV - DP_DSC_SUPPORT];
+
+	{
+		int buff_block_size;
+		int buff_size;
+
+		if (!dsc_buff_block_size_from_dpcd(dpcd_dsc_basic_data[DP_DSC_RC_BUF_BLK_SIZE - DP_DSC_SUPPORT],
+										   &buff_block_size))
+			return false;
+
+		buff_size = dpcd_dsc_basic_data[DP_DSC_RC_BUF_SIZE - DP_DSC_SUPPORT] + 1;
+		dsc_sink_caps->rc_buffer_size = buff_size * buff_block_size;
+	}
+
+	dsc_sink_caps->slice_caps1.raw = dpcd_dsc_basic_data[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
+	if (!dsc_line_buff_depth_from_dpcd(dpcd_dsc_basic_data[DP_DSC_LINE_BUF_BIT_DEPTH - DP_DSC_SUPPORT],
+									   &dsc_sink_caps->lb_bit_depth))
+		return false;
+
+	dsc_sink_caps->is_block_pred_supported =
+		(dpcd_dsc_basic_data[DP_DSC_BLK_PREDICTION_SUPPORT - DP_DSC_SUPPORT] &
+		 DP_DSC_BLK_PREDICTION_IS_SUPPORTED) != 0;
+
+	dsc_sink_caps->edp_max_bits_per_pixel =
+		dpcd_dsc_basic_data[DP_DSC_MAX_BITS_PER_PIXEL_LOW - DP_DSC_SUPPORT] |
+		dpcd_dsc_basic_data[DP_DSC_MAX_BITS_PER_PIXEL_HI - DP_DSC_SUPPORT] << 8;
+
+	dsc_sink_caps->color_formats.raw = dpcd_dsc_basic_data[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT];
+	dsc_sink_caps->color_depth.raw = dpcd_dsc_basic_data[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];
+
+	{
+		int dpcd_throughput = dpcd_dsc_basic_data[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
+
+		if (!dsc_throughput_from_dpcd(dpcd_throughput & DP_DSC_THROUGHPUT_MODE_0_MASK,
+									  &dsc_sink_caps->throughput_mode_0_mps))
+			return false;
+
+		dpcd_throughput = (dpcd_throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >> DP_DSC_THROUGHPUT_MODE_1_SHIFT;
+		if (!dsc_throughput_from_dpcd(dpcd_throughput, &dsc_sink_caps->throughput_mode_1_mps))
+			return false;
+	}
+
+	dsc_sink_caps->max_slice_width = dpcd_dsc_basic_data[DP_DSC_MAX_SLICE_WIDTH - DP_DSC_SUPPORT] * 320;
+	dsc_sink_caps->slice_caps2.raw = dpcd_dsc_basic_data[DP_DSC_SLICE_CAP_2 - DP_DSC_SUPPORT];
+
+	if (!dsc_bpp_increment_div_from_dpcd(dpcd_dsc_basic_data[DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT],
+										 &dsc_sink_caps->bpp_increment_div))
+		return false;
+
+	if (dc->debug.dsc_bpp_increment_div) {
+		/* dsc_bpp_increment_div should onl be 1, 2, 4, 8 or 16, but rather than rejecting invalid values,
+		 * we'll accept all and get it into range. This also makes the above check against 0 redundant,
+		 * but that one stresses out the override will be only used if it's not 0.
+		 */
+		if (dc->debug.dsc_bpp_increment_div >= 1)
+			dsc_sink_caps->bpp_increment_div = 1;
+		if (dc->debug.dsc_bpp_increment_div >= 2)
+			dsc_sink_caps->bpp_increment_div = 2;
+		if (dc->debug.dsc_bpp_increment_div >= 4)
+			dsc_sink_caps->bpp_increment_div = 4;
+		if (dc->debug.dsc_bpp_increment_div >= 8)
+			dsc_sink_caps->bpp_increment_div = 8;
+		if (dc->debug.dsc_bpp_increment_div >= 16)
+			dsc_sink_caps->bpp_increment_div = 16;
+	}
+
+	/* Extended caps */
+	if (dpcd_dsc_branch_decoder_caps == NULL) { // branch decoder DPCD DSC data can be null for non branch device
+		dsc_sink_caps->branch_overall_throughput_0_mps = 0;
+		dsc_sink_caps->branch_overall_throughput_1_mps = 0;
+		dsc_sink_caps->branch_max_line_width = 0;
+		return true;
+	}
+
+	dsc_sink_caps->branch_overall_throughput_0_mps =
+		dpcd_dsc_branch_decoder_caps[DP_DSC_BRANCH_OVERALL_THROUGHPUT_0 - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
+	if (dsc_sink_caps->branch_overall_throughput_0_mps == 0)
+		dsc_sink_caps->branch_overall_throughput_0_mps = 0;
+	else if (dsc_sink_caps->branch_overall_throughput_0_mps == 1)
+		dsc_sink_caps->branch_overall_throughput_0_mps = 680;
+	else {
+		dsc_sink_caps->branch_overall_throughput_0_mps *= 50;
+		dsc_sink_caps->branch_overall_throughput_0_mps += 600;
+	}
+
+	dsc_sink_caps->branch_overall_throughput_1_mps =
+		dpcd_dsc_branch_decoder_caps[DP_DSC_BRANCH_OVERALL_THROUGHPUT_1 - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
+	if (dsc_sink_caps->branch_overall_throughput_1_mps == 0)
+		dsc_sink_caps->branch_overall_throughput_1_mps = 0;
+	else if (dsc_sink_caps->branch_overall_throughput_1_mps == 1)
+		dsc_sink_caps->branch_overall_throughput_1_mps = 680;
+	else {
+		dsc_sink_caps->branch_overall_throughput_1_mps *= 50;
+		dsc_sink_caps->branch_overall_throughput_1_mps += 600;
+	}
+
+	dsc_sink_caps->branch_max_line_width =
+		dpcd_dsc_branch_decoder_caps[DP_DSC_BRANCH_MAX_LINE_WIDTH - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0] * 320;
+	ASSERT(dsc_sink_caps->branch_max_line_width == 0 || dsc_sink_caps->branch_max_line_width >= 5120);
+
+	dsc_sink_caps->is_dp = true;
+	return true;
+}
+
+
+/* If DSC is possbile, get DSC bandwidth range based on [min_bpp, max_bpp] target bitrate range and
+ * timing's pixel clock and uncompressed bandwidth.
+ * If DSC is not possible, leave '*range' untouched.
+ */
+bool dc_dsc_compute_bandwidth_range(
+		const struct display_stream_compressor *dsc,
+		uint32_t dsc_min_slice_height_override,
+		uint32_t min_bpp_x16,
+		uint32_t max_bpp_x16,
+		const struct dsc_dec_dpcd_caps *dsc_sink_caps,
+		const struct dc_crtc_timing *timing,
+		struct dc_dsc_bw_range *range)
+{
+	bool is_dsc_possible = false;
+	struct dsc_enc_caps dsc_enc_caps;
+	struct dsc_enc_caps dsc_common_caps;
+	struct dc_dsc_config config;
+
+	get_dsc_enc_caps(dsc, &dsc_enc_caps, timing->pix_clk_100hz);
+
+	is_dsc_possible = intersect_dsc_caps(dsc_sink_caps, &dsc_enc_caps,
+			timing->pixel_encoding, &dsc_common_caps);
+
+	if (is_dsc_possible)
+		is_dsc_possible = setup_dsc_config(dsc_sink_caps, &dsc_enc_caps, 0, timing,
+				dsc_min_slice_height_override, max_bpp_x16, &config);
+
+	if (is_dsc_possible)
+		get_dsc_bandwidth_range(min_bpp_x16, max_bpp_x16,
+				config.num_slices_h, &dsc_common_caps, timing, range);
+
+	return is_dsc_possible;
+}
+
 static void get_dsc_enc_caps(
-	const struct display_stream_compressor *dsc,
-	struct dsc_enc_caps *dsc_enc_caps,
-	int pixel_clock_100Hz)
+		const struct display_stream_compressor *dsc,
+		struct dsc_enc_caps *dsc_enc_caps,
+		int pixel_clock_100Hz)
 {
 	// This is a static HW query, so we can use any DSC
 
@@ -187,14 +383,14 @@ static void get_dsc_enc_caps(
 	}
 }
 
-/* Returns 'false' if no intersection was found for at least one capablity.
+/* Returns 'false' if no intersection was found for at least one capability.
  * It also implicitly validates some sink caps against invalid value of zero.
  */
 static bool intersect_dsc_caps(
-	const struct dsc_dec_dpcd_caps *dsc_sink_caps,
-	const struct dsc_enc_caps *dsc_enc_caps,
-	enum dc_pixel_encoding pixel_encoding,
-	struct dsc_enc_caps *dsc_common_caps)
+		const struct dsc_dec_dpcd_caps *dsc_sink_caps,
+		const struct dsc_enc_caps *dsc_enc_caps,
+		enum dc_pixel_encoding pixel_encoding,
+		struct dsc_enc_caps *dsc_common_caps)
 {
 	int32_t max_slices;
 	int32_t total_sink_throughput;
@@ -205,10 +401,14 @@ static bool intersect_dsc_caps(
 	if (!dsc_common_caps->dsc_version)
 		return false;
 
-	dsc_common_caps->slice_caps.bits.NUM_SLICES_1 = dsc_sink_caps->slice_caps1.bits.NUM_SLICES_1 && dsc_enc_caps->slice_caps.bits.NUM_SLICES_1;
-	dsc_common_caps->slice_caps.bits.NUM_SLICES_2 = dsc_sink_caps->slice_caps1.bits.NUM_SLICES_2 && dsc_enc_caps->slice_caps.bits.NUM_SLICES_2;
-	dsc_common_caps->slice_caps.bits.NUM_SLICES_4 = dsc_sink_caps->slice_caps1.bits.NUM_SLICES_4 && dsc_enc_caps->slice_caps.bits.NUM_SLICES_4;
-	dsc_common_caps->slice_caps.bits.NUM_SLICES_8 = dsc_sink_caps->slice_caps1.bits.NUM_SLICES_8 && dsc_enc_caps->slice_caps.bits.NUM_SLICES_8;
+	dsc_common_caps->slice_caps.bits.NUM_SLICES_1 =
+		dsc_sink_caps->slice_caps1.bits.NUM_SLICES_1 && dsc_enc_caps->slice_caps.bits.NUM_SLICES_1;
+	dsc_common_caps->slice_caps.bits.NUM_SLICES_2 =
+		dsc_sink_caps->slice_caps1.bits.NUM_SLICES_2 && dsc_enc_caps->slice_caps.bits.NUM_SLICES_2;
+	dsc_common_caps->slice_caps.bits.NUM_SLICES_4 =
+		dsc_sink_caps->slice_caps1.bits.NUM_SLICES_4 && dsc_enc_caps->slice_caps.bits.NUM_SLICES_4;
+	dsc_common_caps->slice_caps.bits.NUM_SLICES_8 =
+		dsc_sink_caps->slice_caps1.bits.NUM_SLICES_8 && dsc_enc_caps->slice_caps.bits.NUM_SLICES_8;
 	if (!dsc_common_caps->slice_caps.raw)
 		return false;
 
@@ -216,7 +416,8 @@ static bool intersect_dsc_caps(
 	if (!dsc_common_caps->lb_bit_depth)
 		return false;
 
-	dsc_common_caps->is_block_pred_supported = dsc_sink_caps->is_block_pred_supported && dsc_enc_caps->is_block_pred_supported;
+	dsc_common_caps->is_block_pred_supported =
+		dsc_sink_caps->is_block_pred_supported && dsc_enc_caps->is_block_pred_supported;
 
 	dsc_common_caps->color_formats.raw = dsc_sink_caps->color_formats.raw & dsc_enc_caps->color_formats.raw;
 	if (!dsc_common_caps->color_formats.raw)
@@ -288,11 +489,11 @@ static struct fixed31_32 compute_dsc_max_bandwidth_overhead(
 }
 
 static uint32_t compute_bpp_x16_from_target_bandwidth(
-		const uint32_t bandwidth_in_kbps,
-		const struct dc_crtc_timing *timing,
-		const uint32_t num_slices_h,
-		const uint32_t bpp_increment_div,
-		const bool is_dp)
+	const uint32_t bandwidth_in_kbps,
+	const struct dc_crtc_timing *timing,
+	const uint32_t num_slices_h,
+	const uint32_t bpp_increment_div,
+	const bool is_dp)
 {
 	struct fixed31_32 overhead_in_kbps;
 	struct fixed31_32 effective_bandwidth_in_kbps;
@@ -769,146 +970,6 @@ static bool setup_dsc_config(
 	return is_dsc_possible;
 }
 
-bool dc_dsc_parse_dsc_dpcd(const struct dc *dc, const uint8_t *dpcd_dsc_basic_data, const uint8_t *dpcd_dsc_branch_decoder_caps, struct dsc_dec_dpcd_caps *dsc_sink_caps)
-{
-	if (!dpcd_dsc_basic_data)
-		return false;
-
-	dsc_sink_caps->is_dsc_supported = (dpcd_dsc_basic_data[DP_DSC_SUPPORT - DP_DSC_SUPPORT] & DP_DSC_DECOMPRESSION_IS_SUPPORTED) != 0;
-	if (!dsc_sink_caps->is_dsc_supported)
-		return false;
-
-	dsc_sink_caps->dsc_version = dpcd_dsc_basic_data[DP_DSC_REV - DP_DSC_SUPPORT];
-
-	{
-		int buff_block_size;
-		int buff_size;
-
-		if (!dsc_buff_block_size_from_dpcd(dpcd_dsc_basic_data[DP_DSC_RC_BUF_BLK_SIZE - DP_DSC_SUPPORT], &buff_block_size))
-			return false;
-
-		buff_size = dpcd_dsc_basic_data[DP_DSC_RC_BUF_SIZE - DP_DSC_SUPPORT] + 1;
-		dsc_sink_caps->rc_buffer_size = buff_size * buff_block_size;
-	}
-
-	dsc_sink_caps->slice_caps1.raw = dpcd_dsc_basic_data[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
-	if (!dsc_line_buff_depth_from_dpcd(dpcd_dsc_basic_data[DP_DSC_LINE_BUF_BIT_DEPTH - DP_DSC_SUPPORT], &dsc_sink_caps->lb_bit_depth))
-		return false;
-
-	dsc_sink_caps->is_block_pred_supported =
-		(dpcd_dsc_basic_data[DP_DSC_BLK_PREDICTION_SUPPORT - DP_DSC_SUPPORT] & DP_DSC_BLK_PREDICTION_IS_SUPPORTED) != 0;
-
-	dsc_sink_caps->edp_max_bits_per_pixel =
-		dpcd_dsc_basic_data[DP_DSC_MAX_BITS_PER_PIXEL_LOW - DP_DSC_SUPPORT] |
-		dpcd_dsc_basic_data[DP_DSC_MAX_BITS_PER_PIXEL_HI - DP_DSC_SUPPORT] << 8;
-
-	dsc_sink_caps->color_formats.raw = dpcd_dsc_basic_data[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT];
-	dsc_sink_caps->color_depth.raw = dpcd_dsc_basic_data[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];
-
-	{
-		int dpcd_throughput = dpcd_dsc_basic_data[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
-
-		if (!dsc_throughput_from_dpcd(dpcd_throughput & DP_DSC_THROUGHPUT_MODE_0_MASK, &dsc_sink_caps->throughput_mode_0_mps))
-			return false;
-
-		dpcd_throughput = (dpcd_throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >> DP_DSC_THROUGHPUT_MODE_1_SHIFT;
-		if (!dsc_throughput_from_dpcd(dpcd_throughput, &dsc_sink_caps->throughput_mode_1_mps))
-			return false;
-	}
-
-	dsc_sink_caps->max_slice_width = dpcd_dsc_basic_data[DP_DSC_MAX_SLICE_WIDTH - DP_DSC_SUPPORT] * 320;
-	dsc_sink_caps->slice_caps2.raw = dpcd_dsc_basic_data[DP_DSC_SLICE_CAP_2 - DP_DSC_SUPPORT];
-
-	if (!dsc_bpp_increment_div_from_dpcd(dpcd_dsc_basic_data[DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT], &dsc_sink_caps->bpp_increment_div))
-		return false;
-
-	if (dc->debug.dsc_bpp_increment_div) {
-		/* dsc_bpp_increment_div should onl be 1, 2, 4, 8 or 16, but rather than rejecting invalid values,
-		 * we'll accept all and get it into range. This also makes the above check against 0 redundant,
-		 * but that one stresses out the override will be only used if it's not 0.
-		 */
-		if (dc->debug.dsc_bpp_increment_div >= 1)
-			dsc_sink_caps->bpp_increment_div = 1;
-		if (dc->debug.dsc_bpp_increment_div >= 2)
-			dsc_sink_caps->bpp_increment_div = 2;
-		if (dc->debug.dsc_bpp_increment_div >= 4)
-			dsc_sink_caps->bpp_increment_div = 4;
-		if (dc->debug.dsc_bpp_increment_div >= 8)
-			dsc_sink_caps->bpp_increment_div = 8;
-		if (dc->debug.dsc_bpp_increment_div >= 16)
-			dsc_sink_caps->bpp_increment_div = 16;
-	}
-
-	/* Extended caps */
-	if (dpcd_dsc_branch_decoder_caps == NULL) { // branch decoder DPCD DSC data can be null for non branch device
-		dsc_sink_caps->branch_overall_throughput_0_mps = 0;
-		dsc_sink_caps->branch_overall_throughput_1_mps = 0;
-		dsc_sink_caps->branch_max_line_width = 0;
-		return true;
-	}
-
-	dsc_sink_caps->branch_overall_throughput_0_mps = dpcd_dsc_branch_decoder_caps[DP_DSC_BRANCH_OVERALL_THROUGHPUT_0 - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
-	if (dsc_sink_caps->branch_overall_throughput_0_mps == 0)
-		dsc_sink_caps->branch_overall_throughput_0_mps = 0;
-	else if (dsc_sink_caps->branch_overall_throughput_0_mps == 1)
-		dsc_sink_caps->branch_overall_throughput_0_mps = 680;
-	else {
-		dsc_sink_caps->branch_overall_throughput_0_mps *= 50;
-		dsc_sink_caps->branch_overall_throughput_0_mps += 600;
-	}
-
-	dsc_sink_caps->branch_overall_throughput_1_mps = dpcd_dsc_branch_decoder_caps[DP_DSC_BRANCH_OVERALL_THROUGHPUT_1 - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
-	if (dsc_sink_caps->branch_overall_throughput_1_mps == 0)
-		dsc_sink_caps->branch_overall_throughput_1_mps = 0;
-	else if (dsc_sink_caps->branch_overall_throughput_1_mps == 1)
-		dsc_sink_caps->branch_overall_throughput_1_mps = 680;
-	else {
-		dsc_sink_caps->branch_overall_throughput_1_mps *= 50;
-		dsc_sink_caps->branch_overall_throughput_1_mps += 600;
-	}
-
-	dsc_sink_caps->branch_max_line_width = dpcd_dsc_branch_decoder_caps[DP_DSC_BRANCH_MAX_LINE_WIDTH - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0] * 320;
-	ASSERT(dsc_sink_caps->branch_max_line_width == 0 || dsc_sink_caps->branch_max_line_width >= 5120);
-
-	dsc_sink_caps->is_dp = true;
-	return true;
-}
-
-
-/* If DSC is possbile, get DSC bandwidth range based on [min_bpp, max_bpp] target bitrate range and
- * timing's pixel clock and uncompressed bandwidth.
- * If DSC is not possible, leave '*range' untouched.
- */
-bool dc_dsc_compute_bandwidth_range(
-		const struct display_stream_compressor *dsc,
-		uint32_t dsc_min_slice_height_override,
-		uint32_t min_bpp_x16,
-		uint32_t max_bpp_x16,
-		const struct dsc_dec_dpcd_caps *dsc_sink_caps,
-		const struct dc_crtc_timing *timing,
-		struct dc_dsc_bw_range *range)
-{
-	bool is_dsc_possible = false;
-	struct dsc_enc_caps dsc_enc_caps;
-	struct dsc_enc_caps dsc_common_caps;
-	struct dc_dsc_config config;
-
-	get_dsc_enc_caps(dsc, &dsc_enc_caps, timing->pix_clk_100hz);
-
-	is_dsc_possible = intersect_dsc_caps(dsc_sink_caps, &dsc_enc_caps,
-			timing->pixel_encoding, &dsc_common_caps);
-
-	if (is_dsc_possible)
-		is_dsc_possible = setup_dsc_config(dsc_sink_caps, &dsc_enc_caps, 0, timing,
-				dsc_min_slice_height_override, max_bpp_x16, &config);
-
-	if (is_dsc_possible)
-		get_dsc_bandwidth_range(min_bpp_x16, max_bpp_x16,
-				config.num_slices_h, &dsc_common_caps, timing, range);
-
-	return is_dsc_possible;
-}
-
 bool dc_dsc_compute_config(
 		const struct display_stream_compressor *dsc,
 		const struct dsc_dec_dpcd_caps *dsc_sink_caps,
@@ -923,22 +984,22 @@ bool dc_dsc_compute_config(
 
 	get_dsc_enc_caps(dsc, &dsc_enc_caps, timing->pix_clk_100hz);
 	is_dsc_possible = setup_dsc_config(dsc_sink_caps,
-			&dsc_enc_caps,
-			target_bandwidth_kbps,
-			timing, dsc_min_slice_height_override,
-			max_target_bpp_limit_override * 16, dsc_cfg);
+		&dsc_enc_caps,
+		target_bandwidth_kbps,
+		timing, dsc_min_slice_height_override,
+		max_target_bpp_limit_override * 16, dsc_cfg);
 	return is_dsc_possible;
 }
 
 uint32_t dc_dsc_stream_bandwidth_in_kbps(const struct dc_crtc_timing *timing,
-		uint32_t bpp_x16, uint32_t num_slices_h, bool is_dp)
+	uint32_t bpp_x16, uint32_t num_slices_h, bool is_dp)
 {
 	struct fixed31_32 overhead_in_kbps;
 	struct fixed31_32 bpp;
 	struct fixed31_32 actual_bandwidth_in_kbps;
 
 	overhead_in_kbps = compute_dsc_max_bandwidth_overhead(
-			timing, num_slices_h, is_dp);
+		timing, num_slices_h, is_dp);
 	bpp = dc_fixpt_from_fraction(bpp_x16, 16);
 	actual_bandwidth_in_kbps = dc_fixpt_from_fraction(timing->pix_clk_100hz, 10);
 	actual_bandwidth_in_kbps = dc_fixpt_mul(actual_bandwidth_in_kbps, bpp);
@@ -946,7 +1007,9 @@ uint32_t dc_dsc_stream_bandwidth_in_kbps(const struct dc_crtc_timing *timing,
 	return dc_fixpt_ceil(actual_bandwidth_in_kbps);
 }
 
-void dc_dsc_get_policy_for_timing(const struct dc_crtc_timing *timing, uint32_t max_target_bpp_limit_override_x16, struct dc_dsc_policy *policy)
+void dc_dsc_get_policy_for_timing(const struct dc_crtc_timing *timing,
+		uint32_t max_target_bpp_limit_override_x16,
+		struct dc_dsc_policy *policy)
 {
 	uint32_t bpc = 0;
 
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F110AB9B724
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Sep 2025 20:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EC610E7BC;
	Wed, 24 Sep 2025 18:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c1Wli7HB";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010058.outbound.protection.outlook.com
 [40.93.198.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106FB10E7B5
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Sep 2025 18:23:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TohM0Q4Pp87MNJtWhIJB8R/6aI1hlUUygz2/V+E5u/0RnMxwVmjrPZmyy+pXBU/qUVeLWySPFWtgLz/keH6HxBdgDzMqgP5daLUJ2SZXigWPtHEc1sAnygDpdoBMgPvynrv2P2H60JylnVGFfVJFU446Fts/jKqnJRDkq3DRlhQWnysNb2wlI0pIzN1CKxRXfvWRA8HO2eLmYsjm/vPoMyRE2YWIAxIvwXZVF7ZpTt/801SucNBtodRfau7dUrQeWYKSt8MzRNYCbmJgHcc/dMjs+5+8q/vnekGdDJHrwSinKfhF/nQX9aj0Zojk36HSpePhdDT1pt6dki5VsrtPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywxMCKjHOR6L/l/HICOE1dgFSkd0ID72bS/02C8r0hU=;
 b=vMFGhAmwL9Fo+NX+zWdaYDS48Jm3O/xNyIv2yP7qgsa+q2qN6S0nWPYT8aj+E0k56W6LBd3/meFs+A7lOKOdSB3SpnItED0p0hzSCYRget4EcC3a0yTGYo5Vs7SBX2x8jSaMo46m3MGJKETpUR2n/PfOHJ4UwiTfOn0Dx8dO+sV3cbmrfPUhqcVfgnFajQxOp8PqXmvH6RbdzFykg7XGn780zAORXfUg6s9XgJ/FW43h6vU31UVYBkgL0B0xwd4TXAQUrj/DCHPnV8AU2DGfmdIzLs6szuwm7xU4ZzsL+EGn4xyPx+OMh2PDOHU8878ScRgDZX9jBVSBHLOpla3M8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywxMCKjHOR6L/l/HICOE1dgFSkd0ID72bS/02C8r0hU=;
 b=c1Wli7HB02xckjjFA0gld9n/41Rk5go/qYVg8jDeY39Rgjw583jxf9QLwxGDi3wvTWvOaXPE7o0wuHz/0i8/iEwVax6xY5UoVVSsKOcmqg2ZFulBoKzYtpV9syXUbzn+EwyfDROB3Q+7u1CzgVbVcaUj1kl/zfiXOyQ6mk4TJ1M=
Received: from CH0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:610:b1::28)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 18:22:57 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::fc) by CH0PR13CA0023.outlook.office365.com
 (2603:10b6:610:b1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Wed,
 24 Sep 2025 18:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 24 Sep 2025 18:22:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 24 Sep
 2025 11:22:20 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Sep
 2025 13:22:20 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 24 Sep 2025 11:22:19 -0700
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, Austin Zheng <Austin.Zheng@amd.com>, Dillon Varone
 <dillon.varone@amd.com>
Subject: [PATCH 01/10] drm/amd/display: DML2.1 Reintegration
Date: Wed, 24 Sep 2025 14:21:52 -0400
Message-ID: <20250924182201.1049389-2-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924182201.1049389-1-Roman.Li@amd.com>
References: <20250924182201.1049389-1-Roman.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Roman.Li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c5d56e-4530-404a-08d3-08ddfb976275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dDm7GgfBur+4rokXlCnDFolu3/bbKOmH0LgWovXSEV8guTU7uM2W+/KbCJeP?=
 =?us-ascii?Q?SUvVZGJUoM0NHjQ/nBOAXkMJAh8UroFvFuMKeySGh11hMepg+MmRoykYH3D3?=
 =?us-ascii?Q?5aiF6BnCGIjZO/zY5b++YIwp4kGKtQapZPDaLCRGhwfYdmzrWg5jHysp9YOT?=
 =?us-ascii?Q?eSi0n25hqcPCg+dNdKOby3L369++Fr5Kv/c1/Z31ZtU7jviziE4VTyYeFodi?=
 =?us-ascii?Q?/418ZFWSZp1rlR4gKzXNggOwkWJrTj0sxkpcQTy1HDyXXFXnyt5vmxsHTLy+?=
 =?us-ascii?Q?7QSuDTIqs1aosvROv3LglLor61VJHfpJIoUjI6dloZA8+Gayl3v9lpIRlMsE?=
 =?us-ascii?Q?VWUbkfjft5TiZ6Gof/CRTUuttKcktgJ2xKN4/kPOehSZ4AM5fUXec12rYbvO?=
 =?us-ascii?Q?28x8ZyjrV2DJVE0wOAhqoVA7NtbysJcUWhRHn8ophdn6TRdyKDeHtIRjemQv?=
 =?us-ascii?Q?Av39liJVq0cNWdjgSfsE9CyJ/Cnmz2RdRPj4/dCaDZ4uxqDUarp3aA6mYYX6?=
 =?us-ascii?Q?EIcGjHpldCCVvmRVYSMS34U9MB1woKcrM+EXyp36dmehtK8n8bg5LHqx0FT/?=
 =?us-ascii?Q?2H02oHaG9HQkIaemgRvYILSBEcYJ26k0Q2EP3kYoCUnYBVt7w2oz3MRlo+CE?=
 =?us-ascii?Q?UFMJgu7W0NfmxcLb5NTEb6C0gloLzWoHCD6EmeNL9HmFhl9j9kJYyLYNjQIv?=
 =?us-ascii?Q?ompynmMiKkZL+MF/AFu3TsouPv+WMWPE9N71EexzhE0gAC61LE9DszEAuT7+?=
 =?us-ascii?Q?5/6JQeroDO1GG2scD6mZS3HZs7m8eggwjpPVjSFB844r3tHIXIITc/cQihXE?=
 =?us-ascii?Q?23oJnAXO+aDLD5k/8SmvVKBpXiiVJvIZaKAeDnjyRnIGl1PqvuqIw/PulH4x?=
 =?us-ascii?Q?Luo+VBSsnrP+AmZN3ciB5GnUS/pPjrDYOcYtp+Ji/e54lMzMaFYcdj/b5W+r?=
 =?us-ascii?Q?p1mbVwNXNtUl6DCerg4a+7gg3RtegXkL9dzKn9tM/dqEoqVZJh7c2f2W/b7L?=
 =?us-ascii?Q?C4o6Zhsq7UVIFgVlvxsWnaFRl5egEv4Hx5PYdPaQyYqUnq8oLwYxILWyNJV3?=
 =?us-ascii?Q?J9ODRby4yzThHtJ5t1PaPI0g6z69+7d9aVtkwnHRrEZnmaXkhh5EOk1359HZ?=
 =?us-ascii?Q?b+wT/2nckIaeWswDMhe6XO26vcQ0cOeZHSvYhZgWd3C0Pjfow9ym/vnUtOVB?=
 =?us-ascii?Q?Q849wLT4N1KNBC+g8ANc4xM3UJa+mxXeMcR1eyQ4kpYbwBhYHwJ9XrsCIZ+y?=
 =?us-ascii?Q?yMnvpuIQ5gSHnvMwF5yS365tAYsgTH8Fu6CLkcZ+7xPLga+FU2DagAAkTGyt?=
 =?us-ascii?Q?B2cgDwuipUlKWE6GucYWCo7fq0J6hOxZosEENor2beJFRQcLEvTE/hWOAcOV?=
 =?us-ascii?Q?BgZxR7SH2ykdD51Zl22pFQr/jgbFdUZ7FS9frvinbUp5jIsOzWcUjMJM96Wj?=
 =?us-ascii?Q?SBCc/YlHZ8YEMMmwN+BOSOh1yyiWuO/WLCD1tqLEYOezgKiQvlNXuRpW5Mgx?=
 =?us-ascii?Q?pEqGqOO4ezMv3RAVdHMBjot2pstqvOQZaJcm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 18:22:56.6177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c5d56e-4530-404a-08d3-08ddfb976275
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169
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

From: Austin Zheng <Austin.Zheng@amd.com>

[Summary of changes]
- Updated structs
- Renaming of variables for clarity

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Austin Zheng <Austin.Zheng@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
---
 .../dml21/inc/dml_top_display_cfg_types.h     |  11 +
 .../dml21/inc/dml_top_soc_parameter_types.h   |   7 +-
 .../display/dc/dml2/dml21/inc/dml_top_types.h |  13 +
 .../src/dml2_core/dml2_core_dcn4_calcs.c      |  55 ++-
 .../dml21/src/dml2_core/dml2_core_factory.c   |   2 +
 .../src/dml2_core/dml2_core_shared_types.h    |  10 +-
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  | 459 +++++++++---------
 .../src/inc/dml2_internal_shared_types.h      |  36 +-
 8 files changed, 336 insertions(+), 257 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
index e8dc6471c0be..13749c9fcf18 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
@@ -49,6 +49,11 @@ enum dml2_source_format_class {
 	dml2_422_packed_12 = 18
 };
 
+enum dml2_sample_positioning {
+	dml2_interstitial = 0,
+	dml2_cosited = 1
+};
+
 enum dml2_rotation_angle {
 	dml2_rotation_0 = 0,
 	dml2_rotation_90 = 1,
@@ -222,7 +227,11 @@ struct dml2_composition_cfg {
 
 	struct {
 		bool enabled;
+		bool easf_enabled;
+		bool isharp_enabled;
 		bool upsp_enabled;
+		enum dml2_sample_positioning upsp_sample_positioning;
+		unsigned int upsp_vtaps;
 		struct {
 			double h_ratio;
 			double v_ratio;
@@ -385,6 +394,7 @@ struct dml2_plane_parameters {
 		// The actual reserved vblank time used for the corresponding stream in mode_programming would be at least as much as this per-plane override.
 		long reserved_vblank_time_ns;
 		unsigned int max_vactive_det_fill_delay_us; // 0 = no reserved time, +ve = explicit max delay
+		unsigned int vactive_latency_to_hide_for_pstate_admissibility_us;
 		unsigned int gpuvm_min_page_size_kbytes;
 		unsigned int hostvm_min_page_size_kbytes;
 
@@ -456,6 +466,7 @@ struct dml2_display_cfg {
 				bool enable;
 				bool value;
 			} force_nom_det_size_kbytes;
+
 			bool mode_support_check_disable;
 			bool mcache_admissibility_check_disable;
 			bool surface_viewport_size_check_disable;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
index 176f55947664..4a9a0d5a09b7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
@@ -145,6 +145,8 @@ struct dml2_soc_bb {
 	struct dml2_soc_vmin_clock_limits vmin_limit;
 
 	double lower_bound_bandwidth_dchub;
+	double fraction_of_urgent_bandwidth_nominal_target;
+	double fraction_of_urgent_bandwidth_flip_target;
 	unsigned int dprefclk_mhz;
 	unsigned int xtalclk_mhz;
 	unsigned int pcie_refclk_mhz;
@@ -170,6 +172,7 @@ struct dml2_soc_bb {
 struct dml2_ip_capabilities {
 	unsigned int pipe_count;
 	unsigned int otg_count;
+	unsigned int TDLUT_33cube_count;
 	unsigned int num_dsc;
 	unsigned int max_num_dp2p0_streams;
 	unsigned int max_num_hdmi_frl_outputs;
@@ -188,7 +191,9 @@ struct dml2_ip_capabilities {
 	unsigned int subvp_prefetch_end_to_mall_start_us;
 	unsigned int subvp_fw_processing_delay;
 	unsigned int max_vactive_det_fill_delay_us;
-
+	unsigned int ppt_max_allow_delay_ns;
+	unsigned int temp_read_max_allow_delay_us;
+	unsigned int dummy_pstate_max_allow_delay_us;
 	/* FAMS2 delays */
 	struct {
 		unsigned int max_allow_delay_us;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
index 41adb1104d0f..8646ce5f1c01 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
@@ -70,6 +70,8 @@ struct dml2_pmo_options {
 	bool disable_dyn_odm;
 	bool disable_dyn_odm_for_multi_stream;
 	bool disable_dyn_odm_for_stream_with_svp;
+	struct dml2_pmo_pstate_strategy *override_strategy_lists[DML2_MAX_PLANES];
+	unsigned int num_override_strategies_per_list[DML2_MAX_PLANES];
 };
 
 struct dml2_options {
@@ -193,6 +195,14 @@ struct dml2_mcache_surface_allocation {
 	} informative;
 };
 
+enum dml2_pstate_type {
+	dml2_pstate_type_uclk,
+	dml2_pstate_type_ppt,
+	dml2_pstate_type_temp_read,
+	dml2_pstate_type_dummy_pstate,
+	dml2_pstate_type_count
+};
+
 enum dml2_pstate_method {
 	dml2_pstate_method_na = 0,
 	/* hw exclusive modes */
@@ -310,6 +320,7 @@ struct dml2_mode_support_info {
 	bool NumberOfOTGSupport;
 	bool NumberOfHDMIFRLSupport;
 	bool NumberOfDP2p0Support;
+	bool NumberOfTDLUT33cubeSupport;
 	bool WritebackScaleRatioAndTapsSupport;
 	bool CursorSupport;
 	bool PitchSupport;
@@ -357,6 +368,8 @@ struct dml2_mode_support_info {
 	unsigned int AlignedCPitch[DML2_MAX_PLANES];
 	bool g6_temp_read_support;
 	bool temp_read_or_ppt_support;
+	bool qos_bandwidth_support;
+	bool dcfclk_support;
 }; // dml2_mode_support_info
 
 struct dml2_display_cfg_programming {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index bf62d42b3f78..4ccdb179b001 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -12756,7 +12756,7 @@ void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_interna
 {
 	const struct dml2_plane_parameters *plane_descriptor = &display_cfg->display_config.plane_descriptors[plane_index];
 	const struct dml2_stream_parameters *stream_descriptor = &display_cfg->display_config.stream_descriptors[plane_descriptor->stream_index];
-	const struct dml2_fams2_meta *stream_fams2_meta = &display_cfg->stage3.stream_fams2_meta[plane_descriptor->stream_index];
+	const struct dml2_pstate_meta *stream_pstate_meta = &display_cfg->stage3.stream_pstate_meta[plane_descriptor->stream_index];
 
 	struct dmub_fams2_cmd_stream_static_base_state *base_programming = &fams2_base_programming->stream_v1.base;
 	union dmub_fams2_cmd_stream_static_sub_state *sub_programming = &fams2_sub_programming->stream_v1.sub_state;
@@ -12771,24 +12771,24 @@ void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_interna
 	/* from display configuration */
 	base_programming->htotal = (uint16_t)stream_descriptor->timing.h_total;
 	base_programming->vtotal = (uint16_t)stream_descriptor->timing.v_total;
-	base_programming->vblank_start = (uint16_t)(stream_fams2_meta->nom_vtotal -
+	base_programming->vblank_start = (uint16_t)(stream_pstate_meta->nom_vtotal -
 		stream_descriptor->timing.v_front_porch);
-	base_programming->vblank_end = (uint16_t)(stream_fams2_meta->nom_vtotal -
+	base_programming->vblank_end = (uint16_t)(stream_pstate_meta->nom_vtotal -
 		stream_descriptor->timing.v_front_porch -
 		stream_descriptor->timing.v_active);
 	base_programming->config.bits.is_drr = stream_descriptor->timing.drr_config.enabled;
 
 	/* from meta */
 	base_programming->otg_vline_time_ns =
-		(unsigned int)(stream_fams2_meta->otg_vline_time_us * 1000.0);
-	base_programming->scheduling_delay_otg_vlines = (uint8_t)stream_fams2_meta->scheduling_delay_otg_vlines;
-	base_programming->contention_delay_otg_vlines = (uint8_t)stream_fams2_meta->contention_delay_otg_vlines;
-	base_programming->vline_int_ack_delay_otg_vlines = (uint8_t)stream_fams2_meta->vertical_interrupt_ack_delay_otg_vlines;
-	base_programming->drr_keepout_otg_vline = (uint16_t)(stream_fams2_meta->nom_vtotal -
+		(unsigned int)(stream_pstate_meta->otg_vline_time_us * 1000.0);
+	base_programming->scheduling_delay_otg_vlines = (uint8_t)stream_pstate_meta->scheduling_delay_otg_vlines;
+	base_programming->contention_delay_otg_vlines = (uint8_t)stream_pstate_meta->contention_delay_otg_vlines;
+	base_programming->vline_int_ack_delay_otg_vlines = (uint8_t)stream_pstate_meta->vertical_interrupt_ack_delay_otg_vlines;
+	base_programming->drr_keepout_otg_vline = (uint16_t)(stream_pstate_meta->nom_vtotal -
 		stream_descriptor->timing.v_front_porch -
-		stream_fams2_meta->method_drr.programming_delay_otg_vlines);
-	base_programming->allow_to_target_delay_otg_vlines = (uint8_t)stream_fams2_meta->allow_to_target_delay_otg_vlines;
-	base_programming->max_vtotal = (uint16_t)stream_fams2_meta->max_vtotal;
+		stream_pstate_meta->method_drr.programming_delay_otg_vlines);
+	base_programming->allow_to_target_delay_otg_vlines = (uint8_t)stream_pstate_meta->allow_to_target_delay_otg_vlines;
+	base_programming->max_vtotal = (uint16_t)stream_pstate_meta->max_vtotal;
 
 	/* from core */
 	base_programming->config.bits.min_ttu_vblank_usable = true;
@@ -12807,11 +12807,11 @@ void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_interna
 		/* legacy vactive */
 		base_programming->type = FAMS2_STREAM_TYPE_VACTIVE;
 		sub_programming->legacy.vactive_det_fill_delay_otg_vlines =
-			(uint8_t)stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines;
+			(uint8_t)stream_pstate_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines;
 		base_programming->allow_start_otg_vline =
-			(uint16_t)stream_fams2_meta->method_vactive.common.allow_start_otg_vline;
+			(uint16_t)stream_pstate_meta->method_vactive.common.allow_start_otg_vline;
 		base_programming->allow_end_otg_vline =
-			(uint16_t)stream_fams2_meta->method_vactive.common.allow_end_otg_vline;
+			(uint16_t)stream_pstate_meta->method_vactive.common.allow_end_otg_vline;
 		base_programming->config.bits.clamp_vtotal_min = true;
 		break;
 	case dml2_pstate_method_vblank:
@@ -12819,22 +12819,22 @@ void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_interna
 		/* legacy vblank */
 		base_programming->type = FAMS2_STREAM_TYPE_VBLANK;
 		base_programming->allow_start_otg_vline =
-			(uint16_t)stream_fams2_meta->method_vblank.common.allow_start_otg_vline;
+			(uint16_t)stream_pstate_meta->method_vblank.common.allow_start_otg_vline;
 		base_programming->allow_end_otg_vline =
-			(uint16_t)stream_fams2_meta->method_vblank.common.allow_end_otg_vline;
+			(uint16_t)stream_pstate_meta->method_vblank.common.allow_end_otg_vline;
 		base_programming->config.bits.clamp_vtotal_min = true;
 		break;
 	case dml2_pstate_method_fw_drr:
 		/* drr */
 		base_programming->type = FAMS2_STREAM_TYPE_DRR;
 		sub_programming->drr.programming_delay_otg_vlines =
-			(uint8_t)stream_fams2_meta->method_drr.programming_delay_otg_vlines;
+			(uint8_t)stream_pstate_meta->method_drr.programming_delay_otg_vlines;
 		sub_programming->drr.nom_stretched_vtotal =
-			(uint16_t)stream_fams2_meta->method_drr.stretched_vtotal;
+			(uint16_t)stream_pstate_meta->method_drr.stretched_vtotal;
 		base_programming->allow_start_otg_vline =
-			(uint16_t)stream_fams2_meta->method_drr.common.allow_start_otg_vline;
+			(uint16_t)stream_pstate_meta->method_drr.common.allow_start_otg_vline;
 		base_programming->allow_end_otg_vline =
-			(uint16_t)stream_fams2_meta->method_drr.common.allow_end_otg_vline;
+			(uint16_t)stream_pstate_meta->method_drr.common.allow_end_otg_vline;
 		/* drr only clamps to vtotal min for single display */
 		base_programming->config.bits.clamp_vtotal_min = display_cfg->display_config.num_streams == 1;
 		sub_programming->drr.only_stretch_if_required = true;
@@ -12847,13 +12847,13 @@ void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_interna
 			(uint16_t)(plane_descriptor->composition.scaler_info.plane0.v_ratio * 1000.0);
 		sub_programming->subvp.vratio_denominator = 1000;
 		sub_programming->subvp.programming_delay_otg_vlines =
-			(uint8_t)stream_fams2_meta->method_subvp.programming_delay_otg_vlines;
+			(uint8_t)stream_pstate_meta->method_subvp.programming_delay_otg_vlines;
 		sub_programming->subvp.prefetch_to_mall_otg_vlines =
-			(uint8_t)stream_fams2_meta->method_subvp.prefetch_to_mall_delay_otg_vlines;
+			(uint8_t)stream_pstate_meta->method_subvp.prefetch_to_mall_delay_otg_vlines;
 		sub_programming->subvp.phantom_vtotal =
-			(uint16_t)stream_fams2_meta->method_subvp.phantom_vtotal;
+			(uint16_t)stream_pstate_meta->method_subvp.phantom_vtotal;
 		sub_programming->subvp.phantom_vactive =
-			(uint16_t)stream_fams2_meta->method_subvp.phantom_vactive;
+			(uint16_t)stream_pstate_meta->method_subvp.phantom_vactive;
 		sub_programming->subvp.config.bits.is_multi_planar =
 			plane_descriptor->surface.plane1.height > 0;
 		sub_programming->subvp.config.bits.is_yuv420 =
@@ -12862,9 +12862,9 @@ void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_interna
 			plane_descriptor->pixel_format == dml2_420_12;
 
 		base_programming->allow_start_otg_vline =
-			(uint16_t)stream_fams2_meta->method_subvp.common.allow_start_otg_vline;
+			(uint16_t)stream_pstate_meta->method_subvp.common.allow_start_otg_vline;
 		base_programming->allow_end_otg_vline =
-			(uint16_t)stream_fams2_meta->method_subvp.common.allow_end_otg_vline;
+			(uint16_t)stream_pstate_meta->method_subvp.common.allow_end_otg_vline;
 		base_programming->config.bits.clamp_vtotal_min = true;
 		break;
 	case dml2_pstate_method_reserved_hw:
@@ -13027,7 +13027,10 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 	out->informative.mode_support_info.VRatioInPrefetchSupported = mode_lib->ms.support.VRatioInPrefetchSupported;
 	out->informative.mode_support_info.DISPCLK_DPPCLK_Support = mode_lib->ms.support.DISPCLK_DPPCLK_Support;
 	out->informative.mode_support_info.TotalAvailablePipesSupport = mode_lib->ms.support.TotalAvailablePipesSupport;
+	out->informative.mode_support_info.NumberOfTDLUT33cubeSupport = mode_lib->ms.support.NumberOfTDLUT33cubeSupport;
 	out->informative.mode_support_info.ViewportSizeSupport = mode_lib->ms.support.ViewportSizeSupport;
+	out->informative.mode_support_info.qos_bandwidth_support = mode_lib->ms.support.qos_bandwidth_support;
+	out->informative.mode_support_info.dcfclk_support = mode_lib->ms.support.dcfclk_support;
 
 	for (k = 0; k < out->display_config.num_planes; k++) {
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
index 640087e862f8..cc4f0663c6d6 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
@@ -15,6 +15,8 @@ bool dml2_core_create(enum dml2_project_id project_id, struct dml2_core_instance
 
 	memset(out, 0, sizeof(struct dml2_core_instance));
 
+	out->project_id = project_id;
+
 	switch (project_id) {
 	case dml2_project_dcn4x_stage1:
 		result = false;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
index ffb8c09f37a5..ff1c47347610 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
@@ -37,6 +37,7 @@ struct dml2_core_ip_params {
 	unsigned int writeback_interface_buffer_size_kbytes;
 	unsigned int max_num_dpp;
 	unsigned int max_num_otg;
+	unsigned int TDLUT_33cube_count;
 	unsigned int max_num_wb;
 	unsigned int max_dchub_pscl_bw_pix_per_clk;
 	unsigned int max_pscl_lb_bw_pix_per_clk;
@@ -46,6 +47,7 @@ struct dml2_core_ip_params {
 	double max_vscl_ratio;
 	unsigned int max_hscl_taps;
 	unsigned int max_vscl_taps;
+	unsigned int odm_combine_support_mask;
 	unsigned int num_dsc;
 	unsigned int maximum_dsc_bits_per_component;
 	unsigned int maximum_pixels_per_line_per_dsc_unit;
@@ -82,7 +84,6 @@ struct dml2_core_ip_params {
 	unsigned int subvp_swath_height_margin_lines;
 	unsigned int subvp_fw_processing_delay_us;
 	unsigned int subvp_pstate_allow_width_us;
-
 	// MRQ
 	bool dcn_mrq_present;
 	unsigned int zero_size_buffer_entries;
@@ -103,6 +104,8 @@ struct dml2_core_internal_DmlPipe {
 	unsigned int DPPPerSurface;
 	bool ScalerEnabled;
 	bool UPSPEnabled;
+	unsigned int UPSPVTaps;
+	enum dml2_sample_positioning UPSPSamplePositioning;
 	enum dml2_rotation_angle RotationAngle;
 	bool mirrored;
 	unsigned int ViewportHeight;
@@ -230,6 +233,7 @@ struct dml2_core_internal_mode_support_info {
 	bool MSOOrODMSplitWithNonDPLink;
 	bool NotEnoughLanesForMSO;
 	bool NumberOfOTGSupport;
+	bool NumberOfTDLUT33cubeSupport;
 	bool NumberOfHDMIFRLSupport;
 	bool NumberOfDP2p0Support;
 	bool WritebackScaleRatioAndTapsSupport;
@@ -1306,7 +1310,7 @@ struct dml2_core_calcs_CalculateVMRowAndSwath_params {
 	unsigned int HostVMMinPageSize;
 	unsigned int DCCMetaBufferSizeBytes;
 	bool mrq_present;
-	enum dml2_pstate_method pstate_switch_modes[DML2_MAX_PLANES];
+	enum dml2_pstate_method *pstate_switch_modes;
 
 	// Output
 	bool *PTEBufferSizeNotExceeded;
@@ -2308,6 +2312,7 @@ struct dml2_core_calcs_mode_support_ex {
 	const struct dml2_display_cfg *in_display_cfg;
 	const struct dml2_mcg_min_clock_table *min_clk_table;
 	int min_clk_index;
+	enum dml2_project_id project_id;
 	//unsigned int in_state_index;
 	struct dml2_core_internal_mode_support_info *out_evaluation_info;
 };
@@ -2320,6 +2325,7 @@ struct dml2_core_calcs_mode_programming_ex {
 	const struct dml2_mcg_min_clock_table *min_clk_table;
 	const struct core_display_cfg_support_info *cfg_support_info;
 	int min_clk_index;
+	enum dml2_project_id project_id;
 	struct dml2_display_cfg_programming *programming;
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
index d88b3e0082dd..5769c2638f9a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
@@ -642,6 +642,11 @@ bool pmo_dcn4_fams2_initialize(struct dml2_pmo_initialize_in_out *in_out)
 	int i = 0;
 	struct dml2_pmo_instance *pmo = in_out->instance;
 
+	unsigned int base_list_size = 0;
+	const struct dml2_pmo_pstate_strategy *base_list = NULL;
+	unsigned int *expanded_list_size = NULL;
+	struct dml2_pmo_pstate_strategy *expanded_list = NULL;
+
 	pmo->soc_bb = in_out->soc_bb;
 	pmo->ip_caps = in_out->ip_caps;
 	pmo->mpc_combine_limit = 2;
@@ -656,53 +661,71 @@ bool pmo_dcn4_fams2_initialize(struct dml2_pmo_initialize_in_out *in_out)
 	pmo->options = in_out->options;
 
 	/* generate permutations of p-state configs from base strategy list */
-	for (i = 1; i <= PMO_DCN4_MAX_DISPLAYS; i++) {
-		switch (i) {
+	for (i = 0; i < PMO_DCN4_MAX_DISPLAYS; i++) {
+		switch (i+1) {
 		case 1:
-			DML_ASSERT(base_strategy_list_1_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
-
-			/* populate list */
-			pmo_dcn4_fams2_expand_base_pstate_strategies(
-					base_strategy_list_1_display,
-					base_strategy_list_1_display_size,
-					i,
-					pmo->init_data.pmo_dcn4.expanded_strategy_list_1_display,
-					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
+			if (pmo->options->override_strategy_lists[i] && pmo->options->num_override_strategies_per_list[i]) {
+				base_list = pmo->options->override_strategy_lists[i];
+				base_list_size = pmo->options->num_override_strategies_per_list[i];
+			} else {
+				base_list = base_strategy_list_1_display;
+				base_list_size = base_strategy_list_1_display_size;
+			}
+
+			expanded_list_size = &pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i];
+			expanded_list = pmo->init_data.pmo_dcn4.expanded_strategy_list_1_display;
+
 			break;
 		case 2:
-			DML_ASSERT(base_strategy_list_2_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
-
-			/* populate list */
-			pmo_dcn4_fams2_expand_base_pstate_strategies(
-					base_strategy_list_2_display,
-					base_strategy_list_2_display_size,
-					i,
-					pmo->init_data.pmo_dcn4.expanded_strategy_list_2_display,
-					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
+			if (pmo->options->override_strategy_lists[i] && pmo->options->num_override_strategies_per_list[i]) {
+				base_list = pmo->options->override_strategy_lists[i];
+				base_list_size = pmo->options->num_override_strategies_per_list[i];
+			} else {
+				base_list = base_strategy_list_2_display;
+				base_list_size = base_strategy_list_2_display_size;
+			}
+
+			expanded_list_size = &pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i];
+			expanded_list = pmo->init_data.pmo_dcn4.expanded_strategy_list_2_display;
+
 			break;
 		case 3:
-			DML_ASSERT(base_strategy_list_3_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
-
-			/* populate list */
-			pmo_dcn4_fams2_expand_base_pstate_strategies(
-					base_strategy_list_3_display,
-					base_strategy_list_3_display_size,
-					i,
-					pmo->init_data.pmo_dcn4.expanded_strategy_list_3_display,
-					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
+			if (pmo->options->override_strategy_lists[i] && pmo->options->num_override_strategies_per_list[i]) {
+				base_list = pmo->options->override_strategy_lists[i];
+				base_list_size = pmo->options->num_override_strategies_per_list[i];
+			} else {
+				base_list = base_strategy_list_3_display;
+				base_list_size = base_strategy_list_3_display_size;
+			}
+
+			expanded_list_size = &pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i];
+			expanded_list = pmo->init_data.pmo_dcn4.expanded_strategy_list_3_display;
+
 			break;
 		case 4:
-			DML_ASSERT(base_strategy_list_4_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
-
-			/* populate list */
-			pmo_dcn4_fams2_expand_base_pstate_strategies(
-					base_strategy_list_4_display,
-					base_strategy_list_4_display_size,
-					i,
-					pmo->init_data.pmo_dcn4.expanded_strategy_list_4_display,
-					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
+			if (pmo->options->override_strategy_lists[i] && pmo->options->num_override_strategies_per_list[i]) {
+				base_list = pmo->options->override_strategy_lists[i];
+				base_list_size = pmo->options->num_override_strategies_per_list[i];
+			} else {
+				base_list = base_strategy_list_4_display;
+				base_list_size = base_strategy_list_4_display_size;
+			}
+
+			expanded_list_size = &pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i];
+			expanded_list = pmo->init_data.pmo_dcn4.expanded_strategy_list_4_display;
+
 			break;
 		}
+
+		DML_ASSERT(base_list_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
+
+		/* populate list */
+		pmo_dcn4_fams2_expand_base_pstate_strategies(
+				base_list,
+				base_list_size,
+				i + 1,
+				expanded_list,
+				expanded_list_size);
 	}
 
 	return true;
@@ -1026,13 +1049,13 @@ static bool all_timings_support_vblank(const struct dml2_pmo_instance *pmo,
 	return synchronizable;
 }
 
-static unsigned int calc_svp_microschedule(const struct dml2_fams2_meta *fams2_meta)
+static unsigned int calc_svp_microschedule(const struct dml2_pstate_meta *pstate_meta)
 {
-	return fams2_meta->contention_delay_otg_vlines +
-		fams2_meta->method_subvp.programming_delay_otg_vlines +
-		fams2_meta->method_subvp.phantom_vtotal +
-		fams2_meta->method_subvp.prefetch_to_mall_delay_otg_vlines +
-		fams2_meta->dram_clk_change_blackout_otg_vlines;
+	return pstate_meta->contention_delay_otg_vlines +
+		pstate_meta->method_subvp.programming_delay_otg_vlines +
+		pstate_meta->method_subvp.phantom_vtotal +
+		pstate_meta->method_subvp.prefetch_to_mall_delay_otg_vlines +
+		pstate_meta->blackout_otg_vlines;
 }
 
 static bool all_timings_support_drr(const struct dml2_pmo_instance *pmo,
@@ -1042,29 +1065,29 @@ static bool all_timings_support_drr(const struct dml2_pmo_instance *pmo,
 	unsigned int i;
 	for (i = 0; i < DML2_MAX_PLANES; i++) {
 		const struct dml2_stream_parameters *stream_descriptor;
-		const struct dml2_fams2_meta *stream_fams2_meta;
+		const struct dml2_pstate_meta *stream_pstate_meta;
 
 		if (is_bit_set_in_bitfield(mask, i)) {
 			stream_descriptor = &display_config->display_config.stream_descriptors[i];
-			stream_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[i];
+			stream_pstate_meta = &pmo->scratch.pmo_dcn4.stream_pstate_meta[i];
 
 			if (!stream_descriptor->timing.drr_config.enabled)
 				return false;
 
 			/* cannot support required vtotal */
-			if (stream_fams2_meta->method_drr.stretched_vtotal > stream_fams2_meta->max_vtotal) {
+			if (stream_pstate_meta->method_drr.stretched_vtotal > stream_pstate_meta->max_vtotal) {
 				return false;
 			}
 
 			/* check rr is within bounds */
-			if (stream_fams2_meta->nom_refresh_rate_hz < pmo->fams_params.v2.drr.refresh_rate_limit_min ||
-				stream_fams2_meta->nom_refresh_rate_hz > pmo->fams_params.v2.drr.refresh_rate_limit_max) {
+			if (stream_pstate_meta->nom_refresh_rate_hz < pmo->fams_params.v2.drr.refresh_rate_limit_min ||
+				stream_pstate_meta->nom_refresh_rate_hz > pmo->fams_params.v2.drr.refresh_rate_limit_max) {
 				return false;
 			}
 
 			/* check required stretch is allowed */
 			if (stream_descriptor->timing.drr_config.max_instant_vtotal_delta > 0 &&
-					stream_fams2_meta->method_drr.stretched_vtotal - stream_fams2_meta->nom_vtotal > stream_descriptor->timing.drr_config.max_instant_vtotal_delta) {
+					stream_pstate_meta->method_drr.stretched_vtotal - stream_pstate_meta->nom_vtotal > stream_descriptor->timing.drr_config.max_instant_vtotal_delta) {
 				return false;
 			}
 		}
@@ -1079,7 +1102,7 @@ static bool all_timings_support_svp(const struct dml2_pmo_instance *pmo,
 {
 	const struct dml2_stream_parameters *stream_descriptor;
 	const struct dml2_plane_parameters *plane_descriptor;
-	const struct dml2_fams2_meta *stream_fams2_meta;
+	const struct dml2_pstate_meta *stream_pstate_meta;
 	unsigned int microschedule_vlines;
 	unsigned int i;
 	unsigned int mcaches_per_plane;
@@ -1124,13 +1147,13 @@ static bool all_timings_support_svp(const struct dml2_pmo_instance *pmo,
 	for (i = 0; i < DML2_MAX_PLANES; i++) {
 		if (is_bit_set_in_bitfield(mask, i)) {
 			stream_descriptor = &display_config->display_config.stream_descriptors[i];
-			stream_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[i];
+			stream_pstate_meta = &pmo->scratch.pmo_dcn4.stream_pstate_meta[i];
 
 			if (stream_descriptor->overrides.disable_subvp) {
 				return false;
 			}
 
-			microschedule_vlines = calc_svp_microschedule(&pmo->scratch.pmo_dcn4.stream_fams2_meta[i]);
+			microschedule_vlines = calc_svp_microschedule(&pmo->scratch.pmo_dcn4.stream_pstate_meta[i]);
 
 			/* block if using an interlaced timing */
 			if (stream_descriptor->timing.interlaced) {
@@ -1141,8 +1164,8 @@ static bool all_timings_support_svp(const struct dml2_pmo_instance *pmo,
 			*  2) refresh rate must be within the allowed bounds
 			*/
 			if (microschedule_vlines >= stream_descriptor->timing.v_active ||
-					(stream_fams2_meta->nom_refresh_rate_hz < pmo->fams_params.v2.subvp.refresh_rate_limit_min ||
-					stream_fams2_meta->nom_refresh_rate_hz > pmo->fams_params.v2.subvp.refresh_rate_limit_max)) {
+					(stream_pstate_meta->nom_refresh_rate_hz < pmo->fams_params.v2.subvp.refresh_rate_limit_min ||
+					stream_pstate_meta->nom_refresh_rate_hz > pmo->fams_params.v2.subvp.refresh_rate_limit_max)) {
 				return false;
 			}
 		}
@@ -1232,43 +1255,43 @@ static bool all_planes_match_method(const struct display_configuation_with_meta
 }
 
 static void build_method_scheduling_params(
-	struct dml2_fams2_per_method_common_meta *stream_method_fams2_meta,
-	struct dml2_fams2_meta *stream_fams2_meta)
+	struct dml2_pstate_per_method_common_meta *stream_method_pstate_meta,
+	struct dml2_pstate_meta *stream_pstate_meta)
 {
-	stream_method_fams2_meta->allow_time_us =
-			(double)((int)stream_method_fams2_meta->allow_end_otg_vline - (int)stream_method_fams2_meta->allow_start_otg_vline) *
-			stream_fams2_meta->otg_vline_time_us;
-	if (stream_method_fams2_meta->allow_time_us >= stream_method_fams2_meta->period_us) {
+	stream_method_pstate_meta->allow_time_us =
+			(double)((int)stream_method_pstate_meta->allow_end_otg_vline - (int)stream_method_pstate_meta->allow_start_otg_vline) *
+			stream_pstate_meta->otg_vline_time_us;
+	if (stream_method_pstate_meta->allow_time_us >= stream_method_pstate_meta->period_us) {
 		/* when allow wave overlaps an entire frame, it is always schedulable (DRR can do this)*/
-		stream_method_fams2_meta->disallow_time_us = 0.0;
+		stream_method_pstate_meta->disallow_time_us = 0.0;
 	} else {
-		stream_method_fams2_meta->disallow_time_us =
-				stream_method_fams2_meta->period_us - stream_method_fams2_meta->allow_time_us;
+		stream_method_pstate_meta->disallow_time_us =
+				stream_method_pstate_meta->period_us - stream_method_pstate_meta->allow_time_us;
 	}
 }
 
-static struct dml2_fams2_per_method_common_meta *get_per_method_common_meta(
+static struct dml2_pstate_per_method_common_meta *get_per_method_common_meta(
 	struct dml2_pmo_instance *pmo,
 	enum dml2_pstate_method stream_pstate_method,
 	int stream_idx)
 {
-	struct dml2_fams2_per_method_common_meta *stream_method_fams2_meta = NULL;
+	struct dml2_pstate_per_method_common_meta *stream_method_pstate_meta = NULL;
 
 	switch (stream_pstate_method) {
 	case dml2_pstate_method_vactive:
 	case dml2_pstate_method_fw_vactive_drr:
-		stream_method_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_idx].method_vactive.common;
+		stream_method_pstate_meta = &pmo->scratch.pmo_dcn4.stream_pstate_meta[stream_idx].method_vactive.common;
 		break;
 	case dml2_pstate_method_vblank:
 	case dml2_pstate_method_fw_vblank_drr:
-		stream_method_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_idx].method_vblank.common;
+		stream_method_pstate_meta = &pmo->scratch.pmo_dcn4.stream_pstate_meta[stream_idx].method_vblank.common;
 		break;
 	case dml2_pstate_method_fw_svp:
 	case dml2_pstate_method_fw_svp_drr:
-		stream_method_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_idx].method_subvp.common;
+		stream_method_pstate_meta = &pmo->scratch.pmo_dcn4.stream_pstate_meta[stream_idx].method_subvp.common;
 		break;
 	case dml2_pstate_method_fw_drr:
-		stream_method_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_idx].method_drr.common;
+		stream_method_pstate_meta = &pmo->scratch.pmo_dcn4.stream_pstate_meta[stream_idx].method_drr.common;
 		break;
 	case dml2_pstate_method_reserved_hw:
 	case dml2_pstate_method_reserved_fw:
@@ -1277,10 +1300,10 @@ static struct dml2_fams2_per_method_common_meta *get_per_method_common_meta(
 	case dml2_pstate_method_count:
 	case dml2_pstate_method_na:
 	default:
-		stream_method_fams2_meta = NULL;
+		stream_method_pstate_meta = NULL;
 	}
 
-	return stream_method_fams2_meta;
+	return stream_method_pstate_meta;
 }
 
 static bool is_timing_group_schedulable(
@@ -1288,10 +1311,10 @@ static bool is_timing_group_schedulable(
 		const struct display_configuation_with_meta *display_cfg,
 		const struct dml2_pmo_pstate_strategy *pstate_strategy,
 		const unsigned int timing_group_idx,
-		struct dml2_fams2_per_method_common_meta *group_fams2_meta)
+		struct dml2_pstate_per_method_common_meta *group_pstate_meta)
 {
 	unsigned int i;
-	struct dml2_fams2_per_method_common_meta *stream_method_fams2_meta;
+	struct dml2_pstate_per_method_common_meta *stream_method_pstate_meta;
 
 	unsigned int base_stream_idx = 0;
 	struct dml2_pmo_scratch *s = &pmo->scratch;
@@ -1305,31 +1328,31 @@ static bool is_timing_group_schedulable(
 	}
 
 	/* init allow start and end lines for timing group */
-	stream_method_fams2_meta = get_per_method_common_meta(pmo, pstate_strategy->per_stream_pstate_method[base_stream_idx], base_stream_idx);
-	if (!stream_method_fams2_meta)
+	stream_method_pstate_meta = get_per_method_common_meta(pmo, pstate_strategy->per_stream_pstate_method[base_stream_idx], base_stream_idx);
+	if (!stream_method_pstate_meta)
 		return false;
 
-	group_fams2_meta->allow_start_otg_vline = stream_method_fams2_meta->allow_start_otg_vline;
-	group_fams2_meta->allow_end_otg_vline = stream_method_fams2_meta->allow_end_otg_vline;
-	group_fams2_meta->period_us = stream_method_fams2_meta->period_us;
+	group_pstate_meta->allow_start_otg_vline = stream_method_pstate_meta->allow_start_otg_vline;
+	group_pstate_meta->allow_end_otg_vline = stream_method_pstate_meta->allow_end_otg_vline;
+	group_pstate_meta->period_us = stream_method_pstate_meta->period_us;
 	for (i = base_stream_idx + 1; i < display_cfg->display_config.num_streams; i++) {
 		if (is_bit_set_in_bitfield(pmo->scratch.pmo_dcn4.synchronized_timing_group_masks[timing_group_idx], i)) {
-			stream_method_fams2_meta = get_per_method_common_meta(pmo, pstate_strategy->per_stream_pstate_method[i], i);
-			if (!stream_method_fams2_meta)
+			stream_method_pstate_meta = get_per_method_common_meta(pmo, pstate_strategy->per_stream_pstate_method[i], i);
+			if (!stream_method_pstate_meta)
 				continue;
 
-			if (group_fams2_meta->allow_start_otg_vline < stream_method_fams2_meta->allow_start_otg_vline) {
+			if (group_pstate_meta->allow_start_otg_vline < stream_method_pstate_meta->allow_start_otg_vline) {
 				/* set group allow start to larger otg vline */
-				group_fams2_meta->allow_start_otg_vline = stream_method_fams2_meta->allow_start_otg_vline;
+				group_pstate_meta->allow_start_otg_vline = stream_method_pstate_meta->allow_start_otg_vline;
 			}
 
-			if (group_fams2_meta->allow_end_otg_vline > stream_method_fams2_meta->allow_end_otg_vline) {
+			if (group_pstate_meta->allow_end_otg_vline > stream_method_pstate_meta->allow_end_otg_vline) {
 				/* set group allow end to smaller otg vline */
-				group_fams2_meta->allow_end_otg_vline = stream_method_fams2_meta->allow_end_otg_vline;
+				group_pstate_meta->allow_end_otg_vline = stream_method_pstate_meta->allow_end_otg_vline;
 			}
 
 			/* check waveform still has positive width */
-			if (group_fams2_meta->allow_start_otg_vline >= group_fams2_meta->allow_end_otg_vline) {
+			if (group_pstate_meta->allow_start_otg_vline >= group_pstate_meta->allow_end_otg_vline) {
 				/* timing group is not schedulable */
 				return false;
 			}
@@ -1337,10 +1360,10 @@ static bool is_timing_group_schedulable(
 	}
 
 	/* calculate the rest of the meta */
-	build_method_scheduling_params(group_fams2_meta, &pmo->scratch.pmo_dcn4.stream_fams2_meta[base_stream_idx]);
+	build_method_scheduling_params(group_pstate_meta, &pmo->scratch.pmo_dcn4.stream_pstate_meta[base_stream_idx]);
 
-	return group_fams2_meta->allow_time_us > 0.0 &&
-			group_fams2_meta->disallow_time_us < pmo->ip_caps->fams2.max_allow_delay_us;
+	return group_pstate_meta->allow_time_us > 0.0 &&
+			group_pstate_meta->disallow_time_us < pmo->ip_caps->fams2.max_allow_delay_us;
 }
 
 static bool is_config_schedulable(
@@ -1354,7 +1377,7 @@ static bool is_config_schedulable(
 
 	double max_allow_delay_us = 0.0;
 
-	memset(s->pmo_dcn4.group_common_fams2_meta, 0, sizeof(s->pmo_dcn4.group_common_fams2_meta));
+	memset(s->pmo_dcn4.group_common_pstate_meta, 0, sizeof(s->pmo_dcn4.group_common_pstate_meta));
 	memset(s->pmo_dcn4.sorted_group_gtl_disallow_index, 0, sizeof(unsigned int) * DML2_MAX_PLANES);
 
 	/* search for a general solution to the schedule */
@@ -1369,12 +1392,12 @@ static bool is_config_schedulable(
 	for (i = 0; i < s->pmo_dcn4.num_timing_groups; i++) {
 		s->pmo_dcn4.sorted_group_gtl_disallow_index[i] = i;
 		s->pmo_dcn4.sorted_group_gtl_period_index[i] = i;
-		if (!is_timing_group_schedulable(pmo, display_cfg, pstate_strategy, i, &s->pmo_dcn4.group_common_fams2_meta[i])) {
+		if (!is_timing_group_schedulable(pmo, display_cfg, pstate_strategy, i, &s->pmo_dcn4.group_common_pstate_meta[i])) {
 			/* synchronized timing group was not schedulable */
 			schedulable = false;
 			break;
 		}
-		max_allow_delay_us += s->pmo_dcn4.group_common_fams2_meta[i].disallow_time_us;
+		max_allow_delay_us += s->pmo_dcn4.group_common_pstate_meta[i].disallow_time_us;
 	}
 
 	if ((schedulable && s->pmo_dcn4.num_timing_groups <= 1) || !schedulable) {
@@ -1391,8 +1414,8 @@ static bool is_config_schedulable(
 		bool swapped = false;
 
 		for (j = 0; j < s->pmo_dcn4.num_timing_groups - 1; j++) {
-			double j_disallow_us = s->pmo_dcn4.group_common_fams2_meta[s->pmo_dcn4.sorted_group_gtl_disallow_index[j]].disallow_time_us;
-			double jp1_disallow_us = s->pmo_dcn4.group_common_fams2_meta[s->pmo_dcn4.sorted_group_gtl_disallow_index[j + 1]].disallow_time_us;
+			double j_disallow_us = s->pmo_dcn4.group_common_pstate_meta[s->pmo_dcn4.sorted_group_gtl_disallow_index[j]].disallow_time_us;
+			double jp1_disallow_us = s->pmo_dcn4.group_common_pstate_meta[s->pmo_dcn4.sorted_group_gtl_disallow_index[j + 1]].disallow_time_us;
 			if (j_disallow_us < jp1_disallow_us) {
 				/* swap as A < B */
 				swap(s->pmo_dcn4.sorted_group_gtl_disallow_index[j],
@@ -1410,19 +1433,19 @@ static bool is_config_schedulable(
 	* other display, or when >2 streams continue to halve the remaining allow time.
 	*/
 	for (i = 0; i < s->pmo_dcn4.num_timing_groups; i++) {
-		if (s->pmo_dcn4.group_common_fams2_meta[i].disallow_time_us <= 0.0) {
+		if (s->pmo_dcn4.group_common_pstate_meta[i].disallow_time_us <= 0.0) {
 			/* this timing group always allows */
 			continue;
 		}
 
-		double max_allow_time_us = s->pmo_dcn4.group_common_fams2_meta[i].allow_time_us;
+		double max_allow_time_us = s->pmo_dcn4.group_common_pstate_meta[i].allow_time_us;
 		for (j = 0; j < s->pmo_dcn4.num_timing_groups; j++) {
 			unsigned int sorted_j = s->pmo_dcn4.sorted_group_gtl_disallow_index[j];
 			/* stream can't overlap itself */
-			if (i != sorted_j && s->pmo_dcn4.group_common_fams2_meta[sorted_j].disallow_time_us > 0.0) {
+			if (i != sorted_j && s->pmo_dcn4.group_common_pstate_meta[sorted_j].disallow_time_us > 0.0) {
 				max_allow_time_us = math_min2(
-						s->pmo_dcn4.group_common_fams2_meta[sorted_j].allow_time_us,
-						(max_allow_time_us - s->pmo_dcn4.group_common_fams2_meta[sorted_j].disallow_time_us) / 2);
+						s->pmo_dcn4.group_common_pstate_meta[sorted_j].allow_time_us,
+						(max_allow_time_us - s->pmo_dcn4.group_common_pstate_meta[sorted_j].disallow_time_us) / 2);
 
 				if (max_allow_time_us < 0.0) {
 					/* failed exit early */
@@ -1450,8 +1473,8 @@ static bool is_config_schedulable(
 		bool swapped = false;
 
 		for (j = 0; j < s->pmo_dcn4.num_timing_groups - 1; j++) {
-			double j_period_us = s->pmo_dcn4.group_common_fams2_meta[s->pmo_dcn4.sorted_group_gtl_period_index[j]].period_us;
-			double jp1_period_us = s->pmo_dcn4.group_common_fams2_meta[s->pmo_dcn4.sorted_group_gtl_period_index[j + 1]].period_us;
+			double j_period_us = s->pmo_dcn4.group_common_pstate_meta[s->pmo_dcn4.sorted_group_gtl_period_index[j]].period_us;
+			double jp1_period_us = s->pmo_dcn4.group_common_pstate_meta[s->pmo_dcn4.sorted_group_gtl_period_index[j + 1]].period_us;
 			if (j_period_us < jp1_period_us) {
 				/* swap as A < B */
 				swap(s->pmo_dcn4.sorted_group_gtl_period_index[j],
@@ -1470,7 +1493,7 @@ static bool is_config_schedulable(
 		unsigned int sorted_i = s->pmo_dcn4.sorted_group_gtl_period_index[i];
 		unsigned int sorted_ip1 = s->pmo_dcn4.sorted_group_gtl_period_index[i + 1];
 
-		if (s->pmo_dcn4.group_common_fams2_meta[sorted_i].allow_time_us < s->pmo_dcn4.group_common_fams2_meta[sorted_ip1].period_us ||
+		if (s->pmo_dcn4.group_common_pstate_meta[sorted_i].allow_time_us < s->pmo_dcn4.group_common_pstate_meta[sorted_ip1].period_us ||
 				(s->pmo_dcn4.group_is_drr_enabled[sorted_ip1] && s->pmo_dcn4.group_is_drr_active[sorted_ip1])) {
 			schedulable = false;
 			break;
@@ -1492,18 +1515,18 @@ static bool is_config_schedulable(
 		/* default period_0 > period_1 */
 		unsigned int lrg_idx = 0;
 		unsigned int sml_idx = 1;
-		if (s->pmo_dcn4.group_common_fams2_meta[0].period_us < s->pmo_dcn4.group_common_fams2_meta[1].period_us) {
+		if (s->pmo_dcn4.group_common_pstate_meta[0].period_us < s->pmo_dcn4.group_common_pstate_meta[1].period_us) {
 			/* period_0 < period_1 */
 			lrg_idx = 1;
 			sml_idx = 0;
 		}
-		period_ratio = s->pmo_dcn4.group_common_fams2_meta[lrg_idx].period_us / s->pmo_dcn4.group_common_fams2_meta[sml_idx].period_us;
-		shift_per_period = s->pmo_dcn4.group_common_fams2_meta[sml_idx].period_us * (period_ratio - math_floor(period_ratio));
-		max_shift_us = s->pmo_dcn4.group_common_fams2_meta[lrg_idx].disallow_time_us - s->pmo_dcn4.group_common_fams2_meta[sml_idx].allow_time_us;
-		max_allow_delay_us = max_shift_us / shift_per_period * s->pmo_dcn4.group_common_fams2_meta[lrg_idx].period_us;
+		period_ratio = s->pmo_dcn4.group_common_pstate_meta[lrg_idx].period_us / s->pmo_dcn4.group_common_pstate_meta[sml_idx].period_us;
+		shift_per_period = s->pmo_dcn4.group_common_pstate_meta[sml_idx].period_us * (period_ratio - math_floor(period_ratio));
+		max_shift_us = s->pmo_dcn4.group_common_pstate_meta[lrg_idx].disallow_time_us - s->pmo_dcn4.group_common_pstate_meta[sml_idx].allow_time_us;
+		max_allow_delay_us = max_shift_us / shift_per_period * s->pmo_dcn4.group_common_pstate_meta[lrg_idx].period_us;
 
 		if (shift_per_period > 0.0 &&
-			shift_per_period < s->pmo_dcn4.group_common_fams2_meta[lrg_idx].allow_time_us + s->pmo_dcn4.group_common_fams2_meta[sml_idx].allow_time_us &&
+			shift_per_period < s->pmo_dcn4.group_common_pstate_meta[lrg_idx].allow_time_us + s->pmo_dcn4.group_common_pstate_meta[sml_idx].allow_time_us &&
 			max_allow_delay_us < pmo->ip_caps->fams2.max_allow_delay_us) {
 			schedulable = true;
 		}
@@ -1661,7 +1684,7 @@ static unsigned int get_vactive_det_fill_latency_delay_us(const struct display_c
 	return max_vactive_fill_us;
 }
 
-static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
+static void build_pstate_meta_per_stream(struct dml2_pmo_instance *pmo,
 	struct display_configuation_with_meta *display_config,
 	int stream_index)
 {
@@ -1669,7 +1692,7 @@ static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 	const struct dml2_stream_parameters *stream_descriptor = &display_config->display_config.stream_descriptors[stream_index];
 	const struct core_stream_support_info *stream_info = &display_config->mode_support_result.cfg_support_info.stream_support_info[stream_index];
 	const struct dml2_timing_cfg *timing = &stream_descriptor->timing;
-	struct dml2_fams2_meta *stream_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_index];
+	struct dml2_pstate_meta *stream_pstate_meta = &pmo->scratch.pmo_dcn4.stream_pstate_meta[stream_index];
 
 	/* worst case all other streams require some programming at the same time, 0 if only 1 stream */
 	unsigned int contention_delay_us = (ip_caps->fams2.vertical_interrupt_ack_delay_us +
@@ -1677,142 +1700,142 @@ static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 			(display_config->display_config.num_streams - 1);
 
 	/* common */
-	stream_fams2_meta->valid = true;
-	stream_fams2_meta->otg_vline_time_us = (double)timing->h_total / timing->pixel_clock_khz * 1000.0;
-	stream_fams2_meta->nom_vtotal = stream_descriptor->timing.vblank_nom + stream_descriptor->timing.v_active;
-	stream_fams2_meta->nom_refresh_rate_hz = timing->pixel_clock_khz * 1000.0 /
-			(stream_fams2_meta->nom_vtotal * timing->h_total);
-	stream_fams2_meta->nom_frame_time_us =
-			(double)stream_fams2_meta->nom_vtotal * stream_fams2_meta->otg_vline_time_us;
-	stream_fams2_meta->vblank_start = timing->v_blank_end + timing->v_active;
+	stream_pstate_meta->valid = true;
+	stream_pstate_meta->otg_vline_time_us = (double)timing->h_total / timing->pixel_clock_khz * 1000.0;
+	stream_pstate_meta->nom_vtotal = stream_descriptor->timing.vblank_nom + stream_descriptor->timing.v_active;
+	stream_pstate_meta->nom_refresh_rate_hz = timing->pixel_clock_khz * 1000.0 /
+			(stream_pstate_meta->nom_vtotal * timing->h_total);
+	stream_pstate_meta->nom_frame_time_us =
+			(double)stream_pstate_meta->nom_vtotal * stream_pstate_meta->otg_vline_time_us;
+	stream_pstate_meta->vblank_start = timing->v_blank_end + timing->v_active;
 
 	if (stream_descriptor->timing.drr_config.enabled == true) {
 		if (stream_descriptor->timing.drr_config.min_refresh_uhz != 0.0) {
-			stream_fams2_meta->max_vtotal = (unsigned int)math_floor((double)stream_descriptor->timing.pixel_clock_khz /
+			stream_pstate_meta->max_vtotal = (unsigned int)math_floor((double)stream_descriptor->timing.pixel_clock_khz /
 					((double)stream_descriptor->timing.drr_config.min_refresh_uhz * stream_descriptor->timing.h_total) * 1e9);
 		} else {
 			/* assume min of 48Hz */
-			stream_fams2_meta->max_vtotal = (unsigned int)math_floor((double)stream_descriptor->timing.pixel_clock_khz /
+			stream_pstate_meta->max_vtotal = (unsigned int)math_floor((double)stream_descriptor->timing.pixel_clock_khz /
 					(48000000.0 * stream_descriptor->timing.h_total) * 1e9);
 		}
 	} else {
-		stream_fams2_meta->max_vtotal = stream_fams2_meta->nom_vtotal;
-	}
-	stream_fams2_meta->min_refresh_rate_hz = timing->pixel_clock_khz * 1000.0 /
-			(stream_fams2_meta->max_vtotal * timing->h_total);
-	stream_fams2_meta->max_frame_time_us =
-			(double)stream_fams2_meta->max_vtotal * stream_fams2_meta->otg_vline_time_us;
-
-	stream_fams2_meta->scheduling_delay_otg_vlines =
-			(unsigned int)math_ceil(ip_caps->fams2.scheduling_delay_us / stream_fams2_meta->otg_vline_time_us);
-	stream_fams2_meta->vertical_interrupt_ack_delay_otg_vlines =
-			(unsigned int)math_ceil(ip_caps->fams2.vertical_interrupt_ack_delay_us / stream_fams2_meta->otg_vline_time_us);
-	stream_fams2_meta->contention_delay_otg_vlines =
-			(unsigned int)math_ceil(contention_delay_us / stream_fams2_meta->otg_vline_time_us);
+		stream_pstate_meta->max_vtotal = stream_pstate_meta->nom_vtotal;
+	}
+	stream_pstate_meta->min_refresh_rate_hz = timing->pixel_clock_khz * 1000.0 /
+			(stream_pstate_meta->max_vtotal * timing->h_total);
+	stream_pstate_meta->max_frame_time_us =
+			(double)stream_pstate_meta->max_vtotal * stream_pstate_meta->otg_vline_time_us;
+
+	stream_pstate_meta->scheduling_delay_otg_vlines =
+			(unsigned int)math_ceil(ip_caps->fams2.scheduling_delay_us / stream_pstate_meta->otg_vline_time_us);
+	stream_pstate_meta->vertical_interrupt_ack_delay_otg_vlines =
+			(unsigned int)math_ceil(ip_caps->fams2.vertical_interrupt_ack_delay_us / stream_pstate_meta->otg_vline_time_us);
+	stream_pstate_meta->contention_delay_otg_vlines =
+			(unsigned int)math_ceil(contention_delay_us / stream_pstate_meta->otg_vline_time_us);
 	/* worst case allow to target needs to account for all streams' allow events overlapping, and 1 line for error */
-	stream_fams2_meta->allow_to_target_delay_otg_vlines =
-			(unsigned int)(math_ceil((ip_caps->fams2.vertical_interrupt_ack_delay_us + contention_delay_us + ip_caps->fams2.allow_programming_delay_us) / stream_fams2_meta->otg_vline_time_us)) + 1;
-	stream_fams2_meta->min_allow_width_otg_vlines =
-			(unsigned int)math_ceil(ip_caps->fams2.min_allow_width_us / stream_fams2_meta->otg_vline_time_us);
+	stream_pstate_meta->allow_to_target_delay_otg_vlines =
+			(unsigned int)(math_ceil((ip_caps->fams2.vertical_interrupt_ack_delay_us + contention_delay_us + ip_caps->fams2.allow_programming_delay_us) / stream_pstate_meta->otg_vline_time_us)) + 1;
+	stream_pstate_meta->min_allow_width_otg_vlines =
+			(unsigned int)math_ceil(ip_caps->fams2.min_allow_width_us / stream_pstate_meta->otg_vline_time_us);
 	/* this value should account for urgent latency */
-	stream_fams2_meta->dram_clk_change_blackout_otg_vlines =
+	stream_pstate_meta->blackout_otg_vlines =
 			(unsigned int)math_ceil(pmo->soc_bb->power_management_parameters.dram_clk_change_blackout_us /
-			stream_fams2_meta->otg_vline_time_us);
+			stream_pstate_meta->otg_vline_time_us);
 
 	/* scheduling params should be built based on the worst case for allow_time:disallow_time */
 
 	/* vactive */
 	if (display_config->display_config.num_streams == 1) {
 		/* for single stream, guarantee at least an instant of allow */
-		stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines = (unsigned int)math_floor(
+		stream_pstate_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines = (unsigned int)math_floor(
 				math_max2(0.0,
-				timing->v_active - math_max2(1.0, stream_fams2_meta->min_allow_width_otg_vlines) - stream_fams2_meta->dram_clk_change_blackout_otg_vlines));
+				timing->v_active - math_max2(1.0, stream_pstate_meta->min_allow_width_otg_vlines) - stream_pstate_meta->blackout_otg_vlines));
 	} else {
 		/* for multi stream, bound to a max fill time defined by IP caps */
-		stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines =
-				(unsigned int)math_floor((double)ip_caps->max_vactive_det_fill_delay_us / stream_fams2_meta->otg_vline_time_us);
+		stream_pstate_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines =
+				(unsigned int)math_floor((double)ip_caps->max_vactive_det_fill_delay_us / stream_pstate_meta->otg_vline_time_us);
 	}
-	stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_us = stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines * stream_fams2_meta->otg_vline_time_us;
+	stream_pstate_meta->method_vactive.max_vactive_det_fill_delay_us = stream_pstate_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines * stream_pstate_meta->otg_vline_time_us;
 
-	if (stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_us > 0.0) {
-		stream_fams2_meta->method_vactive.common.allow_start_otg_vline =
-			timing->v_blank_end + stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines;
-		stream_fams2_meta->method_vactive.common.allow_end_otg_vline =
-			stream_fams2_meta->vblank_start -
-			stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
+	if (stream_pstate_meta->method_vactive.max_vactive_det_fill_delay_us > 0.0) {
+		stream_pstate_meta->method_vactive.common.allow_start_otg_vline =
+			timing->v_blank_end + stream_pstate_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines;
+		stream_pstate_meta->method_vactive.common.allow_end_otg_vline =
+			stream_pstate_meta->vblank_start -
+			stream_pstate_meta->blackout_otg_vlines;
 	} else {
-		stream_fams2_meta->method_vactive.common.allow_start_otg_vline = 0;
-		stream_fams2_meta->method_vactive.common.allow_end_otg_vline = 0;
+		stream_pstate_meta->method_vactive.common.allow_start_otg_vline = 0;
+		stream_pstate_meta->method_vactive.common.allow_end_otg_vline = 0;
 	}
-	stream_fams2_meta->method_vactive.common.period_us = stream_fams2_meta->nom_frame_time_us;
-	build_method_scheduling_params(&stream_fams2_meta->method_vactive.common, stream_fams2_meta);
+	stream_pstate_meta->method_vactive.common.period_us = stream_pstate_meta->nom_frame_time_us;
+	build_method_scheduling_params(&stream_pstate_meta->method_vactive.common, stream_pstate_meta);
 
 	/* vblank */
-	stream_fams2_meta->method_vblank.common.allow_start_otg_vline = stream_fams2_meta->vblank_start;
-	stream_fams2_meta->method_vblank.common.allow_end_otg_vline =
-			stream_fams2_meta->method_vblank.common.allow_start_otg_vline + 1;
-	stream_fams2_meta->method_vblank.common.period_us = stream_fams2_meta->nom_frame_time_us;
-	build_method_scheduling_params(&stream_fams2_meta->method_vblank.common, stream_fams2_meta);
+	stream_pstate_meta->method_vblank.common.allow_start_otg_vline = stream_pstate_meta->vblank_start;
+	stream_pstate_meta->method_vblank.common.allow_end_otg_vline =
+			stream_pstate_meta->method_vblank.common.allow_start_otg_vline + 1;
+	stream_pstate_meta->method_vblank.common.period_us = stream_pstate_meta->nom_frame_time_us;
+	build_method_scheduling_params(&stream_pstate_meta->method_vblank.common, stream_pstate_meta);
 
 	/* subvp */
-	stream_fams2_meta->method_subvp.programming_delay_otg_vlines =
-			(unsigned int)math_ceil(ip_caps->fams2.subvp_programming_delay_us / stream_fams2_meta->otg_vline_time_us);
-	stream_fams2_meta->method_subvp.df_throttle_delay_otg_vlines =
-			(unsigned int)math_ceil(ip_caps->fams2.subvp_df_throttle_delay_us / stream_fams2_meta->otg_vline_time_us);
-	stream_fams2_meta->method_subvp.prefetch_to_mall_delay_otg_vlines =
-			(unsigned int)math_ceil(ip_caps->fams2.subvp_prefetch_to_mall_delay_us / stream_fams2_meta->otg_vline_time_us);
-	stream_fams2_meta->method_subvp.phantom_vactive =
-			stream_fams2_meta->allow_to_target_delay_otg_vlines +
-			stream_fams2_meta->min_allow_width_otg_vlines +
+	stream_pstate_meta->method_subvp.programming_delay_otg_vlines =
+			(unsigned int)math_ceil(ip_caps->fams2.subvp_programming_delay_us / stream_pstate_meta->otg_vline_time_us);
+	stream_pstate_meta->method_subvp.df_throttle_delay_otg_vlines =
+			(unsigned int)math_ceil(ip_caps->fams2.subvp_df_throttle_delay_us / stream_pstate_meta->otg_vline_time_us);
+	stream_pstate_meta->method_subvp.prefetch_to_mall_delay_otg_vlines =
+			(unsigned int)math_ceil(ip_caps->fams2.subvp_prefetch_to_mall_delay_us / stream_pstate_meta->otg_vline_time_us);
+	stream_pstate_meta->method_subvp.phantom_vactive =
+			stream_pstate_meta->allow_to_target_delay_otg_vlines +
+			stream_pstate_meta->min_allow_width_otg_vlines +
 			stream_info->phantom_min_v_active;
-	stream_fams2_meta->method_subvp.phantom_vfp =
-			stream_fams2_meta->method_subvp.df_throttle_delay_otg_vlines;
+	stream_pstate_meta->method_subvp.phantom_vfp =
+			stream_pstate_meta->method_subvp.df_throttle_delay_otg_vlines;
 	/* phantom vtotal = v_bp(vstartup) + v_sync(1) + v_fp(throttle_delay) + v_active(allow_to_target + min_allow + min_vactive)*/
-	stream_fams2_meta->method_subvp.phantom_vtotal =
+	stream_pstate_meta->method_subvp.phantom_vtotal =
 			stream_info->phantom_v_startup +
-			stream_fams2_meta->method_subvp.phantom_vfp +
+			stream_pstate_meta->method_subvp.phantom_vfp +
 			1 +
-			stream_fams2_meta->method_subvp.df_throttle_delay_otg_vlines +
-			stream_fams2_meta->method_subvp.phantom_vactive;
-	stream_fams2_meta->method_subvp.common.allow_start_otg_vline =
+			stream_pstate_meta->method_subvp.df_throttle_delay_otg_vlines +
+			stream_pstate_meta->method_subvp.phantom_vactive;
+	stream_pstate_meta->method_subvp.common.allow_start_otg_vline =
 			stream_descriptor->timing.v_blank_end +
-			stream_fams2_meta->contention_delay_otg_vlines +
-			stream_fams2_meta->method_subvp.programming_delay_otg_vlines +
-			stream_fams2_meta->method_subvp.phantom_vtotal +
-			stream_fams2_meta->method_subvp.prefetch_to_mall_delay_otg_vlines +
-			stream_fams2_meta->allow_to_target_delay_otg_vlines;
-	stream_fams2_meta->method_subvp.common.allow_end_otg_vline =
-			stream_fams2_meta->vblank_start -
-			stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
-	stream_fams2_meta->method_subvp.common.period_us = stream_fams2_meta->nom_frame_time_us;
-	build_method_scheduling_params(&stream_fams2_meta->method_subvp.common, stream_fams2_meta);
+			stream_pstate_meta->contention_delay_otg_vlines +
+			stream_pstate_meta->method_subvp.programming_delay_otg_vlines +
+			stream_pstate_meta->method_subvp.phantom_vtotal +
+			stream_pstate_meta->method_subvp.prefetch_to_mall_delay_otg_vlines +
+			stream_pstate_meta->allow_to_target_delay_otg_vlines;
+	stream_pstate_meta->method_subvp.common.allow_end_otg_vline =
+			stream_pstate_meta->vblank_start -
+			stream_pstate_meta->blackout_otg_vlines;
+	stream_pstate_meta->method_subvp.common.period_us = stream_pstate_meta->nom_frame_time_us;
+	build_method_scheduling_params(&stream_pstate_meta->method_subvp.common, stream_pstate_meta);
 
 	/* drr */
-	stream_fams2_meta->method_drr.programming_delay_otg_vlines =
-			(unsigned int)math_ceil(ip_caps->fams2.drr_programming_delay_us / stream_fams2_meta->otg_vline_time_us);
-	stream_fams2_meta->method_drr.common.allow_start_otg_vline =
-			stream_fams2_meta->vblank_start +
-			stream_fams2_meta->allow_to_target_delay_otg_vlines;
-	stream_fams2_meta->method_drr.common.period_us = stream_fams2_meta->nom_frame_time_us;
+	stream_pstate_meta->method_drr.programming_delay_otg_vlines =
+			(unsigned int)math_ceil(ip_caps->fams2.drr_programming_delay_us / stream_pstate_meta->otg_vline_time_us);
+	stream_pstate_meta->method_drr.common.allow_start_otg_vline =
+			stream_pstate_meta->vblank_start +
+			stream_pstate_meta->allow_to_target_delay_otg_vlines;
+	stream_pstate_meta->method_drr.common.period_us = stream_pstate_meta->nom_frame_time_us;
 	if (display_config->display_config.num_streams <= 1) {
 		/* only need to stretch vblank for blackout time */
-		stream_fams2_meta->method_drr.stretched_vtotal =
-				stream_fams2_meta->nom_vtotal +
-				stream_fams2_meta->allow_to_target_delay_otg_vlines +
-				stream_fams2_meta->min_allow_width_otg_vlines +
-				stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
+		stream_pstate_meta->method_drr.stretched_vtotal =
+				stream_pstate_meta->nom_vtotal +
+				stream_pstate_meta->allow_to_target_delay_otg_vlines +
+				stream_pstate_meta->min_allow_width_otg_vlines +
+				stream_pstate_meta->blackout_otg_vlines;
 	} else {
 		/* multi display needs to always be schedulable */
-		stream_fams2_meta->method_drr.stretched_vtotal =
-				stream_fams2_meta->nom_vtotal * 2 +
-				stream_fams2_meta->allow_to_target_delay_otg_vlines +
-				stream_fams2_meta->min_allow_width_otg_vlines +
-				stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
-	}
-	stream_fams2_meta->method_drr.common.allow_end_otg_vline =
-			stream_fams2_meta->method_drr.stretched_vtotal -
-			stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
-	build_method_scheduling_params(&stream_fams2_meta->method_drr.common, stream_fams2_meta);
+		stream_pstate_meta->method_drr.stretched_vtotal =
+				stream_pstate_meta->nom_vtotal * 2 +
+				stream_pstate_meta->allow_to_target_delay_otg_vlines +
+				stream_pstate_meta->min_allow_width_otg_vlines +
+				stream_pstate_meta->blackout_otg_vlines;
+	}
+	stream_pstate_meta->method_drr.common.allow_end_otg_vline =
+			stream_pstate_meta->method_drr.stretched_vtotal -
+			stream_pstate_meta->blackout_otg_vlines;
+	build_method_scheduling_params(&stream_pstate_meta->method_drr.common, stream_pstate_meta);
 }
 
 static void build_subvp_meta_per_stream(struct dml2_pmo_instance *pmo,
@@ -1820,14 +1843,14 @@ static void build_subvp_meta_per_stream(struct dml2_pmo_instance *pmo,
 	int stream_index)
 {
 	struct dml2_implicit_svp_meta *stream_svp_meta = &pmo->scratch.pmo_dcn4.stream_svp_meta[stream_index];
-	struct dml2_fams2_meta *stream_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_index];
+	struct dml2_pstate_meta *stream_pstate_meta = &pmo->scratch.pmo_dcn4.stream_pstate_meta[stream_index];
 
 	stream_svp_meta->valid = true;
 
 	/* PMO FAMS2 precaulcates these values */
-	stream_svp_meta->v_active = stream_fams2_meta->method_subvp.phantom_vactive;
-	stream_svp_meta->v_front_porch = stream_fams2_meta->method_subvp.phantom_vfp;
-	stream_svp_meta->v_total = stream_fams2_meta->method_subvp.phantom_vtotal;
+	stream_svp_meta->v_active = stream_pstate_meta->method_subvp.phantom_vactive;
+	stream_svp_meta->v_front_porch = stream_pstate_meta->method_subvp.phantom_vfp;
+	stream_svp_meta->v_total = stream_pstate_meta->method_subvp.phantom_vtotal;
 }
 
 bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in_out *in_out)
@@ -1879,7 +1902,7 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 			set_bit_in_bitfield(&s->pmo_dcn4.stream_vactive_capability_mask, stream_index);
 
 		/* FAMS2 meta */
-		build_fams2_meta_per_stream(pmo, display_config, stream_index);
+		build_pstate_meta_per_stream(pmo, display_config, stream_index);
 
 		/* SVP meta */
 		build_subvp_meta_per_stream(pmo, display_config, stream_index);
@@ -2077,7 +2100,7 @@ static void setup_planes_for_vactive_by_mask(struct display_configuation_with_me
 
 			if (!pmo->options->disable_vactive_det_fill_bw_pad) {
 				display_config->display_config.plane_descriptors[plane_index].overrides.max_vactive_det_fill_delay_us =
-					(unsigned int)math_floor(pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_index].method_vactive.max_vactive_det_fill_delay_us);
+					(unsigned int)math_floor(pmo->scratch.pmo_dcn4.stream_pstate_meta[stream_index].method_vactive.max_vactive_det_fill_delay_us);
 			}
 		}
 	}
@@ -2098,7 +2121,7 @@ static void setup_planes_for_vactive_drr_by_mask(struct display_configuation_wit
 
 			if (!pmo->options->disable_vactive_det_fill_bw_pad) {
 				display_config->display_config.plane_descriptors[plane_index].overrides.max_vactive_det_fill_delay_us =
-					(unsigned int)math_floor(pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_index].method_vactive.max_vactive_det_fill_delay_us);
+					(unsigned int)math_floor(pmo->scratch.pmo_dcn4.stream_pstate_meta[stream_index].method_vactive.max_vactive_det_fill_delay_us);
 			}
 		}
 	}
@@ -2144,9 +2167,9 @@ static bool setup_display_config(struct display_configuation_with_meta *display_
 	/* copy FAMS2 meta */
 	if (success) {
 		display_config->stage3.fams2_required = fams2_required;
-		memcpy(&display_config->stage3.stream_fams2_meta,
-			&scratch->pmo_dcn4.stream_fams2_meta,
-			sizeof(struct dml2_fams2_meta) * DML2_MAX_PLANES);
+		memcpy(&display_config->stage3.stream_pstate_meta,
+			&scratch->pmo_dcn4.stream_pstate_meta,
+			sizeof(struct dml2_pstate_meta) * DML2_MAX_PLANES);
 	}
 
 	return success;
@@ -2188,12 +2211,12 @@ bool pmo_dcn4_fams2_test_for_pstate_support(struct dml2_pmo_test_for_pstate_supp
 		return false;
 
 	for (stream_index = 0; stream_index < in_out->base_display_config->display_config.num_streams; stream_index++) {
-		struct dml2_fams2_meta *stream_fams2_meta = &s->pmo_dcn4.stream_fams2_meta[stream_index];
+		struct dml2_pstate_meta *stream_pstate_meta = &s->pmo_dcn4.stream_pstate_meta[stream_index];
 
 		if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_vactive ||
 				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_vactive_drr) {
 			if (get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < (MIN_VACTIVE_MARGIN_PCT * in_out->instance->soc_bb->power_management_parameters.dram_clk_change_blackout_us) ||
-					get_vactive_det_fill_latency_delay_us(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) > stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_us) {
+					get_vactive_det_fill_latency_delay_us(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) > stream_pstate_meta->method_vactive.max_vactive_det_fill_delay_us) {
 				p_state_supported = false;
 				break;
 			}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
index d52aa82283b3..9f562f0c4797 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
@@ -255,7 +255,7 @@ struct dml2_implicit_svp_meta {
 	unsigned long v_front_porch;
 };
 
-struct dml2_fams2_per_method_common_meta {
+struct dml2_pstate_per_method_common_meta {
 	/* generic params */
 	unsigned int allow_start_otg_vline;
 	unsigned int allow_end_otg_vline;
@@ -265,7 +265,7 @@ struct dml2_fams2_per_method_common_meta {
 	double period_us;
 };
 
-struct dml2_fams2_meta {
+struct dml2_pstate_meta {
 	bool valid;
 	double otg_vline_time_us;
 	unsigned int scheduling_delay_otg_vlines;
@@ -280,14 +280,14 @@ struct dml2_fams2_meta {
 	unsigned int max_vtotal;
 	double min_refresh_rate_hz;
 	double max_frame_time_us;
-	unsigned int dram_clk_change_blackout_otg_vlines;
+	unsigned int blackout_otg_vlines;
 	struct {
 		double max_vactive_det_fill_delay_us;
 		unsigned int max_vactive_det_fill_delay_otg_vlines;
-		struct dml2_fams2_per_method_common_meta common;
+		struct dml2_pstate_per_method_common_meta common;
 	} method_vactive;
 	struct {
-		struct dml2_fams2_per_method_common_meta common;
+		struct dml2_pstate_per_method_common_meta common;
 	} method_vblank;
 	struct {
 		unsigned int programming_delay_otg_vlines;
@@ -296,15 +296,24 @@ struct dml2_fams2_meta {
 		unsigned long phantom_vactive;
 		unsigned long phantom_vfp;
 		unsigned long phantom_vtotal;
-		struct dml2_fams2_per_method_common_meta common;
+		struct dml2_pstate_per_method_common_meta common;
 	} method_subvp;
 	struct {
 		unsigned int programming_delay_otg_vlines;
 		unsigned int stretched_vtotal;
-		struct dml2_fams2_per_method_common_meta common;
+		struct dml2_pstate_per_method_common_meta common;
 	} method_drr;
 };
 
+/* mask of synchronized timings by stream index */
+struct dml2_pmo_synchronized_timing_groups {
+	unsigned int num_timing_groups;
+	unsigned int synchronized_timing_group_masks[DML2_MAX_PLANES];
+	bool group_is_drr_enabled[DML2_MAX_PLANES];
+	bool group_is_drr_active[DML2_MAX_PLANES];
+	double group_line_time_us[DML2_MAX_PLANES];
+};
+
 struct dml2_optimization_stage3_state {
 	bool performed;
 	bool success;
@@ -319,7 +328,7 @@ struct dml2_optimization_stage3_state {
 
 	// Meta-data for FAMS2
 	bool fams2_required;
-	struct dml2_fams2_meta stream_fams2_meta[DML2_MAX_PLANES];
+	struct dml2_pstate_meta stream_pstate_meta[DML2_MAX_PLANES];
 
 	int min_clk_index_for_latency;
 };
@@ -472,6 +481,7 @@ struct dml2_core_scratch {
 };
 
 struct dml2_core_instance {
+	enum dml2_project_id project_id;
 	struct dml2_mcg_min_clock_table *minimum_clock_table;
 	struct dml2_core_internal_state_inputs inputs;
 	struct dml2_core_internal_state_intermediates intermediates;
@@ -619,6 +629,12 @@ struct dml2_pmo_optimize_for_stutter_in_out {
 #define PMO_DCN4_MAX_NUM_VARIANTS 2
 #define PMO_DCN4_MAX_BASE_STRATEGIES 10
 
+struct dml2_scheduling_check_locals {
+	struct dml2_pstate_per_method_common_meta group_common_pstate_meta[DML2_MAX_PLANES];
+	unsigned int sorted_group_gtl_disallow_index[DML2_MAX_PLANES];
+	unsigned int sorted_group_gtl_period_index[DML2_MAX_PLANES];
+};
+
 struct dml2_pmo_scratch {
 	union {
 		struct {
@@ -648,7 +664,7 @@ struct dml2_pmo_scratch {
 			// Stores all the implicit SVP meta information indexed by stream index of the display
 			// configuration under inspection, built at optimization stage init
 			struct dml2_implicit_svp_meta stream_svp_meta[DML2_MAX_PLANES];
-			struct dml2_fams2_meta stream_fams2_meta[DML2_MAX_PLANES];
+			struct dml2_pstate_meta stream_pstate_meta[DML2_MAX_PLANES];
 
 			unsigned int optimal_vblank_reserved_time_for_stutter_us[DML2_PMO_STUTTER_CANDIDATE_LIST_SIZE];
 			unsigned int num_stutter_candidates;
@@ -663,7 +679,7 @@ struct dml2_pmo_scratch {
 			double group_line_time_us[DML2_MAX_PLANES];
 
 			/* scheduling check locals */
-			struct dml2_fams2_per_method_common_meta group_common_fams2_meta[DML2_MAX_PLANES];
+			struct dml2_pstate_per_method_common_meta group_common_pstate_meta[DML2_MAX_PLANES];
 			unsigned int sorted_group_gtl_disallow_index[DML2_MAX_PLANES];
 			unsigned int sorted_group_gtl_period_index[DML2_MAX_PLANES];
 			double group_phase_offset[DML2_MAX_PLANES];
-- 
2.34.1


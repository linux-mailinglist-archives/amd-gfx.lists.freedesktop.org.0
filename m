Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92881462DC1
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Nov 2021 08:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28CD6EF33;
	Tue, 30 Nov 2021 07:43:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2069.outbound.protection.outlook.com [40.107.212.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3321B6E8DF
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Nov 2021 07:43:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9v4bCSJMQqbF/yami2cFG4Z3qPERdqRRnOCQ6mwR5ojU/Cy1Z7TP6r9agjAYLrqIPLUYhshxCaX+kmc/S5Nc2yAK4a3JHsRiXAuVN/jIlGIuGqAK4LP4VjjFmSWXKdORnFX/QIOjKQYTtjnHbTJiX4prooHV4UFZWzMsSHrW7emi7kaxtvtzvpAVOE3sfl96JBFZh5QRqNlbZ10JX2D+06PJX0//OIi/G6yB1PXr97pwzqHNEKv4NuFCE+hvv0qW9u40imVknYoGYuRwd/L22iT9ICnFkQiNbVYeoBsJzSzsWB1X+spRAL693fRHI4FuZIkJUYS4TYQvzBiM3Bj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC7XP5FgxzOMC5y7oLVkO8jXZvcxHxPBu6NcFtGjmtM=;
 b=F/yIUvY1l5pCxBTDFR0vlNBKmcHOb6rM/pGuq8W60cFz8zxNPM5CSOr23n1APjEcQwQJAZGOUdFZTHiSP9L4hmI+BKlXH7e7RUYgGUmwC4aCXzXuS8SoAwD7zdDR0s7u74r3EgLcsMrecYKU3aNNcs1221EjxPweBjE8tSKKLlgepKXzVoVTVAnAuFI8KMv+3OpWbhzwcMLE4epc7Bko0whUlPtUozmozLF02BP8fTgN9ZCb/pUdhvzTQYZ5Lo7b5USj5osOo6SZ0eG5nndYRU+CpugQNXvGaI9i7t1vRMbHGVGZQdAsjFBLxjf3oeJq9OaefWGEQx5uYUwWE98kJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pC7XP5FgxzOMC5y7oLVkO8jXZvcxHxPBu6NcFtGjmtM=;
 b=bdCFmZG+12YVkEvbICVVPlScjtRr28zfgLazTLrrQcNtOjm432Mcvm2D7NQXQENJpr1mvbBPQwEDOdI1fnWr77qvi32Opzy6SIjvijdUcm20+9LgyTmb0I5JhFIv0ByMaGEw2vhJ4pSEkEJAij+nfVfrvmHXlNLW/pcD3XAlws4=
Received: from BN6PR19CA0108.namprd19.prod.outlook.com (2603:10b6:404:a0::22)
 by MN2PR12MB3213.namprd12.prod.outlook.com (2603:10b6:208:af::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 07:43:34 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::18) by BN6PR19CA0108.outlook.office365.com
 (2603:10b6:404:a0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 07:43:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 07:43:30 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 30 Nov
 2021 01:43:27 -0600
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2 03/17] drm/amd/pm: do not expose power implementation
 details to display
Date: Tue, 30 Nov 2021 15:42:45 +0800
Message-ID: <20211130074259.1271965-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211130074259.1271965-1-evan.quan@amd.com>
References: <20211130074259.1271965-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 245131a9-0d17-45ef-6286-08d9b3d51a5f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3213:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3213CAF246EDB1F0A4B867BAE4679@MN2PR12MB3213.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /+8QbNlJIhOHNzUbVXob0kCzzkdpVmnRskEIeCHoH8pQQNYWzIsj0mcnLe3xlk+a9GOrk1FcpA0V9OfmKtMx9+uW9rRjaxe9IObzbdrI6I3ghga+EpbZJC/mpMk8rhTlUL17C/iuHypWOXZko5oOn9lzcEDsjvSZXGoAo0qytIXQdN/x6PaIaW8MdON5UnTgq+AEShP0TKSOP3NzrL+rOPlRykXAw3ZV48GpahpzVamEt2+yhX7pJzZzgyUN+/5g/0VbCdAniJVQ8hq1Y6zbwbMjCUvnyBU5gK0fbIFokzmPdKwlXTr1c08j3VH4Xzhc7t6tETpxjkpy+tgSeQ3z4/ht5EAKJQsEWWe8/9ZR/AKPK1Q+vBOHQKsNNv1Sc1lTt0asPhyUvFYH2rKVCWW2Evvm9XtIobt4epKDyvRw2WouX+tSehKRuVbMxbQcZ3VSq9BVfT5mANrLkrRCFejzolMaqMnogQxLJCu1NSqcl5I7E4bpm4xQ4ln2iOmXi7EyA1QW7U92fLk6O+MxNpOIEbGXVEMi0h08ggn9ic6hWeFjhEzm+dlNEYMRdTGYCh7Uv6DseJvYA3EabVHLQ9ECKnAzafVFN54h3u2uwIEQtWKgiIclyncVY2H8WicGlNNDjfoNHi4t/dnF12huhtH5asvO+u6WIbAgo/N8U82Jyh+xGIFefFEPfW+TP9jVnzBduvO8etLXjz7HqmYWoV2BSd5Xj4rGvB9HRwk4Ik+iieZV08/ESB2wDdYicRUy0XzQx9th7DHTWI4KB4yDDIP4nHjwFmeDBtSaz5Wam7AItr8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(186003)(8936002)(6916009)(70206006)(82310400004)(16526019)(47076005)(336012)(83380400001)(40460700001)(54906003)(316002)(2906002)(1076003)(508600001)(2616005)(36756003)(30864003)(86362001)(36860700001)(4326008)(356005)(8676002)(6666004)(426003)(5660300002)(70586007)(44832011)(26005)(7696005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 07:43:30.1060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 245131a9-0d17-45ef-6286-08d9b3d51a5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3213
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
Cc: Alexander.Deucher@amd.com, lijo.lazar@amd.com, Kenneth.Feng@amd.com,
 christian.koenig@amd.com, Evan Quan <evan.quan@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Display is another client of our power APIs. It's not proper to spike
into power implementation details there.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Change-Id: Ic897131e16473ed29d3d7586d822a55c64e6574a
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c  | 246 +++++++-----------
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c           | 218 ++++++++++++++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  38 +++
 4 files changed, 344 insertions(+), 164 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 53f7fdf956eb..92480cc57623 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2139,12 +2139,8 @@ static void s3_handle_mst(struct drm_device *dev, bool suspend)
 
 static int amdgpu_dm_smu_write_watermarks_table(struct amdgpu_device *adev)
 {
-	struct smu_context *smu = &adev->smu;
 	int ret = 0;
 
-	if (!is_support_sw_smu(adev))
-		return 0;
-
 	/* This interface is for dGPU Navi1x.Linux dc-pplib interface depends
 	 * on window driver dc implementation.
 	 * For Navi1x, clock settings of dcn watermarks are fixed. the settings
@@ -2183,7 +2179,7 @@ static int amdgpu_dm_smu_write_watermarks_table(struct amdgpu_device *adev)
 		return 0;
 	}
 
-	ret = smu_write_watermarks_table(smu);
+	ret = amdgpu_dpm_write_watermarks_table(adev);
 	if (ret) {
 		DRM_ERROR("Failed to update WMTABLE!\n");
 		return ret;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
index eba270121698..46550811da00 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
@@ -99,10 +99,7 @@ bool dm_pp_apply_display_requirements(
 			adev->pm.pm_display_cfg.displays[i].controller_id = dc_cfg->pipe_idx + 1;
 		}
 
-		if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs->display_configuration_change)
-			adev->powerplay.pp_funcs->display_configuration_change(
-				adev->powerplay.pp_handle,
-				&adev->pm.pm_display_cfg);
+		amdgpu_dpm_display_configuration_change(adev, &adev->pm.pm_display_cfg);
 
 		amdgpu_pm_compute_clocks(adev);
 	}
@@ -298,31 +295,25 @@ bool dm_pp_get_clock_levels_by_type(
 		struct dm_pp_clock_levels *dc_clks)
 {
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
 	struct amd_pp_clocks pp_clks = { 0 };
 	struct amd_pp_simple_clock_info validation_clks = { 0 };
 	uint32_t i;
 
-	if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs->get_clock_by_type) {
-		if (adev->powerplay.pp_funcs->get_clock_by_type(pp_handle,
-			dc_to_pp_clock_type(clk_type), &pp_clks)) {
-			/* Error in pplib. Provide default values. */
-			get_default_clock_levels(clk_type, dc_clks);
-			return true;
-		}
+	if (amdgpu_dpm_get_clock_by_type(adev,
+		dc_to_pp_clock_type(clk_type), &pp_clks)) {
+		/* Error in pplib. Provide default values. */
+		get_default_clock_levels(clk_type, dc_clks);
+		return true;
 	}
 
 	pp_to_dc_clock_levels(&pp_clks, dc_clks, clk_type);
 
-	if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs->get_display_mode_validation_clocks) {
-		if (adev->powerplay.pp_funcs->get_display_mode_validation_clocks(
-						pp_handle, &validation_clks)) {
-			/* Error in pplib. Provide default values. */
-			DRM_INFO("DM_PPLIB: Warning: using default validation clocks!\n");
-			validation_clks.engine_max_clock = 72000;
-			validation_clks.memory_max_clock = 80000;
-			validation_clks.level = 0;
-		}
+	if (amdgpu_dpm_get_display_mode_validation_clks(adev, &validation_clks)) {
+		/* Error in pplib. Provide default values. */
+		DRM_INFO("DM_PPLIB: Warning: using default validation clocks!\n");
+		validation_clks.engine_max_clock = 72000;
+		validation_clks.memory_max_clock = 80000;
+		validation_clks.level = 0;
 	}
 
 	DRM_INFO("DM_PPLIB: Validation clocks:\n");
@@ -370,18 +361,14 @@ bool dm_pp_get_clock_levels_by_type_with_latency(
 	struct dm_pp_clock_levels_with_latency *clk_level_info)
 {
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
 	struct pp_clock_levels_with_latency pp_clks = { 0 };
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 	int ret;
 
-	if (pp_funcs && pp_funcs->get_clock_by_type_with_latency) {
-		ret = pp_funcs->get_clock_by_type_with_latency(pp_handle,
-						dc_to_pp_clock_type(clk_type),
-						&pp_clks);
-		if (ret)
-			return false;
-	}
+	ret = amdgpu_dpm_get_clock_by_type_with_latency(adev,
+					dc_to_pp_clock_type(clk_type),
+					&pp_clks);
+	if (ret)
+		return false;
 
 	pp_to_dc_clock_levels_with_latency(&pp_clks, clk_level_info, clk_type);
 
@@ -394,18 +381,14 @@ bool dm_pp_get_clock_levels_by_type_with_voltage(
 	struct dm_pp_clock_levels_with_voltage *clk_level_info)
 {
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
 	struct pp_clock_levels_with_voltage pp_clk_info = {0};
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 	int ret;
 
-	if (pp_funcs && pp_funcs->get_clock_by_type_with_voltage) {
-		ret = pp_funcs->get_clock_by_type_with_voltage(pp_handle,
-						dc_to_pp_clock_type(clk_type),
-						&pp_clk_info);
-		if (ret)
-			return false;
-	}
+	ret = amdgpu_dpm_get_clock_by_type_with_voltage(adev,
+					dc_to_pp_clock_type(clk_type),
+					&pp_clk_info);
+	if (ret)
+		return false;
 
 	pp_to_dc_clock_levels_with_voltage(&pp_clk_info, clk_level_info, clk_type);
 
@@ -417,19 +400,16 @@ bool dm_pp_notify_wm_clock_changes(
 	struct dm_pp_wm_sets_with_clock_ranges *wm_with_clock_ranges)
 {
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 
 	/*
 	 * Limit this watermark setting for Polaris for now
 	 * TODO: expand this to other ASICs
 	 */
-	if ((adev->asic_type >= CHIP_POLARIS10) && (adev->asic_type <= CHIP_VEGAM)
-	     && pp_funcs && pp_funcs->set_watermarks_for_clocks_ranges) {
-		if (!pp_funcs->set_watermarks_for_clocks_ranges(pp_handle,
+	if ((adev->asic_type >= CHIP_POLARIS10) &&
+	     (adev->asic_type <= CHIP_VEGAM) &&
+	     !amdgpu_dpm_set_watermarks_for_clocks_ranges(adev,
 						(void *)wm_with_clock_ranges))
 			return true;
-	}
 
 	return false;
 }
@@ -456,12 +436,10 @@ bool dm_pp_apply_clock_for_voltage_request(
 	if (!pp_clock_request.clock_type)
 		return false;
 
-	if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs->display_clock_voltage_request)
-		ret = adev->powerplay.pp_funcs->display_clock_voltage_request(
-			adev->powerplay.pp_handle,
-			&pp_clock_request);
-	if (ret)
+	ret = amdgpu_dpm_display_clock_voltage_request(adev, &pp_clock_request);
+	if (ret && (ret != -EOPNOTSUPP))
 		return false;
+
 	return true;
 }
 
@@ -471,15 +449,8 @@ bool dm_pp_get_static_clocks(
 {
 	struct amdgpu_device *adev = ctx->driver_context;
 	struct amd_pp_clock_info pp_clk_info = {0};
-	int ret = 0;
 
-	if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs->get_current_clocks)
-		ret = adev->powerplay.pp_funcs->get_current_clocks(
-			adev->powerplay.pp_handle,
-			&pp_clk_info);
-	else
-		return false;
-	if (ret)
+	if (amdgpu_dpm_get_current_clocks(adev, &pp_clk_info))
 		return false;
 
 	static_clk_info->max_clocks_state = pp_to_dc_powerlevel_state(pp_clk_info.max_clocks_state);
@@ -494,8 +465,6 @@ static void pp_rv_set_wm_ranges(struct pp_smu *pp,
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 	struct dm_pp_wm_sets_with_clock_ranges_soc15 wm_with_clock_ranges;
 	struct dm_pp_clock_range_for_dmif_wm_set_soc15 *wm_dce_clocks = wm_with_clock_ranges.wm_dmif_clocks_ranges;
 	struct dm_pp_clock_range_for_mcif_wm_set_soc15 *wm_soc_clocks = wm_with_clock_ranges.wm_mcif_clocks_ranges;
@@ -536,72 +505,48 @@ static void pp_rv_set_wm_ranges(struct pp_smu *pp,
 				ranges->writer_wm_sets[i].min_drain_clk_mhz * 1000;
 	}
 
-	if (pp_funcs && pp_funcs->set_watermarks_for_clocks_ranges)
-		pp_funcs->set_watermarks_for_clocks_ranges(pp_handle,
-							   &wm_with_clock_ranges);
+	amdgpu_dpm_set_watermarks_for_clocks_ranges(adev,
+						    &wm_with_clock_ranges);
 }
 
 static void pp_rv_set_pme_wa_enable(struct pp_smu *pp)
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 
-	if (pp_funcs && pp_funcs->notify_smu_enable_pwe)
-		pp_funcs->notify_smu_enable_pwe(pp_handle);
+	amdgpu_dpm_notify_smu_enable_pwe(adev);
 }
 
 static void pp_rv_set_active_display_count(struct pp_smu *pp, int count)
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 
-	if (!pp_funcs || !pp_funcs->set_active_display_count)
-		return;
-
-	pp_funcs->set_active_display_count(pp_handle, count);
+	amdgpu_dpm_set_active_display_count(adev, count);
 }
 
 static void pp_rv_set_min_deep_sleep_dcfclk(struct pp_smu *pp, int clock)
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
-
-	if (!pp_funcs || !pp_funcs->set_min_deep_sleep_dcefclk)
-		return;
 
-	pp_funcs->set_min_deep_sleep_dcefclk(pp_handle, clock);
+	amdgpu_dpm_set_min_deep_sleep_dcefclk(adev, clock);
 }
 
 static void pp_rv_set_hard_min_dcefclk_by_freq(struct pp_smu *pp, int clock)
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 
-	if (!pp_funcs || !pp_funcs->set_hard_min_dcefclk_by_freq)
-		return;
-
-	pp_funcs->set_hard_min_dcefclk_by_freq(pp_handle, clock);
+	amdgpu_dpm_set_hard_min_dcefclk_by_freq(adev, clock);
 }
 
 static void pp_rv_set_hard_min_fclk_by_freq(struct pp_smu *pp, int mhz)
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
-
-	if (!pp_funcs || !pp_funcs->set_hard_min_fclk_by_freq)
-		return;
 
-	pp_funcs->set_hard_min_fclk_by_freq(pp_handle, mhz);
+	amdgpu_dpm_set_hard_min_fclk_by_freq(adev, mhz);
 }
 
 static enum pp_smu_status pp_nv_set_wm_ranges(struct pp_smu *pp,
@@ -609,11 +554,8 @@ static enum pp_smu_status pp_nv_set_wm_ranges(struct pp_smu *pp,
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 
-	if (pp_funcs && pp_funcs->set_watermarks_for_clocks_ranges)
-		pp_funcs->set_watermarks_for_clocks_ranges(pp_handle, ranges);
+	amdgpu_dpm_set_watermarks_for_clocks_ranges(adev, ranges);
 
 	return PP_SMU_RESULT_OK;
 }
@@ -622,14 +564,13 @@ static enum pp_smu_status pp_nv_set_display_count(struct pp_smu *pp, int count)
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+	int ret = 0;
 
-	if (!pp_funcs || !pp_funcs->set_active_display_count)
+	ret = amdgpu_dpm_set_active_display_count(adev, count);
+	if (ret == -EOPNOTSUPP)
 		return PP_SMU_RESULT_UNSUPPORTED;
-
-	/* 0: successful or smu.ppt_funcs->set_display_count = NULL;  1: fail */
-	if (pp_funcs->set_active_display_count(pp_handle, count))
+	else if (ret)
+		/* 0: successful or smu.ppt_funcs->set_display_count = NULL;  1: fail */
 		return PP_SMU_RESULT_FAIL;
 
 	return PP_SMU_RESULT_OK;
@@ -640,14 +581,13 @@ pp_nv_set_min_deep_sleep_dcfclk(struct pp_smu *pp, int mhz)
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
-
-	if (!pp_funcs || !pp_funcs->set_min_deep_sleep_dcefclk)
-		return PP_SMU_RESULT_UNSUPPORTED;
+	int ret = 0;
 
 	/* 0: successful or smu.ppt_funcs->set_deep_sleep_dcefclk = NULL;1: fail */
-	if (pp_funcs->set_min_deep_sleep_dcefclk(pp_handle, mhz))
+	ret = amdgpu_dpm_set_min_deep_sleep_dcefclk(adev, mhz);
+	if (ret == -EOPNOTSUPP)
+		return PP_SMU_RESULT_UNSUPPORTED;
+	else if (ret)
 		return PP_SMU_RESULT_FAIL;
 
 	return PP_SMU_RESULT_OK;
@@ -658,12 +598,8 @@ static enum pp_smu_status pp_nv_set_hard_min_dcefclk_by_freq(
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 	struct pp_display_clock_request clock_req;
-
-	if (!pp_funcs || !pp_funcs->display_clock_voltage_request)
-		return PP_SMU_RESULT_UNSUPPORTED;
+	int ret = 0;
 
 	clock_req.clock_type = amd_pp_dcef_clock;
 	clock_req.clock_freq_in_khz = mhz * 1000;
@@ -671,7 +607,10 @@ static enum pp_smu_status pp_nv_set_hard_min_dcefclk_by_freq(
 	/* 0: successful or smu.ppt_funcs->display_clock_voltage_request = NULL
 	 * 1: fail
 	 */
-	if (pp_funcs->display_clock_voltage_request(pp_handle, &clock_req))
+	ret = amdgpu_dpm_display_clock_voltage_request(adev, &clock_req);
+	if (ret == -EOPNOTSUPP)
+		return PP_SMU_RESULT_UNSUPPORTED;
+	else if (ret)
 		return PP_SMU_RESULT_FAIL;
 
 	return PP_SMU_RESULT_OK;
@@ -682,12 +621,8 @@ pp_nv_set_hard_min_uclk_by_freq(struct pp_smu *pp, int mhz)
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 	struct pp_display_clock_request clock_req;
-
-	if (!pp_funcs || !pp_funcs->display_clock_voltage_request)
-		return PP_SMU_RESULT_UNSUPPORTED;
+	int ret = 0;
 
 	clock_req.clock_type = amd_pp_mem_clock;
 	clock_req.clock_freq_in_khz = mhz * 1000;
@@ -695,7 +630,10 @@ pp_nv_set_hard_min_uclk_by_freq(struct pp_smu *pp, int mhz)
 	/* 0: successful or smu.ppt_funcs->display_clock_voltage_request = NULL
 	 * 1: fail
 	 */
-	if (pp_funcs->display_clock_voltage_request(pp_handle, &clock_req))
+	ret = amdgpu_dpm_display_clock_voltage_request(adev, &clock_req);
+	if (ret == -EOPNOTSUPP)
+		return PP_SMU_RESULT_UNSUPPORTED;
+	else if (ret)
 		return PP_SMU_RESULT_FAIL;
 
 	return PP_SMU_RESULT_OK;
@@ -706,14 +644,10 @@ static enum pp_smu_status pp_nv_set_pstate_handshake_support(
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 
-	if (pp_funcs && pp_funcs->display_disable_memory_clock_switch) {
-		if (pp_funcs->display_disable_memory_clock_switch(pp_handle,
-								  !pstate_handshake_supported))
-			return PP_SMU_RESULT_FAIL;
-	}
+	if (amdgpu_dpm_display_disable_memory_clock_switch(adev,
+							  !pstate_handshake_supported))
+		return PP_SMU_RESULT_FAIL;
 
 	return PP_SMU_RESULT_OK;
 }
@@ -723,12 +657,8 @@ static enum pp_smu_status pp_nv_set_voltage_by_freq(struct pp_smu *pp,
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 	struct pp_display_clock_request clock_req;
-
-	if (!pp_funcs || !pp_funcs->display_clock_voltage_request)
-		return PP_SMU_RESULT_UNSUPPORTED;
+	int ret = 0;
 
 	switch (clock_id) {
 	case PP_SMU_NV_DISPCLK:
@@ -748,7 +678,10 @@ static enum pp_smu_status pp_nv_set_voltage_by_freq(struct pp_smu *pp,
 	/* 0: successful or smu.ppt_funcs->display_clock_voltage_request = NULL
 	 * 1: fail
 	 */
-	if (pp_funcs->display_clock_voltage_request(pp_handle, &clock_req))
+	ret = amdgpu_dpm_display_clock_voltage_request(adev, &clock_req);
+	if (ret == -EOPNOTSUPP)
+		return PP_SMU_RESULT_UNSUPPORTED;
+	else if (ret)
 		return PP_SMU_RESULT_FAIL;
 
 	return PP_SMU_RESULT_OK;
@@ -759,16 +692,16 @@ static enum pp_smu_status pp_nv_get_maximum_sustainable_clocks(
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+	int ret = 0;
 
-	if (!pp_funcs || !pp_funcs->get_max_sustainable_clocks_by_dc)
+	ret = amdgpu_dpm_get_max_sustainable_clocks_by_dc(adev,
+							  max_clocks);
+	if (ret == -EOPNOTSUPP)
 		return PP_SMU_RESULT_UNSUPPORTED;
+	else if (ret)
+		return PP_SMU_RESULT_FAIL;
 
-	if (!pp_funcs->get_max_sustainable_clocks_by_dc(pp_handle, max_clocks))
-		return PP_SMU_RESULT_OK;
-
-	return PP_SMU_RESULT_FAIL;
+	return PP_SMU_RESULT_OK;
 }
 
 static enum pp_smu_status pp_nv_get_uclk_dpm_states(struct pp_smu *pp,
@@ -776,18 +709,17 @@ static enum pp_smu_status pp_nv_get_uclk_dpm_states(struct pp_smu *pp,
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+	int ret = 0;
 
-	if (!pp_funcs || !pp_funcs->get_uclk_dpm_states)
+	ret = amdgpu_dpm_get_uclk_dpm_states(adev,
+					     clock_values_in_khz,
+					    num_states);
+	if (ret == -EOPNOTSUPP)
 		return PP_SMU_RESULT_UNSUPPORTED;
+	else if (ret)
+		return PP_SMU_RESULT_FAIL;
 
-	if (!pp_funcs->get_uclk_dpm_states(pp_handle,
-					   clock_values_in_khz,
-					   num_states))
-		return PP_SMU_RESULT_OK;
-
-	return PP_SMU_RESULT_FAIL;
+	return PP_SMU_RESULT_OK;
 }
 
 static enum pp_smu_status pp_rn_get_dpm_clock_table(
@@ -795,16 +727,15 @@ static enum pp_smu_status pp_rn_get_dpm_clock_table(
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+	int ret = 0;
 
-	if (!pp_funcs || !pp_funcs->get_dpm_clock_table)
+	ret = amdgpu_dpm_get_dpm_clock_table(adev, clock_table);
+	if (ret == -EOPNOTSUPP)
 		return PP_SMU_RESULT_UNSUPPORTED;
+	else if (ret)
+		return PP_SMU_RESULT_FAIL;
 
-	if (!pp_funcs->get_dpm_clock_table(pp_handle, clock_table))
-		return PP_SMU_RESULT_OK;
-
-	return PP_SMU_RESULT_FAIL;
+	return PP_SMU_RESULT_OK;
 }
 
 static enum pp_smu_status pp_rn_set_wm_ranges(struct pp_smu *pp,
@@ -812,11 +743,8 @@ static enum pp_smu_status pp_rn_set_wm_ranges(struct pp_smu *pp,
 {
 	const struct dc_context *ctx = pp->dm;
 	struct amdgpu_device *adev = ctx->driver_context;
-	void *pp_handle = adev->powerplay.pp_handle;
-	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 
-	if (pp_funcs && pp_funcs->set_watermarks_for_clocks_ranges)
-		pp_funcs->set_watermarks_for_clocks_ranges(pp_handle, ranges);
+	amdgpu_dpm_set_watermarks_for_clocks_ranges(adev, ranges);
 
 	return PP_SMU_RESULT_OK;
 }
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index 3c59f16c7a6f..4aa5cca66048 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -1664,6 +1664,14 @@ int amdgpu_dpm_set_soft_freq_range(struct amdgpu_device *adev,
 	}
 }
 
+int amdgpu_dpm_write_watermarks_table(struct amdgpu_device *adev)
+{
+	if (!is_support_sw_smu(adev))
+		return 0;
+
+	return smu_write_watermarks_table(&adev->smu);
+}
+
 int amdgpu_dpm_wait_for_event(struct amdgpu_device *adev,
 			      enum smu_event_type event,
 			      uint64_t event_arg)
@@ -2165,3 +2173,213 @@ void amdgpu_dpm_stb_debug_fs_init(struct amdgpu_device *adev)
 
 	amdgpu_smu_stb_debug_fs_init(adev);
 }
+
+int amdgpu_dpm_display_configuration_change(struct amdgpu_device *adev,
+					    const struct amd_pp_display_configuration *input)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->display_configuration_change)
+		return 0;
+
+	return pp_funcs->display_configuration_change(adev->powerplay.pp_handle,
+						      input);
+}
+
+int amdgpu_dpm_get_clock_by_type(struct amdgpu_device *adev,
+				 enum amd_pp_clock_type type,
+				 struct amd_pp_clocks *clocks)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->get_clock_by_type)
+		return 0;
+
+	return pp_funcs->get_clock_by_type(adev->powerplay.pp_handle,
+					   type,
+					   clocks);
+}
+
+int amdgpu_dpm_get_display_mode_validation_clks(struct amdgpu_device *adev,
+						struct amd_pp_simple_clock_info *clocks)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->get_display_mode_validation_clocks)
+		return 0;
+
+	return pp_funcs->get_display_mode_validation_clocks(adev->powerplay.pp_handle,
+							    clocks);
+}
+
+int amdgpu_dpm_get_clock_by_type_with_latency(struct amdgpu_device *adev,
+					      enum amd_pp_clock_type type,
+					      struct pp_clock_levels_with_latency *clocks)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->get_clock_by_type_with_latency)
+		return 0;
+
+	return pp_funcs->get_clock_by_type_with_latency(adev->powerplay.pp_handle,
+							type,
+							clocks);
+}
+
+int amdgpu_dpm_get_clock_by_type_with_voltage(struct amdgpu_device *adev,
+					      enum amd_pp_clock_type type,
+					      struct pp_clock_levels_with_voltage *clocks)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->get_clock_by_type_with_voltage)
+		return 0;
+
+	return pp_funcs->get_clock_by_type_with_voltage(adev->powerplay.pp_handle,
+							type,
+							clocks);
+}
+
+int amdgpu_dpm_set_watermarks_for_clocks_ranges(struct amdgpu_device *adev,
+					       void *clock_ranges)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->set_watermarks_for_clocks_ranges)
+		return -EOPNOTSUPP;
+
+	return pp_funcs->set_watermarks_for_clocks_ranges(adev->powerplay.pp_handle,
+							  clock_ranges);
+}
+
+int amdgpu_dpm_display_clock_voltage_request(struct amdgpu_device *adev,
+					     struct pp_display_clock_request *clock)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->display_clock_voltage_request)
+		return -EOPNOTSUPP;
+
+	return pp_funcs->display_clock_voltage_request(adev->powerplay.pp_handle,
+						       clock);
+}
+
+int amdgpu_dpm_get_current_clocks(struct amdgpu_device *adev,
+				  struct amd_pp_clock_info *clocks)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->get_current_clocks)
+		return -EOPNOTSUPP;
+
+	return pp_funcs->get_current_clocks(adev->powerplay.pp_handle,
+					    clocks);
+}
+
+void amdgpu_dpm_notify_smu_enable_pwe(struct amdgpu_device *adev)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->notify_smu_enable_pwe)
+		return;
+
+	pp_funcs->notify_smu_enable_pwe(adev->powerplay.pp_handle);
+}
+
+int amdgpu_dpm_set_active_display_count(struct amdgpu_device *adev,
+					uint32_t count)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->set_active_display_count)
+		return -EOPNOTSUPP;
+
+	return pp_funcs->set_active_display_count(adev->powerplay.pp_handle,
+						  count);
+}
+
+int amdgpu_dpm_set_min_deep_sleep_dcefclk(struct amdgpu_device *adev,
+					  uint32_t clock)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->set_min_deep_sleep_dcefclk)
+		return -EOPNOTSUPP;
+
+	return pp_funcs->set_min_deep_sleep_dcefclk(adev->powerplay.pp_handle,
+						    clock);
+}
+
+void amdgpu_dpm_set_hard_min_dcefclk_by_freq(struct amdgpu_device *adev,
+					     uint32_t clock)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->set_hard_min_dcefclk_by_freq)
+		return;
+
+	pp_funcs->set_hard_min_dcefclk_by_freq(adev->powerplay.pp_handle,
+					       clock);
+}
+
+void amdgpu_dpm_set_hard_min_fclk_by_freq(struct amdgpu_device *adev,
+					  uint32_t clock)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->set_hard_min_fclk_by_freq)
+		return;
+
+	pp_funcs->set_hard_min_fclk_by_freq(adev->powerplay.pp_handle,
+					    clock);
+}
+
+int amdgpu_dpm_display_disable_memory_clock_switch(struct amdgpu_device *adev,
+						   bool disable_memory_clock_switch)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->display_disable_memory_clock_switch)
+		return 0;
+
+	return pp_funcs->display_disable_memory_clock_switch(adev->powerplay.pp_handle,
+							     disable_memory_clock_switch);
+}
+
+int amdgpu_dpm_get_max_sustainable_clocks_by_dc(struct amdgpu_device *adev,
+						struct pp_smu_nv_clock_table *max_clocks)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->get_max_sustainable_clocks_by_dc)
+		return -EOPNOTSUPP;
+
+	return pp_funcs->get_max_sustainable_clocks_by_dc(adev->powerplay.pp_handle,
+							  max_clocks);
+}
+
+enum pp_smu_status amdgpu_dpm_get_uclk_dpm_states(struct amdgpu_device *adev,
+						  unsigned int *clock_values_in_khz,
+						  unsigned int *num_states)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->get_uclk_dpm_states)
+		return -EOPNOTSUPP;
+
+	return pp_funcs->get_uclk_dpm_states(adev->powerplay.pp_handle,
+					     clock_values_in_khz,
+					     num_states);
+}
+
+int amdgpu_dpm_get_dpm_clock_table(struct amdgpu_device *adev,
+				   struct dpm_clocks *clock_table)
+{
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (!pp_funcs->get_dpm_clock_table)
+		return -EOPNOTSUPP;
+
+	return pp_funcs->get_dpm_clock_table(adev->powerplay.pp_handle,
+					     clock_table);
+}
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
index 039c40b1d0cb..fea203a79cb4 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
@@ -500,6 +500,7 @@ int amdgpu_dpm_set_soft_freq_range(struct amdgpu_device *adev,
 				        enum pp_clock_type type,
 				        uint32_t min,
 				        uint32_t max);
+int amdgpu_dpm_write_watermarks_table(struct amdgpu_device *adev);
 int amdgpu_dpm_wait_for_event(struct amdgpu_device *adev, enum smu_event_type event,
 		       uint64_t event_arg);
 int amdgpu_dpm_get_status_gfxoff(struct amdgpu_device *adev, uint32_t *value);
@@ -578,4 +579,41 @@ int amdgpu_dpm_set_pp_table(struct amdgpu_device *adev,
 			    size_t size);
 int amdgpu_dpm_get_num_cpu_cores(struct amdgpu_device *adev);
 void amdgpu_dpm_stb_debug_fs_init(struct amdgpu_device *adev);
+int amdgpu_dpm_display_configuration_change(struct amdgpu_device *adev,
+					    const struct amd_pp_display_configuration *input);
+int amdgpu_dpm_get_clock_by_type(struct amdgpu_device *adev,
+				 enum amd_pp_clock_type type,
+				 struct amd_pp_clocks *clocks);
+int amdgpu_dpm_get_display_mode_validation_clks(struct amdgpu_device *adev,
+						struct amd_pp_simple_clock_info *clocks);
+int amdgpu_dpm_get_clock_by_type_with_latency(struct amdgpu_device *adev,
+					      enum amd_pp_clock_type type,
+					      struct pp_clock_levels_with_latency *clocks);
+int amdgpu_dpm_get_clock_by_type_with_voltage(struct amdgpu_device *adev,
+					      enum amd_pp_clock_type type,
+					      struct pp_clock_levels_with_voltage *clocks);
+int amdgpu_dpm_set_watermarks_for_clocks_ranges(struct amdgpu_device *adev,
+					       void *clock_ranges);
+int amdgpu_dpm_display_clock_voltage_request(struct amdgpu_device *adev,
+					     struct pp_display_clock_request *clock);
+int amdgpu_dpm_get_current_clocks(struct amdgpu_device *adev,
+				  struct amd_pp_clock_info *clocks);
+void amdgpu_dpm_notify_smu_enable_pwe(struct amdgpu_device *adev);
+int amdgpu_dpm_set_active_display_count(struct amdgpu_device *adev,
+					uint32_t count);
+int amdgpu_dpm_set_min_deep_sleep_dcefclk(struct amdgpu_device *adev,
+					  uint32_t clock);
+void amdgpu_dpm_set_hard_min_dcefclk_by_freq(struct amdgpu_device *adev,
+					     uint32_t clock);
+void amdgpu_dpm_set_hard_min_fclk_by_freq(struct amdgpu_device *adev,
+					  uint32_t clock);
+int amdgpu_dpm_display_disable_memory_clock_switch(struct amdgpu_device *adev,
+						   bool disable_memory_clock_switch);
+int amdgpu_dpm_get_max_sustainable_clocks_by_dc(struct amdgpu_device *adev,
+						struct pp_smu_nv_clock_table *max_clocks);
+enum pp_smu_status amdgpu_dpm_get_uclk_dpm_states(struct amdgpu_device *adev,
+						  unsigned int *clock_values_in_khz,
+						  unsigned int *num_states);
+int amdgpu_dpm_get_dpm_clock_table(struct amdgpu_device *adev,
+				   struct dpm_clocks *clock_table);
 #endif
-- 
2.29.0


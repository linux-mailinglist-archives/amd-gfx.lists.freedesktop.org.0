Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA7821AE2F
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2020 06:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F826EB6B;
	Fri, 10 Jul 2020 04:48:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3456EB6B
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2020 04:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wbl4eHuRbJYJ31Itgn0SJ370cm5dzZssM3cStQlp8WEPrcwgwvyKcL77siDFBW9Leh3wE8YE6p2J3u56SlCDurMpKv4ZLnGxbhV2QBTpVofvxXdDDOdDX3k9U5A5H/YLFdv1puTDTo/qEHb6OAMBEnS0yc12N0Wn+apYZxOEryK5YKGyV4bnCK/teNBbpTF0Kjofb7pr2QbVT/X+4s0wDu65guSIGbUE9nq8mw3/No6cN46Gb+JD4KcWJe9S+BYhDkAFgLvXIPPaIyWQjv6IbkABeA/fKVEiIhmFeRBIeb05/71ediRwGxiTEuvHedttKCv0r8iSh4/jluqEWrPRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7VsI/6LIHroeptrv/45XdKsg4eDQn2vjCUwgkNUIa4=;
 b=Mp1l4Ao3gFbJr47kCXHCWd6HSvWS0HyIA862bvjGWLedyW1ijC1RRrNTKWTYVlzA0Mc4DYqxNdRzHyHqWWqA9tlS4dJfAgaqgFPotq0lAuujQsMbJyHiGv3aTj+vwO3MOVTvSEj9yK5o9NT+lPg1dBiEplnJnt8oQIrbuQpuUGTZK/NJyA1CqUWLzmObJDUS69KO9sTu4cOcrqM50UYqk7JEb1ai6BoQduJHkT6v0Wi4yDjGmSz7N7AH1J8BMr2LMCSHTrAhlZbZWGkd63182tcqmtlMwW9Is/ow4lUcBXx57XfJKf0FzbyK7HX8zg7jqgPZQHouXvuPqZ1NvM3snw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7VsI/6LIHroeptrv/45XdKsg4eDQn2vjCUwgkNUIa4=;
 b=sEJ5tr3jnJSAu1GQTTy+7hM42QW+zKoE3lVgm5WNS4z2zdSlgLxxxlzq55KpgHSUepGNaf+27Ztz0YS0UOdGW0s2ItuqIKClbsnwYjnf3DrvEXiWFCmAgNoavw0RovrPMKBL0wdR4/3AMjhQwI8jpwEjAqdI+t4+cuSstOs5rrE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB2360.namprd12.prod.outlook.com (2603:10b6:4:bb::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21; Fri, 10 Jul 2020 04:48:21 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::c157:8999:dcc3:536f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::c157:8999:dcc3:536f%3]) with mapi id 15.20.3174.023; Fri, 10 Jul 2020
 04:48:21 +0000
From: Evan Quan <evan.quan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/16] drm/amd/powerplay: update UMD pstate clock settings
Date: Fri, 10 Jul 2020 12:47:37 +0800
Message-Id: <20200710044746.23538-7-evan.quan@amd.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710044746.23538-1-evan.quan@amd.com>
References: <20200710044746.23538-1-evan.quan@amd.com>
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To DM6PR12MB2619.namprd12.prod.outlook.com
 (2603:10b6:5:45::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from equan-buildpc.amd.com (58.247.170.242) by
 HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.9 via Frontend Transport; Fri, 10 Jul 2020 04:48:19 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9df5f6cc-fc03-48c4-5325-08d8248c7874
X-MS-TrafficTypeDiagnostic: DM5PR12MB2360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2360FD08A5D497380AC2CFEDE4650@DM5PR12MB2360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WKswLH2wcqHPs0mLpjnU2VpcSmvnftBqOyc/dWMcqq15TKJnDm1oHHuofukVJJV/XPsv0GcCaQdCDqg4rqGjZphcyDsOv4FjX7v4T6IWPfOf0ZbQ8kj11Jiudtdwx1FFx77exZ1CoqmkwI7EFpOGzYHfQhPFnFeoBQF7KSqKOy3qxufwwkLnnMOZwXX6+yNSpv7geFlupNlViZT7dL03wi+ej5ZNb3WTr7vjWOvpMLvnznumEHLwZpjVgcDyA3Z2FVuOPY/CE0I0kbp2nqFs/wTthzgnvEKZhognjBtzXzdo1M0xK1DZcd5L5+sMk8WQFrukuSRVfefZbFR8EQ8HLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(2906002)(4326008)(8676002)(8936002)(83380400001)(6486002)(44832011)(66574015)(7696005)(52116002)(186003)(16526019)(956004)(2616005)(26005)(6916009)(316002)(478600001)(86362001)(6666004)(5660300002)(66556008)(1076003)(66476007)(36756003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: P0cP5cBrIGbxeOA+1/kw5wQM8cDQa0ujEsji35iD7ydK/b28ZsvURf5fBiBoLVsRdjvKQwzP51VCwNWFurxo8uOXWkR2eLDP//QGmITEjBThr/BrkElPRpBMTmhvS2GW5fREJBGtP0lD+G5VGsb9l+iNX22LloRJo24SR8dOPkYfogqeMjQVUuqJVOX5wXZk3Sav6x/VdwV0J/AjZqP+LHyMtaM9A3O/JbcYB+m6xIdLKCr0lYQf57Ojc6JuiO73pTNszJTQh2t8kPDb8JtW6Y0GGHbrhLG4oRIWxIcH4V5JKQo6RQTZsm6gYE1lCpIr3eN7keLx3yUWWtetvSBuWX0oFQMPeTWRlDf+qYxYRLOXVx1yZ54JNMNjfwMwqSusBJbyU5HVM3r9bKCqPNyA7YOBBd4aEgw7F3znYNf82HROALh+wBpA3Jo8NajXD37DFerpdXfH6eMGV+7PrV6eGPJiO6qjqfnILY3VJboupi+4Hj8ejuHteAVa+2cYpyBw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df5f6cc-fc03-48c4-5325-08d8248c7874
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 04:48:20.9984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6OZ3BQbAVP6k+ujwgWs/jVEGG+MCcD04WcawBGQmpwXRlBKVNuvmXvxjVjlQbGM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2360
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
Cc: alexander.deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Preparing for coming code sharing around performance level
setting.

Change-Id: I51b1536b62995f0fecd51b91f238793f57485aa9
Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    |  6 +-
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c  | 47 ++++++---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c    | 99 ++++++++++++++++---
 .../drm/amd/powerplay/sienna_cichlid_ppt.c    | 35 ++++---
 4 files changed, 141 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 6839faaab611..4080b3c792ac 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -2168,6 +2168,8 @@ int smu_read_sensor(struct smu_context *smu,
 		    enum amd_pp_sensors sensor,
 		    void *data, uint32_t *size)
 {
+	struct smu_umd_pstate_table *pstate_table =
+				&smu->pstate_table;
 	int ret = 0;
 
 	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
@@ -2180,11 +2182,11 @@ int smu_read_sensor(struct smu_context *smu,
 
 	switch (sensor) {
 	case AMDGPU_PP_SENSOR_STABLE_PSTATE_SCLK:
-		*((uint32_t *)data) = smu->pstate_sclk;
+		*((uint32_t *)data) = pstate_table->gfxclk_pstate.standard * 100;
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_STABLE_PSTATE_MCLK:
-		*((uint32_t *)data) = smu->pstate_mclk;
+		*((uint32_t *)data) = pstate_table->uclk_pstate.standard * 100;
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_ENABLED_SMC_FEATURES_MASK:
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index a3747ab4af32..33d472ffb2be 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -548,27 +548,44 @@ static int arcturus_run_btc(struct smu_context *smu)
 
 static int arcturus_populate_umd_state_clk(struct smu_context *smu)
 {
-	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
-	struct arcturus_dpm_table *dpm_table = NULL;
-	struct arcturus_single_dpm_table *gfx_table = NULL;
-	struct arcturus_single_dpm_table *mem_table = NULL;
+	struct smu_11_0_dpm_context *dpm_context =
+				smu->smu_dpm.dpm_context;
+	struct smu_11_0_dpm_table *gfx_table =
+				&dpm_context->dpm_tables.gfx_table;
+	struct smu_11_0_dpm_table *mem_table =
+				&dpm_context->dpm_tables.uclk_table;
+	struct smu_11_0_dpm_table *soc_table =
+				&dpm_context->dpm_tables.soc_table;
+	struct smu_umd_pstate_table *pstate_table =
+				&smu->pstate_table;
+
+	pstate_table->gfxclk_pstate.min = gfx_table->min;
+	pstate_table->gfxclk_pstate.peak = gfx_table->max;
 
-	dpm_table = smu_dpm->dpm_context;
-	gfx_table = &(dpm_table->gfx_table);
-	mem_table = &(dpm_table->mem_table);
+	pstate_table->uclk_pstate.min = mem_table->min;
+	pstate_table->uclk_pstate.peak = mem_table->max;
 
-	smu->pstate_sclk = gfx_table->dpm_levels[0].value;
-	smu->pstate_mclk = mem_table->dpm_levels[0].value;
+	pstate_table->socclk_pstate.min = soc_table->min;
+	pstate_table->socclk_pstate.peak = soc_table->max;
 
 	if (gfx_table->count > ARCTURUS_UMD_PSTATE_GFXCLK_LEVEL &&
-	    mem_table->count > ARCTURUS_UMD_PSTATE_MCLK_LEVEL) {
-		smu->pstate_sclk = gfx_table->dpm_levels[ARCTURUS_UMD_PSTATE_GFXCLK_LEVEL].value;
-		smu->pstate_mclk = mem_table->dpm_levels[ARCTURUS_UMD_PSTATE_MCLK_LEVEL].value;
+	    mem_table->count > ARCTURUS_UMD_PSTATE_MCLK_LEVEL &&
+	    soc_table->count > ARCTURUS_UMD_PSTATE_SOCCLK_LEVEL) {
+		pstate_table->gfxclk_pstate.standard =
+			gfx_table->dpm_levels[ARCTURUS_UMD_PSTATE_GFXCLK_LEVEL].value;
+		pstate_table->uclk_pstate.standard =
+			mem_table->dpm_levels[ARCTURUS_UMD_PSTATE_MCLK_LEVEL].value;
+		pstate_table->socclk_pstate.standard =
+			soc_table->dpm_levels[ARCTURUS_UMD_PSTATE_SOCCLK_LEVEL].value;
+	} else {
+		pstate_table->gfxclk_pstate.standard =
+			pstate_table->gfxclk_pstate.min;
+		pstate_table->uclk_pstate.standard =
+			pstate_table->uclk_pstate.min;
+		pstate_table->socclk_pstate.standard =
+			pstate_table->socclk_pstate.min;
 	}
 
-	smu->pstate_sclk = smu->pstate_sclk * 100;
-	smu->pstate_mclk = smu->pstate_mclk * 100;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index a022e93a487c..d3e11d81c0ad 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1213,22 +1213,93 @@ static int navi10_force_clk_levels(struct smu_context *smu,
 
 static int navi10_populate_umd_state_clk(struct smu_context *smu)
 {
-	int ret = 0;
-	uint32_t min_sclk_freq = 0, min_mclk_freq = 0;
-
-	ret = smu_v11_0_get_dpm_ultimate_freq(smu, SMU_SCLK, &min_sclk_freq, NULL);
-	if (ret)
-		return ret;
-
-	smu->pstate_sclk = min_sclk_freq * 100;
-
-	ret = smu_v11_0_get_dpm_ultimate_freq(smu, SMU_MCLK, &min_mclk_freq, NULL);
-	if (ret)
-		return ret;
+	struct smu_11_0_dpm_context *dpm_context =
+				smu->smu_dpm.dpm_context;
+	struct smu_11_0_dpm_table *gfx_table =
+				&dpm_context->dpm_tables.gfx_table;
+	struct smu_11_0_dpm_table *mem_table =
+				&dpm_context->dpm_tables.uclk_table;
+	struct smu_11_0_dpm_table *soc_table =
+				&dpm_context->dpm_tables.soc_table;
+	struct smu_umd_pstate_table *pstate_table =
+				&smu->pstate_table;
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t sclk_freq;
 
-	smu->pstate_mclk = min_mclk_freq * 100;
+	pstate_table->gfxclk_pstate.min = gfx_table->min;
+	switch (adev->asic_type) {
+	case CHIP_NAVI10:
+		switch (adev->pdev->revision) {
+		case 0xf0: /* XTX */
+		case 0xc0:
+			sclk_freq = NAVI10_PEAK_SCLK_XTX;
+			break;
+		case 0xf1: /* XT */
+		case 0xc1:
+			sclk_freq = NAVI10_PEAK_SCLK_XT;
+			break;
+		default: /* XL */
+			sclk_freq = NAVI10_PEAK_SCLK_XL;
+			break;
+		}
+		break;
+	case CHIP_NAVI14:
+		switch (adev->pdev->revision) {
+		case 0xc7: /* XT */
+		case 0xf4:
+			sclk_freq = NAVI14_UMD_PSTATE_PEAK_XT_GFXCLK;
+			break;
+		case 0xc1: /* XTM */
+		case 0xf2:
+			sclk_freq = NAVI14_UMD_PSTATE_PEAK_XTM_GFXCLK;
+			break;
+		case 0xc3: /* XLM */
+		case 0xf3:
+			sclk_freq = NAVI14_UMD_PSTATE_PEAK_XLM_GFXCLK;
+			break;
+		case 0xc5: /* XTX */
+		case 0xf6:
+			sclk_freq = NAVI14_UMD_PSTATE_PEAK_XLM_GFXCLK;
+			break;
+		default: /* XL */
+			sclk_freq = NAVI14_UMD_PSTATE_PEAK_XL_GFXCLK;
+			break;
+		}
+		break;
+	case CHIP_NAVI12:
+		sclk_freq = NAVI12_UMD_PSTATE_PEAK_GFXCLK;
+		break;
+	default:
+		sclk_freq = gfx_table->dpm_levels[gfx_table->count - 1].value;
+		break;
+	}
+	pstate_table->gfxclk_pstate.peak = sclk_freq;
+
+	pstate_table->uclk_pstate.min = mem_table->min;
+	pstate_table->uclk_pstate.peak = mem_table->max;
+
+	pstate_table->socclk_pstate.min = soc_table->min;
+	pstate_table->socclk_pstate.peak = soc_table->max;
+
+	if (gfx_table->max > NAVI10_UMD_PSTATE_PROFILING_GFXCLK &&
+	    mem_table->max > NAVI10_UMD_PSTATE_PROFILING_MEMCLK &&
+	    soc_table->max > NAVI10_UMD_PSTATE_PROFILING_SOCCLK) {
+		pstate_table->gfxclk_pstate.standard =
+			NAVI10_UMD_PSTATE_PROFILING_GFXCLK;
+		pstate_table->uclk_pstate.standard =
+			NAVI10_UMD_PSTATE_PROFILING_MEMCLK;
+		pstate_table->socclk_pstate.standard =
+			NAVI10_UMD_PSTATE_PROFILING_SOCCLK;
+	} else {
+		pstate_table->gfxclk_pstate.standard =
+			pstate_table->gfxclk_pstate.min;
+		pstate_table->uclk_pstate.standard =
+			pstate_table->uclk_pstate.min;
+		pstate_table->socclk_pstate.standard =
+			pstate_table->socclk_pstate.min;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int navi10_get_clock_by_type_with_latency(struct smu_context *smu,
diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index d750d06378e9..8fae7dd982c7 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -1114,22 +1114,27 @@ static int sienna_cichlid_force_clk_levels(struct smu_context *smu,
 
 static int sienna_cichlid_populate_umd_state_clk(struct smu_context *smu)
 {
-	int ret = 0;
-	uint32_t min_sclk_freq = 0, min_mclk_freq = 0;
-
-	ret = smu_v11_0_get_dpm_ultimate_freq(smu, SMU_SCLK, &min_sclk_freq, NULL);
-	if (ret)
-		return ret;
-
-	smu->pstate_sclk = min_sclk_freq * 100;
+	struct smu_11_0_dpm_context *dpm_context =
+				smu->smu_dpm.dpm_context;
+	struct smu_11_0_dpm_table *gfx_table =
+				&dpm_context->dpm_tables.gfx_table;
+	struct smu_11_0_dpm_table *mem_table =
+				&dpm_context->dpm_tables.uclk_table;
+	struct smu_11_0_dpm_table *soc_table =
+				&dpm_context->dpm_tables.soc_table;
+	struct smu_umd_pstate_table *pstate_table =
+				&smu->pstate_table;
+
+	pstate_table->gfxclk_pstate.min = gfx_table->min;
+	pstate_table->gfxclk_pstate.peak = gfx_table->max;
+
+	pstate_table->uclk_pstate.min = mem_table->min;
+	pstate_table->uclk_pstate.peak = mem_table->max;
+
+	pstate_table->socclk_pstate.min = soc_table->min;
+	pstate_table->socclk_pstate.peak = soc_table->max;
 
-	ret = smu_v11_0_get_dpm_ultimate_freq(smu, SMU_MCLK, &min_mclk_freq, NULL);
-	if (ret)
-		return ret;
-
-	smu->pstate_mclk = min_mclk_freq * 100;
-
-	return ret;
+	return 0;
 }
 
 static int sienna_cichlid_pre_display_config_changed(struct smu_context *smu)
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

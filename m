Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209539854B1
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2024 09:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00C810E7AD;
	Wed, 25 Sep 2024 07:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KHOr0RL1";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DC210E7AD
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2024 07:57:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBn9hBMLuu9tyi9U6Bm9v04q4XNgEcUVKfg8aJWFpQzJLZvfwm1WBN5HkiIAvYQKz3heXKjxLz62m5ZBAzRQV4Jx0xKkpW3EI+P1imZpS6XuULzi3bPFbECt7lmTfokIQPXhgbIC5+iu5ZYfFNoleNnNiuUBFiQR6MuUUIZFGdLv35B6ymuUjNZb/yXbb+8v9ubIFX4xHUvG3YiEadtHpllAoYmTMScHpDXIAeF8kqRmWV5NQGE38Tu9jUp4QF3Tkb8ZKqJ05hymvG7Yr3Pmnv4YuRnqZ1MLL43y1itJz6sjyIigprZtxvFYsIQtb4eqQEHVVBZjSxBXLlRSKOU4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf3Uiy355NEyLBZ7WW7+BYRawpoRaBYUex+8h8P9vzo=;
 b=LAriqIck4YPMylFh1BS3AHshUD02Tr0gWeMeqFJIb+oYJA+ciKzLWqjli3gSllNSwKmY/EF/3tgE9hCxHkOKd8Q5nVCGPLa0eny9G7mwSy71MfsuxG+0OP4a+hF7gCSNSKo6/LT9gnmW3o/36JllP3OL6Ik7uaZu6F6V9phORvH1VORYgRe4RUzJscwalvLKvt2sBTtQOMK+8+ciHkkfgM8tF8+UZIrvqWvk1V3ym4L1grJrqtiWizVNNtHLRZxNUUFWTRk+g2o1mhriDh4wpoLs1abhG9nO9LjP6c1paiiASw7lTBQevC60xLbJjZhLLXrUl+bVUoE8mCQ2wfcdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf3Uiy355NEyLBZ7WW7+BYRawpoRaBYUex+8h8P9vzo=;
 b=KHOr0RL1EzBEFG4Js2UrVK4qswXfyvPh1JpuC7wjqPTo952ZW1TsWe7iOi7NOlsgwxlVA7z3ku4JQond2rNcD2Wya0lNX3nMtJGwRs4isNJIi+bGrYD6ymoYCqTudAPLA7nAXdI5bNsixQRx7wW0GM0IypkXWnKVlDOcLMNbbsI=
Received: from BYAPR07CA0033.namprd07.prod.outlook.com (2603:10b6:a02:bc::46)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 07:56:56 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a02:bc:cafe::56) by BYAPR07CA0033.outlook.office365.com
 (2603:10b6:a02:bc::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32 via Frontend
 Transport; Wed, 25 Sep 2024 07:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Wed, 25 Sep 2024 07:56:55 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Sep
 2024 02:56:48 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
 <kenneth.feng@amd.com>, <mario.limonciello@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v1 1/9] drm/amd/pm: remove dump_pptable functions
Date: Wed, 25 Sep 2024 09:54:25 +0200
Message-ID: <20240925075607.23929-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925075607.23929-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240925075607.23929-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f993af-0e7c-4cfa-a523-08dcdd37a012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XKJeWFW5lvDatB6Pkq7LubtZNu+SqwXLyLeis010koZi31/sz9nMTg7OhNtN?=
 =?us-ascii?Q?2Goq7Wm91EteQnc8cfA8ap5F5gpdRJmAp8e/+gDnOjjIllWiwn/lrvhTbaSj?=
 =?us-ascii?Q?tiJfBXiD7hxjjzzdKjU7sh/yht4p7EDh6V+mSc9we6dip3BqVhNeQJAOntKZ?=
 =?us-ascii?Q?HIVHWfyQVqbl2oT/TC7UZ7gYY86EMAdHB/2mLa4VzoUir5x+4K51GgPz7fzM?=
 =?us-ascii?Q?o/u0WTsXobKxiJLvzJeaf3lZDN9vNfnhd3mJfcULgMO+8xIaeuAeLe/kzt3E?=
 =?us-ascii?Q?8CeShaZjbPTCsefB+lvVHWYa42jIukdNCQKW2DGzFaWGZ7NHbtakYE5CTGWi?=
 =?us-ascii?Q?NlgMow1hOwKdVdq2GXtEI4ANiBJ4fKJh4LZVoQ5uX0XPq8Ui/e2ZRmSCLNjQ?=
 =?us-ascii?Q?QT55aQKNO2Nk7/wROwJpbXcWzns4RJr9PrOiCa3/WsHg2QDj3YyRvTrexgcX?=
 =?us-ascii?Q?uGIbqw0LD6+lX5V1xcxwU5++KgNsjZ+vsI/xTvPFKbUoff8hRhI54FZ9jn04?=
 =?us-ascii?Q?D/UEhPaCx+ouObAEv1xDP02d9TpR8Xi9jZWeM6vgslS4DVmCXHaRVv3JedPD?=
 =?us-ascii?Q?zNmYe1aY15x1XX1dBk95qsvrFr3H5Zo3fG3vU4889OjKRfrR2id3Li+X7Yuh?=
 =?us-ascii?Q?zhMCotNx16npFFpoke6IgmYcg0szLLnhYsUEJllGKFCCHcIlFihwhAEXB/ZC?=
 =?us-ascii?Q?oGQ8fnRvkNHy7Tvsm01kzq5S5Wv0gIwqqwajP4dODm++H46IZqe3NYSnm6qn?=
 =?us-ascii?Q?X7XUbHGzjW8t7it9gU+Zt97R40i+XNy3zKYjLeBR6XhOqfLdXHdKsfLi17kw?=
 =?us-ascii?Q?M3XO7qEUqLtqSUkX4pBMZv/HozOQq03bZ9aItPhFi+TBiSIM9myd2cVs2Qz3?=
 =?us-ascii?Q?PEuXxoxMJEVlru99A6zsLF1NDU0Xzs/D+Ra7MNV5nyK7FfKdBx9xoEu2RmzV?=
 =?us-ascii?Q?J0Aa+eR4yv9/U9GxolndF1nmGKA1PEitVXAUrJq7PRn19eebtwY7WRyIss7q?=
 =?us-ascii?Q?xQoiqJVR759yhKksBXHfSVLQgz8i1j8rwrPMjOFfh8T1zGMUemgiAm0Yo9WO?=
 =?us-ascii?Q?G2MZO3q0UzAIs+GgWFwGbzB0JPG5/pQza06T8KblgjPRg+FfcVVdvCZLJRaZ?=
 =?us-ascii?Q?dwpFDks7/bf5jK5eZ2MCNPzCIzRPbTbmnYWRoz65puTIpzdCJ+z/tQ3RNs4R?=
 =?us-ascii?Q?fapHFiGFXAbtRP3wyo674ikCBQuW5Q3OwvNteaYAl3yY4AincHNqe7v3/gnp?=
 =?us-ascii?Q?SLVPpz+0W+ediFLu8Tiqbq6v/JlD8/6SIwHkZ5BT9foFyPwdmcw8Z7ld2eJq?=
 =?us-ascii?Q?FPXUmL7iluP0Q/xeh81sZta6tmVhxnaWtKeBSrC5gaxOVh2hKP31MluDoh6r?=
 =?us-ascii?Q?09z3EmVezj+2Wxx04rqovpg3Cfmc04TndFg/zvoEIlLPAI10KCsce7+FVg9N?=
 =?us-ascii?Q?+KiY7G8GpIBSTaccfLAWDbKEb0O5ZEcm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 07:56:55.6565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f993af-0e7c-4cfa-a523-08dcdd37a012
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

They're not used.

Tested-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../powerplay/hwmgr/vega20_processpptables.c  |  574 --------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |    5 -
 .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  433 ------
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 1269 -----------------
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |   14 -
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  |   14 -
 .../drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c  |   14 -
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |    1 -
 8 files changed, 2324 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
index 79c817752a33..2b446f8866ba 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
@@ -62,578 +62,6 @@ static const void *get_powerplay_table(struct pp_hwmgr *hwmgr)
 	return table_address;
 }
 
-#if 0
-static void dump_pptable(PPTable_t *pptable)
-{
-	int i;
-
-	pr_info("Version = 0x%08x\n", pptable->Version);
-
-	pr_info("FeaturesToRun[0] = 0x%08x\n", pptable->FeaturesToRun[0]);
-	pr_info("FeaturesToRun[1] = 0x%08x\n", pptable->FeaturesToRun[1]);
-
-	pr_info("SocketPowerLimitAc0 = %d\n", pptable->SocketPowerLimitAc0);
-	pr_info("SocketPowerLimitAc0Tau = %d\n", pptable->SocketPowerLimitAc0Tau);
-	pr_info("SocketPowerLimitAc1 = %d\n", pptable->SocketPowerLimitAc1);
-	pr_info("SocketPowerLimitAc1Tau = %d\n", pptable->SocketPowerLimitAc1Tau);
-	pr_info("SocketPowerLimitAc2 = %d\n", pptable->SocketPowerLimitAc2);
-	pr_info("SocketPowerLimitAc2Tau = %d\n", pptable->SocketPowerLimitAc2Tau);
-	pr_info("SocketPowerLimitAc3 = %d\n", pptable->SocketPowerLimitAc3);
-	pr_info("SocketPowerLimitAc3Tau = %d\n", pptable->SocketPowerLimitAc3Tau);
-	pr_info("SocketPowerLimitDc = %d\n", pptable->SocketPowerLimitDc);
-	pr_info("SocketPowerLimitDcTau = %d\n", pptable->SocketPowerLimitDcTau);
-	pr_info("TdcLimitSoc = %d\n", pptable->TdcLimitSoc);
-	pr_info("TdcLimitSocTau = %d\n", pptable->TdcLimitSocTau);
-	pr_info("TdcLimitGfx = %d\n", pptable->TdcLimitGfx);
-	pr_info("TdcLimitGfxTau = %d\n", pptable->TdcLimitGfxTau);
-
-	pr_info("TedgeLimit = %d\n", pptable->TedgeLimit);
-	pr_info("ThotspotLimit = %d\n", pptable->ThotspotLimit);
-	pr_info("ThbmLimit = %d\n", pptable->ThbmLimit);
-	pr_info("Tvr_gfxLimit = %d\n", pptable->Tvr_gfxLimit);
-	pr_info("Tvr_memLimit = %d\n", pptable->Tvr_memLimit);
-	pr_info("Tliquid1Limit = %d\n", pptable->Tliquid1Limit);
-	pr_info("Tliquid2Limit = %d\n", pptable->Tliquid2Limit);
-	pr_info("TplxLimit = %d\n", pptable->TplxLimit);
-	pr_info("FitLimit = %d\n", pptable->FitLimit);
-
-	pr_info("PpmPowerLimit = %d\n", pptable->PpmPowerLimit);
-	pr_info("PpmTemperatureThreshold = %d\n", pptable->PpmTemperatureThreshold);
-
-	pr_info("MemoryOnPackage = 0x%02x\n", pptable->MemoryOnPackage);
-	pr_info("padding8_limits = 0x%02x\n", pptable->padding8_limits);
-	pr_info("Tvr_SocLimit = %d\n", pptable->Tvr_SocLimit);
-
-	pr_info("UlvVoltageOffsetSoc = %d\n", pptable->UlvVoltageOffsetSoc);
-	pr_info("UlvVoltageOffsetGfx = %d\n", pptable->UlvVoltageOffsetGfx);
-
-	pr_info("UlvSmnclkDid = %d\n", pptable->UlvSmnclkDid);
-	pr_info("UlvMp1clkDid = %d\n", pptable->UlvMp1clkDid);
-	pr_info("UlvGfxclkBypass = %d\n", pptable->UlvGfxclkBypass);
-	pr_info("Padding234 = 0x%02x\n", pptable->Padding234);
-
-	pr_info("MinVoltageGfx = %d\n", pptable->MinVoltageGfx);
-	pr_info("MinVoltageSoc = %d\n", pptable->MinVoltageSoc);
-	pr_info("MaxVoltageGfx = %d\n", pptable->MaxVoltageGfx);
-	pr_info("MaxVoltageSoc = %d\n", pptable->MaxVoltageSoc);
-
-	pr_info("LoadLineResistanceGfx = %d\n", pptable->LoadLineResistanceGfx);
-	pr_info("LoadLineResistanceSoc = %d\n", pptable->LoadLineResistanceSoc);
-
-	pr_info("[PPCLK_GFXCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_GFXCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].padding,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.c);
-
-	pr_info("[PPCLK_VCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_VCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_VCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_VCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_VCLK].padding,
-			pptable->DpmDescriptor[PPCLK_VCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_VCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_VCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_VCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_VCLK].SsCurve.c);
-
-	pr_info("[PPCLK_DCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_DCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_DCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_DCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_DCLK].padding,
-			pptable->DpmDescriptor[PPCLK_DCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_DCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_DCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_DCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_DCLK].SsCurve.c);
-
-	pr_info("[PPCLK_ECLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_ECLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_ECLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_ECLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_ECLK].padding,
-			pptable->DpmDescriptor[PPCLK_ECLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_ECLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_ECLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_ECLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_ECLK].SsCurve.c);
-
-	pr_info("[PPCLK_SOCCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_SOCCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].padding,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.c);
-
-	pr_info("[PPCLK_UCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_UCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_UCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_UCLK].padding,
-			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.c);
-
-	pr_info("[PPCLK_DCEFCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_DCEFCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_DCEFCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_DCEFCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_DCEFCLK].padding,
-			pptable->DpmDescriptor[PPCLK_DCEFCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_DCEFCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_DCEFCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_DCEFCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_DCEFCLK].SsCurve.c);
-
-	pr_info("[PPCLK_DISPCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_DISPCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_DISPCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_DISPCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_DISPCLK].padding,
-			pptable->DpmDescriptor[PPCLK_DISPCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_DISPCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_DISPCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_DISPCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_DISPCLK].SsCurve.c);
-
-	pr_info("[PPCLK_PIXCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_PIXCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_PIXCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_PIXCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_PIXCLK].padding,
-			pptable->DpmDescriptor[PPCLK_PIXCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_PIXCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_PIXCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_PIXCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_PIXCLK].SsCurve.c);
-
-	pr_info("[PPCLK_PHYCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_PHYCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_PHYCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_PHYCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_PHYCLK].padding,
-			pptable->DpmDescriptor[PPCLK_PHYCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_PHYCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_PHYCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_PHYCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_PHYCLK].SsCurve.c);
-
-	pr_info("[PPCLK_FCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n",
-			pptable->DpmDescriptor[PPCLK_FCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_FCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_FCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_FCLK].padding,
-			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.c);
-
-
-	pr_info("FreqTableGfx\n");
-	for (i = 0; i < NUM_GFXCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableGfx[i]);
-
-	pr_info("FreqTableVclk\n");
-	for (i = 0; i < NUM_VCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableVclk[i]);
-
-	pr_info("FreqTableDclk\n");
-	for (i = 0; i < NUM_DCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableDclk[i]);
-
-	pr_info("FreqTableEclk\n");
-	for (i = 0; i < NUM_ECLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableEclk[i]);
-
-	pr_info("FreqTableSocclk\n");
-	for (i = 0; i < NUM_SOCCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableSocclk[i]);
-
-	pr_info("FreqTableUclk\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableUclk[i]);
-
-	pr_info("FreqTableFclk\n");
-	for (i = 0; i < NUM_FCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableFclk[i]);
-
-	pr_info("FreqTableDcefclk\n");
-	for (i = 0; i < NUM_DCEFCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableDcefclk[i]);
-
-	pr_info("FreqTableDispclk\n");
-	for (i = 0; i < NUM_DISPCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTableDispclk[i]);
-
-	pr_info("FreqTablePixclk\n");
-	for (i = 0; i < NUM_PIXCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTablePixclk[i]);
-
-	pr_info("FreqTablePhyclk\n");
-	for (i = 0; i < NUM_PHYCLK_DPM_LEVELS; i++)
-		pr_info("  .[%02d] = %d\n", i, pptable->FreqTablePhyclk[i]);
-
-	pr_info("DcModeMaxFreq[PPCLK_GFXCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_GFXCLK]);
-	pr_info("DcModeMaxFreq[PPCLK_VCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_VCLK]);
-	pr_info("DcModeMaxFreq[PPCLK_DCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_DCLK]);
-	pr_info("DcModeMaxFreq[PPCLK_ECLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_ECLK]);
-	pr_info("DcModeMaxFreq[PPCLK_SOCCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_SOCCLK]);
-	pr_info("DcModeMaxFreq[PPCLK_UCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_UCLK]);
-	pr_info("DcModeMaxFreq[PPCLK_DCEFCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_DCEFCLK]);
-	pr_info("DcModeMaxFreq[PPCLK_DISPCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_DISPCLK]);
-	pr_info("DcModeMaxFreq[PPCLK_PIXCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_PIXCLK]);
-	pr_info("DcModeMaxFreq[PPCLK_PHYCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_PHYCLK]);
-	pr_info("DcModeMaxFreq[PPCLK_FCLK] = %d\n", pptable->DcModeMaxFreq[PPCLK_FCLK]);
-	pr_info("Padding8_Clks = %d\n", pptable->Padding8_Clks);
-
-	pr_info("Mp0clkFreq\n");
-	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->Mp0clkFreq[i]);
-
-	pr_info("Mp0DpmVoltage\n");
-	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->Mp0DpmVoltage[i]);
-
-	pr_info("GfxclkFidle = 0x%x\n", pptable->GfxclkFidle);
-	pr_info("GfxclkSlewRate = 0x%x\n", pptable->GfxclkSlewRate);
-	pr_info("CksEnableFreq = 0x%x\n", pptable->CksEnableFreq);
-	pr_info("Padding789 = 0x%x\n", pptable->Padding789);
-	pr_info("CksVoltageOffset[a = 0x%08x b = 0x%08x c = 0x%08x]\n",
-			pptable->CksVoltageOffset.a,
-			pptable->CksVoltageOffset.b,
-			pptable->CksVoltageOffset.c);
-	pr_info("Padding567[0] = 0x%x\n", pptable->Padding567[0]);
-	pr_info("Padding567[1] = 0x%x\n", pptable->Padding567[1]);
-	pr_info("Padding567[2] = 0x%x\n", pptable->Padding567[2]);
-	pr_info("Padding567[3] = 0x%x\n", pptable->Padding567[3]);
-	pr_info("GfxclkDsMaxFreq = %d\n", pptable->GfxclkDsMaxFreq);
-	pr_info("GfxclkSource = 0x%x\n", pptable->GfxclkSource);
-	pr_info("Padding456 = 0x%x\n", pptable->Padding456);
-
-	pr_info("LowestUclkReservedForUlv = %d\n", pptable->LowestUclkReservedForUlv);
-	pr_info("Padding8_Uclk[0] = 0x%x\n", pptable->Padding8_Uclk[0]);
-	pr_info("Padding8_Uclk[1] = 0x%x\n", pptable->Padding8_Uclk[1]);
-	pr_info("Padding8_Uclk[2] = 0x%x\n", pptable->Padding8_Uclk[2]);
-
-	pr_info("PcieGenSpeed\n");
-	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->PcieGenSpeed[i]);
-
-	pr_info("PcieLaneCount\n");
-	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->PcieLaneCount[i]);
-
-	pr_info("LclkFreq\n");
-	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->LclkFreq[i]);
-
-	pr_info("EnableTdpm = %d\n", pptable->EnableTdpm);
-	pr_info("TdpmHighHystTemperature = %d\n", pptable->TdpmHighHystTemperature);
-	pr_info("TdpmLowHystTemperature = %d\n", pptable->TdpmLowHystTemperature);
-	pr_info("GfxclkFreqHighTempLimit = %d\n", pptable->GfxclkFreqHighTempLimit);
-
-	pr_info("FanStopTemp = %d\n", pptable->FanStopTemp);
-	pr_info("FanStartTemp = %d\n", pptable->FanStartTemp);
-
-	pr_info("FanGainEdge = %d\n", pptable->FanGainEdge);
-	pr_info("FanGainHotspot = %d\n", pptable->FanGainHotspot);
-	pr_info("FanGainLiquid = %d\n", pptable->FanGainLiquid);
-	pr_info("FanGainVrGfx = %d\n", pptable->FanGainVrGfx);
-	pr_info("FanGainVrSoc = %d\n", pptable->FanGainVrSoc);
-	pr_info("FanGainPlx = %d\n", pptable->FanGainPlx);
-	pr_info("FanGainHbm = %d\n", pptable->FanGainHbm);
-	pr_info("FanPwmMin = %d\n", pptable->FanPwmMin);
-	pr_info("FanAcousticLimitRpm = %d\n", pptable->FanAcousticLimitRpm);
-	pr_info("FanThrottlingRpm = %d\n", pptable->FanThrottlingRpm);
-	pr_info("FanMaximumRpm = %d\n", pptable->FanMaximumRpm);
-	pr_info("FanTargetTemperature = %d\n", pptable->FanTargetTemperature);
-	pr_info("FanTargetGfxclk = %d\n", pptable->FanTargetGfxclk);
-	pr_info("FanZeroRpmEnable = %d\n", pptable->FanZeroRpmEnable);
-	pr_info("FanTachEdgePerRev = %d\n", pptable->FanTachEdgePerRev);
-
-	pr_info("FuzzyFan_ErrorSetDelta = %d\n", pptable->FuzzyFan_ErrorSetDelta);
-	pr_info("FuzzyFan_ErrorRateSetDelta = %d\n", pptable->FuzzyFan_ErrorRateSetDelta);
-	pr_info("FuzzyFan_PwmSetDelta = %d\n", pptable->FuzzyFan_PwmSetDelta);
-	pr_info("FuzzyFan_Reserved = %d\n", pptable->FuzzyFan_Reserved);
-
-	pr_info("OverrideAvfsGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
-	pr_info("OverrideAvfsGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
-	pr_info("Padding8_Avfs[0] = %d\n", pptable->Padding8_Avfs[0]);
-	pr_info("Padding8_Avfs[1] = %d\n", pptable->Padding8_Avfs[1]);
-
-	pr_info("qAvfsGb[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].a,
-			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].b,
-			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].c);
-	pr_info("qAvfsGb[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].a,
-			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].b,
-			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].c);
-	pr_info("dBtcGbGfxCksOn{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbGfxCksOn.a,
-			pptable->dBtcGbGfxCksOn.b,
-			pptable->dBtcGbGfxCksOn.c);
-	pr_info("dBtcGbGfxCksOff{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbGfxCksOff.a,
-			pptable->dBtcGbGfxCksOff.b,
-			pptable->dBtcGbGfxCksOff.c);
-	pr_info("dBtcGbGfxAfll{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbGfxAfll.a,
-			pptable->dBtcGbGfxAfll.b,
-			pptable->dBtcGbGfxAfll.c);
-	pr_info("dBtcGbSoc{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbSoc.a,
-			pptable->dBtcGbSoc.b,
-			pptable->dBtcGbSoc.c);
-	pr_info("qAgingGb[AVFS_VOLTAGE_GFX]{m = 0x%x b = 0x%x}\n",
-			pptable->qAgingGb[AVFS_VOLTAGE_GFX].m,
-			pptable->qAgingGb[AVFS_VOLTAGE_GFX].b);
-	pr_info("qAgingGb[AVFS_VOLTAGE_SOC]{m = 0x%x b = 0x%x}\n",
-			pptable->qAgingGb[AVFS_VOLTAGE_SOC].m,
-			pptable->qAgingGb[AVFS_VOLTAGE_SOC].b);
-
-	pr_info("qStaticVoltageOffset[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].a,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].b,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].c);
-	pr_info("qStaticVoltageOffset[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].a,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].b,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].c);
-
-	pr_info("DcTol[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
-	pr_info("DcTol[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
-
-	pr_info("DcBtcEnabled[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcEnabled[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
-	pr_info("Padding8_GfxBtc[0] = 0x%x\n", pptable->Padding8_GfxBtc[0]);
-	pr_info("Padding8_GfxBtc[1] = 0x%x\n", pptable->Padding8_GfxBtc[1]);
-
-	pr_info("DcBtcMin[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcMin[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
-	pr_info("DcBtcMax[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcMax[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
-
-	pr_info("XgmiLinkSpeed\n");
-	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiLinkSpeed[i]);
-	pr_info("XgmiLinkWidth\n");
-	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiLinkWidth[i]);
-	pr_info("XgmiFclkFreq\n");
-	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiFclkFreq[i]);
-	pr_info("XgmiUclkFreq\n");
-	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiUclkFreq[i]);
-	pr_info("XgmiSocclkFreq\n");
-	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiSocclkFreq[i]);
-	pr_info("XgmiSocVoltage\n");
-	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		pr_info("  .[%d] = %d\n", i, pptable->XgmiSocVoltage[i]);
-
-	pr_info("DebugOverrides = 0x%x\n", pptable->DebugOverrides);
-	pr_info("ReservedEquation0{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation0.a,
-			pptable->ReservedEquation0.b,
-			pptable->ReservedEquation0.c);
-	pr_info("ReservedEquation1{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation1.a,
-			pptable->ReservedEquation1.b,
-			pptable->ReservedEquation1.c);
-	pr_info("ReservedEquation2{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation2.a,
-			pptable->ReservedEquation2.b,
-			pptable->ReservedEquation2.c);
-	pr_info("ReservedEquation3{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation3.a,
-			pptable->ReservedEquation3.b,
-			pptable->ReservedEquation3.c);
-
-	pr_info("MinVoltageUlvGfx = %d\n", pptable->MinVoltageUlvGfx);
-	pr_info("MinVoltageUlvSoc = %d\n", pptable->MinVoltageUlvSoc);
-
-	pr_info("MGpuFanBoostLimitRpm = %d\n", pptable->MGpuFanBoostLimitRpm);
-	pr_info("padding16_Fan = %d\n", pptable->padding16_Fan);
-
-	pr_info("FanGainVrMem0 = %d\n", pptable->FanGainVrMem0);
-	pr_info("FanGainVrMem0 = %d\n", pptable->FanGainVrMem0);
-
-	pr_info("DcBtcGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
-	pr_info("DcBtcGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
-
-	for (i = 0; i < 11; i++)
-		pr_info("Reserved[%d] = 0x%x\n", i, pptable->Reserved[i]);
-
-	for (i = 0; i < 3; i++)
-		pr_info("Padding32[%d] = 0x%x\n", i, pptable->Padding32[i]);
-
-	pr_info("MaxVoltageStepGfx = 0x%x\n", pptable->MaxVoltageStepGfx);
-	pr_info("MaxVoltageStepSoc = 0x%x\n", pptable->MaxVoltageStepSoc);
-
-	pr_info("VddGfxVrMapping = 0x%x\n", pptable->VddGfxVrMapping);
-	pr_info("VddSocVrMapping = 0x%x\n", pptable->VddSocVrMapping);
-	pr_info("VddMem0VrMapping = 0x%x\n", pptable->VddMem0VrMapping);
-	pr_info("VddMem1VrMapping = 0x%x\n", pptable->VddMem1VrMapping);
-
-	pr_info("GfxUlvPhaseSheddingMask = 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
-	pr_info("SocUlvPhaseSheddingMask = 0x%x\n", pptable->SocUlvPhaseSheddingMask);
-	pr_info("ExternalSensorPresent = 0x%x\n", pptable->ExternalSensorPresent);
-	pr_info("Padding8_V = 0x%x\n", pptable->Padding8_V);
-
-	pr_info("GfxMaxCurrent = 0x%x\n", pptable->GfxMaxCurrent);
-	pr_info("GfxOffset = 0x%x\n", pptable->GfxOffset);
-	pr_info("Padding_TelemetryGfx = 0x%x\n", pptable->Padding_TelemetryGfx);
-
-	pr_info("SocMaxCurrent = 0x%x\n", pptable->SocMaxCurrent);
-	pr_info("SocOffset = 0x%x\n", pptable->SocOffset);
-	pr_info("Padding_TelemetrySoc = 0x%x\n", pptable->Padding_TelemetrySoc);
-
-	pr_info("Mem0MaxCurrent = 0x%x\n", pptable->Mem0MaxCurrent);
-	pr_info("Mem0Offset = 0x%x\n", pptable->Mem0Offset);
-	pr_info("Padding_TelemetryMem0 = 0x%x\n", pptable->Padding_TelemetryMem0);
-
-	pr_info("Mem1MaxCurrent = 0x%x\n", pptable->Mem1MaxCurrent);
-	pr_info("Mem1Offset = 0x%x\n", pptable->Mem1Offset);
-	pr_info("Padding_TelemetryMem1 = 0x%x\n", pptable->Padding_TelemetryMem1);
-
-	pr_info("AcDcGpio = %d\n", pptable->AcDcGpio);
-	pr_info("AcDcPolarity = %d\n", pptable->AcDcPolarity);
-	pr_info("VR0HotGpio = %d\n", pptable->VR0HotGpio);
-	pr_info("VR0HotPolarity = %d\n", pptable->VR0HotPolarity);
-
-	pr_info("VR1HotGpio = %d\n", pptable->VR1HotGpio);
-	pr_info("VR1HotPolarity = %d\n", pptable->VR1HotPolarity);
-	pr_info("Padding1 = 0x%x\n", pptable->Padding1);
-	pr_info("Padding2 = 0x%x\n", pptable->Padding2);
-
-	pr_info("LedPin0 = %d\n", pptable->LedPin0);
-	pr_info("LedPin1 = %d\n", pptable->LedPin1);
-	pr_info("LedPin2 = %d\n", pptable->LedPin2);
-	pr_info("padding8_4 = 0x%x\n", pptable->padding8_4);
-
-	pr_info("PllGfxclkSpreadEnabled = %d\n", pptable->PllGfxclkSpreadEnabled);
-	pr_info("PllGfxclkSpreadPercent = %d\n", pptable->PllGfxclkSpreadPercent);
-	pr_info("PllGfxclkSpreadFreq = %d\n", pptable->PllGfxclkSpreadFreq);
-
-	pr_info("UclkSpreadEnabled = %d\n", pptable->UclkSpreadEnabled);
-	pr_info("UclkSpreadPercent = %d\n", pptable->UclkSpreadPercent);
-	pr_info("UclkSpreadFreq = %d\n", pptable->UclkSpreadFreq);
-
-	pr_info("FclkSpreadEnabled = %d\n", pptable->FclkSpreadEnabled);
-	pr_info("FclkSpreadPercent = %d\n", pptable->FclkSpreadPercent);
-	pr_info("FclkSpreadFreq = %d\n", pptable->FclkSpreadFreq);
-
-	pr_info("FllGfxclkSpreadEnabled = %d\n", pptable->FllGfxclkSpreadEnabled);
-	pr_info("FllGfxclkSpreadPercent = %d\n", pptable->FllGfxclkSpreadPercent);
-	pr_info("FllGfxclkSpreadFreq = %d\n", pptable->FllGfxclkSpreadFreq);
-
-	for (i = 0; i < I2C_CONTROLLER_NAME_COUNT; i++) {
-		pr_info("I2cControllers[%d]:\n", i);
-		pr_info("                   .Enabled = %d\n",
-				pptable->I2cControllers[i].Enabled);
-		pr_info("                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
-		pr_info("                   .ControllerPort = %d\n",
-				pptable->I2cControllers[i].ControllerPort);
-		pr_info("                   .ControllerName = %d\n",
-				pptable->I2cControllers[i].ControllerName);
-		pr_info("                   .ThermalThrottler = %d\n",
-				pptable->I2cControllers[i].ThermalThrottler);
-		pr_info("                   .I2cProtocol = %d\n",
-				pptable->I2cControllers[i].I2cProtocol);
-		pr_info("                   .I2cSpeed = %d\n",
-				pptable->I2cControllers[i].I2cSpeed);
-	}
-
-	for (i = 0; i < 10; i++)
-		pr_info("BoardReserved[%d] = 0x%x\n", i, pptable->BoardReserved[i]);
-
-	for (i = 0; i < 8; i++)
-		pr_info("MmHubPadding[%d] = 0x%x\n", i, pptable->MmHubPadding[i]);
-}
-#endif
-
 static int check_powerplay_tables(
 		struct pp_hwmgr *hwmgr,
 		const ATOM_Vega20_POWERPLAYTABLE *powerplay_table)
@@ -652,8 +80,6 @@ static int check_powerplay_tables(
 		return -EINVAL;
 	}
 
-	//dump_pptable(&powerplay_table->smcPPTable);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index b44a185d07e8..727da0c37e06 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -858,11 +858,6 @@ struct pptable_funcs {
 	 */
 	int (*display_disable_memory_clock_switch)(struct smu_context *smu, bool disable_memory_clock_switch);
 
-	/**
-	 * @dump_pptable: Print the power play table to the system log.
-	 */
-	void (*dump_pptable)(struct smu_context *smu);
-
 	/**
 	 * @get_power_limit: Get the device's power limits.
 	 */
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index c0f6b59369b7..5ad09323a29d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -1559,437 +1559,6 @@ static int arcturus_set_performance_level(struct smu_context *smu,
 	return smu_v11_0_set_performance_level(smu, level);
 }
 
-static void arcturus_dump_pptable(struct smu_context *smu)
-{
-	struct smu_table_context *table_context = &smu->smu_table;
-	PPTable_t *pptable = table_context->driver_pptable;
-	int i;
-
-	dev_info(smu->adev->dev, "Dumped PPTable:\n");
-
-	dev_info(smu->adev->dev, "Version = 0x%08x\n", pptable->Version);
-
-	dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", pptable->FeaturesToRun[0]);
-	dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", pptable->FeaturesToRun[1]);
-
-	for (i = 0; i < PPT_THROTTLER_COUNT; i++) {
-		dev_info(smu->adev->dev, "SocketPowerLimitAc[%d] = %d\n", i, pptable->SocketPowerLimitAc[i]);
-		dev_info(smu->adev->dev, "SocketPowerLimitAcTau[%d] = %d\n", i, pptable->SocketPowerLimitAcTau[i]);
-	}
-
-	dev_info(smu->adev->dev, "TdcLimitSoc = %d\n", pptable->TdcLimitSoc);
-	dev_info(smu->adev->dev, "TdcLimitSocTau = %d\n", pptable->TdcLimitSocTau);
-	dev_info(smu->adev->dev, "TdcLimitGfx = %d\n", pptable->TdcLimitGfx);
-	dev_info(smu->adev->dev, "TdcLimitGfxTau = %d\n", pptable->TdcLimitGfxTau);
-
-	dev_info(smu->adev->dev, "TedgeLimit = %d\n", pptable->TedgeLimit);
-	dev_info(smu->adev->dev, "ThotspotLimit = %d\n", pptable->ThotspotLimit);
-	dev_info(smu->adev->dev, "TmemLimit = %d\n", pptable->TmemLimit);
-	dev_info(smu->adev->dev, "Tvr_gfxLimit = %d\n", pptable->Tvr_gfxLimit);
-	dev_info(smu->adev->dev, "Tvr_memLimit = %d\n", pptable->Tvr_memLimit);
-	dev_info(smu->adev->dev, "Tvr_socLimit = %d\n", pptable->Tvr_socLimit);
-	dev_info(smu->adev->dev, "FitLimit = %d\n", pptable->FitLimit);
-
-	dev_info(smu->adev->dev, "PpmPowerLimit = %d\n", pptable->PpmPowerLimit);
-	dev_info(smu->adev->dev, "PpmTemperatureThreshold = %d\n", pptable->PpmTemperatureThreshold);
-
-	dev_info(smu->adev->dev, "ThrottlerControlMask = %d\n", pptable->ThrottlerControlMask);
-
-	dev_info(smu->adev->dev, "UlvVoltageOffsetGfx = %d\n", pptable->UlvVoltageOffsetGfx);
-	dev_info(smu->adev->dev, "UlvPadding = 0x%08x\n", pptable->UlvPadding);
-
-	dev_info(smu->adev->dev, "UlvGfxclkBypass = %d\n", pptable->UlvGfxclkBypass);
-	dev_info(smu->adev->dev, "Padding234[0] = 0x%02x\n", pptable->Padding234[0]);
-	dev_info(smu->adev->dev, "Padding234[1] = 0x%02x\n", pptable->Padding234[1]);
-	dev_info(smu->adev->dev, "Padding234[2] = 0x%02x\n", pptable->Padding234[2]);
-
-	dev_info(smu->adev->dev, "MinVoltageGfx = %d\n", pptable->MinVoltageGfx);
-	dev_info(smu->adev->dev, "MinVoltageSoc = %d\n", pptable->MinVoltageSoc);
-	dev_info(smu->adev->dev, "MaxVoltageGfx = %d\n", pptable->MaxVoltageGfx);
-	dev_info(smu->adev->dev, "MaxVoltageSoc = %d\n", pptable->MaxVoltageSoc);
-
-	dev_info(smu->adev->dev, "LoadLineResistanceGfx = %d\n", pptable->LoadLineResistanceGfx);
-	dev_info(smu->adev->dev, "LoadLineResistanceSoc = %d\n", pptable->LoadLineResistanceSoc);
-
-	dev_info(smu->adev->dev, "[PPCLK_GFXCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_GFXCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].padding,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_VCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_VCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_VCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_VCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_VCLK].padding,
-			pptable->DpmDescriptor[PPCLK_VCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_VCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_VCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_VCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_VCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_VCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_VCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_DCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_DCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_DCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_DCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_DCLK].padding,
-			pptable->DpmDescriptor[PPCLK_DCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_DCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_DCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_DCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_DCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_DCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_DCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_SOCCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_SOCCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].padding,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_UCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_UCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_UCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_UCLK].padding,
-			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_UCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_FCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_FCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_FCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_FCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_FCLK].padding,
-			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_FCLK].Padding16);
-
-
-	dev_info(smu->adev->dev, "FreqTableGfx\n");
-	for (i = 0; i < NUM_GFXCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableGfx[i]);
-
-	dev_info(smu->adev->dev, "FreqTableVclk\n");
-	for (i = 0; i < NUM_VCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableVclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableDclk\n");
-	for (i = 0; i < NUM_DCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableDclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableSocclk\n");
-	for (i = 0; i < NUM_SOCCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableSocclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableUclk\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableUclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableFclk\n");
-	for (i = 0; i < NUM_FCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = %d\n", i, pptable->FreqTableFclk[i]);
-
-	dev_info(smu->adev->dev, "Mp0clkFreq\n");
-	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->Mp0clkFreq[i]);
-
-	dev_info(smu->adev->dev, "Mp0DpmVoltage\n");
-	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->Mp0DpmVoltage[i]);
-
-	dev_info(smu->adev->dev, "GfxclkFidle = 0x%x\n", pptable->GfxclkFidle);
-	dev_info(smu->adev->dev, "GfxclkSlewRate = 0x%x\n", pptable->GfxclkSlewRate);
-	dev_info(smu->adev->dev, "Padding567[0] = 0x%x\n", pptable->Padding567[0]);
-	dev_info(smu->adev->dev, "Padding567[1] = 0x%x\n", pptable->Padding567[1]);
-	dev_info(smu->adev->dev, "Padding567[2] = 0x%x\n", pptable->Padding567[2]);
-	dev_info(smu->adev->dev, "Padding567[3] = 0x%x\n", pptable->Padding567[3]);
-	dev_info(smu->adev->dev, "GfxclkDsMaxFreq = %d\n", pptable->GfxclkDsMaxFreq);
-	dev_info(smu->adev->dev, "GfxclkSource = 0x%x\n", pptable->GfxclkSource);
-	dev_info(smu->adev->dev, "Padding456 = 0x%x\n", pptable->Padding456);
-
-	dev_info(smu->adev->dev, "EnableTdpm = %d\n", pptable->EnableTdpm);
-	dev_info(smu->adev->dev, "TdpmHighHystTemperature = %d\n", pptable->TdpmHighHystTemperature);
-	dev_info(smu->adev->dev, "TdpmLowHystTemperature = %d\n", pptable->TdpmLowHystTemperature);
-	dev_info(smu->adev->dev, "GfxclkFreqHighTempLimit = %d\n", pptable->GfxclkFreqHighTempLimit);
-
-	dev_info(smu->adev->dev, "FanStopTemp = %d\n", pptable->FanStopTemp);
-	dev_info(smu->adev->dev, "FanStartTemp = %d\n", pptable->FanStartTemp);
-
-	dev_info(smu->adev->dev, "FanGainEdge = %d\n", pptable->FanGainEdge);
-	dev_info(smu->adev->dev, "FanGainHotspot = %d\n", pptable->FanGainHotspot);
-	dev_info(smu->adev->dev, "FanGainVrGfx = %d\n", pptable->FanGainVrGfx);
-	dev_info(smu->adev->dev, "FanGainVrSoc = %d\n", pptable->FanGainVrSoc);
-	dev_info(smu->adev->dev, "FanGainVrMem = %d\n", pptable->FanGainVrMem);
-	dev_info(smu->adev->dev, "FanGainHbm = %d\n", pptable->FanGainHbm);
-
-	dev_info(smu->adev->dev, "FanPwmMin = %d\n", pptable->FanPwmMin);
-	dev_info(smu->adev->dev, "FanAcousticLimitRpm = %d\n", pptable->FanAcousticLimitRpm);
-	dev_info(smu->adev->dev, "FanThrottlingRpm = %d\n", pptable->FanThrottlingRpm);
-	dev_info(smu->adev->dev, "FanMaximumRpm = %d\n", pptable->FanMaximumRpm);
-	dev_info(smu->adev->dev, "FanTargetTemperature = %d\n", pptable->FanTargetTemperature);
-	dev_info(smu->adev->dev, "FanTargetGfxclk = %d\n", pptable->FanTargetGfxclk);
-	dev_info(smu->adev->dev, "FanZeroRpmEnable = %d\n", pptable->FanZeroRpmEnable);
-	dev_info(smu->adev->dev, "FanTachEdgePerRev = %d\n", pptable->FanTachEdgePerRev);
-	dev_info(smu->adev->dev, "FanTempInputSelect = %d\n", pptable->FanTempInputSelect);
-
-	dev_info(smu->adev->dev, "FuzzyFan_ErrorSetDelta = %d\n", pptable->FuzzyFan_ErrorSetDelta);
-	dev_info(smu->adev->dev, "FuzzyFan_ErrorRateSetDelta = %d\n", pptable->FuzzyFan_ErrorRateSetDelta);
-	dev_info(smu->adev->dev, "FuzzyFan_PwmSetDelta = %d\n", pptable->FuzzyFan_PwmSetDelta);
-	dev_info(smu->adev->dev, "FuzzyFan_Reserved = %d\n", pptable->FuzzyFan_Reserved);
-
-	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
-	dev_info(smu->adev->dev, "Padding8_Avfs[0] = %d\n", pptable->Padding8_Avfs[0]);
-	dev_info(smu->adev->dev, "Padding8_Avfs[1] = %d\n", pptable->Padding8_Avfs[1]);
-
-	dev_info(smu->adev->dev, "dBtcGbGfxPll{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbGfxPll.a,
-			pptable->dBtcGbGfxPll.b,
-			pptable->dBtcGbGfxPll.c);
-	dev_info(smu->adev->dev, "dBtcGbGfxAfll{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbGfxAfll.a,
-			pptable->dBtcGbGfxAfll.b,
-			pptable->dBtcGbGfxAfll.c);
-	dev_info(smu->adev->dev, "dBtcGbSoc{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbSoc.a,
-			pptable->dBtcGbSoc.b,
-			pptable->dBtcGbSoc.c);
-
-	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_GFX]{m = 0x%x b = 0x%x}\n",
-			pptable->qAgingGb[AVFS_VOLTAGE_GFX].m,
-			pptable->qAgingGb[AVFS_VOLTAGE_GFX].b);
-	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_SOC]{m = 0x%x b = 0x%x}\n",
-			pptable->qAgingGb[AVFS_VOLTAGE_SOC].m,
-			pptable->qAgingGb[AVFS_VOLTAGE_SOC].b);
-
-	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].a,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].b,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].c);
-	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].a,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].b,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].c);
-
-	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
-
-	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
-	dev_info(smu->adev->dev, "Padding8_GfxBtc[0] = 0x%x\n", pptable->Padding8_GfxBtc[0]);
-	dev_info(smu->adev->dev, "Padding8_GfxBtc[1] = 0x%x\n", pptable->Padding8_GfxBtc[1]);
-
-	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
-	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
-
-	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
-
-	dev_info(smu->adev->dev, "XgmiDpmPstates\n");
-	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiDpmPstates[i]);
-	dev_info(smu->adev->dev, "XgmiDpmSpare[0] = 0x%02x\n", pptable->XgmiDpmSpare[0]);
-	dev_info(smu->adev->dev, "XgmiDpmSpare[1] = 0x%02x\n", pptable->XgmiDpmSpare[1]);
-
-	dev_info(smu->adev->dev, "VDDGFX_TVmin = %d\n", pptable->VDDGFX_TVmin);
-	dev_info(smu->adev->dev, "VDDSOC_TVmin = %d\n", pptable->VDDSOC_TVmin);
-	dev_info(smu->adev->dev, "VDDGFX_Vmin_HiTemp = %d\n", pptable->VDDGFX_Vmin_HiTemp);
-	dev_info(smu->adev->dev, "VDDGFX_Vmin_LoTemp = %d\n", pptable->VDDGFX_Vmin_LoTemp);
-	dev_info(smu->adev->dev, "VDDSOC_Vmin_HiTemp = %d\n", pptable->VDDSOC_Vmin_HiTemp);
-	dev_info(smu->adev->dev, "VDDSOC_Vmin_LoTemp = %d\n", pptable->VDDSOC_Vmin_LoTemp);
-	dev_info(smu->adev->dev, "VDDGFX_TVminHystersis = %d\n", pptable->VDDGFX_TVminHystersis);
-	dev_info(smu->adev->dev, "VDDSOC_TVminHystersis = %d\n", pptable->VDDSOC_TVminHystersis);
-
-	dev_info(smu->adev->dev, "DebugOverrides = 0x%x\n", pptable->DebugOverrides);
-	dev_info(smu->adev->dev, "ReservedEquation0{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation0.a,
-			pptable->ReservedEquation0.b,
-			pptable->ReservedEquation0.c);
-	dev_info(smu->adev->dev, "ReservedEquation1{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation1.a,
-			pptable->ReservedEquation1.b,
-			pptable->ReservedEquation1.c);
-	dev_info(smu->adev->dev, "ReservedEquation2{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation2.a,
-			pptable->ReservedEquation2.b,
-			pptable->ReservedEquation2.c);
-	dev_info(smu->adev->dev, "ReservedEquation3{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation3.a,
-			pptable->ReservedEquation3.b,
-			pptable->ReservedEquation3.c);
-
-	dev_info(smu->adev->dev, "MinVoltageUlvGfx = %d\n", pptable->MinVoltageUlvGfx);
-	dev_info(smu->adev->dev, "PaddingUlv = %d\n", pptable->PaddingUlv);
-
-	dev_info(smu->adev->dev, "TotalPowerConfig = %d\n", pptable->TotalPowerConfig);
-	dev_info(smu->adev->dev, "TotalPowerSpare1 = %d\n", pptable->TotalPowerSpare1);
-	dev_info(smu->adev->dev, "TotalPowerSpare2 = %d\n", pptable->TotalPowerSpare2);
-
-	dev_info(smu->adev->dev, "PccThresholdLow = %d\n", pptable->PccThresholdLow);
-	dev_info(smu->adev->dev, "PccThresholdHigh = %d\n", pptable->PccThresholdHigh);
-
-	dev_info(smu->adev->dev, "Board Parameters:\n");
-	dev_info(smu->adev->dev, "MaxVoltageStepGfx = 0x%x\n", pptable->MaxVoltageStepGfx);
-	dev_info(smu->adev->dev, "MaxVoltageStepSoc = 0x%x\n", pptable->MaxVoltageStepSoc);
-
-	dev_info(smu->adev->dev, "VddGfxVrMapping = 0x%x\n", pptable->VddGfxVrMapping);
-	dev_info(smu->adev->dev, "VddSocVrMapping = 0x%x\n", pptable->VddSocVrMapping);
-	dev_info(smu->adev->dev, "VddMemVrMapping = 0x%x\n", pptable->VddMemVrMapping);
-	dev_info(smu->adev->dev, "BoardVrMapping = 0x%x\n", pptable->BoardVrMapping);
-
-	dev_info(smu->adev->dev, "GfxUlvPhaseSheddingMask = 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
-	dev_info(smu->adev->dev, "ExternalSensorPresent = 0x%x\n", pptable->ExternalSensorPresent);
-
-	dev_info(smu->adev->dev, "GfxMaxCurrent = 0x%x\n", pptable->GfxMaxCurrent);
-	dev_info(smu->adev->dev, "GfxOffset = 0x%x\n", pptable->GfxOffset);
-	dev_info(smu->adev->dev, "Padding_TelemetryGfx = 0x%x\n", pptable->Padding_TelemetryGfx);
-
-	dev_info(smu->adev->dev, "SocMaxCurrent = 0x%x\n", pptable->SocMaxCurrent);
-	dev_info(smu->adev->dev, "SocOffset = 0x%x\n", pptable->SocOffset);
-	dev_info(smu->adev->dev, "Padding_TelemetrySoc = 0x%x\n", pptable->Padding_TelemetrySoc);
-
-	dev_info(smu->adev->dev, "MemMaxCurrent = 0x%x\n", pptable->MemMaxCurrent);
-	dev_info(smu->adev->dev, "MemOffset = 0x%x\n", pptable->MemOffset);
-	dev_info(smu->adev->dev, "Padding_TelemetryMem = 0x%x\n", pptable->Padding_TelemetryMem);
-
-	dev_info(smu->adev->dev, "BoardMaxCurrent = 0x%x\n", pptable->BoardMaxCurrent);
-	dev_info(smu->adev->dev, "BoardOffset = 0x%x\n", pptable->BoardOffset);
-	dev_info(smu->adev->dev, "Padding_TelemetryBoardInput = 0x%x\n", pptable->Padding_TelemetryBoardInput);
-
-	dev_info(smu->adev->dev, "VR0HotGpio = %d\n", pptable->VR0HotGpio);
-	dev_info(smu->adev->dev, "VR0HotPolarity = %d\n", pptable->VR0HotPolarity);
-	dev_info(smu->adev->dev, "VR1HotGpio = %d\n", pptable->VR1HotGpio);
-	dev_info(smu->adev->dev, "VR1HotPolarity = %d\n", pptable->VR1HotPolarity);
-
-	dev_info(smu->adev->dev, "PllGfxclkSpreadEnabled = %d\n", pptable->PllGfxclkSpreadEnabled);
-	dev_info(smu->adev->dev, "PllGfxclkSpreadPercent = %d\n", pptable->PllGfxclkSpreadPercent);
-	dev_info(smu->adev->dev, "PllGfxclkSpreadFreq = %d\n", pptable->PllGfxclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "UclkSpreadEnabled = %d\n", pptable->UclkSpreadEnabled);
-	dev_info(smu->adev->dev, "UclkSpreadPercent = %d\n", pptable->UclkSpreadPercent);
-	dev_info(smu->adev->dev, "UclkSpreadFreq = %d\n", pptable->UclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "FclkSpreadEnabled = %d\n", pptable->FclkSpreadEnabled);
-	dev_info(smu->adev->dev, "FclkSpreadPercent = %d\n", pptable->FclkSpreadPercent);
-	dev_info(smu->adev->dev, "FclkSpreadFreq = %d\n", pptable->FclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "FllGfxclkSpreadEnabled = %d\n", pptable->FllGfxclkSpreadEnabled);
-	dev_info(smu->adev->dev, "FllGfxclkSpreadPercent = %d\n", pptable->FllGfxclkSpreadPercent);
-	dev_info(smu->adev->dev, "FllGfxclkSpreadFreq = %d\n", pptable->FllGfxclkSpreadFreq);
-
-	for (i = 0; i < NUM_I2C_CONTROLLERS; i++) {
-		dev_info(smu->adev->dev, "I2cControllers[%d]:\n", i);
-		dev_info(smu->adev->dev, "                   .Enabled = %d\n",
-				pptable->I2cControllers[i].Enabled);
-		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
-		dev_info(smu->adev->dev, "                   .ControllerPort = %d\n",
-				pptable->I2cControllers[i].ControllerPort);
-		dev_info(smu->adev->dev, "                   .ControllerName = %d\n",
-				pptable->I2cControllers[i].ControllerName);
-		dev_info(smu->adev->dev, "                   .ThermalThrottler = %d\n",
-				pptable->I2cControllers[i].ThermalThrotter);
-		dev_info(smu->adev->dev, "                   .I2cProtocol = %d\n",
-				pptable->I2cControllers[i].I2cProtocol);
-		dev_info(smu->adev->dev, "                   .Speed = %d\n",
-				pptable->I2cControllers[i].Speed);
-	}
-
-	dev_info(smu->adev->dev, "MemoryChannelEnabled = %d\n", pptable->MemoryChannelEnabled);
-	dev_info(smu->adev->dev, "DramBitWidth = %d\n", pptable->DramBitWidth);
-
-	dev_info(smu->adev->dev, "TotalBoardPower = %d\n", pptable->TotalBoardPower);
-
-	dev_info(smu->adev->dev, "XgmiLinkSpeed\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiLinkSpeed[i]);
-	dev_info(smu->adev->dev, "XgmiLinkWidth\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiLinkWidth[i]);
-	dev_info(smu->adev->dev, "XgmiFclkFreq\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiFclkFreq[i]);
-	dev_info(smu->adev->dev, "XgmiSocVoltage\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = %d\n", i, pptable->XgmiSocVoltage[i]);
-
-}
-
 static bool arcturus_is_dpm_running(struct smu_context *smu)
 {
 	int ret = 0;
@@ -2365,8 +1934,6 @@ static const struct pptable_funcs arcturus_ppt_funcs = {
 	.get_power_profile_mode = arcturus_get_power_profile_mode,
 	.set_power_profile_mode = arcturus_set_power_profile_mode,
 	.set_performance_level = arcturus_set_performance_level,
-	/* debug (internal used) */
-	.dump_pptable = arcturus_dump_pptable,
 	.get_power_limit = arcturus_get_power_limit,
 	.is_dpm_running = arcturus_is_dpm_running,
 	.dpm_set_vcn_enable = arcturus_dpm_set_vcn_enable,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 9c3c48297cba..3b29cb74c47b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -2493,1274 +2493,6 @@ static bool sienna_cichlid_is_mode1_reset_supported(struct smu_context *smu)
 	return val != 0x0;
 }
 
-static void beige_goby_dump_pptable(struct smu_context *smu)
-{
-	struct smu_table_context *table_context = &smu->smu_table;
-	PPTable_beige_goby_t *pptable = table_context->driver_pptable;
-	int i;
-
-	dev_info(smu->adev->dev, "Dumped PPTable:\n");
-
-	dev_info(smu->adev->dev, "Version = 0x%08x\n", pptable->Version);
-	dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", pptable->FeaturesToRun[0]);
-	dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", pptable->FeaturesToRun[1]);
-
-	for (i = 0; i < PPT_THROTTLER_COUNT; i++) {
-		dev_info(smu->adev->dev, "SocketPowerLimitAc[%d] = 0x%x\n", i, pptable->SocketPowerLimitAc[i]);
-		dev_info(smu->adev->dev, "SocketPowerLimitAcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitAcTau[i]);
-		dev_info(smu->adev->dev, "SocketPowerLimitDc[%d] = 0x%x\n", i, pptable->SocketPowerLimitDc[i]);
-		dev_info(smu->adev->dev, "SocketPowerLimitDcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitDcTau[i]);
-	}
-
-	for (i = 0; i < TDC_THROTTLER_COUNT; i++) {
-		dev_info(smu->adev->dev, "TdcLimit[%d] = 0x%x\n", i, pptable->TdcLimit[i]);
-		dev_info(smu->adev->dev, "TdcLimitTau[%d] = 0x%x\n", i, pptable->TdcLimitTau[i]);
-	}
-
-	for (i = 0; i < TEMP_COUNT; i++) {
-		dev_info(smu->adev->dev, "TemperatureLimit[%d] = 0x%x\n", i, pptable->TemperatureLimit[i]);
-	}
-
-	dev_info(smu->adev->dev, "FitLimit = 0x%x\n", pptable->FitLimit);
-	dev_info(smu->adev->dev, "TotalPowerConfig = 0x%x\n", pptable->TotalPowerConfig);
-	dev_info(smu->adev->dev, "TotalPowerPadding[0] = 0x%x\n", pptable->TotalPowerPadding[0]);
-	dev_info(smu->adev->dev, "TotalPowerPadding[1] = 0x%x\n", pptable->TotalPowerPadding[1]);
-	dev_info(smu->adev->dev, "TotalPowerPadding[2] = 0x%x\n", pptable->TotalPowerPadding[2]);
-
-	dev_info(smu->adev->dev, "ApccPlusResidencyLimit = 0x%x\n", pptable->ApccPlusResidencyLimit);
-	for (i = 0; i < NUM_SMNCLK_DPM_LEVELS; i++) {
-		dev_info(smu->adev->dev, "SmnclkDpmFreq[%d] = 0x%x\n", i, pptable->SmnclkDpmFreq[i]);
-		dev_info(smu->adev->dev, "SmnclkDpmVoltage[%d] = 0x%x\n", i, pptable->SmnclkDpmVoltage[i]);
-	}
-	dev_info(smu->adev->dev, "ThrottlerControlMask = 0x%x\n", pptable->ThrottlerControlMask);
-
-	dev_info(smu->adev->dev, "FwDStateMask = 0x%x\n", pptable->FwDStateMask);
-
-	dev_info(smu->adev->dev, "UlvVoltageOffsetSoc = 0x%x\n", pptable->UlvVoltageOffsetSoc);
-	dev_info(smu->adev->dev, "UlvVoltageOffsetGfx = 0x%x\n", pptable->UlvVoltageOffsetGfx);
-	dev_info(smu->adev->dev, "MinVoltageUlvGfx = 0x%x\n", pptable->MinVoltageUlvGfx);
-	dev_info(smu->adev->dev, "MinVoltageUlvSoc = 0x%x\n", pptable->MinVoltageUlvSoc);
-
-	dev_info(smu->adev->dev, "SocLIVmin = 0x%x\n", pptable->SocLIVmin);
-
-	dev_info(smu->adev->dev, "GceaLinkMgrIdleThreshold = 0x%x\n", pptable->GceaLinkMgrIdleThreshold);
-
-	dev_info(smu->adev->dev, "MinVoltageGfx = 0x%x\n", pptable->MinVoltageGfx);
-	dev_info(smu->adev->dev, "MinVoltageSoc = 0x%x\n", pptable->MinVoltageSoc);
-	dev_info(smu->adev->dev, "MaxVoltageGfx = 0x%x\n", pptable->MaxVoltageGfx);
-	dev_info(smu->adev->dev, "MaxVoltageSoc = 0x%x\n", pptable->MaxVoltageSoc);
-
-	dev_info(smu->adev->dev, "LoadLineResistanceGfx = 0x%x\n", pptable->LoadLineResistanceGfx);
-	dev_info(smu->adev->dev, "LoadLineResistanceSoc = 0x%x\n", pptable->LoadLineResistanceSoc);
-
-	dev_info(smu->adev->dev, "VDDGFX_TVmin = 0x%x\n", pptable->VDDGFX_TVmin);
-	dev_info(smu->adev->dev, "VDDSOC_TVmin = 0x%x\n", pptable->VDDSOC_TVmin);
-	dev_info(smu->adev->dev, "VDDGFX_Vmin_HiTemp = 0x%x\n", pptable->VDDGFX_Vmin_HiTemp);
-	dev_info(smu->adev->dev, "VDDGFX_Vmin_LoTemp = 0x%x\n", pptable->VDDGFX_Vmin_LoTemp);
-	dev_info(smu->adev->dev, "VDDSOC_Vmin_HiTemp = 0x%x\n", pptable->VDDSOC_Vmin_HiTemp);
-	dev_info(smu->adev->dev, "VDDSOC_Vmin_LoTemp = 0x%x\n", pptable->VDDSOC_Vmin_LoTemp);
-	dev_info(smu->adev->dev, "VDDGFX_TVminHystersis = 0x%x\n", pptable->VDDGFX_TVminHystersis);
-	dev_info(smu->adev->dev, "VDDSOC_TVminHystersis = 0x%x\n", pptable->VDDSOC_TVminHystersis);
-
-	dev_info(smu->adev->dev, "[PPCLK_GFXCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_GFXCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_SOCCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_SOCCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_UCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_UCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_UCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_UCLK].Padding,
-			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_UCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_FCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_FCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_FCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_FCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_FCLK].Padding,
-			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_FCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_DCLK_0]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_DCLK_0].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].Padding,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SsFmin,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_VCLK_0]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_VCLK_0].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].Padding,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SsFmin,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_DCLK_1]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_DCLK_1].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].Padding,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SsFmin,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_VCLK_1]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_VCLK_1].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].Padding,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SsFmin,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].Padding16);
-
-	dev_info(smu->adev->dev, "FreqTableGfx\n");
-	for (i = 0; i < NUM_GFXCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableGfx[i]);
-
-	dev_info(smu->adev->dev, "FreqTableVclk\n");
-	for (i = 0; i < NUM_VCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableVclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableDclk\n");
-	for (i = 0; i < NUM_DCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableDclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableSocclk\n");
-	for (i = 0; i < NUM_SOCCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableSocclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableUclk\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableUclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableFclk\n");
-	for (i = 0; i < NUM_FCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableFclk[i]);
-
-	dev_info(smu->adev->dev, "DcModeMaxFreq\n");
-	dev_info(smu->adev->dev, "  .PPCLK_GFXCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_GFXCLK]);
-	dev_info(smu->adev->dev, "  .PPCLK_SOCCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_SOCCLK]);
-	dev_info(smu->adev->dev, "  .PPCLK_UCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_UCLK]);
-	dev_info(smu->adev->dev, "  .PPCLK_FCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_FCLK]);
-	dev_info(smu->adev->dev, "  .PPCLK_DCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_0]);
-	dev_info(smu->adev->dev, "  .PPCLK_VCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_0]);
-	dev_info(smu->adev->dev, "  .PPCLK_DCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_1]);
-	dev_info(smu->adev->dev, "  .PPCLK_VCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_1]);
-
-	dev_info(smu->adev->dev, "FreqTableUclkDiv\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->FreqTableUclkDiv[i]);
-
-	dev_info(smu->adev->dev, "FclkBoostFreq = 0x%x\n", pptable->FclkBoostFreq);
-	dev_info(smu->adev->dev, "FclkParamPadding = 0x%x\n", pptable->FclkParamPadding);
-
-	dev_info(smu->adev->dev, "Mp0clkFreq\n");
-	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->Mp0clkFreq[i]);
-
-	dev_info(smu->adev->dev, "Mp0DpmVoltage\n");
-	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->Mp0DpmVoltage[i]);
-
-	dev_info(smu->adev->dev, "MemVddciVoltage\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->MemVddciVoltage[i]);
-
-	dev_info(smu->adev->dev, "MemMvddVoltage\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->MemMvddVoltage[i]);
-
-	dev_info(smu->adev->dev, "GfxclkFgfxoffEntry = 0x%x\n", pptable->GfxclkFgfxoffEntry);
-	dev_info(smu->adev->dev, "GfxclkFinit = 0x%x\n", pptable->GfxclkFinit);
-	dev_info(smu->adev->dev, "GfxclkFidle = 0x%x\n", pptable->GfxclkFidle);
-	dev_info(smu->adev->dev, "GfxclkSource = 0x%x\n", pptable->GfxclkSource);
-	dev_info(smu->adev->dev, "GfxclkPadding = 0x%x\n", pptable->GfxclkPadding);
-
-	dev_info(smu->adev->dev, "GfxGpoSubFeatureMask = 0x%x\n", pptable->GfxGpoSubFeatureMask);
-
-	dev_info(smu->adev->dev, "GfxGpoEnabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoEnabledWorkPolicyMask);
-	dev_info(smu->adev->dev, "GfxGpoDisabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoDisabledWorkPolicyMask);
-	dev_info(smu->adev->dev, "GfxGpoPadding[0] = 0x%x\n", pptable->GfxGpoPadding[0]);
-	dev_info(smu->adev->dev, "GfxGpoVotingAllow = 0x%x\n", pptable->GfxGpoVotingAllow);
-	dev_info(smu->adev->dev, "GfxGpoPadding32[0] = 0x%x\n", pptable->GfxGpoPadding32[0]);
-	dev_info(smu->adev->dev, "GfxGpoPadding32[1] = 0x%x\n", pptable->GfxGpoPadding32[1]);
-	dev_info(smu->adev->dev, "GfxGpoPadding32[2] = 0x%x\n", pptable->GfxGpoPadding32[2]);
-	dev_info(smu->adev->dev, "GfxGpoPadding32[3] = 0x%x\n", pptable->GfxGpoPadding32[3]);
-	dev_info(smu->adev->dev, "GfxDcsFopt = 0x%x\n", pptable->GfxDcsFopt);
-	dev_info(smu->adev->dev, "GfxDcsFclkFopt = 0x%x\n", pptable->GfxDcsFclkFopt);
-	dev_info(smu->adev->dev, "GfxDcsUclkFopt = 0x%x\n", pptable->GfxDcsUclkFopt);
-
-	dev_info(smu->adev->dev, "DcsGfxOffVoltage = 0x%x\n", pptable->DcsGfxOffVoltage);
-	dev_info(smu->adev->dev, "DcsMinGfxOffTime = 0x%x\n", pptable->DcsMinGfxOffTime);
-	dev_info(smu->adev->dev, "DcsMaxGfxOffTime = 0x%x\n", pptable->DcsMaxGfxOffTime);
-	dev_info(smu->adev->dev, "DcsMinCreditAccum = 0x%x\n", pptable->DcsMinCreditAccum);
-	dev_info(smu->adev->dev, "DcsExitHysteresis = 0x%x\n", pptable->DcsExitHysteresis);
-	dev_info(smu->adev->dev, "DcsTimeout = 0x%x\n", pptable->DcsTimeout);
-
-	dev_info(smu->adev->dev, "DcsParamPadding[0] = 0x%x\n", pptable->DcsParamPadding[0]);
-	dev_info(smu->adev->dev, "DcsParamPadding[1] = 0x%x\n", pptable->DcsParamPadding[1]);
-	dev_info(smu->adev->dev, "DcsParamPadding[2] = 0x%x\n", pptable->DcsParamPadding[2]);
-	dev_info(smu->adev->dev, "DcsParamPadding[3] = 0x%x\n", pptable->DcsParamPadding[3]);
-	dev_info(smu->adev->dev, "DcsParamPadding[4] = 0x%x\n", pptable->DcsParamPadding[4]);
-
-	dev_info(smu->adev->dev, "FlopsPerByteTable\n");
-	for (i = 0; i < RLC_PACE_TABLE_NUM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->FlopsPerByteTable[i]);
-
-	dev_info(smu->adev->dev, "LowestUclkReservedForUlv = 0x%x\n", pptable->LowestUclkReservedForUlv);
-	dev_info(smu->adev->dev, "vddingMem[0] = 0x%x\n", pptable->PaddingMem[0]);
-	dev_info(smu->adev->dev, "vddingMem[1] = 0x%x\n", pptable->PaddingMem[1]);
-	dev_info(smu->adev->dev, "vddingMem[2] = 0x%x\n", pptable->PaddingMem[2]);
-
-	dev_info(smu->adev->dev, "UclkDpmPstates\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->UclkDpmPstates[i]);
-
-	dev_info(smu->adev->dev, "UclkDpmSrcFreqRange\n");
-	dev_info(smu->adev->dev, "  .Fmin = 0x%x\n",
-		pptable->UclkDpmSrcFreqRange.Fmin);
-	dev_info(smu->adev->dev, "  .Fmax = 0x%x\n",
-		pptable->UclkDpmSrcFreqRange.Fmax);
-	dev_info(smu->adev->dev, "UclkDpmTargFreqRange\n");
-	dev_info(smu->adev->dev, "  .Fmin = 0x%x\n",
-		pptable->UclkDpmTargFreqRange.Fmin);
-	dev_info(smu->adev->dev, "  .Fmax = 0x%x\n",
-		pptable->UclkDpmTargFreqRange.Fmax);
-	dev_info(smu->adev->dev, "UclkDpmMidstepFreq = 0x%x\n", pptable->UclkDpmMidstepFreq);
-	dev_info(smu->adev->dev, "UclkMidstepPadding = 0x%x\n", pptable->UclkMidstepPadding);
-
-	dev_info(smu->adev->dev, "PcieGenSpeed\n");
-	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->PcieGenSpeed[i]);
-
-	dev_info(smu->adev->dev, "PcieLaneCount\n");
-	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->PcieLaneCount[i]);
-
-	dev_info(smu->adev->dev, "LclkFreq\n");
-	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->LclkFreq[i]);
-
-	dev_info(smu->adev->dev, "FanStopTemp = 0x%x\n", pptable->FanStopTemp);
-	dev_info(smu->adev->dev, "FanStartTemp = 0x%x\n", pptable->FanStartTemp);
-
-	dev_info(smu->adev->dev, "FanGain\n");
-	for (i = 0; i < TEMP_COUNT; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->FanGain[i]);
-
-	dev_info(smu->adev->dev, "FanPwmMin = 0x%x\n", pptable->FanPwmMin);
-	dev_info(smu->adev->dev, "FanAcousticLimitRpm = 0x%x\n", pptable->FanAcousticLimitRpm);
-	dev_info(smu->adev->dev, "FanThrottlingRpm = 0x%x\n", pptable->FanThrottlingRpm);
-	dev_info(smu->adev->dev, "FanMaximumRpm = 0x%x\n", pptable->FanMaximumRpm);
-	dev_info(smu->adev->dev, "MGpuFanBoostLimitRpm = 0x%x\n", pptable->MGpuFanBoostLimitRpm);
-	dev_info(smu->adev->dev, "FanTargetTemperature = 0x%x\n", pptable->FanTargetTemperature);
-	dev_info(smu->adev->dev, "FanTargetGfxclk = 0x%x\n", pptable->FanTargetGfxclk);
-	dev_info(smu->adev->dev, "FanPadding16 = 0x%x\n", pptable->FanPadding16);
-	dev_info(smu->adev->dev, "FanTempInputSelect = 0x%x\n", pptable->FanTempInputSelect);
-	dev_info(smu->adev->dev, "FanPadding = 0x%x\n", pptable->FanPadding);
-	dev_info(smu->adev->dev, "FanZeroRpmEnable = 0x%x\n", pptable->FanZeroRpmEnable);
-	dev_info(smu->adev->dev, "FanTachEdgePerRev = 0x%x\n", pptable->FanTachEdgePerRev);
-
-	dev_info(smu->adev->dev, "FuzzyFan_ErrorSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorSetDelta);
-	dev_info(smu->adev->dev, "FuzzyFan_ErrorRateSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorRateSetDelta);
-	dev_info(smu->adev->dev, "FuzzyFan_PwmSetDelta = 0x%x\n", pptable->FuzzyFan_PwmSetDelta);
-	dev_info(smu->adev->dev, "FuzzyFan_Reserved = 0x%x\n", pptable->FuzzyFan_Reserved);
-
-	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
-	dev_info(smu->adev->dev, "dBtcGbGfxDfllModelSelect = 0x%x\n", pptable->dBtcGbGfxDfllModelSelect);
-	dev_info(smu->adev->dev, "Padding8_Avfs = 0x%x\n", pptable->Padding8_Avfs);
-
-	dev_info(smu->adev->dev, "qAvfsGb[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].a,
-			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].b,
-			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].c);
-	dev_info(smu->adev->dev, "qAvfsGb[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].a,
-			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].b,
-			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].c);
-	dev_info(smu->adev->dev, "dBtcGbGfxPll{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbGfxPll.a,
-			pptable->dBtcGbGfxPll.b,
-			pptable->dBtcGbGfxPll.c);
-	dev_info(smu->adev->dev, "dBtcGbGfxAfll{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbGfxDfll.a,
-			pptable->dBtcGbGfxDfll.b,
-			pptable->dBtcGbGfxDfll.c);
-	dev_info(smu->adev->dev, "dBtcGbSoc{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbSoc.a,
-			pptable->dBtcGbSoc.b,
-			pptable->dBtcGbSoc.c);
-	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_GFX]{m = 0x%x b = 0x%x}\n",
-			pptable->qAgingGb[AVFS_VOLTAGE_GFX].m,
-			pptable->qAgingGb[AVFS_VOLTAGE_GFX].b);
-	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_SOC]{m = 0x%x b = 0x%x}\n",
-			pptable->qAgingGb[AVFS_VOLTAGE_SOC].m,
-			pptable->qAgingGb[AVFS_VOLTAGE_SOC].b);
-
-	dev_info(smu->adev->dev, "PiecewiseLinearDroopIntGfxDfll\n");
-	for (i = 0; i < NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS; i++) {
-		dev_info(smu->adev->dev, "		Fset[%d] = 0x%x\n",
-			i, pptable->PiecewiseLinearDroopIntGfxDfll.Fset[i]);
-		dev_info(smu->adev->dev, "		Vdroop[%d] = 0x%x\n",
-			i, pptable->PiecewiseLinearDroopIntGfxDfll.Vdroop[i]);
-	}
-
-	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].a,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].b,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].c);
-	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].a,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].b,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].c);
-
-	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
-
-	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
-	dev_info(smu->adev->dev, "Padding8_GfxBtc[0] = 0x%x\n", pptable->Padding8_GfxBtc[0]);
-	dev_info(smu->adev->dev, "Padding8_GfxBtc[1] = 0x%x\n", pptable->Padding8_GfxBtc[1]);
-
-	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
-	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
-
-	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
-
-	dev_info(smu->adev->dev, "XgmiDpmPstates\n");
-	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiDpmPstates[i]);
-	dev_info(smu->adev->dev, "XgmiDpmSpare[0] = 0x%02x\n", pptable->XgmiDpmSpare[0]);
-	dev_info(smu->adev->dev, "XgmiDpmSpare[1] = 0x%02x\n", pptable->XgmiDpmSpare[1]);
-
-	dev_info(smu->adev->dev, "DebugOverrides = 0x%x\n", pptable->DebugOverrides);
-	dev_info(smu->adev->dev, "ReservedEquation0{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation0.a,
-			pptable->ReservedEquation0.b,
-			pptable->ReservedEquation0.c);
-	dev_info(smu->adev->dev, "ReservedEquation1{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation1.a,
-			pptable->ReservedEquation1.b,
-			pptable->ReservedEquation1.c);
-	dev_info(smu->adev->dev, "ReservedEquation2{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation2.a,
-			pptable->ReservedEquation2.b,
-			pptable->ReservedEquation2.c);
-	dev_info(smu->adev->dev, "ReservedEquation3{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation3.a,
-			pptable->ReservedEquation3.b,
-			pptable->ReservedEquation3.c);
-
-	dev_info(smu->adev->dev, "SkuReserved[0] = 0x%x\n", pptable->SkuReserved[0]);
-	dev_info(smu->adev->dev, "SkuReserved[1] = 0x%x\n", pptable->SkuReserved[1]);
-	dev_info(smu->adev->dev, "SkuReserved[2] = 0x%x\n", pptable->SkuReserved[2]);
-	dev_info(smu->adev->dev, "SkuReserved[3] = 0x%x\n", pptable->SkuReserved[3]);
-	dev_info(smu->adev->dev, "SkuReserved[4] = 0x%x\n", pptable->SkuReserved[4]);
-	dev_info(smu->adev->dev, "SkuReserved[5] = 0x%x\n", pptable->SkuReserved[5]);
-	dev_info(smu->adev->dev, "SkuReserved[6] = 0x%x\n", pptable->SkuReserved[6]);
-	dev_info(smu->adev->dev, "SkuReserved[7] = 0x%x\n", pptable->SkuReserved[7]);
-
-	dev_info(smu->adev->dev, "GamingClk[0] = 0x%x\n", pptable->GamingClk[0]);
-	dev_info(smu->adev->dev, "GamingClk[1] = 0x%x\n", pptable->GamingClk[1]);
-	dev_info(smu->adev->dev, "GamingClk[2] = 0x%x\n", pptable->GamingClk[2]);
-	dev_info(smu->adev->dev, "GamingClk[3] = 0x%x\n", pptable->GamingClk[3]);
-	dev_info(smu->adev->dev, "GamingClk[4] = 0x%x\n", pptable->GamingClk[4]);
-	dev_info(smu->adev->dev, "GamingClk[5] = 0x%x\n", pptable->GamingClk[5]);
-
-	for (i = 0; i < NUM_I2C_CONTROLLERS; i++) {
-		dev_info(smu->adev->dev, "I2cControllers[%d]:\n", i);
-		dev_info(smu->adev->dev, "                   .Enabled = 0x%x\n",
-				pptable->I2cControllers[i].Enabled);
-		dev_info(smu->adev->dev, "                   .Speed = 0x%x\n",
-				pptable->I2cControllers[i].Speed);
-		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
-		dev_info(smu->adev->dev, "                   .ControllerPort = 0x%x\n",
-				pptable->I2cControllers[i].ControllerPort);
-		dev_info(smu->adev->dev, "                   .ControllerName = 0x%x\n",
-				pptable->I2cControllers[i].ControllerName);
-		dev_info(smu->adev->dev, "                   .ThermalThrottler = 0x%x\n",
-				pptable->I2cControllers[i].ThermalThrotter);
-		dev_info(smu->adev->dev, "                   .I2cProtocol = 0x%x\n",
-				pptable->I2cControllers[i].I2cProtocol);
-		dev_info(smu->adev->dev, "                   .PaddingConfig = 0x%x\n",
-				pptable->I2cControllers[i].PaddingConfig);
-	}
-
-	dev_info(smu->adev->dev, "GpioScl = 0x%x\n", pptable->GpioScl);
-	dev_info(smu->adev->dev, "GpioSda = 0x%x\n", pptable->GpioSda);
-	dev_info(smu->adev->dev, "FchUsbPdSlaveAddr = 0x%x\n", pptable->FchUsbPdSlaveAddr);
-	dev_info(smu->adev->dev, "I2cSpare[0] = 0x%x\n", pptable->I2cSpare[0]);
-
-	dev_info(smu->adev->dev, "Board Parameters:\n");
-	dev_info(smu->adev->dev, "VddGfxVrMapping = 0x%x\n", pptable->VddGfxVrMapping);
-	dev_info(smu->adev->dev, "VddSocVrMapping = 0x%x\n", pptable->VddSocVrMapping);
-	dev_info(smu->adev->dev, "VddMem0VrMapping = 0x%x\n", pptable->VddMem0VrMapping);
-	dev_info(smu->adev->dev, "VddMem1VrMapping = 0x%x\n", pptable->VddMem1VrMapping);
-	dev_info(smu->adev->dev, "GfxUlvPhaseSheddingMask = 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
-	dev_info(smu->adev->dev, "SocUlvPhaseSheddingMask = 0x%x\n", pptable->SocUlvPhaseSheddingMask);
-	dev_info(smu->adev->dev, "VddciUlvPhaseSheddingMask = 0x%x\n", pptable->VddciUlvPhaseSheddingMask);
-	dev_info(smu->adev->dev, "MvddUlvPhaseSheddingMask = 0x%x\n", pptable->MvddUlvPhaseSheddingMask);
-
-	dev_info(smu->adev->dev, "GfxMaxCurrent = 0x%x\n", pptable->GfxMaxCurrent);
-	dev_info(smu->adev->dev, "GfxOffset = 0x%x\n", pptable->GfxOffset);
-	dev_info(smu->adev->dev, "Padding_TelemetryGfx = 0x%x\n", pptable->Padding_TelemetryGfx);
-
-	dev_info(smu->adev->dev, "SocMaxCurrent = 0x%x\n", pptable->SocMaxCurrent);
-	dev_info(smu->adev->dev, "SocOffset = 0x%x\n", pptable->SocOffset);
-	dev_info(smu->adev->dev, "Padding_TelemetrySoc = 0x%x\n", pptable->Padding_TelemetrySoc);
-
-	dev_info(smu->adev->dev, "Mem0MaxCurrent = 0x%x\n", pptable->Mem0MaxCurrent);
-	dev_info(smu->adev->dev, "Mem0Offset = 0x%x\n", pptable->Mem0Offset);
-	dev_info(smu->adev->dev, "Padding_TelemetryMem0 = 0x%x\n", pptable->Padding_TelemetryMem0);
-
-	dev_info(smu->adev->dev, "Mem1MaxCurrent = 0x%x\n", pptable->Mem1MaxCurrent);
-	dev_info(smu->adev->dev, "Mem1Offset = 0x%x\n", pptable->Mem1Offset);
-	dev_info(smu->adev->dev, "Padding_TelemetryMem1 = 0x%x\n", pptable->Padding_TelemetryMem1);
-
-	dev_info(smu->adev->dev, "MvddRatio = 0x%x\n", pptable->MvddRatio);
-
-	dev_info(smu->adev->dev, "AcDcGpio = 0x%x\n", pptable->AcDcGpio);
-	dev_info(smu->adev->dev, "AcDcPolarity = 0x%x\n", pptable->AcDcPolarity);
-	dev_info(smu->adev->dev, "VR0HotGpio = 0x%x\n", pptable->VR0HotGpio);
-	dev_info(smu->adev->dev, "VR0HotPolarity = 0x%x\n", pptable->VR0HotPolarity);
-	dev_info(smu->adev->dev, "VR1HotGpio = 0x%x\n", pptable->VR1HotGpio);
-	dev_info(smu->adev->dev, "VR1HotPolarity = 0x%x\n", pptable->VR1HotPolarity);
-	dev_info(smu->adev->dev, "GthrGpio = 0x%x\n", pptable->GthrGpio);
-	dev_info(smu->adev->dev, "GthrPolarity = 0x%x\n", pptable->GthrPolarity);
-	dev_info(smu->adev->dev, "LedPin0 = 0x%x\n", pptable->LedPin0);
-	dev_info(smu->adev->dev, "LedPin1 = 0x%x\n", pptable->LedPin1);
-	dev_info(smu->adev->dev, "LedPin2 = 0x%x\n", pptable->LedPin2);
-	dev_info(smu->adev->dev, "LedEnableMask = 0x%x\n", pptable->LedEnableMask);
-	dev_info(smu->adev->dev, "LedPcie = 0x%x\n", pptable->LedPcie);
-	dev_info(smu->adev->dev, "LedError = 0x%x\n", pptable->LedError);
-	dev_info(smu->adev->dev, "LedSpare1[0] = 0x%x\n", pptable->LedSpare1[0]);
-	dev_info(smu->adev->dev, "LedSpare1[1] = 0x%x\n", pptable->LedSpare1[1]);
-
-	dev_info(smu->adev->dev, "PllGfxclkSpreadEnabled = 0x%x\n", pptable->PllGfxclkSpreadEnabled);
-	dev_info(smu->adev->dev, "PllGfxclkSpreadPercent = 0x%x\n", pptable->PllGfxclkSpreadPercent);
-	dev_info(smu->adev->dev, "PllGfxclkSpreadFreq = 0x%x\n",    pptable->PllGfxclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "DfllGfxclkSpreadEnabled = 0x%x\n", pptable->DfllGfxclkSpreadEnabled);
-	dev_info(smu->adev->dev, "DfllGfxclkSpreadPercent = 0x%x\n", pptable->DfllGfxclkSpreadPercent);
-	dev_info(smu->adev->dev, "DfllGfxclkSpreadFreq = 0x%x\n",    pptable->DfllGfxclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "UclkSpreadPadding = 0x%x\n", pptable->UclkSpreadPadding);
-	dev_info(smu->adev->dev, "UclkSpreadFreq = 0x%x\n", pptable->UclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "FclkSpreadEnabled = 0x%x\n", pptable->FclkSpreadEnabled);
-	dev_info(smu->adev->dev, "FclkSpreadPercent = 0x%x\n", pptable->FclkSpreadPercent);
-	dev_info(smu->adev->dev, "FclkSpreadFreq = 0x%x\n", pptable->FclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "MemoryChannelEnabled = 0x%x\n", pptable->MemoryChannelEnabled);
-	dev_info(smu->adev->dev, "DramBitWidth = 0x%x\n", pptable->DramBitWidth);
-	dev_info(smu->adev->dev, "PaddingMem1[0] = 0x%x\n", pptable->PaddingMem1[0]);
-	dev_info(smu->adev->dev, "PaddingMem1[1] = 0x%x\n", pptable->PaddingMem1[1]);
-	dev_info(smu->adev->dev, "PaddingMem1[2] = 0x%x\n", pptable->PaddingMem1[2]);
-
-	dev_info(smu->adev->dev, "TotalBoardPower = 0x%x\n", pptable->TotalBoardPower);
-	dev_info(smu->adev->dev, "BoardPowerPadding = 0x%x\n", pptable->BoardPowerPadding);
-
-	dev_info(smu->adev->dev, "XgmiLinkSpeed\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiLinkSpeed[i]);
-	dev_info(smu->adev->dev, "XgmiLinkWidth\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiLinkWidth[i]);
-	dev_info(smu->adev->dev, "XgmiFclkFreq\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiFclkFreq[i]);
-	dev_info(smu->adev->dev, "XgmiSocVoltage\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiSocVoltage[i]);
-
-	dev_info(smu->adev->dev, "HsrEnabled = 0x%x\n", pptable->HsrEnabled);
-	dev_info(smu->adev->dev, "VddqOffEnabled = 0x%x\n", pptable->VddqOffEnabled);
-	dev_info(smu->adev->dev, "PaddingUmcFlags[0] = 0x%x\n", pptable->PaddingUmcFlags[0]);
-	dev_info(smu->adev->dev, "PaddingUmcFlags[1] = 0x%x\n", pptable->PaddingUmcFlags[1]);
-
-	dev_info(smu->adev->dev, "BoardReserved[0] = 0x%x\n", pptable->BoardReserved[0]);
-	dev_info(smu->adev->dev, "BoardReserved[1] = 0x%x\n", pptable->BoardReserved[1]);
-	dev_info(smu->adev->dev, "BoardReserved[2] = 0x%x\n", pptable->BoardReserved[2]);
-	dev_info(smu->adev->dev, "BoardReserved[3] = 0x%x\n", pptable->BoardReserved[3]);
-	dev_info(smu->adev->dev, "BoardReserved[4] = 0x%x\n", pptable->BoardReserved[4]);
-	dev_info(smu->adev->dev, "BoardReserved[5] = 0x%x\n", pptable->BoardReserved[5]);
-	dev_info(smu->adev->dev, "BoardReserved[6] = 0x%x\n", pptable->BoardReserved[6]);
-	dev_info(smu->adev->dev, "BoardReserved[7] = 0x%x\n", pptable->BoardReserved[7]);
-	dev_info(smu->adev->dev, "BoardReserved[8] = 0x%x\n", pptable->BoardReserved[8]);
-	dev_info(smu->adev->dev, "BoardReserved[9] = 0x%x\n", pptable->BoardReserved[9]);
-	dev_info(smu->adev->dev, "BoardReserved[10] = 0x%x\n", pptable->BoardReserved[10]);
-
-	dev_info(smu->adev->dev, "MmHubPadding[0] = 0x%x\n", pptable->MmHubPadding[0]);
-	dev_info(smu->adev->dev, "MmHubPadding[1] = 0x%x\n", pptable->MmHubPadding[1]);
-	dev_info(smu->adev->dev, "MmHubPadding[2] = 0x%x\n", pptable->MmHubPadding[2]);
-	dev_info(smu->adev->dev, "MmHubPadding[3] = 0x%x\n", pptable->MmHubPadding[3]);
-	dev_info(smu->adev->dev, "MmHubPadding[4] = 0x%x\n", pptable->MmHubPadding[4]);
-	dev_info(smu->adev->dev, "MmHubPadding[5] = 0x%x\n", pptable->MmHubPadding[5]);
-	dev_info(smu->adev->dev, "MmHubPadding[6] = 0x%x\n", pptable->MmHubPadding[6]);
-	dev_info(smu->adev->dev, "MmHubPadding[7] = 0x%x\n", pptable->MmHubPadding[7]);
-}
-
-static void sienna_cichlid_dump_pptable(struct smu_context *smu)
-{
-	struct smu_table_context *table_context = &smu->smu_table;
-	PPTable_t *pptable = table_context->driver_pptable;
-	int i;
-
-	if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) ==
-	    IP_VERSION(11, 0, 13)) {
-		beige_goby_dump_pptable(smu);
-		return;
-	}
-
-	dev_info(smu->adev->dev, "Dumped PPTable:\n");
-
-	dev_info(smu->adev->dev, "Version = 0x%08x\n", pptable->Version);
-	dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", pptable->FeaturesToRun[0]);
-	dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", pptable->FeaturesToRun[1]);
-
-	for (i = 0; i < PPT_THROTTLER_COUNT; i++) {
-		dev_info(smu->adev->dev, "SocketPowerLimitAc[%d] = 0x%x\n", i, pptable->SocketPowerLimitAc[i]);
-		dev_info(smu->adev->dev, "SocketPowerLimitAcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitAcTau[i]);
-		dev_info(smu->adev->dev, "SocketPowerLimitDc[%d] = 0x%x\n", i, pptable->SocketPowerLimitDc[i]);
-		dev_info(smu->adev->dev, "SocketPowerLimitDcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitDcTau[i]);
-	}
-
-	for (i = 0; i < TDC_THROTTLER_COUNT; i++) {
-		dev_info(smu->adev->dev, "TdcLimit[%d] = 0x%x\n", i, pptable->TdcLimit[i]);
-		dev_info(smu->adev->dev, "TdcLimitTau[%d] = 0x%x\n", i, pptable->TdcLimitTau[i]);
-	}
-
-	for (i = 0; i < TEMP_COUNT; i++) {
-		dev_info(smu->adev->dev, "TemperatureLimit[%d] = 0x%x\n", i, pptable->TemperatureLimit[i]);
-	}
-
-	dev_info(smu->adev->dev, "FitLimit = 0x%x\n", pptable->FitLimit);
-	dev_info(smu->adev->dev, "TotalPowerConfig = 0x%x\n", pptable->TotalPowerConfig);
-	dev_info(smu->adev->dev, "TotalPowerPadding[0] = 0x%x\n", pptable->TotalPowerPadding[0]);
-	dev_info(smu->adev->dev, "TotalPowerPadding[1] = 0x%x\n", pptable->TotalPowerPadding[1]);
-	dev_info(smu->adev->dev, "TotalPowerPadding[2] = 0x%x\n", pptable->TotalPowerPadding[2]);
-
-	dev_info(smu->adev->dev, "ApccPlusResidencyLimit = 0x%x\n", pptable->ApccPlusResidencyLimit);
-	for (i = 0; i < NUM_SMNCLK_DPM_LEVELS; i++) {
-		dev_info(smu->adev->dev, "SmnclkDpmFreq[%d] = 0x%x\n", i, pptable->SmnclkDpmFreq[i]);
-		dev_info(smu->adev->dev, "SmnclkDpmVoltage[%d] = 0x%x\n", i, pptable->SmnclkDpmVoltage[i]);
-	}
-	dev_info(smu->adev->dev, "ThrottlerControlMask = 0x%x\n", pptable->ThrottlerControlMask);
-
-	dev_info(smu->adev->dev, "FwDStateMask = 0x%x\n", pptable->FwDStateMask);
-
-	dev_info(smu->adev->dev, "UlvVoltageOffsetSoc = 0x%x\n", pptable->UlvVoltageOffsetSoc);
-	dev_info(smu->adev->dev, "UlvVoltageOffsetGfx = 0x%x\n", pptable->UlvVoltageOffsetGfx);
-	dev_info(smu->adev->dev, "MinVoltageUlvGfx = 0x%x\n", pptable->MinVoltageUlvGfx);
-	dev_info(smu->adev->dev, "MinVoltageUlvSoc = 0x%x\n", pptable->MinVoltageUlvSoc);
-
-	dev_info(smu->adev->dev, "SocLIVmin = 0x%x\n", pptable->SocLIVmin);
-	dev_info(smu->adev->dev, "PaddingLIVmin = 0x%x\n", pptable->PaddingLIVmin);
-
-	dev_info(smu->adev->dev, "GceaLinkMgrIdleThreshold = 0x%x\n", pptable->GceaLinkMgrIdleThreshold);
-	dev_info(smu->adev->dev, "paddingRlcUlvParams[0] = 0x%x\n", pptable->paddingRlcUlvParams[0]);
-	dev_info(smu->adev->dev, "paddingRlcUlvParams[1] = 0x%x\n", pptable->paddingRlcUlvParams[1]);
-	dev_info(smu->adev->dev, "paddingRlcUlvParams[2] = 0x%x\n", pptable->paddingRlcUlvParams[2]);
-
-	dev_info(smu->adev->dev, "MinVoltageGfx = 0x%x\n", pptable->MinVoltageGfx);
-	dev_info(smu->adev->dev, "MinVoltageSoc = 0x%x\n", pptable->MinVoltageSoc);
-	dev_info(smu->adev->dev, "MaxVoltageGfx = 0x%x\n", pptable->MaxVoltageGfx);
-	dev_info(smu->adev->dev, "MaxVoltageSoc = 0x%x\n", pptable->MaxVoltageSoc);
-
-	dev_info(smu->adev->dev, "LoadLineResistanceGfx = 0x%x\n", pptable->LoadLineResistanceGfx);
-	dev_info(smu->adev->dev, "LoadLineResistanceSoc = 0x%x\n", pptable->LoadLineResistanceSoc);
-
-	dev_info(smu->adev->dev, "VDDGFX_TVmin = 0x%x\n", pptable->VDDGFX_TVmin);
-	dev_info(smu->adev->dev, "VDDSOC_TVmin = 0x%x\n", pptable->VDDSOC_TVmin);
-	dev_info(smu->adev->dev, "VDDGFX_Vmin_HiTemp = 0x%x\n", pptable->VDDGFX_Vmin_HiTemp);
-	dev_info(smu->adev->dev, "VDDGFX_Vmin_LoTemp = 0x%x\n", pptable->VDDGFX_Vmin_LoTemp);
-	dev_info(smu->adev->dev, "VDDSOC_Vmin_HiTemp = 0x%x\n", pptable->VDDSOC_Vmin_HiTemp);
-	dev_info(smu->adev->dev, "VDDSOC_Vmin_LoTemp = 0x%x\n", pptable->VDDSOC_Vmin_LoTemp);
-	dev_info(smu->adev->dev, "VDDGFX_TVminHystersis = 0x%x\n", pptable->VDDGFX_TVminHystersis);
-	dev_info(smu->adev->dev, "VDDSOC_TVminHystersis = 0x%x\n", pptable->VDDSOC_TVminHystersis);
-
-	dev_info(smu->adev->dev, "[PPCLK_GFXCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_GFXCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_SOCCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_SOCCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_UCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_UCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_UCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_UCLK].Padding,
-			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_UCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_UCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_FCLK]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_FCLK].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_FCLK].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_FCLK].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_FCLK].Padding,
-			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_FCLK].SsFmin,
-			pptable->DpmDescriptor[PPCLK_FCLK].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_DCLK_0]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_DCLK_0].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].Padding,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].SsFmin,
-			pptable->DpmDescriptor[PPCLK_DCLK_0].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_VCLK_0]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_VCLK_0].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].Padding,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].SsFmin,
-			pptable->DpmDescriptor[PPCLK_VCLK_0].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_DCLK_1]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_DCLK_1].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].Padding,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].SsFmin,
-			pptable->DpmDescriptor[PPCLK_DCLK_1].Padding16);
-
-	dev_info(smu->adev->dev, "[PPCLK_VCLK_1]\n"
-			"  .VoltageMode          = 0x%02x\n"
-			"  .SnapToDiscrete       = 0x%02x\n"
-			"  .NumDiscreteLevels    = 0x%02x\n"
-			"  .padding              = 0x%02x\n"
-			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
-			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
-			"  .SsFmin               = 0x%04x\n"
-			"  .Padding_16           = 0x%04x\n",
-			pptable->DpmDescriptor[PPCLK_VCLK_1].VoltageMode,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SnapToDiscrete,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].NumDiscreteLevels,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].Padding,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].ConversionToAvfsClk.m,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].ConversionToAvfsClk.b,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.a,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.b,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.c,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].SsFmin,
-			pptable->DpmDescriptor[PPCLK_VCLK_1].Padding16);
-
-	dev_info(smu->adev->dev, "FreqTableGfx\n");
-	for (i = 0; i < NUM_GFXCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableGfx[i]);
-
-	dev_info(smu->adev->dev, "FreqTableVclk\n");
-	for (i = 0; i < NUM_VCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableVclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableDclk\n");
-	for (i = 0; i < NUM_DCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableDclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableSocclk\n");
-	for (i = 0; i < NUM_SOCCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableSocclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableUclk\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableUclk[i]);
-
-	dev_info(smu->adev->dev, "FreqTableFclk\n");
-	for (i = 0; i < NUM_FCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%02d] = 0x%x\n", i, pptable->FreqTableFclk[i]);
-
-	dev_info(smu->adev->dev, "DcModeMaxFreq\n");
-	dev_info(smu->adev->dev, "  .PPCLK_GFXCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_GFXCLK]);
-	dev_info(smu->adev->dev, "  .PPCLK_SOCCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_SOCCLK]);
-	dev_info(smu->adev->dev, "  .PPCLK_UCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_UCLK]);
-	dev_info(smu->adev->dev, "  .PPCLK_FCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_FCLK]);
-	dev_info(smu->adev->dev, "  .PPCLK_DCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_0]);
-	dev_info(smu->adev->dev, "  .PPCLK_VCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_0]);
-	dev_info(smu->adev->dev, "  .PPCLK_DCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_1]);
-	dev_info(smu->adev->dev, "  .PPCLK_VCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_1]);
-
-	dev_info(smu->adev->dev, "FreqTableUclkDiv\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->FreqTableUclkDiv[i]);
-
-	dev_info(smu->adev->dev, "FclkBoostFreq = 0x%x\n", pptable->FclkBoostFreq);
-	dev_info(smu->adev->dev, "FclkParamPadding = 0x%x\n", pptable->FclkParamPadding);
-
-	dev_info(smu->adev->dev, "Mp0clkFreq\n");
-	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->Mp0clkFreq[i]);
-
-	dev_info(smu->adev->dev, "Mp0DpmVoltage\n");
-	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->Mp0DpmVoltage[i]);
-
-	dev_info(smu->adev->dev, "MemVddciVoltage\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->MemVddciVoltage[i]);
-
-	dev_info(smu->adev->dev, "MemMvddVoltage\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->MemMvddVoltage[i]);
-
-	dev_info(smu->adev->dev, "GfxclkFgfxoffEntry = 0x%x\n", pptable->GfxclkFgfxoffEntry);
-	dev_info(smu->adev->dev, "GfxclkFinit = 0x%x\n", pptable->GfxclkFinit);
-	dev_info(smu->adev->dev, "GfxclkFidle = 0x%x\n", pptable->GfxclkFidle);
-	dev_info(smu->adev->dev, "GfxclkSource = 0x%x\n", pptable->GfxclkSource);
-	dev_info(smu->adev->dev, "GfxclkPadding = 0x%x\n", pptable->GfxclkPadding);
-
-	dev_info(smu->adev->dev, "GfxGpoSubFeatureMask = 0x%x\n", pptable->GfxGpoSubFeatureMask);
-
-	dev_info(smu->adev->dev, "GfxGpoEnabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoEnabledWorkPolicyMask);
-	dev_info(smu->adev->dev, "GfxGpoDisabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoDisabledWorkPolicyMask);
-	dev_info(smu->adev->dev, "GfxGpoPadding[0] = 0x%x\n", pptable->GfxGpoPadding[0]);
-	dev_info(smu->adev->dev, "GfxGpoVotingAllow = 0x%x\n", pptable->GfxGpoVotingAllow);
-	dev_info(smu->adev->dev, "GfxGpoPadding32[0] = 0x%x\n", pptable->GfxGpoPadding32[0]);
-	dev_info(smu->adev->dev, "GfxGpoPadding32[1] = 0x%x\n", pptable->GfxGpoPadding32[1]);
-	dev_info(smu->adev->dev, "GfxGpoPadding32[2] = 0x%x\n", pptable->GfxGpoPadding32[2]);
-	dev_info(smu->adev->dev, "GfxGpoPadding32[3] = 0x%x\n", pptable->GfxGpoPadding32[3]);
-	dev_info(smu->adev->dev, "GfxDcsFopt = 0x%x\n", pptable->GfxDcsFopt);
-	dev_info(smu->adev->dev, "GfxDcsFclkFopt = 0x%x\n", pptable->GfxDcsFclkFopt);
-	dev_info(smu->adev->dev, "GfxDcsUclkFopt = 0x%x\n", pptable->GfxDcsUclkFopt);
-
-	dev_info(smu->adev->dev, "DcsGfxOffVoltage = 0x%x\n", pptable->DcsGfxOffVoltage);
-	dev_info(smu->adev->dev, "DcsMinGfxOffTime = 0x%x\n", pptable->DcsMinGfxOffTime);
-	dev_info(smu->adev->dev, "DcsMaxGfxOffTime = 0x%x\n", pptable->DcsMaxGfxOffTime);
-	dev_info(smu->adev->dev, "DcsMinCreditAccum = 0x%x\n", pptable->DcsMinCreditAccum);
-	dev_info(smu->adev->dev, "DcsExitHysteresis = 0x%x\n", pptable->DcsExitHysteresis);
-	dev_info(smu->adev->dev, "DcsTimeout = 0x%x\n", pptable->DcsTimeout);
-
-	dev_info(smu->adev->dev, "DcsParamPadding[0] = 0x%x\n", pptable->DcsParamPadding[0]);
-	dev_info(smu->adev->dev, "DcsParamPadding[1] = 0x%x\n", pptable->DcsParamPadding[1]);
-	dev_info(smu->adev->dev, "DcsParamPadding[2] = 0x%x\n", pptable->DcsParamPadding[2]);
-	dev_info(smu->adev->dev, "DcsParamPadding[3] = 0x%x\n", pptable->DcsParamPadding[3]);
-	dev_info(smu->adev->dev, "DcsParamPadding[4] = 0x%x\n", pptable->DcsParamPadding[4]);
-
-	dev_info(smu->adev->dev, "FlopsPerByteTable\n");
-	for (i = 0; i < RLC_PACE_TABLE_NUM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->FlopsPerByteTable[i]);
-
-	dev_info(smu->adev->dev, "LowestUclkReservedForUlv = 0x%x\n", pptable->LowestUclkReservedForUlv);
-	dev_info(smu->adev->dev, "vddingMem[0] = 0x%x\n", pptable->PaddingMem[0]);
-	dev_info(smu->adev->dev, "vddingMem[1] = 0x%x\n", pptable->PaddingMem[1]);
-	dev_info(smu->adev->dev, "vddingMem[2] = 0x%x\n", pptable->PaddingMem[2]);
-
-	dev_info(smu->adev->dev, "UclkDpmPstates\n");
-	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->UclkDpmPstates[i]);
-
-	dev_info(smu->adev->dev, "UclkDpmSrcFreqRange\n");
-	dev_info(smu->adev->dev, "  .Fmin = 0x%x\n",
-		pptable->UclkDpmSrcFreqRange.Fmin);
-	dev_info(smu->adev->dev, "  .Fmax = 0x%x\n",
-		pptable->UclkDpmSrcFreqRange.Fmax);
-	dev_info(smu->adev->dev, "UclkDpmTargFreqRange\n");
-	dev_info(smu->adev->dev, "  .Fmin = 0x%x\n",
-		pptable->UclkDpmTargFreqRange.Fmin);
-	dev_info(smu->adev->dev, "  .Fmax = 0x%x\n",
-		pptable->UclkDpmTargFreqRange.Fmax);
-	dev_info(smu->adev->dev, "UclkDpmMidstepFreq = 0x%x\n", pptable->UclkDpmMidstepFreq);
-	dev_info(smu->adev->dev, "UclkMidstepPadding = 0x%x\n", pptable->UclkMidstepPadding);
-
-	dev_info(smu->adev->dev, "PcieGenSpeed\n");
-	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->PcieGenSpeed[i]);
-
-	dev_info(smu->adev->dev, "PcieLaneCount\n");
-	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->PcieLaneCount[i]);
-
-	dev_info(smu->adev->dev, "LclkFreq\n");
-	for (i = 0; i < NUM_LINK_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->LclkFreq[i]);
-
-	dev_info(smu->adev->dev, "FanStopTemp = 0x%x\n", pptable->FanStopTemp);
-	dev_info(smu->adev->dev, "FanStartTemp = 0x%x\n", pptable->FanStartTemp);
-
-	dev_info(smu->adev->dev, "FanGain\n");
-	for (i = 0; i < TEMP_COUNT; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->FanGain[i]);
-
-	dev_info(smu->adev->dev, "FanPwmMin = 0x%x\n", pptable->FanPwmMin);
-	dev_info(smu->adev->dev, "FanAcousticLimitRpm = 0x%x\n", pptable->FanAcousticLimitRpm);
-	dev_info(smu->adev->dev, "FanThrottlingRpm = 0x%x\n", pptable->FanThrottlingRpm);
-	dev_info(smu->adev->dev, "FanMaximumRpm = 0x%x\n", pptable->FanMaximumRpm);
-	dev_info(smu->adev->dev, "MGpuFanBoostLimitRpm = 0x%x\n", pptable->MGpuFanBoostLimitRpm);
-	dev_info(smu->adev->dev, "FanTargetTemperature = 0x%x\n", pptable->FanTargetTemperature);
-	dev_info(smu->adev->dev, "FanTargetGfxclk = 0x%x\n", pptable->FanTargetGfxclk);
-	dev_info(smu->adev->dev, "FanPadding16 = 0x%x\n", pptable->FanPadding16);
-	dev_info(smu->adev->dev, "FanTempInputSelect = 0x%x\n", pptable->FanTempInputSelect);
-	dev_info(smu->adev->dev, "FanPadding = 0x%x\n", pptable->FanPadding);
-	dev_info(smu->adev->dev, "FanZeroRpmEnable = 0x%x\n", pptable->FanZeroRpmEnable);
-	dev_info(smu->adev->dev, "FanTachEdgePerRev = 0x%x\n", pptable->FanTachEdgePerRev);
-
-	dev_info(smu->adev->dev, "FuzzyFan_ErrorSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorSetDelta);
-	dev_info(smu->adev->dev, "FuzzyFan_ErrorRateSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorRateSetDelta);
-	dev_info(smu->adev->dev, "FuzzyFan_PwmSetDelta = 0x%x\n", pptable->FuzzyFan_PwmSetDelta);
-	dev_info(smu->adev->dev, "FuzzyFan_Reserved = 0x%x\n", pptable->FuzzyFan_Reserved);
-
-	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
-	dev_info(smu->adev->dev, "dBtcGbGfxDfllModelSelect = 0x%x\n", pptable->dBtcGbGfxDfllModelSelect);
-	dev_info(smu->adev->dev, "Padding8_Avfs = 0x%x\n", pptable->Padding8_Avfs);
-
-	dev_info(smu->adev->dev, "qAvfsGb[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].a,
-			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].b,
-			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].c);
-	dev_info(smu->adev->dev, "qAvfsGb[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].a,
-			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].b,
-			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].c);
-	dev_info(smu->adev->dev, "dBtcGbGfxPll{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbGfxPll.a,
-			pptable->dBtcGbGfxPll.b,
-			pptable->dBtcGbGfxPll.c);
-	dev_info(smu->adev->dev, "dBtcGbGfxAfll{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbGfxDfll.a,
-			pptable->dBtcGbGfxDfll.b,
-			pptable->dBtcGbGfxDfll.c);
-	dev_info(smu->adev->dev, "dBtcGbSoc{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->dBtcGbSoc.a,
-			pptable->dBtcGbSoc.b,
-			pptable->dBtcGbSoc.c);
-	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_GFX]{m = 0x%x b = 0x%x}\n",
-			pptable->qAgingGb[AVFS_VOLTAGE_GFX].m,
-			pptable->qAgingGb[AVFS_VOLTAGE_GFX].b);
-	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_SOC]{m = 0x%x b = 0x%x}\n",
-			pptable->qAgingGb[AVFS_VOLTAGE_SOC].m,
-			pptable->qAgingGb[AVFS_VOLTAGE_SOC].b);
-
-	dev_info(smu->adev->dev, "PiecewiseLinearDroopIntGfxDfll\n");
-	for (i = 0; i < NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS; i++) {
-		dev_info(smu->adev->dev, "		Fset[%d] = 0x%x\n",
-			i, pptable->PiecewiseLinearDroopIntGfxDfll.Fset[i]);
-		dev_info(smu->adev->dev, "		Vdroop[%d] = 0x%x\n",
-			i, pptable->PiecewiseLinearDroopIntGfxDfll.Vdroop[i]);
-	}
-
-	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].a,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].b,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].c);
-	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].a,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].b,
-			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].c);
-
-	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
-
-	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
-	dev_info(smu->adev->dev, "Padding8_GfxBtc[0] = 0x%x\n", pptable->Padding8_GfxBtc[0]);
-	dev_info(smu->adev->dev, "Padding8_GfxBtc[1] = 0x%x\n", pptable->Padding8_GfxBtc[1]);
-
-	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
-	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
-
-	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
-	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
-
-	dev_info(smu->adev->dev, "XgmiDpmPstates\n");
-	for (i = 0; i < NUM_XGMI_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiDpmPstates[i]);
-	dev_info(smu->adev->dev, "XgmiDpmSpare[0] = 0x%02x\n", pptable->XgmiDpmSpare[0]);
-	dev_info(smu->adev->dev, "XgmiDpmSpare[1] = 0x%02x\n", pptable->XgmiDpmSpare[1]);
-
-	dev_info(smu->adev->dev, "DebugOverrides = 0x%x\n", pptable->DebugOverrides);
-	dev_info(smu->adev->dev, "ReservedEquation0{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation0.a,
-			pptable->ReservedEquation0.b,
-			pptable->ReservedEquation0.c);
-	dev_info(smu->adev->dev, "ReservedEquation1{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation1.a,
-			pptable->ReservedEquation1.b,
-			pptable->ReservedEquation1.c);
-	dev_info(smu->adev->dev, "ReservedEquation2{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation2.a,
-			pptable->ReservedEquation2.b,
-			pptable->ReservedEquation2.c);
-	dev_info(smu->adev->dev, "ReservedEquation3{a = 0x%x b = 0x%x c = 0x%x}\n",
-			pptable->ReservedEquation3.a,
-			pptable->ReservedEquation3.b,
-			pptable->ReservedEquation3.c);
-
-	dev_info(smu->adev->dev, "SkuReserved[0] = 0x%x\n", pptable->SkuReserved[0]);
-	dev_info(smu->adev->dev, "SkuReserved[1] = 0x%x\n", pptable->SkuReserved[1]);
-	dev_info(smu->adev->dev, "SkuReserved[2] = 0x%x\n", pptable->SkuReserved[2]);
-	dev_info(smu->adev->dev, "SkuReserved[3] = 0x%x\n", pptable->SkuReserved[3]);
-	dev_info(smu->adev->dev, "SkuReserved[4] = 0x%x\n", pptable->SkuReserved[4]);
-	dev_info(smu->adev->dev, "SkuReserved[5] = 0x%x\n", pptable->SkuReserved[5]);
-	dev_info(smu->adev->dev, "SkuReserved[6] = 0x%x\n", pptable->SkuReserved[6]);
-	dev_info(smu->adev->dev, "SkuReserved[7] = 0x%x\n", pptable->SkuReserved[7]);
-
-	dev_info(smu->adev->dev, "GamingClk[0] = 0x%x\n", pptable->GamingClk[0]);
-	dev_info(smu->adev->dev, "GamingClk[1] = 0x%x\n", pptable->GamingClk[1]);
-	dev_info(smu->adev->dev, "GamingClk[2] = 0x%x\n", pptable->GamingClk[2]);
-	dev_info(smu->adev->dev, "GamingClk[3] = 0x%x\n", pptable->GamingClk[3]);
-	dev_info(smu->adev->dev, "GamingClk[4] = 0x%x\n", pptable->GamingClk[4]);
-	dev_info(smu->adev->dev, "GamingClk[5] = 0x%x\n", pptable->GamingClk[5]);
-
-	for (i = 0; i < NUM_I2C_CONTROLLERS; i++) {
-		dev_info(smu->adev->dev, "I2cControllers[%d]:\n", i);
-		dev_info(smu->adev->dev, "                   .Enabled = 0x%x\n",
-				pptable->I2cControllers[i].Enabled);
-		dev_info(smu->adev->dev, "                   .Speed = 0x%x\n",
-				pptable->I2cControllers[i].Speed);
-		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
-		dev_info(smu->adev->dev, "                   .ControllerPort = 0x%x\n",
-				pptable->I2cControllers[i].ControllerPort);
-		dev_info(smu->adev->dev, "                   .ControllerName = 0x%x\n",
-				pptable->I2cControllers[i].ControllerName);
-		dev_info(smu->adev->dev, "                   .ThermalThrottler = 0x%x\n",
-				pptable->I2cControllers[i].ThermalThrotter);
-		dev_info(smu->adev->dev, "                   .I2cProtocol = 0x%x\n",
-				pptable->I2cControllers[i].I2cProtocol);
-		dev_info(smu->adev->dev, "                   .PaddingConfig = 0x%x\n",
-				pptable->I2cControllers[i].PaddingConfig);
-	}
-
-	dev_info(smu->adev->dev, "GpioScl = 0x%x\n", pptable->GpioScl);
-	dev_info(smu->adev->dev, "GpioSda = 0x%x\n", pptable->GpioSda);
-	dev_info(smu->adev->dev, "FchUsbPdSlaveAddr = 0x%x\n", pptable->FchUsbPdSlaveAddr);
-	dev_info(smu->adev->dev, "I2cSpare[0] = 0x%x\n", pptable->I2cSpare[0]);
-
-	dev_info(smu->adev->dev, "Board Parameters:\n");
-	dev_info(smu->adev->dev, "VddGfxVrMapping = 0x%x\n", pptable->VddGfxVrMapping);
-	dev_info(smu->adev->dev, "VddSocVrMapping = 0x%x\n", pptable->VddSocVrMapping);
-	dev_info(smu->adev->dev, "VddMem0VrMapping = 0x%x\n", pptable->VddMem0VrMapping);
-	dev_info(smu->adev->dev, "VddMem1VrMapping = 0x%x\n", pptable->VddMem1VrMapping);
-	dev_info(smu->adev->dev, "GfxUlvPhaseSheddingMask = 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
-	dev_info(smu->adev->dev, "SocUlvPhaseSheddingMask = 0x%x\n", pptable->SocUlvPhaseSheddingMask);
-	dev_info(smu->adev->dev, "VddciUlvPhaseSheddingMask = 0x%x\n", pptable->VddciUlvPhaseSheddingMask);
-	dev_info(smu->adev->dev, "MvddUlvPhaseSheddingMask = 0x%x\n", pptable->MvddUlvPhaseSheddingMask);
-
-	dev_info(smu->adev->dev, "GfxMaxCurrent = 0x%x\n", pptable->GfxMaxCurrent);
-	dev_info(smu->adev->dev, "GfxOffset = 0x%x\n", pptable->GfxOffset);
-	dev_info(smu->adev->dev, "Padding_TelemetryGfx = 0x%x\n", pptable->Padding_TelemetryGfx);
-
-	dev_info(smu->adev->dev, "SocMaxCurrent = 0x%x\n", pptable->SocMaxCurrent);
-	dev_info(smu->adev->dev, "SocOffset = 0x%x\n", pptable->SocOffset);
-	dev_info(smu->adev->dev, "Padding_TelemetrySoc = 0x%x\n", pptable->Padding_TelemetrySoc);
-
-	dev_info(smu->adev->dev, "Mem0MaxCurrent = 0x%x\n", pptable->Mem0MaxCurrent);
-	dev_info(smu->adev->dev, "Mem0Offset = 0x%x\n", pptable->Mem0Offset);
-	dev_info(smu->adev->dev, "Padding_TelemetryMem0 = 0x%x\n", pptable->Padding_TelemetryMem0);
-
-	dev_info(smu->adev->dev, "Mem1MaxCurrent = 0x%x\n", pptable->Mem1MaxCurrent);
-	dev_info(smu->adev->dev, "Mem1Offset = 0x%x\n", pptable->Mem1Offset);
-	dev_info(smu->adev->dev, "Padding_TelemetryMem1 = 0x%x\n", pptable->Padding_TelemetryMem1);
-
-	dev_info(smu->adev->dev, "MvddRatio = 0x%x\n", pptable->MvddRatio);
-
-	dev_info(smu->adev->dev, "AcDcGpio = 0x%x\n", pptable->AcDcGpio);
-	dev_info(smu->adev->dev, "AcDcPolarity = 0x%x\n", pptable->AcDcPolarity);
-	dev_info(smu->adev->dev, "VR0HotGpio = 0x%x\n", pptable->VR0HotGpio);
-	dev_info(smu->adev->dev, "VR0HotPolarity = 0x%x\n", pptable->VR0HotPolarity);
-	dev_info(smu->adev->dev, "VR1HotGpio = 0x%x\n", pptable->VR1HotGpio);
-	dev_info(smu->adev->dev, "VR1HotPolarity = 0x%x\n", pptable->VR1HotPolarity);
-	dev_info(smu->adev->dev, "GthrGpio = 0x%x\n", pptable->GthrGpio);
-	dev_info(smu->adev->dev, "GthrPolarity = 0x%x\n", pptable->GthrPolarity);
-	dev_info(smu->adev->dev, "LedPin0 = 0x%x\n", pptable->LedPin0);
-	dev_info(smu->adev->dev, "LedPin1 = 0x%x\n", pptable->LedPin1);
-	dev_info(smu->adev->dev, "LedPin2 = 0x%x\n", pptable->LedPin2);
-	dev_info(smu->adev->dev, "LedEnableMask = 0x%x\n", pptable->LedEnableMask);
-	dev_info(smu->adev->dev, "LedPcie = 0x%x\n", pptable->LedPcie);
-	dev_info(smu->adev->dev, "LedError = 0x%x\n", pptable->LedError);
-	dev_info(smu->adev->dev, "LedSpare1[0] = 0x%x\n", pptable->LedSpare1[0]);
-	dev_info(smu->adev->dev, "LedSpare1[1] = 0x%x\n", pptable->LedSpare1[1]);
-
-	dev_info(smu->adev->dev, "PllGfxclkSpreadEnabled = 0x%x\n", pptable->PllGfxclkSpreadEnabled);
-	dev_info(smu->adev->dev, "PllGfxclkSpreadPercent = 0x%x\n", pptable->PllGfxclkSpreadPercent);
-	dev_info(smu->adev->dev, "PllGfxclkSpreadFreq = 0x%x\n",    pptable->PllGfxclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "DfllGfxclkSpreadEnabled = 0x%x\n", pptable->DfllGfxclkSpreadEnabled);
-	dev_info(smu->adev->dev, "DfllGfxclkSpreadPercent = 0x%x\n", pptable->DfllGfxclkSpreadPercent);
-	dev_info(smu->adev->dev, "DfllGfxclkSpreadFreq = 0x%x\n",    pptable->DfllGfxclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "UclkSpreadPadding = 0x%x\n", pptable->UclkSpreadPadding);
-	dev_info(smu->adev->dev, "UclkSpreadFreq = 0x%x\n", pptable->UclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "FclkSpreadEnabled = 0x%x\n", pptable->FclkSpreadEnabled);
-	dev_info(smu->adev->dev, "FclkSpreadPercent = 0x%x\n", pptable->FclkSpreadPercent);
-	dev_info(smu->adev->dev, "FclkSpreadFreq = 0x%x\n", pptable->FclkSpreadFreq);
-
-	dev_info(smu->adev->dev, "MemoryChannelEnabled = 0x%x\n", pptable->MemoryChannelEnabled);
-	dev_info(smu->adev->dev, "DramBitWidth = 0x%x\n", pptable->DramBitWidth);
-	dev_info(smu->adev->dev, "PaddingMem1[0] = 0x%x\n", pptable->PaddingMem1[0]);
-	dev_info(smu->adev->dev, "PaddingMem1[1] = 0x%x\n", pptable->PaddingMem1[1]);
-	dev_info(smu->adev->dev, "PaddingMem1[2] = 0x%x\n", pptable->PaddingMem1[2]);
-
-	dev_info(smu->adev->dev, "TotalBoardPower = 0x%x\n", pptable->TotalBoardPower);
-	dev_info(smu->adev->dev, "BoardPowerPadding = 0x%x\n", pptable->BoardPowerPadding);
-
-	dev_info(smu->adev->dev, "XgmiLinkSpeed\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiLinkSpeed[i]);
-	dev_info(smu->adev->dev, "XgmiLinkWidth\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiLinkWidth[i]);
-	dev_info(smu->adev->dev, "XgmiFclkFreq\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiFclkFreq[i]);
-	dev_info(smu->adev->dev, "XgmiSocVoltage\n");
-	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
-		dev_info(smu->adev->dev, "  .[%d] = 0x%x\n", i, pptable->XgmiSocVoltage[i]);
-
-	dev_info(smu->adev->dev, "HsrEnabled = 0x%x\n", pptable->HsrEnabled);
-	dev_info(smu->adev->dev, "VddqOffEnabled = 0x%x\n", pptable->VddqOffEnabled);
-	dev_info(smu->adev->dev, "PaddingUmcFlags[0] = 0x%x\n", pptable->PaddingUmcFlags[0]);
-	dev_info(smu->adev->dev, "PaddingUmcFlags[1] = 0x%x\n", pptable->PaddingUmcFlags[1]);
-
-	dev_info(smu->adev->dev, "BoardReserved[0] = 0x%x\n", pptable->BoardReserved[0]);
-	dev_info(smu->adev->dev, "BoardReserved[1] = 0x%x\n", pptable->BoardReserved[1]);
-	dev_info(smu->adev->dev, "BoardReserved[2] = 0x%x\n", pptable->BoardReserved[2]);
-	dev_info(smu->adev->dev, "BoardReserved[3] = 0x%x\n", pptable->BoardReserved[3]);
-	dev_info(smu->adev->dev, "BoardReserved[4] = 0x%x\n", pptable->BoardReserved[4]);
-	dev_info(smu->adev->dev, "BoardReserved[5] = 0x%x\n", pptable->BoardReserved[5]);
-	dev_info(smu->adev->dev, "BoardReserved[6] = 0x%x\n", pptable->BoardReserved[6]);
-	dev_info(smu->adev->dev, "BoardReserved[7] = 0x%x\n", pptable->BoardReserved[7]);
-	dev_info(smu->adev->dev, "BoardReserved[8] = 0x%x\n", pptable->BoardReserved[8]);
-	dev_info(smu->adev->dev, "BoardReserved[9] = 0x%x\n", pptable->BoardReserved[9]);
-	dev_info(smu->adev->dev, "BoardReserved[10] = 0x%x\n", pptable->BoardReserved[10]);
-
-	dev_info(smu->adev->dev, "MmHubPadding[0] = 0x%x\n", pptable->MmHubPadding[0]);
-	dev_info(smu->adev->dev, "MmHubPadding[1] = 0x%x\n", pptable->MmHubPadding[1]);
-	dev_info(smu->adev->dev, "MmHubPadding[2] = 0x%x\n", pptable->MmHubPadding[2]);
-	dev_info(smu->adev->dev, "MmHubPadding[3] = 0x%x\n", pptable->MmHubPadding[3]);
-	dev_info(smu->adev->dev, "MmHubPadding[4] = 0x%x\n", pptable->MmHubPadding[4]);
-	dev_info(smu->adev->dev, "MmHubPadding[5] = 0x%x\n", pptable->MmHubPadding[5]);
-	dev_info(smu->adev->dev, "MmHubPadding[6] = 0x%x\n", pptable->MmHubPadding[6]);
-	dev_info(smu->adev->dev, "MmHubPadding[7] = 0x%x\n", pptable->MmHubPadding[7]);
-}
-
 static int sienna_cichlid_i2c_xfer(struct i2c_adapter *i2c_adap,
 				   struct i2c_msg *msg, int num_msgs)
 {
@@ -4397,7 +3129,6 @@ static const struct pptable_funcs sienna_cichlid_ppt_funcs = {
 	.display_disable_memory_clock_switch = sienna_cichlid_display_disable_memory_clock_switch,
 	.get_power_limit = sienna_cichlid_get_power_limit,
 	.update_pcie_parameters = sienna_cichlid_update_pcie_parameters,
-	.dump_pptable = sienna_cichlid_dump_pptable,
 	.init_microcode = smu_v11_0_init_microcode,
 	.load_microcode = smu_v11_0_load_microcode,
 	.fini_microcode = smu_v11_0_fini_microcode,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index a887ab945dfa..e4e9b98ad816 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -736,19 +736,6 @@ static bool smu_v13_0_0_is_dpm_running(struct smu_context *smu)
 	return !!(feature_enabled & SMC_DPM_FEATURE);
 }
 
-static void smu_v13_0_0_dump_pptable(struct smu_context *smu)
-{
-       struct smu_table_context *table_context = &smu->smu_table;
-       PPTable_t *pptable = table_context->driver_pptable;
-       SkuTable_t *skutable = &pptable->SkuTable;
-
-       dev_info(smu->adev->dev, "Dumped PPTable:\n");
-
-       dev_info(smu->adev->dev, "Version = 0x%08x\n", skutable->Version);
-       dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", skutable->FeaturesToRun[0]);
-       dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", skutable->FeaturesToRun[1]);
-}
-
 static int smu_v13_0_0_system_features_control(struct smu_context *smu,
 						  bool en)
 {
@@ -3022,7 +3009,6 @@ static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
 	.i2c_init = smu_v13_0_0_i2c_control_init,
 	.i2c_fini = smu_v13_0_0_i2c_control_fini,
 	.is_dpm_running = smu_v13_0_0_is_dpm_running,
-	.dump_pptable = smu_v13_0_0_dump_pptable,
 	.init_microcode = smu_v13_0_init_microcode,
 	.load_microcode = smu_v13_0_load_microcode,
 	.fini_microcode = smu_v13_0_fini_microcode,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 7bc95c404377..b2db5e8aaa78 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -734,19 +734,6 @@ static bool smu_v13_0_7_is_dpm_running(struct smu_context *smu)
 	return !!(feature_enabled & SMC_DPM_FEATURE);
 }
 
-static void smu_v13_0_7_dump_pptable(struct smu_context *smu)
-{
-       struct smu_table_context *table_context = &smu->smu_table;
-       PPTable_t *pptable = table_context->driver_pptable;
-       SkuTable_t *skutable = &pptable->SkuTable;
-
-       dev_info(smu->adev->dev, "Dumped PPTable:\n");
-
-       dev_info(smu->adev->dev, "Version = 0x%08x\n", skutable->Version);
-       dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", skutable->FeaturesToRun[0]);
-       dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", skutable->FeaturesToRun[1]);
-}
-
 static uint32_t smu_v13_0_7_get_throttler_status(SmuMetrics_t *metrics)
 {
 	uint32_t throttler_status = 0;
@@ -2602,7 +2589,6 @@ static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
 	.get_allowed_feature_mask = smu_v13_0_7_get_allowed_feature_mask,
 	.set_default_dpm_table = smu_v13_0_7_set_default_dpm_table,
 	.is_dpm_running = smu_v13_0_7_is_dpm_running,
-	.dump_pptable = smu_v13_0_7_dump_pptable,
 	.init_microcode = smu_v13_0_init_microcode,
 	.load_microcode = smu_v13_0_load_microcode,
 	.fini_microcode = smu_v13_0_fini_microcode,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
index 43820d7d2c54..97ba58069bfb 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
@@ -732,19 +732,6 @@ static bool smu_v14_0_2_is_dpm_running(struct smu_context *smu)
 	return !!(feature_enabled & SMC_DPM_FEATURE);
 }
 
-static void smu_v14_0_2_dump_pptable(struct smu_context *smu)
-{
-       struct smu_table_context *table_context = &smu->smu_table;
-       PPTable_t *pptable = table_context->driver_pptable;
-       PFE_Settings_t *PFEsettings = &pptable->PFE_Settings;
-
-       dev_info(smu->adev->dev, "Dumped PPTable:\n");
-
-       dev_info(smu->adev->dev, "Version = 0x%08x\n", PFEsettings->Version);
-       dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", PFEsettings->FeaturesToRun[0]);
-       dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", PFEsettings->FeaturesToRun[1]);
-}
-
 static uint32_t smu_v14_0_2_get_throttler_status(SmuMetrics_t *metrics)
 {
 	uint32_t throttler_status = 0;
@@ -2802,7 +2789,6 @@ static const struct pptable_funcs smu_v14_0_2_ppt_funcs = {
 	.i2c_init = smu_v14_0_2_i2c_control_init,
 	.i2c_fini = smu_v14_0_2_i2c_control_fini,
 	.is_dpm_running = smu_v14_0_2_is_dpm_running,
-	.dump_pptable = smu_v14_0_2_dump_pptable,
 	.init_microcode = smu_v14_0_init_microcode,
 	.load_microcode = smu_v14_0_load_microcode,
 	.fini_microcode = smu_v14_0_fini_microcode,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
index 6f4d212607d7..c09ecf1a68a0 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
@@ -78,7 +78,6 @@
 #define smu_register_irq_handler(smu)					smu_ppt_funcs(register_irq_handler, 0, smu)
 #define smu_get_dpm_ultimate_freq(smu, param, min, max)			smu_ppt_funcs(get_dpm_ultimate_freq, 0, smu, param, min, max)
 #define smu_asic_set_performance_level(smu, level)			smu_ppt_funcs(set_performance_level, -EINVAL, smu, level)
-#define smu_dump_pptable(smu)						smu_ppt_funcs(dump_pptable, 0, smu)
 #define smu_update_pcie_parameters(smu, pcie_gen_cap, pcie_width_cap)	smu_ppt_funcs(update_pcie_parameters, 0, smu, pcie_gen_cap, pcie_width_cap)
 #define smu_set_power_source(smu, power_src)				smu_ppt_funcs(set_power_source, 0, smu, power_src)
 #define smu_i2c_init(smu)                                               smu_ppt_funcs(i2c_init, 0, smu)
-- 
2.40.1


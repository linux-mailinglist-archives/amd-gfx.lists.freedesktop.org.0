Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30EA57C3AE
	for <lists+amd-gfx@lfdr.de>; Thu, 21 Jul 2022 07:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30EE11AC8D;
	Thu, 21 Jul 2022 05:13:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA8A11ADEA
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 Jul 2022 05:13:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4676rhLc9e5F4Qlr85+B+5CWLEoYgnxLiipKYSJFxYfTtUZhxabQ5uSPKblxkeb8TdhJ4BfhNwKo84Wo0d293p2ne+wdBgTXRrPOYEE2piE1FyA5grsx7Qj6h37Yydnq8J95VcW/5pC2KeInhxO1u0VHK9gzfEuj8LPIjN/oBlKM3zB+z4w1ix6kYqRfrnXFdTLUZvBX0ziT3VwRmbsv4lKgpmgJqg9eRsPy9gAyFFKNgOWJQ4N/7zNkqOrFfnheg5Whua5jgtfi9+rIhdzzmEut7aR0b4AY3n/Xd8CHM3p51wVQK4zvKrjUnn4+qHqd3beb4DPAs0RWcCKtx9wAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEbqWeamgqJC4gdcIwBTtnq0ie7phkXe9sc1YzWk/Ow=;
 b=h2eDqlbrVKiz6mvdU+Hc/fthS9jRgvkNkW8hcgAqg5O5+as61MR3KMRkmDrICi6s4SMbC1xOrXrUK5xoGk3AcxnckJ/rddUWuOPA0jMyOpoapwSEpK6bXaiHUnQ3u2+0M6Ggpgt4QBi/ltKF0SEFVMU+YWxoTkp8fPWSeUfEWttOgp2STqEN2TNVWzS4HpxQV1jvQsDB8Yd3vj3MQ3mt6nq5ndJLn3fOQRYKt05kToLixihc7k2OhNtxy/a8l34Dmp66vGEonPqBJmRdGjBq3K4ONNKAOE7t8Ffj0Upgqihhq1RtENWVy9qVBWYyeBgocYnkEEZ8vl0xUw4kfmTI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEbqWeamgqJC4gdcIwBTtnq0ie7phkXe9sc1YzWk/Ow=;
 b=Iq7uCV/j4eLQaoYBqx7tuwLbxIMMEL8ksgpRofNZhWbOc+gx7aUjmRZLnhe6vFLm02InR0zxsJ3IQdKZGRDFt8Cja4ahRYa/Fy9Q1+T6F6RsaBpM4EQXP/z9oC2yRvvcvZUI+Dm0iRXH+OkmhdFspNHGCCKPb45h+e1Q2g6DobI=
Received: from DM6PR03CA0001.namprd03.prod.outlook.com (2603:10b6:5:40::14) by
 BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Thu, 21 Jul
 2022 05:13:25 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::43) by DM6PR03CA0001.outlook.office365.com
 (2603:10b6:5:40::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Thu, 21 Jul 2022 05:13:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 05:13:25 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 21 Jul
 2022 00:13:23 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amd/display: reduce stack for
 dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport
Date: Thu, 21 Jul 2022 01:13:04 -0400
Message-ID: <20220721051305.1356754-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220721051305.1356754-1-alexander.deucher@amd.com>
References: <20220721051305.1356754-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c72a4af-b6df-4732-cea9-08da6ad7bd7e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5803:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tDA86VPL5gqfQDNORCX9w3+UV8ZIwckYZ1U5rIT6VE26jcjmLCVc0BEp0BBRUE9nI7KOuFWfHa61U14nPeNSgGChHP+EJWsmpbdPBnJwP8Vh2/G/I55/vk+bi7MKWQenTNA0ZdQHF5EVmGWosDz+lU5THkXWpNOgegskuw3MUmMyl3eqLNgd+uH7EP0eILianW8D1FcYX975gnI1vMuZlJ6cLAPBBucy6aZkQ10WPvVEFgDuHWXNjUIKbIb+kTHPLtwMCxtQhNh4bUxsWSI5vETJm378XIptY8mugIEGpVkiPJLfWz6DHYf6X+d8dmkiTKm3jwEIMlQQ9i1nEqUuUVQtGH8l9OasRKy6AB1gitRBiBI5lABkmCvDyW0ZESAZmK8WQJUz4pFjZR6b6ZnLVeED1LnmYwpq0iTGY45uEdLurDdupiQxH7+C/pjqFgbvgtecIC0QiKLgTZorLNHLP3N2uYYl2KwERGEnRt7rL+AomCiG1Mf1BAujXUPpo7cg6fqJHc0IPGATWJXauskluVhN3fjQRw8LGehBMvUep6FZ/gONqWscXRtRJrUChdxSD1sF0j7RaaKCyFpJ8czK9xpdWHq77YiN4HLIb1OMTwZ9evQddtpixbLCCu71/K6aRRQ+A8+9MFrKLlPBAY3SZoRyKo76/DAkKidycdYYJvw/xakaQrXzBRKHGrA5h0lTsYdULQ6x/deMKghG5PxBFCtS1mVZ21/yU6YBaI/WqR5YCPjRFqLWcvImxi6amibfRCqUGEL2WuS8PMXKEzXhl34+xmyhGSPWnWEh2TXL4IHSIgLahaAPmSjmVcJcIlmUVLxyIT8lm5rWWd46oqiiU3i7CB+bKZx3UBYQPhRHWD4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966006)(36840700001)(40470700004)(7696005)(6666004)(82310400005)(16526019)(41300700001)(30864003)(83380400001)(1076003)(26005)(186003)(426003)(47076005)(2616005)(40480700001)(478600001)(336012)(40460700003)(2906002)(36756003)(54906003)(6916009)(19627235002)(70206006)(8676002)(8936002)(4326008)(70586007)(5660300002)(82740400003)(86362001)(36860700001)(356005)(316002)(81166007)(36900700001)(44824005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 05:13:25.5126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c72a4af-b6df-4732-cea9-08da6ad7bd7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Move stack variables to dummy structure.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
---
 .../dc/dml/dcn32/display_mode_vba_32.c        |   2 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c   | 187 ++++++++----------
 .../dc/dml/dcn32/display_mode_vba_util_32.h   |   1 +
 .../drm/amd/display/dc/dml/display_mode_vba.h |  34 ++++
 4 files changed, 120 insertions(+), 104 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index 0ecc9e4c52a6..f7d108123b07 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -1165,6 +1165,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
 
 		dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
+			&v->dummy_vars.dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport,
 			mode_lib->vba.USRRetrainingRequiredFinal,
 			mode_lib->vba.UsesMALLForPStateChange,
 			mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
@@ -3493,6 +3494,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 			{
 				dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
+						&v->dummy_vars.dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport,
 						mode_lib->vba.USRRetrainingRequiredFinal,
 						mode_lib->vba.UsesMALLForPStateChange,
 						mode_lib->vba.PrefetchModePerState[i][j],
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 9ebd3207ce42..40b4c88ff2e7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -4185,6 +4185,7 @@ void dml32_CalculateFlipSchedule(
 } // CalculateFlipSchedule
 
 void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
+		struct dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport *st_vars,
 		bool USRRetrainingRequiredFinal,
 		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
 		unsigned int PrefetchMode,
@@ -4246,37 +4247,15 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		double ActiveDRAMClockChangeLatencyMargin[])
 {
 	unsigned int i, j, k;
-	unsigned int SurfaceWithMinActiveFCLKChangeMargin = 0;
-	unsigned int DRAMClockChangeSupportNumber = 0;
-	unsigned int LastSurfaceWithoutMargin;
-	unsigned int DRAMClockChangeMethod = 0;
-	bool FoundFirstSurfaceWithMinActiveFCLKChangeMargin = false;
-	double MinActiveFCLKChangeMargin = 0.;
-	double SecondMinActiveFCLKChangeMarginOneDisplayInVBLank = 0.;
-	double ActiveClockChangeLatencyHidingY;
-	double ActiveClockChangeLatencyHidingC;
-	double ActiveClockChangeLatencyHiding;
-    double EffectiveDETBufferSizeY;
-	double     ActiveFCLKChangeLatencyMargin[DC__NUM_DPP__MAX];
-	double     USRRetrainingLatencyMargin[DC__NUM_DPP__MAX];
-	double TotalPixelBW = 0.0;
-	bool    SynchronizedSurfaces[DC__NUM_DPP__MAX][DC__NUM_DPP__MAX];
-	double     EffectiveLBLatencyHidingY;
-	double     EffectiveLBLatencyHidingC;
-	double     LinesInDETY[DC__NUM_DPP__MAX];
-	double     LinesInDETC[DC__NUM_DPP__MAX];
-	unsigned int    LinesInDETYRoundedDownToSwath[DC__NUM_DPP__MAX];
-	unsigned int    LinesInDETCRoundedDownToSwath[DC__NUM_DPP__MAX];
-	double     FullDETBufferingTimeY;
-	double     FullDETBufferingTimeC;
-	double     WritebackDRAMClockChangeLatencyMargin;
-	double     WritebackFCLKChangeLatencyMargin;
-	double     WritebackLatencyHiding;
-	bool    SameTimingForFCLKChange;
-
-	unsigned int    TotalActiveWriteback = 0;
-	unsigned int LBLatencyHidingSourceLinesY[DC__NUM_DPP__MAX];
-	unsigned int LBLatencyHidingSourceLinesC[DC__NUM_DPP__MAX];
+
+	st_vars->SurfaceWithMinActiveFCLKChangeMargin = 0;
+	st_vars->DRAMClockChangeSupportNumber = 0;
+	st_vars->DRAMClockChangeMethod = 0;
+	st_vars->FoundFirstSurfaceWithMinActiveFCLKChangeMargin = false;
+	st_vars->MinActiveFCLKChangeMargin = 0.;
+	st_vars->SecondMinActiveFCLKChangeMarginOneDisplayInVBLank = 0.;
+	st_vars->TotalPixelBW = 0.0;
+	st_vars->TotalActiveWriteback = 0;
 
 	Watermark->UrgentWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency;
 	Watermark->USRRetrainingWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency
@@ -4308,13 +4287,13 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 #endif
 
 
-	TotalActiveWriteback = 0;
+	st_vars->TotalActiveWriteback = 0;
 	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
 		if (WritebackEnable[k] == true)
-			TotalActiveWriteback = TotalActiveWriteback + 1;
+			st_vars->TotalActiveWriteback = st_vars->TotalActiveWriteback + 1;
 	}
 
-	if (TotalActiveWriteback <= 1) {
+	if (st_vars->TotalActiveWriteback <= 1) {
 		Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency;
 	} else {
 		Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency
@@ -4324,7 +4303,7 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		Watermark->WritebackUrgentWatermark = Watermark->WritebackUrgentWatermark
 				+ mmSOCParameters.USRRetrainingLatency;
 
-	if (TotalActiveWriteback <= 1) {
+	if (st_vars->TotalActiveWriteback <= 1) {
 		Watermark->WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
 				+ mmSOCParameters.WritebackLatency;
 		Watermark->WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
@@ -4354,14 +4333,14 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 #endif
 
 	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		TotalPixelBW = TotalPixelBW + DPPPerSurface[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] +
+		st_vars->TotalPixelBW = st_vars->TotalPixelBW + DPPPerSurface[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] +
 				SwathWidthC[k] * BytePerPixelDETC[k] * VRatioChroma[k]) / (HTotal[k] / PixelClock[k]);
 	}
 
 	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
 
-		LBLatencyHidingSourceLinesY[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (VTaps[k] - 1);
-		LBLatencyHidingSourceLinesC[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTapsChroma[k] - 1);
+		st_vars->LBLatencyHidingSourceLinesY[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (VTaps[k] - 1);
+		st_vars->LBLatencyHidingSourceLinesC[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTapsChroma[k] - 1);
 
 
 #ifdef __DML_VBA_DEBUG__
@@ -4372,72 +4351,72 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		dml_print("DML::%s: k=%d, VTaps              = %d\n", __func__, k, VTaps[k]);
 #endif
 
-		EffectiveLBLatencyHidingY = LBLatencyHidingSourceLinesY[k] / VRatio[k] * (HTotal[k] / PixelClock[k]);
-		EffectiveLBLatencyHidingC = LBLatencyHidingSourceLinesC[k] / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
-		EffectiveDETBufferSizeY = DETBufferSizeY[k];
+		st_vars->EffectiveLBLatencyHidingY = st_vars->LBLatencyHidingSourceLinesY[k] / VRatio[k] * (HTotal[k] / PixelClock[k]);
+		st_vars->EffectiveLBLatencyHidingC = st_vars->LBLatencyHidingSourceLinesC[k] / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
+		st_vars->EffectiveDETBufferSizeY = DETBufferSizeY[k];
 
 		if (UnboundedRequestEnabled) {
-			EffectiveDETBufferSizeY = EffectiveDETBufferSizeY
+			st_vars->EffectiveDETBufferSizeY = st_vars->EffectiveDETBufferSizeY
 					+ CompressedBufferSizeInkByte * 1024
 							* (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k])
-							/ (HTotal[k] / PixelClock[k]) / TotalPixelBW;
+							/ (HTotal[k] / PixelClock[k]) / st_vars->TotalPixelBW;
 		}
 
-		LinesInDETY[k] = (double) EffectiveDETBufferSizeY / BytePerPixelDETY[k] / SwathWidthY[k];
-		LinesInDETYRoundedDownToSwath[k] = dml_floor(LinesInDETY[k], SwathHeightY[k]);
-		FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
+		st_vars->LinesInDETY[k] = (double) st_vars->EffectiveDETBufferSizeY / BytePerPixelDETY[k] / SwathWidthY[k];
+		st_vars->LinesInDETYRoundedDownToSwath[k] = dml_floor(st_vars->LinesInDETY[k], SwathHeightY[k]);
+		st_vars->FullDETBufferingTimeY = st_vars->LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
 
-		ActiveClockChangeLatencyHidingY = EffectiveLBLatencyHidingY + FullDETBufferingTimeY
+		st_vars->ActiveClockChangeLatencyHidingY = st_vars->EffectiveLBLatencyHidingY + st_vars->FullDETBufferingTimeY
 				- (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k];
 
 		if (NumberOfActiveSurfaces > 1) {
-			ActiveClockChangeLatencyHidingY = ActiveClockChangeLatencyHidingY
+			st_vars->ActiveClockChangeLatencyHidingY = st_vars->ActiveClockChangeLatencyHidingY
 					- (1 - 1 / NumberOfActiveSurfaces) * SwathHeightY[k] * HTotal[k]
 							/ PixelClock[k] / VRatio[k];
 		}
 
 		if (BytePerPixelDETC[k] > 0) {
-			LinesInDETC[k] = DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
-			LinesInDETCRoundedDownToSwath[k] = dml_floor(LinesInDETC[k], SwathHeightC[k]);
-			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k])
+			st_vars->LinesInDETC[k] = DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
+			st_vars->LinesInDETCRoundedDownToSwath[k] = dml_floor(st_vars->LinesInDETC[k], SwathHeightC[k]);
+			st_vars->FullDETBufferingTimeC = st_vars->LinesInDETCRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k])
 					/ VRatioChroma[k];
-			ActiveClockChangeLatencyHidingC = EffectiveLBLatencyHidingC + FullDETBufferingTimeC
+			st_vars->ActiveClockChangeLatencyHidingC = st_vars->EffectiveLBLatencyHidingC + st_vars->FullDETBufferingTimeC
 					- (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k]
 							/ PixelClock[k];
 			if (NumberOfActiveSurfaces > 1) {
-				ActiveClockChangeLatencyHidingC = ActiveClockChangeLatencyHidingC
+				st_vars->ActiveClockChangeLatencyHidingC = st_vars->ActiveClockChangeLatencyHidingC
 						- (1 - 1 / NumberOfActiveSurfaces) * SwathHeightC[k] * HTotal[k]
 								/ PixelClock[k] / VRatioChroma[k];
 			}
-			ActiveClockChangeLatencyHiding = dml_min(ActiveClockChangeLatencyHidingY,
-					ActiveClockChangeLatencyHidingC);
+			st_vars->ActiveClockChangeLatencyHiding = dml_min(st_vars->ActiveClockChangeLatencyHidingY,
+					st_vars->ActiveClockChangeLatencyHidingC);
 		} else {
-			ActiveClockChangeLatencyHiding = ActiveClockChangeLatencyHidingY;
+			st_vars->ActiveClockChangeLatencyHiding = st_vars->ActiveClockChangeLatencyHidingY;
 		}
 
-		ActiveDRAMClockChangeLatencyMargin[k] = ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
+		ActiveDRAMClockChangeLatencyMargin[k] = st_vars->ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
 				- Watermark->DRAMClockChangeWatermark;
-		ActiveFCLKChangeLatencyMargin[k] = ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
+		st_vars->ActiveFCLKChangeLatencyMargin[k] = st_vars->ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
 				- Watermark->FCLKChangeWatermark;
-		USRRetrainingLatencyMargin[k] = ActiveClockChangeLatencyHiding - Watermark->USRRetrainingWatermark;
+		st_vars->USRRetrainingLatencyMargin[k] = st_vars->ActiveClockChangeLatencyHiding - Watermark->USRRetrainingWatermark;
 
 		if (WritebackEnable[k]) {
-			WritebackLatencyHiding = WritebackInterfaceBufferSize * 1024
+			st_vars->WritebackLatencyHiding = WritebackInterfaceBufferSize * 1024
 					/ (WritebackDestinationWidth[k] * WritebackDestinationHeight[k]
 							/ (WritebackSourceHeight[k] * HTotal[k] / PixelClock[k]) * 4);
 			if (WritebackPixelFormat[k] == dm_444_64)
-				WritebackLatencyHiding = WritebackLatencyHiding / 2;
+				st_vars->WritebackLatencyHiding = st_vars->WritebackLatencyHiding / 2;
 
-			WritebackDRAMClockChangeLatencyMargin = WritebackLatencyHiding
+			st_vars->WritebackDRAMClockChangeLatencyMargin = st_vars->WritebackLatencyHiding
 					- Watermark->WritebackDRAMClockChangeWatermark;
 
-			WritebackFCLKChangeLatencyMargin = WritebackLatencyHiding
+			st_vars->WritebackFCLKChangeLatencyMargin = st_vars->WritebackLatencyHiding
 					- Watermark->WritebackFCLKChangeWatermark;
 
 			ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMargin[k],
-					WritebackFCLKChangeLatencyMargin);
-			ActiveFCLKChangeLatencyMargin[k] = dml_min(ActiveFCLKChangeLatencyMargin[k],
-					WritebackDRAMClockChangeLatencyMargin);
+					st_vars->WritebackFCLKChangeLatencyMargin);
+			st_vars->ActiveFCLKChangeLatencyMargin[k] = dml_min(st_vars->ActiveFCLKChangeLatencyMargin[k],
+					st_vars->WritebackDRAMClockChangeLatencyMargin);
 		}
 		MaxActiveDRAMClockChangeLatencySupported[k] =
 				(UseMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) ?
@@ -4456,41 +4435,41 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 					HTotal[i] == HTotal[j] && VTotal[i] == VTotal[j] &&
 					VActive[i] == VActive[j]) || (SynchronizeDRRDisplaysForUCLKPStateChangeFinal &&
 					(DRRDisplay[i] || DRRDisplay[j]))) {
-				SynchronizedSurfaces[i][j] = true;
+				st_vars->SynchronizedSurfaces[i][j] = true;
 			} else {
-				SynchronizedSurfaces[i][j] = false;
+				st_vars->SynchronizedSurfaces[i][j] = false;
 			}
 		}
 	}
 
 	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
 		if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
-				(!FoundFirstSurfaceWithMinActiveFCLKChangeMargin ||
-				ActiveFCLKChangeLatencyMargin[k] < MinActiveFCLKChangeMargin)) {
-			FoundFirstSurfaceWithMinActiveFCLKChangeMargin = true;
-			MinActiveFCLKChangeMargin = ActiveFCLKChangeLatencyMargin[k];
-			SurfaceWithMinActiveFCLKChangeMargin = k;
+				(!st_vars->FoundFirstSurfaceWithMinActiveFCLKChangeMargin ||
+				st_vars->ActiveFCLKChangeLatencyMargin[k] < st_vars->MinActiveFCLKChangeMargin)) {
+			st_vars->FoundFirstSurfaceWithMinActiveFCLKChangeMargin = true;
+			st_vars->MinActiveFCLKChangeMargin = st_vars->ActiveFCLKChangeLatencyMargin[k];
+			st_vars->SurfaceWithMinActiveFCLKChangeMargin = k;
 		}
 	}
 
-	*MinActiveFCLKChangeLatencySupported = MinActiveFCLKChangeMargin + mmSOCParameters.FCLKChangeLatency;
+	*MinActiveFCLKChangeLatencySupported = st_vars->MinActiveFCLKChangeMargin + mmSOCParameters.FCLKChangeLatency;
 
-	SameTimingForFCLKChange = true;
+	st_vars->SameTimingForFCLKChange = true;
 	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if (!SynchronizedSurfaces[k][SurfaceWithMinActiveFCLKChangeMargin]) {
+		if (!st_vars->SynchronizedSurfaces[k][st_vars->SurfaceWithMinActiveFCLKChangeMargin]) {
 			if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
-					(SameTimingForFCLKChange ||
-					ActiveFCLKChangeLatencyMargin[k] <
-					SecondMinActiveFCLKChangeMarginOneDisplayInVBLank)) {
-				SecondMinActiveFCLKChangeMarginOneDisplayInVBLank = ActiveFCLKChangeLatencyMargin[k];
+					(st_vars->SameTimingForFCLKChange ||
+					st_vars->ActiveFCLKChangeLatencyMargin[k] <
+					st_vars->SecondMinActiveFCLKChangeMarginOneDisplayInVBLank)) {
+				st_vars->SecondMinActiveFCLKChangeMarginOneDisplayInVBLank = st_vars->ActiveFCLKChangeLatencyMargin[k];
 			}
-			SameTimingForFCLKChange = false;
+			st_vars->SameTimingForFCLKChange = false;
 		}
 	}
 
-	if (MinActiveFCLKChangeMargin > 0) {
+	if (st_vars->MinActiveFCLKChangeMargin > 0) {
 		*FCLKChangeSupport = dm_fclock_change_vactive;
-	} else if ((SameTimingForFCLKChange || SecondMinActiveFCLKChangeMarginOneDisplayInVBLank > 0) &&
+	} else if ((st_vars->SameTimingForFCLKChange || st_vars->SecondMinActiveFCLKChangeMarginOneDisplayInVBLank > 0) &&
 			(PrefetchMode <= 1)) {
 		*FCLKChangeSupport = dm_fclock_change_vblank;
 	} else {
@@ -4500,7 +4479,7 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	*USRRetrainingSupport = true;
 	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
 		if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
-				(USRRetrainingLatencyMargin[k] < 0)) {
+				(st_vars->USRRetrainingLatencyMargin[k] < 0)) {
 			*USRRetrainingSupport = false;
 		}
 	}
@@ -4511,42 +4490,42 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 				UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe &&
 				ActiveDRAMClockChangeLatencyMargin[k] < 0) {
 			if (PrefetchMode > 0) {
-				DRAMClockChangeSupportNumber = 2;
-			} else if (DRAMClockChangeSupportNumber == 0) {
-				DRAMClockChangeSupportNumber = 1;
-				LastSurfaceWithoutMargin = k;
-			} else if (DRAMClockChangeSupportNumber == 1 &&
-					!SynchronizedSurfaces[LastSurfaceWithoutMargin][k]) {
-				DRAMClockChangeSupportNumber = 2;
+				st_vars->DRAMClockChangeSupportNumber = 2;
+			} else if (st_vars->DRAMClockChangeSupportNumber == 0) {
+				st_vars->DRAMClockChangeSupportNumber = 1;
+				st_vars->LastSurfaceWithoutMargin = k;
+			} else if (st_vars->DRAMClockChangeSupportNumber == 1 &&
+					!st_vars->SynchronizedSurfaces[st_vars->LastSurfaceWithoutMargin][k]) {
+				st_vars->DRAMClockChangeSupportNumber = 2;
 			}
 		}
 	}
 
 	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
 		if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
-			DRAMClockChangeMethod = 1;
+			st_vars->DRAMClockChangeMethod = 1;
 		else if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
-			DRAMClockChangeMethod = 2;
+			st_vars->DRAMClockChangeMethod = 2;
 	}
 
-	if (DRAMClockChangeMethod == 0) {
-		if (DRAMClockChangeSupportNumber == 0)
+	if (st_vars->DRAMClockChangeMethod == 0) {
+		if (st_vars->DRAMClockChangeSupportNumber == 0)
 			*DRAMClockChangeSupport = dm_dram_clock_change_vactive;
-		else if (DRAMClockChangeSupportNumber == 1)
+		else if (st_vars->DRAMClockChangeSupportNumber == 1)
 			*DRAMClockChangeSupport = dm_dram_clock_change_vblank;
 		else
 			*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
-	} else if (DRAMClockChangeMethod == 1) {
-		if (DRAMClockChangeSupportNumber == 0)
+	} else if (st_vars->DRAMClockChangeMethod == 1) {
+		if (st_vars->DRAMClockChangeSupportNumber == 0)
 			*DRAMClockChangeSupport = dm_dram_clock_change_vactive_w_mall_full_frame;
-		else if (DRAMClockChangeSupportNumber == 1)
+		else if (st_vars->DRAMClockChangeSupportNumber == 1)
 			*DRAMClockChangeSupport = dm_dram_clock_change_vblank_w_mall_full_frame;
 		else
 			*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
 	} else {
-		if (DRAMClockChangeSupportNumber == 0)
+		if (st_vars->DRAMClockChangeSupportNumber == 0)
 			*DRAMClockChangeSupport = dm_dram_clock_change_vactive_w_mall_sub_vp;
-		else if (DRAMClockChangeSupportNumber == 1)
+		else if (st_vars->DRAMClockChangeSupportNumber == 1)
 			*DRAMClockChangeSupport = dm_dram_clock_change_vblank_w_mall_sub_vp;
 		else
 			*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
@@ -4560,7 +4539,7 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 
 		dst_y_pstate = dml_ceil((mmSOCParameters.DRAMClockChangeLatency + mmSOCParameters.UrgentLatency) / (HTotal[k] / PixelClock[k]), 1);
 		src_y_pstate_l = dml_ceil(dst_y_pstate * VRatio[k], SwathHeightY[k]);
-		src_y_ahead_l = dml_floor(DETBufferSizeY[k] / BytePerPixelDETY[k] / SwathWidthY[k], SwathHeightY[k]) + LBLatencyHidingSourceLinesY[k];
+		src_y_ahead_l = dml_floor(DETBufferSizeY[k] / BytePerPixelDETY[k] / SwathWidthY[k], SwathHeightY[k]) + st_vars->LBLatencyHidingSourceLinesY[k];
 		sub_vp_lines_l = src_y_pstate_l + src_y_ahead_l + meta_row_height[k];
 
 #ifdef __DML_VBA_DEBUG__
@@ -4568,7 +4547,7 @@ dml_print("DML::%s: k=%d, DETBufferSizeY               = %d\n", __func__, k, DET
 dml_print("DML::%s: k=%d, BytePerPixelDETY             = %f\n", __func__, k, BytePerPixelDETY[k]);
 dml_print("DML::%s: k=%d, SwathWidthY                  = %d\n", __func__, k, SwathWidthY[k]);
 dml_print("DML::%s: k=%d, SwathHeightY                 = %d\n", __func__, k, SwathHeightY[k]);
-dml_print("DML::%s: k=%d, LBLatencyHidingSourceLinesY  = %d\n", __func__, k, LBLatencyHidingSourceLinesY[k]);
+dml_print("DML::%s: k=%d, LBLatencyHidingSourceLinesY  = %d\n", __func__, k, st_vars->LBLatencyHidingSourceLinesY[k]);
 dml_print("DML::%s: k=%d, dst_y_pstate      = %d\n", __func__, k, dst_y_pstate);
 dml_print("DML::%s: k=%d, src_y_pstate_l    = %d\n", __func__, k, src_y_pstate_l);
 dml_print("DML::%s: k=%d, src_y_ahead_l     = %d\n", __func__, k, src_y_ahead_l);
@@ -4579,7 +4558,7 @@ dml_print("DML::%s: k=%d, sub_vp_lines_l    = %d\n", __func__, k, sub_vp_lines_l
 
 		if (BytePerPixelDETC[k] > 0) {
 			src_y_pstate_c = dml_ceil(dst_y_pstate * VRatioChroma[k], SwathHeightC[k]);
-			src_y_ahead_c = dml_floor(DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k], SwathHeightC[k]) + LBLatencyHidingSourceLinesC[k];
+			src_y_ahead_c = dml_floor(DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k], SwathHeightC[k]) + st_vars->LBLatencyHidingSourceLinesC[k];
 			sub_vp_lines_c = src_y_pstate_c + src_y_ahead_c + meta_row_height_chroma[k];
 			SubViewportLinesNeededInMALL[k] = dml_max(sub_vp_lines_l, sub_vp_lines_c);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
index 974006e5ecb7..ecd4f1e7d1f7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
@@ -810,6 +810,7 @@ void dml32_CalculateFlipSchedule(
 		bool *ImmediateFlipSupportedForPipe);
 
 void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
+		struct dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport *st_vars,
 		bool USRRetrainingRequiredFinal,
 		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
 		unsigned int PrefetchMode,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index b326184cfa4a..42e4e4c5e656 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -214,6 +214,39 @@ struct dml32_CalculateVMRowAndSwath {
 	bool one_row_per_frame_fits_in_buffer[DC__NUM_DPP__MAX];
 };
 
+struct dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport {
+	unsigned int SurfaceWithMinActiveFCLKChangeMargin;
+	unsigned int DRAMClockChangeSupportNumber;
+	unsigned int LastSurfaceWithoutMargin;
+	unsigned int DRAMClockChangeMethod;
+	bool FoundFirstSurfaceWithMinActiveFCLKChangeMargin;
+	double MinActiveFCLKChangeMargin;
+	double SecondMinActiveFCLKChangeMarginOneDisplayInVBLank;
+	double ActiveClockChangeLatencyHidingY;
+	double ActiveClockChangeLatencyHidingC;
+	double ActiveClockChangeLatencyHiding;
+	double EffectiveDETBufferSizeY;
+	double ActiveFCLKChangeLatencyMargin[DC__NUM_DPP__MAX];
+	double USRRetrainingLatencyMargin[DC__NUM_DPP__MAX];
+	double TotalPixelBW;
+	bool SynchronizedSurfaces[DC__NUM_DPP__MAX][DC__NUM_DPP__MAX];
+	double EffectiveLBLatencyHidingY;
+	double EffectiveLBLatencyHidingC;
+	double LinesInDETY[DC__NUM_DPP__MAX];
+	double LinesInDETC[DC__NUM_DPP__MAX];
+	unsigned int LinesInDETYRoundedDownToSwath[DC__NUM_DPP__MAX];
+	unsigned int LinesInDETCRoundedDownToSwath[DC__NUM_DPP__MAX];
+	double FullDETBufferingTimeY;
+	double FullDETBufferingTimeC;
+	double WritebackDRAMClockChangeLatencyMargin;
+	double WritebackFCLKChangeLatencyMargin;
+	double WritebackLatencyHiding;
+	bool SameTimingForFCLKChange;
+	unsigned int TotalActiveWriteback;
+	unsigned int LBLatencyHidingSourceLinesY[DC__NUM_DPP__MAX];
+	unsigned int LBLatencyHidingSourceLinesC[DC__NUM_DPP__MAX];
+};
+
 struct DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation {
 	unsigned int dummy_integer_array[2][DC__NUM_DPP__MAX];
 	double dummy_single_array[2][DC__NUM_DPP__MAX];
@@ -287,6 +320,7 @@ struct dummy_vars {
 	struct dml32_ModeSupportAndSystemConfigurationFull dml32_ModeSupportAndSystemConfigurationFull;
 	struct dml32_CalculateSwathAndDETConfiguration dml32_CalculateSwathAndDETConfiguration;
 	struct dml32_CalculateVMRowAndSwath dml32_CalculateVMRowAndSwath;
+	struct dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport;
 };
 
 struct vba_vars_st {
-- 
2.35.3


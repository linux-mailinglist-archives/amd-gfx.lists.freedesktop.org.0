Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A810157BB0F
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Jul 2022 18:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E202411A44E;
	Wed, 20 Jul 2022 16:05:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD2912A456
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Jul 2022 16:05:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GB+PjUc/ArOGyBNvF5HYeSfczCn6DErDcO1pIPVJWk4++Hks5ZKNENrHhyS/EDIWeg/d2NOHCzRu81uAoiNC8NrwG3HOPFS98Do2xAFSGBAsmRBcNoXKa1zhXzQO1W3nhbWaQkDjhwPA/gxOZzmgCAPRpAUyvXbKXMbX8glw/oZb1TjJcfD8/QLkR7Ep2uwk0FbcG/jJHo2d6C53gVZTrFibSDCAgSxoBXWpgM9Zm80zB80lYcK2HwJ9Bp7VK0TfFpsMFCvvCp8+a9RP9UKT/Xw2mIJz7GZHkJUKTBgDiY1lwQQF3VoM+t+kQGwy9k+2P9UL3quhZOkMmHnznPn8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TDihg6yv0hdtRojAF5FbzZYV133CxfNmuAISba0Uu0=;
 b=hUbJ5RdSG83WqbM5hB7WnshD8Agj/ATx0qwbdirLoaJxd033NJLbJB4rXj1Gc05Arfb02py112NHjAB3n0iUgnM83CiW/yXzijn8SZIoTsQQQP9Bqb9pekKOi3ojWrdjg/goag1fSgMo5sLpjRuINxhPY9i4W48tUtThQ7YXXUA4pvE1ly25Ro9hr8uufN+pq+gz33MR2R6FdlDy7F5prboLah9u4ZDaDlIYJ8Rtexk+liMtrFuEeQ4D7GRjuZAj8qq4QgJCBE+oSpFy3TMyLRdnQVds2RqAguSIZWop263HjAvWp6ORA3O57vHyzNIRcQspYWlSGLhEc/y79iiaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TDihg6yv0hdtRojAF5FbzZYV133CxfNmuAISba0Uu0=;
 b=vqjkhY5tV+5DD2GObKyfNcMq/xzhfLYIOG3GG7A0vcLe0/zG9uNg/px6lEvp3dKGwaNWOC+bdgcQQcaL0OWLRdWQYaBc+rkhWUKq8Q9gO8QIwo+o0t3sZgaHjGpxhAiVJOsUNo9RuOwUWZjE+0h1hju/SD3obr7rKLMvmweMgXE=
Received: from BN9PR03CA0034.namprd03.prod.outlook.com (2603:10b6:408:fb::9)
 by MW2PR12MB2425.namprd12.prod.outlook.com (2603:10b6:907:f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 16:05:41 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::50) by BN9PR03CA0034.outlook.office365.com
 (2603:10b6:408:fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13 via Frontend
 Transport; Wed, 20 Jul 2022 16:05:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 16:05:41 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 20 Jul
 2022 11:05:35 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: reduce stack size in dcn32 dml (v2)
Date: Wed, 20 Jul 2022 12:05:20 -0400
Message-ID: <20220720160520.2992065-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 004903d9-cd4c-4591-bb97-08da6a69b1c4
X-MS-TrafficTypeDiagnostic: MW2PR12MB2425:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aR4pMShyfTHDrGN7UxevGZTLAb7rd+5AC7kIixoNq04UD6mCXQEIPk89BfukzEyVP/CPwNFhbsYWDNFCEu59uhUsqWC4aiqTCFUL4qwPwK6ciTfy+tOI6gnkg4UPDp1EoQ5glOEyknIjqg5S/dud6/KNZ1L8tOiqbE/OX527tXWmXZEy5vUnBwzRjHeIocTyP9W+EwIaGY0mdQ/dhnCn3fLSyIBwp1JfFZBFVk6gSfn7U1ZA0gafMloawWGansmxX9CTH5UehqJSdH3iET1rVdnfHpO0aAWOmsAERPmKPIUUfuqMjB0aE796ItQZwlLeOigxtb4oxoNRbwu2TWc+hIOGK3IR1n3DsOP5W7pOgHM4dSIpiYWG9EGmtgvZQS8OFhXGsIcW6YG0NWt6hcDuq93Emh5EGC7zWWLAYe98ZGrxsw4vE2yXR4jqDJGLDmuNATYhmP3SZbkKS/7VaDE7pk7f8y0Ikrm0GaMB6dF6lvBeDO0UKA/tq/eXR7rhIaa1N4MAJFOLIMAXBai8xtkNKyboqviIyflYjSNBKJWeIK49G7YVTJ01eCBGYrSW8wAcwjIFGBSX036gORJOHAlTr1JkIz80H0faUW5bYKe8rXqA1dmp64lZosAQWrBYaXzy52BvdvuxBO4KaN+My/Gkpi0DEDxJQTLcsy7uIzrPS6xqstPfWPZSSg/o8AB+esKqQY9Hh7uwB9z/SEytgB/RWeMC50Sle976/pdNM42tGigiPLIQ2P4U+Gn7T5L0xrrK/e8SwqN3K/JTeJQJDjwvoihm1zGkKzlBbUYxGcAzpAcwmp8LG+YC8xtO2WAQpplsFa2janhhfLn++g9B9y+oRRPhKEjOhF7zwJL1cYd++7o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(16526019)(70206006)(6916009)(54906003)(40460700003)(316002)(26005)(36860700001)(426003)(19627235002)(47076005)(8676002)(83380400001)(70586007)(36756003)(40480700001)(86362001)(82310400005)(4326008)(2906002)(186003)(336012)(6666004)(8936002)(7696005)(41300700001)(30864003)(478600001)(1076003)(2616005)(81166007)(356005)(82740400003)(5660300002)(36900700001)(579004)(559001)(44824005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 16:05:41.2292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 004903d9-cd4c-4591-bb97-08da6a69b1c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2425
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

Move additional dummy structures off the stack and into
the dummy vars structure.

Fixes the following:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation':
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1659:1: error: the frame size of 2144 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
 1659 | }
      | ^
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function 'dml32_ModeSupportAndSystemConfigurationFull':
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:3799:1: error: the frame size of 2464 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
 3799 | } // ModeSupportAndSystemConfigurationFull
      | ^

v2: more more stuff to dummy structure, fix init order (Alex)

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
---
 .../dc/dml/dcn32/display_mode_vba_32.c        | 406 ++++++++----------
 .../drm/amd/display/dc/dml/display_mode_vba.h |  35 ++
 2 files changed, 214 insertions(+), 227 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index 349e36ae9333..91450a973920 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -67,6 +67,12 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	int iteration;
 	double MaxTotalRDBandwidth;
 	unsigned int NextPrefetchMode;
+	double MaxTotalRDBandwidthNoUrgentBurst = 0.0;
+	bool DestinationLineTimesForPrefetchLessThan2 = false;
+	bool VRatioPrefetchMoreThanMax = false;
+	double TWait;
+	double TotalWRBandwidth = 0;
+	double WRBandwidth = 0;
 
 #ifdef __DML_VBA_DEBUG__
 	dml_print("DML::%s: --- START ---\n", __func__);
@@ -702,11 +708,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	NextPrefetchMode = mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb];
 
 	do {
-		double MaxTotalRDBandwidthNoUrgentBurst = 0.0;
-		bool DestinationLineTimesForPrefetchLessThan2 = false;
-		bool VRatioPrefetchMoreThanMax = false;
-		double dummy_unit_vector[DC__NUM_DPP__MAX];
-
 		MaxTotalRDBandwidth = 0;
 #ifdef __DML_VBA_DEBUG__
 		dml_print("DML::%s: Start loop: VStartup = %d\n", __func__, mode_lib->vba.VStartupLines);
@@ -715,41 +716,39 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			/* NOTE PerfetchMode variable is invalid in DAL as per the input received.
 			 * Hence the direction is to use PrefetchModePerState.
 			 */
-			double TWait = dml32_CalculateTWait(
-					mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
-					mode_lib->vba.UsesMALLForPStateChange[k],
-					mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-					mode_lib->vba.DRRDisplay[k],
-					mode_lib->vba.DRAMClockChangeLatency,
-					mode_lib->vba.FCLKChangeLatency, v->UrgentLatency,
-					mode_lib->vba.SREnterPlusExitTime);
-
-			DmlPipe myPipe;
-
-			myPipe.Dppclk = mode_lib->vba.DPPCLK[k];
-			myPipe.Dispclk = mode_lib->vba.DISPCLK;
-			myPipe.PixelClock = mode_lib->vba.PixelClock[k];
-			myPipe.DCFClkDeepSleep = v->DCFCLKDeepSleep;
-			myPipe.DPPPerSurface = mode_lib->vba.DPPPerPlane[k];
-			myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
-			myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
-			myPipe.BlockWidth256BytesY = v->BlockWidth256BytesY[k];
-			myPipe.BlockHeight256BytesY = v->BlockHeight256BytesY[k];
-			myPipe.BlockWidth256BytesC = v->BlockWidth256BytesC[k];
-			myPipe.BlockHeight256BytesC = v->BlockHeight256BytesC[k];
-			myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
-			myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
-			myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
-			myPipe.HTotal = mode_lib->vba.HTotal[k];
-			myPipe.HActive = mode_lib->vba.HActive[k];
-			myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
-			myPipe.ODMMode = mode_lib->vba.ODMCombineEnabled[k];
-			myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
-			myPipe.BytePerPixelY = v->BytePerPixelY[k];
-			myPipe.BytePerPixelC = v->BytePerPixelC[k];
-			myPipe.ProgressiveToInterlaceUnitInOPP = mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
+			TWait = dml32_CalculateTWait(
+				mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
+				mode_lib->vba.UsesMALLForPStateChange[k],
+				mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+				mode_lib->vba.DRRDisplay[k],
+				mode_lib->vba.DRAMClockChangeLatency,
+				mode_lib->vba.FCLKChangeLatency, v->UrgentLatency,
+				mode_lib->vba.SREnterPlusExitTime);
+
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.Dppclk = mode_lib->vba.DPPCLK[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.Dispclk = mode_lib->vba.DISPCLK;
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.PixelClock = mode_lib->vba.PixelClock[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.DCFClkDeepSleep = v->DCFCLKDeepSleep;
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.DPPPerSurface = mode_lib->vba.DPPPerPlane[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BlockWidth256BytesY = v->BlockWidth256BytesY[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BlockHeight256BytesY = v->BlockHeight256BytesY[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BlockWidth256BytesC = v->BlockWidth256BytesC[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BlockHeight256BytesC = v->BlockHeight256BytesC[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.HTotal = mode_lib->vba.HTotal[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.HActive = mode_lib->vba.HActive[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.ODMMode = mode_lib->vba.ODMCombineEnabled[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BytePerPixelY = v->BytePerPixelY[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BytePerPixelC = v->BytePerPixelC[k];
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.ProgressiveToInterlaceUnitInOPP = mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
 			v->ErrorResult[k] = dml32_CalculatePrefetchSchedule(v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.HostVMInefficiencyFactor,
-					&myPipe, v->DSCDelay[k],
+					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe, v->DSCDelay[k],
 					mode_lib->vba.DPPCLKDelaySubtotal + mode_lib->vba.DPPCLKDelayCNVCFormater,
 					mode_lib->vba.DPPCLKDelaySCL,
 					mode_lib->vba.DPPCLKDelaySCLLBOnly,
@@ -898,8 +897,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 #endif
 
 		{
-			double dummy_single[1];
-
 			dml32_CalculatePrefetchBandwithSupport(
 					mode_lib->vba.NumberOfActiveSurfaces,
 					mode_lib->vba.ReturnBW,
@@ -923,16 +920,14 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 					/* output */
 					&MaxTotalRDBandwidth,
-					&dummy_single[0],
+					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[0],
 					&v->PrefetchModeSupported);
 		}
 
 		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
-			dummy_unit_vector[k] = 1.0;
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector[k] = 1.0;
 
 		{
-			double  dummy_single[1];
-			bool dummy_boolean[1];
 			dml32_CalculatePrefetchBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
 					mode_lib->vba.ReturnBW,
 					v->NoUrgentLatencyHidingPre,
@@ -946,17 +941,17 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					v->cursor_bw_pre,
 					v->prefetch_vmrow_bw,
 					mode_lib->vba.DPPPerPlane,
-					dummy_unit_vector,
-					dummy_unit_vector,
-					dummy_unit_vector,
-					dummy_unit_vector,
-					dummy_unit_vector,
-					dummy_unit_vector,
+					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
 
 					/* output */
-					&dummy_single[0],
+					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[0],
 					&v->FractionOfUrgentBandwidth,
-					&dummy_boolean[0]);
+					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_boolean);
 		}
 
 		if (VRatioPrefetchMoreThanMax != false || DestinationLineTimesForPrefetchLessThan2 != false) {
@@ -1039,8 +1034,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			}
 
 			{
-				double  dummy_single[2];
-				bool dummy_boolean[1];
 				dml32_CalculateImmediateFlipBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
 						mode_lib->vba.ReturnBW,
 						mode_lib->vba.ImmediateFlipRequirement,
@@ -1064,7 +1057,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 						/* output */
 						&v->total_dcn_read_bw_with_flip,    // Single  *TotalBandwidth
-						&dummy_single[0],                        // Single  *FractionOfUrgentBandwidth
+						&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[0],                        // Single  *FractionOfUrgentBandwidth
 						&v->ImmediateFlipSupported);        // Boolean *ImmediateFlipBandwidthSupport
 
 				dml32_CalculateImmediateFlipBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
@@ -1081,17 +1074,17 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 						v->cursor_bw_pre,
 						v->prefetch_vmrow_bw,
 						mode_lib->vba.DPPPerPlane,
-						dummy_unit_vector,
-						dummy_unit_vector,
-						dummy_unit_vector,
-						dummy_unit_vector,
-						dummy_unit_vector,
-						dummy_unit_vector,
+						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
+						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
 
 						/* output */
-						&dummy_single[1],                                // Single  *TotalBandwidth
+						&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[1],                                // Single  *TotalBandwidth
 						&v->FractionOfUrgentBandwidthImmediateFlip, // Single  *FractionOfUrgentBandwidth
-						&dummy_boolean[0]);                              // Boolean *ImmediateFlipBandwidthSupport
+						&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_boolean);                              // Boolean *ImmediateFlipBandwidthSupport
 			}
 
 			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
@@ -1149,22 +1142,17 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 	//Watermarks and NB P-State/DRAM Clock Change Support
 	{
-		SOCParametersList mmSOCParameters;
-		enum clock_change_support dummy_dramchange_support;
-		enum dm_fclock_change_support dummy_fclkchange_support;
-		bool dummy_USRRetrainingSupport;
-
-		mmSOCParameters.UrgentLatency = v->UrgentLatency;
-		mmSOCParameters.ExtraLatency = v->UrgentExtraLatency;
-		mmSOCParameters.WritebackLatency = mode_lib->vba.WritebackLatency;
-		mmSOCParameters.DRAMClockChangeLatency = mode_lib->vba.DRAMClockChangeLatency;
-		mmSOCParameters.FCLKChangeLatency = mode_lib->vba.FCLKChangeLatency;
-		mmSOCParameters.SRExitTime = mode_lib->vba.SRExitTime;
-		mmSOCParameters.SREnterPlusExitTime = mode_lib->vba.SREnterPlusExitTime;
-		mmSOCParameters.SRExitZ8Time = mode_lib->vba.SRExitZ8Time;
-		mmSOCParameters.SREnterPlusExitZ8Time = mode_lib->vba.SREnterPlusExitZ8Time;
-		mmSOCParameters.USRRetrainingLatency = mode_lib->vba.USRRetrainingLatency;
-		mmSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.UrgentLatency = v->UrgentLatency;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.ExtraLatency = v->UrgentExtraLatency;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.WritebackLatency = mode_lib->vba.WritebackLatency;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.DRAMClockChangeLatency = mode_lib->vba.DRAMClockChangeLatency;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.FCLKChangeLatency = mode_lib->vba.FCLKChangeLatency;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SRExitTime = mode_lib->vba.SRExitTime;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SREnterPlusExitTime = mode_lib->vba.SREnterPlusExitTime;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SRExitZ8Time = mode_lib->vba.SRExitZ8Time;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SREnterPlusExitZ8Time = mode_lib->vba.SREnterPlusExitZ8Time;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.USRRetrainingLatency = mode_lib->vba.USRRetrainingLatency;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
 
 		dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 			mode_lib->vba.USRRetrainingRequiredFinal,
@@ -1182,7 +1170,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			v->dpte_group_bytes,
 			v->meta_row_height,
 			v->meta_row_height_chroma,
-			mmSOCParameters,
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters,
 			mode_lib->vba.WritebackChunkSize,
 			mode_lib->vba.SOCCLK,
 			v->DCFCLKDeepSleep,
@@ -1219,12 +1207,12 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 			/* Output */
 			&v->Watermark,
-			&dummy_dramchange_support,
+			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_dramchange_support,
 			v->MaxActiveDRAMClockChangeLatencySupported,
 			v->SubViewportLinesNeededInMALL,
-			&dummy_fclkchange_support,
+			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_fclkchange_support,
 			&v->MinActiveFCLKChangeLatencySupported,
-			&dummy_USRRetrainingSupport,
+			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_USRRetrainingSupport,
 			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin);
 
 		/* DCN32 has a new struct Watermarks (typedef) which is used to store
@@ -1486,9 +1474,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 	{
 		//Maximum Bandwidth Used
-		double TotalWRBandwidth = 0;
-		double WRBandwidth = 0;
-
 		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 			if (mode_lib->vba.WritebackEnable[k] == true
 					&& mode_lib->vba.WritebackPixelFormat[k] == dm_444_32) {
@@ -1582,9 +1567,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 #ifdef __DML_VBA_ALLOW_DELTA__
 	{
-		double dummy_single[2];
 		unsigned int dummy_integer[1];
-		bool dummy_boolean[1];
 
 		// Calculate z8 stutter eff assuming 0 reserved space
 		dml32_CalculateStutterEfficiency(v->CompressedBufferSizeInkByte,
@@ -1637,14 +1620,14 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 				v->meta_row_bw, v->dpte_row_bw,
 
 				/* Output */
-				&dummy_single[0],
-				&dummy_single[1],
+				&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[0],
+				&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[1],
 				&dummy_integer[0],
 				&v->Z8StutterEfficiencyNotIncludingVBlankBestCase,
 				&v->Z8StutterEfficiencyBestCase,
 				&v->Z8NumberOfStutterBurstsPerFrameBestCase,
 				&v->StutterPeriodBestCase,
-				&dummy_boolean[0]);
+				&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_boolean);
 	}
 #else
 	v->Z8StutterEfficiencyNotIncludingVBlankBestCase = v->Z8StutterEfficiencyNotIncludingVBlank;
@@ -1660,29 +1643,16 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
 {
-	unsigned int dummy_integer[4];
-	bool MPCCombineMethodAsNeededForPStateChangeAndVoltage;
-	bool MPCCombineMethodAsPossible;
-	enum odm_combine_mode dummy_odm_mode[DC__NUM_DPP__MAX];
-	unsigned int TotalNumberOfActiveOTG;
-	unsigned int TotalNumberOfActiveHDMIFRL;
-	unsigned int TotalNumberOfActiveDP2p0;
-	unsigned int TotalNumberOfActiveDP2p0Outputs;
-	unsigned int TotalDSCUnitsRequired;
-	unsigned int m;
-	unsigned int ReorderingBytes;
-	bool FullFrameMALLPStateMethod;
-	bool SubViewportMALLPStateMethod;
-	bool PhantomPipeMALLPStateMethod;
+	struct vba_vars_st *v = &mode_lib->vba;
+	int i, j;
+	unsigned int k, m;
 	unsigned int MaximumMPCCombine;
+	unsigned int NumberOfNonCombinedSurfaceOfMaximumBandwidth;
+	unsigned int TotalSlots;
 
 #ifdef __DML_VBA_DEBUG__
 	dml_print("DML::%s: called\n", __func__);
 #endif
-	struct vba_vars_st *v = &mode_lib->vba;
-
-	int i, j;
-	unsigned int k;
 
 	/*MODE SUPPORT, VOLTAGE STATE AND SOC CONFIGURATION*/
 
@@ -1951,7 +1921,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			mode_lib->vba.Read256BlockHeightC,
 			mode_lib->vba.Read256BlockWidthY,
 			mode_lib->vba.Read256BlockWidthC,
-			dummy_odm_mode,
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_odm_mode,
 			mode_lib->vba.BlendingAndTiming,
 			mode_lib->vba.BytePerPixelY,
 			mode_lib->vba.BytePerPixelC,
@@ -1977,35 +1947,26 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			mode_lib->vba.SingleDPPViewportSizeSupportPerSurface,/* bool ViewportSizeSupportPerSurface[] */
 			&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_boolean_array[1][0]); /* bool           *ViewportSizeSupport */
 
-	MPCCombineMethodAsNeededForPStateChangeAndVoltage = false;
-	MPCCombineMethodAsPossible = false;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsNeededForPStateChangeAndVoltage = false;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsPossible = false;
 
 	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 		if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_reduce_voltage_and_clocks)
-			MPCCombineMethodAsNeededForPStateChangeAndVoltage = true;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsNeededForPStateChangeAndVoltage = true;
 		if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_always_when_possible)
-			MPCCombineMethodAsPossible = true;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsPossible = true;
 	}
-	mode_lib->vba.MPCCombineMethodIncompatible = MPCCombineMethodAsNeededForPStateChangeAndVoltage
-			&& MPCCombineMethodAsPossible;
+	mode_lib->vba.MPCCombineMethodIncompatible = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsNeededForPStateChangeAndVoltage
+			&& v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsPossible;
 
 	for (i = 0; i < v->soc.num_states; i++) {
 		for (j = 0; j < 2; j++) {
-			bool NoChroma;
 			mode_lib->vba.TotalNumberOfActiveDPP[i][j] = 0;
 			mode_lib->vba.TotalAvailablePipesSupport[i][j] = true;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC = dm_odm_combine_mode_disabled;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC = dm_odm_combine_mode_disabled;
 
 			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
-
-				bool TotalAvailablePipesSupportNoDSC;
-				unsigned int NumberOfDPPNoDSC;
-				enum odm_combine_mode ODMModeNoDSC = dm_odm_combine_mode_disabled;
-				double RequiredDISPCLKPerSurfaceNoDSC;
-				bool TotalAvailablePipesSupportDSC;
-				unsigned int NumberOfDPPDSC;
-				enum odm_combine_mode ODMModeDSC = dm_odm_combine_mode_disabled;
-				double RequiredDISPCLKPerSurfaceDSC;
-
 				dml32_CalculateODMMode(
 						mode_lib->vba.MaximumPixelsPerLinePerDSCUnit,
 						mode_lib->vba.HActive[k],
@@ -2022,10 +1983,10 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						mode_lib->vba.DISPCLKDPPCLKVCOSpeed,
 
 						/* Output */
-						&TotalAvailablePipesSupportNoDSC,
-						&NumberOfDPPNoDSC,
-						&ODMModeNoDSC,
-						&RequiredDISPCLKPerSurfaceNoDSC);
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportNoDSC,
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPNoDSC,
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC,
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceNoDSC);
 
 				dml32_CalculateODMMode(
 						mode_lib->vba.MaximumPixelsPerLinePerDSCUnit,
@@ -2043,10 +2004,10 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						mode_lib->vba.DISPCLKDPPCLKVCOSpeed,
 
 						/* Output */
-						&TotalAvailablePipesSupportDSC,
-						&NumberOfDPPDSC,
-						&ODMModeDSC,
-						&RequiredDISPCLKPerSurfaceDSC);
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportDSC,
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPDSC,
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC,
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceDSC);
 
 				dml32_CalculateOutputLink(
 						mode_lib->vba.PHYCLKPerState[i],
@@ -2064,8 +2025,8 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						mode_lib->vba.NumberOfDSCSlices[k],
 						mode_lib->vba.AudioSampleRate[k],
 						mode_lib->vba.AudioSampleLayout[k],
-						ODMModeNoDSC,
-						ODMModeDSC,
+						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC,
+						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC,
 						mode_lib->vba.DSCEnable[k],
 						mode_lib->vba.OutputLinkDPLanes[k],
 						mode_lib->vba.OutputLinkDPRate[k],
@@ -2079,21 +2040,21 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						&mode_lib->vba.RequiredSlots[i][k]);
 
 				if (mode_lib->vba.RequiresDSC[i][k] == false) {
-					mode_lib->vba.ODMCombineEnablePerState[i][k] = ODMModeNoDSC;
+					mode_lib->vba.ODMCombineEnablePerState[i][k] = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC;
 					mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k] =
-							RequiredDISPCLKPerSurfaceNoDSC;
-					if (!TotalAvailablePipesSupportNoDSC)
+							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceNoDSC;
+					if (!v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportNoDSC)
 						mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
 					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
-							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + NumberOfDPPNoDSC;
+							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPNoDSC;
 				} else {
-					mode_lib->vba.ODMCombineEnablePerState[i][k] = ODMModeDSC;
+					mode_lib->vba.ODMCombineEnablePerState[i][k] = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC;
 					mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k] =
-							RequiredDISPCLKPerSurfaceDSC;
-					if (!TotalAvailablePipesSupportDSC)
+							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceDSC;
+					if (!v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportDSC)
 						mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
 					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
-							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + NumberOfDPPDSC;
+							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPDSC;
 				}
 			}
 
@@ -2128,7 +2089,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			}
 
 			mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] = 0;
-			NoChroma = true;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NoChroma = true;
 
 			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 				if (mode_lib->vba.NoOfDPP[i][j][k] == 1)
@@ -2138,17 +2099,17 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						|| mode_lib->vba.SourcePixelFormat[k] == dm_420_10
 						|| mode_lib->vba.SourcePixelFormat[k] == dm_420_12
 						|| mode_lib->vba.SourcePixelFormat[k] == dm_rgbe_alpha) {
-					NoChroma = false;
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NoChroma = false;
 				}
 			}
 
 			if (j == 1 && !dml32_UnboundedRequest(mode_lib->vba.UseUnboundedRequesting,
-							mode_lib->vba.TotalNumberOfActiveDPP[i][j], NoChroma,
+							mode_lib->vba.TotalNumberOfActiveDPP[i][j], v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NoChroma,
 							mode_lib->vba.Output[0])) {
 				while (!(mode_lib->vba.TotalNumberOfActiveDPP[i][j] >= mode_lib->vba.MaxNumDPP
 						|| mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] == 0)) {
-					double BWOfNonCombinedSurfaceOfMaximumBandwidth = 0;
-					unsigned int NumberOfNonCombinedSurfaceOfMaximumBandwidth = 0;
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.BWOfNonCombinedSurfaceOfMaximumBandwidth = 0;
+					NumberOfNonCombinedSurfaceOfMaximumBandwidth = 0;
 
 					for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 						if (mode_lib->vba.MPCCombineUse[k]
@@ -2156,13 +2117,13 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							mode_lib->vba.MPCCombineUse[k] != dm_mpc_reduce_voltage &&
 							mode_lib->vba.ReadBandwidthLuma[k] +
 							mode_lib->vba.ReadBandwidthChroma[k] >
-							BWOfNonCombinedSurfaceOfMaximumBandwidth &&
+							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.BWOfNonCombinedSurfaceOfMaximumBandwidth &&
 							(mode_lib->vba.ODMCombineEnablePerState[i][k] !=
 							dm_odm_combine_mode_2to1 &&
 							mode_lib->vba.ODMCombineEnablePerState[i][k] !=
 							dm_odm_combine_mode_4to1) &&
 								mode_lib->vba.MPCCombine[i][j][k] == false) {
-							BWOfNonCombinedSurfaceOfMaximumBandwidth =
+							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.BWOfNonCombinedSurfaceOfMaximumBandwidth =
 								mode_lib->vba.ReadBandwidthLuma[k]
 								+ mode_lib->vba.ReadBandwidthChroma[k];
 							NumberOfNonCombinedSurfaceOfMaximumBandwidth = k;
@@ -2228,28 +2189,28 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	} // i (VOLTAGE_STATE)
 
 	/* Total Available OTG, HDMIFRL, DP Support Check */
-	TotalNumberOfActiveOTG = 0;
-	TotalNumberOfActiveHDMIFRL = 0;
-	TotalNumberOfActiveDP2p0 = 0;
-	TotalNumberOfActiveDP2p0Outputs = 0;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG = 0;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveHDMIFRL = 0;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 = 0;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs = 0;
 
 	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 		if (mode_lib->vba.BlendingAndTiming[k] == k) {
-			TotalNumberOfActiveOTG = TotalNumberOfActiveOTG + 1;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG + 1;
 			if (mode_lib->vba.Output[k] == dm_dp2p0) {
-				TotalNumberOfActiveDP2p0 = TotalNumberOfActiveDP2p0 + 1;
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 + 1;
 				if (mode_lib->vba.OutputMultistreamId[k]
 						== k || mode_lib->vba.OutputMultistreamEn[k] == false) {
-					TotalNumberOfActiveDP2p0Outputs = TotalNumberOfActiveDP2p0Outputs + 1;
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs + 1;
 				}
 			}
 		}
 	}
 
-	mode_lib->vba.NumberOfOTGSupport = (TotalNumberOfActiveOTG <= mode_lib->vba.MaxNumOTG);
-	mode_lib->vba.NumberOfHDMIFRLSupport = (TotalNumberOfActiveHDMIFRL <= mode_lib->vba.MaxNumHDMIFRLOutputs);
-	mode_lib->vba.NumberOfDP2p0Support = (TotalNumberOfActiveDP2p0 <= mode_lib->vba.MaxNumDP2p0Streams
-			&& TotalNumberOfActiveDP2p0Outputs <= mode_lib->vba.MaxNumDP2p0Outputs);
+	mode_lib->vba.NumberOfOTGSupport = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG <= mode_lib->vba.MaxNumOTG);
+	mode_lib->vba.NumberOfHDMIFRLSupport = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveHDMIFRL <= mode_lib->vba.MaxNumHDMIFRLOutputs);
+	mode_lib->vba.NumberOfDP2p0Support = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 <= mode_lib->vba.MaxNumDP2p0Streams
+			&& v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs <= mode_lib->vba.MaxNumDP2p0Outputs);
 
 	/* Display IO and DSC Support Check */
 	mode_lib->vba.NonsupportedDSCInputBPC = false;
@@ -2264,8 +2225,6 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	}
 
 	for (i = 0; i < v->soc.num_states; ++i) {
-		unsigned int TotalSlots;
-
 		mode_lib->vba.ExceededMultistreamSlots[i] = false;
 		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 			if (mode_lib->vba.OutputMultistreamEn[k] == true && mode_lib->vba.OutputMultistreamId[k] == k) {
@@ -2436,12 +2395,12 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	}
 
 	/* Check DSC Unit and Slices Support */
-	TotalDSCUnitsRequired = 0;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = 0;
 
 	for (i = 0; i < v->soc.num_states; ++i) {
 		mode_lib->vba.NotEnoughDSCUnits[i] = false;
 		mode_lib->vba.NotEnoughDSCSlices[i] = false;
-		TotalDSCUnitsRequired = 0;
+		v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = 0;
 		mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = true;
 		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 			if (mode_lib->vba.RequiresDSC[i][k] == true) {
@@ -2449,33 +2408,31 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					if (mode_lib->vba.HActive[k]
 							> 4 * mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
 						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
-					TotalDSCUnitsRequired = TotalDSCUnitsRequired + 4;
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired + 4;
 					if (mode_lib->vba.NumberOfDSCSlices[k] > 16)
 						mode_lib->vba.NotEnoughDSCSlices[i] = true;
 				} else if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
 					if (mode_lib->vba.HActive[k]
 							> 2 * mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
 						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
-					TotalDSCUnitsRequired = TotalDSCUnitsRequired + 2;
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired + 2;
 					if (mode_lib->vba.NumberOfDSCSlices[k] > 8)
 						mode_lib->vba.NotEnoughDSCSlices[i] = true;
 				} else {
 					if (mode_lib->vba.HActive[k] > mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
 						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
-					TotalDSCUnitsRequired = TotalDSCUnitsRequired + 1;
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired + 1;
 					if (mode_lib->vba.NumberOfDSCSlices[k] > 4)
 						mode_lib->vba.NotEnoughDSCSlices[i] = true;
 				}
 			}
 		}
-		if (TotalDSCUnitsRequired > mode_lib->vba.NumberOfDSC)
+		if (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired > mode_lib->vba.NumberOfDSC)
 			mode_lib->vba.NotEnoughDSCUnits[i] = true;
 	}
 
 	/*DSC Delay per state*/
 	for (i = 0; i < v->soc.num_states; ++i) {
-		unsigned int m;
-
 		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 			mode_lib->vba.DSCDelayPerState[i][k] = dml32_DSCDelayRequirement(
 					mode_lib->vba.RequiresDSC[i][k], mode_lib->vba.ODMCombineEnablePerState[i][k],
@@ -2932,7 +2889,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 		}
 	}
 
-	ReorderingBytes = mode_lib->vba.NumberOfChannels
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes = mode_lib->vba.NumberOfChannels
 			* dml_max3(mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelDataOnly,
 					mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelMixedWithVMData,
 					mode_lib->vba.UrgentOutOfOrderReturnPerChannelVMDataOnly);
@@ -2988,20 +2945,20 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			&& (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame));
 	}
 
-	FullFrameMALLPStateMethod = false;
-	SubViewportMALLPStateMethod = false;
-	PhantomPipeMALLPStateMethod = false;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.FullFrameMALLPStateMethod = false;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod = false;
+	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.PhantomPipeMALLPStateMethod = false;
 
 	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
-			FullFrameMALLPStateMethod = true;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.FullFrameMALLPStateMethod = true;
 		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
-			SubViewportMALLPStateMethod = true;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod = true;
 		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe)
-			PhantomPipeMALLPStateMethod = true;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.PhantomPipeMALLPStateMethod = true;
 	}
-	mode_lib->vba.InvalidCombinationOfMALLUseForPState = (SubViewportMALLPStateMethod
-			!= PhantomPipeMALLPStateMethod) || (SubViewportMALLPStateMethod && FullFrameMALLPStateMethod);
+	mode_lib->vba.InvalidCombinationOfMALLUseForPState = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod
+			!= v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.PhantomPipeMALLPStateMethod) || (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod && v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.FullFrameMALLPStateMethod);
 
 	if (mode_lib->vba.UseMinimumRequiredDCFCLK == true) {
 		dml32_UseMinimumDCFCLK(
@@ -3015,7 +2972,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				mode_lib->vba.SREnterPlusExitTime,
 				mode_lib->vba.ReturnBusWidth,
 				mode_lib->vba.RoundTripPingLatencyCycles,
-				ReorderingBytes,
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes,
 				mode_lib->vba.PixelChunkSizeInKByte,
 				mode_lib->vba.MetaChunkSize,
 				mode_lib->vba.GPUVMEnable,
@@ -3078,7 +3035,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					/ mode_lib->vba.ReturnBWPerState[i][j]
 					> (mode_lib->vba.RoundTripPingLatencyCycles + 32)
 							/ mode_lib->vba.DCFCLKState[i][j]
-							+ ReorderingBytes / mode_lib->vba.ReturnBWPerState[i][j]) {
+							+ v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes / mode_lib->vba.ReturnBWPerState[i][j]) {
 				mode_lib->vba.ROBSupport[i][j] = true;
 			} else {
 				mode_lib->vba.ROBSupport[i][j] = false;
@@ -3120,9 +3077,6 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 	for (i = 0; i < (int) v->soc.num_states; ++i) {
 		for (j = 0; j <= 1; ++j) {
-			double VMDataOnlyReturnBWPerState;
-			double HostVMInefficiencyFactor;
-			unsigned int NextPrefetchModeState;
 
 			mode_lib->vba.TimeCalc = 24 / mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
 
@@ -3162,37 +3116,35 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					mode_lib->vba.UrgentBurstFactorChroma,
 					mode_lib->vba.UrgentBurstFactorCursor);
 
-			VMDataOnlyReturnBWPerState = dml32_get_return_bw_mbps_vm_only(&mode_lib->vba.soc, i,
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.VMDataOnlyReturnBWPerState = dml32_get_return_bw_mbps_vm_only(&mode_lib->vba.soc, i,
 					mode_lib->vba.DCFCLKState[i][j], mode_lib->vba.FabricClockPerState[i],
 					mode_lib->vba.DRAMSpeedPerState[i]);
-			HostVMInefficiencyFactor = 1;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor = 1;
 
 			if (mode_lib->vba.GPUVMEnable && mode_lib->vba.HostVMEnable)
-				HostVMInefficiencyFactor = mode_lib->vba.ReturnBWPerState[i][j]
-						/ VMDataOnlyReturnBWPerState;
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor = mode_lib->vba.ReturnBWPerState[i][j]
+						/ v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.VMDataOnlyReturnBWPerState;
 
 			mode_lib->vba.ExtraLatency = dml32_CalculateExtraLatency(
-					mode_lib->vba.RoundTripPingLatencyCycles, ReorderingBytes,
+					mode_lib->vba.RoundTripPingLatencyCycles, v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes,
 					mode_lib->vba.DCFCLKState[i][j], mode_lib->vba.TotalNumberOfActiveDPP[i][j],
 					mode_lib->vba.PixelChunkSizeInKByte,
 					mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j], mode_lib->vba.MetaChunkSize,
 					mode_lib->vba.ReturnBWPerState[i][j], mode_lib->vba.GPUVMEnable,
 					mode_lib->vba.HostVMEnable, mode_lib->vba.NumberOfActiveSurfaces,
 					mode_lib->vba.NoOfDPPThisState, mode_lib->vba.dpte_group_bytes,
-					HostVMInefficiencyFactor, mode_lib->vba.HostVMMinPageSize,
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor, mode_lib->vba.HostVMMinPageSize,
 					mode_lib->vba.HostVMMaxNonCachedPageTableLevels);
 
-			NextPrefetchModeState = mode_lib->vba.MinPrefetchMode;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState = mode_lib->vba.MinPrefetchMode;
 
 			mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[i][j];
 
 			do {
-				mode_lib->vba.PrefetchModePerState[i][j] = NextPrefetchModeState;
+				mode_lib->vba.PrefetchModePerState[i][j] = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState;
 				mode_lib->vba.MaxVStartup = mode_lib->vba.NextMaxVStartup;
 
 				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
-					DmlPipe myPipe;
-
 					mode_lib->vba.TWait = dml32_CalculateTWait(
 							mode_lib->vba.PrefetchModePerState[i][j],
 							mode_lib->vba.UsesMALLForPStateChange[k],
@@ -3202,34 +3154,34 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							mode_lib->vba.FCLKChangeLatency, mode_lib->vba.UrgLatency[i],
 							mode_lib->vba.SREnterPlusExitTime);
 
-					myPipe.Dppclk = mode_lib->vba.RequiredDPPCLK[i][j][k];
-					myPipe.Dispclk = mode_lib->vba.RequiredDISPCLK[i][j];
-					myPipe.PixelClock = mode_lib->vba.PixelClock[k];
-					myPipe.DCFClkDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
-					myPipe.DPPPerSurface = mode_lib->vba.NoOfDPP[i][j][k];
-					myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
-					myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
-					myPipe.BlockWidth256BytesY = mode_lib->vba.Read256BlockWidthY[k];
-					myPipe.BlockHeight256BytesY = mode_lib->vba.Read256BlockHeightY[k];
-					myPipe.BlockWidth256BytesC = mode_lib->vba.Read256BlockWidthC[k];
-					myPipe.BlockHeight256BytesC = mode_lib->vba.Read256BlockHeightC[k];
-					myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
-					myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
-					myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
-					myPipe.HTotal = mode_lib->vba.HTotal[k];
-					myPipe.HActive = mode_lib->vba.HActive[k];
-					myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
-					myPipe.ODMMode = mode_lib->vba.ODMCombineEnablePerState[i][k];
-					myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
-					myPipe.BytePerPixelY = mode_lib->vba.BytePerPixelY[k];
-					myPipe.BytePerPixelC = mode_lib->vba.BytePerPixelC[k];
-					myPipe.ProgressiveToInterlaceUnitInOPP =
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.Dppclk = mode_lib->vba.RequiredDPPCLK[i][j][k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.Dispclk = mode_lib->vba.RequiredDISPCLK[i][j];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.PixelClock = mode_lib->vba.PixelClock[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.DCFClkDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.DPPPerSurface = mode_lib->vba.NoOfDPP[i][j][k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockWidth256BytesY = mode_lib->vba.Read256BlockWidthY[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockHeight256BytesY = mode_lib->vba.Read256BlockHeightY[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockWidth256BytesC = mode_lib->vba.Read256BlockWidthC[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockHeight256BytesC = mode_lib->vba.Read256BlockHeightC[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.HTotal = mode_lib->vba.HTotal[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.HActive = mode_lib->vba.HActive[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.ODMMode = mode_lib->vba.ODMCombineEnablePerState[i][k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BytePerPixelY = mode_lib->vba.BytePerPixelY[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BytePerPixelC = mode_lib->vba.BytePerPixelC[k];
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.ProgressiveToInterlaceUnitInOPP =
 							mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
 
 					mode_lib->vba.NoTimeForPrefetch[i][j][k] =
 						dml32_CalculatePrefetchSchedule(
-							HostVMInefficiencyFactor,
-							&myPipe,
+							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor,
+							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe,
 							mode_lib->vba.DSCDelayPerState[i][k],
 							mode_lib->vba.DPPCLKDelaySubtotal +
 								mode_lib->vba.DPPCLKDelayCNVCFormater,
@@ -3288,7 +3240,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[0],         // double *Tdmdl_vm
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[1],         // double *Tdmdl
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[2],         // double *TSetup
-							&dummy_integer[0],         							    // unsigned int   *VUpdateOffsetPix
+							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer[0],         							    // unsigned int   *VUpdateOffsetPix
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[3],         // unsigned int   *VUpdateWidthPix
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[4]);        // unsigned int   *VReadyOffsetPix
 				}
@@ -3417,7 +3369,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					}
 
 					for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
-						dml32_CalculateFlipSchedule(HostVMInefficiencyFactor,
+						dml32_CalculateFlipSchedule(v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor,
 							mode_lib->vba.ExtraLatency,
 							mode_lib->vba.UrgLatency[i],
 							mode_lib->vba.GPUVMMaxPageTableLevels,
@@ -3491,7 +3443,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				if (mode_lib->vba.MaxVStartup <= __DML_VBA_MIN_VSTARTUP__
 						|| mode_lib->vba.AnyLinesForVMOrRowTooLarge == false) {
 					mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[i][j];
-					NextPrefetchModeState = NextPrefetchModeState + 1;
+					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState + 1;
 				} else {
 					mode_lib->vba.NextMaxVStartup = mode_lib->vba.NextMaxVStartup - 1;
 				}
@@ -3505,7 +3457,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							&& !mode_lib->vba.ImmediateFlipRequiredFinal)
 							|| mode_lib->vba.ImmediateFlipSupportedForState[i][j] == true))
 					|| (mode_lib->vba.NextMaxVStartup == mode_lib->vba.MaxMaxVStartup[i][j]
-							&& NextPrefetchModeState > mode_lib->vba.MaxPrefetchMode)));
+							&& v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState > mode_lib->vba.MaxPrefetchMode)));
 
 			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
 				mode_lib->vba.use_one_row_for_frame_this_state[k] =
@@ -3581,7 +3533,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						&mode_lib->vba.Watermark, // Store the values in vba
 						&mode_lib->vba.DRAMClockChangeSupport[i][j],
 						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[0], // double *MaxActiveDRAMClockChangeLatencySupported
-						&dummy_integer[0], // Long SubViewportLinesNeededInMALL[]
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer[0], // Long SubViewportLinesNeededInMALL[]
 						&mode_lib->vba.FCLKChangeSupport[i][j],
 						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[1], // double *MinActiveFCLKChangeLatencySupported
 						&mode_lib->vba.USRRetrainingSupport[i][j],
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index 47b149d4bfcf..d4b6fa0a9ee3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -197,6 +197,13 @@ struct DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCal
 	unsigned int ReorderBytes;
 	unsigned int VMDataOnlyReturnBW;
 	double HostVMInefficiencyFactor;
+	DmlPipe myPipe;
+	SOCParametersList mmSOCParameters;
+	double dummy_unit_vector[DC__NUM_DPP__MAX];
+	double dummy_single[2];
+	enum clock_change_support dummy_dramchange_support;
+	enum dm_fclock_change_support dummy_fclkchange_support;
+	bool dummy_USRRetrainingSupport;
 };
 
 struct dml32_ModeSupportAndSystemConfigurationFull {
@@ -212,6 +219,34 @@ struct dml32_ModeSupportAndSystemConfigurationFull {
 	double DSTXAfterScaler[DC__NUM_DPP__MAX];
 	double MaxTotalVActiveRDBandwidth;
 	bool dummy_boolean_array[2][DC__NUM_DPP__MAX];
+	enum odm_combine_mode dummy_odm_mode[DC__NUM_DPP__MAX];
+	DmlPipe myPipe;
+	unsigned int dummy_integer[4];
+	unsigned int TotalNumberOfActiveOTG;
+	unsigned int TotalNumberOfActiveHDMIFRL;
+	unsigned int TotalNumberOfActiveDP2p0;
+	unsigned int TotalNumberOfActiveDP2p0Outputs;
+	unsigned int TotalDSCUnitsRequired;
+	unsigned int ReorderingBytes;
+	unsigned int TotalSlots;
+	unsigned int NumberOfDPPDSC;
+	unsigned int NumberOfDPPNoDSC;
+	unsigned int NextPrefetchModeState;
+	bool MPCCombineMethodAsNeededForPStateChangeAndVoltage;
+	bool MPCCombineMethodAsPossible;
+	bool FullFrameMALLPStateMethod;
+	bool SubViewportMALLPStateMethod;
+	bool PhantomPipeMALLPStateMethod;
+	bool NoChroma;
+	bool TotalAvailablePipesSupportNoDSC;
+	bool TotalAvailablePipesSupportDSC;
+	enum odm_combine_mode ODMModeNoDSC;
+	enum odm_combine_mode ODMModeDSC;
+	double RequiredDISPCLKPerSurfaceNoDSC;
+	double RequiredDISPCLKPerSurfaceDSC;
+	double BWOfNonCombinedSurfaceOfMaximumBandwidth;
+	double VMDataOnlyReturnBWPerState;
+	double HostVMInefficiencyFactor;
 };
 
 struct dummy_vars {
-- 
2.35.3


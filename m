Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E935E7C7BE1
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Oct 2023 05:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED4410E588;
	Fri, 13 Oct 2023 03:04:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F4010E080
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Oct 2023 03:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0mVBYnkdWFRTAB5v5IwuH4geKMrFIb5Inl9DzYoq6tZLB33hb0QDFgUx5c3IByh3puU9BWobhOfhRuT9QNDcq4iVpEnQGIJ+OKVeCBac8427jca9/4EYV3bkkgoDJN5oAUdEU5fFW7Lb3mqxWiopEuA76G+h2TEpCT+LwHlBpkpCxttUJzvgIhtyPG3PpmXpOlY0LUlHqbeATU+almmgRzXSW927thZyPgjNCR+M7BFKl2bqJ/XQ3mm0HeG6ng8HS37vRyEuZywd+3fSpL/0pe4R/9EM+r7Ca9THDUjPrgzrmt5eLyym+y2DEc6+rTk5A4CN4kW4M4O4NmDB2amNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR1/V1WWeQMjUl9nXyAv9uu3WRqxncXJvkESG/Vip48=;
 b=g1HE3WrtX+MTsywcdhww9DBRQbc/zlLcb4fzx9QZKABbwdUj33b81ejtW9b08lUZH7CT4pxnAm48kJRY3AoOEIYCubPC5oAbeHZwvugkqt8LeL8kuG1E0EcClV4RtWW5zZXKyJ8TrFeDRwK7bCEDlwCF7mrsiqKPNRoft3HQWh1KR4USJ0cKewBloJboEULMj19uq3h9Ek3fhrd6We8K2Yw7OLaqTBXJA3KGgAqioOXL2dabXKAnOveAD6K5uiVHXr6g+x8KtlxVN/sy2kCZzzizP1KbYXBVUbPxtOBYJFjnFlq8boZ6QdLr+vsCqlqE+fub4fKxWd7lbtXT/Cn6cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oR1/V1WWeQMjUl9nXyAv9uu3WRqxncXJvkESG/Vip48=;
 b=usyVLucGsywnp1LTLP9MC+v2ybV8XMZZELi82iIyv6SziY12rwgtSqnN+wLNuXFzhQ65Ydf5b98q7Jicb883azQeerZliqI4HLZ88kta0GMk/pooc3KBA/taA75RgR+5Y4ORB06xnXtDljPzcbuSttIxmkwNSOf5S8QIE4hueHg=
Received: from MW2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:907::26) by
 SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Fri, 13 Oct
 2023 03:04:03 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:907:0:cafe::f2) by MW2PR16CA0013.outlook.office365.com
 (2603:10b6:907::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Fri, 13 Oct 2023 03:04:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 13 Oct 2023 03:04:02 +0000
Received: from jenkins-mali-1.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 12 Oct
 2023 22:04:00 -0500
From: Li Ma <li.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/swsmu: update smu v14_0_0 header files and metrics
 table
Date: Fri, 13 Oct 2023 11:03:15 +0800
Message-ID: <20231013030315.1366330-1-li.ma@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SA1PR12MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4bb6be-e852-44ea-0bee-08dbcb990e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZgOD6XNdil4U4epw6G4C+E6j6JqPPgjaobJgFHw3kcLGGZoAfKGcX7ipsNdofzobpmU1FEo2VuNyOTpA2iXqtxpq8DrX9ibeRnJjzHmdf/As5lJJ+efwGmlZu049MAAttD3fMY/FP3ab5LEggIGc0OikooegYLu0ud++XjuKixXrZhbxcfCUftWcNWs5ahdrEFjZNowNkFtOEAHdZSd0eD3tPI7//vqeIDRP3HZDlhpB1anEi5VOdvhIZfHm66/OWU2CenwchaUepGgQMrSGxa3hm6LHyG0F/XrnOuxNKNR9506TL80e1GvMob3X7A19hgQfz4krNooa+IVbMius9pw9EAbm097ks4c/npyD8UdApHj5ItrqZFZ4uEbwQZ49LQGWXkrTSPrrWcQLtWPjMUCTI55Ij98c3J4446muBKGTYsinXDO7Xx6LH+37/koW1uwCxpFuG3s+CqstunjgWKxg/aVD20bW6GghFbEaSkf8Nk0MTbWTOJiVq0dUZv81og8PWTssq51hVF1K1JOmf7hq20m6Y3O/h89cL2FOb2UnmdAkIlOdp8oqBytiaSQ5CfJNwhzTvUkMG4bx+NAhtaJqt/bRIcW6gIFpXdX5jPl5wG5NpCMjnZsKI+3hd7ap3WNzWyURZDltHyfijCQs+qhEGSAxWyxfRz+bsVu/qVETvF0Fbn54ibiR038gF7stqT7J0BpmxUPqehuOP1VBcBeZVnlk3y1yAwx9aSthVAPVnwolCaVaGiIrTrU9pzqgghbNSBbhe26fDAVnuZiuSQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799009)(36840700001)(40470700004)(46966006)(8676002)(478600001)(47076005)(8936002)(4326008)(6666004)(5660300002)(44832011)(19627235002)(70586007)(70206006)(54906003)(6916009)(41300700001)(36756003)(40480700001)(40460700003)(316002)(36860700001)(16526019)(15650500001)(2616005)(83380400001)(30864003)(2906002)(81166007)(1076003)(356005)(426003)(26005)(336012)(7696005)(86362001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 03:04:02.7035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4bb6be-e852-44ea-0bee-08dbcb990e01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318
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
 Yifan Zhang <yifan1.zhang@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Li Ma <li.ma@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Update driver if, pmfw and ppsmc header files.
Add new gpu_metrics_v3_0 for metrics table updated in driver if
and reserve legacy metrics table to maintain backward compatibility.
---
v1:
Update header files and add gpu_metrics_v3_0.
v2:
Update smu_types.h, smu headers and drop smu_cmn_get_smc_version in smu v14_0_0.

Signed-off-by: Li Ma <li.ma@amd.com>
Reviewed-by: Yifan Zhang <yifan1.zhang@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/include/kgd_pp_interface.h    |  68 ++++
 .../inc/pmfw_if/smu14_driver_if_v14_0_0.h     |  69 ++--
 .../pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h   |  29 +-
 .../pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h  |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |   3 +-
 .../drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c  | 318 ++++++++++++++----
 6 files changed, 371 insertions(+), 121 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
index 1d4620322a15..c71e0415e82e 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -1057,4 +1057,72 @@ struct gpu_metrics_v2_4 {
 	uint16_t			average_soc_current;
 	uint16_t			average_gfx_current;
 };
+
+struct gpu_metrics_v3_0 {
+	struct metrics_table_header	common_header;
+
+	/* Temperature */
+	/* gfx temperature on APUs */
+	uint16_t			temperature_gfx;
+	/* soc temperature on APUs */
+	uint16_t			temperature_soc;
+	/* CPU core temperature on APUs */
+	uint16_t			temperature_core[16];
+	/* skin temperature on APUs */
+	uint16_t			temperature_skin;
+
+	/* Utilization */
+	/* time filtered GFX busy % [0-100] */
+	uint16_t			average_gfx_activity;
+	/* time filtered VCN busy % [0-100] */
+	uint16_t			average_vcn_activity;
+	/* time filtered IPU per-column busy % [0-100] */
+	uint16_t 			average_ipu_activity[8];
+	/* time filtered per-core C0 residency % [0-100]*/
+	uint16_t 			average_core_c0_activity[16];
+	/* time filtered DRAM read bandwidth [GB/sec] */
+	uint16_t 			average_dram_reads;
+	/* time filtered DRAM write bandwidth [GB/sec] */
+	uint16_t 			average_dram_writes;
+
+	/* Driver attached timestamp (in ns) */
+	uint64_t			system_clock_counter;
+
+	/* Power/Energy */
+	/* average dGPU + APU power on A + A platform */
+	uint32_t			average_socket_power;
+	/* average IPU power [W] */
+	uint16_t			average_ipu_power;
+	/* average APU power [W] */
+	uint32_t			average_apu_power;
+	/* average dGPU power [W] */
+	uint32_t			average_dgpu_power;
+	/* sum of core power across all cores in the socket [W] */
+	uint32_t			average_core_power;
+	/* calculated core power [W] */
+	uint16_t 			core_power[16];
+	/* maximum IRM defined STAPM power limit [W] */
+	uint16_t 			stapm_power_limit;
+	/* time filtered STAPM power limit [W] */
+	uint16_t 			current_stapm_power_limit;
+
+	/* Average clocks */
+	uint16_t			average_gfxclk_frequency;
+	uint16_t			average_socclk_frequency;
+	uint16_t			average_vpeclk_frequency;
+	uint16_t			average_ipuclk_frequency;
+	uint16_t			average_fclk_frequency;
+	uint16_t			average_vclk_frequency;
+
+	/* Current clocks */
+	/* target core frequency */
+	uint16_t			current_coreclk[16];
+	/* CCLK frequency limit enforced on classic cores [MHz] */
+	uint16_t 			current_core_maxfreq;
+	/* GFXCLK frequency limit enforced on GFX [MHz] */
+	uint16_t 			current_gfx_maxfreq;
+
+	/* Metrics table alpha filter time constant [us] */
+	uint32_t 			time_filter_alphavalue;
+};
 #endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h
index cb6948a0b262..b483c8e096e7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h
@@ -149,23 +149,37 @@ typedef struct {
   uint32_t MaxGfxClk;
 } DpmClocks_t;
 
-
-// Throttler Status Bitmask
-#define THROTTLER_STATUS_BIT_SPL              0
-#define THROTTLER_STATUS_BIT_FPPT             1
-#define THROTTLER_STATUS_BIT_SPPT             2
-#define THROTTLER_STATUS_BIT_SPPT_APU         3
-#define THROTTLER_STATUS_BIT_THM_CORE         4
-#define THROTTLER_STATUS_BIT_THM_GFX          5
-#define THROTTLER_STATUS_BIT_THM_SOC          6
-#define THROTTLER_STATUS_BIT_TDC_VDD          7
-#define THROTTLER_STATUS_BIT_TDC_VDDCCX       8
-#define THROTTLER_STATUS_BIT_TDC_SOC          9
-#define THROTTLER_STATUS_BIT_PROCHOT_CPU      10
-#define THROTTLER_STATUS_BIT_PROCHOT_GFX      11
-#define THROTTLER_STATUS_BIT_EDC_CPU_CLASSIC  12
-#define THROTTLER_STATUS_BIT_EDC_CPU_DENSE    13
-#define THROTTLER_STATUS_BIT_EDC_GFX          14
+typedef struct {
+  uint16_t CoreFrequency[16];           //Target core frequency [MHz]
+  uint16_t CorePower[16];               //CAC calculated core power [W] [Q8.8]
+  uint16_t CoreTemperature[16];         //TSEN measured core temperature [C] [Q8.8]
+  uint16_t GfxTemperature;              //TSEN measured GFX temperature [C] [Q8.8]
+  uint16_t SocTemperature;              //TSEN measured SOC temperature [C] [Q8.8]
+  uint16_t StapmOpnLimit;               //Maximum IRM defined STAPM power limit [W] [Q8.8]
+  uint16_t StapmCurrentLimit;           //Time filtered STAPM power limit [W] [Q8.8]
+  uint16_t InfrastructureCpuMaxFreq;    //CCLK frequency limit enforced on classic cores [MHz]
+  uint16_t InfrastructureGfxMaxFreq;    //GFXCLK frequency limit enforced on GFX [MHz]
+  uint16_t SkinTemp;                    //Maximum skin temperature reported by APU and HS2 chassis sensors [C] [Q8.8]
+  uint16_t AverageGfxclkFrequency;      //Time filtered target GFXCLK frequency [MHz]
+  uint16_t AverageFclkFrequency;        //Time filtered target FCLK frequency [MHz]
+  uint16_t AverageGfxActivity;          //Time filtered GFX busy % [0-100] [Q8.8]
+  uint16_t AverageSocclkFrequency;      //Time filtered target SOCCLK frequency [MHz]
+  uint16_t AverageVclkFrequency;        //Time filtered target VCLK frequency [MHz]
+  uint16_t AverageVcnActivity;          //Time filtered VCN busy % [0-100] [Q8.8]
+  uint16_t AverageVpeclkFrequency;      //Time filtered target VPECLK frequency [MHz]
+  uint16_t AverageIpuclkFrequency;      //Time filtered target IPUCLK frequency [MHz]
+  uint16_t AverageIpuBusy[8];           //Time filtered IPU per-column busy % [0-100] [Q8.8]
+  uint16_t AverageDRAMReads;            //Time filtered DRAM read bandwidth [GB/sec] [Q8.8]
+  uint16_t AverageDRAMWrites;           //Time filtered DRAM write bandwidth [GB/sec] [Q8.8]
+  uint16_t AverageCoreC0Residency[16];  //Time filtered per-core C0 residency % [0-100] [Q8.8]
+  uint16_t IpuPower;                    //Time filtered IPU power [W] [Q8.8]
+  uint32_t ApuPower;                    //Time filtered APU power [W] [Q24.8]
+  uint32_t dGpuPower;                   //Time filtered dGPU power [W] [Q24.8]
+  uint32_t AverageSocketPower;          //Time filtered power used for PPT/STAPM [APU+dGPU] [W] [Q24.8]
+  uint32_t AverageCorePower;            //Time filtered sum of core power across all cores in the socket [W] [Q24.8]
+  uint32_t FilterAlphaValue;            //Metrics table alpha filter time constant [us]
+  uint32_t MetricsCounter;              //Counter that is incremented on every metrics table update [PM_TIMER cycles]
+} SmuMetrics_t;
 
 typedef struct {
   uint16_t GfxclkFrequency;             //[MHz]
@@ -212,7 +226,6 @@ typedef struct {
   uint16_t CurTemp;                     //[centi-Celsius]
   uint16_t FilterAlphaValue;            //[m]
 
-  //PMFW-8735
   uint16_t AverageGfxclkFrequency;
   uint16_t AverageFclkFrequency;
   uint16_t AverageGfxActivity;
@@ -224,20 +237,9 @@ typedef struct {
   uint16_t AverageSocketPower;        //Filtered value of CurrentSocketPower
   uint16_t AverageCorePower[2];       //Filtered of [sum of CorePower[8] per ccx])
   uint16_t AverageCoreC0Residency[16]; //Filtered of [average C0 residency % per core]
-  uint16_t spare3;
+  uint16_t spare1;
   uint32_t MetricsCounter;            //Counts the # of metrics table parameter reads per update to the metrics table, i.e. if the metrics table update happens every 1 second, this value could be up to 1000 if the smu collected metrics data every cycle, or as low as 0 if the smu was asleep the whole time. Reset to 0 after writing.
-} SmuMetrics_t;
-
-typedef struct {
-  uint16_t StapmMaxPlatformLimit;            //[W]
-  uint16_t StapmMinPlatformLimit;            //[W]
-  uint16_t FastPptMaxPlatformLimit;          //[W]
-  uint16_t FastPptMinPlatformLimit;          //[W]
-  uint16_t SlowPptMaxPlatformLimit;          //[W]
-  uint16_t SlowPptMinPlatformLimit;          //[W]
-  uint16_t SlowPptApuMaxPlatformLimit;       //[W]
-  uint16_t SlowPptApuMinPlatformLimit;       //[W]
-} PmfInfo_t;
+} SmuMetrics_legacy_t;
 
 //ISP tile definitions
 typedef enum {
@@ -272,10 +274,9 @@ typedef enum {
 #define TABLE_CUSTOM_DPM            2 // Called by Driver
 #define TABLE_BIOS_GPIO_CONFIG      3 // Called by BIOS
 #define TABLE_DPMCLOCKS             4 // Called by Driver and VBIOS
-#define TABLE_MOMENTARY_PM          5 // Called by Tools
+#define TABLE_SPARE0                5 // Unused
 #define TABLE_MODERN_STDBY          6 // Called by Tools for Modern Standby Log
 #define TABLE_SMU_METRICS           7 // Called by Driver and SMF/PMF
-#define TABLE_INFRASTRUCTURE_LIMITS 8 // Called by SMF/PMF
-#define TABLE_COUNT                 9
+#define TABLE_COUNT                 8
 
 #endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h
index 0dea30cceb98..356e0f57a426 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h
@@ -58,22 +58,22 @@
 #define FEATURE_DS_LCLK_BIT                 23
 #define FEATURE_LOW_POWER_DCNCLKS_BIT       24  // for all DISP clks
 #define FEATURE_DS_SHUBCLK_BIT              25
-#define FEATURE_GFX_TEMP_VMIN_BIT           26
+#define FEATURE_SPARE0_BIT                  26  //SPARE
 #define FEATURE_ZSTATES_BIT                 27
 #define FEATURE_IOMMUL2_PG_BIT              28
 #define FEATURE_DS_FCLK_BIT                 29
 #define FEATURE_DS_SMNCLK_BIT               30
 #define FEATURE_DS_MP1CLK_BIT               31
-#define FEATURE_RESERVED3                   32
+#define FEATURE_WHISPER_MODE_BIT            32
 #define FEATURE_SMU_LOW_POWER_BIT           33
 #define FEATURE_SMART_L3_RINSER_BIT         34
-#define FEATURE_GFX_DEM_BIT                 35
+#define FEATURE_SPARE1_BIT                  35  //SPARE
 #define FEATURE_PSI_BIT                     36
 #define FEATURE_PROCHOT_BIT                 37
 #define FEATURE_CPUOFF_BIT                  38
 #define FEATURE_STAPM_BIT                   39
 #define FEATURE_S0I3_BIT                    40
-#define FEATURE_DF_LIGHT_CSTATE             41   // shift the order or DFCstate annd DF light Cstate
+#define FEATURE_DF_LIGHT_CSTATE             41
 #define FEATURE_PERF_LIMIT_BIT              42
 #define FEATURE_CORE_DLDO_BIT               43
 #define FEATURE_DVO_BIT                     44
@@ -81,7 +81,7 @@
 #define FEATURE_CPPC_BIT                    46
 #define FEATURE_CPPC_PREFERRED_CORES        47
 #define FEATURE_DF_CSTATES_BIT              48
-#define FEATURE_RESERVED4                   49
+#define FEATURE_SPARE2_BIT                  49  //SPARE
 #define FEATURE_ATHUB_PG_BIT                50
 #define FEATURE_VDDOFF_ECO_BIT              51
 #define FEATURE_ZSTATES_ECO_BIT             52
@@ -89,12 +89,12 @@
 #define FEATURE_DS_UMCCLK_BIT               54
 #define FEATURE_DS_ISPCLK_BIT               55
 #define FEATURE_DS_HSPCLK_BIT               56
-#define FEATURE_RESERVED5                   57
+#define FEATURE_P3T_BIT                     57
 #define FEATURE_DS_IPUCLK_BIT               58
 #define FEATURE_DS_VPECLK_BIT               59
 #define FEATURE_VPE_DPM_BIT                 60
-#define FEATURE_BABYPHASE_SVI3_BIT          61
-#define FEATURE_FP_DIDT_BIT                 62
+#define FEATURE_SPARE_61                    61
+#define FEATURE_FP_DIDT                     62
 #define NUM_FEATURES                        63
 
 // Firmware Header/Footer
@@ -123,12 +123,13 @@ typedef struct {
   uint32_t DpmHubTask           : 4;
   // MP1_EXT_SCRATCH1
   uint32_t CclkSyncStatus       : 8;
+  uint32_t Ccx0CpuOff           : 2;
+  uint32_t Ccx1CpuOff           : 2;
   uint32_t GfxOffStatus         : 2;
-  uint32_t CpuOff               : 2;
   uint32_t VddOff               : 1;
-  uint32_t spare0               : 3;
+  uint32_t InWhisperMode        : 1;
   uint32_t ZstateStatus         : 4;
-  uint32_t spare1               : 4;
+  uint32_t spare0               : 4;
   uint32_t DstateFun            : 4;
   uint32_t DstateDev            : 4;
   // MP1_EXT_SCRATCH2
@@ -140,10 +141,10 @@ typedef struct {
   uint32_t MsgPortBusy          :24;
   uint32_t RsmuPmiP1Pending     : 1;
   uint32_t DfCstateExitPending  : 1;
-  uint32_t Pc6EntryPending      : 1;
-  uint32_t Pc6ExitPending       : 1;
+  uint32_t Ccx0Pc6ExitPending   : 1;
+  uint32_t Ccx1Pc6ExitPending   : 1;
   uint32_t WarmResetPending     : 1;
-  uint32_t spare2               : 3;
+  uint32_t spare1               : 3;
   // MP1_EXT_SCRATCH5
   uint32_t IdleMask             :32;
   // MP1_EXT_SCRATCH6 = RTOS threads' status
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h
index 82fec93e0114..8a8a57c56bc0 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h
@@ -75,8 +75,8 @@
 
 #define PPSMC_MSG_EnableGfxImu                  0x16 ///< Enable GFX IMU
 
-#define PPSMC_MSG_GetGfxclkFrequency            0x17 ///< Get GFX clock frequency
-#define PPSMC_MSG_GetFclkFrequency              0x18 ///< Get FCLK frequency
+#define PPSMC_MSG_spare_0x17                    0x17
+#define PPSMC_MSG_spare_0x18                    0x18
 #define PPSMC_MSG_AllowGfxOff                   0x19 ///< Inform PMFW of allowing GFXOFF entry
 #define PPSMC_MSG_DisallowGfxOff                0x1A ///< Inform PMFW of disallowing GFXOFF entry
 #define PPSMC_MSG_SetSoftMaxGfxClk              0x1B ///< Set soft max for GFX CLK
@@ -85,6 +85,7 @@
 #define PPSMC_MSG_SetSoftMaxSocclkByFreq        0x1D ///< Set soft max for SOC CLK
 #define PPSMC_MSG_SetSoftMaxFclkByFreq          0x1E ///< Set soft max for FCLK
 #define PPSMC_MSG_SetSoftMaxVcn                 0x1F ///< Set soft max for VCN clocks (VCLK and DCLK)
+#define PPSMC_MSG_spare_0x20                    0x20
 #define PPSMC_MSG_PowerDownJpeg                 0x21 ///< Power down Jpeg
 #define PPSMC_MSG_PowerUpJpeg                   0x22 ///< Power up Jpeg; VCN is power gated by default
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
index 098267ec0a83..9dd47d91093e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
@@ -422,7 +422,8 @@ enum smu_clk_type {
        __SMU_DUMMY_MAP(ATHUB_MMHUB_PG),			\
        __SMU_DUMMY_MAP(BACO_CG),			\
        __SMU_DUMMY_MAP(SOC_CG),    \
-       __SMU_DUMMY_MAP(LOW_POWER_DCNCLKS),
+       __SMU_DUMMY_MAP(LOW_POWER_DCNCLKS),       \
+       __SMU_DUMMY_MAP(WHISPER_MODE),
 
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(feature)	SMU_FEATURE_##feature##_BIT
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
index eb613687513a..c25f595feb88 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
@@ -67,47 +67,45 @@
 	FEATURE_MASK(FEATURE_VPE_DPM_BIT))
 
 static struct cmn2asic_msg_mapping smu_v14_0_0_message_map[SMU_MSG_MAX_COUNT] = {
-	MSG_MAP(TestMessage,                    PPSMC_MSG_TestMessage,			1),
-	MSG_MAP(GetSmuVersion,                  PPSMC_MSG_GetPmfwVersion,		1),
-	MSG_MAP(GetDriverIfVersion,             PPSMC_MSG_GetDriverIfVersion,		1),
-	MSG_MAP(PowerDownVcn,                   PPSMC_MSG_PowerDownVcn,			1),
-	MSG_MAP(PowerUpVcn,                     PPSMC_MSG_PowerUpVcn,			1),
-	MSG_MAP(SetHardMinVcn,                  PPSMC_MSG_SetHardMinVcn,		1),
-	MSG_MAP(SetSoftMinGfxclk,               PPSMC_MSG_SetSoftMinGfxclk,		1),
-	MSG_MAP(PrepareMp1ForUnload,            PPSMC_MSG_PrepareMp1ForUnload,		1),
-	MSG_MAP(SetDriverDramAddrHigh,          PPSMC_MSG_SetDriverDramAddrHigh,	1),
-	MSG_MAP(SetDriverDramAddrLow,           PPSMC_MSG_SetDriverDramAddrLow,		1),
-	MSG_MAP(TransferTableSmu2Dram,          PPSMC_MSG_TransferTableSmu2Dram,	1),
-	MSG_MAP(TransferTableDram2Smu,          PPSMC_MSG_TransferTableDram2Smu,	1),
-	MSG_MAP(GfxDeviceDriverReset,           PPSMC_MSG_GfxDeviceDriverReset,		1),
-	MSG_MAP(GetEnabledSmuFeatures,          PPSMC_MSG_GetEnabledSmuFeatures,	1),
-	MSG_MAP(SetHardMinSocclkByFreq,         PPSMC_MSG_SetHardMinSocclkByFreq,	1),
-	MSG_MAP(SetSoftMinFclk,              	PPSMC_MSG_SetSoftMinFclk,		1),
-	MSG_MAP(SetSoftMinVcn,                  PPSMC_MSG_SetSoftMinVcn,		1),
-	MSG_MAP(EnableGfxImu,              		PPSMC_MSG_EnableGfxImu,		1),
-	MSG_MAP(GetGfxclkFrequency,             PPSMC_MSG_GetGfxclkFrequency,		1),
-	MSG_MAP(GetFclkFrequency,               PPSMC_MSG_GetFclkFrequency,		1),
-	MSG_MAP(AllowGfxOff,                    PPSMC_MSG_AllowGfxOff,			1),
-	MSG_MAP(DisallowGfxOff,                 PPSMC_MSG_DisallowGfxOff,		1),
-	MSG_MAP(SetSoftMaxGfxClk,               PPSMC_MSG_SetSoftMaxGfxClk,		1),
-	MSG_MAP(SetHardMinGfxClk,               PPSMC_MSG_SetHardMinGfxClk,		1),
-	MSG_MAP(SetSoftMaxSocclkByFreq,         PPSMC_MSG_SetSoftMaxSocclkByFreq,	1),
-	MSG_MAP(SetSoftMaxFclkByFreq,           PPSMC_MSG_SetSoftMaxFclkByFreq,		1),
-	MSG_MAP(SetSoftMaxVcn,                  PPSMC_MSG_SetSoftMaxVcn,		1),
-	MSG_MAP(PowerDownJpeg,                  PPSMC_MSG_PowerDownJpeg,		1),
-	MSG_MAP(PowerUpJpeg,                    PPSMC_MSG_PowerUpJpeg,			1),
-	MSG_MAP(SetHardMinFclkByFreq,           PPSMC_MSG_SetHardMinFclkByFreq,		1),
-	MSG_MAP(SetSoftMinSocclkByFreq,         PPSMC_MSG_SetSoftMinSocclkByFreq,	1),
-	MSG_MAP(PowerDownIspByTile,             PPSMC_MSG_PowerDownIspByTile,		1),
-	MSG_MAP(PowerUpIspByTile,               PPSMC_MSG_PowerUpIspByTile,		1),
+	MSG_MAP(TestMessage,                    PPSMC_MSG_TestMessage,					1),
+	MSG_MAP(GetSmuVersion,                  PPSMC_MSG_GetPmfwVersion,				1),
+	MSG_MAP(GetDriverIfVersion,             PPSMC_MSG_GetDriverIfVersion,			1),
+	MSG_MAP(PowerDownVcn,                   PPSMC_MSG_PowerDownVcn,					1),
+	MSG_MAP(PowerUpVcn,                     PPSMC_MSG_PowerUpVcn,					1),
+	MSG_MAP(SetHardMinVcn,                  PPSMC_MSG_SetHardMinVcn,				1),
+	MSG_MAP(SetSoftMinGfxclk,               PPSMC_MSG_SetSoftMinGfxclk,				1),
+	MSG_MAP(PrepareMp1ForUnload,            PPSMC_MSG_PrepareMp1ForUnload,			1),
+	MSG_MAP(SetDriverDramAddrHigh,          PPSMC_MSG_SetDriverDramAddrHigh,		1),
+	MSG_MAP(SetDriverDramAddrLow,           PPSMC_MSG_SetDriverDramAddrLow,			1),
+	MSG_MAP(TransferTableSmu2Dram,          PPSMC_MSG_TransferTableSmu2Dram,		1),
+	MSG_MAP(TransferTableDram2Smu,          PPSMC_MSG_TransferTableDram2Smu,		1),
+	MSG_MAP(GfxDeviceDriverReset,           PPSMC_MSG_GfxDeviceDriverReset,			1),
+	MSG_MAP(GetEnabledSmuFeatures,          PPSMC_MSG_GetEnabledSmuFeatures,		1),
+	MSG_MAP(SetHardMinSocclkByFreq,         PPSMC_MSG_SetHardMinSocclkByFreq,		1),
+	MSG_MAP(SetSoftMinFclk,              	PPSMC_MSG_SetSoftMinFclk,				1),
+	MSG_MAP(SetSoftMinVcn,                  PPSMC_MSG_SetSoftMinVcn,				1),
+	MSG_MAP(EnableGfxImu,              		PPSMC_MSG_EnableGfxImu,					1),
+	MSG_MAP(AllowGfxOff,                    PPSMC_MSG_AllowGfxOff,					1),
+	MSG_MAP(DisallowGfxOff,                 PPSMC_MSG_DisallowGfxOff,				1),
+	MSG_MAP(SetSoftMaxGfxClk,               PPSMC_MSG_SetSoftMaxGfxClk,				1),
+	MSG_MAP(SetHardMinGfxClk,               PPSMC_MSG_SetHardMinGfxClk,				1),
+	MSG_MAP(SetSoftMaxSocclkByFreq,         PPSMC_MSG_SetSoftMaxSocclkByFreq,		1),
+	MSG_MAP(SetSoftMaxFclkByFreq,           PPSMC_MSG_SetSoftMaxFclkByFreq,			1),
+	MSG_MAP(SetSoftMaxVcn,                  PPSMC_MSG_SetSoftMaxVcn,				1),
+	MSG_MAP(PowerDownJpeg,                  PPSMC_MSG_PowerDownJpeg,				1),
+	MSG_MAP(PowerUpJpeg,                    PPSMC_MSG_PowerUpJpeg,					1),
+	MSG_MAP(SetHardMinFclkByFreq,           PPSMC_MSG_SetHardMinFclkByFreq,			1),
+	MSG_MAP(SetSoftMinSocclkByFreq,         PPSMC_MSG_SetSoftMinSocclkByFreq,		1),
+	MSG_MAP(PowerDownIspByTile,             PPSMC_MSG_PowerDownIspByTile,			1),
+	MSG_MAP(PowerUpIspByTile,               PPSMC_MSG_PowerUpIspByTile,				1),
 	MSG_MAP(SetHardMinIspiclkByFreq,        PPSMC_MSG_SetHardMinIspiclkByFreq,		1),
 	MSG_MAP(SetHardMinIspxclkByFreq,        PPSMC_MSG_SetHardMinIspxclkByFreq,		1),
-	MSG_MAP(PowerUpVpe,        				PPSMC_MSG_PowerUpVpe,		1),
-	MSG_MAP(PowerDownVpe,        			PPSMC_MSG_PowerDownVpe,		1),
-	MSG_MAP(PowerUpUmsch,        			PPSMC_MSG_PowerUpUmsch,		1),
-	MSG_MAP(PowerDownUmsch,        			PPSMC_MSG_PowerDownUmsch,	1),
-	MSG_MAP(SetSoftMaxVpe,        			PPSMC_MSG_SetSoftMaxVpe,		1),
-	MSG_MAP(SetSoftMinVpe,        			PPSMC_MSG_SetSoftMinVpe,	1),
+	MSG_MAP(PowerUpVpe,        				PPSMC_MSG_PowerUpVpe,					1),
+	MSG_MAP(PowerDownVpe,        			PPSMC_MSG_PowerDownVpe,					1),
+	MSG_MAP(PowerUpUmsch,        			PPSMC_MSG_PowerUpUmsch,					1),
+	MSG_MAP(PowerDownUmsch,        			PPSMC_MSG_PowerDownUmsch,				1),
+	MSG_MAP(SetSoftMaxVpe,        			PPSMC_MSG_SetSoftMaxVpe,				1),
+	MSG_MAP(SetSoftMinVpe,        			PPSMC_MSG_SetSoftMinVpe,				1),
 };
 
 static struct cmn2asic_mapping smu_v14_0_0_feature_mask_map[SMU_FEATURE_COUNT] = {
@@ -129,7 +127,6 @@ static struct cmn2asic_mapping smu_v14_0_0_feature_mask_map[SMU_FEATURE_COUNT] =
 	FEA_MAP(LOW_POWER_DCNCLKS),
 	FEA_MAP(DS_FCLK),
 	FEA_MAP(DS_MP1CLK),
-	FEA_MAP(GFX_DEM),
 	FEA_MAP(PSI),
 	FEA_MAP(PROCHOT),
 	FEA_MAP(CPUOFF),
@@ -159,23 +156,31 @@ static int smu_v14_0_0_init_smc_tables(struct smu_context *smu)
 		PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_DPMCLOCKS, sizeof(DpmClocks_t),
 		PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
-	SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS, sizeof(SmuMetrics_t),
-		PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	if (smu->smc_fw_version > 0x5d3500) {
+		SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS, sizeof(SmuMetrics_t),
+			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+		smu_table->metrics_table = kzalloc(sizeof(SmuMetrics_t), GFP_KERNEL);
+	} else {
+		SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS, sizeof(SmuMetrics_legacy_t),
+			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+		smu_table->metrics_table = kzalloc(sizeof(SmuMetrics_legacy_t), GFP_KERNEL);
+	}
+	if (!smu_table->metrics_table)
+		goto err0_out;
+	smu_table->metrics_time = 0;
 
 	smu_table->clocks_table = kzalloc(sizeof(DpmClocks_t), GFP_KERNEL);
 	if (!smu_table->clocks_table)
-		goto err0_out;
-
-	smu_table->metrics_table = kzalloc(sizeof(SmuMetrics_t), GFP_KERNEL);
-	if (!smu_table->metrics_table)
 		goto err1_out;
-	smu_table->metrics_time = 0;
 
 	smu_table->watermarks_table = kzalloc(sizeof(Watermarks_t), GFP_KERNEL);
 	if (!smu_table->watermarks_table)
 		goto err2_out;
 
-	smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v2_1);
+	if (smu->smc_fw_version > 0x5d3500)
+		smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v3_0);
+	else
+		smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v2_1);
 	smu_table->gpu_metrics_table = kzalloc(smu_table->gpu_metrics_table_size, GFP_KERNEL);
 	if (!smu_table->gpu_metrics_table)
 		goto err3_out;
@@ -185,9 +190,9 @@ static int smu_v14_0_0_init_smc_tables(struct smu_context *smu)
 err3_out:
 	kfree(smu_table->watermarks_table);
 err2_out:
-	kfree(smu_table->metrics_table);
+	kfree(smu_table->clocks_table);	
 err1_out:
-	kfree(smu_table->clocks_table);
+	kfree(smu_table->metrics_table);
 err0_out:
 	return -ENOMEM;
 }
@@ -231,6 +236,96 @@ static int smu_v14_0_0_get_smu_metrics_data(struct smu_context *smu,
 	SmuMetrics_t *metrics = (SmuMetrics_t *)smu_table->metrics_table;
 	int ret = 0;
 
+	ret = smu_cmn_get_metrics_table(smu, NULL, false);
+	if (ret)
+		return ret;
+
+	switch (member) {
+	case METRICS_AVERAGE_GFXCLK:
+		*value = metrics->AverageGfxclkFrequency;
+		break;
+	case METRICS_AVERAGE_SOCCLK:
+		*value = metrics->AverageSocclkFrequency;
+		break;
+	case METRICS_AVERAGE_VCLK:
+		*value = metrics->AverageVclkFrequency;
+		break;
+	case METRICS_AVERAGE_DCLK:
+		*value = 0;
+		break;
+	case METRICS_AVERAGE_UCLK:
+		*value = 0;
+		break;
+	case METRICS_AVERAGE_FCLK:
+		*value = metrics->AverageFclkFrequency;
+		break;
+	case METRICS_AVERAGE_GFXACTIVITY:
+		*value = metrics->AverageGfxActivity >> 8;
+		break;
+	case METRICS_AVERAGE_VCNACTIVITY:
+		*value = metrics->AverageVcnActivity >> 8;
+		break;
+	case METRICS_AVERAGE_SOCKETPOWER:
+	case METRICS_CURR_SOCKETPOWER:
+		*value = (metrics->AverageSocketPower & 0xff00) +
+		((metrics->AverageSocketPower & 0xff) * 100 >> 8);
+		break;
+	case METRICS_TEMPERATURE_EDGE:
+		*value = (metrics->GfxTemperature >> 8) *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_HOTSPOT:
+		*value = (metrics->SocTemperature >> 8) *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_THROTTLER_STATUS:
+		*value = 0;
+		break;
+	case METRICS_VOLTAGE_VDDGFX:
+		*value = 0;
+		break;
+	case METRICS_VOLTAGE_VDDSOC:
+		*value = 0;
+		break;
+	case METRICS_SS_APU_SHARE:
+		/* return the percentage of APU power with respect to APU's power limit.
+		 * percentage is reported, this isn't boost value. Smartshift power
+		 * boost/shift is only when the percentage is more than 100.
+		 */
+		if (metrics->StapmOpnLimit > 0)
+			*value = (metrics->ApuPower * 100) / metrics->StapmOpnLimit;
+		else
+			*value = 0;
+		break;
+	case METRICS_SS_DGPU_SHARE:
+		/* return the percentage of dGPU power with respect to dGPU's power limit.
+		 * percentage is reported, this isn't boost value. Smartshift power
+		 * boost/shift is only when the percentage is more than 100.
+		 */
+		if ((metrics->dGpuPower > 0) &&
+		    (metrics->StapmCurrentLimit > metrics->StapmOpnLimit))
+			*value = (metrics->dGpuPower * 100) /
+				 (metrics->StapmCurrentLimit - metrics->StapmOpnLimit);
+		else
+			*value = 0;
+		break;
+	default:
+		*value = UINT_MAX;
+		break;
+	}
+
+	return ret;
+}
+
+static int smu_v14_0_0_legacy_get_smu_metrics_data(struct smu_context *smu,
+					    MetricsMember_t member,
+					    uint32_t *value)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+
+	SmuMetrics_legacy_t *metrics = (SmuMetrics_legacy_t *)smu_table->metrics_table;
+	int ret = 0;
+
 	ret = smu_cmn_get_metrics_table(smu, NULL, false);
 	if (ret)
 		return ret;
@@ -254,6 +349,9 @@ static int smu_v14_0_0_get_smu_metrics_data(struct smu_context *smu,
 	case METRICS_AVERAGE_GFXACTIVITY:
 		*value = metrics->GfxActivity / 100;
 		break;
+	case METRICS_AVERAGE_FCLK:
+		*value = metrics->AverageFclkFrequency;
+		break;
 	case METRICS_AVERAGE_VCNACTIVITY:
 		*value = metrics->UvdActivity;
 		break;
@@ -310,6 +408,16 @@ static int smu_v14_0_0_get_smu_metrics_data(struct smu_context *smu,
 	return ret;
 }
 
+static int smu_v14_0_0_common_get_smu_metrics_data(struct smu_context *smu,
+					    MetricsMember_t member,
+					    uint32_t *value)
+{
+	if (smu->smc_fw_version > 0x5d3500)
+		return smu_v14_0_0_get_smu_metrics_data(smu, member, value);
+	else
+		return smu_v14_0_0_legacy_get_smu_metrics_data(smu, member, value);
+}
+
 static int smu_v14_0_0_read_sensor(struct smu_context *smu,
 				   enum amd_pp_sensors sensor,
 				   void *data, uint32_t *size)
@@ -321,69 +429,69 @@ static int smu_v14_0_0_read_sensor(struct smu_context *smu,
 
 	switch (sensor) {
 	case AMDGPU_PP_SENSOR_GPU_LOAD:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_AVERAGE_GFXACTIVITY,
 						       (uint32_t *)data);
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_GPU_AVG_POWER:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_AVERAGE_SOCKETPOWER,
 						       (uint32_t *)data);
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_GPU_INPUT_POWER:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_CURR_SOCKETPOWER,
 						       (uint32_t *)data);
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_EDGE_TEMP:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_TEMPERATURE_EDGE,
 						       (uint32_t *)data);
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_TEMPERATURE_HOTSPOT,
 						       (uint32_t *)data);
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_GFX_MCLK:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_AVERAGE_UCLK,
 						       (uint32_t *)data);
 		*(uint32_t *)data *= 100;
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_GFX_SCLK:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_AVERAGE_GFXCLK,
 						       (uint32_t *)data);
 		*(uint32_t *)data *= 100;
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_VDDGFX:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_VOLTAGE_VDDGFX,
 						       (uint32_t *)data);
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_VDDNB:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_VOLTAGE_VDDSOC,
 						       (uint32_t *)data);
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_SS_APU_SHARE:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_SS_APU_SHARE,
 						       (uint32_t *)data);
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_SS_DGPU_SHARE:
-		ret = smu_v14_0_0_get_smu_metrics_data(smu,
+		ret = smu_v14_0_0_common_get_smu_metrics_data(smu,
 						       METRICS_SS_DGPU_SHARE,
 						       (uint32_t *)data);
 		*size = 4;
@@ -469,11 +577,74 @@ static int smu_v14_0_0_set_watermarks_table(struct smu_context *smu,
 
 static ssize_t smu_v14_0_0_get_gpu_metrics(struct smu_context *smu,
 						void **table)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct gpu_metrics_v3_0 *gpu_metrics =
+		(struct gpu_metrics_v3_0 *)smu_table->gpu_metrics_table;
+	SmuMetrics_t metrics;
+	int ret = 0;
+
+	ret = smu_cmn_get_metrics_table(smu, &metrics, true);
+	if (ret)
+		return ret;
+
+	smu_cmn_init_soft_gpu_metrics(gpu_metrics, 2, 1);
+
+	gpu_metrics->temperature_gfx = metrics.GfxTemperature;
+	gpu_metrics->temperature_soc = metrics.SocTemperature;
+	memcpy(&gpu_metrics->temperature_core[0],
+		&metrics.CoreTemperature[0],
+		sizeof(uint16_t) * 16);
+	gpu_metrics->temperature_skin = metrics.SkinTemp;
+
+	gpu_metrics->average_gfx_activity = metrics.AverageGfxActivity;
+	gpu_metrics->average_vcn_activity = metrics.AverageVcnActivity;
+	memcpy(&gpu_metrics->average_ipu_activity[0],
+		&metrics.AverageIpuBusy[0],
+		sizeof(uint16_t) * 8);
+	memcpy(&gpu_metrics->average_core_c0_activity[0],
+		&metrics.AverageCoreC0Residency[0],
+		sizeof(uint16_t) * 16);
+	gpu_metrics->average_dram_reads = metrics.AverageDRAMReads;
+	gpu_metrics->average_dram_writes = metrics.AverageDRAMWrites;
+
+	gpu_metrics->average_socket_power = metrics.AverageSocketPower;
+	gpu_metrics->average_ipu_power = metrics.IpuPower;
+	gpu_metrics->average_apu_power = metrics.ApuPower;
+	gpu_metrics->average_dgpu_power = metrics.dGpuPower;
+	gpu_metrics->average_core_power = metrics.AverageCorePower;
+	memcpy(&gpu_metrics->core_power[0],
+		&metrics.CorePower[0],
+		sizeof(uint16_t) * 16);
+
+	gpu_metrics->average_gfxclk_frequency = metrics.AverageGfxclkFrequency;
+	gpu_metrics->average_socclk_frequency = metrics.AverageSocclkFrequency;
+	gpu_metrics->average_vpeclk_frequency = metrics.AverageVpeclkFrequency;
+	gpu_metrics->average_fclk_frequency = metrics.AverageFclkFrequency;
+	gpu_metrics->average_vclk_frequency = metrics.AverageVclkFrequency;
+	gpu_metrics->average_ipuclk_frequency = metrics.AverageIpuclkFrequency;
+
+	memcpy(&gpu_metrics->current_coreclk[0],
+		&metrics.CoreFrequency[0],
+		sizeof(uint16_t) * 16);
+	gpu_metrics->current_core_maxfreq = metrics.InfrastructureCpuMaxFreq;
+	gpu_metrics->current_gfx_maxfreq = metrics.InfrastructureGfxMaxFreq;
+
+	gpu_metrics->time_filter_alphavalue = metrics.FilterAlphaValue;
+	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
+
+	*table = (void *)gpu_metrics;
+
+	return sizeof(struct gpu_metrics_v3_0);
+}
+
+static ssize_t smu_v14_0_0_get_legacy_gpu_metrics(struct smu_context *smu,
+						void **table)
 {
 	struct smu_table_context *smu_table = &smu->smu_table;
 	struct gpu_metrics_v2_1 *gpu_metrics =
 		(struct gpu_metrics_v2_1 *)smu_table->gpu_metrics_table;
-	SmuMetrics_t metrics;
+	SmuMetrics_legacy_t metrics;
 	int ret = 0;
 
 	ret = smu_cmn_get_metrics_table(smu, &metrics, true);
@@ -519,6 +690,16 @@ static ssize_t smu_v14_0_0_get_gpu_metrics(struct smu_context *smu,
 	return sizeof(struct gpu_metrics_v2_1);
 }
 
+static ssize_t smu_v14_0_0_common_get_gpu_metrics(struct smu_context *smu,
+				      void **table)
+{
+
+	if (smu->smc_fw_version > 0x5d3500)
+			return smu_v14_0_0_get_gpu_metrics(smu, table);
+	else
+			return smu_v14_0_0_get_legacy_gpu_metrics(smu, table);
+}
+
 static int smu_v14_0_0_mode2_reset(struct smu_context *smu)
 {
 	int ret;
@@ -737,20 +918,17 @@ static int smu_v14_0_0_get_current_clk_freq(struct smu_context *smu,
 		member_type = METRICS_AVERAGE_UCLK;
 		break;
 	case SMU_FCLK:
-		return smu_cmn_send_smc_msg_with_param(smu,
-						       SMU_MSG_GetFclkFrequency,
-						       0, value);
+		member_type = METRICS_AVERAGE_FCLK;
+		break;
 	case SMU_GFXCLK:
 	case SMU_SCLK:
-		return smu_cmn_send_smc_msg_with_param(smu,
-						       SMU_MSG_GetGfxclkFrequency,
-						       0, value);
+		member_type = METRICS_AVERAGE_GFXCLK;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	return smu_v14_0_0_get_smu_metrics_data(smu, member_type, value);
+	return smu_v14_0_0_common_get_smu_metrics_data(smu, member_type, value);
 }
 
 static int smu_v14_0_0_get_dpm_level_count(struct smu_context *smu,
@@ -1052,7 +1230,7 @@ static const struct pptable_funcs smu_v14_0_0_ppt_funcs = {
 	.read_sensor = smu_v14_0_0_read_sensor,
 	.is_dpm_running = smu_v14_0_0_is_dpm_running,
 	.set_watermarks_table = smu_v14_0_0_set_watermarks_table,
-	.get_gpu_metrics = smu_v14_0_0_get_gpu_metrics,
+	.get_gpu_metrics = smu_v14_0_0_common_get_gpu_metrics,
 	.get_enabled_mask = smu_cmn_get_enabled_mask,
 	.get_pp_feature_mask = smu_cmn_get_pp_feature_mask,
 	.set_driver_table_location = smu_v14_0_set_driver_table_location,
-- 
2.25.1


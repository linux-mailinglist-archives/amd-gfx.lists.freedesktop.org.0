Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F656D2B79
	for <lists+amd-gfx@lfdr.de>; Sat,  1 Apr 2023 00:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96ED410F344;
	Fri, 31 Mar 2023 22:45:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F5910F341
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 Mar 2023 22:44:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWrVG8sxS6ELgcTL1RMBNhVL46eDCvvhjXasdzGz5scw2Yl7WPdJhtAf5L/D1X4Bf6D8Z9ABlZ9hkAYPdyU0uet6vfq5yNnS7vOD6fD3HtDYjEijojnYlIfLhyMMwa+vE+XRmUchNdeHNNKCr9PbsEirKheZZcGDQ/a8t+ZUFimPAieLpr1LG0vmT6NmHs9ls8Yhw+KXFzg9QPox2ixvfZgX34K6/zqPKFjiEbHSbEReqN8B6XRZGx2l5NexH3Hdxm46vLOrFylLteKk1HjPAEIOEqHwD6cz2PT8gVlKtcuONh3gTxkASTGodut7XjIQ6/2r5XefZ0LzM7+5UUsy8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEhcNhLRdKWZquYMzlJ8GI/1hjSt8G/cpAy/rxqXTZs=;
 b=D5kzOwcyZ78xBYd0SWshRZhBwNCgEwh4c9T3IRpr4nDhuPUy6JUlbMh03JCsaVwvGvJ0UHNgLYMzjTxYwbBj/dicAHOAmubzhE6xl5hw21IVOfk/O989mB75g6XgEg5jm2P+xPlKoQiBi96WBducgg7LYHFCO2aRi+KRumzarLIurixm747kFzW2BbFU93/6kwWbeLvXaqp7sGFhhZ+NzmrmY1WegQB0JZ0Vze+kYryVm7rfCB2ZAmXwxbJy0MAaMohqgW6rlYDmex2w0gIKHfMBv/JKPSgOMop3NFMQN4QZAm3CgGK6BHNwsKoDqwLIRFy4bXkGHGd27TyG4v4+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEhcNhLRdKWZquYMzlJ8GI/1hjSt8G/cpAy/rxqXTZs=;
 b=P4kK9V8Yf/nl2r/A5lLUwHd3yI3pRCCqSfSgipjDf8+ztfmMcEJ6/Ot1OCDrFieQatSScyDx6u4nhuPvlt5JDLr7g3GmaIofrnV7fzoOX/oAEVrcCMQGlBkXhP8Iimm7AbLmiB0vHqo1433A9o8U6cKHZxHTzIHVB2m8u/nHtDY=
Received: from MW4PR04CA0361.namprd04.prod.outlook.com (2603:10b6:303:81::6)
 by IA1PR12MB8222.namprd12.prod.outlook.com (2603:10b6:208:3f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Fri, 31 Mar
 2023 22:44:46 +0000
Received: from CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::d2) by MW4PR04CA0361.outlook.office365.com
 (2603:10b6:303:81::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Fri, 31 Mar 2023 22:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT094.mail.protection.outlook.com (10.13.174.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.15 via Frontend Transport; Fri, 31 Mar 2023 22:44:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 31 Mar
 2023 17:44:42 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/11] drm/amdgpu: Add mmhub v1_8_0 ras err status registers
Date: Fri, 31 Mar 2023 18:44:21 -0400
Message-ID: <20230331224425.8755-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331224425.8755-1-alexander.deucher@amd.com>
References: <20230331224425.8755-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT094:EE_|IA1PR12MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b00cc21-4846-4a12-1252-08db3239868e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TRtEmX85jvIizRdA1Ycz6B5p+HIkEBtczV0w9+QwAvBTNbJ6mwi7z64Tnif2DT1e0RhMnTflB58ksc+8VikBshCnp2tqikqATsjD9pQons4ptuedh9o9mv+6RMjGFMUUbULUHiuJCFVBSIFSJvHWRattLQzoPqDi5pQ46l0FHAxFvynSkefs/BkDMOm1UFP2TGdanOHDfALPzm/UGawMkNaV+tavSVTD4KEK/2nNDbbRRws4tbYvfIS/V1ccNP37PCIpRGVm2cATtLiQOpY72/A1gxcPykyD11V1slEZl71ikALTXpYgDzzqX9BmDqzFYszoMuA0jdhoVTJtn4DmD+5hFp9dCZIaWUWptehAQiD77m3bGA4nLEIleLIG4H0dWF+azqXMhw2siovF5Je7k4F6JF2LRiXmreNCQlzNzTfFtufvXyfC5bNSYkfrWmZ3EcnB+lyDo5nWhqDdv7HkeygRORsDjrN26sEY33Yp6UIzmbL22k9O1eROjg8x/BCDCUUiNaKAJOM0X/w9o62qARuSlrcL91Yu2B+h9SeWdIcYpQVm5ewea4rT3E3OuG+CcqsP59753AqnYGfF/PVszWMEjcxCKbX65znAPU/acAgbXbrTdzoeniv05tDUGI5y9yi+4WZnH/lQSXrmY29l6yrV+DpUWoMK7QSYUGKUEZPCjD4+NHkETrb4ikXqqFaxthptK9MOKvfRE4ojRUs0Xn9j5+FBUPuMg3Ny0F/xVGQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199021)(40470700004)(46966006)(36840700001)(54906003)(6916009)(86362001)(36756003)(316002)(4326008)(70206006)(41300700001)(6666004)(478600001)(70586007)(7696005)(30864003)(336012)(5660300002)(82310400005)(8936002)(82740400003)(40480700001)(2906002)(8676002)(83380400001)(16526019)(356005)(36860700001)(1076003)(26005)(81166007)(186003)(47076005)(2616005)(426003)(40460700003)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 22:44:45.3477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b00cc21-4846-4a12-1252-08db3239868e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8222
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Hawking Zhang <Hawking.Zhang@amd.com>

add new ras error status registers introduced in
mmhub v1_8_0 to log mmea and mm_cane ras err, including
MMEAx_UE|CE_ERR_STATUS_LO|HI
MM_CANE_UE|CE_ERR_STATUS_LO|HI

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../asic_reg/mmhub/mmhub_1_8_0_offset.h       |  56 ++-
 .../asic_reg/mmhub/mmhub_1_8_0_sh_mask.h      | 325 +++++++++++++++++-
 2 files changed, 373 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_offset.h
index 8bcc81f2dfc0..879ee9de3ff3 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_offset.h
@@ -1491,6 +1491,10 @@
 #define regMMEA0_PERFCOUNTER1_CFG_BASE_IDX                                                              0
 #define regMMEA0_PERFCOUNTER_RSLT_CNTL                                                                  0x0400
 #define regMMEA0_PERFCOUNTER_RSLT_CNTL_BASE_IDX                                                         0
+#define regMMEA0_UE_ERR_STATUS_LO                                                                       0x0406
+#define regMMEA0_UE_ERR_STATUS_LO_BASE_IDX                                                              0
+#define regMMEA0_UE_ERR_STATUS_HI                                                                       0x0407
+#define regMMEA0_UE_ERR_STATUS_HI_BASE_IDX                                                              0
 #define regMMEA0_DSM_CNTL                                                                               0x0408
 #define regMMEA0_DSM_CNTL_BASE_IDX                                                                      0
 #define regMMEA0_DSM_CNTLA                                                                              0x0409
@@ -1511,8 +1515,12 @@
 #define regMMEA0_ERR_STATUS_BASE_IDX                                                                    0
 #define regMMEA0_MISC2                                                                                  0x0412
 #define regMMEA0_MISC2_BASE_IDX                                                                         0
+#define regMMEA0_CE_ERR_STATUS_LO                                                                       0x0414
+#define regMMEA0_CE_ERR_STATUS_LO_BASE_IDX                                                              0
 #define regMMEA0_MISC_AON                                                                               0x0415
 #define regMMEA0_MISC_AON_BASE_IDX                                                                      0
+#define regMMEA0_CE_ERR_STATUS_HI                                                                       0x0416
+#define regMMEA0_CE_ERR_STATUS_HI_BASE_IDX                                                              0
 
 
 // addressBlock: aid_mmhub_ea_mmeadec1
@@ -1709,6 +1717,10 @@
 #define regMMEA1_PERFCOUNTER1_CFG_BASE_IDX                                                              0
 #define regMMEA1_PERFCOUNTER_RSLT_CNTL                                                                  0x0540
 #define regMMEA1_PERFCOUNTER_RSLT_CNTL_BASE_IDX                                                         0
+#define regMMEA1_UE_ERR_STATUS_LO                                                                       0x0546
+#define regMMEA1_UE_ERR_STATUS_LO_BASE_IDX                                                              0
+#define regMMEA1_UE_ERR_STATUS_HI                                                                       0x0547
+#define regMMEA1_UE_ERR_STATUS_HI_BASE_IDX                                                              0
 #define regMMEA1_DSM_CNTL                                                                               0x0548
 #define regMMEA1_DSM_CNTL_BASE_IDX                                                                      0
 #define regMMEA1_DSM_CNTLA                                                                              0x0549
@@ -1729,8 +1741,12 @@
 #define regMMEA1_ERR_STATUS_BASE_IDX                                                                    0
 #define regMMEA1_MISC2                                                                                  0x0552
 #define regMMEA1_MISC2_BASE_IDX                                                                         0
+#define regMMEA1_CE_ERR_STATUS_LO                                                                       0x0554
+#define regMMEA1_CE_ERR_STATUS_LO_BASE_IDX                                                              0
 #define regMMEA1_MISC_AON                                                                               0x0555
 #define regMMEA1_MISC_AON_BASE_IDX                                                                      0
+#define regMMEA1_CE_ERR_STATUS_HI                                                                       0x0556
+#define regMMEA1_CE_ERR_STATUS_HI_BASE_IDX                                                              0
 
 
 // addressBlock: aid_mmhub_ea_mmeadec2
@@ -1927,6 +1943,10 @@
 #define regMMEA2_PERFCOUNTER1_CFG_BASE_IDX                                                              0
 #define regMMEA2_PERFCOUNTER_RSLT_CNTL                                                                  0x0680
 #define regMMEA2_PERFCOUNTER_RSLT_CNTL_BASE_IDX                                                         0
+#define regMMEA2_UE_ERR_STATUS_LO                                                                       0x0686
+#define regMMEA2_UE_ERR_STATUS_LO_BASE_IDX                                                              0
+#define regMMEA2_UE_ERR_STATUS_HI                                                                       0x0687
+#define regMMEA2_UE_ERR_STATUS_HI_BASE_IDX                                                              0
 #define regMMEA2_DSM_CNTL                                                                               0x0688
 #define regMMEA2_DSM_CNTL_BASE_IDX                                                                      0
 #define regMMEA2_DSM_CNTLA                                                                              0x0689
@@ -1947,8 +1967,12 @@
 #define regMMEA2_ERR_STATUS_BASE_IDX                                                                    0
 #define regMMEA2_MISC2                                                                                  0x0692
 #define regMMEA2_MISC2_BASE_IDX                                                                         0
+#define regMMEA2_CE_ERR_STATUS_LO                                                                       0x0694
+#define regMMEA2_CE_ERR_STATUS_LO_BASE_IDX                                                              0
 #define regMMEA2_MISC_AON                                                                               0x0695
 #define regMMEA2_MISC_AON_BASE_IDX                                                                      0
+#define regMMEA2_CE_ERR_STATUS_HI                                                                       0x0696
+#define regMMEA2_CE_ERR_STATUS_HI_BASE_IDX                                                              0
 
 
 // addressBlock: aid_mmhub_ea_mmeadec3
@@ -2145,6 +2169,10 @@
 #define regMMEA3_PERFCOUNTER1_CFG_BASE_IDX                                                              0
 #define regMMEA3_PERFCOUNTER_RSLT_CNTL                                                                  0x07c0
 #define regMMEA3_PERFCOUNTER_RSLT_CNTL_BASE_IDX                                                         0
+#define regMMEA3_UE_ERR_STATUS_LO                                                                       0x07c6
+#define regMMEA3_UE_ERR_STATUS_LO_BASE_IDX                                                              0
+#define regMMEA3_UE_ERR_STATUS_HI                                                                       0x07c7
+#define regMMEA3_UE_ERR_STATUS_HI_BASE_IDX                                                              0
 #define regMMEA3_DSM_CNTL                                                                               0x07c8
 #define regMMEA3_DSM_CNTL_BASE_IDX                                                                      0
 #define regMMEA3_DSM_CNTLA                                                                              0x07c9
@@ -2165,9 +2193,12 @@
 #define regMMEA3_ERR_STATUS_BASE_IDX                                                                    0
 #define regMMEA3_MISC2                                                                                  0x07d2
 #define regMMEA3_MISC2_BASE_IDX                                                                         0
+#define regMMEA3_CE_ERR_STATUS_LO                                                                       0x07d4
+#define regMMEA3_CE_ERR_STATUS_LO_BASE_IDX                                                              0
 #define regMMEA3_MISC_AON                                                                               0x07d5
 #define regMMEA3_MISC_AON_BASE_IDX                                                                      0
-
+#define regMMEA3_CE_ERR_STATUS_HI                                                                       0x07d6
+#define regMMEA3_CE_ERR_STATUS_HI_BASE_IDX                                                              0
 
 // addressBlock: aid_mmhub_ea_mmeadec4
 // base address: 0x62000
@@ -2363,6 +2394,10 @@
 #define regMMEA4_PERFCOUNTER1_CFG_BASE_IDX                                                              0
 #define regMMEA4_PERFCOUNTER_RSLT_CNTL                                                                  0x0900
 #define regMMEA4_PERFCOUNTER_RSLT_CNTL_BASE_IDX                                                         0
+#define regMMEA4_UE_ERR_STATUS_LO                                                                       0x0906
+#define regMMEA4_UE_ERR_STATUS_LO_BASE_IDX                                                              0
+#define regMMEA4_UE_ERR_STATUS_HI                                                                       0x0907
+#define regMMEA4_UE_ERR_STATUS_HI_BASE_IDX                                                              0
 #define regMMEA4_DSM_CNTL                                                                               0x0908
 #define regMMEA4_DSM_CNTL_BASE_IDX                                                                      0
 #define regMMEA4_DSM_CNTLA                                                                              0x0909
@@ -2383,9 +2418,12 @@
 #define regMMEA4_ERR_STATUS_BASE_IDX                                                                    0
 #define regMMEA4_MISC2                                                                                  0x0912
 #define regMMEA4_MISC2_BASE_IDX                                                                         0
+#define regMMEA4_CE_ERR_STATUS_LO                                                                       0x0914
+#define regMMEA4_CE_ERR_STATUS_LO_BASE_IDX                                                              0
 #define regMMEA4_MISC_AON                                                                               0x0915
 #define regMMEA4_MISC_AON_BASE_IDX                                                                      0
-
+#define regMMEA4_CE_ERR_STATUS_HI                                                                       0x0916
+#define regMMEA4_CE_ERR_STATUS_HI_BASE_IDX                                                              0
 
 // addressBlock: aid_mmhub_pctldec0
 // base address: 0x62a00
@@ -3310,5 +3348,19 @@
 #define regL2TLB_PERFCOUNTER_HI                                                                         0x0d2d
 #define regL2TLB_PERFCOUNTER_HI_BASE_IDX                                                                0
 
+// addressBlock: aid_mmhub_mm_cane_mmcanedec
+// base address: 0x635f0
+#define regMM_CANE_ICG_CTRL                                                                             0x0d8a
+#define regMM_CANE_ICG_CTRL_BASE_IDX                                                                    0
+#define regMM_CANE_ERR_STATUS                                                                           0x0d8c
+#define regMM_CANE_ERR_STATUS_BASE_IDX                                                                  0
+#define regMM_CANE_UE_ERR_STATUS_LO                                                                     0x0d8d
+#define regMM_CANE_UE_ERR_STATUS_LO_BASE_IDX                                                            0
+#define regMM_CANE_UE_ERR_STATUS_HI                                                                     0x0d8e
+#define regMM_CANE_UE_ERR_STATUS_HI_BASE_IDX                                                            0
+#define regMM_CANE_CE_ERR_STATUS_LO                                                                     0x0d8f
+#define regMM_CANE_CE_ERR_STATUS_LO_BASE_IDX                                                            0
+#define regMM_CANE_CE_ERR_STATUS_HI                                                                     0x0d90
+#define regMM_CANE_CE_ERR_STATUS_HI_BASE_IDX                                                            0
 
 #endif
diff --git a/drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h
index af41468ce69f..088c1f02aa43 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h
@@ -10470,6 +10470,30 @@
 #define MMEA0_PERFCOUNTER_RSLT_CNTL__ENABLE_ANY_MASK                                                          0x01000000L
 #define MMEA0_PERFCOUNTER_RSLT_CNTL__CLEAR_ALL_MASK                                                           0x02000000L
 #define MMEA0_PERFCOUNTER_RSLT_CNTL__STOP_ALL_ON_SATURATE_MASK                                                0x04000000L
+//MMEA0_UE_ERR_STATUS_LO
+#define MMEA0_UE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA0_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA0_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA0_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA0_UE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA0_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA0_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA0_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
+//MMEA0_UE_ERR_STATUS_HI
+#define MMEA0_UE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA0_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                 0x1
+#define MMEA0_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA0_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA0_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                 0x17
+#define MMEA0_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                0x1a
+#define MMEA0_UE_ERR_STATUS_HI__RESERVED_FIELD__SHIFT                                                         0x1d
+#define MMEA0_UE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA0_UE_ERR_STATUS_HI__PARITY_MASK                                                                   0x00000002L
+#define MMEA0_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA0_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA0_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                   0x03800000L
+#define MMEA0_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                  0x1C000000L
+#define MMEA0_UE_ERR_STATUS_HI__RESERVED_FIELD_MASK                                                           0xE0000000L
 //MMEA0_DSM_CNTL
 #define MMEA0_DSM_CNTL__DRAMRD_CMDMEM_DSM_IRRITATOR_DATA__SHIFT                                               0x0
 #define MMEA0_DSM_CNTL__DRAMRD_CMDMEM_ENABLE_SINGLE_WRITE__SHIFT                                              0x2
@@ -10718,12 +10742,35 @@
 #define MMEA0_MISC2__DRAM_WR_THROTTLE_MASK                                                                    0x00020000L
 #define MMEA0_MISC2__GMI_RD_THROTTLE_MASK                                                                     0x00040000L
 #define MMEA0_MISC2__GMI_WR_THROTTLE_MASK                                                                     0x00080000L
+//MMEA0_CE_ERR_STATUS_LO
+#define MMEA0_CE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA0_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA0_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA0_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA0_CE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA0_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA0_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA0_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
 //MMEA0_MISC_AON
 #define MMEA0_MISC_AON__LINKMGR_PARTACK_HYSTERESIS__SHIFT                                                     0x0
 #define MMEA0_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE__SHIFT                                                  0x2
 #define MMEA0_MISC_AON__LINKMGR_PARTACK_HYSTERESIS_MASK                                                       0x00000003L
 #define MMEA0_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE_MASK                                                    0x00000004L
-
+//MMEA0_CE_ERR_STATUS_HI
+#define MMEA0_CE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA0_CE_ERR_STATUS_HI__RESERVED_FIELD0__SHIFT                                                        0x1
+#define MMEA0_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA0_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA0_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                 0x17
+#define MMEA0_CE_ERR_STATUS_HI__POISON__SHIFT                                                                 0x1a
+#define MMEA0_CE_ERR_STATUS_HI__RESERVED_FIELD1__SHIFT                                                        0x1b
+#define MMEA0_CE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA0_CE_ERR_STATUS_HI__RESERVED_FIELD0_MASK                                                          0x00000002L
+#define MMEA0_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA0_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA0_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                   0x03800000L
+#define MMEA0_CE_ERR_STATUS_HI__POISON_MASK                                                                   0x04000000L
+#define MMEA0_CE_ERR_STATUS_HI__RESERVED_FIELD1_MASK                                                          0xF8000000L
 
 // addressBlock: aid_mmhub_ea_mmeadec1
 //MMEA1_DRAM_RD_CLI2GRP_MAP0
@@ -12418,6 +12465,30 @@
 #define MMEA1_PERFCOUNTER_RSLT_CNTL__ENABLE_ANY_MASK                                                          0x01000000L
 #define MMEA1_PERFCOUNTER_RSLT_CNTL__CLEAR_ALL_MASK                                                           0x02000000L
 #define MMEA1_PERFCOUNTER_RSLT_CNTL__STOP_ALL_ON_SATURATE_MASK                                                0x04000000L
+//MMEA1_UE_ERR_STATUS_LO
+#define MMEA1_UE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA1_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA1_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA1_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA1_UE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA1_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA1_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA1_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
+//MMEA1_UE_ERR_STATUS_HI
+#define MMEA1_UE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA1_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                 0x1
+#define MMEA1_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA1_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA1_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                 0x17
+#define MMEA1_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                0x1a
+#define MMEA1_UE_ERR_STATUS_HI__RESERVED_FIELD__SHIFT                                                         0x1d
+#define MMEA1_UE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA1_UE_ERR_STATUS_HI__PARITY_MASK                                                                   0x00000002L
+#define MMEA1_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA1_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA1_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                   0x03800000L
+#define MMEA1_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                  0x1C000000L
+#define MMEA1_UE_ERR_STATUS_HI__RESERVED_FIELD_MASK                                                           0xE0000000L
 //MMEA1_DSM_CNTL
 #define MMEA1_DSM_CNTL__DRAMRD_CMDMEM_DSM_IRRITATOR_DATA__SHIFT                                               0x0
 #define MMEA1_DSM_CNTL__DRAMRD_CMDMEM_ENABLE_SINGLE_WRITE__SHIFT                                              0x2
@@ -12666,12 +12737,35 @@
 #define MMEA1_MISC2__DRAM_WR_THROTTLE_MASK                                                                    0x00020000L
 #define MMEA1_MISC2__GMI_RD_THROTTLE_MASK                                                                     0x00040000L
 #define MMEA1_MISC2__GMI_WR_THROTTLE_MASK                                                                     0x00080000L
+//MMEA1_CE_ERR_STATUS_LO
+#define MMEA1_CE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA1_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA1_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA1_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA1_CE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA1_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA1_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA1_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
 //MMEA1_MISC_AON
 #define MMEA1_MISC_AON__LINKMGR_PARTACK_HYSTERESIS__SHIFT                                                     0x0
 #define MMEA1_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE__SHIFT                                                  0x2
 #define MMEA1_MISC_AON__LINKMGR_PARTACK_HYSTERESIS_MASK                                                       0x00000003L
 #define MMEA1_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE_MASK                                                    0x00000004L
-
+//MMEA1_CE_ERR_STATUS_HI
+#define MMEA1_CE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA1_CE_ERR_STATUS_HI__RESERVED_FIELD0__SHIFT                                                        0x1
+#define MMEA1_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA1_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA1_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                 0x17
+#define MMEA1_CE_ERR_STATUS_HI__POISON__SHIFT                                                                 0x1a
+#define MMEA1_CE_ERR_STATUS_HI__RESERVED_FIELD1__SHIFT                                                        0x1b
+#define MMEA1_CE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA1_CE_ERR_STATUS_HI__RESERVED_FIELD0_MASK                                                          0x00000002L
+#define MMEA1_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA1_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA1_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                   0x03800000L
+#define MMEA1_CE_ERR_STATUS_HI__POISON_MASK                                                                   0x04000000L
+#define MMEA1_CE_ERR_STATUS_HI__RESERVED_FIELD1_MASK                                                          0xF8000000L
 
 // addressBlock: aid_mmhub_ea_mmeadec2
 //MMEA2_DRAM_RD_CLI2GRP_MAP0
@@ -14366,6 +14460,30 @@
 #define MMEA2_PERFCOUNTER_RSLT_CNTL__ENABLE_ANY_MASK                                                          0x01000000L
 #define MMEA2_PERFCOUNTER_RSLT_CNTL__CLEAR_ALL_MASK                                                           0x02000000L
 #define MMEA2_PERFCOUNTER_RSLT_CNTL__STOP_ALL_ON_SATURATE_MASK                                                0x04000000L
+//MMEA2_UE_ERR_STATUS_LO
+#define MMEA2_UE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA2_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA2_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA2_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA2_UE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA2_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA2_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA2_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
+//MMEA2_UE_ERR_STATUS_HI
+#define MMEA2_UE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA2_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                 0x1
+#define MMEA2_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA2_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA2_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                 0x17
+#define MMEA2_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                0x1a
+#define MMEA2_UE_ERR_STATUS_HI__RESERVED_FIELD__SHIFT                                                         0x1d
+#define MMEA2_UE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA2_UE_ERR_STATUS_HI__PARITY_MASK                                                                   0x00000002L
+#define MMEA2_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA2_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA2_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                   0x03800000L
+#define MMEA2_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                  0x1C000000L
+#define MMEA2_UE_ERR_STATUS_HI__RESERVED_FIELD_MASK                                                           0xE0000000L
 //MMEA2_DSM_CNTL
 #define MMEA2_DSM_CNTL__DRAMRD_CMDMEM_DSM_IRRITATOR_DATA__SHIFT                                               0x0
 #define MMEA2_DSM_CNTL__DRAMRD_CMDMEM_ENABLE_SINGLE_WRITE__SHIFT                                              0x2
@@ -14614,12 +14732,35 @@
 #define MMEA2_MISC2__DRAM_WR_THROTTLE_MASK                                                                    0x00020000L
 #define MMEA2_MISC2__GMI_RD_THROTTLE_MASK                                                                     0x00040000L
 #define MMEA2_MISC2__GMI_WR_THROTTLE_MASK                                                                     0x00080000L
+//MMEA2_CE_ERR_STATUS_LO
+#define MMEA2_CE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA2_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA2_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA2_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA2_CE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA2_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA2_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA2_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
 //MMEA2_MISC_AON
 #define MMEA2_MISC_AON__LINKMGR_PARTACK_HYSTERESIS__SHIFT                                                     0x0
 #define MMEA2_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE__SHIFT                                                  0x2
 #define MMEA2_MISC_AON__LINKMGR_PARTACK_HYSTERESIS_MASK                                                       0x00000003L
 #define MMEA2_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE_MASK                                                    0x00000004L
-
+//MMEA2_CE_ERR_STATUS_HI
+#define MMEA2_CE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA2_CE_ERR_STATUS_HI__RESERVED_FIELD0__SHIFT                                                        0x1
+#define MMEA2_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA2_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA2_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                 0x17
+#define MMEA2_CE_ERR_STATUS_HI__POISON__SHIFT                                                                 0x1a
+#define MMEA2_CE_ERR_STATUS_HI__RESERVED_FIELD1__SHIFT                                                        0x1b
+#define MMEA2_CE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA2_CE_ERR_STATUS_HI__RESERVED_FIELD0_MASK                                                          0x00000002L
+#define MMEA2_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA2_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA2_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                   0x03800000L
+#define MMEA2_CE_ERR_STATUS_HI__POISON_MASK                                                                   0x04000000L
+#define MMEA2_CE_ERR_STATUS_HI__RESERVED_FIELD1_MASK                                                          0xF8000000L
 
 // addressBlock: aid_mmhub_ea_mmeadec3
 //MMEA3_DRAM_RD_CLI2GRP_MAP0
@@ -16314,6 +16455,30 @@
 #define MMEA3_PERFCOUNTER_RSLT_CNTL__ENABLE_ANY_MASK                                                          0x01000000L
 #define MMEA3_PERFCOUNTER_RSLT_CNTL__CLEAR_ALL_MASK                                                           0x02000000L
 #define MMEA3_PERFCOUNTER_RSLT_CNTL__STOP_ALL_ON_SATURATE_MASK                                                0x04000000L
+//MMEA3_UE_ERR_STATUS_LO
+#define MMEA3_UE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA3_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA3_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA3_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA3_UE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA3_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA3_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA3_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
+//MMEA3_UE_ERR_STATUS_HI
+#define MMEA3_UE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA3_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                 0x1
+#define MMEA3_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA3_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA3_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                 0x17
+#define MMEA3_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                0x1a
+#define MMEA3_UE_ERR_STATUS_HI__RESERVED_FIELD__SHIFT                                                         0x1d
+#define MMEA3_UE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA3_UE_ERR_STATUS_HI__PARITY_MASK                                                                   0x00000002L
+#define MMEA3_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA3_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA3_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                   0x03800000L
+#define MMEA3_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                  0x1C000000L
+#define MMEA3_UE_ERR_STATUS_HI__RESERVED_FIELD_MASK                                                           0xE0000000L
 //MMEA3_DSM_CNTL
 #define MMEA3_DSM_CNTL__DRAMRD_CMDMEM_DSM_IRRITATOR_DATA__SHIFT                                               0x0
 #define MMEA3_DSM_CNTL__DRAMRD_CMDMEM_ENABLE_SINGLE_WRITE__SHIFT                                              0x2
@@ -16562,12 +16727,35 @@
 #define MMEA3_MISC2__DRAM_WR_THROTTLE_MASK                                                                    0x00020000L
 #define MMEA3_MISC2__GMI_RD_THROTTLE_MASK                                                                     0x00040000L
 #define MMEA3_MISC2__GMI_WR_THROTTLE_MASK                                                                     0x00080000L
+//MMEA3_CE_ERR_STATUS_LO
+#define MMEA3_CE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA3_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA3_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA3_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA3_CE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA3_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA3_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA3_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
 //MMEA3_MISC_AON
 #define MMEA3_MISC_AON__LINKMGR_PARTACK_HYSTERESIS__SHIFT                                                     0x0
 #define MMEA3_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE__SHIFT                                                  0x2
 #define MMEA3_MISC_AON__LINKMGR_PARTACK_HYSTERESIS_MASK                                                       0x00000003L
 #define MMEA3_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE_MASK                                                    0x00000004L
-
+//MMEA3_CE_ERR_STATUS_HI
+#define MMEA3_CE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA3_CE_ERR_STATUS_HI__RESERVED_FIELD0__SHIFT                                                        0x1
+#define MMEA3_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA3_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA3_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                 0x17
+#define MMEA3_CE_ERR_STATUS_HI__POISON__SHIFT                                                                 0x1a
+#define MMEA3_CE_ERR_STATUS_HI__RESERVED_FIELD1__SHIFT                                                        0x1b
+#define MMEA3_CE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA3_CE_ERR_STATUS_HI__RESERVED_FIELD0_MASK                                                          0x00000002L
+#define MMEA3_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA3_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA3_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                   0x03800000L
+#define MMEA3_CE_ERR_STATUS_HI__POISON_MASK                                                                   0x04000000L
+#define MMEA3_CE_ERR_STATUS_HI__RESERVED_FIELD1_MASK                                                          0xF8000000L
 
 // addressBlock: aid_mmhub_ea_mmeadec4
 //MMEA4_DRAM_RD_CLI2GRP_MAP0
@@ -18262,6 +18450,30 @@
 #define MMEA4_PERFCOUNTER_RSLT_CNTL__ENABLE_ANY_MASK                                                          0x01000000L
 #define MMEA4_PERFCOUNTER_RSLT_CNTL__CLEAR_ALL_MASK                                                           0x02000000L
 #define MMEA4_PERFCOUNTER_RSLT_CNTL__STOP_ALL_ON_SATURATE_MASK                                                0x04000000L
+//MMEA4_UE_ERR_STATUS_LO
+#define MMEA4_UE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA4_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA4_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA4_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA4_UE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA4_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA4_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA4_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
+//MMEA4_UE_ERR_STATUS_HI
+#define MMEA4_UE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA4_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                 0x1
+#define MMEA4_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA4_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA4_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                 0x17
+#define MMEA4_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                0x1a
+#define MMEA4_UE_ERR_STATUS_HI__RESERVED_FIELD__SHIFT                                                         0x1d
+#define MMEA4_UE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA4_UE_ERR_STATUS_HI__PARITY_MASK                                                                   0x00000002L
+#define MMEA4_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA4_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA4_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                   0x03800000L
+#define MMEA4_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                  0x1C000000L
+#define MMEA4_UE_ERR_STATUS_HI__RESERVED_FIELD_MASK                                                           0xE0000000L
 //MMEA4_DSM_CNTL
 #define MMEA4_DSM_CNTL__DRAMRD_CMDMEM_DSM_IRRITATOR_DATA__SHIFT                                               0x0
 #define MMEA4_DSM_CNTL__DRAMRD_CMDMEM_ENABLE_SINGLE_WRITE__SHIFT                                              0x2
@@ -18510,12 +18722,35 @@
 #define MMEA4_MISC2__DRAM_WR_THROTTLE_MASK                                                                    0x00020000L
 #define MMEA4_MISC2__GMI_RD_THROTTLE_MASK                                                                     0x00040000L
 #define MMEA4_MISC2__GMI_WR_THROTTLE_MASK                                                                     0x00080000L
+//MMEA4_CE_ERR_STATUS_LO
+#define MMEA4_CE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                      0x0
+#define MMEA4_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define MMEA4_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define MMEA4_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define MMEA4_CE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                        0x00000001L
+#define MMEA4_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define MMEA4_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define MMEA4_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
 //MMEA4_MISC_AON
 #define MMEA4_MISC_AON__LINKMGR_PARTACK_HYSTERESIS__SHIFT                                                     0x0
 #define MMEA4_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE__SHIFT                                                  0x2
 #define MMEA4_MISC_AON__LINKMGR_PARTACK_HYSTERESIS_MASK                                                       0x00000003L
 #define MMEA4_MISC_AON__LINKMGR_PARTACK_DEASSERT_MODE_MASK                                                    0x00000004L
-
+//MMEA4_CE_ERR_STATUS_HI
+#define MMEA4_CE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define MMEA4_CE_ERR_STATUS_HI__RESERVED_FIELD0__SHIFT                                                        0x1
+#define MMEA4_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define MMEA4_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define MMEA4_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                 0x17
+#define MMEA4_CE_ERR_STATUS_HI__POISON__SHIFT                                                                 0x1a
+#define MMEA4_CE_ERR_STATUS_HI__RESERVED_FIELD1__SHIFT                                                        0x1b
+#define MMEA4_CE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define MMEA4_CE_ERR_STATUS_HI__RESERVED_FIELD0_MASK                                                          0x00000002L
+#define MMEA4_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define MMEA4_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define MMEA4_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                   0x03800000L
+#define MMEA4_CE_ERR_STATUS_HI__POISON_MASK                                                                   0x04000000L
+#define MMEA4_CE_ERR_STATUS_HI__RESERVED_FIELD1_MASK                                                          0xF8000000L
 
 // addressBlock: aid_mmhub_pctldec0
 //PCTL0_CTRL
@@ -22311,5 +22546,83 @@
 #define L2TLB_PERFCOUNTER_HI__COUNTER_HI_MASK                                                                 0x0000FFFFL
 #define L2TLB_PERFCOUNTER_HI__COMPARE_VALUE_MASK                                                              0xFFFF0000L
 
-
+// addressBlock: aid_mmhub_mm_cane_mmcanedec
+//MM_CANE_ICG_CTRL
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_IREQ0__SHIFT                                                          0x0
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_ATRET__SHIFT                                                          0x1
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_OREQ__SHIFT                                                           0x2
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_REGISTER__SHIFT                                                       0x3
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_SDPM_RETURN__SHIFT                                                    0x4
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_IREQ0_MASK                                                            0x00000001L
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_ATRET_MASK                                                            0x00000002L
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_OREQ_MASK                                                             0x00000004L
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_REGISTER_MASK                                                         0x00000008L
+#define MM_CANE_ICG_CTRL__SOFT_OVERRIDE_SDPM_RETURN_MASK                                                      0x00000010L
+//MM_CANE_ERR_STATUS
+#define MM_CANE_ERR_STATUS__SDPM_RDRSP_STATUS__SHIFT                                                          0x0
+#define MM_CANE_ERR_STATUS__SDPM_WRRSP_STATUS__SHIFT                                                          0x4
+#define MM_CANE_ERR_STATUS__SDPM_RDRSP_DATASTATUS__SHIFT                                                      0x8
+#define MM_CANE_ERR_STATUS__SDPM_RDRSP_DATAPARITY_ERROR__SHIFT                                                0xa
+#define MM_CANE_ERR_STATUS__SDPS_DAT_ERROR__SHIFT                                                             0xb
+#define MM_CANE_ERR_STATUS__SDPS_DAT_PARITY_ERROR__SHIFT                                                      0xc
+#define MM_CANE_ERR_STATUS__CLEAR_ERROR_STATUS__SHIFT                                                         0xd
+#define MM_CANE_ERR_STATUS__BUSY_ON_ERROR__SHIFT                                                              0xe
+#define MM_CANE_ERR_STATUS__BUSY_ON_UER_ERROR__SHIFT                                                          0xf
+#define MM_CANE_ERR_STATUS__FUE_FLAG__SHIFT                                                                   0x10
+#define MM_CANE_ERR_STATUS__INTERRUPT_ON_FATAL__SHIFT                                                         0x11
+#define MM_CANE_ERR_STATUS__LEVEL_INTERRUPT__SHIFT                                                            0x12
+#define MM_CANE_ERR_STATUS__SDPM_RDRSP_STATUS_MASK                                                            0x0000000FL
+#define MM_CANE_ERR_STATUS__SDPM_WRRSP_STATUS_MASK                                                            0x000000F0L
+#define MM_CANE_ERR_STATUS__SDPM_RDRSP_DATASTATUS_MASK                                                        0x00000300L
+#define MM_CANE_ERR_STATUS__SDPM_RDRSP_DATAPARITY_ERROR_MASK                                                  0x00000400L
+#define MM_CANE_ERR_STATUS__SDPS_DAT_ERROR_MASK                                                               0x00000800L
+#define MM_CANE_ERR_STATUS__SDPS_DAT_PARITY_ERROR_MASK                                                        0x00001000L
+#define MM_CANE_ERR_STATUS__CLEAR_ERROR_STATUS_MASK                                                           0x00002000L
+#define MM_CANE_ERR_STATUS__BUSY_ON_ERROR_MASK                                                                0x00004000L
+#define MM_CANE_ERR_STATUS__BUSY_ON_UER_ERROR_MASK                                                            0x00008000L
+#define MM_CANE_ERR_STATUS__FUE_FLAG_MASK                                                                     0x00010000L
+#define MM_CANE_ERR_STATUS__INTERRUPT_ON_FATAL_MASK                                                           0x00020000L
+#define MM_CANE_ERR_STATUS__LEVEL_INTERRUPT_MASK                                                              0x00040000L
+//MM_CANE_UE_ERR_STATUS_LO
+#define MM_CANE_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                0x0
+#define MM_CANE_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                   0x1
+#define MM_CANE_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                              0x2
+#define MM_CANE_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                            0x18
+#define MM_CANE_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                  0x00000001L
+#define MM_CANE_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                     0x00000002L
+#define MM_CANE_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                0x00FFFFFCL
+#define MM_CANE_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                              0xFF000000L
+//MM_CANE_UE_ERR_STATUS_HI
+#define MM_CANE_UE_ERR_STATUS_HI__ECC__SHIFT                                                                  0x0
+#define MM_CANE_UE_ERR_STATUS_HI__PARITY__SHIFT                                                               0x1
+#define MM_CANE_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                  0x2
+#define MM_CANE_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                             0x3
+#define MM_CANE_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                               0x17
+#define MM_CANE_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                              0x1a
+#define MM_CANE_UE_ERR_STATUS_HI__ECC_MASK                                                                    0x00000001L
+#define MM_CANE_UE_ERR_STATUS_HI__PARITY_MASK                                                                 0x00000002L
+#define MM_CANE_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                    0x00000004L
+#define MM_CANE_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                               0x007FFFF8L
+#define MM_CANE_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                 0x03800000L
+#define MM_CANE_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                0x1C000000L
+//MM_CANE_CE_ERR_STATUS_LO
+#define MM_CANE_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                0x0
+#define MM_CANE_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                   0x1
+#define MM_CANE_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                              0x2
+#define MM_CANE_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                            0x18
+#define MM_CANE_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                  0x00000001L
+#define MM_CANE_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                     0x00000002L
+#define MM_CANE_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                0x00FFFFFCL
+#define MM_CANE_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                              0xFF000000L
+//MM_CANE_CE_ERR_STATUS_HI
+#define MM_CANE_CE_ERR_STATUS_HI__ECC__SHIFT                                                                  0x0
+#define MM_CANE_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                  0x2
+#define MM_CANE_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                             0x3
+#define MM_CANE_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                               0x17
+#define MM_CANE_CE_ERR_STATUS_HI__POISON__SHIFT                                                               0x1a
+#define MM_CANE_CE_ERR_STATUS_HI__ECC_MASK                                                                    0x00000001L
+#define MM_CANE_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                    0x00000004L
+#define MM_CANE_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                               0x007FFFF8L
+#define MM_CANE_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                 0x03800000L
+#define MM_CANE_CE_ERR_STATUS_HI__POISON_MASK                                                                 0x04000000L
 #endif
-- 
2.39.2


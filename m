Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F770117A
	for <lists+amd-gfx@lfdr.de>; Fri, 12 May 2023 23:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2777010E2DA;
	Fri, 12 May 2023 21:44:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237410E2DA
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 May 2023 21:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1a+Rhyx8cx36d0JUngRcvxNb0D5mUB3IbG56JS3TeTwlaIS+Zqwz4CpGZnSMasPYXY/0meMrWGm/jOxjxY+d2SUrS6BRL4PTEyzz1mmVu2SNUfa9YgHsOnX5vqahLRM7tzWFF9jlrNpOxl1l9VWgZ+z/Esiktke3ZOvEa3ngfosIdpgaO6jESl5kr4KiXkOi1PQeQ+9mMzQpaRSp649ayVdClm1c7Dy3rPV/Z+FNyspKjG4rI0Aapt12p32cfBfEhRHAk/lBPkxSZFj71rNjmaFfeWB2SeWSH0JCISACJCxAnUcjbFeAylvj9JVA7OKVTpXR7NXDkcSl/v+9gjyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TC1cgDERxQhCqMie7oKjVT4cNK4ToHESeVJxovhfrw=;
 b=VikTZRAeKzfm/FpVecX40MXG938TaVO385P4hzeFRzdYAc5QPCTtnIVjDXqusVYR9XwL0V9nlS25Adb8eXOzeeck3exlZPuJHYB4oOWaqCokcYF+DTC85MWOWyy4kdSzE99JtlasMrYE/Rs0vXDu1gvpAvFT04A8fWdyQpuCmPRZ5AaoxzCabtEa11vVN2qLm6UVW5/tCgpC75TRNMpUuQSKFYMrBrqYV5rbZqq/p0q8Y19DmjkNEN4vEKfRBzCLkcq9IxJjghWVhlvwY8nr/A1+dyoGk718qTatwjoERCB8qM9nD/vbfJgk+CZiWymzEoVqTS1PMXgefAo8wHe0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TC1cgDERxQhCqMie7oKjVT4cNK4ToHESeVJxovhfrw=;
 b=GvlaYFQiaos6SFWkOFpU8gGJov1tSu6E6NFoJZF12aVw0YbyeGU9VzCnWwXY2A22VyOHIE9EUeq+BOCqpsFw8clccimdEFIEJ3PcBHTRfFCg5wzMbiBEPvOT7CNaRiPtguKv6NoDDhIsrFNgtOa4iv4tADkpQdF8Q/6XjsOvuSQ=
Received: from MW4PR03CA0293.namprd03.prod.outlook.com (2603:10b6:303:b5::28)
 by SJ2PR12MB7866.namprd12.prod.outlook.com (2603:10b6:a03:4cc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Fri, 12 May
 2023 21:44:17 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::5) by MW4PR03CA0293.outlook.office365.com
 (2603:10b6:303:b5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24 via Frontend
 Transport; Fri, 12 May 2023 21:44:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.26 via Frontend Transport; Fri, 12 May 2023 21:44:17 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 May
 2023 16:44:15 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/10] drm/amdgpu: Add gc v9_4_3 ras error status registers
Date: Fri, 12 May 2023 17:43:45 -0400
Message-ID: <20230512214351.1356254-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512214351.1356254-1-alexander.deucher@amd.com>
References: <20230512214351.1356254-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT024:EE_|SJ2PR12MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c789c6-dff2-4f3a-394c-08db53320998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCdw+WkAberlQMWpAp6BXkjEjD51pTK3awbXqR/jUz0NiP2hXDUV7h/4MbYe8ZExT9WnzZ8QEE4rI/QNZZSnU5JdWcjM8ELMka3vm1zPQnCa7A9FEwEN7gpQt+uMiKZxK8ebDsq9sYdvwZoXADT4GONS3pRXpcWM007nTwE3uS0dH+cyp+MCufNtjaTaDgktwKMitN/+274lJXczs1fbMOlmHFOsUnJTEzHBchir1K7Poq+1Xl6YcjiNhuAro+FHjM528MOenmFq63timDMuh1K+P1eLmr5ZFAnP+KB1UQaoq3JQMVAQoNLlfGDJxhXBHm1FfXsE9IVKs5UaGMhr81VvHqoNv4ZmaYDaI4UGKs7jpmYC5O0vSW8FiG5n+sLBYq8BOTnZQ4qWK2buGzuDhyvlIoeC9IXJzUcEX4yqXL2S/jh2O0Bt3joxV6HJV78GmU7uZtqcSHCbN2nlrjp4oivMNAVsVnwpHzlj7q/STtbS4MyDk+DKRtfLuRvd/pc4wHBO/FeaGzc2B6lzZswAXm4/bKMWFIuRMMOz3CTUXBwVK3Bc5K11OXj2XL78oIIFcGKn04KWWZeGh3TT8wsi/dPz66b3PaEKdiB8+04StwMslT2YveI2ncr9JjVn/1f5xnUEzXccVQCUFKBoq/lD1a0yOEbRGACVJPE01sYpXYcGDUJc8DYq9SiHXm4bhHrtuJ4s6EmsL6u92ag8Uc3BBJ7oaVdO4jnfqaIZq7oPCIoJtTZgu8uNBciQdYZXvwPvsvddazvPLI/ZCfPYOBU8Qg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(40480700001)(186003)(16526019)(1076003)(6916009)(4326008)(316002)(26005)(86362001)(82310400005)(54906003)(70206006)(40460700003)(81166007)(478600001)(356005)(70586007)(36756003)(5660300002)(83380400001)(6666004)(7696005)(36860700001)(30864003)(41300700001)(2906002)(8936002)(8676002)(336012)(426003)(82740400003)(47076005)(2616005)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 21:44:17.5936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c789c6-dff2-4f3a-394c-08db53320998
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7866
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

GC v9_4_3 introduces UE|CE_ERR_STATUS_LO|HI to log
hardware errors

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../amd/include/asic_reg/gc/gc_9_4_3_offset.h |  192 +++
 .../include/asic_reg/gc/gc_9_4_3_sh_mask.h    | 1112 +++++++++++++++++
 2 files changed, 1304 insertions(+)

diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h
index 3100de8b3881..393963502b7a 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h
@@ -705,6 +705,46 @@
 #define regSQC_ICACHE_UTCL1_STATUS_BASE_IDX                                                             0
 #define regSQC_DCACHE_UTCL1_STATUS                                                                      0x03d8
 #define regSQC_DCACHE_UTCL1_STATUS_BASE_IDX                                                             0
+#define regSQC_UE_EDC_LO                                                                                0x03d9
+#define regSQC_UE_EDC_LO_BASE_IDX                                                                       0
+#define regSQC_UE_EDC_HI                                                                                0x03da
+#define regSQC_UE_EDC_HI_BASE_IDX                                                                       0
+#define regSQC_CE_EDC_LO                                                                                0x03db
+#define regSQC_CE_EDC_LO_BASE_IDX                                                                       0
+#define regSQC_CE_EDC_HI                                                                                0x03dc
+#define regSQC_CE_EDC_HI_BASE_IDX                                                                       0
+#define regSQ_UE_ERR_STATUS_LO                                                                          0x03dd
+#define regSQ_UE_ERR_STATUS_LO_BASE_IDX                                                                 0
+#define regSQ_UE_ERR_STATUS_HI                                                                          0x03de
+#define regSQ_UE_ERR_STATUS_HI_BASE_IDX                                                                 0
+#define regSQ_CE_ERR_STATUS_LO                                                                          0x03df
+#define regSQ_CE_ERR_STATUS_LO_BASE_IDX                                                                 0
+#define regSQ_CE_ERR_STATUS_HI                                                                          0x03e0
+#define regSQ_CE_ERR_STATUS_HI_BASE_IDX                                                                 0
+#define regLDS_UE_ERR_STATUS_LO                                                                         0x03e1
+#define regLDS_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regLDS_UE_ERR_STATUS_HI                                                                         0x03e2
+#define regLDS_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regLDS_CE_ERR_STATUS_LO                                                                         0x03e3
+#define regLDS_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regLDS_CE_ERR_STATUS_HI                                                                         0x03e4
+#define regLDS_CE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regSP0_UE_ERR_STATUS_LO                                                                         0x03e5
+#define regSP0_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regSP0_UE_ERR_STATUS_HI                                                                         0x03e6
+#define regSP0_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regSP0_CE_ERR_STATUS_LO                                                                         0x03e7
+#define regSP0_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regSP0_CE_ERR_STATUS_HI                                                                         0x03e8
+#define regSP0_CE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regSP1_UE_ERR_STATUS_LO                                                                         0x03e9
+#define regSP1_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regSP1_UE_ERR_STATUS_HI                                                                         0x03ea
+#define regSP1_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regSP1_CE_ERR_STATUS_LO                                                                         0x03eb
+#define regSP1_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regSP1_CE_ERR_STATUS_HI                                                                         0x03ec
+#define regSP1_CE_ERR_STATUS_HI_BASE_IDX                                                                0
 
 
 // addressBlock: xcd0_gc_shsdec
@@ -727,6 +767,14 @@
 #define regSPI_DSM_CNTL2_BASE_IDX                                                                       0
 #define regSPI_EDC_CNT                                                                                  0x0445
 #define regSPI_EDC_CNT_BASE_IDX                                                                         0
+#define regSPI_UE_ERR_STATUS_LO                                                                         0x0446
+#define regSPI_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regSPI_UE_ERR_STATUS_HI                                                                         0x0447
+#define regSPI_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regSPI_CE_ERR_STATUS_LO                                                                         0x0448
+#define regSPI_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regSPI_CE_ERR_STATUS_HI                                                                         0x0449
+#define regSPI_CE_ERR_STATUS_HI_BASE_IDX                                                                0
 #define regSPI_DEBUG_BUSY                                                                               0x0450
 #define regSPI_DEBUG_BUSY_BASE_IDX                                                                      0
 #define regSPI_CONFIG_PS_CU_EN                                                                          0x0452
@@ -871,6 +919,14 @@
 #define regTD_STATUS_BASE_IDX                                                                           0
 #define regTD_POWER_CNTL                                                                                0x052a
 #define regTD_POWER_CNTL_BASE_IDX                                                                       0
+#define regTD_UE_EDC_LO                                                                                 0x052b
+#define regTD_UE_EDC_LO_BASE_IDX                                                                        0
+#define regTD_UE_EDC_HI                                                                                 0x052c
+#define regTD_UE_EDC_HI_BASE_IDX                                                                        0
+#define regTD_CE_EDC_LO                                                                                 0x052d
+#define regTD_CE_EDC_LO_BASE_IDX                                                                        0
+#define regTD_CE_EDC_HI                                                                                 0x052e
+#define regTD_CE_EDC_HI_BASE_IDX                                                                        0
 #define regTD_DSM_CNTL                                                                                  0x052f
 #define regTD_DSM_CNTL_BASE_IDX                                                                         0
 #define regTD_DSM_CNTL2                                                                                 0x0530
@@ -893,6 +949,14 @@
 #define regTA_DSM_CNTL_BASE_IDX                                                                         0
 #define regTA_DSM_CNTL2                                                                                 0x0585
 #define regTA_DSM_CNTL2_BASE_IDX                                                                        0
+#define regTA_UE_EDC_LO                                                                                 0x0587
+#define regTA_UE_EDC_LO_BASE_IDX                                                                        0
+#define regTA_UE_EDC_HI                                                                                 0x0588
+#define regTA_UE_EDC_HI_BASE_IDX                                                                        0
+#define regTA_CE_EDC_LO                                                                                 0x0589
+#define regTA_CE_EDC_LO_BASE_IDX                                                                        0
+#define regTA_CE_EDC_HI                                                                                 0x058a
+#define regTA_CE_EDC_HI_BASE_IDX                                                                        0
 
 
 // addressBlock: xcd0_gc_gdsdec
@@ -923,6 +987,14 @@
 #define regGDS_DSM_CNTL2_BASE_IDX                                                                       0
 #define regGDS_WD_GDS_CSB                                                                               0x05ce
 #define regGDS_WD_GDS_CSB_BASE_IDX                                                                      0
+#define regGDS_UE_ERR_STATUS_LO                                                                         0x05cf
+#define regGDS_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regGDS_UE_ERR_STATUS_HI                                                                         0x05d0
+#define regGDS_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regGDS_CE_ERR_STATUS_LO                                                                         0x05d1
+#define regGDS_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regGDS_CE_ERR_STATUS_HI                                                                         0x05d2
+#define regGDS_CE_ERR_STATUS_HI_BASE_IDX                                                                0
 
 
 // addressBlock: xcd0_gc_rbdec
@@ -1243,6 +1315,10 @@
 #define regGCEA_MAM_CTRL_BASE_IDX                                                                       0
 #define regGCEA_MAM_CTRL2                                                                               0x0702
 #define regGCEA_MAM_CTRL2_BASE_IDX                                                                      0
+#define regGCEA_UE_ERR_STATUS_LO                                                                        0x0706
+#define regGCEA_UE_ERR_STATUS_LO_BASE_IDX                                                               0
+#define regGCEA_UE_ERR_STATUS_HI                                                                        0x0707
+#define regGCEA_UE_ERR_STATUS_HI_BASE_IDX                                                               0
 #define regGCEA_DSM_CNTL                                                                                0x0708
 #define regGCEA_DSM_CNTL_BASE_IDX                                                                       0
 #define regGCEA_DSM_CNTLA                                                                               0x0709
@@ -1277,6 +1353,10 @@
 #define regGCEA_SDP_BACKDOOR_DATACREDITS1_BASE_IDX                                                      0
 #define regGCEA_SDP_BACKDOOR_MISCCREDITS                                                                0x0719
 #define regGCEA_SDP_BACKDOOR_MISCCREDITS_BASE_IDX                                                       0
+#define regGCEA_CE_ERR_STATUS_LO                                                                        0x071b
+#define regGCEA_CE_ERR_STATUS_LO_BASE_IDX                                                               0
+#define regGCEA_CE_ERR_STATUS_HI                                                                        0x071d
+#define regGCEA_CE_ERR_STATUS_HI_BASE_IDX                                                               0
 #define regGCEA_SDP_ENABLE                                                                              0x071f
 #define regGCEA_SDP_ENABLE_BASE_IDX                                                                     0
 
@@ -1389,6 +1469,14 @@
 #define regATC_L2_CNTL4_BASE_IDX                                                                        0
 #define regATC_L2_MM_GROUP_RT_CLASSES                                                                   0x0816
 #define regATC_L2_MM_GROUP_RT_CLASSES_BASE_IDX                                                          0
+#define regATC_L2_UE_ERR_STATUS_LO                                                                      0x081a
+#define regATC_L2_UE_ERR_STATUS_LO_BASE_IDX                                                             0
+#define regATC_L2_UE_ERR_STATUS_HI                                                                      0x081b
+#define regATC_L2_UE_ERR_STATUS_HI_BASE_IDX                                                             0
+#define regATC_L2_CE_ERR_STATUS_LO                                                                      0x081c
+#define regATC_L2_CE_ERR_STATUS_LO_BASE_IDX                                                             0
+#define regATC_L2_CE_ERR_STATUS_HI                                                                      0x081d
+#define regATC_L2_CE_ERR_STATUS_HI_BASE_IDX                                                             0
 
 
 // addressBlock: xcd0_gc_utcl2_vml2pfdec
@@ -1475,6 +1563,30 @@
 #define regUTCL2_EDC_MODE_BASE_IDX                                                                      0
 #define regUTCL2_EDC_CONFIG                                                                             0x084c
 #define regUTCL2_EDC_CONFIG_BASE_IDX                                                                    0
+#define regVML2_UE_ERR_STATUS_LO                                                                        0x084d
+#define regVML2_UE_ERR_STATUS_LO_BASE_IDX                                                               0
+#define regVML2_WALKER_UE_ERR_STATUS_LO                                                                 0x084e
+#define regVML2_WALKER_UE_ERR_STATUS_LO_BASE_IDX                                                        0
+#define regUTCL2_UE_ERR_STATUS_LO                                                                       0x084f
+#define regUTCL2_UE_ERR_STATUS_LO_BASE_IDX                                                              0
+#define regVML2_UE_ERR_STATUS_HI                                                                        0x0850
+#define regVML2_UE_ERR_STATUS_HI_BASE_IDX                                                               0
+#define regVML2_WALKER_UE_ERR_STATUS_HI                                                                 0x0851
+#define regVML2_WALKER_UE_ERR_STATUS_HI_BASE_IDX                                                        0
+#define regUTCL2_UE_ERR_STATUS_HI                                                                       0x0852
+#define regUTCL2_UE_ERR_STATUS_HI_BASE_IDX                                                              0
+#define regVML2_CE_ERR_STATUS_LO                                                                        0x0853
+#define regVML2_CE_ERR_STATUS_LO_BASE_IDX                                                               0
+#define regVML2_WALKER_CE_ERR_STATUS_LO                                                                 0x0854
+#define regVML2_WALKER_CE_ERR_STATUS_LO_BASE_IDX                                                        0
+#define regUTCL2_CE_ERR_STATUS_LO                                                                       0x0855
+#define regUTCL2_CE_ERR_STATUS_LO_BASE_IDX                                                              0
+#define regVML2_CE_ERR_STATUS_HI                                                                        0x0856
+#define regVML2_CE_ERR_STATUS_HI_BASE_IDX                                                               0
+#define regVML2_WALKER_CE_ERR_STATUS_HI                                                                 0x0857
+#define regVML2_WALKER_CE_ERR_STATUS_HI_BASE_IDX                                                        0
+#define regUTCL2_CE_ERR_STATUS_HI                                                                       0x0858
+#define regUTCL2_CE_ERR_STATUS_HI_BASE_IDX                                                              0
 
 
 // addressBlock: xcd0_gc_utcl2_vml2vcdec
@@ -2011,6 +2123,22 @@
 #define regTC_CFG_L1_VOLATILE_BASE_IDX                                                                  0
 #define regTC_CFG_L2_VOLATILE                                                                           0x0b23
 #define regTC_CFG_L2_VOLATILE_BASE_IDX                                                                  0
+#define regTCP_UE_EDC_HI_REG                                                                            0x0b54
+#define regTCP_UE_EDC_HI_REG_BASE_IDX                                                                   0
+#define regTCP_UE_EDC_LO_REG                                                                            0x0b55
+#define regTCP_UE_EDC_LO_REG_BASE_IDX                                                                   0
+#define regTCP_CE_EDC_HI_REG                                                                            0x0b56
+#define regTCP_CE_EDC_HI_REG_BASE_IDX                                                                   0
+#define regTCP_CE_EDC_LO_REG                                                                            0x0b57
+#define regTCP_CE_EDC_LO_REG_BASE_IDX                                                                   0
+#define regTCI_UE_EDC_HI_REG                                                                            0x0b58
+#define regTCI_UE_EDC_HI_REG_BASE_IDX                                                                   0
+#define regTCI_UE_EDC_LO_REG                                                                            0x0b59
+#define regTCI_UE_EDC_LO_REG_BASE_IDX                                                                   0
+#define regTCI_CE_EDC_HI_REG                                                                            0x0b5a
+#define regTCI_CE_EDC_HI_REG_BASE_IDX                                                                   0
+#define regTCI_CE_EDC_LO_REG                                                                            0x0b5b
+#define regTCI_CE_EDC_LO_REG_BASE_IDX                                                                   0
 #define regTCI_MISC                                                                                     0x0b5c
 #define regTCI_MISC_BASE_IDX                                                                            0
 #define regTCI_CNTL_3                                                                                   0x0b5d
@@ -2061,6 +2189,26 @@
 #define regTCX_DSM_CNTL_BASE_IDX                                                                        0
 #define regTCX_DSM_CNTL2                                                                                0x0bc8
 #define regTCX_DSM_CNTL2_BASE_IDX                                                                       0
+#define regTCA_UE_ERR_STATUS_LO                                                                         0x0bc9
+#define regTCA_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regTCA_UE_ERR_STATUS_HI                                                                         0x0bca
+#define regTCA_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regTCX_UE_ERR_STATUS_LO                                                                         0x0bcb
+#define regTCX_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regTCX_UE_ERR_STATUS_HI                                                                         0x0bcc
+#define regTCX_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regTCX_CE_ERR_STATUS_LO                                                                         0x0bcd
+#define regTCX_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regTCX_CE_ERR_STATUS_HI                                                                         0x0bce
+#define regTCX_CE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regTCC_UE_ERR_STATUS_LO                                                                         0x0bcf
+#define regTCC_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regTCC_UE_ERR_STATUS_HI                                                                         0x0bd0
+#define regTCC_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regTCC_CE_ERR_STATUS_LO                                                                         0x0bd1
+#define regTCC_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regTCC_CE_ERR_STATUS_HI                                                                         0x0bd2
+#define regTCC_CE_ERR_STATUS_HI_BASE_IDX                                                                0
 
 
 // addressBlock: xcd0_gc_shdec
@@ -2905,6 +3053,30 @@
 #define regCP_MEC2_F32_INT_DIS_BASE_IDX                                                                 0
 #define regCP_VMID_STATUS                                                                               0x10bf
 #define regCP_VMID_STATUS_BASE_IDX                                                                      0
+#define regCPC_UE_ERR_STATUS_LO                                                                         0x10e0
+#define regCPC_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regCPC_UE_ERR_STATUS_HI                                                                         0x10e1
+#define regCPC_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regCPC_CE_ERR_STATUS_LO                                                                         0x10e2
+#define regCPC_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regCPC_CE_ERR_STATUS_HI                                                                         0x10e3
+#define regCPC_CE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regCPF_UE_ERR_STATUS_LO                                                                         0x10e4
+#define regCPF_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regCPF_UE_ERR_STATUS_HI                                                                         0x10e5
+#define regCPF_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regCPF_CE_ERR_STATUS_LO                                                                         0x10e6
+#define regCPF_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regCPF_CE_ERR_STATUS_HI                                                                         0x10e7
+#define regCPF_CE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regCPG_UE_ERR_STATUS_LO                                                                         0x10e8
+#define regCPG_UE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regCPG_UE_ERR_STATUS_HI                                                                         0x10e9
+#define regCPG_UE_ERR_STATUS_HI_BASE_IDX                                                                0
+#define regCPG_CE_ERR_STATUS_LO                                                                         0x10ea
+#define regCPG_CE_ERR_STATUS_LO_BASE_IDX                                                                0
+#define regCPG_CE_ERR_STATUS_HI                                                                         0x10eb
+#define regCPG_CE_ERR_STATUS_HI_BASE_IDX                                                                0
 
 
 // addressBlock: xcd0_gc_cppdec2
@@ -5364,6 +5536,18 @@
 #define regSPI_WAVE_LIMIT_CNTL                                                                          0x2443
 #define regSPI_WAVE_LIMIT_CNTL_BASE_IDX                                                                 1
 
+// addressBlock: xcd0_gc_gccanedec
+// base address: 0x33d00
+#define regGC_CANE_ERR_STATUS                                                                           0x2f4d
+#define regGC_CANE_ERR_STATUS_BASE_IDX                                                                  1
+#define regGC_CANE_UE_ERR_STATUS_LO                                                                     0x2f4e
+#define regGC_CANE_UE_ERR_STATUS_LO_BASE_IDX                                                            1
+#define regGC_CANE_UE_ERR_STATUS_HI                                                                     0x2f4f
+#define regGC_CANE_UE_ERR_STATUS_HI_BASE_IDX                                                            1
+#define regGC_CANE_CE_ERR_STATUS_LO                                                                     0x2f50
+#define regGC_CANE_CE_ERR_STATUS_LO_BASE_IDX                                                            1
+#define regGC_CANE_CE_ERR_STATUS_HI                                                                     0x2f51
+#define regGC_CANE_CE_ERR_STATUS_HI_BASE_IDX                                                            1
 
 // addressBlock: xcd0_gc_perfddec
 // base address: 0x34000
@@ -6583,6 +6767,10 @@
 #define regRLC_CAPTURE_GPU_CLOCK_COUNT_2_BASE_IDX                                                       1
 #define regRLC_CPG_STAT_INVAL                                                                           0x4d09
 #define regRLC_CPG_STAT_INVAL_BASE_IDX                                                                  1
+#define regRLC_UE_ERR_STATUS_LOW                                                                        0x4d40
+#define regRLC_UE_ERR_STATUS_LOW_BASE_IDX                                                               1
+#define regRLC_UE_ERR_STATUS_HIGH                                                                       0x4d41
+#define regRLC_UE_ERR_STATUS_HIGH_BASE_IDX                                                              1
 #define regRLC_DSM_CNTL                                                                                 0x4d42
 #define regRLC_DSM_CNTL_BASE_IDX                                                                        1
 #define regRLC_DSM_CNTLA                                                                                0x4d43
@@ -6591,6 +6779,10 @@
 #define regRLC_DSM_CNTL2_BASE_IDX                                                                       1
 #define regRLC_DSM_CNTL2A                                                                               0x4d45
 #define regRLC_DSM_CNTL2A_BASE_IDX                                                                      1
+#define regRLC_CE_ERR_STATUS_LOW                                                                        0x4d49
+#define regRLC_CE_ERR_STATUS_LOW_BASE_IDX                                                               1
+#define regRLC_CE_ERR_STATUS_HIGH                                                                       0x4d4a
+#define regRLC_CE_ERR_STATUS_HIGH_BASE_IDX                                                              1
 #define regRLC_RLCV_SPARE_INT                                                                           0x4f30
 #define regRLC_RLCV_SPARE_INT_BASE_IDX                                                                  1
 #define regRLC_SMU_CLK_REQ                                                                              0x4f97
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h
index 84a75b58347f..2bd9f3f1026f 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h
@@ -4129,6 +4129,240 @@
 #define SQC_DCACHE_UTCL1_STATUS__FAULT_DETECTED_MASK                                                          0x00000001L
 #define SQC_DCACHE_UTCL1_STATUS__RETRY_DETECTED_MASK                                                          0x00000002L
 #define SQC_DCACHE_UTCL1_STATUS__PRT_DETECTED_MASK                                                            0x00000004L
+//SQC_UE_EDC_LO
+#define SQC_UE_EDC_LO__STATUS_VALID_FLAG__SHIFT                                                               0x0
+#define SQC_UE_EDC_LO__ADDRESS_INFO_VALID_FLAG__SHIFT                                                         0x1
+#define SQC_UE_EDC_LO__ADDRESS__SHIFT                                                                         0x2
+#define SQC_UE_EDC_LO__MEM_ID__SHIFT                                                                          0x18
+#define SQC_UE_EDC_LO__STATUS_VALID_FLAG_MASK                                                                 0x00000001L
+#define SQC_UE_EDC_LO__ADDRESS_INFO_VALID_FLAG_MASK                                                           0x00000002L
+#define SQC_UE_EDC_LO__ADDRESS_MASK                                                                           0x00FFFFFCL
+#define SQC_UE_EDC_LO__MEM_ID_MASK                                                                            0xFF000000L
+//SQC_UE_EDC_HI
+#define SQC_UE_EDC_HI__ECC__SHIFT                                                                             0x0
+#define SQC_UE_EDC_HI__PARITY__SHIFT                                                                          0x1
+#define SQC_UE_EDC_HI__ERR_INFO_VALID_FLAG__SHIFT                                                             0x2
+#define SQC_UE_EDC_HI__ERR_INFO__SHIFT                                                                        0x3
+#define SQC_UE_EDC_HI__UE_CNT__SHIFT                                                                          0x17
+#define SQC_UE_EDC_HI__FED_CNT__SHIFT                                                                         0x1a
+#define SQC_UE_EDC_HI__ECC_MASK                                                                               0x00000001L
+#define SQC_UE_EDC_HI__PARITY_MASK                                                                            0x00000002L
+#define SQC_UE_EDC_HI__ERR_INFO_VALID_FLAG_MASK                                                               0x00000004L
+#define SQC_UE_EDC_HI__ERR_INFO_MASK                                                                          0x007FFFF8L
+#define SQC_UE_EDC_HI__UE_CNT_MASK                                                                            0x03800000L
+#define SQC_UE_EDC_HI__FED_CNT_MASK                                                                           0x1C000000L
+//SQC_CE_EDC_LO
+#define SQC_CE_EDC_LO__STATUS_VALID_FLAG__SHIFT                                                               0x0
+#define SQC_CE_EDC_LO__ADDRESS_INFO_VALID_FLAG__SHIFT                                                         0x1
+#define SQC_CE_EDC_LO__ADDRESS__SHIFT                                                                         0x2
+#define SQC_CE_EDC_LO__MEM_ID__SHIFT                                                                          0x18
+#define SQC_CE_EDC_LO__STATUS_VALID_FLAG_MASK                                                                 0x00000001L
+#define SQC_CE_EDC_LO__ADDRESS_INFO_VALID_FLAG_MASK                                                           0x00000002L
+#define SQC_CE_EDC_LO__ADDRESS_MASK                                                                           0x00FFFFFCL
+#define SQC_CE_EDC_LO__MEM_ID_MASK                                                                            0xFF000000L
+//SQC_CE_EDC_HI
+#define SQC_CE_EDC_HI__ECC__SHIFT                                                                             0x0
+#define SQC_CE_EDC_HI__ERR_INFO_VALID_FLAG__SHIFT                                                             0x2
+#define SQC_CE_EDC_HI__ERR_INFO__SHIFT                                                                        0x3
+#define SQC_CE_EDC_HI__CE_CNT__SHIFT                                                                          0x17
+#define SQC_CE_EDC_HI__POSION__SHIFT                                                                          0x1a
+#define SQC_CE_EDC_HI__ECC_MASK                                                                               0x00000001L
+#define SQC_CE_EDC_HI__ERR_INFO_VALID_FLAG_MASK                                                               0x00000004L
+#define SQC_CE_EDC_HI__ERR_INFO_MASK                                                                          0x007FFFF8L
+#define SQC_CE_EDC_HI__CE_CNT_MASK                                                                            0x03800000L
+#define SQC_CE_EDC_HI__POSION_MASK                                                                            0x04000000L
+//SQ_UE_ERR_STATUS_LO
+#define SQ_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                     0x0
+#define SQ_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                        0x1
+#define SQ_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                   0x2
+#define SQ_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                 0x18
+#define SQ_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                       0x00000001L
+#define SQ_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                          0x00000002L
+#define SQ_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                     0x00FFFFFCL
+#define SQ_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                   0xFF000000L
+//SQ_UE_ERR_STATUS_HI
+#define SQ_UE_ERR_STATUS_HI__ECC__SHIFT                                                                       0x0
+#define SQ_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                    0x1
+#define SQ_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                       0x2
+#define SQ_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                  0x3
+#define SQ_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                    0x17
+#define SQ_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                   0x1a
+#define SQ_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                  0x1d
+#define SQ_UE_ERR_STATUS_HI__ECC_MASK                                                                         0x00000001L
+#define SQ_UE_ERR_STATUS_HI__PARITY_MASK                                                                      0x00000002L
+#define SQ_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                         0x00000004L
+#define SQ_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                    0x007FFFF8L
+#define SQ_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                      0x03800000L
+#define SQ_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                     0x1C000000L
+#define SQ_UE_ERR_STATUS_HI__RESERVED_MASK                                                                    0xE0000000L
+//SQ_CE_ERR_STATUS_LO
+#define SQ_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                     0x0
+#define SQ_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                        0x1
+#define SQ_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                   0x2
+#define SQ_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                 0x18
+#define SQ_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                       0x00000001L
+#define SQ_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                          0x00000002L
+#define SQ_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                     0x00FFFFFCL
+#define SQ_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                   0xFF000000L
+//SQ_CE_ERR_STATUS_HI
+#define SQ_CE_ERR_STATUS_HI__ECC__SHIFT                                                                       0x0
+#define SQ_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                     0x1
+#define SQ_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                       0x2
+#define SQ_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                  0x3
+#define SQ_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                    0x17
+#define SQ_CE_ERR_STATUS_HI__POISON__SHIFT                                                                    0x1a
+#define SQ_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                  0x1b
+#define SQ_CE_ERR_STATUS_HI__ECC_MASK                                                                         0x00000001L
+#define SQ_CE_ERR_STATUS_HI__OTHER_MASK                                                                       0x00000002L
+#define SQ_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                         0x00000004L
+#define SQ_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                    0x007FFFF8L
+#define SQ_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                      0x03800000L
+#define SQ_CE_ERR_STATUS_HI__POISON_MASK                                                                      0x04000000L
+#define SQ_CE_ERR_STATUS_HI__RESERVED_MASK                                                                    0xF8000000L
+//LDS_UE_ERR_STATUS_LO
+#define LDS_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define LDS_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define LDS_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define LDS_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define LDS_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define LDS_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define LDS_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define LDS_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//LDS_UE_ERR_STATUS_HI
+#define LDS_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define LDS_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define LDS_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define LDS_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define LDS_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define LDS_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define LDS_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1d
+#define LDS_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define LDS_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define LDS_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define LDS_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define LDS_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define LDS_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+#define LDS_UE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xE0000000L
+//LDS_CE_ERR_STATUS_LO
+#define LDS_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define LDS_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define LDS_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define LDS_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define LDS_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define LDS_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define LDS_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define LDS_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//LDS_CE_ERR_STATUS_HI
+#define LDS_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define LDS_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                    0x1
+#define LDS_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define LDS_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define LDS_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define LDS_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define LDS_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1b
+#define LDS_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define LDS_CE_ERR_STATUS_HI__OTHER_MASK                                                                      0x00000002L
+#define LDS_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define LDS_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define LDS_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define LDS_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
+#define LDS_CE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xF8000000L
+//SP0_UE_ERR_STATUS_LO
+#define SP0_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define SP0_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define SP0_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define SP0_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define SP0_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define SP0_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define SP0_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define SP0_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//SP0_UE_ERR_STATUS_HI
+#define SP0_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define SP0_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define SP0_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define SP0_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define SP0_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define SP0_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define SP0_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1d
+#define SP0_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define SP0_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define SP0_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define SP0_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define SP0_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define SP0_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+#define SP0_UE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xE0000000L
+//SP0_CE_ERR_STATUS_LO
+#define SP0_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define SP0_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define SP0_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define SP0_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define SP0_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define SP0_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define SP0_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define SP0_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//SP0_CE_ERR_STATUS_HI
+#define SP0_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define SP0_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                    0x1
+#define SP0_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define SP0_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define SP0_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define SP0_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define SP0_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1b
+#define SP0_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define SP0_CE_ERR_STATUS_HI__OTHER_MASK                                                                      0x00000002L
+#define SP0_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define SP0_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define SP0_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define SP0_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
+#define SP0_CE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xF8000000L
+//SP1_UE_ERR_STATUS_LO
+#define SP1_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define SP1_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define SP1_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define SP1_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define SP1_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define SP1_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define SP1_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define SP1_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//SP1_UE_ERR_STATUS_HI
+#define SP1_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define SP1_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define SP1_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define SP1_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define SP1_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define SP1_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define SP1_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1d
+#define SP1_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define SP1_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define SP1_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define SP1_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define SP1_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define SP1_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+#define SP1_UE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xE0000000L
+//SP1_CE_ERR_STATUS_LO
+#define SP1_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define SP1_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define SP1_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define SP1_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define SP1_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define SP1_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define SP1_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define SP1_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//SP1_CE_ERR_STATUS_HI
+#define SP1_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define SP1_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                    0x1
+#define SP1_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define SP1_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define SP1_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define SP1_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define SP1_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1b
+#define SP1_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define SP1_CE_ERR_STATUS_HI__OTHER_MASK                                                                      0x00000002L
+#define SP1_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define SP1_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define SP1_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define SP1_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
+#define SP1_CE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xF8000000L
 
 
 // addressBlock: xcd0_gc_shsdec
@@ -4235,6 +4469,54 @@
 #define SPI_EDC_CNT__SPI_LIFE_CNT_SEC_COUNT_MASK                                                              0x00030000L
 #define SPI_EDC_CNT__SPI_LIFE_CNT_DED_COUNT_MASK                                                              0x000C0000L
 #define SPI_EDC_CNT__UNUSED_MASK                                                                              0xFFF00000L
+//SPI_UE_ERR_STATUS_LO
+#define SPI_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define SPI_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define SPI_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define SPI_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define SPI_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define SPI_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define SPI_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define SPI_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//SPI_UE_ERR_STATUS_HI
+#define SPI_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define SPI_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define SPI_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define SPI_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define SPI_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define SPI_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define SPI_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1d
+#define SPI_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define SPI_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define SPI_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define SPI_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define SPI_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define SPI_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+#define SPI_UE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xE0000000L
+//SPI_CE_ERR_STATUS_LO
+#define SPI_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define SPI_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define SPI_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define SPI_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define SPI_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define SPI_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define SPI_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define SPI_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//SPI_CE_ERR_STATUS_HI
+#define SPI_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define SPI_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                    0x1
+#define SPI_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define SPI_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define SPI_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define SPI_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define SPI_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1b
+#define SPI_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define SPI_CE_ERR_STATUS_HI__OTHER_MASK                                                                      0x00000002L
+#define SPI_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define SPI_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define SPI_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define SPI_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
+#define SPI_CE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xF8000000L
 //SPI_DEBUG_BUSY
 #define SPI_DEBUG_BUSY__HS_BUSY__SHIFT                                                                        0x0
 #define SPI_DEBUG_BUSY__GS_BUSY__SHIFT                                                                        0x1
@@ -4622,6 +4904,48 @@
 #define TD_POWER_CNTL__MGCG_OUTPUTSTAGE_MASK                                                                  0x00000002L
 #define TD_POWER_CNTL__MID0_THREAD_DATA_MASK                                                                  0x00000004L
 #define TD_POWER_CNTL__MID2_ACCUM_DATA_MASK                                                                   0x00000008L
+//TD_UE_EDC_LO
+#define TD_UE_EDC_LO__STATUS_VALID_FLAG__SHIFT                                                                0x0
+#define TD_UE_EDC_LO__ADDRESS_INFO_VALID_FLAG__SHIFT                                                          0x1
+#define TD_UE_EDC_LO__ADDRESS__SHIFT                                                                          0x2
+#define TD_UE_EDC_LO__MEM_ID__SHIFT                                                                           0x18
+#define TD_UE_EDC_LO__STATUS_VALID_FLAG_MASK                                                                  0x00000001L
+#define TD_UE_EDC_LO__ADDRESS_INFO_VALID_FLAG_MASK                                                            0x00000002L
+#define TD_UE_EDC_LO__ADDRESS_MASK                                                                            0x00FFFFFCL
+#define TD_UE_EDC_LO__MEM_ID_MASK                                                                             0xFF000000L
+//TD_UE_EDC_HI
+#define TD_UE_EDC_HI__ECC__SHIFT                                                                              0x0
+#define TD_UE_EDC_HI__PARITY__SHIFT                                                                           0x1
+#define TD_UE_EDC_HI__ERR_INFO_VALID_FLAG__SHIFT                                                              0x2
+#define TD_UE_EDC_HI__ERR_INFO__SHIFT                                                                         0x3
+#define TD_UE_EDC_HI__UE_CNT__SHIFT                                                                           0x17
+#define TD_UE_EDC_HI__FED_CNT__SHIFT                                                                          0x1a
+#define TD_UE_EDC_HI__ECC_MASK                                                                                0x00000001L
+#define TD_UE_EDC_HI__PARITY_MASK                                                                             0x00000002L
+#define TD_UE_EDC_HI__ERR_INFO_VALID_FLAG_MASK                                                                0x00000004L
+#define TD_UE_EDC_HI__ERR_INFO_MASK                                                                           0x007FFFF8L
+#define TD_UE_EDC_HI__UE_CNT_MASK                                                                             0x03800000L
+#define TD_UE_EDC_HI__FED_CNT_MASK                                                                            0x1C000000L
+//TD_CE_EDC_LO
+#define TD_CE_EDC_LO__STATUS_VALID_FLAG__SHIFT                                                                0x0
+#define TD_CE_EDC_LO__ADDRESS_INFO_VALID_FLAG__SHIFT                                                          0x1
+#define TD_CE_EDC_LO__ADDRESS__SHIFT                                                                          0x2
+#define TD_CE_EDC_LO__MEM_ID__SHIFT                                                                           0x18
+#define TD_CE_EDC_LO__STATUS_VALID_FLAG_MASK                                                                  0x00000001L
+#define TD_CE_EDC_LO__ADDRESS_INFO_VALID_FLAG_MASK                                                            0x00000002L
+#define TD_CE_EDC_LO__ADDRESS_MASK                                                                            0x00FFFFFCL
+#define TD_CE_EDC_LO__MEM_ID_MASK                                                                             0xFF000000L
+//TD_CE_EDC_HI
+#define TD_CE_EDC_HI__ECC__SHIFT                                                                              0x0
+#define TD_CE_EDC_HI__ERR_INFO_VALID_FLAG__SHIFT                                                              0x2
+#define TD_CE_EDC_HI__ERR_INFO__SHIFT                                                                         0x3
+#define TD_CE_EDC_HI__CE_CNT__SHIFT                                                                           0x17
+#define TD_CE_EDC_HI__POISON__SHIFT                                                                           0x1a
+#define TD_CE_EDC_HI__ECC_MASK                                                                                0x00000001L
+#define TD_CE_EDC_HI__ERR_INFO_VALID_FLAG_MASK                                                                0x00000004L
+#define TD_CE_EDC_HI__ERR_INFO_MASK                                                                           0x007FFFF8L
+#define TD_CE_EDC_HI__CE_CNT_MASK                                                                             0x03800000L
+#define TD_CE_EDC_HI__POISON_MASK                                                                             0x04000000L
 //TD_DSM_CNTL
 #define TD_DSM_CNTL__TD_SS_FIFO_LO_DSM_IRRITATOR_DATA__SHIFT                                                  0x0
 #define TD_DSM_CNTL__TD_SS_FIFO_LO_ENABLE_SINGLE_WRITE__SHIFT                                                 0x2
@@ -4771,6 +5095,48 @@
 #define TA_DSM_CNTL2__TA_FS_AFIFO_HI_ENABLE_ERROR_INJECT_MASK                                                 0x000C0000L
 #define TA_DSM_CNTL2__TA_FS_AFIFO_HI_SELECT_INJECT_DELAY_MASK                                                 0x00100000L
 #define TA_DSM_CNTL2__TA_INJECT_DELAY_MASK                                                                    0xFC000000L
+//TA_UE_EDC_LO
+#define TA_UE_EDC_LO__STATUS_VALID_FLAG__SHIFT                                                                0x0
+#define TA_UE_EDC_LO__ADDRESS_INFO_VALID_FLAG__SHIFT                                                          0x1
+#define TA_UE_EDC_LO__ADDRESS__SHIFT                                                                          0x2
+#define TA_UE_EDC_LO__MEM_ID__SHIFT                                                                           0x18
+#define TA_UE_EDC_LO__STATUS_VALID_FLAG_MASK                                                                  0x00000001L
+#define TA_UE_EDC_LO__ADDRESS_INFO_VALID_FLAG_MASK                                                            0x00000002L
+#define TA_UE_EDC_LO__ADDRESS_MASK                                                                            0x00FFFFFCL
+#define TA_UE_EDC_LO__MEM_ID_MASK                                                                             0xFF000000L
+//TA_UE_EDC_HI
+#define TA_UE_EDC_HI__ECC__SHIFT                                                                              0x0
+#define TA_UE_EDC_HI__PARITY__SHIFT                                                                           0x1
+#define TA_UE_EDC_HI__ERR_INFO_VALID_FLAG__SHIFT                                                              0x2
+#define TA_UE_EDC_HI__ERR_INFO__SHIFT                                                                         0x3
+#define TA_UE_EDC_HI__UE_CNT__SHIFT                                                                           0x17
+#define TA_UE_EDC_HI__FED_CNT__SHIFT                                                                          0x1a
+#define TA_UE_EDC_HI__ECC_MASK                                                                                0x00000001L
+#define TA_UE_EDC_HI__PARITY_MASK                                                                             0x00000002L
+#define TA_UE_EDC_HI__ERR_INFO_VALID_FLAG_MASK                                                                0x00000004L
+#define TA_UE_EDC_HI__ERR_INFO_MASK                                                                           0x007FFFF8L
+#define TA_UE_EDC_HI__UE_CNT_MASK                                                                             0x03800000L
+#define TA_UE_EDC_HI__FED_CNT_MASK                                                                            0x1C000000L
+//TA_CE_EDC_LO
+#define TA_CE_EDC_LO__STATUS_VALID_FLAG__SHIFT                                                                0x0
+#define TA_CE_EDC_LO__ADDRESS_INFO_VALID_FLAG__SHIFT                                                          0x1
+#define TA_CE_EDC_LO__ADDRESS__SHIFT                                                                          0x2
+#define TA_CE_EDC_LO__MEM_ID__SHIFT                                                                           0x18
+#define TA_CE_EDC_LO__STATUS_VALID_FLAG_MASK                                                                  0x00000001L
+#define TA_CE_EDC_LO__ADDRESS_INFO_VALID_FLAG_MASK                                                            0x00000002L
+#define TA_CE_EDC_LO__ADDRESS_MASK                                                                            0x00FFFFFCL
+#define TA_CE_EDC_LO__MEM_ID_MASK                                                                             0xFF000000L
+//TA_CE_EDC_HI
+#define TA_CE_EDC_HI__ECC__SHIFT                                                                              0x0
+#define TA_CE_EDC_HI__ERR_INFO_VALID_FLAG__SHIFT                                                              0x2
+#define TA_CE_EDC_HI__ERR_INFO__SHIFT                                                                         0x3
+#define TA_CE_EDC_HI__CE_CNT__SHIFT                                                                           0x17
+#define TA_CE_EDC_HI__POISON__SHIFT                                                                           0x1a
+#define TA_CE_EDC_HI__ECC_MASK                                                                                0x00000001L
+#define TA_CE_EDC_HI__ERR_INFO_VALID_FLAG_MASK                                                                0x00000004L
+#define TA_CE_EDC_HI__ERR_INFO_MASK                                                                           0x007FFFF8L
+#define TA_CE_EDC_HI__CE_CNT_MASK                                                                             0x03800000L
+#define TA_CE_EDC_HI__POISON_MASK                                                                             0x04000000L
 
 
 // addressBlock: xcd0_gc_gdsdec
@@ -5015,6 +5381,54 @@
 #define GDS_WD_GDS_CSB__UNUSED__SHIFT                                                                         0xd
 #define GDS_WD_GDS_CSB__COUNTER_MASK                                                                          0x00001FFFL
 #define GDS_WD_GDS_CSB__UNUSED_MASK                                                                           0xFFFFE000L
+//GDS_UE_ERR_STATUS_LO
+#define GDS_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define GDS_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define GDS_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define GDS_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define GDS_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define GDS_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define GDS_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define GDS_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//GDS_UE_ERR_STATUS_HI
+#define GDS_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define GDS_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define GDS_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define GDS_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define GDS_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define GDS_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define GDS_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1d
+#define GDS_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define GDS_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define GDS_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define GDS_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define GDS_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define GDS_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+#define GDS_UE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xE0000000L
+//GDS_CE_ERR_STATUS_LO
+#define GDS_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define GDS_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define GDS_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define GDS_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define GDS_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define GDS_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define GDS_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define GDS_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//GDS_CE_ERR_STATUS_HI
+#define GDS_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define GDS_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                    0x1
+#define GDS_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define GDS_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define GDS_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define GDS_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define GDS_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1b
+#define GDS_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define GDS_CE_ERR_STATUS_HI__OTHER_MASK                                                                      0x00000002L
+#define GDS_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define GDS_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define GDS_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define GDS_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
+#define GDS_CE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xF8000000L
 
 
 // addressBlock: xcd0_gc_rbdec
@@ -7370,6 +7784,30 @@
 #define GCEA_MAM_CTRL2__ARAM_FLUSH_NOALLOC_MASK                                                               0x00000040L
 #define GCEA_MAM_CTRL2__RESERVED_FIELD_MASK                                                                   0x00FFFF80L
 #define GCEA_MAM_CTRL2__ADDR_HI_MASK                                                                          0xFF000000L
+//GCEA_UE_ERR_STATUS_LO
+#define GCEA_UE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                       0x0
+#define GCEA_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                      0x1
+#define GCEA_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                 0x2
+#define GCEA_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                               0x18
+#define GCEA_UE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                         0x00000001L
+#define GCEA_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                        0x00000002L
+#define GCEA_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                   0x00FFFFFCL
+#define GCEA_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                 0xFF000000L
+//GCEA_UE_ERR_STATUS_HI
+#define GCEA_UE_ERR_STATUS_HI__ECC__SHIFT                                                                     0x0
+#define GCEA_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                  0x1
+#define GCEA_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                     0x2
+#define GCEA_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                0x3
+#define GCEA_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                  0x17
+#define GCEA_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                 0x1a
+#define GCEA_UE_ERR_STATUS_HI__RESERVED_FIELD__SHIFT                                                          0x1d
+#define GCEA_UE_ERR_STATUS_HI__ECC_MASK                                                                       0x00000001L
+#define GCEA_UE_ERR_STATUS_HI__PARITY_MASK                                                                    0x00000002L
+#define GCEA_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                       0x00000004L
+#define GCEA_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                  0x007FFFF8L
+#define GCEA_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                    0x03800000L
+#define GCEA_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                   0x1C000000L
+#define GCEA_UE_ERR_STATUS_HI__RESERVED_FIELD_MASK                                                            0xE0000000L
 //GCEA_DSM_CNTL
 #define GCEA_DSM_CNTL__DRAMRD_CMDMEM_DSM_IRRITATOR_DATA__SHIFT                                                0x0
 #define GCEA_DSM_CNTL__DRAMRD_CMDMEM_ENABLE_SINGLE_WRITE__SHIFT                                               0x2
@@ -7745,6 +8183,30 @@
 #define GCEA_SDP_BACKDOOR_MISCCREDITS__WRRSP_CREDITS_RELEASED_MASK                                            0x0000FF00L
 #define GCEA_SDP_BACKDOOR_MISCCREDITS__PRB_REQ_CREDITS_RELEASED_MASK                                          0x007F0000L
 #define GCEA_SDP_BACKDOOR_MISCCREDITS__PRB_RSP_CREDITS_RECEIVED_MASK                                          0x3F800000L
+//GCEA_CE_ERR_STATUS_LO
+#define GCEA_CE_ERR_STATUS_LO__STATUS_VALID_FLAG__SHIFT                                                       0x0
+#define GCEA_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                      0x1
+#define GCEA_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                 0x2
+#define GCEA_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                               0x18
+#define GCEA_CE_ERR_STATUS_LO__STATUS_VALID_FLAG_MASK                                                         0x00000001L
+#define GCEA_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                        0x00000002L
+#define GCEA_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                   0x00FFFFFCL
+#define GCEA_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                 0xFF000000L
+//GCEA_CE_ERR_STATUS_HI
+#define GCEA_CE_ERR_STATUS_HI__ECC__SHIFT                                                                     0x0
+#define GCEA_CE_ERR_STATUS_HI__RESERVED_FIELD0__SHIFT                                                         0x1
+#define GCEA_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                     0x2
+#define GCEA_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                0x3
+#define GCEA_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                  0x17
+#define GCEA_CE_ERR_STATUS_HI__POISON__SHIFT                                                                  0x1a
+#define GCEA_CE_ERR_STATUS_HI__RESERVED_FIELD1__SHIFT                                                         0x1b
+#define GCEA_CE_ERR_STATUS_HI__ECC_MASK                                                                       0x00000001L
+#define GCEA_CE_ERR_STATUS_HI__RESERVED_FIELD0_MASK                                                           0x00000002L
+#define GCEA_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                       0x00000004L
+#define GCEA_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                  0x007FFFF8L
+#define GCEA_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                    0x03800000L
+#define GCEA_CE_ERR_STATUS_HI__POISON_MASK                                                                    0x04000000L
+#define GCEA_CE_ERR_STATUS_HI__RESERVED_FIELD1_MASK                                                           0xF8000000L
 //GCEA_SDP_ENABLE
 #define GCEA_SDP_ENABLE__ENABLE__SHIFT                                                                        0x0
 #define GCEA_SDP_ENABLE__ENABLE_MASK                                                                          0x00000001L
@@ -8440,6 +8902,54 @@
 //ATC_L2_MM_GROUP_RT_CLASSES
 #define ATC_L2_MM_GROUP_RT_CLASSES__GROUP_RT_CLASS__SHIFT                                                     0x0
 #define ATC_L2_MM_GROUP_RT_CLASSES__GROUP_RT_CLASS_MASK                                                       0xFFFFFFFFL
+//ATC_L2_UE_ERR_STATUS_LO
+#define ATC_L2_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                 0x0
+#define ATC_L2_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                    0x1
+#define ATC_L2_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                               0x2
+#define ATC_L2_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                             0x18
+#define ATC_L2_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                   0x00000001L
+#define ATC_L2_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                      0x00000002L
+#define ATC_L2_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                 0x00FFFFFCL
+#define ATC_L2_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                               0xFF000000L
+//ATC_L2_UE_ERR_STATUS_HI
+#define ATC_L2_UE_ERR_STATUS_HI__ECC__SHIFT                                                                   0x0
+#define ATC_L2_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                0x1
+#define ATC_L2_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                   0x2
+#define ATC_L2_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                              0x3
+#define ATC_L2_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                0x17
+#define ATC_L2_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                               0x1a
+#define ATC_L2_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                              0x1d
+#define ATC_L2_UE_ERR_STATUS_HI__ECC_MASK                                                                     0x00000001L
+#define ATC_L2_UE_ERR_STATUS_HI__PARITY_MASK                                                                  0x00000002L
+#define ATC_L2_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                     0x00000004L
+#define ATC_L2_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                0x007FFFF8L
+#define ATC_L2_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                  0x03800000L
+#define ATC_L2_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                 0x1C000000L
+#define ATC_L2_UE_ERR_STATUS_HI__RESERVED_MASK                                                                0x60000000L
+//ATC_L2_CE_ERR_STATUS_LO
+#define ATC_L2_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                 0x0
+#define ATC_L2_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                    0x1
+#define ATC_L2_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                               0x2
+#define ATC_L2_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                             0x18
+#define ATC_L2_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                   0x00000001L
+#define ATC_L2_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                      0x00000002L
+#define ATC_L2_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                 0x00FFFFFCL
+#define ATC_L2_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                               0xFF000000L
+//ATC_L2_CE_ERR_STATUS_HI
+#define ATC_L2_CE_ERR_STATUS_HI__ECC__SHIFT                                                                   0x0
+#define ATC_L2_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                 0x1
+#define ATC_L2_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                   0x2
+#define ATC_L2_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                              0x3
+#define ATC_L2_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                0x17
+#define ATC_L2_CE_ERR_STATUS_HI__POISON__SHIFT                                                                0x1a
+#define ATC_L2_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                              0x1b
+#define ATC_L2_CE_ERR_STATUS_HI__ECC_MASK                                                                     0x00000001L
+#define ATC_L2_CE_ERR_STATUS_HI__OTHER_MASK                                                                   0x00000002L
+#define ATC_L2_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                     0x00000004L
+#define ATC_L2_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                0x007FFFF8L
+#define ATC_L2_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                  0x03800000L
+#define ATC_L2_CE_ERR_STATUS_HI__POISON_MASK                                                                  0x04000000L
+#define ATC_L2_CE_ERR_STATUS_HI__RESERVED_MASK                                                                0xF8000000L
 
 
 // addressBlock: xcd0_gc_utcl2_vml2pfdec
@@ -8888,6 +9398,150 @@
 #define UTCL2_EDC_CONFIG__DIS_EDC__SHIFT                                                                      0x1
 #define UTCL2_EDC_CONFIG__WRITE_DIS_MASK                                                                      0x00000001L
 #define UTCL2_EDC_CONFIG__DIS_EDC_MASK                                                                        0x00000002L
+//VML2_UE_ERR_STATUS_LO
+#define VML2_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                   0x0
+#define VML2_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                      0x1
+#define VML2_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                 0x2
+#define VML2_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                               0x18
+#define VML2_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                     0x00000001L
+#define VML2_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                        0x00000002L
+#define VML2_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                   0x00FFFFFCL
+#define VML2_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                 0xFF000000L
+//VML2_WALKER_UE_ERR_STATUS_LO
+#define VML2_WALKER_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                            0x0
+#define VML2_WALKER_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                               0x1
+#define VML2_WALKER_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                          0x2
+#define VML2_WALKER_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                        0x18
+#define VML2_WALKER_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                              0x00000001L
+#define VML2_WALKER_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                 0x00000002L
+#define VML2_WALKER_UE_ERR_STATUS_LO__ADDRESS_MASK                                                            0x00FFFFFCL
+#define VML2_WALKER_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                          0xFF000000L
+//UTCL2_UE_ERR_STATUS_LO
+#define UTCL2_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                  0x0
+#define UTCL2_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define UTCL2_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define UTCL2_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define UTCL2_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                    0x00000001L
+#define UTCL2_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define UTCL2_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define UTCL2_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
+//VML2_UE_ERR_STATUS_HI
+#define VML2_UE_ERR_STATUS_HI__ECC__SHIFT                                                                     0x0
+#define VML2_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                  0x1
+#define VML2_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                     0x2
+#define VML2_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                0x3
+#define VML2_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                  0x17
+#define VML2_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                 0x1a
+#define VML2_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                0x1d
+#define VML2_UE_ERR_STATUS_HI__ECC_MASK                                                                       0x00000001L
+#define VML2_UE_ERR_STATUS_HI__PARITY_MASK                                                                    0x00000002L
+#define VML2_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                       0x00000004L
+#define VML2_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                  0x007FFFF8L
+#define VML2_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                    0x03800000L
+#define VML2_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                   0x1C000000L
+#define VML2_UE_ERR_STATUS_HI__RESERVED_MASK                                                                  0xE0000000L
+//VML2_WALKER_UE_ERR_STATUS_HI
+#define VML2_WALKER_UE_ERR_STATUS_HI__ECC__SHIFT                                                              0x0
+#define VML2_WALKER_UE_ERR_STATUS_HI__PARITY__SHIFT                                                           0x1
+#define VML2_WALKER_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                              0x2
+#define VML2_WALKER_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                         0x3
+#define VML2_WALKER_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                           0x17
+#define VML2_WALKER_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                          0x1a
+#define VML2_WALKER_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                         0x1d
+#define VML2_WALKER_UE_ERR_STATUS_HI__ECC_MASK                                                                0x00000001L
+#define VML2_WALKER_UE_ERR_STATUS_HI__PARITY_MASK                                                             0x00000002L
+#define VML2_WALKER_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                0x00000004L
+#define VML2_WALKER_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                           0x007FFFF8L
+#define VML2_WALKER_UE_ERR_STATUS_HI__UE_CNT_MASK                                                             0x03800000L
+#define VML2_WALKER_UE_ERR_STATUS_HI__FED_CNT_MASK                                                            0x1C000000L
+#define VML2_WALKER_UE_ERR_STATUS_HI__RESERVED_MASK                                                           0xE0000000L
+//UTCL2_UE_ERR_STATUS_HI
+#define UTCL2_UE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define UTCL2_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                 0x1
+#define UTCL2_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define UTCL2_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define UTCL2_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                 0x17
+#define UTCL2_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                0x1a
+#define UTCL2_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                               0x1d
+#define UTCL2_UE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define UTCL2_UE_ERR_STATUS_HI__PARITY_MASK                                                                   0x00000002L
+#define UTCL2_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define UTCL2_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define UTCL2_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                   0x03800000L
+#define UTCL2_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                  0x1C000000L
+#define UTCL2_UE_ERR_STATUS_HI__RESERVED_MASK                                                                 0xE0000000L
+//VML2_CE_ERR_STATUS_LO
+#define VML2_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                   0x0
+#define VML2_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                      0x1
+#define VML2_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                 0x2
+#define VML2_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                               0x18
+#define VML2_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                     0x00000001L
+#define VML2_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                        0x00000002L
+#define VML2_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                   0x00FFFFFCL
+#define VML2_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                 0xFF000000L
+//VML2_WALKER_CE_ERR_STATUS_LO
+#define VML2_WALKER_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                            0x0
+#define VML2_WALKER_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                               0x1
+#define VML2_WALKER_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                          0x2
+#define VML2_WALKER_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                        0x18
+#define VML2_WALKER_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                              0x00000001L
+#define VML2_WALKER_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                 0x00000002L
+#define VML2_WALKER_CE_ERR_STATUS_LO__ADDRESS_MASK                                                            0x00FFFFFCL
+#define VML2_WALKER_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                          0xFF000000L
+//UTCL2_CE_ERR_STATUS_LO
+#define UTCL2_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                  0x0
+#define UTCL2_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                     0x1
+#define UTCL2_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                0x2
+#define UTCL2_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                              0x18
+#define UTCL2_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                    0x00000001L
+#define UTCL2_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                       0x00000002L
+#define UTCL2_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                  0x00FFFFFCL
+#define UTCL2_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                0xFF000000L
+//VML2_CE_ERR_STATUS_HI
+#define VML2_CE_ERR_STATUS_HI__ECC__SHIFT                                                                     0x0
+#define VML2_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                   0x1
+#define VML2_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                     0x2
+#define VML2_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                0x3
+#define VML2_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                  0x17
+#define VML2_CE_ERR_STATUS_HI__POISON__SHIFT                                                                  0x1a
+#define VML2_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                0x1b
+#define VML2_CE_ERR_STATUS_HI__ECC_MASK                                                                       0x00000001L
+#define VML2_CE_ERR_STATUS_HI__OTHER_MASK                                                                     0x00000002L
+#define VML2_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                       0x00000004L
+#define VML2_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                  0x007FFFF8L
+#define VML2_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                    0x03800000L
+#define VML2_CE_ERR_STATUS_HI__POISON_MASK                                                                    0x04000000L
+#define VML2_CE_ERR_STATUS_HI__RESERVED_MASK                                                                  0xF8000000L
+//VML2_WALKER_CE_ERR_STATUS_HI
+#define VML2_WALKER_CE_ERR_STATUS_HI__ECC__SHIFT                                                              0x0
+#define VML2_WALKER_CE_ERR_STATUS_HI__OTHER__SHIFT                                                            0x1
+#define VML2_WALKER_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                              0x2
+#define VML2_WALKER_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                         0x3
+#define VML2_WALKER_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                           0x17
+#define VML2_WALKER_CE_ERR_STATUS_HI__POISON__SHIFT                                                           0x1a
+#define VML2_WALKER_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                         0x1b
+#define VML2_WALKER_CE_ERR_STATUS_HI__ECC_MASK                                                                0x00000001L
+#define VML2_WALKER_CE_ERR_STATUS_HI__OTHER_MASK                                                              0x00000002L
+#define VML2_WALKER_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                0x00000004L
+#define VML2_WALKER_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                           0x007FFFF8L
+#define VML2_WALKER_CE_ERR_STATUS_HI__CE_CNT_MASK                                                             0x03800000L
+#define VML2_WALKER_CE_ERR_STATUS_HI__POISON_MASK                                                             0x04000000L
+#define VML2_WALKER_CE_ERR_STATUS_HI__RESERVED_MASK                                                           0xF8000000L
+//UTCL2_CE_ERR_STATUS_HI
+#define UTCL2_CE_ERR_STATUS_HI__ECC__SHIFT                                                                    0x0
+#define UTCL2_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                  0x1
+#define UTCL2_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define UTCL2_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                               0x3
+#define UTCL2_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                 0x17
+#define UTCL2_CE_ERR_STATUS_HI__POISON__SHIFT                                                                 0x1a
+#define UTCL2_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                               0x1b
+#define UTCL2_CE_ERR_STATUS_HI__ECC_MASK                                                                      0x00000001L
+#define UTCL2_CE_ERR_STATUS_HI__OTHER_MASK                                                                    0x00000002L
+#define UTCL2_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define UTCL2_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define UTCL2_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                   0x03800000L
+#define UTCL2_CE_ERR_STATUS_HI__POISON_MASK                                                                   0x04000000L
+#define UTCL2_CE_ERR_STATUS_HI__RESERVED_MASK                                                                 0xF8000000L
 
 
 // addressBlock: xcd0_gc_utcl2_vml2vcdec
@@ -11139,6 +11793,98 @@
 //TC_CFG_L2_VOLATILE
 #define TC_CFG_L2_VOLATILE__VOL__SHIFT                                                                        0x0
 #define TC_CFG_L2_VOLATILE__VOL_MASK                                                                          0x0000000FL
+//TCP_UE_EDC_HI_REG
+#define TCP_UE_EDC_HI_REG__ECC__SHIFT                                                                         0x0
+#define TCP_UE_EDC_HI_REG__PARITY__SHIFT                                                                      0x1
+#define TCP_UE_EDC_HI_REG__ERR_INFO_VALID_FLAG__SHIFT                                                         0x2
+#define TCP_UE_EDC_HI_REG__ERR_INFO__SHIFT                                                                    0x3
+#define TCP_UE_EDC_HI_REG__UE_CNT__SHIFT                                                                      0x17
+#define TCP_UE_EDC_HI_REG__FED_CNT__SHIFT                                                                     0x1a
+#define TCP_UE_EDC_HI_REG__RESERVED__SHIFT                                                                    0x1d
+#define TCP_UE_EDC_HI_REG__ECC_MASK                                                                           0x00000001L
+#define TCP_UE_EDC_HI_REG__PARITY_MASK                                                                        0x00000002L
+#define TCP_UE_EDC_HI_REG__ERR_INFO_VALID_FLAG_MASK                                                           0x00000004L
+#define TCP_UE_EDC_HI_REG__ERR_INFO_MASK                                                                      0x007FFFF8L
+#define TCP_UE_EDC_HI_REG__UE_CNT_MASK                                                                        0x03800000L
+#define TCP_UE_EDC_HI_REG__FED_CNT_MASK                                                                       0x1C000000L
+#define TCP_UE_EDC_HI_REG__RESERVED_MASK                                                                      0xE0000000L
+//TCP_UE_EDC_LO_REG
+#define TCP_UE_EDC_LO_REG__STATUS_VALID_FLAG__SHIFT                                                           0x0
+#define TCP_UE_EDC_LO_REG__ADDRESS_INFO_VALID_FLAG__SHIFT                                                     0x1
+#define TCP_UE_EDC_LO_REG__ADDRESS__SHIFT                                                                     0x2
+#define TCP_UE_EDC_LO_REG__MEM_ID__SHIFT                                                                      0x18
+#define TCP_UE_EDC_LO_REG__STATUS_VALID_FLAG_MASK                                                             0x00000001L
+#define TCP_UE_EDC_LO_REG__ADDRESS_INFO_VALID_FLAG_MASK                                                       0x00000002L
+#define TCP_UE_EDC_LO_REG__ADDRESS_MASK                                                                       0x00FFFFFCL
+#define TCP_UE_EDC_LO_REG__MEM_ID_MASK                                                                        0xFF000000L
+//TCP_CE_EDC_HI_REG
+#define TCP_CE_EDC_HI_REG__ECC__SHIFT                                                                         0x0
+#define TCP_CE_EDC_HI_REG__ERR_INFO_VALID_FLAG__SHIFT                                                         0x2
+#define TCP_CE_EDC_HI_REG__ERR_INFO__SHIFT                                                                    0x3
+#define TCP_CE_EDC_HI_REG__CE_CNT__SHIFT                                                                      0x17
+#define TCP_CE_EDC_HI_REG__POISON__SHIFT                                                                      0x1a
+#define TCP_CE_EDC_HI_REG__RESERVED__SHIFT                                                                    0x1b
+#define TCP_CE_EDC_HI_REG__ECC_MASK                                                                           0x00000001L
+#define TCP_CE_EDC_HI_REG__ERR_INFO_VALID_FLAG_MASK                                                           0x00000004L
+#define TCP_CE_EDC_HI_REG__ERR_INFO_MASK                                                                      0x007FFFF8L
+#define TCP_CE_EDC_HI_REG__CE_CNT_MASK                                                                        0x03800000L
+#define TCP_CE_EDC_HI_REG__POISON_MASK                                                                        0x04000000L
+#define TCP_CE_EDC_HI_REG__RESERVED_MASK                                                                      0xF8000000L
+//TCP_CE_EDC_LO_REG
+#define TCP_CE_EDC_LO_REG__STATUS_VALID_FLAG__SHIFT                                                           0x0
+#define TCP_CE_EDC_LO_REG__ADDRESS_INFO_VALID_FLAG__SHIFT                                                     0x1
+#define TCP_CE_EDC_LO_REG__ADDRESS__SHIFT                                                                     0x2
+#define TCP_CE_EDC_LO_REG__MEM_ID__SHIFT                                                                      0x18
+#define TCP_CE_EDC_LO_REG__STATUS_VALID_FLAG_MASK                                                             0x00000001L
+#define TCP_CE_EDC_LO_REG__ADDRESS_INFO_VALID_FLAG_MASK                                                       0x00000002L
+#define TCP_CE_EDC_LO_REG__ADDRESS_MASK                                                                       0x00FFFFFCL
+#define TCP_CE_EDC_LO_REG__MEM_ID_MASK                                                                        0xFF000000L
+//TCI_UE_EDC_HI_REG
+#define TCI_UE_EDC_HI_REG__ECC__SHIFT                                                                         0x0
+#define TCI_UE_EDC_HI_REG__PARITY__SHIFT                                                                      0x1
+#define TCI_UE_EDC_HI_REG__ERR_INFO_VALID_FLAG__SHIFT                                                         0x2
+#define TCI_UE_EDC_HI_REG__ERR_INFO__SHIFT                                                                    0x3
+#define TCI_UE_EDC_HI_REG__UE_CNT__SHIFT                                                                      0x17
+#define TCI_UE_EDC_HI_REG__FED_CNT__SHIFT                                                                     0x1a
+#define TCI_UE_EDC_HI_REG__RESERVED__SHIFT                                                                    0x1d
+#define TCI_UE_EDC_HI_REG__ECC_MASK                                                                           0x00000001L
+#define TCI_UE_EDC_HI_REG__PARITY_MASK                                                                        0x00000002L
+#define TCI_UE_EDC_HI_REG__ERR_INFO_VALID_FLAG_MASK                                                           0x00000004L
+#define TCI_UE_EDC_HI_REG__ERR_INFO_MASK                                                                      0x007FFFF8L
+#define TCI_UE_EDC_HI_REG__UE_CNT_MASK                                                                        0x03800000L
+#define TCI_UE_EDC_HI_REG__FED_CNT_MASK                                                                       0x1C000000L
+#define TCI_UE_EDC_HI_REG__RESERVED_MASK                                                                      0xE0000000L
+//TCI_UE_EDC_LO_REG
+#define TCI_UE_EDC_LO_REG__STATUS_VALID_FLAG__SHIFT                                                           0x0
+#define TCI_UE_EDC_LO_REG__ADDRESS_INFO_VALID_FLAG__SHIFT                                                     0x1
+#define TCI_UE_EDC_LO_REG__ADDRESS__SHIFT                                                                     0x2
+#define TCI_UE_EDC_LO_REG__MEM_ID__SHIFT                                                                      0x18
+#define TCI_UE_EDC_LO_REG__STATUS_VALID_FLAG_MASK                                                             0x00000001L
+#define TCI_UE_EDC_LO_REG__ADDRESS_INFO_VALID_FLAG_MASK                                                       0x00000002L
+#define TCI_UE_EDC_LO_REG__ADDRESS_MASK                                                                       0x00FFFFFCL
+#define TCI_UE_EDC_LO_REG__MEM_ID_MASK                                                                        0xFF000000L
+//TCI_CE_EDC_HI_REG
+#define TCI_CE_EDC_HI_REG__ECC__SHIFT                                                                         0x0
+#define TCI_CE_EDC_HI_REG__ERR_INFO_VALID_FLAG__SHIFT                                                         0x2
+#define TCI_CE_EDC_HI_REG__ERR_INFO__SHIFT                                                                    0x3
+#define TCI_CE_EDC_HI_REG__CE_CNT__SHIFT                                                                      0x17
+#define TCI_CE_EDC_HI_REG__POISON__SHIFT                                                                      0x1a
+#define TCI_CE_EDC_HI_REG__RESERVED__SHIFT                                                                    0x1b
+#define TCI_CE_EDC_HI_REG__ECC_MASK                                                                           0x00000001L
+#define TCI_CE_EDC_HI_REG__ERR_INFO_VALID_FLAG_MASK                                                           0x00000004L
+#define TCI_CE_EDC_HI_REG__ERR_INFO_MASK                                                                      0x007FFFF8L
+#define TCI_CE_EDC_HI_REG__CE_CNT_MASK                                                                        0x03800000L
+#define TCI_CE_EDC_HI_REG__POISON_MASK                                                                        0x04000000L
+#define TCI_CE_EDC_HI_REG__RESERVED_MASK                                                                      0xF8000000L
+//TCI_CE_EDC_LO_REG
+#define TCI_CE_EDC_LO_REG__STATUS_VALID_FLAG__SHIFT                                                           0x0
+#define TCI_CE_EDC_LO_REG__ADDRESS_INFO_VALID_FLAG__SHIFT                                                     0x1
+#define TCI_CE_EDC_LO_REG__ADDRESS__SHIFT                                                                     0x2
+#define TCI_CE_EDC_LO_REG__MEM_ID__SHIFT                                                                      0x18
+#define TCI_CE_EDC_LO_REG__STATUS_VALID_FLAG_MASK                                                             0x00000001L
+#define TCI_CE_EDC_LO_REG__ADDRESS_INFO_VALID_FLAG_MASK                                                       0x00000002L
+#define TCI_CE_EDC_LO_REG__ADDRESS_MASK                                                                       0x00FFFFFCL
+#define TCI_CE_EDC_LO_REG__MEM_ID_MASK                                                                        0xFF000000L
 //TCI_MISC
 #define TCI_MISC__FGCG_REPEATER_DISABLE__SHIFT                                                                0x0
 #define TCI_MISC__LEGACY_MGCG_DISABLE__SHIFT                                                                  0x1
@@ -11560,6 +12306,112 @@
 #define TCX_DSM_CNTL2__SED_ENABLE_ERROR_INJECT_MASK                                                           0x00000003L
 #define TCX_DSM_CNTL2__SED_SELECT_INJECT_DELAY_MASK                                                           0x00000004L
 #define TCX_DSM_CNTL2__INJECT_DELAY_MASK                                                                      0xFC000000L
+//TCA_UE_ERR_STATUS_LO
+#define TCA_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define TCA_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define TCA_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define TCA_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define TCA_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define TCA_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define TCA_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define TCA_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//TCA_UE_ERR_STATUS_HI
+#define TCA_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define TCA_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define TCA_UE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define TCA_UE_ERR_STATUS_HI__ERROR_INFO__SHIFT                                                               0x3
+#define TCA_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define TCA_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define TCA_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define TCA_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define TCA_UE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define TCA_UE_ERR_STATUS_HI__ERROR_INFO_MASK                                                                 0x007FFFF8L
+#define TCA_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define TCA_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+//TCX_UE_ERR_STATUS_LO
+#define TCX_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define TCX_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define TCX_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define TCX_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define TCX_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define TCX_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define TCX_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define TCX_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//TCX_UE_ERR_STATUS_HI
+#define TCX_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define TCX_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define TCX_UE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define TCX_UE_ERR_STATUS_HI__ERROR_INFO__SHIFT                                                               0x3
+#define TCX_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define TCX_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define TCX_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define TCX_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define TCX_UE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define TCX_UE_ERR_STATUS_HI__ERROR_INFO_MASK                                                                 0x007FFFF8L
+#define TCX_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define TCX_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+//TCX_CE_ERR_STATUS_LO
+#define TCX_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define TCX_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define TCX_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define TCX_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define TCX_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define TCX_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define TCX_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define TCX_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//TCX_CE_ERR_STATUS_HI
+#define TCX_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define TCX_CE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define TCX_CE_ERR_STATUS_HI__ERROR_INFO__SHIFT                                                               0x3
+#define TCX_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define TCX_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define TCX_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define TCX_CE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define TCX_CE_ERR_STATUS_HI__ERROR_INFO_MASK                                                                 0x007FFFF8L
+#define TCX_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define TCX_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
+//TCC_UE_ERR_STATUS_LO
+#define TCC_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define TCC_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define TCC_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define TCC_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define TCC_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define TCC_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define TCC_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define TCC_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//TCC_UE_ERR_STATUS_HI
+#define TCC_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define TCC_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define TCC_UE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define TCC_UE_ERR_STATUS_HI__ERROR_INFO__SHIFT                                                               0x3
+#define TCC_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define TCC_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define TCC_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define TCC_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define TCC_UE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define TCC_UE_ERR_STATUS_HI__ERROR_INFO_MASK                                                                 0x007FFFF8L
+#define TCC_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define TCC_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+//TCC_CE_ERR_STATUS_LO
+#define TCC_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define TCC_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define TCC_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define TCC_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define TCC_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define TCC_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define TCC_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define TCC_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//TCC_CE_ERR_STATUS_HI
+#define TCC_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define TCC_CE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define TCC_CE_ERR_STATUS_HI__ERROR_INFO__SHIFT                                                               0x3
+#define TCC_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define TCC_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define TCC_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define TCC_CE_ERR_STATUS_HI__ERROR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define TCC_CE_ERR_STATUS_HI__ERROR_INFO_MASK                                                                 0x007FFFF8L
+#define TCC_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define TCC_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
 
 
 // addressBlock: xcd0_gc_shdec
@@ -14384,6 +15236,150 @@
 #define CP_VMID_STATUS__PREEMPT_CE_STATUS__SHIFT                                                              0x10
 #define CP_VMID_STATUS__PREEMPT_DE_STATUS_MASK                                                                0x0000FFFFL
 #define CP_VMID_STATUS__PREEMPT_CE_STATUS_MASK                                                                0xFFFF0000L
+//CPC_UE_ERR_STATUS_LO
+#define CPC_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define CPC_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define CPC_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define CPC_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define CPC_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define CPC_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define CPC_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define CPC_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//CPC_UE_ERR_STATUS_HI
+#define CPC_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define CPC_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define CPC_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define CPC_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define CPC_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define CPC_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define CPC_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1d
+#define CPC_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define CPC_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define CPC_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define CPC_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define CPC_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define CPC_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+#define CPC_UE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xE0000000L
+//CPC_CE_ERR_STATUS_LO
+#define CPC_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define CPC_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define CPC_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define CPC_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define CPC_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define CPC_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define CPC_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define CPC_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//CPC_CE_ERR_STATUS_HI
+#define CPC_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define CPC_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                    0x1
+#define CPC_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define CPC_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define CPC_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define CPC_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define CPC_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1b
+#define CPC_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define CPC_CE_ERR_STATUS_HI__OTHER_MASK                                                                      0x00000002L
+#define CPC_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define CPC_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define CPC_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define CPC_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
+#define CPC_CE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xF8000000L
+//CPF_UE_ERR_STATUS_LO
+#define CPF_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define CPF_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define CPF_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define CPF_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define CPF_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define CPF_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define CPF_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define CPF_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//CPF_UE_ERR_STATUS_HI
+#define CPF_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define CPF_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define CPF_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define CPF_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define CPF_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define CPF_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define CPF_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1d
+#define CPF_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define CPF_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define CPF_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define CPF_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define CPF_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define CPF_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+#define CPF_UE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xE0000000L
+//CPF_CE_ERR_STATUS_LO
+#define CPF_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define CPF_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define CPF_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define CPF_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define CPF_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define CPF_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define CPF_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define CPF_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//CPF_CE_ERR_STATUS_HI
+#define CPF_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define CPF_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                    0x1
+#define CPF_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define CPF_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define CPF_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define CPF_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define CPF_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1b
+#define CPF_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define CPF_CE_ERR_STATUS_HI__OTHER_MASK                                                                      0x00000002L
+#define CPF_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define CPF_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define CPF_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define CPF_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
+#define CPF_CE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xF8000000L
+//CPG_UE_ERR_STATUS_LO
+#define CPG_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define CPG_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define CPG_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define CPG_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define CPG_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define CPG_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define CPG_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define CPG_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//CPG_UE_ERR_STATUS_HI
+#define CPG_UE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define CPG_UE_ERR_STATUS_HI__PARITY__SHIFT                                                                   0x1
+#define CPG_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define CPG_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define CPG_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                                   0x17
+#define CPG_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                                  0x1a
+#define CPG_UE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1d
+#define CPG_UE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define CPG_UE_ERR_STATUS_HI__PARITY_MASK                                                                     0x00000002L
+#define CPG_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define CPG_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define CPG_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                     0x03800000L
+#define CPG_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                    0x1C000000L
+#define CPG_UE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xE0000000L
+//CPG_CE_ERR_STATUS_LO
+#define CPG_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                    0x0
+#define CPG_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                       0x1
+#define CPG_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                                  0x2
+#define CPG_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                                0x18
+#define CPG_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                      0x00000001L
+#define CPG_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                         0x00000002L
+#define CPG_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                    0x00FFFFFCL
+#define CPG_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                                  0xFF000000L
+//CPG_CE_ERR_STATUS_HI
+#define CPG_CE_ERR_STATUS_HI__ECC__SHIFT                                                                      0x0
+#define CPG_CE_ERR_STATUS_HI__OTHER__SHIFT                                                                    0x1
+#define CPG_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                      0x2
+#define CPG_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                                 0x3
+#define CPG_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                                   0x17
+#define CPG_CE_ERR_STATUS_HI__POISON__SHIFT                                                                   0x1a
+#define CPG_CE_ERR_STATUS_HI__RESERVED__SHIFT                                                                 0x1b
+#define CPG_CE_ERR_STATUS_HI__ECC_MASK                                                                        0x00000001L
+#define CPG_CE_ERR_STATUS_HI__OTHER_MASK                                                                      0x00000002L
+#define CPG_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                        0x00000004L
+#define CPG_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                                   0x007FFFF8L
+#define CPG_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                     0x03800000L
+#define CPG_CE_ERR_STATUS_HI__POISON_MASK                                                                     0x04000000L
+#define CPG_CE_ERR_STATUS_HI__RESERVED_MASK                                                                   0xF8000000L
 
 
 // addressBlock: xcd0_gc_cppdec2
@@ -22764,6 +23760,74 @@
 #define SPI_WAVE_LIMIT_CNTL__GS_WAVE_GRAN_MASK                                                                0x00000030L
 #define SPI_WAVE_LIMIT_CNTL__HS_WAVE_GRAN_MASK                                                                0x000000C0L
 
+// addressBlock: xcd0_gc_gccanedec
+//GC_CANE_ERR_STATUS
+#define GC_CANE_ERR_STATUS__SDPM_RDRSP_STATUS__SHIFT                                                          0x0
+#define GC_CANE_ERR_STATUS__SDPM_WRRSP_STATUS__SHIFT                                                          0x4
+#define GC_CANE_ERR_STATUS__SDPM_RDRSP_DATASTATUS__SHIFT                                                      0x8
+#define GC_CANE_ERR_STATUS__SDPM_RDRSP_DATAPARITY_ERROR__SHIFT                                                0xa
+#define GC_CANE_ERR_STATUS__SDPS_DAT_ERROR__SHIFT                                                             0xb
+#define GC_CANE_ERR_STATUS__SDPS_DAT_PARITY_ERROR__SHIFT                                                      0xc
+#define GC_CANE_ERR_STATUS__CLEAR_ERROR_STATUS__SHIFT                                                         0xd
+#define GC_CANE_ERR_STATUS__BUSY_ON_ERROR__SHIFT                                                              0xe
+#define GC_CANE_ERR_STATUS__BUSY_ON_UER_ERROR__SHIFT                                                          0xf
+#define GC_CANE_ERR_STATUS__FUE_FLAG__SHIFT                                                                   0x10
+#define GC_CANE_ERR_STATUS__INTERRUPT_ON_FATAL__SHIFT                                                         0x11
+#define GC_CANE_ERR_STATUS__LEVEL_INTERRUPT__SHIFT                                                            0x12
+#define GC_CANE_ERR_STATUS__SDPM_RDRSP_STATUS_MASK                                                            0x0000000FL
+#define GC_CANE_ERR_STATUS__SDPM_WRRSP_STATUS_MASK                                                            0x000000F0L
+#define GC_CANE_ERR_STATUS__SDPM_RDRSP_DATASTATUS_MASK                                                        0x00000300L
+#define GC_CANE_ERR_STATUS__SDPM_RDRSP_DATAPARITY_ERROR_MASK                                                  0x00000400L
+#define GC_CANE_ERR_STATUS__SDPS_DAT_ERROR_MASK                                                               0x00000800L
+#define GC_CANE_ERR_STATUS__SDPS_DAT_PARITY_ERROR_MASK                                                        0x00001000L
+#define GC_CANE_ERR_STATUS__CLEAR_ERROR_STATUS_MASK                                                           0x00002000L
+#define GC_CANE_ERR_STATUS__BUSY_ON_ERROR_MASK                                                                0x00004000L
+#define GC_CANE_ERR_STATUS__BUSY_ON_UER_ERROR_MASK                                                            0x00008000L
+#define GC_CANE_ERR_STATUS__FUE_FLAG_MASK                                                                     0x00010000L
+#define GC_CANE_ERR_STATUS__INTERRUPT_ON_FATAL_MASK                                                           0x00020000L
+#define GC_CANE_ERR_STATUS__LEVEL_INTERRUPT_MASK                                                              0x00040000L
+//GC_CANE_UE_ERR_STATUS_LO
+#define GC_CANE_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                0x0
+#define GC_CANE_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                   0x1
+#define GC_CANE_UE_ERR_STATUS_LO__ADDRESS__SHIFT                                                              0x2
+#define GC_CANE_UE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                            0x18
+#define GC_CANE_UE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                  0x00000001L
+#define GC_CANE_UE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                     0x00000002L
+#define GC_CANE_UE_ERR_STATUS_LO__ADDRESS_MASK                                                                0x00FFFFFCL
+#define GC_CANE_UE_ERR_STATUS_LO__MEMORY_ID_MASK                                                              0xFF000000L
+//GC_CANE_UE_ERR_STATUS_HI
+#define GC_CANE_UE_ERR_STATUS_HI__ECC__SHIFT                                                                  0x0
+#define GC_CANE_UE_ERR_STATUS_HI__PARITY__SHIFT                                                               0x1
+#define GC_CANE_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                  0x2
+#define GC_CANE_UE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                             0x3
+#define GC_CANE_UE_ERR_STATUS_HI__UE_CNT__SHIFT                                                               0x17
+#define GC_CANE_UE_ERR_STATUS_HI__FED_CNT__SHIFT                                                              0x1a
+#define GC_CANE_UE_ERR_STATUS_HI__ECC_MASK                                                                    0x00000001L
+#define GC_CANE_UE_ERR_STATUS_HI__PARITY_MASK                                                                 0x00000002L
+#define GC_CANE_UE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                    0x00000004L
+#define GC_CANE_UE_ERR_STATUS_HI__ERR_INFO_MASK                                                               0x007FFFF8L
+#define GC_CANE_UE_ERR_STATUS_HI__UE_CNT_MASK                                                                 0x03800000L
+#define GC_CANE_UE_ERR_STATUS_HI__FED_CNT_MASK                                                                0x1C000000L
+//GC_CANE_CE_ERR_STATUS_LO
+#define GC_CANE_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG__SHIFT                                                0x0
+#define GC_CANE_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG__SHIFT                                                   0x1
+#define GC_CANE_CE_ERR_STATUS_LO__ADDRESS__SHIFT                                                              0x2
+#define GC_CANE_CE_ERR_STATUS_LO__MEMORY_ID__SHIFT                                                            0x18
+#define GC_CANE_CE_ERR_STATUS_LO__ERR_STATUS_VALID_FLAG_MASK                                                  0x00000001L
+#define GC_CANE_CE_ERR_STATUS_LO__ADDRESS_VALID_FLAG_MASK                                                     0x00000002L
+#define GC_CANE_CE_ERR_STATUS_LO__ADDRESS_MASK                                                                0x00FFFFFCL
+#define GC_CANE_CE_ERR_STATUS_LO__MEMORY_ID_MASK                                                              0xFF000000L
+//GC_CANE_CE_ERR_STATUS_HI
+#define GC_CANE_CE_ERR_STATUS_HI__ECC__SHIFT                                                                  0x0
+#define GC_CANE_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG__SHIFT                                                  0x2
+#define GC_CANE_CE_ERR_STATUS_HI__ERR_INFO__SHIFT                                                             0x3
+#define GC_CANE_CE_ERR_STATUS_HI__CE_CNT__SHIFT                                                               0x17
+#define GC_CANE_CE_ERR_STATUS_HI__POISON__SHIFT                                                               0x1a
+#define GC_CANE_CE_ERR_STATUS_HI__ECC_MASK                                                                    0x00000001L
+#define GC_CANE_CE_ERR_STATUS_HI__ERR_INFO_VALID_FLAG_MASK                                                    0x00000004L
+#define GC_CANE_CE_ERR_STATUS_HI__ERR_INFO_MASK                                                               0x007FFFF8L
+#define GC_CANE_CE_ERR_STATUS_HI__CE_CNT_MASK                                                                 0x03800000L
+#define GC_CANE_CE_ERR_STATUS_HI__POISON_MASK                                                                 0x04000000L
 
 // addressBlock: xcd0_gc_perfddec
 //CPG_PERFCOUNTER1_LO
@@ -26471,6 +27535,30 @@
 //RLC_CPG_STAT_INVAL
 #define RLC_CPG_STAT_INVAL__CPG_stat_inval__SHIFT                                                             0x0
 #define RLC_CPG_STAT_INVAL__CPG_stat_inval_MASK                                                               0x00000001L
+//RLC_UE_ERR_STATUS_LOW
+#define RLC_UE_ERR_STATUS_LOW__ERR_STATUS_VALID_FLAG__SHIFT                                                   0x0
+#define RLC_UE_ERR_STATUS_LOW__ADDRESS_VALID_FLAG__SHIFT                                                      0x1
+#define RLC_UE_ERR_STATUS_LOW__ADDRESS__SHIFT                                                                 0x2
+#define RLC_UE_ERR_STATUS_LOW__MEMORY_ID__SHIFT                                                               0x18
+#define RLC_UE_ERR_STATUS_LOW__ERR_STATUS_VALID_FLAG_MASK                                                     0x00000001L
+#define RLC_UE_ERR_STATUS_LOW__ADDRESS_VALID_FLAG_MASK                                                        0x00000002L
+#define RLC_UE_ERR_STATUS_LOW__ADDRESS_MASK                                                                   0x00FFFFFCL
+#define RLC_UE_ERR_STATUS_LOW__MEMORY_ID_MASK                                                                 0xFF000000L
+//RLC_UE_ERR_STATUS_HIGH
+#define RLC_UE_ERR_STATUS_HIGH__ECC__SHIFT                                                                    0x0
+#define RLC_UE_ERR_STATUS_HIGH__PARITY__SHIFT                                                                 0x1
+#define RLC_UE_ERR_STATUS_HIGH__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define RLC_UE_ERR_STATUS_HIGH__ERR_INFO__SHIFT                                                               0x3
+#define RLC_UE_ERR_STATUS_HIGH__UE_CNT__SHIFT                                                                 0x17
+#define RLC_UE_ERR_STATUS_HIGH__FED_CNT__SHIFT                                                                0x1a
+#define RLC_UE_ERR_STATUS_HIGH__RESERVED__SHIFT                                                               0x1d
+#define RLC_UE_ERR_STATUS_HIGH__ECC_MASK                                                                      0x00000001L
+#define RLC_UE_ERR_STATUS_HIGH__PARITY_MASK                                                                   0x00000002L
+#define RLC_UE_ERR_STATUS_HIGH__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define RLC_UE_ERR_STATUS_HIGH__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define RLC_UE_ERR_STATUS_HIGH__UE_CNT_MASK                                                                   0x03800000L
+#define RLC_UE_ERR_STATUS_HIGH__FED_CNT_MASK                                                                  0x1C000000L
+#define RLC_UE_ERR_STATUS_HIGH__RESERVED_MASK                                                                 0xE0000000L
 //RLC_DSM_CNTL
 #define RLC_DSM_CNTL__RLCG_INSTR_RAM_IRRITATOR_DATA_SEL__SHIFT                                                0x0
 #define RLC_DSM_CNTL__RLCG_INSTR_RAM_IRRITATOR_SINGLE_WRITE__SHIFT                                            0x2
@@ -26573,6 +27661,30 @@
 #define RLC_DSM_CNTL2A__RLC_SPM_SE2_SCRATCH_RAM_SELECT_INJECT_DELAY_MASK                                      0x00000100L
 #define RLC_DSM_CNTL2A__RLC_SPM_SE3_SCRATCH_RAM_ENABLE_ERROR_INJECT_MASK                                      0x00000600L
 #define RLC_DSM_CNTL2A__RLC_SPM_SE3_SCRATCH_RAM_SELECT_INJECT_DELAY_MASK                                      0x00000800L
+//RLC_CE_ERR_STATUS_LOW
+#define RLC_CE_ERR_STATUS_LOW__ERR_STATUS_VALID_FLAG__SHIFT                                                   0x0
+#define RLC_CE_ERR_STATUS_LOW__ADDRESS_VALID_FLAG__SHIFT                                                      0x1
+#define RLC_CE_ERR_STATUS_LOW__ADDRESS__SHIFT                                                                 0x2
+#define RLC_CE_ERR_STATUS_LOW__MEMORY_ID__SHIFT                                                               0x18
+#define RLC_CE_ERR_STATUS_LOW__ERR_STATUS_VALID_FLAG_MASK                                                     0x00000001L
+#define RLC_CE_ERR_STATUS_LOW__ADDRESS_VALID_FLAG_MASK                                                        0x00000002L
+#define RLC_CE_ERR_STATUS_LOW__ADDRESS_MASK                                                                   0x00FFFFFCL
+#define RLC_CE_ERR_STATUS_LOW__MEMORY_ID_MASK                                                                 0xFF000000L
+//RLC_CE_ERR_STATUS_HIGH
+#define RLC_CE_ERR_STATUS_HIGH__ECC__SHIFT                                                                    0x0
+#define RLC_CE_ERR_STATUS_HIGH__OTHER__SHIFT                                                                  0x1
+#define RLC_CE_ERR_STATUS_HIGH__ERR_INFO_VALID_FLAG__SHIFT                                                    0x2
+#define RLC_CE_ERR_STATUS_HIGH__ERR_INFO__SHIFT                                                               0x3
+#define RLC_CE_ERR_STATUS_HIGH__CE_CNT__SHIFT                                                                 0x17
+#define RLC_CE_ERR_STATUS_HIGH__POISON__SHIFT                                                                 0x1a
+#define RLC_CE_ERR_STATUS_HIGH__RESERVED__SHIFT                                                               0x1b
+#define RLC_CE_ERR_STATUS_HIGH__ECC_MASK                                                                      0x00000001L
+#define RLC_CE_ERR_STATUS_HIGH__OTHER_MASK                                                                    0x00000002L
+#define RLC_CE_ERR_STATUS_HIGH__ERR_INFO_VALID_FLAG_MASK                                                      0x00000004L
+#define RLC_CE_ERR_STATUS_HIGH__ERR_INFO_MASK                                                                 0x007FFFF8L
+#define RLC_CE_ERR_STATUS_HIGH__CE_CNT_MASK                                                                   0x03800000L
+#define RLC_CE_ERR_STATUS_HIGH__POISON_MASK                                                                   0x04000000L
+#define RLC_CE_ERR_STATUS_HIGH__RESERVED_MASK                                                                 0xF8000000L
 //RLC_RLCV_SPARE_INT
 #define RLC_RLCV_SPARE_INT__INTERRUPT__SHIFT                                                                  0x0
 #define RLC_RLCV_SPARE_INT__RESERVED__SHIFT                                                                   0x1
-- 
2.40.1


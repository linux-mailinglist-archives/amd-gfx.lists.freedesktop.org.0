Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF2141B3C
	for <lists+amd-gfx@lfdr.de>; Sun, 19 Jan 2020 03:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230C06E1B9;
	Sun, 19 Jan 2020 02:46:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5636E1B9
 for <amd-gfx@lists.freedesktop.org>; Sun, 19 Jan 2020 02:46:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwvp+UucAPoEYzKqZxsO7rS47oVbgAhh/iXPV9YSAOL34kSwSHj+PyONfA+VDfYVwyOPekfCgHGNcZjan52x/JDZH/2xnMYNqwSbreY9k8KMpx3U+wqkY6sxo5kxjGfySJ6pxmqKOWPSibHadtx6/llS+HXdrtAy1MuD5HVWPzWps/wSERvweQlBVTfnC3N20r+B77PmXU8+HhsSveVPxOJ77xowjuN+QyQ1GmngQXf3YRMA7AmO5w/2DuF3C0Epp6xy9MWts2bTn+vk0lx9P7Sx5U7R470IHNpPI3ieUihq3LESaJg7vbtpO5OwokxwNryVWPcdEp/oFW5ZYFfqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR547HO/QRMcYZbg6DGTZL8ddj6L98EKr/aGWCHonTA=;
 b=BMtlDyJsARKA+JryeFY3FGBlDR9vzE36tr6G3xns0mJ84zszsJ3HgTelcMWpZBEr2P+4ZYgnH87u8kK6JLeWk62aQPOzbEOIzw9lsyRpgf/IfLGF61hI39KZFDRgVpAv/PnB1PZQTe7vZFCtI3qp5+un92y390XtLtyQNFsz5cJp2xvFBaAWsExHXNrmd78q6vI0U4Won3FnLTqTfQsvUVrj4AzO/HYiOi5Qu6OVHyRVLV/yhP8xJwzX7oy252NRs2SZZ8lVJ9c1+SmtfVfXd9e1M722ooRXeYTwLLxILx36sCo8lnVp2GeEM+L76qh5ukiKmg1s4evdKMR5dTEa5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR547HO/QRMcYZbg6DGTZL8ddj6L98EKr/aGWCHonTA=;
 b=F4jzL6QB4GZJiDu2CcyCj0lIJ+BW+d5bMEJ1+QdMwNzT5V+OcqprHgPAyPPt0bWjC0IAzPevJsHYgxT4sIe/BGsUsM+R+Dg3jxsGd3DgJBmEQ3sJIOwp4a68+eMhLokSfWOjEqtiGddRo3hMRLgaUMwqnFUnlaLPrx3Rd+us/AU=
Received: from CY4PR12CA0046.namprd12.prod.outlook.com (2603:10b6:903:129::32)
 by MWHPR1201MB0142.namprd12.prod.outlook.com (2603:10b6:301:55::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18; Sun, 19 Jan
 2020 02:46:21 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::204) by CY4PR12CA0046.outlook.office365.com
 (2603:10b6:903:129::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend
 Transport; Sun, 19 Jan 2020 02:46:21 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Sun, 19 Jan 2020 02:46:20 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 18 Jan
 2020 20:46:20 -0600
Received: from yajunl-gv.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 18 Jan 2020 20:46:17 -0600
From: Dennis Li <Dennis.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Alexander.Deucher@amd.com>,
 <Tao.Zhou1@amd.com>, <Hawking.Zhang@amd.com>, <Guchun.Chen@amd.com>
Subject: [PATCH 3/4] drm/amdgpu: add EDC counter registers of gc for Arcturus
Date: Sun, 19 Jan 2020 10:46:01 +0800
Message-ID: <20200119024602.23079-4-Dennis.Li@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119024602.23079-1-Dennis.Li@amd.com>
References: <20200119024602.23079-1-Dennis.Li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(428003)(189003)(199004)(186003)(4326008)(2616005)(336012)(426003)(8936002)(26005)(6636002)(81166006)(478600001)(8676002)(2906002)(81156014)(36756003)(70586007)(70206006)(1076003)(316002)(110136005)(7696005)(30864003)(86362001)(5660300002)(356004)(6666004)(2101003)(579004)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0142; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3247ee17-b948-40b0-0b31-08d79c89c40d
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0142:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0142592D87B513A7BA9860BCED330@MWHPR1201MB0142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0287BBA78D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4PgvSrGqZ+9VkHHMGhxPkQPsEePXIPZN1zArs2udQo6zw99CqgSVag7zfrzWWij0enqjyeUcu5iLZgGhSJFwPyDYFOPaUQ0OAD6ZzoIMSsG66asisRO/SPC5hSzK4TJ6X2YbH2kMUIPtLLCJekTa+i/i02zvU8YkWjdZ7yeBvtfdGzjr5dPXlu5t280qxySZuM3q3jmQOd51n3Z9y4lgJYhxD8J5WqWrEHrZyN2fdlOCYSlreTqo24ub2GDzkSw5s6WIgdM1uBSmotU0hUIJukTk6JSbNZaW8Br8hSdWVjBbIwebepSDOf2Rq1Rk4vhQNLLT4/frnq3MoIAkmdbh+yaBO+3gGrMQ/kfF3nF5T+7ix7jhkLOEfSHVBgiSlVFS2I45y2VwTyalZXoZh/tGUk2DUlEjAukdklHvwL7ymYpgFH2Gt3dubhRfN4CsICFLunRoMJMwBEW1859yI0MxaZtYqjH8OlBfpfgmZqQ+A3J00FZP4ouv2Z0/48/arLAx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2020 02:46:20.9425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3247ee17-b948-40b0-0b31-08d79c89c40d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0142
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
Cc: Dennis Li <Dennis.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

add reg headers to gc includes

v2: remove unused registers and fields in this patch set

Change-Id: If3476c0b0ed88e5d11bdb8bec1278ae10fc5af25
Signed-off-by: Dennis Li <Dennis.Li@amd.com>
---
 .../amd/include/asic_reg/gc/gc_9_4_1_offset.h | 264 +++++++
 .../include/asic_reg/gc/gc_9_4_1_sh_mask.h    | 748 ++++++++++++++++++
 2 files changed, 1012 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h

diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_offset.h
new file mode 100644
index 000000000000..f41556abfbbc
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_offset.h
@@ -0,0 +1,264 @@
+/*
+ * Copyright (C) 2020  Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included
+ * in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
+ * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+#ifndef _gc_9_4_1_OFFSET_HEADER
+#define _gc_9_4_1_OFFSET_HEADER
+
+// addressBlock: gc_grbmdec
+// base address: 0x8000
+#define mmGRBM_CNTL                                                                                    0x0000
+#define mmGRBM_CNTL_BASE_IDX                                                                           0
+#define mmGRBM_SKEW_CNTL                                                                               0x0001
+#define mmGRBM_SKEW_CNTL_BASE_IDX                                                                      0
+#define mmGRBM_STATUS2                                                                                 0x0002
+#define mmGRBM_STATUS2_BASE_IDX                                                                        0
+#define mmGRBM_PWR_CNTL                                                                                0x0003
+#define mmGRBM_PWR_CNTL_BASE_IDX                                                                       0
+#define mmGRBM_STATUS                                                                                  0x0004
+#define mmGRBM_STATUS_BASE_IDX                                                                         0
+#define mmGRBM_STATUS_SE0                                                                              0x0005
+#define mmGRBM_STATUS_SE0_BASE_IDX                                                                     0
+#define mmGRBM_STATUS_SE1                                                                              0x0006
+#define mmGRBM_STATUS_SE1_BASE_IDX                                                                     0
+#define mmGRBM_SOFT_RESET                                                                              0x0008
+#define mmGRBM_SOFT_RESET_BASE_IDX                                                                     0
+#define mmGRBM_GFX_CLKEN_CNTL                                                                          0x000c
+#define mmGRBM_GFX_CLKEN_CNTL_BASE_IDX                                                                 0
+#define mmGRBM_WAIT_IDLE_CLOCKS                                                                        0x000d
+#define mmGRBM_WAIT_IDLE_CLOCKS_BASE_IDX                                                               0
+#define mmGRBM_STATUS_SE2                                                                              0x000e
+#define mmGRBM_STATUS_SE2_BASE_IDX                                                                     0
+#define mmGRBM_STATUS_SE3                                                                              0x000f
+#define mmGRBM_STATUS_SE3_BASE_IDX                                                                     0
+#define mmGRBM_READ_ERROR                                                                              0x0016
+#define mmGRBM_READ_ERROR_BASE_IDX                                                                     0
+#define mmGRBM_READ_ERROR2                                                                             0x0017
+#define mmGRBM_READ_ERROR2_BASE_IDX                                                                    0
+#define mmGRBM_INT_CNTL                                                                                0x0018
+#define mmGRBM_INT_CNTL_BASE_IDX                                                                       0
+#define mmGRBM_TRAP_OP                                                                                 0x0019
+#define mmGRBM_TRAP_OP_BASE_IDX                                                                        0
+#define mmGRBM_TRAP_ADDR                                                                               0x001a
+#define mmGRBM_TRAP_ADDR_BASE_IDX                                                                      0
+#define mmGRBM_TRAP_ADDR_MSK                                                                           0x001b
+#define mmGRBM_TRAP_ADDR_MSK_BASE_IDX                                                                  0
+#define mmGRBM_TRAP_WD                                                                                 0x001c
+#define mmGRBM_TRAP_WD_BASE_IDX                                                                        0
+#define mmGRBM_TRAP_WD_MSK                                                                             0x001d
+#define mmGRBM_TRAP_WD_MSK_BASE_IDX                                                                    0
+#define mmGRBM_DSM_BYPASS                                                                              0x001e
+#define mmGRBM_DSM_BYPASS_BASE_IDX                                                                     0
+#define mmGRBM_WRITE_ERROR                                                                             0x001f
+#define mmGRBM_WRITE_ERROR_BASE_IDX                                                                    0
+#define mmGRBM_IOV_ERROR                                                                               0x0020
+#define mmGRBM_IOV_ERROR_BASE_IDX                                                                      0
+#define mmGRBM_CHIP_REVISION                                                                           0x0021
+#define mmGRBM_CHIP_REVISION_BASE_IDX                                                                  0
+#define mmGRBM_GFX_CNTL                                                                                0x0022
+#define mmGRBM_GFX_CNTL_BASE_IDX                                                                       0
+#define mmGRBM_RSMU_CFG                                                                                0x0023
+#define mmGRBM_RSMU_CFG_BASE_IDX                                                                       0
+#define mmGRBM_IH_CREDIT                                                                               0x0024
+#define mmGRBM_IH_CREDIT_BASE_IDX                                                                      0
+#define mmGRBM_PWR_CNTL2                                                                               0x0025
+#define mmGRBM_PWR_CNTL2_BASE_IDX                                                                      0
+#define mmGRBM_UTCL2_INVAL_RANGE_START                                                                 0x0026
+#define mmGRBM_UTCL2_INVAL_RANGE_START_BASE_IDX                                                        0
+#define mmGRBM_UTCL2_INVAL_RANGE_END                                                                   0x0027
+#define mmGRBM_UTCL2_INVAL_RANGE_END_BASE_IDX                                                          0
+#define mmGRBM_RSMU_READ_ERROR                                                                         0x0028
+#define mmGRBM_RSMU_READ_ERROR_BASE_IDX                                                                0
+#define mmGRBM_CHICKEN_BITS                                                                            0x0029
+#define mmGRBM_CHICKEN_BITS_BASE_IDX                                                                   0
+#define mmGRBM_FENCE_RANGE0                                                                            0x002a
+#define mmGRBM_FENCE_RANGE0_BASE_IDX                                                                   0
+#define mmGRBM_FENCE_RANGE1                                                                            0x002b
+#define mmGRBM_FENCE_RANGE1_BASE_IDX                                                                   0
+#define mmGRBM_NOWHERE                                                                                 0x003f
+#define mmGRBM_NOWHERE_BASE_IDX                                                                        0
+#define mmGRBM_SCRATCH_REG0                                                                            0x0040
+#define mmGRBM_SCRATCH_REG0_BASE_IDX                                                                   0
+#define mmGRBM_SCRATCH_REG1                                                                            0x0041
+#define mmGRBM_SCRATCH_REG1_BASE_IDX                                                                   0
+#define mmGRBM_SCRATCH_REG2                                                                            0x0042
+#define mmGRBM_SCRATCH_REG2_BASE_IDX                                                                   0
+#define mmGRBM_SCRATCH_REG3                                                                            0x0043
+#define mmGRBM_SCRATCH_REG3_BASE_IDX                                                                   0
+#define mmGRBM_SCRATCH_REG4                                                                            0x0044
+#define mmGRBM_SCRATCH_REG4_BASE_IDX                                                                   0
+#define mmGRBM_SCRATCH_REG5                                                                            0x0045
+#define mmGRBM_SCRATCH_REG5_BASE_IDX                                                                   0
+#define mmGRBM_SCRATCH_REG6                                                                            0x0046
+#define mmGRBM_SCRATCH_REG6_BASE_IDX                                                                   0
+#define mmGRBM_SCRATCH_REG7                                                                            0x0047
+#define mmGRBM_SCRATCH_REG7_BASE_IDX                                                                   0
+
+// addressBlock: gc_cppdec2
+// base address: 0xc600
+#define mmCPF_EDC_TAG_CNT                                                                              0x1189
+#define mmCPF_EDC_TAG_CNT_BASE_IDX                                                                     0
+#define mmCPF_EDC_ROQ_CNT                                                                              0x118a
+#define mmCPF_EDC_ROQ_CNT_BASE_IDX                                                                     0
+#define mmCPG_EDC_TAG_CNT                                                                              0x118b
+#define mmCPG_EDC_TAG_CNT_BASE_IDX                                                                     0
+#define mmCPG_EDC_DMA_CNT                                                                              0x118d
+#define mmCPG_EDC_DMA_CNT_BASE_IDX                                                                     0
+#define mmCPC_EDC_SCRATCH_CNT                                                                          0x118e
+#define mmCPC_EDC_SCRATCH_CNT_BASE_IDX                                                                 0
+#define mmCPC_EDC_UCODE_CNT                                                                            0x118f
+#define mmCPC_EDC_UCODE_CNT_BASE_IDX                                                                   0
+#define mmDC_EDC_STATE_CNT                                                                             0x1191
+#define mmDC_EDC_STATE_CNT_BASE_IDX                                                                    0
+#define mmDC_EDC_CSINVOC_CNT                                                                           0x1192
+#define mmDC_EDC_CSINVOC_CNT_BASE_IDX                                                                  0
+#define mmDC_EDC_RESTORE_CNT                                                                           0x1193
+#define mmDC_EDC_RESTORE_CNT_BASE_IDX                                                                  0
+
+// addressBlock: gc_gdsdec
+// base address: 0x9700
+#define mmGDS_EDC_CNT                                                                                  0x05c5
+#define mmGDS_EDC_CNT_BASE_IDX                                                                         0
+#define mmGDS_EDC_GRBM_CNT                                                                             0x05c6
+#define mmGDS_EDC_GRBM_CNT_BASE_IDX                                                                    0
+#define mmGDS_EDC_OA_DED                                                                               0x05c7
+#define mmGDS_EDC_OA_DED_BASE_IDX                                                                      0
+#define mmGDS_EDC_OA_PHY_CNT                                                                           0x05cb
+#define mmGDS_EDC_OA_PHY_CNT_BASE_IDX                                                                  0
+#define mmGDS_EDC_OA_PIPE_CNT                                                                          0x05cc
+#define mmGDS_EDC_OA_PIPE_CNT_BASE_IDX                                                                 0
+
+// addressBlock: gc_shsdec
+// base address: 0x9000
+#define mmSPI_EDC_CNT                                                                                  0x0445
+#define mmSPI_EDC_CNT_BASE_IDX                                                                         0
+
+// addressBlock: gc_sqdec
+// base address: 0x8c00
+#define mmSQC_EDC_CNT2                                                                                 0x032c
+#define mmSQC_EDC_CNT2_BASE_IDX                                                                        0
+#define mmSQC_EDC_CNT3                                                                                 0x032d
+#define mmSQC_EDC_CNT3_BASE_IDX                                                                        0
+#define mmSQC_EDC_PARITY_CNT3                                                                          0x032e
+#define mmSQC_EDC_PARITY_CNT3_BASE_IDX                                                                 0
+#define mmSQC_EDC_CNT                                                                                  0x03a2
+#define mmSQC_EDC_CNT_BASE_IDX                                                                         0
+#define mmSQ_EDC_SEC_CNT                                                                               0x03a3
+#define mmSQ_EDC_SEC_CNT_BASE_IDX                                                                      0
+#define mmSQ_EDC_DED_CNT                                                                               0x03a4
+#define mmSQ_EDC_DED_CNT_BASE_IDX                                                                      0
+#define mmSQ_EDC_INFO                                                                                  0x03a5
+#define mmSQ_EDC_INFO_BASE_IDX                                                                         0
+#define mmSQ_EDC_CNT                                                                                   0x03a6
+#define mmSQ_EDC_CNT_BASE_IDX                                                                          0
+
+// addressBlock: gc_tpdec
+// base address: 0x9400
+#define mmTA_EDC_CNT                                                                                   0x0586
+#define mmTA_EDC_CNT_BASE_IDX                                                                          0
+
+// addressBlock: gc_tcdec
+// base address: 0xac00
+#define mmTCP_EDC_CNT                                                                                  0x0b17
+#define mmTCP_EDC_CNT_BASE_IDX                                                                         0
+#define mmTCP_EDC_CNT_NEW                                                                              0x0b18
+#define mmTCP_EDC_CNT_NEW_BASE_IDX                                                                     0
+#define mmTCP_ATC_EDC_GATCL1_CNT                                                                       0x12b1
+#define mmTCP_ATC_EDC_GATCL1_CNT_BASE_IDX                                                              0
+#define mmTCI_EDC_CNT                                                                                  0x0b60
+#define mmTCI_EDC_CNT_BASE_IDX                                                                         0
+#define mmTCC_EDC_CNT                                                                                  0x0b82
+#define mmTCC_EDC_CNT_BASE_IDX                                                                         0
+#define mmTCC_EDC_CNT2                                                                                 0x0b83
+#define mmTCC_EDC_CNT2_BASE_IDX                                                                        0
+#define mmTCA_EDC_CNT                                                                                  0x0bc5
+#define mmTCA_EDC_CNT_BASE_IDX                                                                         0
+
+// addressBlock: gc_tpdec
+// base address: 0x9400
+#define mmTD_EDC_CNT                                                                                   0x052e
+#define mmTD_EDC_CNT_BASE_IDX                                                                          0
+#define mmTA_EDC_CNT                                                                                   0x0586
+#define mmTA_EDC_CNT_BASE_IDX                                                                          0
+
+// addressBlock: gc_ea_gceadec2
+// base address: 0x9c00
+#define mmGCEA_EDC_CNT                                                                                 0x0706
+#define mmGCEA_EDC_CNT_BASE_IDX                                                                        0
+#define mmGCEA_EDC_CNT2                                                                                0x0707
+#define mmGCEA_EDC_CNT2_BASE_IDX                                                                       0
+#define mmGCEA_EDC_CNT3                                                                                0x071b
+#define mmGCEA_EDC_CNT3_BASE_IDX                                                                       0
+
+// addressBlock: gc_gfxudec
+// base address: 0x30000
+#define mmSCRATCH_REG0                                                                                 0x2040
+#define mmSCRATCH_REG0_BASE_IDX                                                                        1
+#define mmSCRATCH_REG1                                                                                 0x2041
+#define mmSCRATCH_REG1_BASE_IDX                                                                        1
+#define mmSCRATCH_REG2                                                                                 0x2042
+#define mmSCRATCH_REG2_BASE_IDX                                                                        1
+#define mmSCRATCH_REG3                                                                                 0x2043
+#define mmSCRATCH_REG3_BASE_IDX                                                                        1
+#define mmSCRATCH_REG4                                                                                 0x2044
+#define mmSCRATCH_REG4_BASE_IDX                                                                        1
+#define mmSCRATCH_REG5                                                                                 0x2045
+#define mmSCRATCH_REG5_BASE_IDX                                                                        1
+#define mmSCRATCH_REG6                                                                                 0x2046
+#define mmSCRATCH_REG6_BASE_IDX                                                                        1
+#define mmSCRATCH_REG7                                                                                 0x2047
+#define mmSCRATCH_REG7_BASE_IDX                                                                        1
+#define mmGRBM_GFX_INDEX                                                                               0x2200
+#define mmGRBM_GFX_INDEX_BASE_IDX                                                                      1
+
+// addressBlock: gc_utcl2_atcl2dec
+// base address: 0xa000
+#define mmATC_L2_CACHE_4K_DSM_INDEX                                                                    0x080e
+#define mmATC_L2_CACHE_4K_DSM_INDEX_BASE_IDX                                                           0
+#define mmATC_L2_CACHE_2M_DSM_INDEX                                                                    0x080f
+#define mmATC_L2_CACHE_2M_DSM_INDEX_BASE_IDX                                                           0
+#define mmATC_L2_CACHE_4K_DSM_CNTL                                                                     0x0810
+#define mmATC_L2_CACHE_4K_DSM_CNTL_BASE_IDX                                                            0
+#define mmATC_L2_CACHE_2M_DSM_CNTL                                                                     0x0811
+#define mmATC_L2_CACHE_2M_DSM_CNTL_BASE_IDX                                                            0
+
+// addressBlock: gc_utcl2_vml2pfdec
+// base address: 0xa100
+#define mmVML2_MEM_ECC_INDEX                                                                           0x0860
+#define mmVML2_MEM_ECC_INDEX_BASE_IDX                                                                  0
+#define mmVML2_WALKER_MEM_ECC_INDEX                                                                    0x0861
+#define mmVML2_WALKER_MEM_ECC_INDEX_BASE_IDX                                                           0
+#define mmUTCL2_MEM_ECC_INDEX                                                                          0x0862
+#define mmUTCL2_MEM_ECC_INDEX_BASE_IDX                                                                 0
+
+#define mmVML2_MEM_ECC_CNTL                                                                            0x0863
+#define mmVML2_MEM_ECC_CNTL_BASE_IDX                                                                   0
+#define mmVML2_WALKER_MEM_ECC_CNTL                                                                     0x0864
+#define mmVML2_WALKER_MEM_ECC_CNTL_BASE_IDX                                                            0
+#define mmUTCL2_MEM_ECC_CNTL                                                                           0x0865
+#define mmUTCL2_MEM_ECC_CNTL_BASE_IDX                                                                  0
+
+// addressBlock: gc_rlcpdec
+// base address: 0x3b000
+#define mmRLC_EDC_CNT                                                                                  0x4d40
+#define mmRLC_EDC_CNT_BASE_IDX                                                                         1
+#define mmRLC_EDC_CNT2                                                                                 0x4d41
+#define mmRLC_EDC_CNT2_BASE_IDX                                                                        1
+
+#endif
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h
new file mode 100644
index 000000000000..f26246a600c6
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h
@@ -0,0 +1,748 @@
+/*
+ * Copyright (C) 2020  Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included
+ * in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
+ * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+#ifndef _gc_9_4_1_SH_MASK_HEADER
+#define _gc_9_4_1_SH_MASK_HEADER
+
+// addressBlock: gc_cppdec2
+//CPF_EDC_TAG_CNT
+#define CPF_EDC_TAG_CNT__DED_COUNT__SHIFT                                                                     0x0
+#define CPF_EDC_TAG_CNT__SEC_COUNT__SHIFT                                                                     0x2
+#define CPF_EDC_TAG_CNT__DED_COUNT_MASK                                                                       0x00000003L
+#define CPF_EDC_TAG_CNT__SEC_COUNT_MASK                                                                       0x0000000CL
+//CPF_EDC_ROQ_CNT
+#define CPF_EDC_ROQ_CNT__DED_COUNT_ME1__SHIFT                                                                 0x0
+#define CPF_EDC_ROQ_CNT__SEC_COUNT_ME1__SHIFT                                                                 0x2
+#define CPF_EDC_ROQ_CNT__DED_COUNT_ME2__SHIFT                                                                 0x4
+#define CPF_EDC_ROQ_CNT__SEC_COUNT_ME2__SHIFT                                                                 0x6
+#define CPF_EDC_ROQ_CNT__DED_COUNT_ME1_MASK                                                                   0x00000003L
+#define CPF_EDC_ROQ_CNT__SEC_COUNT_ME1_MASK                                                                   0x0000000CL
+#define CPF_EDC_ROQ_CNT__DED_COUNT_ME2_MASK                                                                   0x00000030L
+#define CPF_EDC_ROQ_CNT__SEC_COUNT_ME2_MASK                                                                   0x000000C0L
+//CPG_EDC_TAG_CNT
+#define CPG_EDC_TAG_CNT__DED_COUNT__SHIFT                                                                     0x0
+#define CPG_EDC_TAG_CNT__SEC_COUNT__SHIFT                                                                     0x2
+#define CPG_EDC_TAG_CNT__DED_COUNT_MASK                                                                       0x00000003L
+#define CPG_EDC_TAG_CNT__SEC_COUNT_MASK                                                                       0x0000000CL
+//CPG_EDC_DMA_CNT
+#define CPG_EDC_DMA_CNT__ROQ_DED_COUNT__SHIFT                                                                 0x0
+#define CPG_EDC_DMA_CNT__ROQ_SEC_COUNT__SHIFT                                                                 0x2
+#define CPG_EDC_DMA_CNT__TAG_DED_COUNT__SHIFT                                                                 0x4
+#define CPG_EDC_DMA_CNT__TAG_SEC_COUNT__SHIFT                                                                 0x6
+#define CPG_EDC_DMA_CNT__ROQ_DED_COUNT_MASK                                                                   0x00000003L
+#define CPG_EDC_DMA_CNT__ROQ_SEC_COUNT_MASK                                                                   0x0000000CL
+#define CPG_EDC_DMA_CNT__TAG_DED_COUNT_MASK                                                                   0x00000030L
+#define CPG_EDC_DMA_CNT__TAG_SEC_COUNT_MASK                                                                   0x000000C0L
+//CPC_EDC_SCRATCH_CNT
+#define CPC_EDC_SCRATCH_CNT__DED_COUNT__SHIFT                                                                 0x0
+#define CPC_EDC_SCRATCH_CNT__SEC_COUNT__SHIFT                                                                 0x2
+#define CPC_EDC_SCRATCH_CNT__DED_COUNT_MASK                                                                   0x00000003L
+#define CPC_EDC_SCRATCH_CNT__SEC_COUNT_MASK                                                                   0x0000000CL
+//CPC_EDC_UCODE_CNT
+#define CPC_EDC_UCODE_CNT__DED_COUNT__SHIFT                                                                   0x0
+#define CPC_EDC_UCODE_CNT__SEC_COUNT__SHIFT                                                                   0x2
+#define CPC_EDC_UCODE_CNT__DED_COUNT_MASK                                                                     0x00000003L
+#define CPC_EDC_UCODE_CNT__SEC_COUNT_MASK                                                                     0x0000000CL
+//DC_EDC_STATE_CNT
+#define DC_EDC_STATE_CNT__DED_COUNT_ME1__SHIFT                                                                0x0
+#define DC_EDC_STATE_CNT__SEC_COUNT_ME1__SHIFT                                                                0x2
+#define DC_EDC_STATE_CNT__DED_COUNT_ME1_MASK                                                                  0x00000003L
+#define DC_EDC_STATE_CNT__SEC_COUNT_ME1_MASK                                                                  0x0000000CL
+//DC_EDC_CSINVOC_CNT
+#define DC_EDC_CSINVOC_CNT__DED_COUNT_ME1__SHIFT                                                              0x0
+#define DC_EDC_CSINVOC_CNT__SEC_COUNT_ME1__SHIFT                                                              0x2
+#define DC_EDC_CSINVOC_CNT__DED_COUNT1_ME1__SHIFT                                                             0x4
+#define DC_EDC_CSINVOC_CNT__SEC_COUNT1_ME1__SHIFT                                                             0x6
+#define DC_EDC_CSINVOC_CNT__DED_COUNT_ME1_MASK                                                                0x00000003L
+#define DC_EDC_CSINVOC_CNT__SEC_COUNT_ME1_MASK                                                                0x0000000CL
+#define DC_EDC_CSINVOC_CNT__DED_COUNT1_ME1_MASK                                                               0x00000030L
+#define DC_EDC_CSINVOC_CNT__SEC_COUNT1_ME1_MASK                                                               0x000000C0L
+//DC_EDC_RESTORE_CNT
+#define DC_EDC_RESTORE_CNT__DED_COUNT_ME1__SHIFT                                                              0x0
+#define DC_EDC_RESTORE_CNT__SEC_COUNT_ME1__SHIFT                                                              0x2
+#define DC_EDC_RESTORE_CNT__DED_COUNT1_ME1__SHIFT                                                             0x4
+#define DC_EDC_RESTORE_CNT__SEC_COUNT1_ME1__SHIFT                                                             0x6
+#define DC_EDC_RESTORE_CNT__DED_COUNT_ME1_MASK                                                                0x00000003L
+#define DC_EDC_RESTORE_CNT__SEC_COUNT_ME1_MASK                                                                0x0000000CL
+#define DC_EDC_RESTORE_CNT__DED_COUNT1_ME1_MASK                                                               0x00000030L
+#define DC_EDC_RESTORE_CNT__SEC_COUNT1_ME1_MASK                                                               0x000000C0L
+
+// addressBlock: gc_gdsdec
+//GDS_EDC_CNT
+#define GDS_EDC_CNT__GDS_MEM_DED__SHIFT                                                                       0x0
+#define GDS_EDC_CNT__GDS_MEM_SEC__SHIFT                                                                       0x4
+#define GDS_EDC_CNT__UNUSED__SHIFT                                                                            0x6
+#define GDS_EDC_CNT__GDS_MEM_DED_MASK                                                                         0x00000003L
+#define GDS_EDC_CNT__GDS_MEM_SEC_MASK                                                                         0x00000030L
+#define GDS_EDC_CNT__UNUSED_MASK                                                                              0xFFFFFFC0L
+//GDS_EDC_GRBM_CNT
+#define GDS_EDC_GRBM_CNT__DED__SHIFT                                                                          0x0
+#define GDS_EDC_GRBM_CNT__SEC__SHIFT                                                                          0x2
+#define GDS_EDC_GRBM_CNT__UNUSED__SHIFT                                                                       0x4
+#define GDS_EDC_GRBM_CNT__DED_MASK                                                                            0x00000003L
+#define GDS_EDC_GRBM_CNT__SEC_MASK                                                                            0x0000000CL
+#define GDS_EDC_GRBM_CNT__UNUSED_MASK                                                                         0xFFFFFFF0L
+//GDS_EDC_OA_DED
+#define GDS_EDC_OA_DED__ME0_GFXHP3D_PIX_DED__SHIFT                                                            0x0
+#define GDS_EDC_OA_DED__ME0_GFXHP3D_VTX_DED__SHIFT                                                            0x1
+#define GDS_EDC_OA_DED__ME0_CS_DED__SHIFT                                                                     0x2
+#define GDS_EDC_OA_DED__ME0_GFXHP3D_GS_DED__SHIFT                                                             0x3
+#define GDS_EDC_OA_DED__ME1_PIPE0_DED__SHIFT                                                                  0x4
+#define GDS_EDC_OA_DED__ME1_PIPE1_DED__SHIFT                                                                  0x5
+#define GDS_EDC_OA_DED__ME1_PIPE2_DED__SHIFT                                                                  0x6
+#define GDS_EDC_OA_DED__ME1_PIPE3_DED__SHIFT                                                                  0x7
+#define GDS_EDC_OA_DED__ME2_PIPE0_DED__SHIFT                                                                  0x8
+#define GDS_EDC_OA_DED__ME2_PIPE1_DED__SHIFT                                                                  0x9
+#define GDS_EDC_OA_DED__ME2_PIPE2_DED__SHIFT                                                                  0xa
+#define GDS_EDC_OA_DED__ME2_PIPE3_DED__SHIFT                                                                  0xb
+#define GDS_EDC_OA_DED__UNUSED1__SHIFT                                                                        0xc
+#define GDS_EDC_OA_DED__ME0_GFXHP3D_PIX_DED_MASK                                                              0x00000001L
+#define GDS_EDC_OA_DED__ME0_GFXHP3D_VTX_DED_MASK                                                              0x00000002L
+#define GDS_EDC_OA_DED__ME0_CS_DED_MASK                                                                       0x00000004L
+#define GDS_EDC_OA_DED__ME0_GFXHP3D_GS_DED_MASK                                                               0x00000008L
+#define GDS_EDC_OA_DED__ME1_PIPE0_DED_MASK                                                                    0x00000010L
+#define GDS_EDC_OA_DED__ME1_PIPE1_DED_MASK                                                                    0x00000020L
+#define GDS_EDC_OA_DED__ME1_PIPE2_DED_MASK                                                                    0x00000040L
+#define GDS_EDC_OA_DED__ME1_PIPE3_DED_MASK                                                                    0x00000080L
+#define GDS_EDC_OA_DED__ME2_PIPE0_DED_MASK                                                                    0x00000100L
+#define GDS_EDC_OA_DED__ME2_PIPE1_DED_MASK                                                                    0x00000200L
+#define GDS_EDC_OA_DED__ME2_PIPE2_DED_MASK                                                                    0x00000400L
+#define GDS_EDC_OA_DED__ME2_PIPE3_DED_MASK                                                                    0x00000800L
+#define GDS_EDC_OA_DED__UNUSED1_MASK                                                                          0xFFFFF000L
+//GDS_EDC_OA_PHY_CNT
+#define GDS_EDC_OA_PHY_CNT__ME0_CS_PIPE_MEM_SEC__SHIFT                                                        0x0
+#define GDS_EDC_OA_PHY_CNT__ME0_CS_PIPE_MEM_DED__SHIFT                                                        0x2
+#define GDS_EDC_OA_PHY_CNT__PHY_CMD_RAM_MEM_SEC__SHIFT                                                        0x4
+#define GDS_EDC_OA_PHY_CNT__PHY_CMD_RAM_MEM_DED__SHIFT                                                        0x6
+#define GDS_EDC_OA_PHY_CNT__PHY_DATA_RAM_MEM_SEC__SHIFT                                                       0x8
+#define GDS_EDC_OA_PHY_CNT__PHY_DATA_RAM_MEM_DED__SHIFT                                                       0xa
+#define GDS_EDC_OA_PHY_CNT__UNUSED1__SHIFT                                                                    0xc
+#define GDS_EDC_OA_PHY_CNT__ME0_CS_PIPE_MEM_SEC_MASK                                                          0x00000003L
+#define GDS_EDC_OA_PHY_CNT__ME0_CS_PIPE_MEM_DED_MASK                                                          0x0000000CL
+#define GDS_EDC_OA_PHY_CNT__PHY_CMD_RAM_MEM_SEC_MASK                                                          0x00000030L
+#define GDS_EDC_OA_PHY_CNT__PHY_CMD_RAM_MEM_DED_MASK                                                          0x000000C0L
+#define GDS_EDC_OA_PHY_CNT__PHY_DATA_RAM_MEM_SEC_MASK                                                         0x00000300L
+#define GDS_EDC_OA_PHY_CNT__PHY_DATA_RAM_MEM_DED_MASK                                                         0x00000C00L
+#define GDS_EDC_OA_PHY_CNT__UNUSED1_MASK                                                                      0xFFFFF000L
+//GDS_EDC_OA_PIPE_CNT
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE0_PIPE_MEM_SEC__SHIFT                                                    0x0
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE0_PIPE_MEM_DED__SHIFT                                                    0x2
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE1_PIPE_MEM_SEC__SHIFT                                                    0x4
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE1_PIPE_MEM_DED__SHIFT                                                    0x6
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE2_PIPE_MEM_SEC__SHIFT                                                    0x8
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE2_PIPE_MEM_DED__SHIFT                                                    0xa
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE3_PIPE_MEM_SEC__SHIFT                                                    0xc
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE3_PIPE_MEM_DED__SHIFT                                                    0xe
+#define GDS_EDC_OA_PIPE_CNT__UNUSED__SHIFT                                                                    0x10
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE0_PIPE_MEM_SEC_MASK                                                      0x00000003L
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE0_PIPE_MEM_DED_MASK                                                      0x0000000CL
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE1_PIPE_MEM_SEC_MASK                                                      0x00000030L
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE1_PIPE_MEM_DED_MASK                                                      0x000000C0L
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE2_PIPE_MEM_SEC_MASK                                                      0x00000300L
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE2_PIPE_MEM_DED_MASK                                                      0x00000C00L
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE3_PIPE_MEM_SEC_MASK                                                      0x00003000L
+#define GDS_EDC_OA_PIPE_CNT__ME1_PIPE3_PIPE_MEM_DED_MASK                                                      0x0000C000L
+#define GDS_EDC_OA_PIPE_CNT__UNUSED_MASK                                                                      0xFFFF0000L
+
+// addressBlock: gc_shsdec
+//SPI_EDC_CNT
+#define SPI_EDC_CNT__SPI_SR_MEM_SEC_COUNT__SHIFT                                                              0x0
+#define SPI_EDC_CNT__SPI_SR_MEM_DED_COUNT__SHIFT                                                              0x2
+#define SPI_EDC_CNT__SPI_GDS_EXPREQ_SEC_COUNT__SHIFT                                                          0x4
+#define SPI_EDC_CNT__SPI_GDS_EXPREQ_DED_COUNT__SHIFT                                                          0x6
+#define SPI_EDC_CNT__SPI_WB_GRANT_30_SEC_COUNT__SHIFT                                                         0x8
+#define SPI_EDC_CNT__SPI_WB_GRANT_30_DED_COUNT__SHIFT                                                         0xa
+#define SPI_EDC_CNT__SPI_WB_GRANT_61_SEC_COUNT__SHIFT                                                         0xc
+#define SPI_EDC_CNT__SPI_WB_GRANT_61_DED_COUNT__SHIFT                                                         0xe
+#define SPI_EDC_CNT__SPI_LIFE_CNT_SEC_COUNT__SHIFT                                                            0x10
+#define SPI_EDC_CNT__SPI_LIFE_CNT_DED_COUNT__SHIFT                                                            0x12
+#define SPI_EDC_CNT__SPI_SR_MEM_SEC_COUNT_MASK                                                                0x00000003L
+#define SPI_EDC_CNT__SPI_SR_MEM_DED_COUNT_MASK                                                                0x0000000CL
+#define SPI_EDC_CNT__SPI_GDS_EXPREQ_SEC_COUNT_MASK                                                            0x00000030L
+#define SPI_EDC_CNT__SPI_GDS_EXPREQ_DED_COUNT_MASK                                                            0x000000C0L
+#define SPI_EDC_CNT__SPI_WB_GRANT_30_SEC_COUNT_MASK                                                           0x00000300L
+#define SPI_EDC_CNT__SPI_WB_GRANT_30_DED_COUNT_MASK                                                           0x00000C00L
+#define SPI_EDC_CNT__SPI_WB_GRANT_61_SEC_COUNT_MASK                                                           0x00003000L
+#define SPI_EDC_CNT__SPI_WB_GRANT_61_DED_COUNT_MASK                                                           0x0000C000L
+#define SPI_EDC_CNT__SPI_LIFE_CNT_SEC_COUNT_MASK                                                              0x00030000L
+#define SPI_EDC_CNT__SPI_LIFE_CNT_DED_COUNT_MASK                                                              0x000C0000L
+
+// addressBlock: gc_sqdec
+//SQC_EDC_CNT2
+#define SQC_EDC_CNT2__INST_BANKA_TAG_RAM_SEC_COUNT__SHIFT                                                     0x0
+#define SQC_EDC_CNT2__INST_BANKA_TAG_RAM_DED_COUNT__SHIFT                                                     0x2
+#define SQC_EDC_CNT2__INST_BANKA_BANK_RAM_SEC_COUNT__SHIFT                                                    0x4
+#define SQC_EDC_CNT2__INST_BANKA_BANK_RAM_DED_COUNT__SHIFT                                                    0x6
+#define SQC_EDC_CNT2__DATA_BANKA_TAG_RAM_SEC_COUNT__SHIFT                                                     0x8
+#define SQC_EDC_CNT2__DATA_BANKA_TAG_RAM_DED_COUNT__SHIFT                                                     0xa
+#define SQC_EDC_CNT2__DATA_BANKA_BANK_RAM_SEC_COUNT__SHIFT                                                    0xc
+#define SQC_EDC_CNT2__DATA_BANKA_BANK_RAM_DED_COUNT__SHIFT                                                    0xe
+#define SQC_EDC_CNT2__INST_UTCL1_LFIFO_SEC_COUNT__SHIFT                                                       0x10
+#define SQC_EDC_CNT2__INST_UTCL1_LFIFO_DED_COUNT__SHIFT                                                       0x12
+#define SQC_EDC_CNT2__INST_BANKA_TAG_RAM_SEC_COUNT_MASK                                                       0x00000003L
+#define SQC_EDC_CNT2__INST_BANKA_TAG_RAM_DED_COUNT_MASK                                                       0x0000000CL
+#define SQC_EDC_CNT2__INST_BANKA_BANK_RAM_SEC_COUNT_MASK                                                      0x00000030L
+#define SQC_EDC_CNT2__INST_BANKA_BANK_RAM_DED_COUNT_MASK                                                      0x000000C0L
+#define SQC_EDC_CNT2__DATA_BANKA_TAG_RAM_SEC_COUNT_MASK                                                       0x00000300L
+#define SQC_EDC_CNT2__DATA_BANKA_TAG_RAM_DED_COUNT_MASK                                                       0x00000C00L
+#define SQC_EDC_CNT2__DATA_BANKA_BANK_RAM_SEC_COUNT_MASK                                                      0x00003000L
+#define SQC_EDC_CNT2__DATA_BANKA_BANK_RAM_DED_COUNT_MASK                                                      0x0000C000L
+#define SQC_EDC_CNT2__INST_UTCL1_LFIFO_SEC_COUNT_MASK                                                         0x00030000L
+#define SQC_EDC_CNT2__INST_UTCL1_LFIFO_DED_COUNT_MASK                                                         0x000C0000L
+//SQC_EDC_CNT3
+#define SQC_EDC_CNT3__INST_BANKB_TAG_RAM_SEC_COUNT__SHIFT                                                     0x0
+#define SQC_EDC_CNT3__INST_BANKB_TAG_RAM_DED_COUNT__SHIFT                                                     0x2
+#define SQC_EDC_CNT3__INST_BANKB_BANK_RAM_SEC_COUNT__SHIFT                                                    0x4
+#define SQC_EDC_CNT3__INST_BANKB_BANK_RAM_DED_COUNT__SHIFT                                                    0x6
+#define SQC_EDC_CNT3__DATA_BANKB_TAG_RAM_SEC_COUNT__SHIFT                                                     0x8
+#define SQC_EDC_CNT3__DATA_BANKB_TAG_RAM_DED_COUNT__SHIFT                                                     0xa
+#define SQC_EDC_CNT3__DATA_BANKB_BANK_RAM_SEC_COUNT__SHIFT                                                    0xc
+#define SQC_EDC_CNT3__DATA_BANKB_BANK_RAM_DED_COUNT__SHIFT                                                    0xe
+#define SQC_EDC_CNT3__INST_BANKB_TAG_RAM_SEC_COUNT_MASK                                                       0x00000003L
+#define SQC_EDC_CNT3__INST_BANKB_TAG_RAM_DED_COUNT_MASK                                                       0x0000000CL
+#define SQC_EDC_CNT3__INST_BANKB_BANK_RAM_SEC_COUNT_MASK                                                      0x00000030L
+#define SQC_EDC_CNT3__INST_BANKB_BANK_RAM_DED_COUNT_MASK                                                      0x000000C0L
+#define SQC_EDC_CNT3__DATA_BANKB_TAG_RAM_SEC_COUNT_MASK                                                       0x00000300L
+#define SQC_EDC_CNT3__DATA_BANKB_TAG_RAM_DED_COUNT_MASK                                                       0x00000C00L
+#define SQC_EDC_CNT3__DATA_BANKB_BANK_RAM_SEC_COUNT_MASK                                                      0x00003000L
+#define SQC_EDC_CNT3__DATA_BANKB_BANK_RAM_DED_COUNT_MASK                                                      0x0000C000L
+//SQC_EDC_PARITY_CNT3
+#define SQC_EDC_PARITY_CNT3__INST_BANKA_UTCL1_MISS_FIFO_SEC_COUNT__SHIFT                                      0x0
+#define SQC_EDC_PARITY_CNT3__INST_BANKA_UTCL1_MISS_FIFO_DED_COUNT__SHIFT                                      0x2
+#define SQC_EDC_PARITY_CNT3__INST_BANKA_MISS_FIFO_SEC_COUNT__SHIFT                                            0x4
+#define SQC_EDC_PARITY_CNT3__INST_BANKA_MISS_FIFO_DED_COUNT__SHIFT                                            0x6
+#define SQC_EDC_PARITY_CNT3__DATA_BANKA_HIT_FIFO_SEC_COUNT__SHIFT                                             0x8
+#define SQC_EDC_PARITY_CNT3__DATA_BANKA_HIT_FIFO_DED_COUNT__SHIFT                                             0xa
+#define SQC_EDC_PARITY_CNT3__DATA_BANKA_MISS_FIFO_SEC_COUNT__SHIFT                                            0xc
+#define SQC_EDC_PARITY_CNT3__DATA_BANKA_MISS_FIFO_DED_COUNT__SHIFT                                            0xe
+#define SQC_EDC_PARITY_CNT3__INST_BANKB_UTCL1_MISS_FIFO_SEC_COUNT__SHIFT                                      0x10
+#define SQC_EDC_PARITY_CNT3__INST_BANKB_UTCL1_MISS_FIFO_DED_COUNT__SHIFT                                      0x12
+#define SQC_EDC_PARITY_CNT3__INST_BANKB_MISS_FIFO_SEC_COUNT__SHIFT                                            0x14
+#define SQC_EDC_PARITY_CNT3__INST_BANKB_MISS_FIFO_DED_COUNT__SHIFT                                            0x16
+#define SQC_EDC_PARITY_CNT3__DATA_BANKB_HIT_FIFO_SEC_COUNT__SHIFT                                             0x18
+#define SQC_EDC_PARITY_CNT3__DATA_BANKB_HIT_FIFO_DED_COUNT__SHIFT                                             0x1a
+#define SQC_EDC_PARITY_CNT3__DATA_BANKB_MISS_FIFO_SEC_COUNT__SHIFT                                            0x1c
+#define SQC_EDC_PARITY_CNT3__DATA_BANKB_MISS_FIFO_DED_COUNT__SHIFT                                            0x1e
+#define SQC_EDC_PARITY_CNT3__INST_BANKA_UTCL1_MISS_FIFO_SEC_COUNT_MASK                                        0x00000003L
+#define SQC_EDC_PARITY_CNT3__INST_BANKA_UTCL1_MISS_FIFO_DED_COUNT_MASK                                        0x0000000CL
+#define SQC_EDC_PARITY_CNT3__INST_BANKA_MISS_FIFO_SEC_COUNT_MASK                                              0x00000030L
+#define SQC_EDC_PARITY_CNT3__INST_BANKA_MISS_FIFO_DED_COUNT_MASK                                              0x000000C0L
+#define SQC_EDC_PARITY_CNT3__DATA_BANKA_HIT_FIFO_SEC_COUNT_MASK                                               0x00000300L
+#define SQC_EDC_PARITY_CNT3__DATA_BANKA_HIT_FIFO_DED_COUNT_MASK                                               0x00000C00L
+#define SQC_EDC_PARITY_CNT3__DATA_BANKA_MISS_FIFO_SEC_COUNT_MASK                                              0x00003000L
+#define SQC_EDC_PARITY_CNT3__DATA_BANKA_MISS_FIFO_DED_COUNT_MASK                                              0x0000C000L
+#define SQC_EDC_PARITY_CNT3__INST_BANKB_UTCL1_MISS_FIFO_SEC_COUNT_MASK                                        0x00030000L
+#define SQC_EDC_PARITY_CNT3__INST_BANKB_UTCL1_MISS_FIFO_DED_COUNT_MASK                                        0x000C0000L
+#define SQC_EDC_PARITY_CNT3__INST_BANKB_MISS_FIFO_SEC_COUNT_MASK                                              0x00300000L
+#define SQC_EDC_PARITY_CNT3__INST_BANKB_MISS_FIFO_DED_COUNT_MASK                                              0x00C00000L
+#define SQC_EDC_PARITY_CNT3__DATA_BANKB_HIT_FIFO_SEC_COUNT_MASK                                               0x03000000L
+#define SQC_EDC_PARITY_CNT3__DATA_BANKB_HIT_FIFO_DED_COUNT_MASK                                               0x0C000000L
+#define SQC_EDC_PARITY_CNT3__DATA_BANKB_MISS_FIFO_SEC_COUNT_MASK                                              0x30000000L
+#define SQC_EDC_PARITY_CNT3__DATA_BANKB_MISS_FIFO_DED_COUNT_MASK                                              0xC0000000L
+//SQC_EDC_CNT
+#define SQC_EDC_CNT__DATA_CU0_WRITE_DATA_BUF_SEC_COUNT__SHIFT                                                 0x0
+#define SQC_EDC_CNT__DATA_CU0_WRITE_DATA_BUF_DED_COUNT__SHIFT                                                 0x2
+#define SQC_EDC_CNT__DATA_CU0_UTCL1_LFIFO_SEC_COUNT__SHIFT                                                    0x4
+#define SQC_EDC_CNT__DATA_CU0_UTCL1_LFIFO_DED_COUNT__SHIFT                                                    0x6
+#define SQC_EDC_CNT__DATA_CU1_WRITE_DATA_BUF_SEC_COUNT__SHIFT                                                 0x8
+#define SQC_EDC_CNT__DATA_CU1_WRITE_DATA_BUF_DED_COUNT__SHIFT                                                 0xa
+#define SQC_EDC_CNT__DATA_CU1_UTCL1_LFIFO_SEC_COUNT__SHIFT                                                    0xc
+#define SQC_EDC_CNT__DATA_CU1_UTCL1_LFIFO_DED_COUNT__SHIFT                                                    0xe
+#define SQC_EDC_CNT__DATA_CU2_WRITE_DATA_BUF_SEC_COUNT__SHIFT                                                 0x10
+#define SQC_EDC_CNT__DATA_CU2_WRITE_DATA_BUF_DED_COUNT__SHIFT                                                 0x12
+#define SQC_EDC_CNT__DATA_CU2_UTCL1_LFIFO_SEC_COUNT__SHIFT                                                    0x14
+#define SQC_EDC_CNT__DATA_CU2_UTCL1_LFIFO_DED_COUNT__SHIFT                                                    0x16
+#define SQC_EDC_CNT__DATA_CU3_WRITE_DATA_BUF_SEC_COUNT__SHIFT                                                 0x18
+#define SQC_EDC_CNT__DATA_CU3_WRITE_DATA_BUF_DED_COUNT__SHIFT                                                 0x1a
+#define SQC_EDC_CNT__DATA_CU3_UTCL1_LFIFO_SEC_COUNT__SHIFT                                                    0x1c
+#define SQC_EDC_CNT__DATA_CU3_UTCL1_LFIFO_DED_COUNT__SHIFT                                                    0x1e
+#define SQC_EDC_CNT__DATA_CU0_WRITE_DATA_BUF_SEC_COUNT_MASK                                                   0x00000003L
+#define SQC_EDC_CNT__DATA_CU0_WRITE_DATA_BUF_DED_COUNT_MASK                                                   0x0000000CL
+#define SQC_EDC_CNT__DATA_CU0_UTCL1_LFIFO_SEC_COUNT_MASK                                                      0x00000030L
+#define SQC_EDC_CNT__DATA_CU0_UTCL1_LFIFO_DED_COUNT_MASK                                                      0x000000C0L
+#define SQC_EDC_CNT__DATA_CU1_WRITE_DATA_BUF_SEC_COUNT_MASK                                                   0x00000300L
+#define SQC_EDC_CNT__DATA_CU1_WRITE_DATA_BUF_DED_COUNT_MASK                                                   0x00000C00L
+#define SQC_EDC_CNT__DATA_CU1_UTCL1_LFIFO_SEC_COUNT_MASK                                                      0x00003000L
+#define SQC_EDC_CNT__DATA_CU1_UTCL1_LFIFO_DED_COUNT_MASK                                                      0x0000C000L
+#define SQC_EDC_CNT__DATA_CU2_WRITE_DATA_BUF_SEC_COUNT_MASK                                                   0x00030000L
+#define SQC_EDC_CNT__DATA_CU2_WRITE_DATA_BUF_DED_COUNT_MASK                                                   0x000C0000L
+#define SQC_EDC_CNT__DATA_CU2_UTCL1_LFIFO_SEC_COUNT_MASK                                                      0x00300000L
+#define SQC_EDC_CNT__DATA_CU2_UTCL1_LFIFO_DED_COUNT_MASK                                                      0x00C00000L
+#define SQC_EDC_CNT__DATA_CU3_WRITE_DATA_BUF_SEC_COUNT_MASK                                                   0x03000000L
+#define SQC_EDC_CNT__DATA_CU3_WRITE_DATA_BUF_DED_COUNT_MASK                                                   0x0C000000L
+#define SQC_EDC_CNT__DATA_CU3_UTCL1_LFIFO_SEC_COUNT_MASK                                                      0x30000000L
+#define SQC_EDC_CNT__DATA_CU3_UTCL1_LFIFO_DED_COUNT_MASK                                                      0xC0000000L
+//SQ_EDC_SEC_CNT
+#define SQ_EDC_SEC_CNT__LDS_SEC__SHIFT                                                                        0x0
+#define SQ_EDC_SEC_CNT__SGPR_SEC__SHIFT                                                                       0x8
+#define SQ_EDC_SEC_CNT__VGPR_SEC__SHIFT                                                                       0x10
+#define SQ_EDC_SEC_CNT__LDS_SEC_MASK                                                                          0x000000FFL
+#define SQ_EDC_SEC_CNT__SGPR_SEC_MASK                                                                         0x0000FF00L
+#define SQ_EDC_SEC_CNT__VGPR_SEC_MASK                                                                         0x00FF0000L
+//SQ_EDC_DED_CNT
+#define SQ_EDC_DED_CNT__LDS_DED__SHIFT                                                                        0x0
+#define SQ_EDC_DED_CNT__SGPR_DED__SHIFT                                                                       0x8
+#define SQ_EDC_DED_CNT__VGPR_DED__SHIFT                                                                       0x10
+#define SQ_EDC_DED_CNT__LDS_DED_MASK                                                                          0x000000FFL
+#define SQ_EDC_DED_CNT__SGPR_DED_MASK                                                                         0x0000FF00L
+#define SQ_EDC_DED_CNT__VGPR_DED_MASK                                                                         0x00FF0000L
+//SQ_EDC_INFO
+#define SQ_EDC_INFO__WAVE_ID__SHIFT                                                                           0x0
+#define SQ_EDC_INFO__SIMD_ID__SHIFT                                                                           0x4
+#define SQ_EDC_INFO__SOURCE__SHIFT                                                                            0x6
+#define SQ_EDC_INFO__VM_ID__SHIFT                                                                             0x9
+#define SQ_EDC_INFO__WAVE_ID_MASK                                                                             0x0000000FL
+#define SQ_EDC_INFO__SIMD_ID_MASK                                                                             0x00000030L
+#define SQ_EDC_INFO__SOURCE_MASK                                                                              0x000001C0L
+#define SQ_EDC_INFO__VM_ID_MASK                                                                               0x00001E00L
+//SQ_EDC_CNT
+#define SQ_EDC_CNT__LDS_D_SEC_COUNT__SHIFT                                                                    0x0
+#define SQ_EDC_CNT__LDS_D_DED_COUNT__SHIFT                                                                    0x2
+#define SQ_EDC_CNT__LDS_I_SEC_COUNT__SHIFT                                                                    0x4
+#define SQ_EDC_CNT__LDS_I_DED_COUNT__SHIFT                                                                    0x6
+#define SQ_EDC_CNT__SGPR_SEC_COUNT__SHIFT                                                                     0x8
+#define SQ_EDC_CNT__SGPR_DED_COUNT__SHIFT                                                                     0xa
+#define SQ_EDC_CNT__VGPR0_SEC_COUNT__SHIFT                                                                    0xc
+#define SQ_EDC_CNT__VGPR0_DED_COUNT__SHIFT                                                                    0xe
+#define SQ_EDC_CNT__VGPR1_SEC_COUNT__SHIFT                                                                    0x10
+#define SQ_EDC_CNT__VGPR1_DED_COUNT__SHIFT                                                                    0x12
+#define SQ_EDC_CNT__VGPR2_SEC_COUNT__SHIFT                                                                    0x14
+#define SQ_EDC_CNT__VGPR2_DED_COUNT__SHIFT                                                                    0x16
+#define SQ_EDC_CNT__VGPR3_SEC_COUNT__SHIFT                                                                    0x18
+#define SQ_EDC_CNT__VGPR3_DED_COUNT__SHIFT                                                                    0x1a
+#define SQ_EDC_CNT__LDS_D_SEC_COUNT_MASK                                                                      0x00000003L
+#define SQ_EDC_CNT__LDS_D_DED_COUNT_MASK                                                                      0x0000000CL
+#define SQ_EDC_CNT__LDS_I_SEC_COUNT_MASK                                                                      0x00000030L
+#define SQ_EDC_CNT__LDS_I_DED_COUNT_MASK                                                                      0x000000C0L
+#define SQ_EDC_CNT__SGPR_SEC_COUNT_MASK                                                                       0x00000300L
+#define SQ_EDC_CNT__SGPR_DED_COUNT_MASK                                                                       0x00000C00L
+#define SQ_EDC_CNT__VGPR0_SEC_COUNT_MASK                                                                      0x00003000L
+#define SQ_EDC_CNT__VGPR0_DED_COUNT_MASK                                                                      0x0000C000L
+#define SQ_EDC_CNT__VGPR1_SEC_COUNT_MASK                                                                      0x00030000L
+#define SQ_EDC_CNT__VGPR1_DED_COUNT_MASK                                                                      0x000C0000L
+#define SQ_EDC_CNT__VGPR2_SEC_COUNT_MASK                                                                      0x00300000L
+#define SQ_EDC_CNT__VGPR2_DED_COUNT_MASK                                                                      0x00C00000L
+#define SQ_EDC_CNT__VGPR3_SEC_COUNT_MASK                                                                      0x03000000L
+#define SQ_EDC_CNT__VGPR3_DED_COUNT_MASK                                                                      0x0C000000L
+
+// addressBlock: gc_tpdec
+//TA_EDC_CNT
+#define TA_EDC_CNT__TA_FS_DFIFO_SEC_COUNT__SHIFT                                                              0x0
+#define TA_EDC_CNT__TA_FS_DFIFO_DED_COUNT__SHIFT                                                              0x2
+#define TA_EDC_CNT__TA_FS_AFIFO_SEC_COUNT__SHIFT                                                              0x4
+#define TA_EDC_CNT__TA_FS_AFIFO_DED_COUNT__SHIFT                                                              0x6
+#define TA_EDC_CNT__TA_FL_LFIFO_SEC_COUNT__SHIFT                                                              0x8
+#define TA_EDC_CNT__TA_FL_LFIFO_DED_COUNT__SHIFT                                                              0xa
+#define TA_EDC_CNT__TA_FX_LFIFO_SEC_COUNT__SHIFT                                                              0xc
+#define TA_EDC_CNT__TA_FX_LFIFO_DED_COUNT__SHIFT                                                              0xe
+#define TA_EDC_CNT__TA_FS_CFIFO_SEC_COUNT__SHIFT                                                              0x10
+#define TA_EDC_CNT__TA_FS_CFIFO_DED_COUNT__SHIFT                                                              0x12
+#define TA_EDC_CNT__TA_FS_DFIFO_SEC_COUNT_MASK                                                                0x00000003L
+#define TA_EDC_CNT__TA_FS_DFIFO_DED_COUNT_MASK                                                                0x0000000CL
+#define TA_EDC_CNT__TA_FS_AFIFO_SEC_COUNT_MASK                                                                0x00000030L
+#define TA_EDC_CNT__TA_FS_AFIFO_DED_COUNT_MASK                                                                0x000000C0L
+#define TA_EDC_CNT__TA_FL_LFIFO_SEC_COUNT_MASK                                                                0x00000300L
+#define TA_EDC_CNT__TA_FL_LFIFO_DED_COUNT_MASK                                                                0x00000C00L
+#define TA_EDC_CNT__TA_FX_LFIFO_SEC_COUNT_MASK                                                                0x00003000L
+#define TA_EDC_CNT__TA_FX_LFIFO_DED_COUNT_MASK                                                                0x0000C000L
+#define TA_EDC_CNT__TA_FS_CFIFO_SEC_COUNT_MASK                                                                0x00030000L
+#define TA_EDC_CNT__TA_FS_CFIFO_DED_COUNT_MASK                                                                0x000C0000L
+
+// addressBlock: gc_tcdec
+//TCP_EDC_CNT
+#define TCP_EDC_CNT__SEC_COUNT__SHIFT                                                                         0x0
+#define TCP_EDC_CNT__LFIFO_SED_COUNT__SHIFT                                                                   0x8
+#define TCP_EDC_CNT__DED_COUNT__SHIFT                                                                         0x10
+#define TCP_EDC_CNT__SEC_COUNT_MASK                                                                           0x000000FFL
+#define TCP_EDC_CNT__LFIFO_SED_COUNT_MASK                                                                     0x0000FF00L
+#define TCP_EDC_CNT__DED_COUNT_MASK                                                                           0x00FF0000L
+//TCP_EDC_CNT_NEW
+#define TCP_EDC_CNT_NEW__CACHE_RAM_SEC_COUNT__SHIFT                                                           0x0
+#define TCP_EDC_CNT_NEW__CACHE_RAM_DED_COUNT__SHIFT                                                           0x2
+#define TCP_EDC_CNT_NEW__LFIFO_RAM_SEC_COUNT__SHIFT                                                           0x4
+#define TCP_EDC_CNT_NEW__LFIFO_RAM_DED_COUNT__SHIFT                                                           0x6
+#define TCP_EDC_CNT_NEW__CMD_FIFO_SEC_COUNT__SHIFT                                                            0x8
+#define TCP_EDC_CNT_NEW__CMD_FIFO_DED_COUNT__SHIFT                                                            0xa
+#define TCP_EDC_CNT_NEW__VM_FIFO_SEC_COUNT__SHIFT                                                             0xc
+#define TCP_EDC_CNT_NEW__VM_FIFO_DED_COUNT__SHIFT                                                             0xe
+#define TCP_EDC_CNT_NEW__DB_RAM_SED_COUNT__SHIFT                                                              0x10
+#define TCP_EDC_CNT_NEW__UTCL1_LFIFO0_SEC_COUNT__SHIFT                                                        0x12
+#define TCP_EDC_CNT_NEW__UTCL1_LFIFO0_DED_COUNT__SHIFT                                                        0x14
+#define TCP_EDC_CNT_NEW__UTCL1_LFIFO1_SEC_COUNT__SHIFT                                                        0x16
+#define TCP_EDC_CNT_NEW__UTCL1_LFIFO1_DED_COUNT__SHIFT                                                        0x18
+#define TCP_EDC_CNT_NEW__CACHE_RAM_SEC_COUNT_MASK                                                             0x00000003L
+#define TCP_EDC_CNT_NEW__CACHE_RAM_DED_COUNT_MASK                                                             0x0000000CL
+#define TCP_EDC_CNT_NEW__LFIFO_RAM_SEC_COUNT_MASK                                                             0x00000030L
+#define TCP_EDC_CNT_NEW__LFIFO_RAM_DED_COUNT_MASK                                                             0x000000C0L
+#define TCP_EDC_CNT_NEW__CMD_FIFO_SEC_COUNT_MASK                                                              0x00000300L
+#define TCP_EDC_CNT_NEW__CMD_FIFO_DED_COUNT_MASK                                                              0x00000C00L
+#define TCP_EDC_CNT_NEW__VM_FIFO_SEC_COUNT_MASK                                                               0x00003000L
+#define TCP_EDC_CNT_NEW__VM_FIFO_DED_COUNT_MASK                                                               0x0000C000L
+#define TCP_EDC_CNT_NEW__DB_RAM_SED_COUNT_MASK                                                                0x00030000L
+#define TCP_EDC_CNT_NEW__UTCL1_LFIFO0_SEC_COUNT_MASK                                                          0x000C0000L
+#define TCP_EDC_CNT_NEW__UTCL1_LFIFO0_DED_COUNT_MASK                                                          0x00300000L
+#define TCP_EDC_CNT_NEW__UTCL1_LFIFO1_SEC_COUNT_MASK                                                          0x00C00000L
+#define TCP_EDC_CNT_NEW__UTCL1_LFIFO1_DED_COUNT_MASK                                                          0x03000000L
+//TCP_ATC_EDC_GATCL1_CNT
+#define TCP_ATC_EDC_GATCL1_CNT__DATA_SEC__SHIFT                                                               0x0
+#define TCP_ATC_EDC_GATCL1_CNT__DATA_SEC_MASK                                                                 0x000000FFL
+//TCI_EDC_CNT
+#define TCI_EDC_CNT__WRITE_RAM_SEC_COUNT__SHIFT                                                               0x0
+#define TCI_EDC_CNT__WRITE_RAM_DED_COUNT__SHIFT                                                               0x2
+#define TCI_EDC_CNT__WRITE_RAM_SEC_COUNT_MASK                                                                 0x00000003L
+#define TCI_EDC_CNT__WRITE_RAM_DED_COUNT_MASK                                                                 0x0000000CL
+//TCA_EDC_CNT
+#define TCA_EDC_CNT__HOLE_FIFO_SEC_COUNT__SHIFT                                                               0x0
+#define TCA_EDC_CNT__HOLE_FIFO_DED_COUNT__SHIFT                                                               0x2
+#define TCA_EDC_CNT__REQ_FIFO_SEC_COUNT__SHIFT                                                                0x4
+#define TCA_EDC_CNT__REQ_FIFO_DED_COUNT__SHIFT                                                                0x6
+#define TCA_EDC_CNT__HOLE_FIFO_SEC_COUNT_MASK                                                                 0x00000003L
+#define TCA_EDC_CNT__HOLE_FIFO_DED_COUNT_MASK                                                                 0x0000000CL
+#define TCA_EDC_CNT__REQ_FIFO_SEC_COUNT_MASK                                                                  0x00000030L
+#define TCA_EDC_CNT__REQ_FIFO_DED_COUNT_MASK                                                                  0x000000C0L
+//TCC_EDC_CNT
+#define TCC_EDC_CNT__CACHE_DATA_SEC_COUNT__SHIFT                                                              0x0
+#define TCC_EDC_CNT__CACHE_DATA_DED_COUNT__SHIFT                                                              0x2
+#define TCC_EDC_CNT__CACHE_DIRTY_SEC_COUNT__SHIFT                                                             0x4
+#define TCC_EDC_CNT__CACHE_DIRTY_DED_COUNT__SHIFT                                                             0x6
+#define TCC_EDC_CNT__HIGH_RATE_TAG_SEC_COUNT__SHIFT                                                           0x8
+#define TCC_EDC_CNT__HIGH_RATE_TAG_DED_COUNT__SHIFT                                                           0xa
+#define TCC_EDC_CNT__LOW_RATE_TAG_SEC_COUNT__SHIFT                                                            0xc
+#define TCC_EDC_CNT__LOW_RATE_TAG_DED_COUNT__SHIFT                                                            0xe
+#define TCC_EDC_CNT__SRC_FIFO_SEC_COUNT__SHIFT                                                                0x10
+#define TCC_EDC_CNT__SRC_FIFO_DED_COUNT__SHIFT                                                                0x12
+#define TCC_EDC_CNT__LATENCY_FIFO_SEC_COUNT__SHIFT                                                            0x14
+#define TCC_EDC_CNT__LATENCY_FIFO_DED_COUNT__SHIFT                                                            0x16
+#define TCC_EDC_CNT__LATENCY_FIFO_NEXT_RAM_SEC_COUNT__SHIFT                                                   0x18
+#define TCC_EDC_CNT__LATENCY_FIFO_NEXT_RAM_DED_COUNT__SHIFT                                                   0x1a
+#define TCC_EDC_CNT__CACHE_DATA_SEC_COUNT_MASK                                                                0x00000003L
+#define TCC_EDC_CNT__CACHE_DATA_DED_COUNT_MASK                                                                0x0000000CL
+#define TCC_EDC_CNT__CACHE_DIRTY_SEC_COUNT_MASK                                                               0x00000030L
+#define TCC_EDC_CNT__CACHE_DIRTY_DED_COUNT_MASK                                                               0x000000C0L
+#define TCC_EDC_CNT__HIGH_RATE_TAG_SEC_COUNT_MASK                                                             0x00000300L
+#define TCC_EDC_CNT__HIGH_RATE_TAG_DED_COUNT_MASK                                                             0x00000C00L
+#define TCC_EDC_CNT__LOW_RATE_TAG_SEC_COUNT_MASK                                                              0x00003000L
+#define TCC_EDC_CNT__LOW_RATE_TAG_DED_COUNT_MASK                                                              0x0000C000L
+#define TCC_EDC_CNT__SRC_FIFO_SEC_COUNT_MASK                                                                  0x00030000L
+#define TCC_EDC_CNT__SRC_FIFO_DED_COUNT_MASK                                                                  0x000C0000L
+#define TCC_EDC_CNT__LATENCY_FIFO_SEC_COUNT_MASK                                                              0x00300000L
+#define TCC_EDC_CNT__LATENCY_FIFO_DED_COUNT_MASK                                                              0x00C00000L
+#define TCC_EDC_CNT__LATENCY_FIFO_NEXT_RAM_SEC_COUNT_MASK                                                     0x03000000L
+#define TCC_EDC_CNT__LATENCY_FIFO_NEXT_RAM_DED_COUNT_MASK                                                     0x0C000000L
+//TCC_EDC_CNT2
+#define TCC_EDC_CNT2__CACHE_TAG_PROBE_FIFO_SEC_COUNT__SHIFT                                                   0x0
+#define TCC_EDC_CNT2__CACHE_TAG_PROBE_FIFO_DED_COUNT__SHIFT                                                   0x2
+#define TCC_EDC_CNT2__UC_ATOMIC_FIFO_SEC_COUNT__SHIFT                                                         0x4
+#define TCC_EDC_CNT2__UC_ATOMIC_FIFO_DED_COUNT__SHIFT                                                         0x6
+#define TCC_EDC_CNT2__WRITE_CACHE_READ_SEC_COUNT__SHIFT                                                       0x8
+#define TCC_EDC_CNT2__WRITE_CACHE_READ_DED_COUNT__SHIFT                                                       0xa
+#define TCC_EDC_CNT2__RETURN_CONTROL_SEC_COUNT__SHIFT                                                         0xc
+#define TCC_EDC_CNT2__RETURN_CONTROL_DED_COUNT__SHIFT                                                         0xe
+#define TCC_EDC_CNT2__IN_USE_TRANSFER_SEC_COUNT__SHIFT                                                        0x10
+#define TCC_EDC_CNT2__IN_USE_TRANSFER_DED_COUNT__SHIFT                                                        0x12
+#define TCC_EDC_CNT2__IN_USE_DEC_SEC_COUNT__SHIFT                                                             0x14
+#define TCC_EDC_CNT2__IN_USE_DEC_DED_COUNT__SHIFT                                                             0x16
+#define TCC_EDC_CNT2__WRITE_RETURN_SEC_COUNT__SHIFT                                                           0x18
+#define TCC_EDC_CNT2__WRITE_RETURN_DED_COUNT__SHIFT                                                           0x1a
+#define TCC_EDC_CNT2__RETURN_DATA_SEC_COUNT__SHIFT                                                            0x1c
+#define TCC_EDC_CNT2__RETURN_DATA_DED_COUNT__SHIFT                                                            0x1e
+#define TCC_EDC_CNT2__CACHE_TAG_PROBE_FIFO_SEC_COUNT_MASK                                                     0x00000003L
+#define TCC_EDC_CNT2__CACHE_TAG_PROBE_FIFO_DED_COUNT_MASK                                                     0x0000000CL
+#define TCC_EDC_CNT2__UC_ATOMIC_FIFO_SEC_COUNT_MASK                                                           0x00000030L
+#define TCC_EDC_CNT2__UC_ATOMIC_FIFO_DED_COUNT_MASK                                                           0x000000C0L
+#define TCC_EDC_CNT2__WRITE_CACHE_READ_SEC_COUNT_MASK                                                         0x00000300L
+#define TCC_EDC_CNT2__WRITE_CACHE_READ_DED_COUNT_MASK                                                         0x00000C00L
+#define TCC_EDC_CNT2__RETURN_CONTROL_SEC_COUNT_MASK                                                           0x00003000L
+#define TCC_EDC_CNT2__RETURN_CONTROL_DED_COUNT_MASK                                                           0x0000C000L
+#define TCC_EDC_CNT2__IN_USE_TRANSFER_SEC_COUNT_MASK                                                          0x00030000L
+#define TCC_EDC_CNT2__IN_USE_TRANSFER_DED_COUNT_MASK                                                          0x000C0000L
+#define TCC_EDC_CNT2__IN_USE_DEC_SEC_COUNT_MASK                                                               0x00300000L
+#define TCC_EDC_CNT2__IN_USE_DEC_DED_COUNT_MASK                                                               0x00C00000L
+#define TCC_EDC_CNT2__WRITE_RETURN_SEC_COUNT_MASK                                                             0x03000000L
+#define TCC_EDC_CNT2__WRITE_RETURN_DED_COUNT_MASK                                                             0x0C000000L
+#define TCC_EDC_CNT2__RETURN_DATA_SEC_COUNT_MASK                                                              0x30000000L
+#define TCC_EDC_CNT2__RETURN_DATA_DED_COUNT_MASK                                                              0xC0000000L
+
+// addressBlock: gc_tpdec
+//TD_EDC_CNT
+#define TD_EDC_CNT__SS_FIFO_LO_SEC_COUNT__SHIFT                                                               0x0
+#define TD_EDC_CNT__SS_FIFO_LO_DED_COUNT__SHIFT                                                               0x2
+#define TD_EDC_CNT__SS_FIFO_HI_SEC_COUNT__SHIFT                                                               0x4
+#define TD_EDC_CNT__SS_FIFO_HI_DED_COUNT__SHIFT                                                               0x6
+#define TD_EDC_CNT__CS_FIFO_SEC_COUNT__SHIFT                                                                  0x8
+#define TD_EDC_CNT__CS_FIFO_DED_COUNT__SHIFT                                                                  0xa
+#define TD_EDC_CNT__SS_FIFO_LO_SEC_COUNT_MASK                                                                 0x00000003L
+#define TD_EDC_CNT__SS_FIFO_LO_DED_COUNT_MASK                                                                 0x0000000CL
+#define TD_EDC_CNT__SS_FIFO_HI_SEC_COUNT_MASK                                                                 0x00000030L
+#define TD_EDC_CNT__SS_FIFO_HI_DED_COUNT_MASK                                                                 0x000000C0L
+#define TD_EDC_CNT__CS_FIFO_SEC_COUNT_MASK                                                                    0x00000300L
+#define TD_EDC_CNT__CS_FIFO_DED_COUNT_MASK                                                                    0x00000C00L
+//TA_EDC_CNT
+#define TA_EDC_CNT__TA_FS_DFIFO_SEC_COUNT__SHIFT                                                              0x0
+#define TA_EDC_CNT__TA_FS_DFIFO_DED_COUNT__SHIFT                                                              0x2
+#define TA_EDC_CNT__TA_FS_AFIFO_SEC_COUNT__SHIFT                                                              0x4
+#define TA_EDC_CNT__TA_FS_AFIFO_DED_COUNT__SHIFT                                                              0x6
+#define TA_EDC_CNT__TA_FL_LFIFO_SEC_COUNT__SHIFT                                                              0x8
+#define TA_EDC_CNT__TA_FL_LFIFO_DED_COUNT__SHIFT                                                              0xa
+#define TA_EDC_CNT__TA_FX_LFIFO_SEC_COUNT__SHIFT                                                              0xc
+#define TA_EDC_CNT__TA_FX_LFIFO_DED_COUNT__SHIFT                                                              0xe
+#define TA_EDC_CNT__TA_FS_CFIFO_SEC_COUNT__SHIFT                                                              0x10
+#define TA_EDC_CNT__TA_FS_CFIFO_DED_COUNT__SHIFT                                                              0x12
+#define TA_EDC_CNT__TA_FS_DFIFO_SEC_COUNT_MASK                                                                0x00000003L
+#define TA_EDC_CNT__TA_FS_DFIFO_DED_COUNT_MASK                                                                0x0000000CL
+#define TA_EDC_CNT__TA_FS_AFIFO_SEC_COUNT_MASK                                                                0x00000030L
+#define TA_EDC_CNT__TA_FS_AFIFO_DED_COUNT_MASK                                                                0x000000C0L
+#define TA_EDC_CNT__TA_FL_LFIFO_SEC_COUNT_MASK                                                                0x00000300L
+#define TA_EDC_CNT__TA_FL_LFIFO_DED_COUNT_MASK                                                                0x00000C00L
+#define TA_EDC_CNT__TA_FX_LFIFO_SEC_COUNT_MASK                                                                0x00003000L
+#define TA_EDC_CNT__TA_FX_LFIFO_DED_COUNT_MASK                                                                0x0000C000L
+#define TA_EDC_CNT__TA_FS_CFIFO_SEC_COUNT_MASK                                                                0x00030000L
+#define TA_EDC_CNT__TA_FS_CFIFO_DED_COUNT_MASK                                                                0x000C0000L
+
+// addressBlock: gc_ea_gceadec2
+//GCEA_EDC_CNT
+#define GCEA_EDC_CNT__DRAMRD_CMDMEM_SEC_COUNT__SHIFT                                                          0x0
+#define GCEA_EDC_CNT__DRAMRD_CMDMEM_DED_COUNT__SHIFT                                                          0x2
+#define GCEA_EDC_CNT__DRAMWR_CMDMEM_SEC_COUNT__SHIFT                                                          0x4
+#define GCEA_EDC_CNT__DRAMWR_CMDMEM_DED_COUNT__SHIFT                                                          0x6
+#define GCEA_EDC_CNT__DRAMWR_DATAMEM_SEC_COUNT__SHIFT                                                         0x8
+#define GCEA_EDC_CNT__DRAMWR_DATAMEM_DED_COUNT__SHIFT                                                         0xa
+#define GCEA_EDC_CNT__RRET_TAGMEM_SEC_COUNT__SHIFT                                                            0xc
+#define GCEA_EDC_CNT__RRET_TAGMEM_DED_COUNT__SHIFT                                                            0xe
+#define GCEA_EDC_CNT__WRET_TAGMEM_SEC_COUNT__SHIFT                                                            0x10
+#define GCEA_EDC_CNT__WRET_TAGMEM_DED_COUNT__SHIFT                                                            0x12
+#define GCEA_EDC_CNT__DRAMRD_PAGEMEM_SED_COUNT__SHIFT                                                         0x14
+#define GCEA_EDC_CNT__DRAMWR_PAGEMEM_SED_COUNT__SHIFT                                                         0x16
+#define GCEA_EDC_CNT__IORD_CMDMEM_SED_COUNT__SHIFT                                                            0x18
+#define GCEA_EDC_CNT__IOWR_CMDMEM_SED_COUNT__SHIFT                                                            0x1a
+#define GCEA_EDC_CNT__IOWR_DATAMEM_SED_COUNT__SHIFT                                                           0x1c
+#define GCEA_EDC_CNT__MAM_AFMEM_SEC_COUNT__SHIFT                                                              0x1e
+#define GCEA_EDC_CNT__DRAMRD_CMDMEM_SEC_COUNT_MASK                                                            0x00000003L
+#define GCEA_EDC_CNT__DRAMRD_CMDMEM_DED_COUNT_MASK                                                            0x0000000CL
+#define GCEA_EDC_CNT__DRAMWR_CMDMEM_SEC_COUNT_MASK                                                            0x00000030L
+#define GCEA_EDC_CNT__DRAMWR_CMDMEM_DED_COUNT_MASK                                                            0x000000C0L
+#define GCEA_EDC_CNT__DRAMWR_DATAMEM_SEC_COUNT_MASK                                                           0x00000300L
+#define GCEA_EDC_CNT__DRAMWR_DATAMEM_DED_COUNT_MASK                                                           0x00000C00L
+#define GCEA_EDC_CNT__RRET_TAGMEM_SEC_COUNT_MASK                                                              0x00003000L
+#define GCEA_EDC_CNT__RRET_TAGMEM_DED_COUNT_MASK                                                              0x0000C000L
+#define GCEA_EDC_CNT__WRET_TAGMEM_SEC_COUNT_MASK                                                              0x00030000L
+#define GCEA_EDC_CNT__WRET_TAGMEM_DED_COUNT_MASK                                                              0x000C0000L
+#define GCEA_EDC_CNT__DRAMRD_PAGEMEM_SED_COUNT_MASK                                                           0x00300000L
+#define GCEA_EDC_CNT__DRAMWR_PAGEMEM_SED_COUNT_MASK                                                           0x00C00000L
+#define GCEA_EDC_CNT__IORD_CMDMEM_SED_COUNT_MASK                                                              0x03000000L
+#define GCEA_EDC_CNT__IOWR_CMDMEM_SED_COUNT_MASK                                                              0x0C000000L
+#define GCEA_EDC_CNT__IOWR_DATAMEM_SED_COUNT_MASK                                                             0x30000000L
+#define GCEA_EDC_CNT__MAM_AFMEM_SEC_COUNT_MASK                                                                0xC0000000L
+//GCEA_EDC_CNT2
+#define GCEA_EDC_CNT2__GMIRD_CMDMEM_SEC_COUNT__SHIFT                                                          0x0
+#define GCEA_EDC_CNT2__GMIRD_CMDMEM_DED_COUNT__SHIFT                                                          0x2
+#define GCEA_EDC_CNT2__GMIWR_CMDMEM_SEC_COUNT__SHIFT                                                          0x4
+#define GCEA_EDC_CNT2__GMIWR_CMDMEM_DED_COUNT__SHIFT                                                          0x6
+#define GCEA_EDC_CNT2__GMIWR_DATAMEM_SEC_COUNT__SHIFT                                                         0x8
+#define GCEA_EDC_CNT2__GMIWR_DATAMEM_DED_COUNT__SHIFT                                                         0xa
+#define GCEA_EDC_CNT2__GMIRD_PAGEMEM_SED_COUNT__SHIFT                                                         0xc
+#define GCEA_EDC_CNT2__GMIWR_PAGEMEM_SED_COUNT__SHIFT                                                         0xe
+#define GCEA_EDC_CNT2__MAM_D0MEM_SED_COUNT__SHIFT                                                             0x10
+#define GCEA_EDC_CNT2__MAM_D1MEM_SED_COUNT__SHIFT                                                             0x12
+#define GCEA_EDC_CNT2__MAM_D2MEM_SED_COUNT__SHIFT                                                             0x14
+#define GCEA_EDC_CNT2__MAM_D3MEM_SED_COUNT__SHIFT                                                             0x16
+#define GCEA_EDC_CNT2__MAM_D0MEM_DED_COUNT__SHIFT                                                             0x18
+#define GCEA_EDC_CNT2__MAM_D1MEM_DED_COUNT__SHIFT                                                             0x1a
+#define GCEA_EDC_CNT2__MAM_D2MEM_DED_COUNT__SHIFT                                                             0x1c
+#define GCEA_EDC_CNT2__MAM_D3MEM_DED_COUNT__SHIFT                                                             0x1e
+#define GCEA_EDC_CNT2__GMIRD_CMDMEM_SEC_COUNT_MASK                                                            0x00000003L
+#define GCEA_EDC_CNT2__GMIRD_CMDMEM_DED_COUNT_MASK                                                            0x0000000CL
+#define GCEA_EDC_CNT2__GMIWR_CMDMEM_SEC_COUNT_MASK                                                            0x00000030L
+#define GCEA_EDC_CNT2__GMIWR_CMDMEM_DED_COUNT_MASK                                                            0x000000C0L
+#define GCEA_EDC_CNT2__GMIWR_DATAMEM_SEC_COUNT_MASK                                                           0x00000300L
+#define GCEA_EDC_CNT2__GMIWR_DATAMEM_DED_COUNT_MASK                                                           0x00000C00L
+#define GCEA_EDC_CNT2__GMIRD_PAGEMEM_SED_COUNT_MASK                                                           0x00003000L
+#define GCEA_EDC_CNT2__GMIWR_PAGEMEM_SED_COUNT_MASK                                                           0x0000C000L
+#define GCEA_EDC_CNT2__MAM_D0MEM_SED_COUNT_MASK                                                               0x00030000L
+#define GCEA_EDC_CNT2__MAM_D1MEM_SED_COUNT_MASK                                                               0x000C0000L
+#define GCEA_EDC_CNT2__MAM_D2MEM_SED_COUNT_MASK                                                               0x00300000L
+#define GCEA_EDC_CNT2__MAM_D3MEM_SED_COUNT_MASK                                                               0x00C00000L
+#define GCEA_EDC_CNT2__MAM_D0MEM_DED_COUNT_MASK                                                               0x03000000L
+#define GCEA_EDC_CNT2__MAM_D1MEM_DED_COUNT_MASK                                                               0x0C000000L
+#define GCEA_EDC_CNT2__MAM_D2MEM_DED_COUNT_MASK                                                               0x30000000L
+#define GCEA_EDC_CNT2__MAM_D3MEM_DED_COUNT_MASK                                                               0xC0000000L
+//GCEA_EDC_CNT3
+#define GCEA_EDC_CNT3__DRAMRD_PAGEMEM_DED_COUNT__SHIFT                                                        0x0
+#define GCEA_EDC_CNT3__DRAMWR_PAGEMEM_DED_COUNT__SHIFT                                                        0x2
+#define GCEA_EDC_CNT3__IORD_CMDMEM_DED_COUNT__SHIFT                                                           0x4
+#define GCEA_EDC_CNT3__IOWR_CMDMEM_DED_COUNT__SHIFT                                                           0x6
+#define GCEA_EDC_CNT3__IOWR_DATAMEM_DED_COUNT__SHIFT                                                          0x8
+#define GCEA_EDC_CNT3__GMIRD_PAGEMEM_DED_COUNT__SHIFT                                                         0xa
+#define GCEA_EDC_CNT3__GMIWR_PAGEMEM_DED_COUNT__SHIFT                                                         0xc
+#define GCEA_EDC_CNT3__MAM_AFMEM_DED_COUNT__SHIFT                                                             0xe
+#define GCEA_EDC_CNT3__MAM_A0MEM_SEC_COUNT__SHIFT                                                             0x10
+#define GCEA_EDC_CNT3__MAM_A0MEM_DED_COUNT__SHIFT                                                             0x12
+#define GCEA_EDC_CNT3__MAM_A1MEM_SEC_COUNT__SHIFT                                                             0x14
+#define GCEA_EDC_CNT3__MAM_A1MEM_DED_COUNT__SHIFT                                                             0x16
+#define GCEA_EDC_CNT3__MAM_A2MEM_SEC_COUNT__SHIFT                                                             0x18
+#define GCEA_EDC_CNT3__MAM_A2MEM_DED_COUNT__SHIFT                                                             0x1a
+#define GCEA_EDC_CNT3__MAM_A3MEM_SEC_COUNT__SHIFT                                                             0x1c
+#define GCEA_EDC_CNT3__MAM_A3MEM_DED_COUNT__SHIFT                                                             0x1e
+#define GCEA_EDC_CNT3__DRAMRD_PAGEMEM_DED_COUNT_MASK                                                          0x00000003L
+#define GCEA_EDC_CNT3__DRAMWR_PAGEMEM_DED_COUNT_MASK                                                          0x0000000CL
+#define GCEA_EDC_CNT3__IORD_CMDMEM_DED_COUNT_MASK                                                             0x00000030L
+#define GCEA_EDC_CNT3__IOWR_CMDMEM_DED_COUNT_MASK                                                             0x000000C0L
+#define GCEA_EDC_CNT3__IOWR_DATAMEM_DED_COUNT_MASK                                                            0x00000300L
+#define GCEA_EDC_CNT3__GMIRD_PAGEMEM_DED_COUNT_MASK                                                           0x00000C00L
+#define GCEA_EDC_CNT3__GMIWR_PAGEMEM_DED_COUNT_MASK                                                           0x00003000L
+#define GCEA_EDC_CNT3__MAM_AFMEM_DED_COUNT_MASK                                                               0x0000C000L
+#define GCEA_EDC_CNT3__MAM_A0MEM_SEC_COUNT_MASK                                                               0x00030000L
+#define GCEA_EDC_CNT3__MAM_A0MEM_DED_COUNT_MASK                                                               0x000C0000L
+#define GCEA_EDC_CNT3__MAM_A1MEM_SEC_COUNT_MASK                                                               0x00300000L
+#define GCEA_EDC_CNT3__MAM_A1MEM_DED_COUNT_MASK                                                               0x00C00000L
+#define GCEA_EDC_CNT3__MAM_A2MEM_SEC_COUNT_MASK                                                               0x03000000L
+#define GCEA_EDC_CNT3__MAM_A2MEM_DED_COUNT_MASK                                                               0x0C000000L
+#define GCEA_EDC_CNT3__MAM_A3MEM_SEC_COUNT_MASK                                                               0x30000000L
+#define GCEA_EDC_CNT3__MAM_A3MEM_DED_COUNT_MASK                                                               0xC0000000L
+
+// addressBlock: gc_gfxudec
+//GRBM_GFX_INDEX
+#define GRBM_GFX_INDEX__INSTANCE_INDEX__SHIFT                                                                 0x0
+#define GRBM_GFX_INDEX__SH_INDEX__SHIFT                                                                       0x8
+#define GRBM_GFX_INDEX__SE_INDEX__SHIFT                                                                       0x10
+#define GRBM_GFX_INDEX__SH_BROADCAST_WRITES__SHIFT                                                            0x1d
+#define GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES__SHIFT                                                      0x1e
+#define GRBM_GFX_INDEX__SE_BROADCAST_WRITES__SHIFT                                                            0x1f
+#define GRBM_GFX_INDEX__INSTANCE_INDEX_MASK                                                                   0x000000FFL
+#define GRBM_GFX_INDEX__SH_INDEX_MASK                                                                         0x0000FF00L
+#define GRBM_GFX_INDEX__SE_INDEX_MASK                                                                         0x00FF0000L
+#define GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK                                                              0x20000000L
+#define GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK                                                        0x40000000L
+#define GRBM_GFX_INDEX__SE_BROADCAST_WRITES_MASK                                                              0x80000000L
+
+// addressBlock: gc_utcl2_atcl2dec
+//ATC_L2_CNTL
+//ATC_L2_CACHE_4K_DSM_INDEX
+#define ATC_L2_CACHE_4K_DSM_INDEX__INDEX__SHIFT                                                               0x0
+#define ATC_L2_CACHE_4K_DSM_INDEX__INDEX_MASK                                                                 0x000000FFL
+//ATC_L2_CACHE_2M_DSM_INDEX
+#define ATC_L2_CACHE_2M_DSM_INDEX__INDEX__SHIFT                                                               0x0
+#define ATC_L2_CACHE_2M_DSM_INDEX__INDEX_MASK                                                                 0x000000FFL
+//ATC_L2_CACHE_4K_DSM_CNTL
+#define ATC_L2_CACHE_4K_DSM_CNTL__SEC_COUNT__SHIFT                                                            0xd
+#define ATC_L2_CACHE_4K_DSM_CNTL__DED_COUNT__SHIFT                                                            0xf
+#define ATC_L2_CACHE_4K_DSM_CNTL__SEC_COUNT_MASK                                                              0x00006000L
+#define ATC_L2_CACHE_4K_DSM_CNTL__DED_COUNT_MASK                                                              0x00018000L
+//ATC_L2_CACHE_2M_DSM_CNTL
+#define ATC_L2_CACHE_2M_DSM_CNTL__SEC_COUNT__SHIFT                                                            0xd
+#define ATC_L2_CACHE_2M_DSM_CNTL__DED_COUNT__SHIFT                                                            0xf
+#define ATC_L2_CACHE_2M_DSM_CNTL__SEC_COUNT_MASK                                                              0x00006000L
+#define ATC_L2_CACHE_2M_DSM_CNTL__DED_COUNT_MASK                                                              0x00018000L
+
+// addressBlock: gc_utcl2_vml2pfdec
+//VML2_MEM_ECC_INDEX
+#define VML2_MEM_ECC_INDEX__INDEX__SHIFT                                                                      0x0
+#define VML2_MEM_ECC_INDEX__INDEX_MASK                                                                        0x000000FFL
+//VML2_WALKER_MEM_ECC_INDEX
+#define VML2_WALKER_MEM_ECC_INDEX__INDEX__SHIFT                                                               0x0
+#define VML2_WALKER_MEM_ECC_INDEX__INDEX_MASK                                                                 0x000000FFL
+//UTCL2_MEM_ECC_INDEX
+#define UTCL2_MEM_ECC_INDEX__INDEX__SHIFT                                                                     0x0
+#define UTCL2_MEM_ECC_INDEX__INDEX_MASK                                                                       0x000000FFL
+//VML2_MEM_ECC_CNTL
+#define VML2_MEM_ECC_CNTL__SEC_COUNT__SHIFT                                                                   0xc
+#define VML2_MEM_ECC_CNTL__DED_COUNT__SHIFT                                                                   0xe
+#define VML2_MEM_ECC_CNTL__SEC_COUNT_MASK                                                                     0x00003000L
+#define VML2_MEM_ECC_CNTL__DED_COUNT_MASK                                                                     0x0000C000L
+//VML2_WALKER_MEM_ECC_CNTL
+#define VML2_WALKER_MEM_ECC_CNTL__SEC_COUNT__SHIFT                                                            0xc
+#define VML2_WALKER_MEM_ECC_CNTL__DED_COUNT__SHIFT                                                            0xe
+#define VML2_WALKER_MEM_ECC_CNTL__SEC_COUNT_MASK                                                              0x00003000L
+#define VML2_WALKER_MEM_ECC_CNTL__DED_COUNT_MASK                                                              0x0000C000L
+//UTCL2_MEM_ECC_CNTL
+#define UTCL2_MEM_ECC_CNTL__SEC_COUNT__SHIFT                                                                  0xc
+#define UTCL2_MEM_ECC_CNTL__DED_COUNT__SHIFT                                                                  0xe
+#define UTCL2_MEM_ECC_CNTL__SEC_COUNT_MASK                                                                    0x00003000L
+#define UTCL2_MEM_ECC_CNTL__DED_COUNT_MASK                                                                    0x0000C000L
+
+// addressBlock: gc_rlcpdec
+//RLC_EDC_CNT
+#define RLC_EDC_CNT__RLCG_INSTR_RAM_SEC_COUNT__SHIFT                                                          0x0
+#define RLC_EDC_CNT__RLCG_INSTR_RAM_DED_COUNT__SHIFT                                                          0x2
+#define RLC_EDC_CNT__RLCG_SCRATCH_RAM_SEC_COUNT__SHIFT                                                        0x4
+#define RLC_EDC_CNT__RLCG_SCRATCH_RAM_DED_COUNT__SHIFT                                                        0x6
+#define RLC_EDC_CNT__RLCV_INSTR_RAM_SEC_COUNT__SHIFT                                                          0x8
+#define RLC_EDC_CNT__RLCV_INSTR_RAM_DED_COUNT__SHIFT                                                          0xa
+#define RLC_EDC_CNT__RLCV_SCRATCH_RAM_SEC_COUNT__SHIFT                                                        0xc
+#define RLC_EDC_CNT__RLCV_SCRATCH_RAM_DED_COUNT__SHIFT                                                        0xe
+#define RLC_EDC_CNT__RLC_TCTAG_RAM_SEC_COUNT__SHIFT                                                           0x10
+#define RLC_EDC_CNT__RLC_TCTAG_RAM_DED_COUNT__SHIFT                                                           0x12
+#define RLC_EDC_CNT__RLC_SPM_SCRATCH_RAM_SEC_COUNT__SHIFT                                                     0x14
+#define RLC_EDC_CNT__RLC_SPM_SCRATCH_RAM_DED_COUNT__SHIFT                                                      0x16
+#define RLC_EDC_CNT__RLC_SRM_DATA_RAM_SEC_COUNT__SHIFT                                                        0x18
+#define RLC_EDC_CNT__RLC_SRM_DATA_RAM_DED_COUNT__SHIFT                                                        0x1a
+#define RLC_EDC_CNT__RLC_SRM_ADDR_RAM_SEC_COUNT__SHIFT                                                        0x1c
+#define RLC_EDC_CNT__RLC_SRM_ADDR_RAM_DED_COUNT__SHIFT                                                        0x1e
+#define RLC_EDC_CNT__RLCG_INSTR_RAM_SEC_COUNT_MASK                                                            0x00000003L
+#define RLC_EDC_CNT__RLCG_INSTR_RAM_DED_COUNT_MASK                                                            0x0000000CL
+#define RLC_EDC_CNT__RLCG_SCRATCH_RAM_SEC_COUNT_MASK                                                          0x00000030L
+#define RLC_EDC_CNT__RLCG_SCRATCH_RAM_DED_COUNT_MASK                                                          0x000000C0L
+#define RLC_EDC_CNT__RLCV_INSTR_RAM_SEC_COUNT_MASK                                                            0x00000300L
+#define RLC_EDC_CNT__RLCV_INSTR_RAM_DED_COUNT_MASK                                                            0x00000C00L
+#define RLC_EDC_CNT__RLCV_SCRATCH_RAM_SEC_COUNT_MASK                                                          0x00003000L
+#define RLC_EDC_CNT__RLCV_SCRATCH_RAM_DED_COUNT_MASK                                                          0x0000C000L
+#define RLC_EDC_CNT__RLC_TCTAG_RAM_SEC_COUNT_MASK                                                             0x00030000L
+#define RLC_EDC_CNT__RLC_TCTAG_RAM_DED_COUNT_MASK                                                             0x000C0000L
+#define RLC_EDC_CNT__RLC_SPM_SCRATCH_RAM_SEC_COUNT_MASK                                                       0x00300000L
+#define RLC_EDC_CNT__RLC_SPM_SCRATCH_RAM_DED_COUNT_MASK                                                        0x00C00000L
+#define RLC_EDC_CNT__RLC_SRM_DATA_RAM_SEC_COUNT_MASK                                                          0x03000000L
+#define RLC_EDC_CNT__RLC_SRM_DATA_RAM_DED_COUNT_MASK                                                          0x0C000000L
+#define RLC_EDC_CNT__RLC_SRM_ADDR_RAM_SEC_COUNT_MASK                                                          0x30000000L
+#define RLC_EDC_CNT__RLC_SRM_ADDR_RAM_DED_COUNT_MASK                                                          0xC0000000L
+//RLC_EDC_CNT2
+#define RLC_EDC_CNT2__RLC_SPM_SE0_SCRATCH_RAM_SEC_COUNT__SHIFT                                                0x0
+#define RLC_EDC_CNT2__RLC_SPM_SE0_SCRATCH_RAM_DED_COUNT__SHIFT                                                0x2
+#define RLC_EDC_CNT2__RLC_SPM_SE1_SCRATCH_RAM_SEC_COUNT__SHIFT                                                0x4
+#define RLC_EDC_CNT2__RLC_SPM_SE1_SCRATCH_RAM_DED_COUNT__SHIFT                                                0x6
+#define RLC_EDC_CNT2__RLC_SPM_SE2_SCRATCH_RAM_SEC_COUNT__SHIFT                                                0x8
+#define RLC_EDC_CNT2__RLC_SPM_SE2_SCRATCH_RAM_DED_COUNT__SHIFT                                                0xa
+#define RLC_EDC_CNT2__RLC_SPM_SE3_SCRATCH_RAM_SEC_COUNT__SHIFT                                                0xc
+#define RLC_EDC_CNT2__RLC_SPM_SE3_SCRATCH_RAM_DED_COUNT__SHIFT                                                0xe
+#define RLC_EDC_CNT2__RLC_SPM_SE4_SCRATCH_RAM_SEC_COUNT__SHIFT                                                0x10
+#define RLC_EDC_CNT2__RLC_SPM_SE4_SCRATCH_RAM_DED_COUNT__SHIFT                                                0x12
+#define RLC_EDC_CNT2__RLC_SPM_SE5_SCRATCH_RAM_SEC_COUNT__SHIFT                                                0x14
+#define RLC_EDC_CNT2__RLC_SPM_SE5_SCRATCH_RAM_DED_COUNT__SHIFT                                                0x16
+#define RLC_EDC_CNT2__RLC_SPM_SE6_SCRATCH_RAM_SEC_COUNT__SHIFT                                                0x18
+#define RLC_EDC_CNT2__RLC_SPM_SE6_SCRATCH_RAM_DED_COUNT__SHIFT                                                0x1a
+#define RLC_EDC_CNT2__RLC_SPM_SE7_SCRATCH_RAM_SEC_COUNT__SHIFT                                                0x1c
+#define RLC_EDC_CNT2__RLC_SPM_SE7_SCRATCH_RAM_DED_COUNT__SHIFT                                                0x1e
+#define RLC_EDC_CNT2__RLC_SPM_SE0_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x00000003L
+#define RLC_EDC_CNT2__RLC_SPM_SE0_SCRATCH_RAM_DED_COUNT_MASK                                                  0x0000000CL
+#define RLC_EDC_CNT2__RLC_SPM_SE1_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x00000030L
+#define RLC_EDC_CNT2__RLC_SPM_SE1_SCRATCH_RAM_DED_COUNT_MASK                                                  0x000000C0L
+#define RLC_EDC_CNT2__RLC_SPM_SE2_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x00000300L
+#define RLC_EDC_CNT2__RLC_SPM_SE2_SCRATCH_RAM_DED_COUNT_MASK                                                  0x00000C00L
+#define RLC_EDC_CNT2__RLC_SPM_SE3_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x00003000L
+#define RLC_EDC_CNT2__RLC_SPM_SE3_SCRATCH_RAM_DED_COUNT_MASK                                                  0x0000C000L
+#define RLC_EDC_CNT2__RLC_SPM_SE4_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x00030000L
+#define RLC_EDC_CNT2__RLC_SPM_SE4_SCRATCH_RAM_DED_COUNT_MASK                                                  0x000C0000L
+#define RLC_EDC_CNT2__RLC_SPM_SE5_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x00300000L
+#define RLC_EDC_CNT2__RLC_SPM_SE5_SCRATCH_RAM_DED_COUNT_MASK                                                  0x00C00000L
+#define RLC_EDC_CNT2__RLC_SPM_SE6_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x03000000L
+#define RLC_EDC_CNT2__RLC_SPM_SE6_SCRATCH_RAM_DED_COUNT_MASK                                                  0x0C000000L
+#define RLC_EDC_CNT2__RLC_SPM_SE7_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x30000000L
+#define RLC_EDC_CNT2__RLC_SPM_SE7_SCRATCH_RAM_DED_COUNT_MASK                                                  0xC0000000L
+
+#endif
\ No newline at end of file
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

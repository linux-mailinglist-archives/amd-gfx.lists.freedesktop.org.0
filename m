Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F9811B483
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Dec 2019 16:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6643D6EB74;
	Wed, 11 Dec 2019 15:48:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F896EB77
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Dec 2019 15:46:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrPUtHcrIHNftj196QvWPBu2TvDAgdEfmyywRpRBpYqFVa9bIuej6UY5E0rNulml2EKZIJgvq2XtujXJSmyA68mLtWb8ByoN/l5b/L5TBzAXF6QqZ3kZhJb+27/5Zj2eYq/V4CLUB1CYUUqe5P8aSTx/E4Tf1werKSTB1/FStekHoAjaJGXk51cs4Is/i1lBpbXRfgUyplvqCfrArXZflIXM+flA4n8m1cZdpawkAnmgXeCS/vbSJ6Q+FTqd2+FQo02r6YBwUwybyWonaVxGSI0rtM5ISXqQ/rNL6XoM/F7DTdd1m05sRlqlkFrk3fg5yW02Im4tgQVVVCQs2FzjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5kyHPOrFYC2u2d3T1G0TVt7h6q5a1bP+KckbtdyNk4=;
 b=QSjm8zBhGY0SHWOEzlmGMSJaZTqOKIgxQyvgESuLSIHVXQFY8+IuuKnvkjQOc51diooG/60m1RytcxIU0gOIrH5M85P3GrcepVsvUS2Aajhe0G/myRRZq6bvsCVkjz3ri5q54azs60nejehRMx98AXgacCd4PkngOOBycUsB0FM/E3+BvqomLizmr25zazLMOnVuX8Vea/5YKDWao6+SdKVIyMQVyAxpjCzSgiqT0arRl9081AXZQxkZJJNOps4rgYyl8CQB//YX4ZA+zzngNO9xidnbSai+i9FHjekqhUBGmn5ePzb+GCkHgsqPuk7sNr80C7bHtXaMfzggqQwHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5kyHPOrFYC2u2d3T1G0TVt7h6q5a1bP+KckbtdyNk4=;
 b=m1Q2uwQS8/90OAnHsgaTrxYdts07NSJdw7cXcltWsjvryH535K9MOXEZR8dNIert7YNmO3glKxtJPtWda7wELtUaaSgd0N9iWbdKQCsRWx+Gy8hjUWpHOjfmVr3ELmiIBXOo0+hW44xhAC4rslvvnj4kJcXcSU+FxAAaRY2RrVo=
Received: from CY4PR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:910:16::32) by BN6PR12MB1457.namprd12.prod.outlook.com
 (2603:10b6:405:10::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Wed, 11 Dec
 2019 15:46:01 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::209) by CY4PR1201CA0022.outlook.office365.com
 (2603:10b6:910:16::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16 via Frontend
 Transport; Wed, 11 Dec 2019 15:46:00 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Wed, 11 Dec 2019 15:46:00 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Dec
 2019 09:45:57 -0600
Received: from roma-lnx-dev.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Dec 2019 09:45:57 -0600
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Alexander.Deucher@amd.com>,
 <Tony.Cheng@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH 1/3] drm/amdgpu: move dpcs headers to dpcs includes
Date: Wed, 11 Dec 2019 10:45:41 -0500
Message-ID: <1576079143-5675-1-git-send-email-Roman.Li@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(428003)(189003)(199004)(26005)(7696005)(70206006)(4326008)(186003)(70586007)(6636002)(30864003)(478600001)(54906003)(2616005)(8936002)(86362001)(356004)(6666004)(81166006)(2876002)(2906002)(8676002)(426003)(5660300002)(36756003)(110136005)(81156014)(336012)(316002)(2101003)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1457; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 452f32bf-ec18-4c0c-c77f-08d77e51388f
X-MS-TrafficTypeDiagnostic: BN6PR12MB1457:
X-Microsoft-Antispam-PRVS: <BN6PR12MB145708703D15F9652482D3C6895A0@BN6PR12MB1457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 024847EE92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1dG6ny1cLBoBBv7OTy73NxY+ZyZaKKoSJaYAbOVh9+c0IuF6JoXO58+SLsOIL0gVL0mo6OG5utvVJxUPiPqlI7FI6ziNhUWta0GIdqusTgD/9ySNrVWkt7O24ExKqwsn6RBITi7ahZdNxebdwhOvd31S1f5FV5TwALMc6Bwe7JAiBdbHCDNzwvxGMoRNPcapXARjUlXdsfXuLvX3BfdEh6ZJIzmVKNwWA+5f//unqo+xXj+GTFfKaBUgYn7uuJbgPeZUEsRYQLwKkdX01Bb7gx19MNKe6t6hs8J/meSoGRakObxwTAoxw9AKs/6aCvxNWmuiZps1caN6/Q9JYwdiq0jTx5cXqcgo53GGsbO9IdOgd7zyDYaqDfPmcI8C4yRjF9qbBVpz7SsOc5+cLXjRVfopTfGGvjyNPyO58r/5DGZE11omSPp1eAQSUAmu490TqOa+wbaYtdg2l3LLP5/8ZuRTOHn9rz8GfYXbFxTDkKTf1pXGfczwuu2XMVi1IGo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 15:46:00.0930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452f32bf-ec18-4c0c-c77f-08d77e51388f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1457
X-Mailman-Approved-At: Wed, 11 Dec 2019 15:48:35 +0000
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
Cc: sunpeng.li@amd.com, Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Roman Li <Roman.Li@amd.com>

- create dpcs directory for dpcs asic_reg headers
- move dpcs21 reg headers from dcn to dpcs directory

Signed-off-by: Roman Li <Roman.Li@amd.com>
---
 .../amd/include/asic_reg/dcn/dpcs_2_1_0_offset.h   |  565 ----
 .../amd/include/asic_reg/dcn/dpcs_2_1_0_sh_mask.h  | 3430 --------------------
 .../amd/include/asic_reg/dpcs/dpcs_2_1_0_offset.h  |  565 ++++
 .../amd/include/asic_reg/dpcs/dpcs_2_1_0_sh_mask.h | 3430 ++++++++++++++++++++
 4 files changed, 3995 insertions(+), 3995 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_2_1_0_offset.h
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_2_1_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_1_0_sh_mask.h

diff --git a/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_2_1_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_2_1_0_offset.h
deleted file mode 100644
index 945bb61..0000000
--- a/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_2_1_0_offset.h
+++ /dev/null
@@ -1,565 +0,0 @@
-/*
- * Copyright (C) 2019  Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included
- * in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
- * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- */
-#ifndef _dpcs_2_1_0_OFFSET_HEADER
-#define _dpcs_2_1_0_OFFSET_HEADER
-
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx0_dispdec
-// base address: 0x0
-#define mmDPCSTX0_DPCSTX_TX_CLOCK_CNTL                                                                 0x2928
-#define mmDPCSTX0_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
-#define mmDPCSTX0_DPCSTX_TX_CNTL                                                                       0x2929
-#define mmDPCSTX0_DPCSTX_TX_CNTL_BASE_IDX                                                              2
-#define mmDPCSTX0_DPCSTX_CBUS_CNTL                                                                     0x292a
-#define mmDPCSTX0_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
-#define mmDPCSTX0_DPCSTX_INTERRUPT_CNTL                                                                0x292b
-#define mmDPCSTX0_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
-#define mmDPCSTX0_DPCSTX_PLL_UPDATE_ADDR                                                               0x292c
-#define mmDPCSTX0_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
-#define mmDPCSTX0_DPCSTX_PLL_UPDATE_DATA                                                               0x292d
-#define mmDPCSTX0_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
-#define mmDPCSTX0_DPCSTX_DEBUG_CONFIG                                                                  0x292e
-#define mmDPCSTX0_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx0_dispdec
-// base address: 0x0
-#define mmRDPCSTX0_RDPCSTX_CNTL                                                                        0x2930
-#define mmRDPCSTX0_RDPCSTX_CNTL_BASE_IDX                                                               2
-#define mmRDPCSTX0_RDPCSTX_CLOCK_CNTL                                                                  0x2931
-#define mmRDPCSTX0_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_INTERRUPT_CONTROL                                                           0x2932
-#define mmRDPCSTX0_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
-#define mmRDPCSTX0_RDPCSTX_PLL_UPDATE_DATA                                                             0x2933
-#define mmRDPCSTX0_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
-#define mmRDPCSTX0_RDPCS_TX_CR_ADDR                                                                    0x2934
-#define mmRDPCSTX0_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
-#define mmRDPCSTX0_RDPCS_TX_CR_DATA                                                                    0x2935
-#define mmRDPCSTX0_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
-#define mmRDPCSTX0_RDPCS_TX_SRAM_CNTL                                                                  0x2936
-#define mmRDPCSTX0_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_SCRATCH                                                                     0x2937
-#define mmRDPCSTX0_RDPCSTX_SCRATCH_BASE_IDX                                                            2
-#define mmRDPCSTX0_RDPCSTX_SPARE                                                                       0x2938
-#define mmRDPCSTX0_RDPCSTX_SPARE_BASE_IDX                                                              2
-#define mmRDPCSTX0_RDPCSTX_CNTL2                                                                       0x2939
-#define mmRDPCSTX0_RDPCSTX_CNTL2_BASE_IDX                                                              2
-#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x293c
-#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
-#define mmRDPCSTX0_RDPCSTX_DEBUG_CONFIG                                                                0x293d
-#define mmRDPCSTX0_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL0                                                                   0x2940
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL1                                                                   0x2941
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL2                                                                   0x2942
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL3                                                                   0x2943
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL4                                                                   0x2944
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL5                                                                   0x2945
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL6                                                                   0x2946
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL7                                                                   0x2947
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL8                                                                   0x2948
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL9                                                                   0x2949
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL10                                                                  0x294a
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL11                                                                  0x294b
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL12                                                                  0x294c
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL13                                                                  0x294d
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL14                                                                  0x294e
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_PHY_FUSE0                                                                   0x294f
-#define mmRDPCSTX0_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_FUSE1                                                                   0x2950
-#define mmRDPCSTX0_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_FUSE2                                                                   0x2951
-#define mmRDPCSTX0_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_FUSE3                                                                   0x2952
-#define mmRDPCSTX0_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
-#define mmRDPCSTX0_RDPCSTX_PHY_RX_LD_VAL                                                               0x2953
-#define mmRDPCSTX0_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
-#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2954
-#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
-#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2955
-#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
-#define mmRDPCSTX0_RDPCSTX_DPALT_CONTROL_REG                                                           0x2956
-#define mmRDPCSTX0_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL15                                                                  0x2958
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL16                                                                  0x2959
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL17                                                                  0x295a
-#define mmRDPCSTX0_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
-#define mmRDPCSTX0_RDPCSTX_DEBUG_CONFIG2                                                               0x295b
-#define mmRDPCSTX0_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
-
-
-// addressBlock: dpcssys_dpcssys_cr0_dispdec
-// base address: 0x0
-#define mmDPCSSYS_CR0_DPCSSYS_CR_ADDR                                                                  0x2934
-#define mmDPCSSYS_CR0_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
-#define mmDPCSSYS_CR0_DPCSSYS_CR_DATA                                                                  0x2935
-#define mmDPCSSYS_CR0_DPCSSYS_CR_DATA_BASE_IDX                                                         2
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx1_dispdec
-// base address: 0x360
-#define mmDPCSTX1_DPCSTX_TX_CLOCK_CNTL                                                                 0x2a00
-#define mmDPCSTX1_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
-#define mmDPCSTX1_DPCSTX_TX_CNTL                                                                       0x2a01
-#define mmDPCSTX1_DPCSTX_TX_CNTL_BASE_IDX                                                              2
-#define mmDPCSTX1_DPCSTX_CBUS_CNTL                                                                     0x2a02
-#define mmDPCSTX1_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
-#define mmDPCSTX1_DPCSTX_INTERRUPT_CNTL                                                                0x2a03
-#define mmDPCSTX1_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
-#define mmDPCSTX1_DPCSTX_PLL_UPDATE_ADDR                                                               0x2a04
-#define mmDPCSTX1_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
-#define mmDPCSTX1_DPCSTX_PLL_UPDATE_DATA                                                               0x2a05
-#define mmDPCSTX1_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
-#define mmDPCSTX1_DPCSTX_DEBUG_CONFIG                                                                  0x2a06
-#define mmDPCSTX1_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx1_dispdec
-// base address: 0x360
-#define mmRDPCSTX1_RDPCSTX_CNTL                                                                        0x2a08
-#define mmRDPCSTX1_RDPCSTX_CNTL_BASE_IDX                                                               2
-#define mmRDPCSTX1_RDPCSTX_CLOCK_CNTL                                                                  0x2a09
-#define mmRDPCSTX1_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_INTERRUPT_CONTROL                                                           0x2a0a
-#define mmRDPCSTX1_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
-#define mmRDPCSTX1_RDPCSTX_PLL_UPDATE_DATA                                                             0x2a0b
-#define mmRDPCSTX1_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
-#define mmRDPCSTX1_RDPCS_TX_CR_ADDR                                                                    0x2a0c
-#define mmRDPCSTX1_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
-#define mmRDPCSTX1_RDPCS_TX_CR_DATA                                                                    0x2a0d
-#define mmRDPCSTX1_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
-#define mmRDPCSTX1_RDPCS_TX_SRAM_CNTL                                                                  0x2a0e
-#define mmRDPCSTX1_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_SCRATCH                                                                     0x2a0f
-#define mmRDPCSTX1_RDPCSTX_SCRATCH_BASE_IDX                                                            2
-#define mmRDPCSTX1_RDPCSTX_SPARE                                                                       0x2a10
-#define mmRDPCSTX1_RDPCSTX_SPARE_BASE_IDX                                                              2
-#define mmRDPCSTX1_RDPCSTX_CNTL2                                                                       0x2a11
-#define mmRDPCSTX1_RDPCSTX_CNTL2_BASE_IDX                                                              2
-#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x2a14
-#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
-#define mmRDPCSTX1_RDPCSTX_DEBUG_CONFIG                                                                0x2a15
-#define mmRDPCSTX1_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL0                                                                   0x2a18
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL1                                                                   0x2a19
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL2                                                                   0x2a1a
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL3                                                                   0x2a1b
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL4                                                                   0x2a1c
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL5                                                                   0x2a1d
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL6                                                                   0x2a1e
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL7                                                                   0x2a1f
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL8                                                                   0x2a20
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL9                                                                   0x2a21
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL10                                                                  0x2a22
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL11                                                                  0x2a23
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL12                                                                  0x2a24
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL13                                                                  0x2a25
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL14                                                                  0x2a26
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_PHY_FUSE0                                                                   0x2a27
-#define mmRDPCSTX1_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_FUSE1                                                                   0x2a28
-#define mmRDPCSTX1_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_FUSE2                                                                   0x2a29
-#define mmRDPCSTX1_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_FUSE3                                                                   0x2a2a
-#define mmRDPCSTX1_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
-#define mmRDPCSTX1_RDPCSTX_PHY_RX_LD_VAL                                                               0x2a2b
-#define mmRDPCSTX1_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
-#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2a2c
-#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
-#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2a2d
-#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
-#define mmRDPCSTX1_RDPCSTX_DPALT_CONTROL_REG                                                           0x2a2e
-#define mmRDPCSTX1_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL15                                                                  0x2a30
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL16                                                                  0x2a31
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL17                                                                  0x2a32
-#define mmRDPCSTX1_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
-#define mmRDPCSTX1_RDPCSTX_DEBUG_CONFIG2                                                               0x2a33
-#define mmRDPCSTX1_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
-
-
-// addressBlock: dpcssys_dpcssys_cr1_dispdec
-// base address: 0x360
-#define mmDPCSSYS_CR1_DPCSSYS_CR_ADDR                                                                  0x2a0c
-#define mmDPCSSYS_CR1_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
-#define mmDPCSSYS_CR1_DPCSSYS_CR_DATA                                                                  0x2a0d
-#define mmDPCSSYS_CR1_DPCSSYS_CR_DATA_BASE_IDX                                                         2
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx2_dispdec
-// base address: 0x6c0
-#define mmDPCSTX2_DPCSTX_TX_CLOCK_CNTL                                                                 0x2ad8
-#define mmDPCSTX2_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
-#define mmDPCSTX2_DPCSTX_TX_CNTL                                                                       0x2ad9
-#define mmDPCSTX2_DPCSTX_TX_CNTL_BASE_IDX                                                              2
-#define mmDPCSTX2_DPCSTX_CBUS_CNTL                                                                     0x2ada
-#define mmDPCSTX2_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
-#define mmDPCSTX2_DPCSTX_INTERRUPT_CNTL                                                                0x2adb
-#define mmDPCSTX2_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
-#define mmDPCSTX2_DPCSTX_PLL_UPDATE_ADDR                                                               0x2adc
-#define mmDPCSTX2_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
-#define mmDPCSTX2_DPCSTX_PLL_UPDATE_DATA                                                               0x2add
-#define mmDPCSTX2_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
-#define mmDPCSTX2_DPCSTX_DEBUG_CONFIG                                                                  0x2ade
-#define mmDPCSTX2_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx2_dispdec
-// base address: 0x6c0
-#define mmRDPCSTX2_RDPCSTX_CNTL                                                                        0x2ae0
-#define mmRDPCSTX2_RDPCSTX_CNTL_BASE_IDX                                                               2
-#define mmRDPCSTX2_RDPCSTX_CLOCK_CNTL                                                                  0x2ae1
-#define mmRDPCSTX2_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_INTERRUPT_CONTROL                                                           0x2ae2
-#define mmRDPCSTX2_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
-#define mmRDPCSTX2_RDPCSTX_PLL_UPDATE_DATA                                                             0x2ae3
-#define mmRDPCSTX2_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
-#define mmRDPCSTX2_RDPCS_TX_CR_ADDR                                                                    0x2ae4
-#define mmRDPCSTX2_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
-#define mmRDPCSTX2_RDPCS_TX_CR_DATA                                                                    0x2ae5
-#define mmRDPCSTX2_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
-#define mmRDPCSTX2_RDPCS_TX_SRAM_CNTL                                                                  0x2ae6
-#define mmRDPCSTX2_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_SCRATCH                                                                     0x2ae7
-#define mmRDPCSTX2_RDPCSTX_SCRATCH_BASE_IDX                                                            2
-#define mmRDPCSTX2_RDPCSTX_SPARE                                                                       0x2ae8
-#define mmRDPCSTX2_RDPCSTX_SPARE_BASE_IDX                                                              2
-#define mmRDPCSTX2_RDPCSTX_CNTL2                                                                       0x2ae9
-#define mmRDPCSTX2_RDPCSTX_CNTL2_BASE_IDX                                                              2
-#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x2aec
-#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
-#define mmRDPCSTX2_RDPCSTX_DEBUG_CONFIG                                                                0x2aed
-#define mmRDPCSTX2_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL0                                                                   0x2af0
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL1                                                                   0x2af1
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL2                                                                   0x2af2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL3                                                                   0x2af3
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL4                                                                   0x2af4
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL5                                                                   0x2af5
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL6                                                                   0x2af6
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL7                                                                   0x2af7
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL8                                                                   0x2af8
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL9                                                                   0x2af9
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL10                                                                  0x2afa
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL11                                                                  0x2afb
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL12                                                                  0x2afc
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL13                                                                  0x2afd
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL14                                                                  0x2afe
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_PHY_FUSE0                                                                   0x2aff
-#define mmRDPCSTX2_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_FUSE1                                                                   0x2b00
-#define mmRDPCSTX2_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_FUSE2                                                                   0x2b01
-#define mmRDPCSTX2_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_FUSE3                                                                   0x2b02
-#define mmRDPCSTX2_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
-#define mmRDPCSTX2_RDPCSTX_PHY_RX_LD_VAL                                                               0x2b03
-#define mmRDPCSTX2_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
-#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2b04
-#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
-#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2b05
-#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
-#define mmRDPCSTX2_RDPCSTX_DPALT_CONTROL_REG                                                           0x2b06
-#define mmRDPCSTX2_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL15                                                                  0x2b08
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL16                                                                  0x2b09
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL17                                                                  0x2b0a
-#define mmRDPCSTX2_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
-#define mmRDPCSTX2_RDPCSTX_DEBUG_CONFIG2                                                               0x2b0b
-#define mmRDPCSTX2_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
-
-
-// addressBlock: dpcssys_dpcssys_cr2_dispdec
-// base address: 0x6c0
-#define mmDPCSSYS_CR2_DPCSSYS_CR_ADDR                                                                  0x2ae4
-#define mmDPCSSYS_CR2_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
-#define mmDPCSSYS_CR2_DPCSSYS_CR_DATA                                                                  0x2ae5
-#define mmDPCSSYS_CR2_DPCSSYS_CR_DATA_BASE_IDX                                                         2
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx3_dispdec
-// base address: 0xa20
-#define mmDPCSTX3_DPCSTX_TX_CLOCK_CNTL                                                                 0x2bb0
-#define mmDPCSTX3_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
-#define mmDPCSTX3_DPCSTX_TX_CNTL                                                                       0x2bb1
-#define mmDPCSTX3_DPCSTX_TX_CNTL_BASE_IDX                                                              2
-#define mmDPCSTX3_DPCSTX_CBUS_CNTL                                                                     0x2bb2
-#define mmDPCSTX3_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
-#define mmDPCSTX3_DPCSTX_INTERRUPT_CNTL                                                                0x2bb3
-#define mmDPCSTX3_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
-#define mmDPCSTX3_DPCSTX_PLL_UPDATE_ADDR                                                               0x2bb4
-#define mmDPCSTX3_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
-#define mmDPCSTX3_DPCSTX_PLL_UPDATE_DATA                                                               0x2bb5
-#define mmDPCSTX3_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
-#define mmDPCSTX3_DPCSTX_DEBUG_CONFIG                                                                  0x2bb6
-#define mmDPCSTX3_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx3_dispdec
-// base address: 0xa20
-#define mmRDPCSTX3_RDPCSTX_CNTL                                                                        0x2bb8
-#define mmRDPCSTX3_RDPCSTX_CNTL_BASE_IDX                                                               2
-#define mmRDPCSTX3_RDPCSTX_CLOCK_CNTL                                                                  0x2bb9
-#define mmRDPCSTX3_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_INTERRUPT_CONTROL                                                           0x2bba
-#define mmRDPCSTX3_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
-#define mmRDPCSTX3_RDPCSTX_PLL_UPDATE_DATA                                                             0x2bbb
-#define mmRDPCSTX3_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
-#define mmRDPCSTX3_RDPCS_TX_CR_ADDR                                                                    0x2bbc
-#define mmRDPCSTX3_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
-#define mmRDPCSTX3_RDPCS_TX_CR_DATA                                                                    0x2bbd
-#define mmRDPCSTX3_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
-#define mmRDPCSTX3_RDPCS_TX_SRAM_CNTL                                                                  0x2bbe
-#define mmRDPCSTX3_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_SCRATCH                                                                     0x2bbf
-#define mmRDPCSTX3_RDPCSTX_SCRATCH_BASE_IDX                                                            2
-#define mmRDPCSTX3_RDPCSTX_SPARE                                                                       0x2bc0
-#define mmRDPCSTX3_RDPCSTX_SPARE_BASE_IDX                                                              2
-#define mmRDPCSTX3_RDPCSTX_CNTL2                                                                       0x2bc1
-#define mmRDPCSTX3_RDPCSTX_CNTL2_BASE_IDX                                                              2
-#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x2bc4
-#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
-#define mmRDPCSTX3_RDPCSTX_DEBUG_CONFIG                                                                0x2bc5
-#define mmRDPCSTX3_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL0                                                                   0x2bc8
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL1                                                                   0x2bc9
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL2                                                                   0x2bca
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL3                                                                   0x2bcb
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL4                                                                   0x2bcc
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL5                                                                   0x2bcd
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL6                                                                   0x2bce
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL7                                                                   0x2bcf
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL8                                                                   0x2bd0
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL9                                                                   0x2bd1
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL10                                                                  0x2bd2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL11                                                                  0x2bd3
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL12                                                                  0x2bd4
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL13                                                                  0x2bd5
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL14                                                                  0x2bd6
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_PHY_FUSE0                                                                   0x2bd7
-#define mmRDPCSTX3_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_FUSE1                                                                   0x2bd8
-#define mmRDPCSTX3_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_FUSE2                                                                   0x2bd9
-#define mmRDPCSTX3_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_FUSE3                                                                   0x2bda
-#define mmRDPCSTX3_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
-#define mmRDPCSTX3_RDPCSTX_PHY_RX_LD_VAL                                                               0x2bdb
-#define mmRDPCSTX3_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
-#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2bdc
-#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
-#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2bdd
-#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
-#define mmRDPCSTX3_RDPCSTX_DPALT_CONTROL_REG                                                           0x2bde
-#define mmRDPCSTX3_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL15                                                                  0x2be0
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL16                                                                  0x2be1
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL17                                                                  0x2be2
-#define mmRDPCSTX3_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
-#define mmRDPCSTX3_RDPCSTX_DEBUG_CONFIG2                                                               0x2be3
-#define mmRDPCSTX3_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
-
-
-// addressBlock: dpcssys_dpcssys_cr3_dispdec
-// base address: 0xa20
-#define mmDPCSSYS_CR3_DPCSSYS_CR_ADDR                                                                  0x2bbc
-#define mmDPCSSYS_CR3_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
-#define mmDPCSSYS_CR3_DPCSSYS_CR_DATA                                                                  0x2bbd
-#define mmDPCSSYS_CR3_DPCSSYS_CR_DATA_BASE_IDX                                                         2
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx4_dispdec
-// base address: 0xd80
-#define mmDPCSTX4_DPCSTX_TX_CLOCK_CNTL                                                                 0x2c88
-#define mmDPCSTX4_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
-#define mmDPCSTX4_DPCSTX_TX_CNTL                                                                       0x2c89
-#define mmDPCSTX4_DPCSTX_TX_CNTL_BASE_IDX                                                              2
-#define mmDPCSTX4_DPCSTX_CBUS_CNTL                                                                     0x2c8a
-#define mmDPCSTX4_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
-#define mmDPCSTX4_DPCSTX_INTERRUPT_CNTL                                                                0x2c8b
-#define mmDPCSTX4_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
-#define mmDPCSTX4_DPCSTX_PLL_UPDATE_ADDR                                                               0x2c8c
-#define mmDPCSTX4_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
-#define mmDPCSTX4_DPCSTX_PLL_UPDATE_DATA                                                               0x2c8d
-#define mmDPCSTX4_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
-#define mmDPCSTX4_DPCSTX_DEBUG_CONFIG                                                                  0x2c8e
-#define mmDPCSTX4_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx4_dispdec
-// base address: 0xd80
-#define mmRDPCSTX4_RDPCSTX_CNTL                                                                        0x2c90
-#define mmRDPCSTX4_RDPCSTX_CNTL_BASE_IDX                                                               2
-#define mmRDPCSTX4_RDPCSTX_CLOCK_CNTL                                                                  0x2c91
-#define mmRDPCSTX4_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_INTERRUPT_CONTROL                                                           0x2c92
-#define mmRDPCSTX4_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
-#define mmRDPCSTX4_RDPCSTX_PLL_UPDATE_DATA                                                             0x2c93
-#define mmRDPCSTX4_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
-#define mmRDPCSTX4_RDPCS_TX_CR_ADDR                                                                    0x2c94
-#define mmRDPCSTX4_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
-#define mmRDPCSTX4_RDPCS_TX_CR_DATA                                                                    0x2c95
-#define mmRDPCSTX4_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
-#define mmRDPCSTX4_RDPCS_TX_SRAM_CNTL                                                                  0x2c96
-#define mmRDPCSTX4_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_SCRATCH                                                                     0x2c97
-#define mmRDPCSTX4_RDPCSTX_SCRATCH_BASE_IDX                                                            2
-#define mmRDPCSTX4_RDPCSTX_SPARE                                                                       0x2c98
-#define mmRDPCSTX4_RDPCSTX_SPARE_BASE_IDX                                                              2
-#define mmRDPCSTX4_RDPCSTX_CNTL2                                                                       0x2c99
-#define mmRDPCSTX4_RDPCSTX_CNTL2_BASE_IDX                                                              2
-#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x2c9c
-#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
-#define mmRDPCSTX4_RDPCSTX_DEBUG_CONFIG                                                                0x2c9d
-#define mmRDPCSTX4_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL0                                                                   0x2ca0
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL1                                                                   0x2ca1
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL2                                                                   0x2ca2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL3                                                                   0x2ca3
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL4                                                                   0x2ca4
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL5                                                                   0x2ca5
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL6                                                                   0x2ca6
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL7                                                                   0x2ca7
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL8                                                                   0x2ca8
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL9                                                                   0x2ca9
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL10                                                                  0x2caa
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL11                                                                  0x2cab
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL12                                                                  0x2cac
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL13                                                                  0x2cad
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL14                                                                  0x2cae
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_PHY_FUSE0                                                                   0x2caf
-#define mmRDPCSTX4_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_FUSE1                                                                   0x2cb0
-#define mmRDPCSTX4_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_FUSE2                                                                   0x2cb1
-#define mmRDPCSTX4_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_FUSE3                                                                   0x2cb2
-#define mmRDPCSTX4_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
-#define mmRDPCSTX4_RDPCSTX_PHY_RX_LD_VAL                                                               0x2cb3
-#define mmRDPCSTX4_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
-#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2cb4
-#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
-#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2cb5
-#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
-#define mmRDPCSTX4_RDPCSTX_DPALT_CONTROL_REG                                                           0x2cb6
-#define mmRDPCSTX4_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL15                                                                  0x2cb8
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL16                                                                  0x2cb9
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL17                                                                  0x2cba
-#define mmRDPCSTX4_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
-#define mmRDPCSTX4_RDPCSTX_DEBUG_CONFIG2                                                               0x2cbb
-#define mmRDPCSTX4_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
-
-
-// addressBlock: dpcssys_dpcssys_cr4_dispdec
-// base address: 0xd80
-#define mmDPCSSYS_CR4_DPCSSYS_CR_ADDR                                                                  0x2c94
-#define mmDPCSSYS_CR4_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
-#define mmDPCSSYS_CR4_DPCSSYS_CR_DATA                                                                  0x2c95
-#define mmDPCSSYS_CR4_DPCSSYS_CR_DATA_BASE_IDX                                                         2
-
-#endif
diff --git a/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_2_1_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_2_1_0_sh_mask.h
deleted file mode 100644
index 6e039f2..0000000
--- a/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_2_1_0_sh_mask.h
+++ /dev/null
@@ -1,3430 +0,0 @@
-/*
- * Copyright (C) 2019  Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included
- * in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
- * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- */
-#ifndef _dpcs_2_1_0_SH_MASK_HEADER
-#define _dpcs_2_1_0_SH_MASK_HEADER
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx0_dispdec
-//DPCSTX0_DPCSTX_TX_CLOCK_CNTL
-#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
-#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
-#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
-#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
-#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
-#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
-#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
-#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
-//DPCSTX0_DPCSTX_TX_CNTL
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
-#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//DPCSTX0_DPCSTX_CBUS_CNTL
-#define DPCSTX0_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
-#define DPCSTX0_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
-#define DPCSTX0_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
-#define DPCSTX0_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
-//DPCSTX0_DPCSTX_INTERRUPT_CNTL
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
-#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
-//DPCSTX0_DPCSTX_PLL_UPDATE_ADDR
-#define DPCSTX0_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
-#define DPCSTX0_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
-//DPCSTX0_DPCSTX_PLL_UPDATE_DATA
-#define DPCSTX0_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
-#define DPCSTX0_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
-//DPCSTX0_DPCSTX_DEBUG_CONFIG
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
-#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
-
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx0_dispdec
-//RDPCSTX0_RDPCSTX_CNTL
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
-#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//RDPCSTX0_RDPCSTX_CLOCK_CNTL
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
-#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
-//RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
-#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
-//RDPCSTX0_RDPCSTX_PLL_UPDATE_DATA
-#define RDPCSTX0_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
-#define RDPCSTX0_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
-//RDPCSTX0_RDPCS_TX_CR_ADDR
-#define RDPCSTX0_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
-#define RDPCSTX0_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
-//RDPCSTX0_RDPCS_TX_CR_DATA
-#define RDPCSTX0_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
-#define RDPCSTX0_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
-//RDPCSTX0_RDPCS_TX_SRAM_CNTL
-#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
-#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
-#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
-#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
-#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
-#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
-//RDPCSTX0_RDPCSTX_SCRATCH
-#define RDPCSTX0_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
-#define RDPCSTX0_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
-//RDPCSTX0_RDPCSTX_SPARE
-#define RDPCSTX0_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
-#define RDPCSTX0_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
-//RDPCSTX0_RDPCSTX_CNTL2
-#define RDPCSTX0_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
-#define RDPCSTX0_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
-#define RDPCSTX0_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
-#define RDPCSTX0_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
-//RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
-//RDPCSTX0_RDPCSTX_DEBUG_CONFIG
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL1
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
-//RDPCSTX0_RDPCSTX_PHY_CNTL2
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
-//RDPCSTX0_RDPCSTX_PHY_CNTL3
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL5
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL6
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL7
-#define RDPCSTX0_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
-#define RDPCSTX0_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
-#define RDPCSTX0_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL8
-#define RDPCSTX0_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
-//RDPCSTX0_RDPCSTX_PHY_CNTL9
-#define RDPCSTX0_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
-#define RDPCSTX0_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
-#define RDPCSTX0_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL10
-#define RDPCSTX0_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
-//RDPCSTX0_RDPCSTX_PHY_CNTL11
-#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
-#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
-#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
-#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL12
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
-//RDPCSTX0_RDPCSTX_PHY_CNTL13
-#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
-#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
-#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
-#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
-#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL14
-#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
-#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
-#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
-//RDPCSTX0_RDPCSTX_PHY_FUSE0
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
-//RDPCSTX0_RDPCSTX_PHY_FUSE1
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
-//RDPCSTX0_RDPCSTX_PHY_FUSE2
-#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
-#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
-//RDPCSTX0_RDPCSTX_PHY_FUSE3
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
-#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
-//RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL
-#define RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
-#define RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
-#define RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
-#define RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
-//RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
-//RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
-#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
-//RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG
-#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
-#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
-#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
-#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
-#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
-#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
-//RDPCSTX0_RDPCSTX_PHY_CNTL15
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL16
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
-//RDPCSTX0_RDPCSTX_PHY_CNTL17
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
-#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
-//RDPCSTX0_RDPCSTX_DEBUG_CONFIG2
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
-#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
-
-
-// addressBlock: dpcssys_dpcssys_cr0_dispdec
-//DPCSSYS_CR0_DPCSSYS_CR_ADDR
-#define DPCSSYS_CR0_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
-#define DPCSSYS_CR0_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
-//DPCSSYS_CR0_DPCSSYS_CR_DATA
-#define DPCSSYS_CR0_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
-#define DPCSSYS_CR0_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx1_dispdec
-//DPCSTX1_DPCSTX_TX_CLOCK_CNTL
-#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
-#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
-#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
-#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
-#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
-#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
-#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
-#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
-//DPCSTX1_DPCSTX_TX_CNTL
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
-#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//DPCSTX1_DPCSTX_CBUS_CNTL
-#define DPCSTX1_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
-#define DPCSTX1_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
-#define DPCSTX1_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
-#define DPCSTX1_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
-//DPCSTX1_DPCSTX_INTERRUPT_CNTL
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
-#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
-//DPCSTX1_DPCSTX_PLL_UPDATE_ADDR
-#define DPCSTX1_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
-#define DPCSTX1_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
-//DPCSTX1_DPCSTX_PLL_UPDATE_DATA
-#define DPCSTX1_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
-#define DPCSTX1_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
-//DPCSTX1_DPCSTX_DEBUG_CONFIG
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
-#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx1_dispdec
-//RDPCSTX1_RDPCSTX_CNTL
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
-#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//RDPCSTX1_RDPCSTX_CLOCK_CNTL
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
-#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
-//RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
-#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
-//RDPCSTX1_RDPCSTX_PLL_UPDATE_DATA
-#define RDPCSTX1_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
-#define RDPCSTX1_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
-//RDPCSTX1_RDPCS_TX_CR_ADDR
-#define RDPCSTX1_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
-#define RDPCSTX1_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
-//RDPCSTX1_RDPCS_TX_CR_DATA
-#define RDPCSTX1_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
-#define RDPCSTX1_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
-//RDPCSTX1_RDPCS_TX_SRAM_CNTL
-#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
-#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
-#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
-#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
-#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
-#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
-//RDPCSTX1_RDPCSTX_SCRATCH
-#define RDPCSTX1_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
-#define RDPCSTX1_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
-//RDPCSTX1_RDPCSTX_SPARE
-#define RDPCSTX1_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
-#define RDPCSTX1_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
-//RDPCSTX1_RDPCSTX_CNTL2
-#define RDPCSTX1_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
-#define RDPCSTX1_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
-#define RDPCSTX1_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
-#define RDPCSTX1_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
-//RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
-//RDPCSTX1_RDPCSTX_DEBUG_CONFIG
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL1
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
-//RDPCSTX1_RDPCSTX_PHY_CNTL2
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
-//RDPCSTX1_RDPCSTX_PHY_CNTL3
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL5
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL6
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL7
-#define RDPCSTX1_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
-#define RDPCSTX1_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
-#define RDPCSTX1_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL8
-#define RDPCSTX1_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
-//RDPCSTX1_RDPCSTX_PHY_CNTL9
-#define RDPCSTX1_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
-#define RDPCSTX1_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
-#define RDPCSTX1_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL10
-#define RDPCSTX1_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
-//RDPCSTX1_RDPCSTX_PHY_CNTL11
-#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
-#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
-#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
-#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL12
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
-//RDPCSTX1_RDPCSTX_PHY_CNTL13
-#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
-#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
-#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
-#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
-#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL14
-#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
-#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
-#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
-//RDPCSTX1_RDPCSTX_PHY_FUSE0
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
-//RDPCSTX1_RDPCSTX_PHY_FUSE1
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
-//RDPCSTX1_RDPCSTX_PHY_FUSE2
-#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
-#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
-//RDPCSTX1_RDPCSTX_PHY_FUSE3
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
-#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
-//RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL
-#define RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
-#define RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
-#define RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
-#define RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
-//RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
-//RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
-#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
-//RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG
-#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
-#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
-#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
-#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
-#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
-#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
-//RDPCSTX1_RDPCSTX_PHY_CNTL15
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL16
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
-//RDPCSTX1_RDPCSTX_PHY_CNTL17
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
-#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
-//RDPCSTX1_RDPCSTX_DEBUG_CONFIG2
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
-#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
-
-
-// addressBlock: dpcssys_dpcssys_cr1_dispdec
-//DPCSSYS_CR1_DPCSSYS_CR_ADDR
-#define DPCSSYS_CR1_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
-#define DPCSSYS_CR1_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
-//DPCSSYS_CR1_DPCSSYS_CR_DATA
-#define DPCSSYS_CR1_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
-#define DPCSSYS_CR1_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx2_dispdec
-//DPCSTX2_DPCSTX_TX_CLOCK_CNTL
-#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
-#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
-#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
-#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
-#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
-#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
-#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
-#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
-//DPCSTX2_DPCSTX_TX_CNTL
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
-#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//DPCSTX2_DPCSTX_CBUS_CNTL
-#define DPCSTX2_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
-#define DPCSTX2_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
-#define DPCSTX2_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
-#define DPCSTX2_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
-//DPCSTX2_DPCSTX_INTERRUPT_CNTL
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
-#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
-//DPCSTX2_DPCSTX_PLL_UPDATE_ADDR
-#define DPCSTX2_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
-#define DPCSTX2_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
-//DPCSTX2_DPCSTX_PLL_UPDATE_DATA
-#define DPCSTX2_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
-#define DPCSTX2_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
-//DPCSTX2_DPCSTX_DEBUG_CONFIG
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
-#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx2_dispdec
-//RDPCSTX2_RDPCSTX_CNTL
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
-#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//RDPCSTX2_RDPCSTX_CLOCK_CNTL
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
-#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
-//RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
-#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
-//RDPCSTX2_RDPCSTX_PLL_UPDATE_DATA
-#define RDPCSTX2_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
-#define RDPCSTX2_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
-//RDPCSTX2_RDPCS_TX_CR_ADDR
-#define RDPCSTX2_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
-#define RDPCSTX2_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
-//RDPCSTX2_RDPCS_TX_CR_DATA
-#define RDPCSTX2_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
-#define RDPCSTX2_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
-//RDPCSTX2_RDPCS_TX_SRAM_CNTL
-#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
-#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
-#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
-#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
-#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
-#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
-//RDPCSTX2_RDPCSTX_SCRATCH
-#define RDPCSTX2_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
-#define RDPCSTX2_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
-//RDPCSTX2_RDPCSTX_SPARE
-#define RDPCSTX2_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
-#define RDPCSTX2_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
-//RDPCSTX2_RDPCSTX_CNTL2
-#define RDPCSTX2_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
-#define RDPCSTX2_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
-#define RDPCSTX2_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
-#define RDPCSTX2_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
-//RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
-//RDPCSTX2_RDPCSTX_DEBUG_CONFIG
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL1
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
-//RDPCSTX2_RDPCSTX_PHY_CNTL2
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
-//RDPCSTX2_RDPCSTX_PHY_CNTL3
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL5
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL6
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL7
-#define RDPCSTX2_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
-#define RDPCSTX2_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
-#define RDPCSTX2_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL8
-#define RDPCSTX2_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
-//RDPCSTX2_RDPCSTX_PHY_CNTL9
-#define RDPCSTX2_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
-#define RDPCSTX2_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
-#define RDPCSTX2_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL10
-#define RDPCSTX2_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
-//RDPCSTX2_RDPCSTX_PHY_CNTL11
-#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
-#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
-#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
-#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL12
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
-//RDPCSTX2_RDPCSTX_PHY_CNTL13
-#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
-#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
-#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
-#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
-#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL14
-#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
-#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
-#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
-//RDPCSTX2_RDPCSTX_PHY_FUSE0
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
-//RDPCSTX2_RDPCSTX_PHY_FUSE1
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
-//RDPCSTX2_RDPCSTX_PHY_FUSE2
-#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
-#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
-//RDPCSTX2_RDPCSTX_PHY_FUSE3
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
-#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
-//RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL
-#define RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
-#define RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
-#define RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
-#define RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
-//RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
-//RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
-#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
-//RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG
-#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
-#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
-#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
-#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
-#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
-#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
-//RDPCSTX2_RDPCSTX_PHY_CNTL15
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL16
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
-//RDPCSTX2_RDPCSTX_PHY_CNTL17
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
-#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
-//RDPCSTX2_RDPCSTX_DEBUG_CONFIG2
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
-#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
-
-
-// addressBlock: dpcssys_dpcssys_cr2_dispdec
-//DPCSSYS_CR2_DPCSSYS_CR_ADDR
-#define DPCSSYS_CR2_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
-#define DPCSSYS_CR2_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
-//DPCSSYS_CR2_DPCSSYS_CR_DATA
-#define DPCSSYS_CR2_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
-#define DPCSSYS_CR2_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx3_dispdec
-//DPCSTX3_DPCSTX_TX_CLOCK_CNTL
-#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
-#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
-#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
-#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
-#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
-#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
-#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
-#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
-//DPCSTX3_DPCSTX_TX_CNTL
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
-#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//DPCSTX3_DPCSTX_CBUS_CNTL
-#define DPCSTX3_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
-#define DPCSTX3_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
-#define DPCSTX3_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
-#define DPCSTX3_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
-//DPCSTX3_DPCSTX_INTERRUPT_CNTL
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
-#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
-//DPCSTX3_DPCSTX_PLL_UPDATE_ADDR
-#define DPCSTX3_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
-#define DPCSTX3_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
-//DPCSTX3_DPCSTX_PLL_UPDATE_DATA
-#define DPCSTX3_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
-#define DPCSTX3_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
-//DPCSTX3_DPCSTX_DEBUG_CONFIG
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
-#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx3_dispdec
-//RDPCSTX3_RDPCSTX_CNTL
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
-#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//RDPCSTX3_RDPCSTX_CLOCK_CNTL
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
-#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
-//RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
-#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
-//RDPCSTX3_RDPCSTX_PLL_UPDATE_DATA
-#define RDPCSTX3_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
-#define RDPCSTX3_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
-//RDPCSTX3_RDPCS_TX_CR_ADDR
-#define RDPCSTX3_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
-#define RDPCSTX3_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
-//RDPCSTX3_RDPCS_TX_CR_DATA
-#define RDPCSTX3_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
-#define RDPCSTX3_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
-//RDPCSTX3_RDPCS_TX_SRAM_CNTL
-#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
-#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
-#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
-#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
-#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
-#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
-//RDPCSTX3_RDPCSTX_SCRATCH
-#define RDPCSTX3_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
-#define RDPCSTX3_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
-//RDPCSTX3_RDPCSTX_SPARE
-#define RDPCSTX3_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
-#define RDPCSTX3_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
-//RDPCSTX3_RDPCSTX_CNTL2
-#define RDPCSTX3_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
-#define RDPCSTX3_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
-#define RDPCSTX3_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
-#define RDPCSTX3_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
-//RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
-//RDPCSTX3_RDPCSTX_DEBUG_CONFIG
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL1
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
-//RDPCSTX3_RDPCSTX_PHY_CNTL2
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
-//RDPCSTX3_RDPCSTX_PHY_CNTL3
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL5
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL6
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL7
-#define RDPCSTX3_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
-#define RDPCSTX3_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
-#define RDPCSTX3_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL8
-#define RDPCSTX3_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
-//RDPCSTX3_RDPCSTX_PHY_CNTL9
-#define RDPCSTX3_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
-#define RDPCSTX3_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
-#define RDPCSTX3_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL10
-#define RDPCSTX3_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
-//RDPCSTX3_RDPCSTX_PHY_CNTL11
-#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
-#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
-#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
-#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL12
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
-//RDPCSTX3_RDPCSTX_PHY_CNTL13
-#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
-#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
-#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
-#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
-#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL14
-#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
-#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
-#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
-//RDPCSTX3_RDPCSTX_PHY_FUSE0
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
-//RDPCSTX3_RDPCSTX_PHY_FUSE1
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
-//RDPCSTX3_RDPCSTX_PHY_FUSE2
-#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
-#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
-//RDPCSTX3_RDPCSTX_PHY_FUSE3
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
-#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
-//RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL
-#define RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
-#define RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
-#define RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
-#define RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
-//RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
-//RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
-#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
-//RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG
-#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
-#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
-#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
-#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
-#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
-#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
-//RDPCSTX3_RDPCSTX_PHY_CNTL15
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL16
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
-//RDPCSTX3_RDPCSTX_PHY_CNTL17
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
-#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
-//RDPCSTX3_RDPCSTX_DEBUG_CONFIG2
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
-#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
-
-
-// addressBlock: dpcssys_dpcssys_cr3_dispdec
-//DPCSSYS_CR3_DPCSSYS_CR_ADDR
-#define DPCSSYS_CR3_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
-#define DPCSSYS_CR3_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
-//DPCSSYS_CR3_DPCSSYS_CR_DATA
-#define DPCSSYS_CR3_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
-#define DPCSSYS_CR3_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
-
-
-// addressBlock: dpcssys_dpcs0_dpcstx4_dispdec
-//DPCSTX4_DPCSTX_TX_CLOCK_CNTL
-#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
-#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
-#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
-#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
-#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
-#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
-#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
-#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
-//DPCSTX4_DPCSTX_TX_CNTL
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
-#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//DPCSTX4_DPCSTX_CBUS_CNTL
-#define DPCSTX4_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
-#define DPCSTX4_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
-#define DPCSTX4_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
-#define DPCSTX4_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
-//DPCSTX4_DPCSTX_INTERRUPT_CNTL
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
-#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
-//DPCSTX4_DPCSTX_PLL_UPDATE_ADDR
-#define DPCSTX4_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
-#define DPCSTX4_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
-//DPCSTX4_DPCSTX_PLL_UPDATE_DATA
-#define DPCSTX4_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
-#define DPCSTX4_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
-//DPCSTX4_DPCSTX_DEBUG_CONFIG
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
-#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
-
-
-// addressBlock: dpcssys_dpcs0_rdpcstx4_dispdec
-//RDPCSTX4_RDPCSTX_CNTL
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
-#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
-//RDPCSTX4_RDPCSTX_CLOCK_CNTL
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
-#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
-//RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
-#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
-//RDPCSTX4_RDPCSTX_PLL_UPDATE_DATA
-#define RDPCSTX4_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
-#define RDPCSTX4_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
-//RDPCSTX4_RDPCS_TX_CR_ADDR
-#define RDPCSTX4_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
-#define RDPCSTX4_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
-//RDPCSTX4_RDPCS_TX_CR_DATA
-#define RDPCSTX4_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
-#define RDPCSTX4_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
-//RDPCSTX4_RDPCS_TX_SRAM_CNTL
-#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
-#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
-#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
-#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
-#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
-#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
-//RDPCSTX4_RDPCSTX_SCRATCH
-#define RDPCSTX4_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
-#define RDPCSTX4_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
-//RDPCSTX4_RDPCSTX_SPARE
-#define RDPCSTX4_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
-#define RDPCSTX4_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
-//RDPCSTX4_RDPCSTX_CNTL2
-#define RDPCSTX4_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
-#define RDPCSTX4_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
-#define RDPCSTX4_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
-#define RDPCSTX4_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
-//RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
-//RDPCSTX4_RDPCSTX_DEBUG_CONFIG
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL1
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
-//RDPCSTX4_RDPCSTX_PHY_CNTL2
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
-//RDPCSTX4_RDPCSTX_PHY_CNTL3
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL5
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL6
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL7
-#define RDPCSTX4_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
-#define RDPCSTX4_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
-#define RDPCSTX4_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL8
-#define RDPCSTX4_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
-//RDPCSTX4_RDPCSTX_PHY_CNTL9
-#define RDPCSTX4_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
-#define RDPCSTX4_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
-#define RDPCSTX4_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL10
-#define RDPCSTX4_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
-//RDPCSTX4_RDPCSTX_PHY_CNTL11
-#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
-#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
-#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
-#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL12
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
-//RDPCSTX4_RDPCSTX_PHY_CNTL13
-#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
-#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
-#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
-#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
-#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL14
-#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
-#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
-#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
-//RDPCSTX4_RDPCSTX_PHY_FUSE0
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
-//RDPCSTX4_RDPCSTX_PHY_FUSE1
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
-//RDPCSTX4_RDPCSTX_PHY_FUSE2
-#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
-#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
-//RDPCSTX4_RDPCSTX_PHY_FUSE3
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
-#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
-//RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL
-#define RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
-#define RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
-#define RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
-#define RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
-//RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
-//RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
-#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
-//RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG
-#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
-#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
-#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
-#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
-#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
-#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
-//RDPCSTX4_RDPCSTX_PHY_CNTL15
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL16
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
-//RDPCSTX4_RDPCSTX_PHY_CNTL17
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
-#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
-//RDPCSTX4_RDPCSTX_DEBUG_CONFIG2
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
-#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
-
-
-// addressBlock: dpcssys_dpcssys_cr4_dispdec
-//DPCSSYS_CR4_DPCSSYS_CR_ADDR
-#define DPCSSYS_CR4_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
-#define DPCSSYS_CR4_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
-//DPCSSYS_CR4_DPCSSYS_CR_DATA
-#define DPCSSYS_CR4_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
-#define DPCSSYS_CR4_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
-
-#endif
diff --git a/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_1_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_1_0_offset.h
new file mode 100644
index 0000000..945bb61
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_1_0_offset.h
@@ -0,0 +1,565 @@
+/*
+ * Copyright (C) 2019  Advanced Micro Devices, Inc.
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
+#ifndef _dpcs_2_1_0_OFFSET_HEADER
+#define _dpcs_2_1_0_OFFSET_HEADER
+
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx0_dispdec
+// base address: 0x0
+#define mmDPCSTX0_DPCSTX_TX_CLOCK_CNTL                                                                 0x2928
+#define mmDPCSTX0_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
+#define mmDPCSTX0_DPCSTX_TX_CNTL                                                                       0x2929
+#define mmDPCSTX0_DPCSTX_TX_CNTL_BASE_IDX                                                              2
+#define mmDPCSTX0_DPCSTX_CBUS_CNTL                                                                     0x292a
+#define mmDPCSTX0_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
+#define mmDPCSTX0_DPCSTX_INTERRUPT_CNTL                                                                0x292b
+#define mmDPCSTX0_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
+#define mmDPCSTX0_DPCSTX_PLL_UPDATE_ADDR                                                               0x292c
+#define mmDPCSTX0_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
+#define mmDPCSTX0_DPCSTX_PLL_UPDATE_DATA                                                               0x292d
+#define mmDPCSTX0_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
+#define mmDPCSTX0_DPCSTX_DEBUG_CONFIG                                                                  0x292e
+#define mmDPCSTX0_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx0_dispdec
+// base address: 0x0
+#define mmRDPCSTX0_RDPCSTX_CNTL                                                                        0x2930
+#define mmRDPCSTX0_RDPCSTX_CNTL_BASE_IDX                                                               2
+#define mmRDPCSTX0_RDPCSTX_CLOCK_CNTL                                                                  0x2931
+#define mmRDPCSTX0_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_INTERRUPT_CONTROL                                                           0x2932
+#define mmRDPCSTX0_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
+#define mmRDPCSTX0_RDPCSTX_PLL_UPDATE_DATA                                                             0x2933
+#define mmRDPCSTX0_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
+#define mmRDPCSTX0_RDPCS_TX_CR_ADDR                                                                    0x2934
+#define mmRDPCSTX0_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
+#define mmRDPCSTX0_RDPCS_TX_CR_DATA                                                                    0x2935
+#define mmRDPCSTX0_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
+#define mmRDPCSTX0_RDPCS_TX_SRAM_CNTL                                                                  0x2936
+#define mmRDPCSTX0_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_SCRATCH                                                                     0x2937
+#define mmRDPCSTX0_RDPCSTX_SCRATCH_BASE_IDX                                                            2
+#define mmRDPCSTX0_RDPCSTX_SPARE                                                                       0x2938
+#define mmRDPCSTX0_RDPCSTX_SPARE_BASE_IDX                                                              2
+#define mmRDPCSTX0_RDPCSTX_CNTL2                                                                       0x2939
+#define mmRDPCSTX0_RDPCSTX_CNTL2_BASE_IDX                                                              2
+#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x293c
+#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
+#define mmRDPCSTX0_RDPCSTX_DEBUG_CONFIG                                                                0x293d
+#define mmRDPCSTX0_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL0                                                                   0x2940
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL1                                                                   0x2941
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL2                                                                   0x2942
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL3                                                                   0x2943
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL4                                                                   0x2944
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL5                                                                   0x2945
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL6                                                                   0x2946
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL7                                                                   0x2947
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL8                                                                   0x2948
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL9                                                                   0x2949
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL10                                                                  0x294a
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL11                                                                  0x294b
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL12                                                                  0x294c
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL13                                                                  0x294d
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL14                                                                  0x294e
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_PHY_FUSE0                                                                   0x294f
+#define mmRDPCSTX0_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_FUSE1                                                                   0x2950
+#define mmRDPCSTX0_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_FUSE2                                                                   0x2951
+#define mmRDPCSTX0_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_FUSE3                                                                   0x2952
+#define mmRDPCSTX0_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
+#define mmRDPCSTX0_RDPCSTX_PHY_RX_LD_VAL                                                               0x2953
+#define mmRDPCSTX0_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
+#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2954
+#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
+#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2955
+#define mmRDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
+#define mmRDPCSTX0_RDPCSTX_DPALT_CONTROL_REG                                                           0x2956
+#define mmRDPCSTX0_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL15                                                                  0x2958
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL16                                                                  0x2959
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL17                                                                  0x295a
+#define mmRDPCSTX0_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
+#define mmRDPCSTX0_RDPCSTX_DEBUG_CONFIG2                                                               0x295b
+#define mmRDPCSTX0_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
+
+
+// addressBlock: dpcssys_dpcssys_cr0_dispdec
+// base address: 0x0
+#define mmDPCSSYS_CR0_DPCSSYS_CR_ADDR                                                                  0x2934
+#define mmDPCSSYS_CR0_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
+#define mmDPCSSYS_CR0_DPCSSYS_CR_DATA                                                                  0x2935
+#define mmDPCSSYS_CR0_DPCSSYS_CR_DATA_BASE_IDX                                                         2
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx1_dispdec
+// base address: 0x360
+#define mmDPCSTX1_DPCSTX_TX_CLOCK_CNTL                                                                 0x2a00
+#define mmDPCSTX1_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
+#define mmDPCSTX1_DPCSTX_TX_CNTL                                                                       0x2a01
+#define mmDPCSTX1_DPCSTX_TX_CNTL_BASE_IDX                                                              2
+#define mmDPCSTX1_DPCSTX_CBUS_CNTL                                                                     0x2a02
+#define mmDPCSTX1_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
+#define mmDPCSTX1_DPCSTX_INTERRUPT_CNTL                                                                0x2a03
+#define mmDPCSTX1_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
+#define mmDPCSTX1_DPCSTX_PLL_UPDATE_ADDR                                                               0x2a04
+#define mmDPCSTX1_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
+#define mmDPCSTX1_DPCSTX_PLL_UPDATE_DATA                                                               0x2a05
+#define mmDPCSTX1_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
+#define mmDPCSTX1_DPCSTX_DEBUG_CONFIG                                                                  0x2a06
+#define mmDPCSTX1_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx1_dispdec
+// base address: 0x360
+#define mmRDPCSTX1_RDPCSTX_CNTL                                                                        0x2a08
+#define mmRDPCSTX1_RDPCSTX_CNTL_BASE_IDX                                                               2
+#define mmRDPCSTX1_RDPCSTX_CLOCK_CNTL                                                                  0x2a09
+#define mmRDPCSTX1_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_INTERRUPT_CONTROL                                                           0x2a0a
+#define mmRDPCSTX1_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
+#define mmRDPCSTX1_RDPCSTX_PLL_UPDATE_DATA                                                             0x2a0b
+#define mmRDPCSTX1_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
+#define mmRDPCSTX1_RDPCS_TX_CR_ADDR                                                                    0x2a0c
+#define mmRDPCSTX1_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
+#define mmRDPCSTX1_RDPCS_TX_CR_DATA                                                                    0x2a0d
+#define mmRDPCSTX1_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
+#define mmRDPCSTX1_RDPCS_TX_SRAM_CNTL                                                                  0x2a0e
+#define mmRDPCSTX1_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_SCRATCH                                                                     0x2a0f
+#define mmRDPCSTX1_RDPCSTX_SCRATCH_BASE_IDX                                                            2
+#define mmRDPCSTX1_RDPCSTX_SPARE                                                                       0x2a10
+#define mmRDPCSTX1_RDPCSTX_SPARE_BASE_IDX                                                              2
+#define mmRDPCSTX1_RDPCSTX_CNTL2                                                                       0x2a11
+#define mmRDPCSTX1_RDPCSTX_CNTL2_BASE_IDX                                                              2
+#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x2a14
+#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
+#define mmRDPCSTX1_RDPCSTX_DEBUG_CONFIG                                                                0x2a15
+#define mmRDPCSTX1_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL0                                                                   0x2a18
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL1                                                                   0x2a19
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL2                                                                   0x2a1a
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL3                                                                   0x2a1b
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL4                                                                   0x2a1c
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL5                                                                   0x2a1d
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL6                                                                   0x2a1e
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL7                                                                   0x2a1f
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL8                                                                   0x2a20
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL9                                                                   0x2a21
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL10                                                                  0x2a22
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL11                                                                  0x2a23
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL12                                                                  0x2a24
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL13                                                                  0x2a25
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL14                                                                  0x2a26
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_PHY_FUSE0                                                                   0x2a27
+#define mmRDPCSTX1_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_FUSE1                                                                   0x2a28
+#define mmRDPCSTX1_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_FUSE2                                                                   0x2a29
+#define mmRDPCSTX1_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_FUSE3                                                                   0x2a2a
+#define mmRDPCSTX1_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
+#define mmRDPCSTX1_RDPCSTX_PHY_RX_LD_VAL                                                               0x2a2b
+#define mmRDPCSTX1_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
+#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2a2c
+#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
+#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2a2d
+#define mmRDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
+#define mmRDPCSTX1_RDPCSTX_DPALT_CONTROL_REG                                                           0x2a2e
+#define mmRDPCSTX1_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL15                                                                  0x2a30
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL16                                                                  0x2a31
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL17                                                                  0x2a32
+#define mmRDPCSTX1_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
+#define mmRDPCSTX1_RDPCSTX_DEBUG_CONFIG2                                                               0x2a33
+#define mmRDPCSTX1_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
+
+
+// addressBlock: dpcssys_dpcssys_cr1_dispdec
+// base address: 0x360
+#define mmDPCSSYS_CR1_DPCSSYS_CR_ADDR                                                                  0x2a0c
+#define mmDPCSSYS_CR1_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
+#define mmDPCSSYS_CR1_DPCSSYS_CR_DATA                                                                  0x2a0d
+#define mmDPCSSYS_CR1_DPCSSYS_CR_DATA_BASE_IDX                                                         2
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx2_dispdec
+// base address: 0x6c0
+#define mmDPCSTX2_DPCSTX_TX_CLOCK_CNTL                                                                 0x2ad8
+#define mmDPCSTX2_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
+#define mmDPCSTX2_DPCSTX_TX_CNTL                                                                       0x2ad9
+#define mmDPCSTX2_DPCSTX_TX_CNTL_BASE_IDX                                                              2
+#define mmDPCSTX2_DPCSTX_CBUS_CNTL                                                                     0x2ada
+#define mmDPCSTX2_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
+#define mmDPCSTX2_DPCSTX_INTERRUPT_CNTL                                                                0x2adb
+#define mmDPCSTX2_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
+#define mmDPCSTX2_DPCSTX_PLL_UPDATE_ADDR                                                               0x2adc
+#define mmDPCSTX2_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
+#define mmDPCSTX2_DPCSTX_PLL_UPDATE_DATA                                                               0x2add
+#define mmDPCSTX2_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
+#define mmDPCSTX2_DPCSTX_DEBUG_CONFIG                                                                  0x2ade
+#define mmDPCSTX2_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx2_dispdec
+// base address: 0x6c0
+#define mmRDPCSTX2_RDPCSTX_CNTL                                                                        0x2ae0
+#define mmRDPCSTX2_RDPCSTX_CNTL_BASE_IDX                                                               2
+#define mmRDPCSTX2_RDPCSTX_CLOCK_CNTL                                                                  0x2ae1
+#define mmRDPCSTX2_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_INTERRUPT_CONTROL                                                           0x2ae2
+#define mmRDPCSTX2_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
+#define mmRDPCSTX2_RDPCSTX_PLL_UPDATE_DATA                                                             0x2ae3
+#define mmRDPCSTX2_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
+#define mmRDPCSTX2_RDPCS_TX_CR_ADDR                                                                    0x2ae4
+#define mmRDPCSTX2_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
+#define mmRDPCSTX2_RDPCS_TX_CR_DATA                                                                    0x2ae5
+#define mmRDPCSTX2_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
+#define mmRDPCSTX2_RDPCS_TX_SRAM_CNTL                                                                  0x2ae6
+#define mmRDPCSTX2_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_SCRATCH                                                                     0x2ae7
+#define mmRDPCSTX2_RDPCSTX_SCRATCH_BASE_IDX                                                            2
+#define mmRDPCSTX2_RDPCSTX_SPARE                                                                       0x2ae8
+#define mmRDPCSTX2_RDPCSTX_SPARE_BASE_IDX                                                              2
+#define mmRDPCSTX2_RDPCSTX_CNTL2                                                                       0x2ae9
+#define mmRDPCSTX2_RDPCSTX_CNTL2_BASE_IDX                                                              2
+#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x2aec
+#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
+#define mmRDPCSTX2_RDPCSTX_DEBUG_CONFIG                                                                0x2aed
+#define mmRDPCSTX2_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL0                                                                   0x2af0
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL1                                                                   0x2af1
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL2                                                                   0x2af2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL3                                                                   0x2af3
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL4                                                                   0x2af4
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL5                                                                   0x2af5
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL6                                                                   0x2af6
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL7                                                                   0x2af7
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL8                                                                   0x2af8
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL9                                                                   0x2af9
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL10                                                                  0x2afa
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL11                                                                  0x2afb
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL12                                                                  0x2afc
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL13                                                                  0x2afd
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL14                                                                  0x2afe
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_PHY_FUSE0                                                                   0x2aff
+#define mmRDPCSTX2_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_FUSE1                                                                   0x2b00
+#define mmRDPCSTX2_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_FUSE2                                                                   0x2b01
+#define mmRDPCSTX2_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_FUSE3                                                                   0x2b02
+#define mmRDPCSTX2_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
+#define mmRDPCSTX2_RDPCSTX_PHY_RX_LD_VAL                                                               0x2b03
+#define mmRDPCSTX2_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
+#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2b04
+#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
+#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2b05
+#define mmRDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
+#define mmRDPCSTX2_RDPCSTX_DPALT_CONTROL_REG                                                           0x2b06
+#define mmRDPCSTX2_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL15                                                                  0x2b08
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL16                                                                  0x2b09
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL17                                                                  0x2b0a
+#define mmRDPCSTX2_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
+#define mmRDPCSTX2_RDPCSTX_DEBUG_CONFIG2                                                               0x2b0b
+#define mmRDPCSTX2_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
+
+
+// addressBlock: dpcssys_dpcssys_cr2_dispdec
+// base address: 0x6c0
+#define mmDPCSSYS_CR2_DPCSSYS_CR_ADDR                                                                  0x2ae4
+#define mmDPCSSYS_CR2_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
+#define mmDPCSSYS_CR2_DPCSSYS_CR_DATA                                                                  0x2ae5
+#define mmDPCSSYS_CR2_DPCSSYS_CR_DATA_BASE_IDX                                                         2
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx3_dispdec
+// base address: 0xa20
+#define mmDPCSTX3_DPCSTX_TX_CLOCK_CNTL                                                                 0x2bb0
+#define mmDPCSTX3_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
+#define mmDPCSTX3_DPCSTX_TX_CNTL                                                                       0x2bb1
+#define mmDPCSTX3_DPCSTX_TX_CNTL_BASE_IDX                                                              2
+#define mmDPCSTX3_DPCSTX_CBUS_CNTL                                                                     0x2bb2
+#define mmDPCSTX3_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
+#define mmDPCSTX3_DPCSTX_INTERRUPT_CNTL                                                                0x2bb3
+#define mmDPCSTX3_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
+#define mmDPCSTX3_DPCSTX_PLL_UPDATE_ADDR                                                               0x2bb4
+#define mmDPCSTX3_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
+#define mmDPCSTX3_DPCSTX_PLL_UPDATE_DATA                                                               0x2bb5
+#define mmDPCSTX3_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
+#define mmDPCSTX3_DPCSTX_DEBUG_CONFIG                                                                  0x2bb6
+#define mmDPCSTX3_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx3_dispdec
+// base address: 0xa20
+#define mmRDPCSTX3_RDPCSTX_CNTL                                                                        0x2bb8
+#define mmRDPCSTX3_RDPCSTX_CNTL_BASE_IDX                                                               2
+#define mmRDPCSTX3_RDPCSTX_CLOCK_CNTL                                                                  0x2bb9
+#define mmRDPCSTX3_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_INTERRUPT_CONTROL                                                           0x2bba
+#define mmRDPCSTX3_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
+#define mmRDPCSTX3_RDPCSTX_PLL_UPDATE_DATA                                                             0x2bbb
+#define mmRDPCSTX3_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
+#define mmRDPCSTX3_RDPCS_TX_CR_ADDR                                                                    0x2bbc
+#define mmRDPCSTX3_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
+#define mmRDPCSTX3_RDPCS_TX_CR_DATA                                                                    0x2bbd
+#define mmRDPCSTX3_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
+#define mmRDPCSTX3_RDPCS_TX_SRAM_CNTL                                                                  0x2bbe
+#define mmRDPCSTX3_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_SCRATCH                                                                     0x2bbf
+#define mmRDPCSTX3_RDPCSTX_SCRATCH_BASE_IDX                                                            2
+#define mmRDPCSTX3_RDPCSTX_SPARE                                                                       0x2bc0
+#define mmRDPCSTX3_RDPCSTX_SPARE_BASE_IDX                                                              2
+#define mmRDPCSTX3_RDPCSTX_CNTL2                                                                       0x2bc1
+#define mmRDPCSTX3_RDPCSTX_CNTL2_BASE_IDX                                                              2
+#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x2bc4
+#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
+#define mmRDPCSTX3_RDPCSTX_DEBUG_CONFIG                                                                0x2bc5
+#define mmRDPCSTX3_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL0                                                                   0x2bc8
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL1                                                                   0x2bc9
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL2                                                                   0x2bca
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL3                                                                   0x2bcb
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL4                                                                   0x2bcc
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL5                                                                   0x2bcd
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL6                                                                   0x2bce
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL7                                                                   0x2bcf
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL8                                                                   0x2bd0
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL9                                                                   0x2bd1
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL10                                                                  0x2bd2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL11                                                                  0x2bd3
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL12                                                                  0x2bd4
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL13                                                                  0x2bd5
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL14                                                                  0x2bd6
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_PHY_FUSE0                                                                   0x2bd7
+#define mmRDPCSTX3_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_FUSE1                                                                   0x2bd8
+#define mmRDPCSTX3_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_FUSE2                                                                   0x2bd9
+#define mmRDPCSTX3_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_FUSE3                                                                   0x2bda
+#define mmRDPCSTX3_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
+#define mmRDPCSTX3_RDPCSTX_PHY_RX_LD_VAL                                                               0x2bdb
+#define mmRDPCSTX3_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
+#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2bdc
+#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
+#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2bdd
+#define mmRDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
+#define mmRDPCSTX3_RDPCSTX_DPALT_CONTROL_REG                                                           0x2bde
+#define mmRDPCSTX3_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL15                                                                  0x2be0
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL16                                                                  0x2be1
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL17                                                                  0x2be2
+#define mmRDPCSTX3_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
+#define mmRDPCSTX3_RDPCSTX_DEBUG_CONFIG2                                                               0x2be3
+#define mmRDPCSTX3_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
+
+
+// addressBlock: dpcssys_dpcssys_cr3_dispdec
+// base address: 0xa20
+#define mmDPCSSYS_CR3_DPCSSYS_CR_ADDR                                                                  0x2bbc
+#define mmDPCSSYS_CR3_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
+#define mmDPCSSYS_CR3_DPCSSYS_CR_DATA                                                                  0x2bbd
+#define mmDPCSSYS_CR3_DPCSSYS_CR_DATA_BASE_IDX                                                         2
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx4_dispdec
+// base address: 0xd80
+#define mmDPCSTX4_DPCSTX_TX_CLOCK_CNTL                                                                 0x2c88
+#define mmDPCSTX4_DPCSTX_TX_CLOCK_CNTL_BASE_IDX                                                        2
+#define mmDPCSTX4_DPCSTX_TX_CNTL                                                                       0x2c89
+#define mmDPCSTX4_DPCSTX_TX_CNTL_BASE_IDX                                                              2
+#define mmDPCSTX4_DPCSTX_CBUS_CNTL                                                                     0x2c8a
+#define mmDPCSTX4_DPCSTX_CBUS_CNTL_BASE_IDX                                                            2
+#define mmDPCSTX4_DPCSTX_INTERRUPT_CNTL                                                                0x2c8b
+#define mmDPCSTX4_DPCSTX_INTERRUPT_CNTL_BASE_IDX                                                       2
+#define mmDPCSTX4_DPCSTX_PLL_UPDATE_ADDR                                                               0x2c8c
+#define mmDPCSTX4_DPCSTX_PLL_UPDATE_ADDR_BASE_IDX                                                      2
+#define mmDPCSTX4_DPCSTX_PLL_UPDATE_DATA                                                               0x2c8d
+#define mmDPCSTX4_DPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                      2
+#define mmDPCSTX4_DPCSTX_DEBUG_CONFIG                                                                  0x2c8e
+#define mmDPCSTX4_DPCSTX_DEBUG_CONFIG_BASE_IDX                                                         2
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx4_dispdec
+// base address: 0xd80
+#define mmRDPCSTX4_RDPCSTX_CNTL                                                                        0x2c90
+#define mmRDPCSTX4_RDPCSTX_CNTL_BASE_IDX                                                               2
+#define mmRDPCSTX4_RDPCSTX_CLOCK_CNTL                                                                  0x2c91
+#define mmRDPCSTX4_RDPCSTX_CLOCK_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_INTERRUPT_CONTROL                                                           0x2c92
+#define mmRDPCSTX4_RDPCSTX_INTERRUPT_CONTROL_BASE_IDX                                                  2
+#define mmRDPCSTX4_RDPCSTX_PLL_UPDATE_DATA                                                             0x2c93
+#define mmRDPCSTX4_RDPCSTX_PLL_UPDATE_DATA_BASE_IDX                                                    2
+#define mmRDPCSTX4_RDPCS_TX_CR_ADDR                                                                    0x2c94
+#define mmRDPCSTX4_RDPCS_TX_CR_ADDR_BASE_IDX                                                           2
+#define mmRDPCSTX4_RDPCS_TX_CR_DATA                                                                    0x2c95
+#define mmRDPCSTX4_RDPCS_TX_CR_DATA_BASE_IDX                                                           2
+#define mmRDPCSTX4_RDPCS_TX_SRAM_CNTL                                                                  0x2c96
+#define mmRDPCSTX4_RDPCS_TX_SRAM_CNTL_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_SCRATCH                                                                     0x2c97
+#define mmRDPCSTX4_RDPCSTX_SCRATCH_BASE_IDX                                                            2
+#define mmRDPCSTX4_RDPCSTX_SPARE                                                                       0x2c98
+#define mmRDPCSTX4_RDPCSTX_SPARE_BASE_IDX                                                              2
+#define mmRDPCSTX4_RDPCSTX_CNTL2                                                                       0x2c99
+#define mmRDPCSTX4_RDPCSTX_CNTL2_BASE_IDX                                                              2
+#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG                                                    0x2c9c
+#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG_BASE_IDX                                           2
+#define mmRDPCSTX4_RDPCSTX_DEBUG_CONFIG                                                                0x2c9d
+#define mmRDPCSTX4_RDPCSTX_DEBUG_CONFIG_BASE_IDX                                                       2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL0                                                                   0x2ca0
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL0_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL1                                                                   0x2ca1
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL1_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL2                                                                   0x2ca2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL2_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL3                                                                   0x2ca3
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL3_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL4                                                                   0x2ca4
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL4_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL5                                                                   0x2ca5
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL5_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL6                                                                   0x2ca6
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL6_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL7                                                                   0x2ca7
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL7_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL8                                                                   0x2ca8
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL8_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL9                                                                   0x2ca9
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL9_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL10                                                                  0x2caa
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL10_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL11                                                                  0x2cab
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL11_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL12                                                                  0x2cac
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL12_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL13                                                                  0x2cad
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL13_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL14                                                                  0x2cae
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL14_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_PHY_FUSE0                                                                   0x2caf
+#define mmRDPCSTX4_RDPCSTX_PHY_FUSE0_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_FUSE1                                                                   0x2cb0
+#define mmRDPCSTX4_RDPCSTX_PHY_FUSE1_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_FUSE2                                                                   0x2cb1
+#define mmRDPCSTX4_RDPCSTX_PHY_FUSE2_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_FUSE3                                                                   0x2cb2
+#define mmRDPCSTX4_RDPCSTX_PHY_FUSE3_BASE_IDX                                                          2
+#define mmRDPCSTX4_RDPCSTX_PHY_RX_LD_VAL                                                               0x2cb3
+#define mmRDPCSTX4_RDPCSTX_PHY_RX_LD_VAL_BASE_IDX                                                      2
+#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3                                                        0x2cb4
+#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3_BASE_IDX                                               2
+#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6                                                        0x2cb5
+#define mmRDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6_BASE_IDX                                               2
+#define mmRDPCSTX4_RDPCSTX_DPALT_CONTROL_REG                                                           0x2cb6
+#define mmRDPCSTX4_RDPCSTX_DPALT_CONTROL_REG_BASE_IDX                                                  2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL15                                                                  0x2cb8
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL15_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL16                                                                  0x2cb9
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL16_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL17                                                                  0x2cba
+#define mmRDPCSTX4_RDPCSTX_PHY_CNTL17_BASE_IDX                                                         2
+#define mmRDPCSTX4_RDPCSTX_DEBUG_CONFIG2                                                               0x2cbb
+#define mmRDPCSTX4_RDPCSTX_DEBUG_CONFIG2_BASE_IDX                                                      2
+
+
+// addressBlock: dpcssys_dpcssys_cr4_dispdec
+// base address: 0xd80
+#define mmDPCSSYS_CR4_DPCSSYS_CR_ADDR                                                                  0x2c94
+#define mmDPCSSYS_CR4_DPCSSYS_CR_ADDR_BASE_IDX                                                         2
+#define mmDPCSSYS_CR4_DPCSSYS_CR_DATA                                                                  0x2c95
+#define mmDPCSSYS_CR4_DPCSSYS_CR_DATA_BASE_IDX                                                         2
+
+#endif
diff --git a/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_1_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_1_0_sh_mask.h
new file mode 100644
index 0000000..6e039f2
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_1_0_sh_mask.h
@@ -0,0 +1,3430 @@
+/*
+ * Copyright (C) 2019  Advanced Micro Devices, Inc.
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
+#ifndef _dpcs_2_1_0_SH_MASK_HEADER
+#define _dpcs_2_1_0_SH_MASK_HEADER
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx0_dispdec
+//DPCSTX0_DPCSTX_TX_CLOCK_CNTL
+#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
+#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
+#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
+#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
+#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
+#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
+#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
+#define DPCSTX0_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
+//DPCSTX0_DPCSTX_TX_CNTL
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//DPCSTX0_DPCSTX_CBUS_CNTL
+#define DPCSTX0_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
+#define DPCSTX0_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
+#define DPCSTX0_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
+#define DPCSTX0_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
+//DPCSTX0_DPCSTX_INTERRUPT_CNTL
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
+#define DPCSTX0_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
+//DPCSTX0_DPCSTX_PLL_UPDATE_ADDR
+#define DPCSTX0_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
+#define DPCSTX0_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
+//DPCSTX0_DPCSTX_PLL_UPDATE_DATA
+#define DPCSTX0_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
+#define DPCSTX0_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
+//DPCSTX0_DPCSTX_DEBUG_CONFIG
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
+#define DPCSTX0_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
+
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx0_dispdec
+//RDPCSTX0_RDPCSTX_CNTL
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
+#define RDPCSTX0_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//RDPCSTX0_RDPCSTX_CLOCK_CNTL
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
+//RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
+#define RDPCSTX0_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
+//RDPCSTX0_RDPCSTX_PLL_UPDATE_DATA
+#define RDPCSTX0_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
+#define RDPCSTX0_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
+//RDPCSTX0_RDPCS_TX_CR_ADDR
+#define RDPCSTX0_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
+#define RDPCSTX0_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
+//RDPCSTX0_RDPCS_TX_CR_DATA
+#define RDPCSTX0_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
+#define RDPCSTX0_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
+//RDPCSTX0_RDPCS_TX_SRAM_CNTL
+#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
+#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
+#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
+#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
+#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
+#define RDPCSTX0_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
+//RDPCSTX0_RDPCSTX_SCRATCH
+#define RDPCSTX0_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
+#define RDPCSTX0_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
+//RDPCSTX0_RDPCSTX_SPARE
+#define RDPCSTX0_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
+#define RDPCSTX0_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
+//RDPCSTX0_RDPCSTX_CNTL2
+#define RDPCSTX0_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
+#define RDPCSTX0_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
+#define RDPCSTX0_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
+#define RDPCSTX0_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
+//RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
+//RDPCSTX0_RDPCSTX_DEBUG_CONFIG
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL1
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
+//RDPCSTX0_RDPCSTX_PHY_CNTL2
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
+//RDPCSTX0_RDPCSTX_PHY_CNTL3
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL5
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL6
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL7
+#define RDPCSTX0_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
+#define RDPCSTX0_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
+#define RDPCSTX0_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL8
+#define RDPCSTX0_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
+//RDPCSTX0_RDPCSTX_PHY_CNTL9
+#define RDPCSTX0_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
+#define RDPCSTX0_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
+#define RDPCSTX0_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL10
+#define RDPCSTX0_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
+//RDPCSTX0_RDPCSTX_PHY_CNTL11
+#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
+#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
+#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
+#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL12
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
+//RDPCSTX0_RDPCSTX_PHY_CNTL13
+#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
+#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
+#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
+#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
+#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL14
+#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
+#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
+#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
+//RDPCSTX0_RDPCSTX_PHY_FUSE0
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
+//RDPCSTX0_RDPCSTX_PHY_FUSE1
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
+//RDPCSTX0_RDPCSTX_PHY_FUSE2
+#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
+#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
+//RDPCSTX0_RDPCSTX_PHY_FUSE3
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
+#define RDPCSTX0_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
+//RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL
+#define RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
+#define RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
+#define RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
+#define RDPCSTX0_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
+//RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
+//RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
+#define RDPCSTX0_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
+//RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG
+#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
+#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
+#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
+#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
+#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
+#define RDPCSTX0_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
+//RDPCSTX0_RDPCSTX_PHY_CNTL15
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL16
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
+//RDPCSTX0_RDPCSTX_PHY_CNTL17
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
+#define RDPCSTX0_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
+//RDPCSTX0_RDPCSTX_DEBUG_CONFIG2
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
+#define RDPCSTX0_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
+
+
+// addressBlock: dpcssys_dpcssys_cr0_dispdec
+//DPCSSYS_CR0_DPCSSYS_CR_ADDR
+#define DPCSSYS_CR0_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
+#define DPCSSYS_CR0_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
+//DPCSSYS_CR0_DPCSSYS_CR_DATA
+#define DPCSSYS_CR0_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
+#define DPCSSYS_CR0_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx1_dispdec
+//DPCSTX1_DPCSTX_TX_CLOCK_CNTL
+#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
+#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
+#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
+#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
+#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
+#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
+#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
+#define DPCSTX1_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
+//DPCSTX1_DPCSTX_TX_CNTL
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
+#define DPCSTX1_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//DPCSTX1_DPCSTX_CBUS_CNTL
+#define DPCSTX1_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
+#define DPCSTX1_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
+#define DPCSTX1_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
+#define DPCSTX1_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
+//DPCSTX1_DPCSTX_INTERRUPT_CNTL
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
+#define DPCSTX1_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
+//DPCSTX1_DPCSTX_PLL_UPDATE_ADDR
+#define DPCSTX1_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
+#define DPCSTX1_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
+//DPCSTX1_DPCSTX_PLL_UPDATE_DATA
+#define DPCSTX1_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
+#define DPCSTX1_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
+//DPCSTX1_DPCSTX_DEBUG_CONFIG
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
+#define DPCSTX1_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx1_dispdec
+//RDPCSTX1_RDPCSTX_CNTL
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
+#define RDPCSTX1_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//RDPCSTX1_RDPCSTX_CLOCK_CNTL
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
+#define RDPCSTX1_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
+//RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
+#define RDPCSTX1_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
+//RDPCSTX1_RDPCSTX_PLL_UPDATE_DATA
+#define RDPCSTX1_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
+#define RDPCSTX1_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
+//RDPCSTX1_RDPCS_TX_CR_ADDR
+#define RDPCSTX1_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
+#define RDPCSTX1_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
+//RDPCSTX1_RDPCS_TX_CR_DATA
+#define RDPCSTX1_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
+#define RDPCSTX1_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
+//RDPCSTX1_RDPCS_TX_SRAM_CNTL
+#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
+#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
+#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
+#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
+#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
+#define RDPCSTX1_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
+//RDPCSTX1_RDPCSTX_SCRATCH
+#define RDPCSTX1_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
+#define RDPCSTX1_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
+//RDPCSTX1_RDPCSTX_SPARE
+#define RDPCSTX1_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
+#define RDPCSTX1_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
+//RDPCSTX1_RDPCSTX_CNTL2
+#define RDPCSTX1_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
+#define RDPCSTX1_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
+#define RDPCSTX1_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
+#define RDPCSTX1_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
+//RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
+//RDPCSTX1_RDPCSTX_DEBUG_CONFIG
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL1
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
+//RDPCSTX1_RDPCSTX_PHY_CNTL2
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
+//RDPCSTX1_RDPCSTX_PHY_CNTL3
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL5
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL6
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL7
+#define RDPCSTX1_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
+#define RDPCSTX1_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
+#define RDPCSTX1_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL8
+#define RDPCSTX1_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
+//RDPCSTX1_RDPCSTX_PHY_CNTL9
+#define RDPCSTX1_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
+#define RDPCSTX1_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
+#define RDPCSTX1_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL10
+#define RDPCSTX1_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
+//RDPCSTX1_RDPCSTX_PHY_CNTL11
+#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
+#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
+#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
+#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL12
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
+//RDPCSTX1_RDPCSTX_PHY_CNTL13
+#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
+#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
+#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
+#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
+#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL14
+#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
+#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
+#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
+//RDPCSTX1_RDPCSTX_PHY_FUSE0
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
+//RDPCSTX1_RDPCSTX_PHY_FUSE1
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
+//RDPCSTX1_RDPCSTX_PHY_FUSE2
+#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
+#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
+//RDPCSTX1_RDPCSTX_PHY_FUSE3
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
+#define RDPCSTX1_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
+//RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL
+#define RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
+#define RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
+#define RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
+#define RDPCSTX1_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
+//RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
+//RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
+#define RDPCSTX1_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
+//RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG
+#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
+#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
+#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
+#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
+#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
+#define RDPCSTX1_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
+//RDPCSTX1_RDPCSTX_PHY_CNTL15
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL16
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
+//RDPCSTX1_RDPCSTX_PHY_CNTL17
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
+#define RDPCSTX1_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
+//RDPCSTX1_RDPCSTX_DEBUG_CONFIG2
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
+#define RDPCSTX1_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
+
+
+// addressBlock: dpcssys_dpcssys_cr1_dispdec
+//DPCSSYS_CR1_DPCSSYS_CR_ADDR
+#define DPCSSYS_CR1_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
+#define DPCSSYS_CR1_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
+//DPCSSYS_CR1_DPCSSYS_CR_DATA
+#define DPCSSYS_CR1_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
+#define DPCSSYS_CR1_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx2_dispdec
+//DPCSTX2_DPCSTX_TX_CLOCK_CNTL
+#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
+#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
+#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
+#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
+#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
+#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
+#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
+#define DPCSTX2_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
+//DPCSTX2_DPCSTX_TX_CNTL
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
+#define DPCSTX2_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//DPCSTX2_DPCSTX_CBUS_CNTL
+#define DPCSTX2_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
+#define DPCSTX2_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
+#define DPCSTX2_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
+#define DPCSTX2_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
+//DPCSTX2_DPCSTX_INTERRUPT_CNTL
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
+#define DPCSTX2_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
+//DPCSTX2_DPCSTX_PLL_UPDATE_ADDR
+#define DPCSTX2_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
+#define DPCSTX2_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
+//DPCSTX2_DPCSTX_PLL_UPDATE_DATA
+#define DPCSTX2_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
+#define DPCSTX2_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
+//DPCSTX2_DPCSTX_DEBUG_CONFIG
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
+#define DPCSTX2_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx2_dispdec
+//RDPCSTX2_RDPCSTX_CNTL
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
+#define RDPCSTX2_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//RDPCSTX2_RDPCSTX_CLOCK_CNTL
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
+#define RDPCSTX2_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
+//RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
+#define RDPCSTX2_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
+//RDPCSTX2_RDPCSTX_PLL_UPDATE_DATA
+#define RDPCSTX2_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
+#define RDPCSTX2_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
+//RDPCSTX2_RDPCS_TX_CR_ADDR
+#define RDPCSTX2_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
+#define RDPCSTX2_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
+//RDPCSTX2_RDPCS_TX_CR_DATA
+#define RDPCSTX2_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
+#define RDPCSTX2_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
+//RDPCSTX2_RDPCS_TX_SRAM_CNTL
+#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
+#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
+#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
+#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
+#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
+#define RDPCSTX2_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
+//RDPCSTX2_RDPCSTX_SCRATCH
+#define RDPCSTX2_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
+#define RDPCSTX2_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
+//RDPCSTX2_RDPCSTX_SPARE
+#define RDPCSTX2_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
+#define RDPCSTX2_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
+//RDPCSTX2_RDPCSTX_CNTL2
+#define RDPCSTX2_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
+#define RDPCSTX2_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
+#define RDPCSTX2_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
+#define RDPCSTX2_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
+//RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
+//RDPCSTX2_RDPCSTX_DEBUG_CONFIG
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL1
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
+//RDPCSTX2_RDPCSTX_PHY_CNTL2
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
+//RDPCSTX2_RDPCSTX_PHY_CNTL3
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL5
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL6
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL7
+#define RDPCSTX2_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
+#define RDPCSTX2_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
+#define RDPCSTX2_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL8
+#define RDPCSTX2_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
+//RDPCSTX2_RDPCSTX_PHY_CNTL9
+#define RDPCSTX2_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
+#define RDPCSTX2_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
+#define RDPCSTX2_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL10
+#define RDPCSTX2_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
+//RDPCSTX2_RDPCSTX_PHY_CNTL11
+#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
+#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
+#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
+#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL12
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
+//RDPCSTX2_RDPCSTX_PHY_CNTL13
+#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
+#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
+#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
+#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
+#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL14
+#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
+#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
+#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
+//RDPCSTX2_RDPCSTX_PHY_FUSE0
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
+//RDPCSTX2_RDPCSTX_PHY_FUSE1
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
+//RDPCSTX2_RDPCSTX_PHY_FUSE2
+#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
+#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
+//RDPCSTX2_RDPCSTX_PHY_FUSE3
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
+#define RDPCSTX2_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
+//RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL
+#define RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
+#define RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
+#define RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
+#define RDPCSTX2_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
+//RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
+//RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
+#define RDPCSTX2_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
+//RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG
+#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
+#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
+#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
+#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
+#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
+#define RDPCSTX2_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
+//RDPCSTX2_RDPCSTX_PHY_CNTL15
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL16
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
+//RDPCSTX2_RDPCSTX_PHY_CNTL17
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
+#define RDPCSTX2_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
+//RDPCSTX2_RDPCSTX_DEBUG_CONFIG2
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
+#define RDPCSTX2_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
+
+
+// addressBlock: dpcssys_dpcssys_cr2_dispdec
+//DPCSSYS_CR2_DPCSSYS_CR_ADDR
+#define DPCSSYS_CR2_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
+#define DPCSSYS_CR2_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
+//DPCSSYS_CR2_DPCSSYS_CR_DATA
+#define DPCSSYS_CR2_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
+#define DPCSSYS_CR2_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx3_dispdec
+//DPCSTX3_DPCSTX_TX_CLOCK_CNTL
+#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
+#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
+#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
+#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
+#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
+#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
+#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
+#define DPCSTX3_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
+//DPCSTX3_DPCSTX_TX_CNTL
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
+#define DPCSTX3_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//DPCSTX3_DPCSTX_CBUS_CNTL
+#define DPCSTX3_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
+#define DPCSTX3_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
+#define DPCSTX3_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
+#define DPCSTX3_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
+//DPCSTX3_DPCSTX_INTERRUPT_CNTL
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
+#define DPCSTX3_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
+//DPCSTX3_DPCSTX_PLL_UPDATE_ADDR
+#define DPCSTX3_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
+#define DPCSTX3_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
+//DPCSTX3_DPCSTX_PLL_UPDATE_DATA
+#define DPCSTX3_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
+#define DPCSTX3_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
+//DPCSTX3_DPCSTX_DEBUG_CONFIG
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
+#define DPCSTX3_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx3_dispdec
+//RDPCSTX3_RDPCSTX_CNTL
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
+#define RDPCSTX3_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//RDPCSTX3_RDPCSTX_CLOCK_CNTL
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
+#define RDPCSTX3_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
+//RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
+#define RDPCSTX3_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
+//RDPCSTX3_RDPCSTX_PLL_UPDATE_DATA
+#define RDPCSTX3_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
+#define RDPCSTX3_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
+//RDPCSTX3_RDPCS_TX_CR_ADDR
+#define RDPCSTX3_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
+#define RDPCSTX3_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
+//RDPCSTX3_RDPCS_TX_CR_DATA
+#define RDPCSTX3_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
+#define RDPCSTX3_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
+//RDPCSTX3_RDPCS_TX_SRAM_CNTL
+#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
+#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
+#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
+#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
+#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
+#define RDPCSTX3_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
+//RDPCSTX3_RDPCSTX_SCRATCH
+#define RDPCSTX3_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
+#define RDPCSTX3_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
+//RDPCSTX3_RDPCSTX_SPARE
+#define RDPCSTX3_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
+#define RDPCSTX3_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
+//RDPCSTX3_RDPCSTX_CNTL2
+#define RDPCSTX3_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
+#define RDPCSTX3_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
+#define RDPCSTX3_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
+#define RDPCSTX3_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
+//RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
+//RDPCSTX3_RDPCSTX_DEBUG_CONFIG
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL1
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
+//RDPCSTX3_RDPCSTX_PHY_CNTL2
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
+//RDPCSTX3_RDPCSTX_PHY_CNTL3
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL5
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL6
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL7
+#define RDPCSTX3_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
+#define RDPCSTX3_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
+#define RDPCSTX3_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL8
+#define RDPCSTX3_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
+//RDPCSTX3_RDPCSTX_PHY_CNTL9
+#define RDPCSTX3_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
+#define RDPCSTX3_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
+#define RDPCSTX3_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL10
+#define RDPCSTX3_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
+//RDPCSTX3_RDPCSTX_PHY_CNTL11
+#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
+#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
+#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
+#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL12
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
+//RDPCSTX3_RDPCSTX_PHY_CNTL13
+#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
+#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
+#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
+#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
+#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL14
+#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
+#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
+#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
+//RDPCSTX3_RDPCSTX_PHY_FUSE0
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
+//RDPCSTX3_RDPCSTX_PHY_FUSE1
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
+//RDPCSTX3_RDPCSTX_PHY_FUSE2
+#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
+#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
+//RDPCSTX3_RDPCSTX_PHY_FUSE3
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
+#define RDPCSTX3_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
+//RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL
+#define RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
+#define RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
+#define RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
+#define RDPCSTX3_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
+//RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
+//RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
+#define RDPCSTX3_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
+//RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG
+#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
+#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
+#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
+#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
+#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
+#define RDPCSTX3_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
+//RDPCSTX3_RDPCSTX_PHY_CNTL15
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL16
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
+//RDPCSTX3_RDPCSTX_PHY_CNTL17
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
+#define RDPCSTX3_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
+//RDPCSTX3_RDPCSTX_DEBUG_CONFIG2
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
+#define RDPCSTX3_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
+
+
+// addressBlock: dpcssys_dpcssys_cr3_dispdec
+//DPCSSYS_CR3_DPCSSYS_CR_ADDR
+#define DPCSSYS_CR3_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
+#define DPCSSYS_CR3_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
+//DPCSSYS_CR3_DPCSSYS_CR_DATA
+#define DPCSSYS_CR3_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
+#define DPCSSYS_CR3_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
+
+
+// addressBlock: dpcssys_dpcs0_dpcstx4_dispdec
+//DPCSTX4_DPCSTX_TX_CLOCK_CNTL
+#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS__SHIFT                                             0x0
+#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN__SHIFT                                                   0x1
+#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON__SHIFT                                             0x2
+#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0x3
+#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_GATE_DIS_MASK                                               0x00000001L
+#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_EN_MASK                                                     0x00000002L
+#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_CLOCK_ON_MASK                                               0x00000004L
+#define DPCSTX4_DPCSTX_TX_CLOCK_CNTL__DPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000008L
+//DPCSTX4_DPCSTX_TX_CNTL
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ__SHIFT                                                 0xc
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING__SHIFT                                             0xd
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_REQ_MASK                                                   0x00001000L
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_PLL_UPDATE_PENDING_MASK                                               0x00002000L
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x00F00000L
+#define DPCSTX4_DPCSTX_TX_CNTL__DPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//DPCSTX4_DPCSTX_CBUS_CNTL
+#define DPCSTX4_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY__SHIFT                                               0x0
+#define DPCSTX4_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET__SHIFT                                                 0x1f
+#define DPCSTX4_DPCSTX_CBUS_CNTL__DPCS_CBUS_WR_CMD_DELAY_MASK                                                 0x000000FFL
+#define DPCSTX4_DPCSTX_CBUS_CNTL__DPCS_CBUS_SOFT_RESET_MASK                                                   0x80000000L
+//DPCSTX4_DPCSTX_INTERRUPT_CNTL
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW__SHIFT                                          0x0
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR__SHIFT                                              0x1
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK__SHIFT                                        0x4
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR__SHIFT                                             0x8
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR__SHIFT                                             0x9
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR__SHIFT                                             0xa
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR__SHIFT                                             0xb
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR__SHIFT                                               0xc
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK__SHIFT                                         0x10
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK__SHIFT                                             0x14
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_OVERFLOW_MASK                                            0x00000001L
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_ERROR_CLR_MASK                                                0x00000002L
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_REG_FIFO_ERROR_MASK_MASK                                          0x00000010L
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX0_FIFO_ERROR_MASK                                               0x00000100L
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX1_FIFO_ERROR_MASK                                               0x00000200L
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX2_FIFO_ERROR_MASK                                               0x00000400L
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX3_FIFO_ERROR_MASK                                               0x00000800L
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX_ERROR_CLR_MASK                                                 0x00001000L
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_TX_FIFO_ERROR_MASK_MASK                                           0x00010000L
+#define DPCSTX4_DPCSTX_INTERRUPT_CNTL__DPCS_INTERRUPT_MASK_MASK                                               0x00100000L
+//DPCSTX4_DPCSTX_PLL_UPDATE_ADDR
+#define DPCSTX4_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR__SHIFT                                           0x0
+#define DPCSTX4_DPCSTX_PLL_UPDATE_ADDR__DPCS_PLL_UPDATE_ADDR_MASK                                             0x0003FFFFL
+//DPCSTX4_DPCSTX_PLL_UPDATE_DATA
+#define DPCSTX4_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA__SHIFT                                           0x0
+#define DPCSTX4_DPCSTX_PLL_UPDATE_DATA__DPCS_PLL_UPDATE_DATA_MASK                                             0xFFFFFFFFL
+//DPCSTX4_DPCSTX_DEBUG_CONFIG
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN__SHIFT                                                       0x0
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL__SHIFT                                               0x1
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL__SHIFT                                            0x4
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL__SHIFT                                       0x8
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS__SHIFT                                                 0xe
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN__SHIFT                                          0x10
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX__SHIFT                                             0x18
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_EN_MASK                                                         0x00000001L
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CFGCLK_SEL_MASK                                                 0x0000000EL
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_SEL_MASK                                              0x00000070L
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_TX_SYMCLK_DIV2_SEL_MASK                                         0x00000700L
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_DBG_CBUS_DIS_MASK                                                   0x00004000L
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_WRITE_EN_MASK                                            0x00010000L
+#define DPCSTX4_DPCSTX_DEBUG_CONFIG__DPCS_TEST_DEBUG_INDEX_MASK                                               0xFF000000L
+
+
+// addressBlock: dpcssys_dpcs0_rdpcstx4_dispdec
+//RDPCSTX4_RDPCSTX_CNTL
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET__SHIFT                                                   0x0
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET__SHIFT                                                   0x4
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN__SHIFT                                                  0xc
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN__SHIFT                                                  0xd
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN__SHIFT                                                  0xe
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN__SHIFT                                                  0xf
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN__SHIFT                                                        0x10
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_START__SHIFT                                                     0x11
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY__SHIFT                                            0x14
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS__SHIFT                                                0x1a
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN__SHIFT                                              0x1c
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN__SHIFT                                       0x1d
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET__SHIFT                                                     0x1f
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_CBUS_SOFT_RESET_MASK                                                     0x00000001L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_SRAM_SOFT_RESET_MASK                                                     0x00000010L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE0_EN_MASK                                                    0x00001000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE1_EN_MASK                                                    0x00002000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE2_EN_MASK                                                    0x00004000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_LANE3_EN_MASK                                                    0x00008000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_EN_MASK                                                          0x00010000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_START_MASK                                                       0x00020000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_FIFO_RD_START_DELAY_MASK                                              0x01F00000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_DPALT_BLOCK_STATUS_MASK                                                  0x04000000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_CR_REGISTER_BLOCK_EN_MASK                                                0x10000000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_NON_DPALT_REGISTER_BLOCK_EN_MASK                                         0x20000000L
+#define RDPCSTX4_RDPCSTX_CNTL__RDPCS_TX_SOFT_RESET_MASK                                                       0x80000000L
+//RDPCSTX4_RDPCSTX_CLOCK_CNTL
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN__SHIFT                                               0x0
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN__SHIFT                                          0x4
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN__SHIFT                                          0x5
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN__SHIFT                                          0x6
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN__SHIFT                                          0x7
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS__SHIFT                                            0xc
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN__SHIFT                                                  0xd
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON__SHIFT                                            0xe
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS__SHIFT                                              0x10
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS__SHIFT                                            0x14
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN__SHIFT                                                  0x15
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON__SHIFT                                            0x16
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_EXT_REFCLK_EN_MASK                                                 0x00000001L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX0_EN_MASK                                            0x00000010L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX1_EN_MASK                                            0x00000020L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX2_EN_MASK                                            0x00000040L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_TX3_EN_MASK                                            0x00000080L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_GATE_DIS_MASK                                              0x00001000L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_EN_MASK                                                    0x00002000L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_CLOCK_ON_MASK                                              0x00004000L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_SRAMCLK_BYPASS_MASK                                                0x00010000L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_GATE_DIS_MASK                                              0x00100000L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_EN_MASK                                                    0x00200000L
+#define RDPCSTX4_RDPCSTX_CLOCK_CNTL__RDPCS_OCLACLK_CLOCK_ON_MASK                                              0x00400000L
+//RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW__SHIFT                                    0x0
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE__SHIFT                                 0x1
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE__SHIFT                                   0x2
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR__SHIFT                                       0x4
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR__SHIFT                                       0x5
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR__SHIFT                                       0x6
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR__SHIFT                                       0x7
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR__SHIFT                                        0x8
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR__SHIFT                             0x9
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR__SHIFT                               0xa
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR__SHIFT                                         0xc
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK__SHIFT                                  0x10
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK__SHIFT                            0x11
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK__SHIFT                              0x12
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK__SHIFT                                   0x14
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_OVERFLOW_MASK                                      0x00000001L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK                                   0x00000002L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK                                     0x00000004L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX0_FIFO_ERROR_MASK                                         0x00000010L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX1_FIFO_ERROR_MASK                                         0x00000020L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX2_FIFO_ERROR_MASK                                         0x00000040L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX3_FIFO_ERROR_MASK                                         0x00000080L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_ERROR_CLR_MASK                                          0x00000100L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_CLR_MASK                               0x00000200L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_CLR_MASK                                 0x00000400L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_ERROR_CLR_MASK                                           0x00001000L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_REG_FIFO_ERROR_MASK_MASK                                    0x00010000L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_DISABLE_TOGGLE_MASK_MASK                              0x00020000L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_DPALT_4LANE_TOGGLE_MASK_MASK                                0x00040000L
+#define RDPCSTX4_RDPCSTX_INTERRUPT_CONTROL__RDPCS_TX_FIFO_ERROR_MASK_MASK                                     0x00100000L
+//RDPCSTX4_RDPCSTX_PLL_UPDATE_DATA
+#define RDPCSTX4_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA__SHIFT                                        0x0
+#define RDPCSTX4_RDPCSTX_PLL_UPDATE_DATA__RDPCS_PLL_UPDATE_DATA_MASK                                          0x00000001L
+//RDPCSTX4_RDPCS_TX_CR_ADDR
+#define RDPCSTX4_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                    0x0
+#define RDPCSTX4_RDPCS_TX_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                      0x0000FFFFL
+//RDPCSTX4_RDPCS_TX_CR_DATA
+#define RDPCSTX4_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                    0x0
+#define RDPCSTX4_RDPCS_TX_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                      0x0000FFFFL
+//RDPCSTX4_RDPCS_TX_SRAM_CNTL
+#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS__SHIFT                                                 0x14
+#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE__SHIFT                                               0x18
+#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE__SHIFT                                           0x1c
+#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_DIS_MASK                                                   0x00100000L
+#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_FORCE_MASK                                                 0x03000000L
+#define RDPCSTX4_RDPCS_TX_SRAM_CNTL__RDPCS_MEM_PWR_PWR_STATE_MASK                                             0x30000000L
+//RDPCSTX4_RDPCSTX_SCRATCH
+#define RDPCSTX4_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH__SHIFT                                                      0x0
+#define RDPCSTX4_RDPCSTX_SCRATCH__RDPCSTX_SCRATCH_MASK                                                        0xFFFFFFFFL
+//RDPCSTX4_RDPCSTX_SPARE
+#define RDPCSTX4_RDPCSTX_SPARE__RDPCSTX_SPARE__SHIFT                                                          0x0
+#define RDPCSTX4_RDPCSTX_SPARE__RDPCSTX_SPARE_MASK                                                            0xFFFFFFFFL
+//RDPCSTX4_RDPCSTX_CNTL2
+#define RDPCSTX4_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY__SHIFT                                            0x0
+#define RDPCSTX4_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL__SHIFT                                             0x1
+#define RDPCSTX4_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_EMPTY_MASK                                              0x00000001L
+#define RDPCSTX4_RDPCSTX_CNTL2__RDPCS_CR_CONVERT_FIFO_FULL_MASK                                               0x00000002L
+//RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG__SHIFT                      0x0
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS__SHIFT              0x4
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE__SHIFT                      0x8
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_DIS_BLOCK_REG_MASK                        0x00000001L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_FORCE_SYMCLK_DIV2_DIS_MASK                0x00000010L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_DIS_BLOCK_REG__RDPCS_DMCU_DPALT_CONTROL_SPARE_MASK                        0x0000FF00L
+//RDPCSTX4_RDPCSTX_DEBUG_CONFIG
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN__SHIFT                                                    0x0
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT__SHIFT                                        0x4
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP__SHIFT                                        0x7
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK__SHIFT                                          0x8
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE__SHIFT                                       0xf
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX__SHIFT                                          0x10
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT__SHIFT                                              0x18
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_EN_MASK                                                      0x00000001L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_8BIT_MASK                                          0x00000070L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_ASYNC_SWAP_MASK                                          0x00000080L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_SEL_TEST_CLK_MASK                                            0x00001F00L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_EXPIRE_MASK                                         0x00008000L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MAX_MASK                                            0x00FF0000L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG__RDPCS_DBG_CR_COUNT_MASK                                                0xFF000000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET__SHIFT                                                    0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET__SHIFT                                            0x1
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N__SHIFT                                          0x2
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN__SHIFT                                           0x3
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT__SHIFT                                                  0x4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE__SHIFT                                          0x8
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE__SHIFT                                                0x9
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ__SHIFT                                                0x11
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK__SHIFT                                                0x12
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL__SHIFT                                              0x14
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL__SHIFT                                               0x15
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN__SHIFT                                            0x18
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT__SHIFT                                        0x19
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE__SHIFT                                               0x1c
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE__SHIFT                                             0x1d
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS__SHIFT                                                  0x1f
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RESET_MASK                                                      0x00000001L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_PHY_RESET_MASK                                              0x00000002L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TCA_APB_RESET_N_MASK                                            0x00000004L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_TEST_POWERDOWN_MASK                                             0x00000008L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_DTB_OUT_MASK                                                    0x00000030L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_HDMIMODE_ENABLE_MASK                                            0x00000100L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_RANGE_MASK                                                  0x00003E00L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_REQ_MASK                                                  0x00020000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_RTUNE_ACK_MASK                                                  0x00040000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_PARA_SEL_MASK                                                0x00100000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_CR_MUX_SEL_MASK                                                 0x00200000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_EN_MASK                                              0x01000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_PHY_REF_CLKDET_RESULT_MASK                                          0x02000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_INIT_DONE_MASK                                                 0x10000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_EXT_LD_DONE_MASK                                               0x20000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL0__RDPCS_SRAM_BYPASS_MASK                                                    0x80000000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL1
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN__SHIFT                                               0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN__SHIFT                                               0x1
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE__SHIFT                                           0x2
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN__SHIFT                                               0x3
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE__SHIFT                                           0x4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET__SHIFT                                              0x5
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN__SHIFT                                               0x6
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE__SHIFT                                           0x7
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PG_MODE_EN_MASK                                                 0x00000001L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_EN_MASK                                                 0x00000002L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PCS_PWR_STABLE_MASK                                             0x00000004L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_EN_MASK                                                 0x00000008L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_PMA_PWR_STABLE_MASK                                             0x00000010L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_DP_PG_RESET_MASK                                                0x00000020L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_EN_MASK                                                 0x00000040L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL1__RDPCS_PHY_ANA_PWR_STABLE_MASK                                             0x00000080L
+//RDPCSTX4_RDPCSTX_PHY_CNTL2
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR__SHIFT                                                  0x3
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN__SHIFT                                 0x4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN__SHIFT                                 0x5
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN__SHIFT                                 0x6
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN__SHIFT                                 0x7
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN__SHIFT                                 0x8
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN__SHIFT                                 0x9
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN__SHIFT                                 0xa
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN__SHIFT                                 0xb
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP4_POR_MASK                                                    0x00000008L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_RX2TX_PAR_LB_EN_MASK                                   0x00000010L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_RX2TX_PAR_LB_EN_MASK                                   0x00000020L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_RX2TX_PAR_LB_EN_MASK                                   0x00000040L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_RX2TX_PAR_LB_EN_MASK                                   0x00000080L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE0_TX2RX_SER_LB_EN_MASK                                   0x00000100L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE1_TX2RX_SER_LB_EN_MASK                                   0x00000200L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE2_TX2RX_SER_LB_EN_MASK                                   0x00000400L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL2__RDPCS_PHY_DP_LANE3_TX2RX_SER_LB_EN_MASK                                   0x00000800L
+//RDPCSTX4_RDPCSTX_PHY_CNTL3
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET__SHIFT                                             0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE__SHIFT                                           0x1
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY__SHIFT                                           0x2
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN__SHIFT                                           0x3
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ__SHIFT                                               0x4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK__SHIFT                                               0x5
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET__SHIFT                                             0x8
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE__SHIFT                                           0x9
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY__SHIFT                                           0xa
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN__SHIFT                                           0xb
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ__SHIFT                                               0xc
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK__SHIFT                                               0xd
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET__SHIFT                                             0x10
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE__SHIFT                                           0x11
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY__SHIFT                                           0x12
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN__SHIFT                                           0x13
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ__SHIFT                                               0x14
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK__SHIFT                                               0x15
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET__SHIFT                                             0x18
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE__SHIFT                                           0x19
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY__SHIFT                                           0x1a
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN__SHIFT                                           0x1b
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ__SHIFT                                               0x1c
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK__SHIFT                                               0x1d
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_MASK                                               0x00000001L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_MASK                                             0x00000002L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_MASK                                             0x00000004L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_MASK                                             0x00000008L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_MASK                                                 0x00000010L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_MASK                                                 0x00000020L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_MASK                                               0x00000100L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_MASK                                             0x00000200L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_MASK                                             0x00000400L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_MASK                                             0x00000800L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_MASK                                                 0x00001000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_MASK                                                 0x00002000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_MASK                                               0x00010000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_MASK                                             0x00020000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_MASK                                             0x00040000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_MASK                                             0x00080000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_MASK                                                 0x00100000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_MASK                                                 0x00200000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_MASK                                               0x01000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_MASK                                             0x02000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_MASK                                             0x04000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_MASK                                             0x08000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_MASK                                                 0x10000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_MASK                                                 0x20000000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL__SHIFT                                         0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT__SHIFT                                            0x4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC__SHIFT                                    0x6
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN__SHIFT                                        0x7
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL__SHIFT                                         0x8
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT__SHIFT                                            0xc
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC__SHIFT                                    0xe
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN__SHIFT                                        0xf
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL__SHIFT                                         0x10
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT__SHIFT                                            0x14
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC__SHIFT                                    0x16
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN__SHIFT                                        0x17
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL__SHIFT                                         0x18
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT__SHIFT                                            0x1c
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC__SHIFT                                    0x1e
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN__SHIFT                                        0x1f
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_TERM_CTRL_MASK                                           0x00000007L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_INVERT_MASK                                              0x00000010L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_BYPASS_EQ_CALC_MASK                                      0x00000040L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX0_HP_PROT_EN_MASK                                          0x00000080L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_TERM_CTRL_MASK                                           0x00000700L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_INVERT_MASK                                              0x00001000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_BYPASS_EQ_CALC_MASK                                      0x00004000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX1_HP_PROT_EN_MASK                                          0x00008000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_TERM_CTRL_MASK                                           0x00070000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_INVERT_MASK                                              0x00100000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_BYPASS_EQ_CALC_MASK                                      0x00400000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX2_HP_PROT_EN_MASK                                          0x00800000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_TERM_CTRL_MASK                                           0x07000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_INVERT_MASK                                              0x10000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_BYPASS_EQ_CALC_MASK                                      0x40000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL4__RDPCS_PHY_DP_TX3_HP_PROT_EN_MASK                                          0x80000000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL5
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD__SHIFT                                               0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE__SHIFT                                              0x1
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH__SHIFT                                             0x4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ__SHIFT                                         0x6
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT__SHIFT                                      0x7
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD__SHIFT                                               0x8
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE__SHIFT                                              0x9
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH__SHIFT                                             0xc
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ__SHIFT                                         0xe
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT__SHIFT                                      0xf
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD__SHIFT                                               0x10
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE__SHIFT                                              0x11
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH__SHIFT                                             0x14
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ__SHIFT                                         0x16
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT__SHIFT                                      0x17
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD__SHIFT                                               0x18
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE__SHIFT                                              0x19
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH__SHIFT                                             0x1c
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ__SHIFT                                         0x1e
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT__SHIFT                                      0x1f
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_LPD_MASK                                                 0x00000001L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_RATE_MASK                                                0x0000000EL
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_WIDTH_MASK                                               0x00000030L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_REQ_MASK                                           0x00000040L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX0_DETRX_RESULT_MASK                                        0x00000080L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_LPD_MASK                                                 0x00000100L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_RATE_MASK                                                0x00000E00L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_WIDTH_MASK                                               0x00003000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_REQ_MASK                                           0x00004000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX1_DETRX_RESULT_MASK                                        0x00008000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_LPD_MASK                                                 0x00010000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_RATE_MASK                                                0x000E0000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_WIDTH_MASK                                               0x00300000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_REQ_MASK                                           0x00400000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX2_DETRX_RESULT_MASK                                        0x00800000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_LPD_MASK                                                 0x01000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_RATE_MASK                                                0x0E000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_WIDTH_MASK                                               0x30000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_REQ_MASK                                           0x40000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL5__RDPCS_PHY_DP_TX3_DETRX_RESULT_MASK                                        0x80000000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL6
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE__SHIFT                                            0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN__SHIFT                                           0x2
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE__SHIFT                                            0x4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN__SHIFT                                           0x6
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE__SHIFT                                            0x8
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN__SHIFT                                           0xa
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE__SHIFT                                            0xc
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN__SHIFT                                           0xe
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4__SHIFT                                                0x10
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE__SHIFT                                            0x11
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK__SHIFT                                        0x12
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN__SHIFT                                            0x13
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ__SHIFT                                           0x14
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_MASK                                              0x00000003L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_MASK                                             0x00000004L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_MASK                                              0x00000030L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_MASK                                             0x00000040L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_MASK                                              0x00000300L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_MASK                                             0x00000400L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_MASK                                              0x00003000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_MASK                                             0x00004000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_MASK                                                  0x00010000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_MASK                                              0x00020000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_MASK                                          0x00040000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_MASK                                              0x00080000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_MASK                                             0x00100000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL7
+#define RDPCSTX4_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN__SHIFT                                       0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT__SHIFT                                      0x10
+#define RDPCSTX4_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_DEN_MASK                                         0x0000FFFFL
+#define RDPCSTX4_RDPCSTX_PHY_CNTL7__RDPCS_PHY_DP_MPLLB_FRACN_QUOT_MASK                                        0xFFFF0000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL8
+#define RDPCSTX4_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK__SHIFT                                        0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL8__RDPCS_PHY_DP_MPLLB_SSC_PEAK_MASK                                          0x000FFFFFL
+//RDPCSTX4_RDPCSTX_PHY_CNTL9
+#define RDPCSTX4_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE__SHIFT                                    0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD__SHIFT                                   0x18
+#define RDPCSTX4_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_STEPSIZE_MASK                                      0x001FFFFFL
+#define RDPCSTX4_RDPCSTX_PHY_CNTL9__RDPCS_PHY_DP_MPLLB_SSC_UP_SPREAD_MASK                                     0x01000000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL10
+#define RDPCSTX4_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM__SHIFT                                      0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL10__RDPCS_PHY_DP_MPLLB_FRACN_REM_MASK                                        0x0000FFFFL
+//RDPCSTX4_RDPCSTX_PHY_CNTL11
+#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER__SHIFT                                     0x4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV__SHIFT                                     0x10
+#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV__SHIFT                                    0x14
+#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV__SHIFT                           0x18
+#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_MPLLB_MULTIPLIER_MASK                                       0x0000FFF0L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_DIV_MASK                                       0x00070000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_DP_REF_CLK_MPLLB_DIV_MASK                                      0x00700000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL11__RDPCS_PHY_HDMI_MPLLB_HDMI_PIXEL_CLK_DIV_MASK                             0x03000000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL12
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN__SHIFT                                    0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN__SHIFT                                   0x2
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV__SHIFT                                     0x4
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE__SHIFT                                          0x7
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN__SHIFT                                         0x8
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_DIV5_CLK_EN_MASK                                      0x00000001L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_WORD_DIV2_EN_MASK                                     0x00000004L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_TX_CLK_DIV_MASK                                       0x00000070L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_STATE_MASK                                            0x00000080L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL12__RDPCS_PHY_DP_MPLLB_SSC_EN_MASK                                           0x00000100L
+//RDPCSTX4_RDPCSTX_PHY_CNTL13
+#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER__SHIFT                                 0x14
+#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN__SHIFT                                     0x1c
+#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN__SHIFT                                       0x1d
+#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE__SHIFT                               0x1e
+#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_MULTIPLIER_MASK                                   0x0FF00000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_DIV_CLK_EN_MASK                                       0x10000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_FORCE_EN_MASK                                         0x20000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL13__RDPCS_PHY_DP_MPLLB_INIT_CAL_DISABLE_MASK                                 0x40000000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL14
+#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE__SHIFT                                      0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN__SHIFT                                       0x18
+#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN__SHIFT                                        0x1c
+#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_CAL_FORCE_MASK                                        0x00000001L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_FRACN_EN_MASK                                         0x01000000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL14__RDPCS_PHY_DP_MPLLB_PMIX_EN_MASK                                          0x10000000L
+//RDPCSTX4_RDPCSTX_PHY_FUSE0
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I__SHIFT                                             0x12
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO__SHIFT                                        0x14
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS__SHIFT                                       0x16
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL__SHIFT                                             0x1d
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_TX0_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_V2I_MASK                                               0x000C0000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_FREQ_VCO_MASK                                          0x00300000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_DP_MPLLB_CP_INT_GS_MASK                                         0x1FC00000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE0__RDPCS_PHY_RX_VREF_CTRL_MASK                                               0xE0000000L
+//RDPCSTX4_RDPCSTX_PHY_FUSE1
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT__SHIFT                                          0x12
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP__SHIFT                                         0x19
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_TX1_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_INT_MASK                                            0x01FC0000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE1__RDPCS_PHY_DP_MPLLB_CP_PROP_MASK                                           0xFE000000L
+//RDPCSTX4_RDPCSTX_PHY_FUSE2
+#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS__SHIFT                                      0x17
+#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_TX2_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE2__RDPCS_PHY_DP_MPLLB_CP_PROP_GS_MASK                                        0x3F800000L
+//RDPCSTX4_RDPCSTX_PHY_FUSE3
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN__SHIFT                                           0x0
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE__SHIFT                                            0x6
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST__SHIFT                                           0xc
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE__SHIFT                                             0x12
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE__SHIFT                                                0x18
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL__SHIFT                                            0x1a
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL__SHIFT                                      0x1d
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_MAIN_MASK                                             0x0000003FL
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_PRE_MASK                                              0x00000FC0L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DP_TX3_EQ_POST_MASK                                             0x0003F000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_FINETUNE_MASK                                               0x00FC0000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_DCO_RANGE_MASK                                                  0x03000000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_TX_VBOOST_LVL_MASK                                              0x1C000000L
+#define RDPCSTX4_RDPCSTX_PHY_FUSE3__RDPCS_PHY_SUP_RX_VCO_VREF_SEL_MASK                                        0xE0000000L
+//RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL
+#define RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL__SHIFT                                        0x0
+#define RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL__SHIFT                                        0x8
+#define RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_REF_LD_VAL_MASK                                          0x0000007FL
+#define RDPCSTX4_RDPCSTX_PHY_RX_LD_VAL__RDPCS_PHY_RX_VCO_LD_VAL_MASK                                          0x001FFF00L
+//RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED__SHIFT                         0x0
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED__SHIFT                       0x1
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED__SHIFT                       0x2
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED__SHIFT                       0x3
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED__SHIFT                           0x4
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED__SHIFT                           0x5
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED__SHIFT                         0x8
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED__SHIFT                       0x9
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED__SHIFT                       0xa
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED__SHIFT                       0xb
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED__SHIFT                           0xc
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED__SHIFT                           0xd
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED__SHIFT                         0x10
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED__SHIFT                       0x11
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED__SHIFT                       0x12
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED__SHIFT                       0x13
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED__SHIFT                           0x14
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED__SHIFT                           0x15
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED__SHIFT                         0x18
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED__SHIFT                       0x19
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED__SHIFT                       0x1a
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED__SHIFT                       0x1b
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED__SHIFT                           0x1c
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED__SHIFT                           0x1d
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_RESET_RESERVED_MASK                           0x00000001L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DISABLE_RESERVED_MASK                         0x00000002L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_CLK_RDY_RESERVED_MASK                         0x00000004L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_DATA_EN_RESERVED_MASK                         0x00000008L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_REQ_RESERVED_MASK                             0x00000010L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX0_ACK_RESERVED_MASK                             0x00000020L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_RESET_RESERVED_MASK                           0x00000100L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DISABLE_RESERVED_MASK                         0x00000200L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_CLK_RDY_RESERVED_MASK                         0x00000400L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_DATA_EN_RESERVED_MASK                         0x00000800L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_REQ_RESERVED_MASK                             0x00001000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX1_ACK_RESERVED_MASK                             0x00002000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_RESET_RESERVED_MASK                           0x00010000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DISABLE_RESERVED_MASK                         0x00020000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_CLK_RDY_RESERVED_MASK                         0x00040000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_DATA_EN_RESERVED_MASK                         0x00080000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_REQ_RESERVED_MASK                             0x00100000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX2_ACK_RESERVED_MASK                             0x00200000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_RESET_RESERVED_MASK                           0x01000000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DISABLE_RESERVED_MASK                         0x02000000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_CLK_RDY_RESERVED_MASK                         0x04000000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_DATA_EN_RESERVED_MASK                         0x08000000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_REQ_RESERVED_MASK                             0x10000000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL3__RDPCS_PHY_DP_TX3_ACK_RESERVED_MASK                             0x20000000L
+//RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED__SHIFT                        0x0
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED__SHIFT                       0x2
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED__SHIFT                        0x4
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED__SHIFT                       0x6
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED__SHIFT                        0x8
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED__SHIFT                       0xa
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED__SHIFT                        0xc
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED__SHIFT                       0xe
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED__SHIFT                            0x10
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED__SHIFT                        0x11
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED__SHIFT                    0x12
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED__SHIFT                        0x13
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED__SHIFT                       0x14
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_PSTATE_RESERVED_MASK                          0x00000003L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX0_MPLL_EN_RESERVED_MASK                         0x00000004L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_PSTATE_RESERVED_MASK                          0x00000030L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX1_MPLL_EN_RESERVED_MASK                         0x00000040L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_PSTATE_RESERVED_MASK                          0x00000300L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX2_MPLL_EN_RESERVED_MASK                         0x00000400L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_PSTATE_RESERVED_MASK                          0x00003000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_TX3_MPLL_EN_RESERVED_MASK                         0x00004000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DP4_RESERVED_MASK                              0x00010000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_RESERVED_MASK                          0x00020000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DPALT_DISABLE_ACK_RESERVED_MASK                      0x00040000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_EN_RESERVED_MASK                          0x00080000L
+#define RDPCSTX4_RDPCSTX_DMCU_DPALT_PHY_CNTL6__RDPCS_PHY_DP_REF_CLK_REQ_RESERVED_MASK                         0x00100000L
+//RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG
+#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS__SHIFT                                  0x0
+#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED__SHIFT                                0x4
+#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE__SHIFT                                  0x8
+#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_ALLOW_DRIVER_ACCESS_MASK                                    0x00000001L
+#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DRIVER_ACCESS_BLOCKED_MASK                                  0x00000010L
+#define RDPCSTX4_RDPCSTX_DPALT_CONTROL_REG__RDPCS_DPALT_CONTROL_SPARE_MASK                                    0x0000FF00L
+//RDPCSTX4_RDPCSTX_PHY_CNTL15
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP__SHIFT                                        0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP__SHIFT                                      0x10
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP__SHIFT                                      0x11
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP__SHIFT                                      0x12
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP__SHIFT                                      0x13
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP__SHIFT                                              0x14
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SSTX_VREGDRV_BYP_MASK                                          0x00000001L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX0_VREGDRV_BYP_MASK                                        0x00010000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX1_VREGDRV_BYP_MASK                                        0x00020000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX2_VREGDRV_BYP_MASK                                        0x00040000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_DP_TX3_VREGDRV_BYP_MASK                                        0x00080000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL15__RDPCS_PHY_SUP_PRE_HP_MASK                                                0x00100000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL16
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS__SHIFT                                  0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS__SHIFT                                  0x6
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS__SHIFT                                  0xc
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS__SHIFT                                  0x12
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS__SHIFT                                     0x18
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX0_OUT_GENERIC_BUS_MASK                                    0x0000001FL
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX1_OUT_GENERIC_BUS_MASK                                    0x000007C0L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX2_OUT_GENERIC_BUS_MASK                                    0x0001F000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_DP_TX3_OUT_GENERIC_BUS_MASK                                    0x007C0000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL16__RDPCS_PHY_CMN_OUT_GENERIC_BUS_MASK                                       0x1F000000L
+//RDPCSTX4_RDPCSTX_PHY_CNTL17
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS__SHIFT                                   0x0
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS__SHIFT                                   0x6
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS__SHIFT                                   0xc
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS__SHIFT                                   0x12
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS__SHIFT                                      0x18
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX0_IN_GENERIC_BUS_MASK                                     0x0000001FL
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX1_IN_GENERIC_BUS_MASK                                     0x000007C0L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX2_IN_GENERIC_BUS_MASK                                     0x0001F000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_DP_TX3_IN_GENERIC_BUS_MASK                                     0x007C0000L
+#define RDPCSTX4_RDPCSTX_PHY_CNTL17__RDPCS_PHY_CMN_IN_GENERIC_BUS_MASK                                        0x1F000000L
+//RDPCSTX4_RDPCSTX_DEBUG_CONFIG2
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0__SHIFT                                            0x0
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1__SHIFT                                            0x4
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2__SHIFT                                            0x8
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3__SHIFT                                            0xc
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB__SHIFT                               0x10
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC0_MASK                                              0x00000007L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC1_MASK                                              0x00000070L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC2_MASK                                              0x00000700L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_SRC3_MASK                                              0x00007000L
+#define RDPCSTX4_RDPCSTX_DEBUG_CONFIG2__RDPCS_DBG_OCLA_VALID_REPLACE_MSB_MASK                                 0x00010000L
+
+
+// addressBlock: dpcssys_dpcssys_cr4_dispdec
+//DPCSSYS_CR4_DPCSSYS_CR_ADDR
+#define DPCSSYS_CR4_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR__SHIFT                                                  0x0
+#define DPCSSYS_CR4_DPCSSYS_CR_ADDR__RDPCS_TX_CR_ADDR_MASK                                                    0x0000FFFFL
+//DPCSSYS_CR4_DPCSSYS_CR_DATA
+#define DPCSSYS_CR4_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA__SHIFT                                                  0x0
+#define DPCSSYS_CR4_DPCSSYS_CR_DATA__RDPCS_TX_CR_DATA_MASK                                                    0x0000FFFFL
+
+#endif
-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

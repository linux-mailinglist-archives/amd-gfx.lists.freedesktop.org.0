Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4D518F4B
	for <lists+amd-gfx@lfdr.de>; Tue,  3 May 2022 22:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A0310F433;
	Tue,  3 May 2022 20:47:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C9E10F428
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 May 2022 20:47:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Icu3zPTmOGGLbASUYWur2Zsivu2gwlP1kZgoJgMawgdylyV0IiMEzjJQnkRkUNv1A+fDovdBE/SBjZqVY+nfIwsI6hSC1dC1V3spaZtOBsiQEVfCgV1j8lFPoHklMPuAv0fDKEa8KSmk3G/9cmQ2UJKkl5KUu+/APUhlBM7vTznSy0UReZIa+jHMAbXfpeEYk7nRs8FZD5UlUKlwYks4nEcbf7ctELAStIfp62PofpBYJLDJJIP41n8rAM+aqK8rMvcWMtuF66HOvIAgqKG8FZzMpcy136t8nyd1ZKvl3hXzf/5boKnqFUl6n2yC/tM/oAlvv7HdyeKk6IIULQR93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeRxfPP7xVSqMjZsAcfGcqod3U6+vegx4fqPYDKM3MI=;
 b=WPl6VkpQ/7dI33kEJBtRptFKT7ugBzOEebZoZsAEqk9ClBlHxoCyAKRm1yFJs1aV2nCYpAgtP5hF7jshwqsyp0z3bchKbpZzP9vyO1rh/ddw968+jGxSAEioVQn7XFXiOJ4OXSVWpCFKputw04m+swhm/WJDvtaEsqj99XJc8wH4nx/SjGKcYi7ZOSOQfUWgpOPgICZmMHzvPuJVpp8DGoXSgyp97NBfpWKW/sPtKOf1rD7HQ5JqWDv/8saYxDdWzqnd2Jkj1Fna8CxpUT8Kaf0FT5BY/oLrsp4UpPAU0VyQiznr8mJVXgjtm4IBU35s8HiabLOHUiQx8Y+YmnnTFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeRxfPP7xVSqMjZsAcfGcqod3U6+vegx4fqPYDKM3MI=;
 b=tcjkk+jcXnMKjVAiO3Qv/au0pJsDP77coLRlCocEpOJkbqeQSBdxJoluZH9Ogwl894u1flfsQDylB6tnaCqXkzldGKqdXfoyPF9gFx097mk3nRZe9tObOltdfU/kWUalMeyGBXlFc3Q8zY69CEjMCdscy8lLnOnfkf0Wd34cpnU=
Received: from DS7PR03CA0122.namprd03.prod.outlook.com (2603:10b6:5:3b4::7) by
 MN0PR12MB5714.namprd12.prod.outlook.com (2603:10b6:208:371::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Tue, 3 May 2022 20:47:03 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::d6) by DS7PR03CA0122.outlook.office365.com
 (2603:10b6:5:3b4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.26 via Frontend
 Transport; Tue, 3 May 2022 20:47:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 20:47:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 3 May
 2022 15:46:58 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: add hdp v5_2_1 ip headers
Date: Tue, 3 May 2022 16:46:43 -0400
Message-ID: <20220503204645.1266993-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503204645.1266993-1-alexander.deucher@amd.com>
References: <20220503204645.1266993-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d394133-5328-48fb-76dd-08da2d46143c
X-MS-TrafficTypeDiagnostic: MN0PR12MB5714:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB5714144A7B7C55A9F790CD92F7C09@MN0PR12MB5714.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ZT3bG4Ki9IYHaetnjs5W5JDVREYP9/QLqK8xtjUriyCpEWCY9LJVlNdOOcLFHTB+vQBPx+ciQ33N+xfVoK4y3dj1Najpj3I+wBBa19uNo8YDvJxfgiYV9TCOkXkA8dT5kMzyhFR0CMTArqZb8Lyk46Kb0UVXs+5WOCgCkqY4pZ2rbqKHcI6Y7h71e9l6VFndGpQLs+tzEjIyRj4mHuWFyt+e5szhPjLK3p9AgXcdejIS451kFZ+WgvqUWDPNxaZLm5+hULSPUjDzE61TKuTXqNLjTK1Z1pYgVYPJgt3Yn1FDsaSODVAG9iJldNY/H1xvTRK1t+dbStL+ilmbAijdhe6oQlqNCHrO6888lfWzEypT/JrSdI0XsyFK2K/p00kCrOvKK3OIXVNhxA7sMtcEP01qNIvjzueW+3M+ogNcS2koZWgOGxfnowcqpnzJvXin0FFH5bs3shq6PLfCnwa4Cn8DW9WMm2XSbOOkqw9ty1HyqGkVxwY+PLtrj/+5vZn1mGTjaebrfkjfqY1H3FhTN+esQ0g2m/mL9td/xeS1SOhEdE1X/E4Z/RWG0hYRqB18FovI7aIz//Nn3Ew95ytnZHi6A0Gcxgws5YMf4VlBssEyZMAd/J2Q03HqJ0/aIdedSaGGOU9R904dXB44tjTAVI+bjwVmtXRTVVHWHjM6x2cZkY9lbhMXMmKAky1O5igS1a5TYyu0w1zf3nop3sNdQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(54906003)(8936002)(356005)(316002)(6916009)(186003)(508600001)(36860700001)(82310400005)(36756003)(4326008)(47076005)(70586007)(81166007)(70206006)(16526019)(1076003)(8676002)(336012)(426003)(2616005)(2906002)(6666004)(7696005)(40460700003)(83380400001)(26005)(86362001)(30864003)(5660300002)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 20:47:03.5720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d394133-5328-48fb-76dd-08da2d46143c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5714
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Huang Rui <ray.huang@amd.com>

Add hdp v5.2.1 offset and shift mask ip header files.

v2: squash in updates (Alex)

Signed-off-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Aaron Liu <aaron.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../include/asic_reg/hdp/hdp_5_2_1_offset.h   | 217 ++++++
 .../include/asic_reg/hdp/hdp_5_2_1_sh_mask.h  | 684 ++++++++++++++++++
 2 files changed, 901 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_sh_mask.h

diff --git a/drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_offset.h b/drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_offset.h
new file mode 100644
index 000000000000..029e3381f9c1
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_offset.h
@@ -0,0 +1,217 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#ifndef _hdp_5_2_1_OFFSET_HEADER
+#define _hdp_5_2_1_OFFSET_HEADER
+
+
+
+// addressBlock: hdp_hdpdec
+// base address: 0x3c80
+#define regHDP_MMHUB_TLVL                                                                               0x0000
+#define regHDP_MMHUB_TLVL_BASE_IDX                                                                      0
+#define regHDP_MMHUB_UNITID                                                                             0x0001
+#define regHDP_MMHUB_UNITID_BASE_IDX                                                                    0
+#define regHDP_NONSURFACE_BASE                                                                          0x0040
+#define regHDP_NONSURFACE_BASE_BASE_IDX                                                                 0
+#define regHDP_NONSURFACE_INFO                                                                          0x0041
+#define regHDP_NONSURFACE_INFO_BASE_IDX                                                                 0
+#define regHDP_NONSURFACE_BASE_HI                                                                       0x0042
+#define regHDP_NONSURFACE_BASE_HI_BASE_IDX                                                              0
+#define regHDP_SURFACE_WRITE_FLAGS                                                                      0x00c4
+#define regHDP_SURFACE_WRITE_FLAGS_BASE_IDX                                                             0
+#define regHDP_SURFACE_READ_FLAGS                                                                       0x00c5
+#define regHDP_SURFACE_READ_FLAGS_BASE_IDX                                                              0
+#define regHDP_SURFACE_WRITE_FLAGS_CLR                                                                  0x00c6
+#define regHDP_SURFACE_WRITE_FLAGS_CLR_BASE_IDX                                                         0
+#define regHDP_SURFACE_READ_FLAGS_CLR                                                                   0x00c7
+#define regHDP_SURFACE_READ_FLAGS_CLR_BASE_IDX                                                          0
+#define regHDP_NONSURF_FLAGS                                                                            0x00c8
+#define regHDP_NONSURF_FLAGS_BASE_IDX                                                                   0
+#define regHDP_NONSURF_FLAGS_CLR                                                                        0x00c9
+#define regHDP_NONSURF_FLAGS_CLR_BASE_IDX                                                               0
+#define regHDP_HOST_PATH_CNTL                                                                           0x00cc
+#define regHDP_HOST_PATH_CNTL_BASE_IDX                                                                  0
+#define regHDP_SW_SEMAPHORE                                                                             0x00cd
+#define regHDP_SW_SEMAPHORE_BASE_IDX                                                                    0
+#define regHDP_DEBUG0                                                                                   0x00ce
+#define regHDP_DEBUG0_BASE_IDX                                                                          0
+#define regHDP_LAST_SURFACE_HIT                                                                         0x00d0
+#define regHDP_LAST_SURFACE_HIT_BASE_IDX                                                                0
+#define regHDP_OUTSTANDING_REQ                                                                          0x00d2
+#define regHDP_OUTSTANDING_REQ_BASE_IDX                                                                 0
+#define regHDP_MISC_CNTL                                                                                0x00d3
+#define regHDP_MISC_CNTL_BASE_IDX                                                                       0
+#define regHDP_MEM_POWER_CTRL                                                                           0x00d4
+#define regHDP_MEM_POWER_CTRL_BASE_IDX                                                                  0
+#define regHDP_MMHUB_CNTL                                                                               0x00d5
+#define regHDP_MMHUB_CNTL_BASE_IDX                                                                      0
+#define regHDP_VERSION                                                                                  0x00d7
+#define regHDP_VERSION_BASE_IDX                                                                         0
+#define regHDP_CLK_CNTL                                                                                 0x00d8
+#define regHDP_CLK_CNTL_BASE_IDX                                                                        0
+#define regHDP_MEMIO_CNTL                                                                               0x00f6
+#define regHDP_MEMIO_CNTL_BASE_IDX                                                                      0
+#define regHDP_MEMIO_ADDR                                                                               0x00f7
+#define regHDP_MEMIO_ADDR_BASE_IDX                                                                      0
+#define regHDP_MEMIO_STATUS                                                                             0x00f8
+#define regHDP_MEMIO_STATUS_BASE_IDX                                                                    0
+#define regHDP_MEMIO_WR_DATA                                                                            0x00f9
+#define regHDP_MEMIO_WR_DATA_BASE_IDX                                                                   0
+#define regHDP_MEMIO_RD_DATA                                                                            0x00fa
+#define regHDP_MEMIO_RD_DATA_BASE_IDX                                                                   0
+#define regHDP_XDP_DIRECT2HDP_FIRST                                                                     0x0100
+#define regHDP_XDP_DIRECT2HDP_FIRST_BASE_IDX                                                            0
+#define regHDP_XDP_D2H_FLUSH                                                                            0x0101
+#define regHDP_XDP_D2H_FLUSH_BASE_IDX                                                                   0
+#define regHDP_XDP_D2H_BAR_UPDATE                                                                       0x0102
+#define regHDP_XDP_D2H_BAR_UPDATE_BASE_IDX                                                              0
+#define regHDP_XDP_D2H_RSVD_3                                                                           0x0103
+#define regHDP_XDP_D2H_RSVD_3_BASE_IDX                                                                  0
+#define regHDP_XDP_D2H_RSVD_4                                                                           0x0104
+#define regHDP_XDP_D2H_RSVD_4_BASE_IDX                                                                  0
+#define regHDP_XDP_D2H_RSVD_5                                                                           0x0105
+#define regHDP_XDP_D2H_RSVD_5_BASE_IDX                                                                  0
+#define regHDP_XDP_D2H_RSVD_6                                                                           0x0106
+#define regHDP_XDP_D2H_RSVD_6_BASE_IDX                                                                  0
+#define regHDP_XDP_D2H_RSVD_7                                                                           0x0107
+#define regHDP_XDP_D2H_RSVD_7_BASE_IDX                                                                  0
+#define regHDP_XDP_D2H_RSVD_8                                                                           0x0108
+#define regHDP_XDP_D2H_RSVD_8_BASE_IDX                                                                  0
+#define regHDP_XDP_D2H_RSVD_9                                                                           0x0109
+#define regHDP_XDP_D2H_RSVD_9_BASE_IDX                                                                  0
+#define regHDP_XDP_D2H_RSVD_10                                                                          0x010a
+#define regHDP_XDP_D2H_RSVD_10_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_11                                                                          0x010b
+#define regHDP_XDP_D2H_RSVD_11_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_12                                                                          0x010c
+#define regHDP_XDP_D2H_RSVD_12_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_13                                                                          0x010d
+#define regHDP_XDP_D2H_RSVD_13_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_14                                                                          0x010e
+#define regHDP_XDP_D2H_RSVD_14_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_15                                                                          0x010f
+#define regHDP_XDP_D2H_RSVD_15_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_16                                                                          0x0110
+#define regHDP_XDP_D2H_RSVD_16_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_17                                                                          0x0111
+#define regHDP_XDP_D2H_RSVD_17_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_18                                                                          0x0112
+#define regHDP_XDP_D2H_RSVD_18_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_19                                                                          0x0113
+#define regHDP_XDP_D2H_RSVD_19_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_20                                                                          0x0114
+#define regHDP_XDP_D2H_RSVD_20_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_21                                                                          0x0115
+#define regHDP_XDP_D2H_RSVD_21_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_22                                                                          0x0116
+#define regHDP_XDP_D2H_RSVD_22_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_23                                                                          0x0117
+#define regHDP_XDP_D2H_RSVD_23_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_24                                                                          0x0118
+#define regHDP_XDP_D2H_RSVD_24_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_25                                                                          0x0119
+#define regHDP_XDP_D2H_RSVD_25_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_26                                                                          0x011a
+#define regHDP_XDP_D2H_RSVD_26_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_27                                                                          0x011b
+#define regHDP_XDP_D2H_RSVD_27_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_28                                                                          0x011c
+#define regHDP_XDP_D2H_RSVD_28_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_29                                                                          0x011d
+#define regHDP_XDP_D2H_RSVD_29_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_30                                                                          0x011e
+#define regHDP_XDP_D2H_RSVD_30_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_31                                                                          0x011f
+#define regHDP_XDP_D2H_RSVD_31_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_32                                                                          0x0120
+#define regHDP_XDP_D2H_RSVD_32_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_33                                                                          0x0121
+#define regHDP_XDP_D2H_RSVD_33_BASE_IDX                                                                 0
+#define regHDP_XDP_D2H_RSVD_34                                                                          0x0122
+#define regHDP_XDP_D2H_RSVD_34_BASE_IDX                                                                 0
+#define regHDP_XDP_DIRECT2HDP_LAST                                                                      0x0123
+#define regHDP_XDP_DIRECT2HDP_LAST_BASE_IDX                                                             0
+#define regHDP_XDP_P2P_BAR_CFG                                                                          0x0124
+#define regHDP_XDP_P2P_BAR_CFG_BASE_IDX                                                                 0
+#define regHDP_XDP_P2P_MBX_OFFSET                                                                       0x0125
+#define regHDP_XDP_P2P_MBX_OFFSET_BASE_IDX                                                              0
+#define regHDP_XDP_P2P_MBX_ADDR0                                                                        0x0126
+#define regHDP_XDP_P2P_MBX_ADDR0_BASE_IDX                                                               0
+#define regHDP_XDP_P2P_MBX_ADDR1                                                                        0x0127
+#define regHDP_XDP_P2P_MBX_ADDR1_BASE_IDX                                                               0
+#define regHDP_XDP_P2P_MBX_ADDR2                                                                        0x0128
+#define regHDP_XDP_P2P_MBX_ADDR2_BASE_IDX                                                               0
+#define regHDP_XDP_P2P_MBX_ADDR3                                                                        0x0129
+#define regHDP_XDP_P2P_MBX_ADDR3_BASE_IDX                                                               0
+#define regHDP_XDP_P2P_MBX_ADDR4                                                                        0x012a
+#define regHDP_XDP_P2P_MBX_ADDR4_BASE_IDX                                                               0
+#define regHDP_XDP_P2P_MBX_ADDR5                                                                        0x012b
+#define regHDP_XDP_P2P_MBX_ADDR5_BASE_IDX                                                               0
+#define regHDP_XDP_P2P_MBX_ADDR6                                                                        0x012c
+#define regHDP_XDP_P2P_MBX_ADDR6_BASE_IDX                                                               0
+#define regHDP_XDP_HDP_MBX_MC_CFG                                                                       0x012d
+#define regHDP_XDP_HDP_MBX_MC_CFG_BASE_IDX                                                              0
+#define regHDP_XDP_HDP_MC_CFG                                                                           0x012e
+#define regHDP_XDP_HDP_MC_CFG_BASE_IDX                                                                  0
+#define regHDP_XDP_HST_CFG                                                                              0x012f
+#define regHDP_XDP_HST_CFG_BASE_IDX                                                                     0
+#define regHDP_XDP_HDP_IPH_CFG                                                                          0x0131
+#define regHDP_XDP_HDP_IPH_CFG_BASE_IDX                                                                 0
+#define regHDP_XDP_P2P_BAR0                                                                             0x0134
+#define regHDP_XDP_P2P_BAR0_BASE_IDX                                                                    0
+#define regHDP_XDP_P2P_BAR1                                                                             0x0135
+#define regHDP_XDP_P2P_BAR1_BASE_IDX                                                                    0
+#define regHDP_XDP_P2P_BAR2                                                                             0x0136
+#define regHDP_XDP_P2P_BAR2_BASE_IDX                                                                    0
+#define regHDP_XDP_P2P_BAR3                                                                             0x0137
+#define regHDP_XDP_P2P_BAR3_BASE_IDX                                                                    0
+#define regHDP_XDP_P2P_BAR4                                                                             0x0138
+#define regHDP_XDP_P2P_BAR4_BASE_IDX                                                                    0
+#define regHDP_XDP_P2P_BAR5                                                                             0x0139
+#define regHDP_XDP_P2P_BAR5_BASE_IDX                                                                    0
+#define regHDP_XDP_P2P_BAR6                                                                             0x013a
+#define regHDP_XDP_P2P_BAR6_BASE_IDX                                                                    0
+#define regHDP_XDP_P2P_BAR7                                                                             0x013b
+#define regHDP_XDP_P2P_BAR7_BASE_IDX                                                                    0
+#define regHDP_XDP_FLUSH_ARMED_STS                                                                      0x013c
+#define regHDP_XDP_FLUSH_ARMED_STS_BASE_IDX                                                             0
+#define regHDP_XDP_FLUSH_CNTR0_STS                                                                      0x013d
+#define regHDP_XDP_FLUSH_CNTR0_STS_BASE_IDX                                                             0
+#define regHDP_XDP_BUSY_STS                                                                             0x013e
+#define regHDP_XDP_BUSY_STS_BASE_IDX                                                                    0
+#define regHDP_XDP_STICKY                                                                               0x013f
+#define regHDP_XDP_STICKY_BASE_IDX                                                                      0
+#define regHDP_XDP_CHKN                                                                                 0x0140
+#define regHDP_XDP_CHKN_BASE_IDX                                                                        0
+#define regHDP_XDP_BARS_ADDR_39_36                                                                      0x0144
+#define regHDP_XDP_BARS_ADDR_39_36_BASE_IDX                                                             0
+#define regHDP_XDP_MC_VM_FB_LOCATION_BASE                                                               0x0145
+#define regHDP_XDP_MC_VM_FB_LOCATION_BASE_BASE_IDX                                                      0
+#define regHDP_XDP_GPU_IOV_VIOLATION_LOG                                                                0x0148
+#define regHDP_XDP_GPU_IOV_VIOLATION_LOG_BASE_IDX                                                       0
+#define regHDP_XDP_GPU_IOV_VIOLATION_LOG2                                                               0x0149
+#define regHDP_XDP_GPU_IOV_VIOLATION_LOG2_BASE_IDX                                                      0
+#define regHDP_XDP_MMHUB_ERROR                                                                          0x014a
+#define regHDP_XDP_MMHUB_ERROR_BASE_IDX                                                                 0
+
+#endif
diff --git a/drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_sh_mask.h
new file mode 100644
index 000000000000..2d5e43def8fa
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_sh_mask.h
@@ -0,0 +1,684 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#ifndef _hdp_5_2_1_SH_MASK_HEADER
+#define _hdp_5_2_1_SH_MASK_HEADER
+
+
+// addressBlock: hdp_hdpdec
+//HDP_MMHUB_TLVL
+#define HDP_MMHUB_TLVL__HDP_WR_TLVL__SHIFT                                                                    0x0
+#define HDP_MMHUB_TLVL__HDP_RD_TLVL__SHIFT                                                                    0x4
+#define HDP_MMHUB_TLVL__XDP_WR_TLVL__SHIFT                                                                    0x8
+#define HDP_MMHUB_TLVL__XDP_RD_TLVL__SHIFT                                                                    0xc
+#define HDP_MMHUB_TLVL__XDP_MBX_WR_TLVL__SHIFT                                                                0x10
+#define HDP_MMHUB_TLVL__HDP_WR_TLVL_MASK                                                                      0x0000000FL
+#define HDP_MMHUB_TLVL__HDP_RD_TLVL_MASK                                                                      0x000000F0L
+#define HDP_MMHUB_TLVL__XDP_WR_TLVL_MASK                                                                      0x00000F00L
+#define HDP_MMHUB_TLVL__XDP_RD_TLVL_MASK                                                                      0x0000F000L
+#define HDP_MMHUB_TLVL__XDP_MBX_WR_TLVL_MASK                                                                  0x000F0000L
+//HDP_MMHUB_UNITID
+#define HDP_MMHUB_UNITID__HDP_UNITID__SHIFT                                                                   0x0
+#define HDP_MMHUB_UNITID__XDP_UNITID__SHIFT                                                                   0x8
+#define HDP_MMHUB_UNITID__XDP_MBX_UNITID__SHIFT                                                               0x10
+#define HDP_MMHUB_UNITID__HDP_UNITID_MASK                                                                     0x0000003FL
+#define HDP_MMHUB_UNITID__XDP_UNITID_MASK                                                                     0x00003F00L
+#define HDP_MMHUB_UNITID__XDP_MBX_UNITID_MASK                                                                 0x003F0000L
+//HDP_NONSURFACE_BASE
+#define HDP_NONSURFACE_BASE__NONSURF_BASE_39_8__SHIFT                                                         0x0
+#define HDP_NONSURFACE_BASE__NONSURF_BASE_39_8_MASK                                                           0xFFFFFFFFL
+//HDP_NONSURFACE_INFO
+#define HDP_NONSURFACE_INFO__NONSURF_SWAP__SHIFT                                                              0x4
+#define HDP_NONSURFACE_INFO__NONSURF_VMID__SHIFT                                                              0x8
+#define HDP_NONSURFACE_INFO__NONSURF_SWAP_MASK                                                                0x00000030L
+#define HDP_NONSURFACE_INFO__NONSURF_VMID_MASK                                                                0x00000F00L
+//HDP_NONSURFACE_BASE_HI
+#define HDP_NONSURFACE_BASE_HI__NONSURF_BASE_47_40__SHIFT                                                     0x0
+#define HDP_NONSURFACE_BASE_HI__NONSURF_BASE_47_40_MASK                                                       0x000000FFL
+//HDP_SURFACE_WRITE_FLAGS
+#define HDP_SURFACE_WRITE_FLAGS__SURF0_WRITE_FLAG__SHIFT                                                      0x0
+#define HDP_SURFACE_WRITE_FLAGS__SURF1_WRITE_FLAG__SHIFT                                                      0x1
+#define HDP_SURFACE_WRITE_FLAGS__SURF0_WRITE_FLAG_MASK                                                        0x00000001L
+#define HDP_SURFACE_WRITE_FLAGS__SURF1_WRITE_FLAG_MASK                                                        0x00000002L
+//HDP_SURFACE_READ_FLAGS
+#define HDP_SURFACE_READ_FLAGS__SURF0_READ_FLAG__SHIFT                                                        0x0
+#define HDP_SURFACE_READ_FLAGS__SURF1_READ_FLAG__SHIFT                                                        0x1
+#define HDP_SURFACE_READ_FLAGS__SURF0_READ_FLAG_MASK                                                          0x00000001L
+#define HDP_SURFACE_READ_FLAGS__SURF1_READ_FLAG_MASK                                                          0x00000002L
+//HDP_SURFACE_WRITE_FLAGS_CLR
+#define HDP_SURFACE_WRITE_FLAGS_CLR__SURF0_WRITE_FLAG_CLR__SHIFT                                              0x0
+#define HDP_SURFACE_WRITE_FLAGS_CLR__SURF1_WRITE_FLAG_CLR__SHIFT                                              0x1
+#define HDP_SURFACE_WRITE_FLAGS_CLR__SURF0_WRITE_FLAG_CLR_MASK                                                0x00000001L
+#define HDP_SURFACE_WRITE_FLAGS_CLR__SURF1_WRITE_FLAG_CLR_MASK                                                0x00000002L
+//HDP_SURFACE_READ_FLAGS_CLR
+#define HDP_SURFACE_READ_FLAGS_CLR__SURF0_READ_FLAG_CLR__SHIFT                                                0x0
+#define HDP_SURFACE_READ_FLAGS_CLR__SURF1_READ_FLAG_CLR__SHIFT                                                0x1
+#define HDP_SURFACE_READ_FLAGS_CLR__SURF0_READ_FLAG_CLR_MASK                                                  0x00000001L
+#define HDP_SURFACE_READ_FLAGS_CLR__SURF1_READ_FLAG_CLR_MASK                                                  0x00000002L
+//HDP_NONSURF_FLAGS
+#define HDP_NONSURF_FLAGS__NONSURF_WRITE_FLAG__SHIFT                                                          0x0
+#define HDP_NONSURF_FLAGS__NONSURF_READ_FLAG__SHIFT                                                           0x1
+#define HDP_NONSURF_FLAGS__NONSURF_WRITE_FLAG_MASK                                                            0x00000001L
+#define HDP_NONSURF_FLAGS__NONSURF_READ_FLAG_MASK                                                             0x00000002L
+//HDP_NONSURF_FLAGS_CLR
+#define HDP_NONSURF_FLAGS_CLR__NONSURF_WRITE_FLAG_CLR__SHIFT                                                  0x0
+#define HDP_NONSURF_FLAGS_CLR__NONSURF_READ_FLAG_CLR__SHIFT                                                   0x1
+#define HDP_NONSURF_FLAGS_CLR__NONSURF_WRITE_FLAG_CLR_MASK                                                    0x00000001L
+#define HDP_NONSURF_FLAGS_CLR__NONSURF_READ_FLAG_CLR_MASK                                                     0x00000002L
+//HDP_HOST_PATH_CNTL
+#define HDP_HOST_PATH_CNTL__WR_STALL_TIMER__SHIFT                                                             0x9
+#define HDP_HOST_PATH_CNTL__RD_STALL_TIMER__SHIFT                                                             0xb
+#define HDP_HOST_PATH_CNTL__WRITE_COMBINE_TIMER_PRELOAD_CFG__SHIFT                                            0x12
+#define HDP_HOST_PATH_CNTL__WRITE_COMBINE_TIMER__SHIFT                                                        0x13
+#define HDP_HOST_PATH_CNTL__WRITE_COMBINE_EN__SHIFT                                                           0x15
+#define HDP_HOST_PATH_CNTL__WRITE_COMBINE_64B_EN__SHIFT                                                       0x16
+#define HDP_HOST_PATH_CNTL__ALL_SURFACES_DIS__SHIFT                                                           0x1d
+#define HDP_HOST_PATH_CNTL__WR_STALL_TIMER_MASK                                                               0x00000600L
+#define HDP_HOST_PATH_CNTL__RD_STALL_TIMER_MASK                                                               0x00001800L
+#define HDP_HOST_PATH_CNTL__WRITE_COMBINE_TIMER_PRELOAD_CFG_MASK                                              0x00040000L
+#define HDP_HOST_PATH_CNTL__WRITE_COMBINE_TIMER_MASK                                                          0x00180000L
+#define HDP_HOST_PATH_CNTL__WRITE_COMBINE_EN_MASK                                                             0x00200000L
+#define HDP_HOST_PATH_CNTL__WRITE_COMBINE_64B_EN_MASK                                                         0x00400000L
+#define HDP_HOST_PATH_CNTL__ALL_SURFACES_DIS_MASK                                                             0x20000000L
+//HDP_SW_SEMAPHORE
+#define HDP_SW_SEMAPHORE__SW_SEMAPHORE__SHIFT                                                                 0x0
+#define HDP_SW_SEMAPHORE__SW_SEMAPHORE_MASK                                                                   0xFFFFFFFFL
+//HDP_DEBUG0
+#define HDP_DEBUG0__HDP_DEBUG__SHIFT                                                                          0x0
+#define HDP_DEBUG0__HDP_DEBUG_MASK                                                                            0xFFFFFFFFL
+//HDP_LAST_SURFACE_HIT
+#define HDP_LAST_SURFACE_HIT__LAST_SURFACE_HIT__SHIFT                                                         0x0
+#define HDP_LAST_SURFACE_HIT__LAST_SURFACE_HIT_MASK                                                           0x00000003L
+//HDP_OUTSTANDING_REQ
+#define HDP_OUTSTANDING_REQ__WRITE_REQ__SHIFT                                                                 0x0
+#define HDP_OUTSTANDING_REQ__READ_REQ__SHIFT                                                                  0x8
+#define HDP_OUTSTANDING_REQ__WRITE_REQ_MASK                                                                   0x000000FFL
+#define HDP_OUTSTANDING_REQ__READ_REQ_MASK                                                                    0x0000FF00L
+//HDP_MISC_CNTL
+#define HDP_MISC_CNTL__IDLE_HYSTERESIS_CNTL__SHIFT                                                            0x2
+#define HDP_MISC_CNTL__OUTSTANDING_WRITE_COUNT_1024__SHIFT                                                    0x5
+#define HDP_MISC_CNTL__MMHUB_EARLY_WRACK_ENABLE__SHIFT                                                        0x8
+#define HDP_MISC_CNTL__EARLY_WRACK_MISSING_PROTECT_ENABLE__SHIFT                                              0x9
+#define HDP_MISC_CNTL__SIMULTANEOUS_READS_WRITES__SHIFT                                                       0xb
+#define HDP_MISC_CNTL__READ_BUFFER_WATERMARK__SHIFT                                                           0xe
+#define HDP_MISC_CNTL__NACK_ENABLE__SHIFT                                                                     0x13
+#define HDP_MISC_CNTL__ATOMIC_NACK_ENABLE__SHIFT                                                              0x14
+#define HDP_MISC_CNTL__FED_ENABLE__SHIFT                                                                      0x15
+#define HDP_MISC_CNTL__ATOMIC_FED_ENABLE__SHIFT                                                               0x16
+#define HDP_MISC_CNTL__SYSHUB_CHANNEL_PRIORITY__SHIFT                                                         0x17
+#define HDP_MISC_CNTL__MMHUB_WRBURST_ENABLE__SHIFT                                                            0x18
+#define HDP_MISC_CNTL__MMHUB_WRBURST_SIZE__SHIFT                                                              0x1e
+#define HDP_MISC_CNTL__IDLE_HYSTERESIS_CNTL_MASK                                                              0x0000000CL
+#define HDP_MISC_CNTL__OUTSTANDING_WRITE_COUNT_1024_MASK                                                      0x00000020L
+#define HDP_MISC_CNTL__MMHUB_EARLY_WRACK_ENABLE_MASK                                                          0x00000100L
+#define HDP_MISC_CNTL__EARLY_WRACK_MISSING_PROTECT_ENABLE_MASK                                                0x00000200L
+#define HDP_MISC_CNTL__SIMULTANEOUS_READS_WRITES_MASK                                                         0x00000800L
+#define HDP_MISC_CNTL__READ_BUFFER_WATERMARK_MASK                                                             0x0000C000L
+#define HDP_MISC_CNTL__NACK_ENABLE_MASK                                                                       0x00080000L
+#define HDP_MISC_CNTL__ATOMIC_NACK_ENABLE_MASK                                                                0x00100000L
+#define HDP_MISC_CNTL__FED_ENABLE_MASK                                                                        0x00200000L
+#define HDP_MISC_CNTL__ATOMIC_FED_ENABLE_MASK                                                                 0x00400000L
+#define HDP_MISC_CNTL__SYSHUB_CHANNEL_PRIORITY_MASK                                                           0x00800000L
+#define HDP_MISC_CNTL__MMHUB_WRBURST_ENABLE_MASK                                                              0x01000000L
+#define HDP_MISC_CNTL__MMHUB_WRBURST_SIZE_MASK                                                                0x40000000L
+//HDP_MEM_POWER_CTRL
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_CTRL_EN__SHIFT                                                   0x0
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_LS_EN__SHIFT                                                     0x1
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_DS_EN__SHIFT                                                     0x2
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_SD_EN__SHIFT                                                     0x3
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_IDLE_HYSTERESIS__SHIFT                                                 0x4
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_UP_RECOVER_DELAY__SHIFT                                          0x8
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_DOWN_ENTER_DELAY__SHIFT                                          0xe
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_CTRL_EN__SHIFT                                                       0x10
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_LS_EN__SHIFT                                                         0x11
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_DS_EN__SHIFT                                                         0x12
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_SD_EN__SHIFT                                                         0x13
+#define HDP_MEM_POWER_CTRL__RC_MEM_IDLE_HYSTERESIS__SHIFT                                                     0x14
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_UP_RECOVER_DELAY__SHIFT                                              0x18
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_DOWN_ENTER_DELAY__SHIFT                                              0x1e
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_CTRL_EN_MASK                                                     0x00000001L
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_LS_EN_MASK                                                       0x00000002L
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_DS_EN_MASK                                                       0x00000004L
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_SD_EN_MASK                                                       0x00000008L
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_IDLE_HYSTERESIS_MASK                                                   0x00000070L
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_UP_RECOVER_DELAY_MASK                                            0x00003F00L
+#define HDP_MEM_POWER_CTRL__ATOMIC_MEM_POWER_DOWN_ENTER_DELAY_MASK                                            0x0000C000L
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_CTRL_EN_MASK                                                         0x00010000L
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_LS_EN_MASK                                                           0x00020000L
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_DS_EN_MASK                                                           0x00040000L
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_SD_EN_MASK                                                           0x00080000L
+#define HDP_MEM_POWER_CTRL__RC_MEM_IDLE_HYSTERESIS_MASK                                                       0x00700000L
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_UP_RECOVER_DELAY_MASK                                                0x3F000000L
+#define HDP_MEM_POWER_CTRL__RC_MEM_POWER_DOWN_ENTER_DELAY_MASK                                                0xC0000000L
+//HDP_MMHUB_CNTL
+#define HDP_MMHUB_CNTL__HDP_MMHUB_RO__SHIFT                                                                   0x0
+#define HDP_MMHUB_CNTL__HDP_MMHUB_GCC__SHIFT                                                                  0x1
+#define HDP_MMHUB_CNTL__HDP_MMHUB_SNOOP__SHIFT                                                                0x2
+#define HDP_MMHUB_CNTL__HDP_MMHUB_RO_MASK                                                                     0x00000001L
+#define HDP_MMHUB_CNTL__HDP_MMHUB_GCC_MASK                                                                    0x00000002L
+#define HDP_MMHUB_CNTL__HDP_MMHUB_SNOOP_MASK                                                                  0x00000004L
+//HDP_VERSION
+#define HDP_VERSION__MINVER__SHIFT                                                                            0x0
+#define HDP_VERSION__MAJVER__SHIFT                                                                            0x8
+#define HDP_VERSION__REV__SHIFT                                                                               0x10
+#define HDP_VERSION__MINVER_MASK                                                                              0x000000FFL
+#define HDP_VERSION__MAJVER_MASK                                                                              0x0000FF00L
+#define HDP_VERSION__REV_MASK                                                                                 0x00FF0000L
+//HDP_CLK_CNTL
+#define HDP_CLK_CNTL__REG_CLK_ENABLE_COUNT__SHIFT                                                             0x0
+#define HDP_CLK_CNTL__ATOMIC_MEM_CLK_SOFT_OVERRIDE__SHIFT                                                     0x1a
+#define HDP_CLK_CNTL__RC_MEM_CLK_SOFT_OVERRIDE__SHIFT                                                         0x1b
+#define HDP_CLK_CNTL__DBUS_CLK_SOFT_OVERRIDE__SHIFT                                                           0x1c
+#define HDP_CLK_CNTL__DYN_CLK_SOFT_OVERRIDE__SHIFT                                                            0x1d
+#define HDP_CLK_CNTL__XDP_REG_CLK_SOFT_OVERRIDE__SHIFT                                                        0x1e
+#define HDP_CLK_CNTL__HDP_REG_CLK_SOFT_OVERRIDE__SHIFT                                                        0x1f
+#define HDP_CLK_CNTL__REG_CLK_ENABLE_COUNT_MASK                                                               0x0000000FL
+#define HDP_CLK_CNTL__ATOMIC_MEM_CLK_SOFT_OVERRIDE_MASK                                                       0x04000000L
+#define HDP_CLK_CNTL__RC_MEM_CLK_SOFT_OVERRIDE_MASK                                                           0x08000000L
+#define HDP_CLK_CNTL__DBUS_CLK_SOFT_OVERRIDE_MASK                                                             0x10000000L
+#define HDP_CLK_CNTL__DYN_CLK_SOFT_OVERRIDE_MASK                                                              0x20000000L
+#define HDP_CLK_CNTL__XDP_REG_CLK_SOFT_OVERRIDE_MASK                                                          0x40000000L
+#define HDP_CLK_CNTL__HDP_REG_CLK_SOFT_OVERRIDE_MASK                                                          0x80000000L
+//HDP_MEMIO_CNTL
+#define HDP_MEMIO_CNTL__MEMIO_SEND__SHIFT                                                                     0x0
+#define HDP_MEMIO_CNTL__MEMIO_OP__SHIFT                                                                       0x1
+#define HDP_MEMIO_CNTL__MEMIO_BE__SHIFT                                                                       0x2
+#define HDP_MEMIO_CNTL__MEMIO_WR_STROBE__SHIFT                                                                0x6
+#define HDP_MEMIO_CNTL__MEMIO_RD_STROBE__SHIFT                                                                0x7
+#define HDP_MEMIO_CNTL__MEMIO_ADDR_UPPER__SHIFT                                                               0x8
+#define HDP_MEMIO_CNTL__MEMIO_CLR_WR_ERROR__SHIFT                                                             0xe
+#define HDP_MEMIO_CNTL__MEMIO_CLR_RD_ERROR__SHIFT                                                             0xf
+#define HDP_MEMIO_CNTL__MEMIO_VF__SHIFT                                                                       0x10
+#define HDP_MEMIO_CNTL__MEMIO_VFID__SHIFT                                                                     0x11
+#define HDP_MEMIO_CNTL__MEMIO_SEND_MASK                                                                       0x00000001L
+#define HDP_MEMIO_CNTL__MEMIO_OP_MASK                                                                         0x00000002L
+#define HDP_MEMIO_CNTL__MEMIO_BE_MASK                                                                         0x0000003CL
+#define HDP_MEMIO_CNTL__MEMIO_WR_STROBE_MASK                                                                  0x00000040L
+#define HDP_MEMIO_CNTL__MEMIO_RD_STROBE_MASK                                                                  0x00000080L
+#define HDP_MEMIO_CNTL__MEMIO_ADDR_UPPER_MASK                                                                 0x00003F00L
+#define HDP_MEMIO_CNTL__MEMIO_CLR_WR_ERROR_MASK                                                               0x00004000L
+#define HDP_MEMIO_CNTL__MEMIO_CLR_RD_ERROR_MASK                                                               0x00008000L
+#define HDP_MEMIO_CNTL__MEMIO_VF_MASK                                                                         0x00010000L
+#define HDP_MEMIO_CNTL__MEMIO_VFID_MASK                                                                       0x003E0000L
+//HDP_MEMIO_ADDR
+#define HDP_MEMIO_ADDR__MEMIO_ADDR_LOWER__SHIFT                                                               0x0
+#define HDP_MEMIO_ADDR__MEMIO_ADDR_LOWER_MASK                                                                 0xFFFFFFFFL
+//HDP_MEMIO_STATUS
+#define HDP_MEMIO_STATUS__MEMIO_WR_STATUS__SHIFT                                                              0x0
+#define HDP_MEMIO_STATUS__MEMIO_RD_STATUS__SHIFT                                                              0x1
+#define HDP_MEMIO_STATUS__MEMIO_WR_ERROR__SHIFT                                                               0x2
+#define HDP_MEMIO_STATUS__MEMIO_RD_ERROR__SHIFT                                                               0x3
+#define HDP_MEMIO_STATUS__MEMIO_WR_STATUS_MASK                                                                0x00000001L
+#define HDP_MEMIO_STATUS__MEMIO_RD_STATUS_MASK                                                                0x00000002L
+#define HDP_MEMIO_STATUS__MEMIO_WR_ERROR_MASK                                                                 0x00000004L
+#define HDP_MEMIO_STATUS__MEMIO_RD_ERROR_MASK                                                                 0x00000008L
+//HDP_MEMIO_WR_DATA
+#define HDP_MEMIO_WR_DATA__MEMIO_WR_DATA__SHIFT                                                               0x0
+#define HDP_MEMIO_WR_DATA__MEMIO_WR_DATA_MASK                                                                 0xFFFFFFFFL
+//HDP_MEMIO_RD_DATA
+#define HDP_MEMIO_RD_DATA__MEMIO_RD_DATA__SHIFT                                                               0x0
+#define HDP_MEMIO_RD_DATA__MEMIO_RD_DATA_MASK                                                                 0xFFFFFFFFL
+//HDP_XDP_DIRECT2HDP_FIRST
+#define HDP_XDP_DIRECT2HDP_FIRST__RESERVED__SHIFT                                                             0x0
+#define HDP_XDP_DIRECT2HDP_FIRST__RESERVED_MASK                                                               0xFFFFFFFFL
+//HDP_XDP_D2H_FLUSH
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_FLUSH_NUM__SHIFT                                                         0x0
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ENC_DATA__SHIFT                                                      0x4
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ADDR_SEL__SHIFT                                                      0x8
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_XPB_CLG__SHIFT                                                           0xb
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_HOST__SHIFT                                                         0x10
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_ALTER_FLUSH_NUM__SHIFT                                                   0x12
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_0__SHIFT                                                            0x13
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_1__SHIFT                                                            0x14
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_FLUSH_NUM_MASK                                                           0x0000000FL
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ENC_DATA_MASK                                                        0x000000F0L
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ADDR_SEL_MASK                                                        0x00000700L
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_XPB_CLG_MASK                                                             0x0000F800L
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_HOST_MASK                                                           0x00010000L
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_ALTER_FLUSH_NUM_MASK                                                     0x00040000L
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_0_MASK                                                              0x00080000L
+#define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_1_MASK                                                              0x00100000L
+//HDP_XDP_D2H_BAR_UPDATE
+#define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_ADDR__SHIFT                                                    0x0
+#define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_FLUSH_NUM__SHIFT                                               0x10
+#define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_BAR_NUM__SHIFT                                                 0x14
+#define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_ADDR_MASK                                                      0x0000FFFFL
+#define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_FLUSH_NUM_MASK                                                 0x000F0000L
+#define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_BAR_NUM_MASK                                                   0x00700000L
+//HDP_XDP_D2H_RSVD_3
+#define HDP_XDP_D2H_RSVD_3__RESERVED__SHIFT                                                                   0x0
+#define HDP_XDP_D2H_RSVD_3__RESERVED_MASK                                                                     0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_4
+#define HDP_XDP_D2H_RSVD_4__RESERVED__SHIFT                                                                   0x0
+#define HDP_XDP_D2H_RSVD_4__RESERVED_MASK                                                                     0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_5
+#define HDP_XDP_D2H_RSVD_5__RESERVED__SHIFT                                                                   0x0
+#define HDP_XDP_D2H_RSVD_5__RESERVED_MASK                                                                     0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_6
+#define HDP_XDP_D2H_RSVD_6__RESERVED__SHIFT                                                                   0x0
+#define HDP_XDP_D2H_RSVD_6__RESERVED_MASK                                                                     0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_7
+#define HDP_XDP_D2H_RSVD_7__RESERVED__SHIFT                                                                   0x0
+#define HDP_XDP_D2H_RSVD_7__RESERVED_MASK                                                                     0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_8
+#define HDP_XDP_D2H_RSVD_8__RESERVED__SHIFT                                                                   0x0
+#define HDP_XDP_D2H_RSVD_8__RESERVED_MASK                                                                     0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_9
+#define HDP_XDP_D2H_RSVD_9__RESERVED__SHIFT                                                                   0x0
+#define HDP_XDP_D2H_RSVD_9__RESERVED_MASK                                                                     0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_10
+#define HDP_XDP_D2H_RSVD_10__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_10__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_11
+#define HDP_XDP_D2H_RSVD_11__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_11__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_12
+#define HDP_XDP_D2H_RSVD_12__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_12__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_13
+#define HDP_XDP_D2H_RSVD_13__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_13__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_14
+#define HDP_XDP_D2H_RSVD_14__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_14__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_15
+#define HDP_XDP_D2H_RSVD_15__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_15__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_16
+#define HDP_XDP_D2H_RSVD_16__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_16__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_17
+#define HDP_XDP_D2H_RSVD_17__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_17__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_18
+#define HDP_XDP_D2H_RSVD_18__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_18__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_19
+#define HDP_XDP_D2H_RSVD_19__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_19__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_20
+#define HDP_XDP_D2H_RSVD_20__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_20__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_21
+#define HDP_XDP_D2H_RSVD_21__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_21__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_22
+#define HDP_XDP_D2H_RSVD_22__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_22__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_23
+#define HDP_XDP_D2H_RSVD_23__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_23__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_24
+#define HDP_XDP_D2H_RSVD_24__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_24__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_25
+#define HDP_XDP_D2H_RSVD_25__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_25__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_26
+#define HDP_XDP_D2H_RSVD_26__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_26__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_27
+#define HDP_XDP_D2H_RSVD_27__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_27__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_28
+#define HDP_XDP_D2H_RSVD_28__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_28__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_29
+#define HDP_XDP_D2H_RSVD_29__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_29__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_30
+#define HDP_XDP_D2H_RSVD_30__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_30__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_31
+#define HDP_XDP_D2H_RSVD_31__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_31__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_32
+#define HDP_XDP_D2H_RSVD_32__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_32__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_33
+#define HDP_XDP_D2H_RSVD_33__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_33__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_D2H_RSVD_34
+#define HDP_XDP_D2H_RSVD_34__RESERVED__SHIFT                                                                  0x0
+#define HDP_XDP_D2H_RSVD_34__RESERVED_MASK                                                                    0xFFFFFFFFL
+//HDP_XDP_DIRECT2HDP_LAST
+#define HDP_XDP_DIRECT2HDP_LAST__RESERVED__SHIFT                                                              0x0
+#define HDP_XDP_DIRECT2HDP_LAST__RESERVED_MASK                                                                0xFFFFFFFFL
+//HDP_XDP_P2P_BAR_CFG
+#define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_ADDR_SIZE__SHIFT                                                     0x0
+#define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_BAR_FROM__SHIFT                                                      0x4
+#define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_ADDR_SIZE_MASK                                                       0x0000000FL
+#define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_BAR_FROM_MASK                                                        0x00000030L
+//HDP_XDP_P2P_MBX_OFFSET
+#define HDP_XDP_P2P_MBX_OFFSET__P2P_MBX_OFFSET__SHIFT                                                         0x0
+#define HDP_XDP_P2P_MBX_OFFSET__P2P_MBX_OFFSET_MASK                                                           0x0001FFFFL
+//HDP_XDP_P2P_MBX_ADDR0
+#define HDP_XDP_P2P_MBX_ADDR0__VALID__SHIFT                                                                   0x0
+#define HDP_XDP_P2P_MBX_ADDR0__ADDR_35_19__SHIFT                                                              0x3
+#define HDP_XDP_P2P_MBX_ADDR0__ADDR_39_36__SHIFT                                                              0x14
+#define HDP_XDP_P2P_MBX_ADDR0__ADDR_47_40__SHIFT                                                              0x18
+#define HDP_XDP_P2P_MBX_ADDR0__VALID_MASK                                                                     0x00000001L
+#define HDP_XDP_P2P_MBX_ADDR0__ADDR_35_19_MASK                                                                0x000FFFF8L
+#define HDP_XDP_P2P_MBX_ADDR0__ADDR_39_36_MASK                                                                0x00F00000L
+#define HDP_XDP_P2P_MBX_ADDR0__ADDR_47_40_MASK                                                                0xFF000000L
+//HDP_XDP_P2P_MBX_ADDR1
+#define HDP_XDP_P2P_MBX_ADDR1__VALID__SHIFT                                                                   0x0
+#define HDP_XDP_P2P_MBX_ADDR1__ADDR_35_19__SHIFT                                                              0x3
+#define HDP_XDP_P2P_MBX_ADDR1__ADDR_39_36__SHIFT                                                              0x14
+#define HDP_XDP_P2P_MBX_ADDR1__ADDR_47_40__SHIFT                                                              0x18
+#define HDP_XDP_P2P_MBX_ADDR1__VALID_MASK                                                                     0x00000001L
+#define HDP_XDP_P2P_MBX_ADDR1__ADDR_35_19_MASK                                                                0x000FFFF8L
+#define HDP_XDP_P2P_MBX_ADDR1__ADDR_39_36_MASK                                                                0x00F00000L
+#define HDP_XDP_P2P_MBX_ADDR1__ADDR_47_40_MASK                                                                0xFF000000L
+//HDP_XDP_P2P_MBX_ADDR2
+#define HDP_XDP_P2P_MBX_ADDR2__VALID__SHIFT                                                                   0x0
+#define HDP_XDP_P2P_MBX_ADDR2__ADDR_35_19__SHIFT                                                              0x3
+#define HDP_XDP_P2P_MBX_ADDR2__ADDR_39_36__SHIFT                                                              0x14
+#define HDP_XDP_P2P_MBX_ADDR2__ADDR_47_40__SHIFT                                                              0x18
+#define HDP_XDP_P2P_MBX_ADDR2__VALID_MASK                                                                     0x00000001L
+#define HDP_XDP_P2P_MBX_ADDR2__ADDR_35_19_MASK                                                                0x000FFFF8L
+#define HDP_XDP_P2P_MBX_ADDR2__ADDR_39_36_MASK                                                                0x00F00000L
+#define HDP_XDP_P2P_MBX_ADDR2__ADDR_47_40_MASK                                                                0xFF000000L
+//HDP_XDP_P2P_MBX_ADDR3
+#define HDP_XDP_P2P_MBX_ADDR3__VALID__SHIFT                                                                   0x0
+#define HDP_XDP_P2P_MBX_ADDR3__ADDR_35_19__SHIFT                                                              0x3
+#define HDP_XDP_P2P_MBX_ADDR3__ADDR_39_36__SHIFT                                                              0x14
+#define HDP_XDP_P2P_MBX_ADDR3__ADDR_47_40__SHIFT                                                              0x18
+#define HDP_XDP_P2P_MBX_ADDR3__VALID_MASK                                                                     0x00000001L
+#define HDP_XDP_P2P_MBX_ADDR3__ADDR_35_19_MASK                                                                0x000FFFF8L
+#define HDP_XDP_P2P_MBX_ADDR3__ADDR_39_36_MASK                                                                0x00F00000L
+#define HDP_XDP_P2P_MBX_ADDR3__ADDR_47_40_MASK                                                                0xFF000000L
+//HDP_XDP_P2P_MBX_ADDR4
+#define HDP_XDP_P2P_MBX_ADDR4__VALID__SHIFT                                                                   0x0
+#define HDP_XDP_P2P_MBX_ADDR4__ADDR_35_19__SHIFT                                                              0x3
+#define HDP_XDP_P2P_MBX_ADDR4__ADDR_39_36__SHIFT                                                              0x14
+#define HDP_XDP_P2P_MBX_ADDR4__ADDR_47_40__SHIFT                                                              0x18
+#define HDP_XDP_P2P_MBX_ADDR4__VALID_MASK                                                                     0x00000001L
+#define HDP_XDP_P2P_MBX_ADDR4__ADDR_35_19_MASK                                                                0x000FFFF8L
+#define HDP_XDP_P2P_MBX_ADDR4__ADDR_39_36_MASK                                                                0x00F00000L
+#define HDP_XDP_P2P_MBX_ADDR4__ADDR_47_40_MASK                                                                0xFF000000L
+//HDP_XDP_P2P_MBX_ADDR5
+#define HDP_XDP_P2P_MBX_ADDR5__VALID__SHIFT                                                                   0x0
+#define HDP_XDP_P2P_MBX_ADDR5__ADDR_35_19__SHIFT                                                              0x3
+#define HDP_XDP_P2P_MBX_ADDR5__ADDR_39_36__SHIFT                                                              0x14
+#define HDP_XDP_P2P_MBX_ADDR5__ADDR_47_40__SHIFT                                                              0x18
+#define HDP_XDP_P2P_MBX_ADDR5__VALID_MASK                                                                     0x00000001L
+#define HDP_XDP_P2P_MBX_ADDR5__ADDR_35_19_MASK                                                                0x000FFFF8L
+#define HDP_XDP_P2P_MBX_ADDR5__ADDR_39_36_MASK                                                                0x00F00000L
+#define HDP_XDP_P2P_MBX_ADDR5__ADDR_47_40_MASK                                                                0xFF000000L
+//HDP_XDP_P2P_MBX_ADDR6
+#define HDP_XDP_P2P_MBX_ADDR6__VALID__SHIFT                                                                   0x0
+#define HDP_XDP_P2P_MBX_ADDR6__ADDR_35_19__SHIFT                                                              0x3
+#define HDP_XDP_P2P_MBX_ADDR6__ADDR_39_36__SHIFT                                                              0x14
+#define HDP_XDP_P2P_MBX_ADDR6__ADDR_47_40__SHIFT                                                              0x18
+#define HDP_XDP_P2P_MBX_ADDR6__VALID_MASK                                                                     0x00000001L
+#define HDP_XDP_P2P_MBX_ADDR6__ADDR_35_19_MASK                                                                0x000FFFF8L
+#define HDP_XDP_P2P_MBX_ADDR6__ADDR_39_36_MASK                                                                0x00F00000L
+#define HDP_XDP_P2P_MBX_ADDR6__ADDR_47_40_MASK                                                                0xFF000000L
+//HDP_XDP_HDP_MBX_MC_CFG
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_QOS__SHIFT                                           0x0
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_SWAP__SHIFT                                          0x4
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_VMID__SHIFT                                          0x8
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_RO__SHIFT                                            0xc
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_GCC__SHIFT                                           0xd
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_SNOOP__SHIFT                                         0xe
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_QOS_MASK                                             0x0000000FL
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_SWAP_MASK                                            0x00000030L
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_VMID_MASK                                            0x00000F00L
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_RO_MASK                                              0x00001000L
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_GCC_MASK                                             0x00002000L
+#define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_SNOOP_MASK                                           0x00004000L
+//HDP_XDP_HDP_MC_CFG
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_SNOOP__SHIFT                                               0x3
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_SWAP__SHIFT                                                0x4
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_VMID__SHIFT                                                0x8
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_RO__SHIFT                                                  0xc
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_GCC__SHIFT                                                 0xd
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XDP_HIGHER_PRI_THRESH__SHIFT                                           0xe
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_SNOOP_MASK                                                 0x00000008L
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_SWAP_MASK                                                  0x00000030L
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_VMID_MASK                                                  0x00000F00L
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_RO_MASK                                                    0x00001000L
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_REQ_GCC_MASK                                                   0x00002000L
+#define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XDP_HIGHER_PRI_THRESH_MASK                                             0x000FC000L
+//HDP_XDP_HST_CFG
+#define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_EN__SHIFT                                                         0x0
+#define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_TIMER__SHIFT                                                      0x1
+#define HDP_XDP_HST_CFG__HST_CFG_WR_BURST_EN__SHIFT                                                           0x3
+#define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_64B_EN__SHIFT                                                     0x4
+#define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_TIMER_PRELOAD_CFG__SHIFT                                          0x5
+#define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_EN_MASK                                                           0x00000001L
+#define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_TIMER_MASK                                                        0x00000006L
+#define HDP_XDP_HST_CFG__HST_CFG_WR_BURST_EN_MASK                                                             0x00000008L
+#define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_64B_EN_MASK                                                       0x00000010L
+#define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_TIMER_PRELOAD_CFG_MASK                                            0x00000020L
+//HDP_XDP_HDP_IPH_CFG
+#define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_INVERSE_PEER_TAG_MATCHING__SHIFT                                     0xc
+#define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_P2P_RD_EN__SHIFT                                                     0xd
+#define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_INVERSE_PEER_TAG_MATCHING_MASK                                       0x00001000L
+#define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_P2P_RD_EN_MASK                                                       0x00002000L
+//HDP_XDP_P2P_BAR0
+#define HDP_XDP_P2P_BAR0__ADDR__SHIFT                                                                         0x0
+#define HDP_XDP_P2P_BAR0__FLUSH__SHIFT                                                                        0x10
+#define HDP_XDP_P2P_BAR0__VALID__SHIFT                                                                        0x14
+#define HDP_XDP_P2P_BAR0__ADDR_MASK                                                                           0x0000FFFFL
+#define HDP_XDP_P2P_BAR0__FLUSH_MASK                                                                          0x000F0000L
+#define HDP_XDP_P2P_BAR0__VALID_MASK                                                                          0x00100000L
+//HDP_XDP_P2P_BAR1
+#define HDP_XDP_P2P_BAR1__ADDR__SHIFT                                                                         0x0
+#define HDP_XDP_P2P_BAR1__FLUSH__SHIFT                                                                        0x10
+#define HDP_XDP_P2P_BAR1__VALID__SHIFT                                                                        0x14
+#define HDP_XDP_P2P_BAR1__ADDR_MASK                                                                           0x0000FFFFL
+#define HDP_XDP_P2P_BAR1__FLUSH_MASK                                                                          0x000F0000L
+#define HDP_XDP_P2P_BAR1__VALID_MASK                                                                          0x00100000L
+//HDP_XDP_P2P_BAR2
+#define HDP_XDP_P2P_BAR2__ADDR__SHIFT                                                                         0x0
+#define HDP_XDP_P2P_BAR2__FLUSH__SHIFT                                                                        0x10
+#define HDP_XDP_P2P_BAR2__VALID__SHIFT                                                                        0x14
+#define HDP_XDP_P2P_BAR2__ADDR_MASK                                                                           0x0000FFFFL
+#define HDP_XDP_P2P_BAR2__FLUSH_MASK                                                                          0x000F0000L
+#define HDP_XDP_P2P_BAR2__VALID_MASK                                                                          0x00100000L
+//HDP_XDP_P2P_BAR3
+#define HDP_XDP_P2P_BAR3__ADDR__SHIFT                                                                         0x0
+#define HDP_XDP_P2P_BAR3__FLUSH__SHIFT                                                                        0x10
+#define HDP_XDP_P2P_BAR3__VALID__SHIFT                                                                        0x14
+#define HDP_XDP_P2P_BAR3__ADDR_MASK                                                                           0x0000FFFFL
+#define HDP_XDP_P2P_BAR3__FLUSH_MASK                                                                          0x000F0000L
+#define HDP_XDP_P2P_BAR3__VALID_MASK                                                                          0x00100000L
+//HDP_XDP_P2P_BAR4
+#define HDP_XDP_P2P_BAR4__ADDR__SHIFT                                                                         0x0
+#define HDP_XDP_P2P_BAR4__FLUSH__SHIFT                                                                        0x10
+#define HDP_XDP_P2P_BAR4__VALID__SHIFT                                                                        0x14
+#define HDP_XDP_P2P_BAR4__ADDR_MASK                                                                           0x0000FFFFL
+#define HDP_XDP_P2P_BAR4__FLUSH_MASK                                                                          0x000F0000L
+#define HDP_XDP_P2P_BAR4__VALID_MASK                                                                          0x00100000L
+//HDP_XDP_P2P_BAR5
+#define HDP_XDP_P2P_BAR5__ADDR__SHIFT                                                                         0x0
+#define HDP_XDP_P2P_BAR5__FLUSH__SHIFT                                                                        0x10
+#define HDP_XDP_P2P_BAR5__VALID__SHIFT                                                                        0x14
+#define HDP_XDP_P2P_BAR5__ADDR_MASK                                                                           0x0000FFFFL
+#define HDP_XDP_P2P_BAR5__FLUSH_MASK                                                                          0x000F0000L
+#define HDP_XDP_P2P_BAR5__VALID_MASK                                                                          0x00100000L
+//HDP_XDP_P2P_BAR6
+#define HDP_XDP_P2P_BAR6__ADDR__SHIFT                                                                         0x0
+#define HDP_XDP_P2P_BAR6__FLUSH__SHIFT                                                                        0x10
+#define HDP_XDP_P2P_BAR6__VALID__SHIFT                                                                        0x14
+#define HDP_XDP_P2P_BAR6__ADDR_MASK                                                                           0x0000FFFFL
+#define HDP_XDP_P2P_BAR6__FLUSH_MASK                                                                          0x000F0000L
+#define HDP_XDP_P2P_BAR6__VALID_MASK                                                                          0x00100000L
+//HDP_XDP_P2P_BAR7
+#define HDP_XDP_P2P_BAR7__ADDR__SHIFT                                                                         0x0
+#define HDP_XDP_P2P_BAR7__FLUSH__SHIFT                                                                        0x10
+#define HDP_XDP_P2P_BAR7__VALID__SHIFT                                                                        0x14
+#define HDP_XDP_P2P_BAR7__ADDR_MASK                                                                           0x0000FFFFL
+#define HDP_XDP_P2P_BAR7__FLUSH_MASK                                                                          0x000F0000L
+#define HDP_XDP_P2P_BAR7__VALID_MASK                                                                          0x00100000L
+//HDP_XDP_FLUSH_ARMED_STS
+#define HDP_XDP_FLUSH_ARMED_STS__FLUSH_ARMED_STS__SHIFT                                                       0x0
+#define HDP_XDP_FLUSH_ARMED_STS__FLUSH_ARMED_STS_MASK                                                         0xFFFFFFFFL
+//HDP_XDP_FLUSH_CNTR0_STS
+#define HDP_XDP_FLUSH_CNTR0_STS__FLUSH_CNTR0_STS__SHIFT                                                       0x0
+#define HDP_XDP_FLUSH_CNTR0_STS__FLUSH_CNTR0_STS_MASK                                                         0x03FFFFFFL
+//HDP_XDP_BUSY_STS
+#define HDP_XDP_BUSY_STS__BUSY_BITS_0__SHIFT                                                                  0x0
+#define HDP_XDP_BUSY_STS__BUSY_BITS_1__SHIFT                                                                  0x1
+#define HDP_XDP_BUSY_STS__BUSY_BITS_2__SHIFT                                                                  0x2
+#define HDP_XDP_BUSY_STS__BUSY_BITS_3__SHIFT                                                                  0x3
+#define HDP_XDP_BUSY_STS__BUSY_BITS_4__SHIFT                                                                  0x4
+#define HDP_XDP_BUSY_STS__BUSY_BITS_5__SHIFT                                                                  0x5
+#define HDP_XDP_BUSY_STS__BUSY_BITS_6__SHIFT                                                                  0x6
+#define HDP_XDP_BUSY_STS__BUSY_BITS_7__SHIFT                                                                  0x7
+#define HDP_XDP_BUSY_STS__BUSY_BITS_8__SHIFT                                                                  0x8
+#define HDP_XDP_BUSY_STS__BUSY_BITS_9__SHIFT                                                                  0x9
+#define HDP_XDP_BUSY_STS__BUSY_BITS_10__SHIFT                                                                 0xa
+#define HDP_XDP_BUSY_STS__BUSY_BITS_11__SHIFT                                                                 0xb
+#define HDP_XDP_BUSY_STS__BUSY_BITS_12__SHIFT                                                                 0xc
+#define HDP_XDP_BUSY_STS__BUSY_BITS_13__SHIFT                                                                 0xd
+#define HDP_XDP_BUSY_STS__BUSY_BITS_14__SHIFT                                                                 0xe
+#define HDP_XDP_BUSY_STS__BUSY_BITS_15__SHIFT                                                                 0xf
+#define HDP_XDP_BUSY_STS__BUSY_BITS_16__SHIFT                                                                 0x10
+#define HDP_XDP_BUSY_STS__BUSY_BITS_17__SHIFT                                                                 0x11
+#define HDP_XDP_BUSY_STS__BUSY_BITS_18__SHIFT                                                                 0x12
+#define HDP_XDP_BUSY_STS__BUSY_BITS_19__SHIFT                                                                 0x13
+#define HDP_XDP_BUSY_STS__BUSY_BITS_20__SHIFT                                                                 0x14
+#define HDP_XDP_BUSY_STS__BUSY_BITS_21__SHIFT                                                                 0x15
+#define HDP_XDP_BUSY_STS__BUSY_BITS_22__SHIFT                                                                 0x16
+#define HDP_XDP_BUSY_STS__BUSY_BITS_23__SHIFT                                                                 0x17
+#define HDP_XDP_BUSY_STS__Z_FENCE_BIT__SHIFT                                                                  0x18
+#define HDP_XDP_BUSY_STS__BUSY_BITS_0_MASK                                                                    0x00000001L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_1_MASK                                                                    0x00000002L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_2_MASK                                                                    0x00000004L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_3_MASK                                                                    0x00000008L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_4_MASK                                                                    0x00000010L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_5_MASK                                                                    0x00000020L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_6_MASK                                                                    0x00000040L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_7_MASK                                                                    0x00000080L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_8_MASK                                                                    0x00000100L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_9_MASK                                                                    0x00000200L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_10_MASK                                                                   0x00000400L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_11_MASK                                                                   0x00000800L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_12_MASK                                                                   0x00001000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_13_MASK                                                                   0x00002000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_14_MASK                                                                   0x00004000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_15_MASK                                                                   0x00008000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_16_MASK                                                                   0x00010000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_17_MASK                                                                   0x00020000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_18_MASK                                                                   0x00040000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_19_MASK                                                                   0x00080000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_20_MASK                                                                   0x00100000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_21_MASK                                                                   0x00200000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_22_MASK                                                                   0x00400000L
+#define HDP_XDP_BUSY_STS__BUSY_BITS_23_MASK                                                                   0x00800000L
+#define HDP_XDP_BUSY_STS__Z_FENCE_BIT_MASK                                                                    0x01000000L
+//HDP_XDP_STICKY
+#define HDP_XDP_STICKY__STICKY_STS__SHIFT                                                                     0x0
+#define HDP_XDP_STICKY__STICKY_W1C__SHIFT                                                                     0x10
+#define HDP_XDP_STICKY__STICKY_STS_MASK                                                                       0x0000FFFFL
+#define HDP_XDP_STICKY__STICKY_W1C_MASK                                                                       0xFFFF0000L
+//HDP_XDP_CHKN
+#define HDP_XDP_CHKN__CHKN_0_RSVD__SHIFT                                                                      0x0
+#define HDP_XDP_CHKN__CHKN_1_RSVD__SHIFT                                                                      0x8
+#define HDP_XDP_CHKN__CHKN_2_RSVD__SHIFT                                                                      0x10
+#define HDP_XDP_CHKN__CHKN_3_RSVD__SHIFT                                                                      0x18
+#define HDP_XDP_CHKN__CHKN_0_RSVD_MASK                                                                        0x000000FFL
+#define HDP_XDP_CHKN__CHKN_1_RSVD_MASK                                                                        0x0000FF00L
+#define HDP_XDP_CHKN__CHKN_2_RSVD_MASK                                                                        0x00FF0000L
+#define HDP_XDP_CHKN__CHKN_3_RSVD_MASK                                                                        0xFF000000L
+//HDP_XDP_BARS_ADDR_39_36
+#define HDP_XDP_BARS_ADDR_39_36__BAR0_ADDR_39_36__SHIFT                                                       0x0
+#define HDP_XDP_BARS_ADDR_39_36__BAR1_ADDR_39_36__SHIFT                                                       0x4
+#define HDP_XDP_BARS_ADDR_39_36__BAR2_ADDR_39_36__SHIFT                                                       0x8
+#define HDP_XDP_BARS_ADDR_39_36__BAR3_ADDR_39_36__SHIFT                                                       0xc
+#define HDP_XDP_BARS_ADDR_39_36__BAR4_ADDR_39_36__SHIFT                                                       0x10
+#define HDP_XDP_BARS_ADDR_39_36__BAR5_ADDR_39_36__SHIFT                                                       0x14
+#define HDP_XDP_BARS_ADDR_39_36__BAR6_ADDR_39_36__SHIFT                                                       0x18
+#define HDP_XDP_BARS_ADDR_39_36__BAR7_ADDR_39_36__SHIFT                                                       0x1c
+#define HDP_XDP_BARS_ADDR_39_36__BAR0_ADDR_39_36_MASK                                                         0x0000000FL
+#define HDP_XDP_BARS_ADDR_39_36__BAR1_ADDR_39_36_MASK                                                         0x000000F0L
+#define HDP_XDP_BARS_ADDR_39_36__BAR2_ADDR_39_36_MASK                                                         0x00000F00L
+#define HDP_XDP_BARS_ADDR_39_36__BAR3_ADDR_39_36_MASK                                                         0x0000F000L
+#define HDP_XDP_BARS_ADDR_39_36__BAR4_ADDR_39_36_MASK                                                         0x000F0000L
+#define HDP_XDP_BARS_ADDR_39_36__BAR5_ADDR_39_36_MASK                                                         0x00F00000L
+#define HDP_XDP_BARS_ADDR_39_36__BAR6_ADDR_39_36_MASK                                                         0x0F000000L
+#define HDP_XDP_BARS_ADDR_39_36__BAR7_ADDR_39_36_MASK                                                         0xF0000000L
+//HDP_XDP_MC_VM_FB_LOCATION_BASE
+#define HDP_XDP_MC_VM_FB_LOCATION_BASE__FB_BASE__SHIFT                                                        0x0
+#define HDP_XDP_MC_VM_FB_LOCATION_BASE__FB_BASE_MASK                                                          0x03FFFFFFL
+//HDP_XDP_GPU_IOV_VIOLATION_LOG
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__VIOLATION_STATUS__SHIFT                                                0x0
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__MULTIPLE_VIOLATION_STATUS__SHIFT                                       0x1
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__ADDRESS__SHIFT                                                         0x2
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__OPCODE__SHIFT                                                          0x12
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__VF__SHIFT                                                              0x13
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__VFID__SHIFT                                                            0x14
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__VIOLATION_STATUS_MASK                                                  0x00000001L
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__MULTIPLE_VIOLATION_STATUS_MASK                                         0x00000002L
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__ADDRESS_MASK                                                           0x0003FFFCL
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__OPCODE_MASK                                                            0x00040000L
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__VF_MASK                                                                0x00080000L
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG__VFID_MASK                                                              0x00F00000L
+//HDP_XDP_GPU_IOV_VIOLATION_LOG2
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG2__INITIATOR_ID__SHIFT                                                   0x0
+#define HDP_XDP_GPU_IOV_VIOLATION_LOG2__INITIATOR_ID_MASK                                                     0x000003FFL
+//HDP_XDP_MMHUB_ERROR
+#define HDP_XDP_MMHUB_ERROR__HDP_BRESP_01__SHIFT                                                              0x1
+#define HDP_XDP_MMHUB_ERROR__HDP_BRESP_10__SHIFT                                                              0x2
+#define HDP_XDP_MMHUB_ERROR__HDP_BRESP_11__SHIFT                                                              0x3
+#define HDP_XDP_MMHUB_ERROR__HDP_BUSER_FED__SHIFT                                                             0x4
+#define HDP_XDP_MMHUB_ERROR__HDP_BUSER_NACK_01__SHIFT                                                         0x5
+#define HDP_XDP_MMHUB_ERROR__HDP_BUSER_NACK_10__SHIFT                                                         0x6
+#define HDP_XDP_MMHUB_ERROR__HDP_BUSER_NACK_11__SHIFT                                                         0x7
+#define HDP_XDP_MMHUB_ERROR__HDP_RRESP_01__SHIFT                                                              0x9
+#define HDP_XDP_MMHUB_ERROR__HDP_RRESP_10__SHIFT                                                              0xa
+#define HDP_XDP_MMHUB_ERROR__HDP_RRESP_11__SHIFT                                                              0xb
+#define HDP_XDP_MMHUB_ERROR__HDP_RUSER_FED__SHIFT                                                             0xc
+#define HDP_XDP_MMHUB_ERROR__HDP_RUSER_NACK_01__SHIFT                                                         0xd
+#define HDP_XDP_MMHUB_ERROR__HDP_RUSER_NACK_10__SHIFT                                                         0xe
+#define HDP_XDP_MMHUB_ERROR__HDP_RUSER_NACK_11__SHIFT                                                         0xf
+#define HDP_XDP_MMHUB_ERROR__XDP_BRESP_01__SHIFT                                                              0x11
+#define HDP_XDP_MMHUB_ERROR__XDP_BRESP_10__SHIFT                                                              0x12
+#define HDP_XDP_MMHUB_ERROR__XDP_BRESP_11__SHIFT                                                              0x13
+#define HDP_XDP_MMHUB_ERROR__XDP_BUSER_NACK_01__SHIFT                                                         0x15
+#define HDP_XDP_MMHUB_ERROR__XDP_BUSER_NACK_10__SHIFT                                                         0x16
+#define HDP_XDP_MMHUB_ERROR__XDP_BUSER_NACK_11__SHIFT                                                         0x17
+#define HDP_XDP_MMHUB_ERROR__HDP_BRESP_01_MASK                                                                0x00000002L
+#define HDP_XDP_MMHUB_ERROR__HDP_BRESP_10_MASK                                                                0x00000004L
+#define HDP_XDP_MMHUB_ERROR__HDP_BRESP_11_MASK                                                                0x00000008L
+#define HDP_XDP_MMHUB_ERROR__HDP_BUSER_FED_MASK                                                               0x00000010L
+#define HDP_XDP_MMHUB_ERROR__HDP_BUSER_NACK_01_MASK                                                           0x00000020L
+#define HDP_XDP_MMHUB_ERROR__HDP_BUSER_NACK_10_MASK                                                           0x00000040L
+#define HDP_XDP_MMHUB_ERROR__HDP_BUSER_NACK_11_MASK                                                           0x00000080L
+#define HDP_XDP_MMHUB_ERROR__HDP_RRESP_01_MASK                                                                0x00000200L
+#define HDP_XDP_MMHUB_ERROR__HDP_RRESP_10_MASK                                                                0x00000400L
+#define HDP_XDP_MMHUB_ERROR__HDP_RRESP_11_MASK                                                                0x00000800L
+#define HDP_XDP_MMHUB_ERROR__HDP_RUSER_FED_MASK                                                               0x00001000L
+#define HDP_XDP_MMHUB_ERROR__HDP_RUSER_NACK_01_MASK                                                           0x00002000L
+#define HDP_XDP_MMHUB_ERROR__HDP_RUSER_NACK_10_MASK                                                           0x00004000L
+#define HDP_XDP_MMHUB_ERROR__HDP_RUSER_NACK_11_MASK                                                           0x00008000L
+#define HDP_XDP_MMHUB_ERROR__XDP_BRESP_01_MASK                                                                0x00020000L
+#define HDP_XDP_MMHUB_ERROR__XDP_BRESP_10_MASK                                                                0x00040000L
+#define HDP_XDP_MMHUB_ERROR__XDP_BRESP_11_MASK                                                                0x00080000L
+#define HDP_XDP_MMHUB_ERROR__XDP_BUSER_NACK_01_MASK                                                           0x00200000L
+#define HDP_XDP_MMHUB_ERROR__XDP_BUSER_NACK_10_MASK                                                           0x00400000L
+#define HDP_XDP_MMHUB_ERROR__XDP_BUSER_NACK_11_MASK                                                           0x00800000L
+
+#endif
-- 
2.35.1

